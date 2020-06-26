From: Andrei Ziureaev <andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 2/3] dtc: Preserve negative integers in yaml and dts output
Date: Fri, 26 Jun 2020 17:25:27 +0100
Message-ID: <20200626162528.2129-3-andrei.ziureaev@arm.com>
References: <20200626162528.2129-1-andrei.ziureaev@arm.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200626162528.2129-1-andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

The dts format supports signed integers, but dts to dts and dts to yaml
conversions don't preserve the sign on output. This is a problem for
doing validation with schema that define a signed type.

Preserve the '-' sign in front of negative values in dts and yaml
output.

Signed-off-by: Andrei Ziureaev <andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>
---
 dtc-parser.y |  9 +++++++--
 dtc.h        | 11 +++++++++++
 treesource.c | 35 ++++++++++++++++++++++++++---------
 yamltree.c   | 32 +++++++++++++++++++-------------
 4 files changed, 63 insertions(+), 24 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index d3924e382065..4b7a9eaa65ff 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -381,6 +381,8 @@ arrayprefix:
 		}
 	| arrayprefix integer_prim
 		{
+			struct data data = $1.data;
+
 			if ($1.bits < 64) {
 				uint64_t mask = (1ULL << $1.bits) - 1;
 				/*
@@ -396,7 +398,10 @@ arrayprefix:
 					      " %d-bit array element", $1.bits);
 			}
 
-			$$.data = data_append_integer($1.data, $2.i, $1.bits);
+			if ($2.is_negative)
+				data = data_add_marker(data, TYPE_NEGATIVE, NULL);
+
+			$$.data = data_append_integer(data, $2.i, $1.bits);
 		}
 	| arrayprefix dt_ref
 		{
@@ -562,7 +567,7 @@ integer_unary:
 	  integer_prim
 	| '-' integer_unary
 		{
-			$$ = (struct integer){ -$2.i };
+			$$ = (struct integer){ -$2.i, !$2.is_negative };
 		}
 	| '~' integer_unary
 		{
diff --git a/dtc.h b/dtc.h
index fb1ade37b715..e1ae3a785b73 100644
--- a/dtc.h
+++ b/dtc.h
@@ -95,6 +95,7 @@ enum markertype {
 	REF_PHANDLE,
 	REF_PATH,
 	LABEL,
+	TYPE_NEGATIVE,
 	TYPE_UINT8,
 	TYPE_UINT16,
 	TYPE_UINT32,
@@ -118,6 +119,7 @@ struct data {
 
 struct integer {
 	uint64_t i;
+	bool is_negative;
 };
 
 #define empty_data ((struct data){ 0 /* all .members = 0 or NULL */ })
@@ -128,6 +130,15 @@ struct integer {
 	for_each_marker(m) \
 		if ((m)->type == (t))
 
+static inline bool has_marker_of_type_at_offset(struct marker *m,
+						enum markertype type, int off)
+{
+	for_each_marker_of_type(m, type)
+		if (m->offset == off)
+			return true;
+	return false;
+}
+
 size_t type_marker_length(struct marker *m);
 
 void data_free(struct data d);
diff --git a/treesource.c b/treesource.c
index 2acb920d7775..915cd6d6cf75 100644
--- a/treesource.c
+++ b/treesource.c
@@ -99,24 +99,39 @@ static void write_propval_string(FILE *f, const char *s, size_t len)
 	fprintf(f, "\"");
 }
 
