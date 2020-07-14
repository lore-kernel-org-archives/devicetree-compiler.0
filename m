From: Andrei Ziureaev <andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH v2 5/6] dtc: Preserve negative integers in yaml and dts
Date: Tue, 14 Jul 2020 16:45:41 +0100
Message-ID: <20200714154542.18064-6-andrei.ziureaev@arm.com>
References: <20200714154542.18064-1-andrei.ziureaev@arm.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200714154542.18064-1-andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>
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
 dtc.h        |  8 ++++++++
 treesource.c | 25 ++++++++++++++++++++-----
 yamltree.c   | 27 ++++++++++++++-------------
 3 files changed, 42 insertions(+), 18 deletions(-)

diff --git a/dtc.h b/dtc.h
index a502bef..ba840ef 100644
--- a/dtc.h
+++ b/dtc.h
@@ -131,6 +131,14 @@ struct integer {
 	for_each_marker(m) \
 		if ((m)->type == (t))
 
+static inline bool has_type_at_offset(struct marker *m, enum markertype type, int off)
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
index 322d9e7..3072bf7 100644
--- a/treesource.c
+++ b/treesource.c
@@ -13,6 +13,14 @@ extern YYLTYPE yylloc;
 struct dt_info *parser_output;
 bool treesource_error;
 
+#define write_int(f, is_sig, val, w) (					\
+{									\
+	if ((is_sig) && (int##w##_t)(val) < 0)				\
+		fprintf(f, "(-0x%02"PRIx##w")", (uint##w##_t)-(val));	\
+	else								\
+		fprintf(f, "0x%02"PRIx##w, val);			\
+})
+
 struct dt_info *dt_from_source(const char *fname)
 {
 	parser_output = NULL;
@@ -102,25 +110,30 @@ static void write_propval_string(FILE *f, const char *s, size_t len)
 static void write_propval_int(FILE *f, struct marker *markers,
 			      const char *p, size_t len, size_t width)
 {
+	int start_offset = markers->offset;
+	const char *start = p;
 	const char *end = p + len;
 	assert(len % width == 0);
 
 	for (; p < end; p += width) {
+		int off = start_offset + (int)(p - start);
+		bool is_sig = has_type_at_offset(markers, TYPE_SIGNED, off);
+
 		switch (width) {
 		case 1:
 			if (markers->type == TYPE_BYTESTRING)
 				fprintf(f, "%02"PRIx8, *(const uint8_t*)p);
 			else
-				fprintf(f, "0x%02"PRIx8, *(const uint8_t*)p);
+				write_int(f, is_sig, *(const uint8_t*)p, 8);
 			break;
 		case 2:
-			fprintf(f, "0x%02"PRIx16, dtb_ld16(p));
+			write_int(f, is_sig, dtb_ld16(p), 16);
 			break;
 		case 4:
-			fprintf(f, "0x%02"PRIx32, dtb_ld32(p));
+			write_int(f, is_sig, dtb_ld32(p), 32);
 			break;
 		case 8:
-			fprintf(f, "0x%02"PRIx64, dtb_ld64(p));
+			write_int(f, is_sig, dtb_ld64(p), 64);
 			break;
 		}
 		if (p + width < end)
@@ -202,6 +215,7 @@ static enum markertype guess_value_type(struct property *prop)
 static void write_propval(FILE *f, struct property *prop)
 {
 	size_t len = prop->val.len;
+	size_t last_type_off = 0;
 	struct marker *m = prop->val.markers;
 	struct marker dummy_marker;
 	enum markertype emit_type = TYPE_NONE;
@@ -237,11 +251,12 @@ static void write_propval(FILE *f, struct property *prop)
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
diff --git a/yamltree.c b/yamltree.c
index 4e93c12..c1c3710 100644
--- a/yamltree.c
+++ b/yamltree.c
@@ -29,6 +29,14 @@ char *yaml_error_name[] = {
 		    (emitter)->problem, __func__, __LINE__);		\
 })
 
+#define yaml_write_int(buf, is_sig, val, w) (				\
+{									\
+	if ((is_sig) && (int##w##_t)(val) < 0)				\
+		snprintf(buf, 20, "-0x%"PRIx##w, (uint##w##_t)-(val));	\
+	else								\
+		snprintf(buf, 19, "0x%"PRIx##w, val);			\
+})
+
 static void yaml_propval_int(yaml_emitter_t *emitter, struct marker *markers, char *data, int len, int width)
 {
 	yaml_event_t event;
@@ -51,29 +59,22 @@ static void yaml_propval_int(yaml_emitter_t *emitter, struct marker *markers, ch
 
 	for (off = 0; off < len; off += width) {
 		char buf[32];
-		struct marker *m;
 		bool is_phandle = false;
+		bool is_sig = has_type_at_offset(markers, TYPE_SIGNED, start_offset + off);
 
 		switch(width) {
 		case 1:
-			sprintf(buf, "0x%"PRIx8, *(uint8_t*)(data + off));
+			yaml_write_int(buf, is_sig, *(uint8_t*)(data + off), 8);
 			break;
 		case 2:
-			sprintf(buf, "0x%"PRIx16, dtb_ld16(data + off));
+			yaml_write_int(buf, is_sig, dtb_ld16(data + off), 16);
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
+			yaml_write_int(buf, is_sig, dtb_ld32(data + off), 32);
+			is_phandle = has_type_at_offset(markers, REF_PHANDLE, start_offset + off);
 			break;
 		case 8:
-			sprintf(buf, "0x%"PRIx64, dtb_ld64(data + off));
+			yaml_write_int(buf, is_sig, dtb_ld64(data + off), 64);
 			break;
 		}
 
-- 
2.17.1

