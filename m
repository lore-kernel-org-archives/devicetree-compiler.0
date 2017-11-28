From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [RFC PATCH 1/2] Preserve datatype information when parsing dts
Date: Tue, 28 Nov 2017 11:57:09 +0000
Message-ID: <20171128115710.9267-2-grant.likely@arm.com>
References: <20171128115710.9267-1-grant.likely@arm.com>
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=secretlab-ca.20150623.gappssmtp.com; s=20150623;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=IsmmAsqmYND/cMdBL5UM2W+wA6HAuLvc05Eo47PTais=;
        b=WE4bKXw2IfUaMaJ7l+0c3zLGDzB8g8MyhYNRLw3RX+VvJG5Kov9/wqzevwpj7JCNtZ
         uv6tkNMf/dnmvYlhWhkgy+xoYKgzvZzxRi7aL+e8CN+V5OeO9mQV/RwONIfcaQHILqms
         d54gzN1w3B/+zg84NDzXVKxfnCgwgqmbtBHEkUJTTviXwhQEg+31T/vtZfDTeV0V6E8B
         uje4DDYIGc1si368eZPNCjKi+bS+/2sOdLbRvQt3jo/EbQ9YML6FgN/ZodbtynsvYN0k
         pXRgERJXIuJtizaNyXubA5F5anAV4thqz9hEIoXp3xc7vOPnjfPIy7x/sFwuo23voGNG
         stqQ==
In-Reply-To: <20171128115710.9267-1-grant.likely-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org, david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>

The current code throws away all the data type and grouping information
when parsing the DTS source file, which makes it difficult to
reconstruct the data format when emitting a format that can express data
types (ie. dts and yaml). Use the marker list to mark the beginning and
end of each integer array block (<> and []), the datatype contained in
each (8, 16, 32 & 64 bit widths), and the start of each string.

At the same time, factor out the heuristic code used to guess a property
type at emit time. It is a pretty well defined standalone block that
could be used elsewhere, for instance, when emitting YAML source. Factor
it out into a separate function so that it can be reused, and also to
simplify the write_propval() function.

When emitting, group integer output back into the same groups as the
original source and use the REF_PATH and REF_PHANDLE markers to emit the
the node reference instead of a raw path or phandle.

Signed-off-by: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>
---
 data.c       |   4 +-
 dtc-parser.y |  21 +++--
 dtc.h        |   9 +++
 livetree.c   |  49 ++++++++++++
 treesource.c | 249 ++++++++++++++++++++++++++++++++---------------------------
 5 files changed, 212 insertions(+), 120 deletions(-)

diff --git a/data.c b/data.c
index aa37a16..0aef0b5 100644
--- a/data.c
+++ b/data.c
@@ -74,7 +74,8 @@ struct data data_copy_escape_string(const char *s, int len)
 	struct data d;
 	char *q;
 