-static void write_propval_int(FILE *f, const char *p, size_t len, size_t width)
+static void write_propval_int(FILE *f, struct marker *markers,
+			      const char *p, size_t len, size_t width)
 {
+	int start_offset = markers->offset;
+	const char *start = p;
 	const char *end = p + len;
 	assert(len % width == 0);
 
 	for (; p < end; p += width) {
+		int off = start_offset + (int)(p - start);
+		bool is_neg = has_marker_of_type_at_offset(markers, TYPE_NEGATIVE, off);
+
 		switch (width) {
 		case 1:
 			fprintf(f, "%02"PRIx8, *(const uint8_t*)p);
 			break;
 		case 2:
-			fprintf(f, "0x%02"PRIx16, dtb_ld16(p));
+			if (is_neg)
+				fprintf(f, "(-0x%02"PRIx16")", (uint16_t)-dtb_ld16(p));
+			else
+				fprintf(f, "0x%02"PRIx16, dtb_ld16(p));
 			break;
 		case 4:
-			fprintf(f, "0x%02"PRIx32, dtb_ld32(p));
+			if (is_neg)
+				fprintf(f, "(-0x%02"PRIx32")", -dtb_ld32(p));
+			else
+				fprintf(f, "0x%02"PRIx32, dtb_ld32(p));
 			break;
 		case 8:
-			fprintf(f, "0x%02"PRIx64, dtb_ld64(p));
+			if (is_neg)
+				fprintf(f, "(-0x%02"PRIx64")", -dtb_ld64(p));
+			else
+				fprintf(f, "0x%02"PRIx64, dtb_ld64(p));
 			break;
 		}
 		if (p + width < end)
@@ -196,6 +211,7 @@ static enum markertype guess_value_type(struct property *prop)
 static void write_propval(FILE *f, struct property *prop)
 {
 	size_t len = prop->val.len;
+	size_t last_type_off = 0;
 	struct marker *m = prop->val.markers;
 	struct marker dummy_marker;
 	enum markertype emit_type = TYPE_NONE;
@@ -231,11 +247,12 @@ static void write_propval(FILE *f, struct property *prop)
 		const char *p = &prop->val.val[m->offset];
 
 		if (has_data_type_information(m)) {
+			last_type_off = m->offset;
 			emit_type = m->type;
 			fprintf(f, " %s", delim_start[emit_type]);
 		} else if (m->type == LABEL)
 			fprintf(f, " %s:", m->ref);
-		else if (m->offset)
+		else if (m->offset != last_type_off)
 			fputc(' ', f);
 
 		if (emit_type == TYPE_NONE) {
@@ -245,19 +262,19 @@ static void write_propval(FILE *f, struct property *prop)
 
 		switch(emit_type) {
 		case TYPE_UINT16:
-			write_propval_int(f, p, chunk_len, 2);
+			write_propval_int(f, m, p, chunk_len, 2);
 			break;
 		case TYPE_UINT32:
-			write_propval_int(f, p, chunk_len, 4);
+			write_propval_int(f, m, p, chunk_len, 4);
 			break;
 		case TYPE_UINT64:
-			write_propval_int(f, p, chunk_len, 8);
+			write_propval_int(f, m, p, chunk_len, 8);
 			break;
 		case TYPE_STRING:
 			write_propval_string(f, p, chunk_len);
 			break;
 		default:
-			write_propval_int(f, p, chunk_len, 1);
+			write_propval_int(f, m, p, chunk_len, 1);
 		}
 
 		if (chunk_len == data_len) {
diff --git a/yamltree.c b/yamltree.c
index 4e93c12dc658..1710caebc111 100644
--- a/yamltree.c
+++ b/yamltree.c
@@ -51,29 +51,35 @@ static void yaml_propval_int(yaml_emitter_t *emitter, struct marker *markers, ch
 
 	for (off = 0; off < len; off += width) {
 		char buf[32];
-		struct marker *m;
 		bool is_phandle = false;
+		bool is_neg = has_marker_of_type_at_offset(markers, TYPE_NEGATIVE, start_offset + off);
 
 		switch(width) {
 		case 1:
-			sprintf(buf, "0x%"PRIx8, *(uint8_t*)(data + off));
+			if (is_neg)
+				sprintf(buf, "-0x%"PRIx8, (uint8_t)-*(uint8_t*)(data + off));
+			else
+				sprintf(buf, "0x%"PRIx8, *(uint8_t*)(data + off));
 			break;
 		case 2:
-			sprintf(buf, "0x%"PRIx16, dtb_ld16(data + off));
+			if (is_neg)
+				sprintf(buf, "-0x%"PRIx16, (uint16_t)-dtb_ld16(data + off));
+			else
+				sprintf(buf, "0x%"PRIx16, dtb_ld16(data + off));
 			break;
 		case 4:
-			sprintf(buf, "0x%"PRIx32, dtb_ld32(data + off));
-			m = markers;
-			is_phandle = false;
-			for_each_marker_of_type(m, REF_PHANDLE) {
-				if (m->offset == (start_offset + off)) {
-					is_phandle = true;
-					break;
-				}
-			}
+			if (is_neg)
+				sprintf(buf, "-0x%"PRIx32, -dtb_ld32(data + off));
+			else
+				sprintf(buf, "0x%"PRIx32, dtb_ld32(data + off));
+
+			is_phandle = has_marker_of_type_at_offset(markers, REF_PHANDLE, start_offset + off);
 			break;
 		case 8:
-			sprintf(buf, "0x%"PRIx64, dtb_ld64(data + off));
+			if (is_neg)
+				sprintf(buf, "-0x%"PRIx64, -dtb_ld64(data + off));
+			else
+				sprintf(buf, "0x%"PRIx64, dtb_ld64(data + off));
 			break;
 		}
 
-- 
2.17.1

