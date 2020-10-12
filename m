From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 06/11] dtc: Fix signedness comparisons warnings: change types
Date: Mon, 12 Oct 2020 17:19:43 +0100
Message-ID: <20201012161948.23994-7-andre.przywara@arm.com>
References: <20201012161948.23994-1-andre.przywara@arm.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20201012161948.23994-1-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

With -Wsign-compare, compilers warn about a mismatching signedness in
comparisons in various parts of dtc.

Many variables are using signed types unnecessarily, as we never use
negative value in them.
Change their types to be unsigned, to prevent issues with comparisons.

Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
---
 data.c     | 4 ++--
 dtc.h      | 8 ++++----
 flattree.c | 8 ++++----
 livetree.c | 2 +-
 yamltree.c | 6 +++---
 5 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/data.c b/data.c
index 0a43b6d..fdb0407 100644
--- a/data.c
+++ b/data.c
@@ -21,10 +21,10 @@ void data_free(struct data d)
 		free(d.val);
 }
 
-struct data data_grow_for(struct data d, int xlen)
+struct data data_grow_for(struct data d, unsigned int xlen)
 {
 	struct data nd;
-	int newsize;
+	unsigned int newsize;
 
 	if (xlen == 0)
 		return d;
diff --git a/dtc.h b/dtc.h
index f2f96ec..511dda1 100644
--- a/dtc.h
+++ b/dtc.h
@@ -107,13 +107,13 @@ extern const char *markername(enum markertype markertype);
 
 struct  marker {
 	enum markertype type;
-	int offset;
+	unsigned int offset;
 	char *ref;
 	struct marker *next;
 };
 
 struct data {
-	int len;
+	unsigned int len;
 	char *val;
 	struct marker *markers;
 };
@@ -131,7 +131,7 @@ size_t type_marker_length(struct marker *m);
 
 void data_free(struct data d);
 
-struct data data_grow_for(struct data d, int xlen);
+struct data data_grow_for(struct data d, unsigned int xlen);
 
 struct data data_copy_mem(const char *mem, int len);
 struct data data_copy_escape_string(const char *s, int len);
@@ -255,7 +255,7 @@ void append_to_property(struct node *node,
 const char *get_unitname(struct node *node);
 struct property *get_property(struct node *node, const char *propname);
 cell_t propval_cell(struct property *prop);
-cell_t propval_cell_n(struct property *prop, int n);
+cell_t propval_cell_n(struct property *prop, unsigned int n);
 struct property *get_property_by_label(struct node *tree, const char *label,
 				       struct node **node);
 struct marker *get_marker_label(struct node *tree, const char *label,
diff --git a/flattree.c b/flattree.c
index 07f10d2..4659afb 100644
--- a/flattree.c
+++ b/flattree.c
@@ -149,7 +149,7 @@ static void asm_emit_align(void *e, int a)
 static void asm_emit_data(void *e, struct data d)
 {
 	FILE *f = e;
-	int off = 0;
+	unsigned int off = 0;
 	struct marker *m = d.markers;
 
 	for_each_marker_of_type(m, LABEL)
@@ -219,7 +219,7 @@ static struct emitter asm_emitter = {
 
 static int stringtable_insert(struct data *d, const char *str)
 {
-	int i;
+	unsigned int i;
 
 	/* FIXME: do this more efficiently? */
 
@@ -345,7 +345,7 @@ static void make_fdt_header(struct fdt_header *fdt,
 void dt_to_blob(FILE *f, struct dt_info *dti, int version)
 {
 	struct version_info *vi = NULL;
-	int i;
+	unsigned int i;
 	struct data blob       = empty_data;
 	struct data reservebuf = empty_data;
 	struct data dtbuf      = empty_data;
@@ -446,7 +446,7 @@ static void dump_stringtable_asm(FILE *f, struct data strbuf)
 void dt_to_asm(FILE *f, struct dt_info *dti, int version)
 {
 	struct version_info *vi = NULL;
-	int i;
+	unsigned int i;
 	struct data strbuf = empty_data;
 	struct reserve_info *re;
 	const char *symprefix = "dt";
diff --git a/livetree.c b/livetree.c
index aea6095..8393637 100644
--- a/livetree.c
+++ b/livetree.c
@@ -438,7 +438,7 @@ cell_t propval_cell(struct property *prop)
 	return fdt32_to_cpu(*((fdt32_t *)prop->val.val));
 }
 
-cell_t propval_cell_n(struct property *prop, int n)
+cell_t propval_cell_n(struct property *prop, unsigned int n)
 {
 	assert(prop->val.len / sizeof(cell_t) >= n);
 	return fdt32_to_cpu(*((fdt32_t *)prop->val.val + n));
diff --git a/yamltree.c b/yamltree.c
index 4e93c12..e63d32f 100644
--- a/yamltree.c
+++ b/yamltree.c
@@ -29,11 +29,11 @@ char *yaml_error_name[] = {
 		    (emitter)->problem, __func__, __LINE__);		\
 })
 
-static void yaml_propval_int(yaml_emitter_t *emitter, struct marker *markers, char *data, int len, int width)
+static void yaml_propval_int(yaml_emitter_t *emitter, struct marker *markers, char *data, unsigned int len, int width)
 {
 	yaml_event_t event;
 	void *tag;
-	int off, start_offset = markers->offset;
+	unsigned int off, start_offset = markers->offset;
 
 	switch(width) {
 		case 1: tag = "!u8"; break;
@@ -112,7 +112,7 @@ static void yaml_propval_string(yaml_emitter_t *emitter, char *str, int len)
 static void yaml_propval(yaml_emitter_t *emitter, struct property *prop)
 {
 	yaml_event_t event;
-	int len = prop->val.len;
+	unsigned int len = prop->val.len;
 	struct marker *m = prop->val.markers;
 
 	/* Emit the property name */
-- 
2.17.5