-	d = data_grow_for(empty_data, len + 1);
+	d = data_add_marker(empty_data, MARKER_STRING, NULL);
+	d = data_grow_for(d, len + 1);
 
 	q = d.val;
 	while (i < len) {
@@ -94,6 +95,7 @@ struct data data_copy_file(FILE *f, size_t maxlen)
 {
 	struct data d = empty_data;
 
+	d = data_add_marker(d, MARKER_BLOB, NULL);
 	while (!feof(f) && (d.len < maxlen)) {
 		size_t chunksize, ret;
 
diff --git a/dtc-parser.y b/dtc-parser.y
index 44af170..41fbd3f 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -266,11 +266,13 @@ propdata:
 		}
 	| propdataprefix arrayprefix '>'
 		{
-			$$ = data_merge($1, $2.data);
+			$1 = data_merge($1, $2.data);
+			$$ = data_add_marker($1, MARKER_NONE, NULL);
 		}
 	| propdataprefix '[' bytestring ']'
 		{
-			$$ = data_merge($1, $3);
+			$1 = data_merge($1, $3);
+			$$ = data_add_marker($1, MARKER_NONE, NULL);
 		}
 	| propdataprefix DT_REF
 		{
@@ -327,22 +329,27 @@ arrayprefix:
 	DT_BITS DT_LITERAL '<'
 		{
 			unsigned long long bits;
+			enum markertype type = MARKER_UINT32;
 
 			bits = $2;
 
-			if ((bits !=  8) && (bits != 16) &&
-			    (bits != 32) && (bits != 64)) {
+			switch (bits) {
+			case 8: type = MARKER_UINT8; break;
+			case 16: type = MARKER_UINT16; break;
+			case 32: type = MARKER_UINT32; break;
+			case 64: type = MARKER_UINT64; break;
+			default:
 				ERROR(&@2, "Array elements must be"
 				      " 8, 16, 32 or 64-bits");
 				bits = 32;
 			}
 
-			$$.data = empty_data;
+			$$.data = data_add_marker(empty_data, type, NULL);
 			$$.bits = bits;
 		}
 	| '<'
 		{
-			$$.data = empty_data;
+			$$.data = data_add_marker(empty_data, MARKER_UINT32, NULL);
 			$$.bits = 32;
 		}
 	| arrayprefix integer_prim
@@ -486,7 +493,7 @@ integer_unary:
 bytestring:
 	  /* empty */
 		{
-			$$ = empty_data;
+			$$ = data_add_marker(empty_data, MARKER_UINT8, NULL);
 		}
 	| bytestring DT_BYTE
 		{
diff --git a/dtc.h b/dtc.h
index 3b18a42..32a7655 100644
--- a/dtc.h
+++ b/dtc.h
@@ -74,9 +74,17 @@ typedef uint32_t cell_t;
 
 /* Data blobs */
 enum markertype {
+	MARKER_NONE = 0,
 	REF_PHANDLE,
 	REF_PATH,
 	LABEL,
+	MARKER_UINT8,
+	MARKER_UINT16,
+	MARKER_UINT32,
+	MARKER_UINT64,
+	MARKER_BLOB,
+	MARKER_STRING,
+	NUM_MARKERS,
 };
 
 struct  marker {
@@ -198,6 +206,7 @@ struct property *build_property(char *name, struct data val);
 struct property *build_property_delete(char *name);
 struct property *chain_property(struct property *first, struct property *list);
 struct property *reverse_properties(struct property *first);
+enum markertype guess_propval_type(struct property *prop);
 
 struct node *build_node(struct property *proplist, struct node *children);
 struct node *build_node_delete(void);
diff --git a/livetree.c b/livetree.c
index 57b7db2..1bbdaf8 100644
--- a/livetree.c
+++ b/livetree.c
@@ -336,6 +336,55 @@ void append_to_property(struct node *node,
 	}
 }
 
+static bool isstring(char c)
+{
+	return (isprint((unsigned char)c)
+		|| (c == '\0')
+		|| strchr("\a\b\t\n\v\f\r", c));
+}
+
+enum markertype guess_propval_type(struct property *prop)
+{
+	int len = prop->val.len;
+	const char *p = prop->val.val;
+	struct marker *m = prop->val.markers;
+	int nnotstring = 0, nnul = 0;
+	int nnotstringlbl = 0, nnotcelllbl = 0;
+	int i;
+
+	/* Check if the property is type annotated */
+	while (m && (m->type == LABEL || m->type == REF_PHANDLE))
+		m = m->next;
+	if (m && m->offset == 0)
+		return MARKER_NONE;
+
+	m = prop->val.markers;
+
+	/* data type information missing, need to guess */
+	for (i = 0; i < len; i++) {
+		if (! isstring(p[i]))
+			nnotstring++;
+		if (p[i] == '\0')
+			nnul++;
+	}
+
+	for_each_marker_of_type(m, LABEL) {
+		if ((m->offset > 0) && (prop->val.val[m->offset - 1] != '\0'))
+			nnotstringlbl++;
+		if ((m->offset % sizeof(cell_t)) != 0)
+			nnotcelllbl++;
+	}
+
+	if ((p[len-1] == '\0') && (nnotstring == 0) && (nnul < (len-nnul))
+	    && (nnotstringlbl == 0)) {
+		return MARKER_STRING;
+	} else if (((len % sizeof(cell_t)) == 0) && (nnotcelllbl == 0)) {
+		return MARKER_UINT32;
+	} else {
+		return MARKER_UINT8;
+	}
+}
+
 struct reserve_info *build_reserve_entry(uint64_t address, uint64_t size)
 {
 	struct reserve_info *new = xmalloc(sizeof(*new));
diff --git a/treesource.c b/treesource.c
index 2461a3d..cc3b223 100644
--- a/treesource.c
+++ b/treesource.c
@@ -54,29 +54,15 @@ static void write_prefix(FILE *f, int level)
 		fputc('\t', f);
 }
 
-static bool isstring(char c)
+static void write_propval_string(FILE *f, const char *str, size_t len)
 {
-	return (isprint((unsigned char)c)
-		|| (c == '\0')
-		|| strchr("\a\b\t\n\v\f\r", c));
-}
-
-static void write_propval_string(FILE *f, struct data val)
-{
-	const char *str = val.val;
 	int i;
-	struct marker *m = val.markers;
 
-	assert(str[val.len-1] == '\0');
+	assert(str[len-1] == '\0');
 
-	while (m && (m->offset == 0)) {
-		if (m->type == LABEL)
-			fprintf(f, "%s: ", m->ref);
-		m = m->next;
-	}
 	fprintf(f, "\"");
 
-	for (i = 0; i < (val.len-1); i++) {
+	for (i = 0; i < (len-1); i++) {
 		char c = str[i];
 
 		switch (c) {
@@ -108,15 +94,7 @@ static void write_propval_string(FILE *f, struct data val)
 			fprintf(f, "\\\"");
 			break;
 		case '\0':
-			fprintf(f, "\", ");
-			while (m && (m->offset <= (i + 1))) {
-				if (m->type == LABEL) {
-					assert(m->offset == (i+1));
-					fprintf(f, "%s: ", m->ref);
-				}
-				m = m->next;
-			}
-			fprintf(f, "\"");
+			fprintf(f, "\", \"");
 			break;
 		default:
 			if (isprint((unsigned char)c))
@@ -126,114 +104,161 @@ static void write_propval_string(FILE *f, struct data val)
 		}
 	}
 	fprintf(f, "\"");
-
-	/* Wrap up any labels at the end of the value */
-	for_each_marker_of_type(m, LABEL) {
-		assert (m->offset == val.len);
-		fprintf(f, " %s:", m->ref);
-	}
 }
 
-static void write_propval_cells(FILE *f, struct data val)
+static void write_propval_ref(FILE *f, struct node *np, const char *hint)
 {
-	void *propend = val.val + val.len;
-	fdt32_t *cp = (fdt32_t *)val.val;
-	struct marker *m = val.markers;
-
-	fprintf(f, "<");
-	for (;;) {
-		while (m && (m->offset <= ((char *)cp - val.val))) {
-			if (m->type == LABEL) {
-				assert(m->offset == ((char *)cp - val.val));
-				fprintf(f, "%s: ", m->ref);
-			}
-			m = m->next;
-		}
+	struct label *l;
+	struct node *root = np;
 
-		fprintf(f, "0x%x", fdt32_to_cpu(*cp++));
-		if ((void *)cp >= propend)
-			break;
-		fprintf(f, " ");
-	}
+	while (root->parent)
+		root = root->parent;
 
-	/* Wrap up any labels at the end of the value */
-	for_each_marker_of_type(m, LABEL) {
-		assert (m->offset == val.len);
-		fprintf(f, " %s:", m->ref);
+	/* If possible, use the hint string as the reference */
+	if (hint && np == get_node_by_ref(root, hint)) {
+		fprintf(f, hint[0] == '/' ? " &{%s}" : " &%s", hint);
+		return;
 	}
-	fprintf(f, ">");
-}
-
-static void write_propval_bytes(FILE *f, struct data val)
-{
-	void *propend = val.val + val.len;
-	const char *bp = val.val;
-	struct marker *m = val.markers;
-
-	fprintf(f, "[");
-	for (;;) {
-		while (m && (m->offset == (bp-val.val))) {
-			if (m->type == LABEL)
-				fprintf(f, "%s: ", m->ref);
-			m = m->next;
-		}
 
-		fprintf(f, "%02hhx", (unsigned char)(*bp++));
-		if ((const void *)bp >= propend)
-			break;
-		fprintf(f, " ");
+	/* Check if the node has a usable label */
+	for_each_label(np->labels, l) {
+		fprintf(f, " &%s", l->label);
+		return;
 	}
 
-	/* Wrap up any labels at the end of the value */
-	for_each_marker_of_type(m, LABEL) {
-		assert (m->offset == val.len);
-		fprintf(f, " %s:", m->ref);
-	}
-	fprintf(f, "]");
+	fprintf(f, " &{%s}", np->fullpath);
 }
 
-static void write_propval(FILE *f, struct property *prop)
+const char * delim_start[NUM_MARKERS] = {
+	[MARKER_BLOB] = "[",
+	[MARKER_UINT8] = "[",
+	[MARKER_UINT16] = "/bits/ 16 <",
+	[MARKER_UINT32] = "<",
+	[MARKER_UINT64] = "/bits/ 64 <",
+};
+const char * delim_end[NUM_MARKERS] = {
+	[MARKER_BLOB] = " ]",
+	[MARKER_UINT8] = " ]",
+	[MARKER_UINT16] = " >",
+	[MARKER_UINT32] = " >",
+	[MARKER_UINT64] = " >",
+};
+static void write_propval(FILE *f, struct node *root, struct property *prop)
 {
-	int len = prop->val.len;
-	const char *p = prop->val.val;
+	size_t len = prop->val.len;
+	size_t chunk_len;
 	struct marker *m = prop->val.markers;
-	int nnotstring = 0, nnul = 0;
-	int nnotstringlbl = 0, nnotcelllbl = 0;
-	int i;
+	struct marker dummy_marker = {
+		.offset = 0, .type = MARKER_NONE, .next = m, .ref = NULL
+	};
+	enum markertype emit_type = MARKER_NONE;
+	struct node *np;
+	cell_t phandle;
 
 	if (len == 0) {
 		fprintf(f, ";\n");
 		return;
 	}
 
-	for (i = 0; i < len; i++) {
-		if (! isstring(p[i]))
-			nnotstring++;
-		if (p[i] == '\0')
-			nnul++;
-	}
+	fprintf(f, " = ");
 
-	for_each_marker_of_type(m, LABEL) {
-		if ((m->offset > 0) && (prop->val.val[m->offset - 1] != '\0'))
-			nnotstringlbl++;
-		if ((m->offset % sizeof(cell_t)) != 0)
-			nnotcelllbl++;
-	}
+	dummy_marker.type = guess_propval_type(prop);
+	if (dummy_marker.type != MARKER_NONE)
+		m = &dummy_marker;
 
-	fprintf(f, " = ");
-	if ((p[len-1] == '\0') && (nnotstring == 0) && (nnul < (len-nnul))
-	    && (nnotstringlbl == 0)) {
-		write_propval_string(f, prop->val);
-	} else if (((len % sizeof(cell_t)) == 0) && (nnotcelllbl == 0)) {
-		write_propval_cells(f, prop->val);
-	} else {
-		write_propval_bytes(f, prop->val);
+	for_each_marker(m) {
+		chunk_len = (m->next ? m->next->offset : len) - m->offset;
+		const char *p = &prop->val.val[m->offset];
+		const char *end = p + chunk_len;
+
+		switch(m->type) {
+		case MARKER_NONE:
+			if (emit_type != MARKER_NONE)
+				fprintf(f, "%s", delim_end[emit_type]);
+			emit_type = m->type;
+			break;
+		case MARKER_STRING:
+		case MARKER_BLOB:
+		case MARKER_UINT8:
+		case MARKER_UINT16:
+		case MARKER_UINT32:
+		case MARKER_UINT64:
+			emit_type = m->type;
+			fprintf(f, m->offset ? ", %s" : "%s",
+			           delim_start[emit_type] ? : "");
+			break;
+		case LABEL:
+			fprintf(f, " %s:", m->ref);
+			break;
+		case REF_PHANDLE:
+			assert(emit_type == MARKER_UINT32);
+			assert(chunk_len >= sizeof(fdt32_t));
+			phandle = fdt32_to_cpu(*(const fdt32_t*)p);
+			np = get_node_by_phandle(root, phandle);
+			if (np) {
+				write_propval_ref(f, np, NULL);
+				chunk_len -= sizeof(fdt32_t);
+				p += sizeof(fdt32_t);
+			}
+			break;
+		case REF_PATH:
+			assert(emit_type == MARKER_NONE);
+			assert(strnlen(p, chunk_len) == chunk_len - 1);
+			np = get_node_by_ref(root, p);
+			if (np) {
+				write_propval_ref(f, np, m->ref);
+				p += chunk_len;
+				chunk_len = 0;
+			}
+			break;
+		default:
+			break;
+		}
+
+		if (chunk_len <= 0)
+			continue;
+
+		switch (emit_type) {
+		case MARKER_BLOB:
+		case MARKER_UINT8:
+			for (; p < end; p++)
+				fprintf(f, " %02"PRIx8, *(const uint8_t *)p);
+			break;
+		case MARKER_UINT16:
+			assert((chunk_len % sizeof(fdt16_t)) == 0);
+			for (; p < end; p += sizeof(fdt16_t))
+				fprintf(f, " 0x%02"PRIx16,
+				        fdt16_to_cpu(*(const fdt16_t*)p));
+			break;
+		case MARKER_UINT32:
+			assert((chunk_len % sizeof(fdt32_t)) == 0);
+			for (; p < end; p += sizeof(fdt32_t))
+				fprintf(f, " 0x%02"PRIx32,
+				        fdt32_to_cpu(*(const fdt32_t*)p));
+			break;
+		case MARKER_UINT64:
+			assert((chunk_len % sizeof(fdt64_t)) == 0);
+			for (; p < end; p += sizeof(fdt64_t))
+				fprintf(f, " 0x%02"PRIx64,
+				        fdt64_to_cpu(*(const fdt64_t*)p));
+			break;
+		case MARKER_STRING:
+			assert(p[chunk_len-1] == '\0');
+			write_propval_string(f, p, chunk_len);
+			break;
+		default:
+			/* Default to a block of raw bytes */
+			fprintf(f, "[ ");
+			for (; p < end; p++)
+				fprintf(f, " %02"PRIx8, *p);
+			fprintf(f, "]");
+		}
 	}
 
-	fprintf(f, ";\n");
+	fprintf(f, "%s;\n", delim_end[emit_type] ? : "");
 }
 
-static void write_tree_source_node(FILE *f, struct node *tree, int level)
+static void write_tree_source_node(FILE *f, struct node *root, struct node *tree, int level)
 {
 	struct property *prop;
 	struct node *child;
@@ -252,11 +277,11 @@ static void write_tree_source_node(FILE *f, struct node *tree, int level)
 		for_each_label(prop->labels, l)
 			fprintf(f, "%s: ", l->label);
 		fprintf(f, "%s", prop->name);
-		write_propval(f, prop);
+		write_propval(f, root, prop);
 	}
 	for_each_child(tree, child) {
 		fprintf(f, "\n");
-		write_tree_source_node(f, child, level+1);
+		write_tree_source_node(f, root, child, level+1);
 	}
 	write_prefix(f, level);
 	fprintf(f, "};\n");
@@ -279,6 +304,6 @@ void dt_to_source(FILE *f, struct dt_info *dti)
 			(unsigned long long)re->size);
 	}
 
-	write_tree_source_node(f, dti->dt, 0);
+	write_tree_source_node(f, dti->dt, dti->dt, 0);
 }
 
-- 
2.11.0
