From: Andrei Ziureaev <andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>
Subject: [RFC PATCH v2 2/3] dtc: Move some definitions into dtc-plugin.h
Date: Fri, 21 Aug 2020 19:01:54 +0100
Message-ID: <20200821180155.16680-3-andrei.ziureaev@arm.com>
References: <20200821180155.16680-1-andrei.ziureaev@arm.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200821180155.16680-1-andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Move some functionality that is useful for plugins into its own header.

Signed-off-by: Andrei Ziureaev <andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>
---

Changes in v2:
- define "struct reserve_info" in "dtc-plugin.h"
- #include "srcpos.h" in this patch

 dtc-plugin.h | 182 +++++++++++++++++++++++++++++++++++++++++++++++++++
 dtc.h        | 153 +------------------------------------------
 treesource.c |  21 ------
 3 files changed, 183 insertions(+), 173 deletions(-)
 create mode 100644 dtc-plugin.h

diff --git a/dtc-plugin.h b/dtc-plugin.h
new file mode 100644
index 000000000000..d0fdf1f1682d
--- /dev/null
+++ b/dtc-plugin.h
@@ -0,0 +1,182 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef DTC_PLUGIN_H
+#define DTC_PLUGIN_H
+
+/*
+ * (C) Copyright Arm Holdings.  2020
+ * (C) Copyright David Gibson <dwg-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>, IBM Corporation.  2005.
+ */
+
+#include <stdint.h>
+#include <stdbool.h>
+
+#include "srcpos.h"
+
+struct dt_info {
+	unsigned int dtsflags;
+	struct reserve_info *reservelist;
+	uint32_t boot_cpuid_phys;
+	struct node *dt;		/* the device tree */
+	const char *outname;		/* filename being written to, "-" for stdout */
+};
+
+struct reserve_info {
+	uint64_t address, size;
+
+	struct reserve_info *next;
+
+	struct label *labels;
+};
+
+typedef uint32_t cell_t;
+
+enum markertype {
+	TYPE_NONE,
+	REF_PHANDLE,
+	REF_PATH,
+	LABEL,
+	TYPE_UINT8,
+	TYPE_UINT16,
+	TYPE_UINT32,
+	TYPE_UINT64,
+	TYPE_STRING,
+};
+
+struct marker {
+	enum markertype type;
+	int offset;
+	char *ref;
+	struct marker *next;
+};
+
+struct data {
+	int len;
+	char *val;
+	struct marker *markers;
+};
+
+#define for_each_marker(m) \
+	for (; (m); (m) = (m)->next)
+#define for_each_marker_of_type(m, t) \
+	for_each_marker(m) \
+		if ((m)->type == (t))
+
+/* Live trees */
+struct label {
+	bool deleted;
+	char *label;
+	struct label *next;
+};
+
+struct bus_type {
+	const char *name;
+};
+
+struct property {
+	bool deleted;
+	char *name;
+	struct data val;
+
+	struct property *next;
+
+	struct label *labels;
+	struct srcpos *srcpos;
+};
+
+struct node {
+	bool deleted;
+	char *name;
+	struct property *proplist;
+	struct node *children;
+
+	struct node *parent;
+	struct node *next_sibling;
+
+	char *fullpath;
+	int basenamelen;
+
+	cell_t phandle;
+	int addr_cells, size_cells;
+
+	struct label *labels;
+	const struct bus_type *bus;
+	struct srcpos *srcpos;
+
+	bool omit_if_unused, is_referenced;
+};
+
+#define for_each_label_withdel(l0, l) \
+	for ((l) = (l0); (l); (l) = (l)->next)
+
+#define for_each_label(l0, l) \
+	for_each_label_withdel(l0, l) \
+		if (!(l)->deleted)
+
+#define for_each_property_withdel(n, p) \
+	for ((p) = (n)->proplist; (p); (p) = (p)->next)
+
+#define for_each_property(n, p) \
+	for_each_property_withdel(n, p) \
+		if (!(p)->deleted)
+
+#define for_each_child_withdel(n, c) \
+	for ((c) = (n)->children; (c); (c) = (c)->next_sibling)
+
+#define for_each_child(n, c) \
+	for_each_child_withdel(n, c) \
+		if (!(c)->deleted)
+
+static inline uint16_t dtb_ld16(const void *p)
+{
+	const uint8_t *bp = (const uint8_t *)p;
+
+	return ((uint16_t)bp[0] << 8)
+		| bp[1];
+}
+
+static inline uint32_t dtb_ld32(const void *p)
+{
+	const uint8_t *bp = (const uint8_t *)p;
+
+	return ((uint32_t)bp[0] << 24)
+		| ((uint32_t)bp[1] << 16)
+		| ((uint32_t)bp[2] << 8)
+		| bp[3];
+}
+
+static inline uint64_t dtb_ld64(const void *p)
+{
+	const uint8_t *bp = (const uint8_t *)p;
+
+	return ((uint64_t)bp[0] << 56)
+		| ((uint64_t)bp[1] << 48)
+		| ((uint64_t)bp[2] << 40)
+		| ((uint64_t)bp[3] << 32)
+		| ((uint64_t)bp[4] << 24)
+		| ((uint64_t)bp[5] << 16)
+		| ((uint64_t)bp[6] << 8)
+		| bp[7];
+}
+
+static inline bool has_data_type_information(struct marker *m)
+{
+	return m->type >= TYPE_UINT8;
+}
+
+static inline struct marker *next_type_marker(struct marker *m)
+{
+	while (m && !has_data_type_information(m))
+		m = m->next;
+	return m;
+}
+
+static inline size_t type_marker_length(struct marker *m)
+{
+	struct marker *next = next_type_marker(m->next);
+
+	if (next)
+		return next->offset - m->offset;
+	return 0;
+}
+
+#endif /* DTC_PLUGIN_H */
diff --git a/dtc.h b/dtc.h
index a08f4159cd03..b8937080b775 100644
--- a/dtc.h
+++ b/dtc.h
@@ -22,6 +22,7 @@
 #include <fdt.h>
 
 #include "util.h"
+#include "dtc-plugin.h"
 
 #ifdef DEBUG
 #define debug(...)	printf(__VA_ARGS__)
@@ -49,84 +50,14 @@ extern int annotate;		/* annotate .dts with input source location */
 #define PHANDLE_EPAPR	0x2
 #define PHANDLE_BOTH	0x3
 
-typedef uint32_t cell_t;
-
-static inline uint16_t dtb_ld16(const void *p)
-{
-	const uint8_t *bp = (const uint8_t *)p;
-
-	return ((uint16_t)bp[0] << 8)
-		| bp[1];
-}
-
-static inline uint32_t dtb_ld32(const void *p)
-{
-	const uint8_t *bp = (const uint8_t *)p;
-
-	return ((uint32_t)bp[0] << 24)
-		| ((uint32_t)bp[1] << 16)
-		| ((uint32_t)bp[2] << 8)
-		| bp[3];
-}
-
-static inline uint64_t dtb_ld64(const void *p)
-{
-	const uint8_t *bp = (const uint8_t *)p;
-
-	return ((uint64_t)bp[0] << 56)
-		| ((uint64_t)bp[1] << 48)
-		| ((uint64_t)bp[2] << 40)
-		| ((uint64_t)bp[3] << 32)
-		| ((uint64_t)bp[4] << 24)
-		| ((uint64_t)bp[5] << 16)
-		| ((uint64_t)bp[6] << 8)
-		| bp[7];
-}
-
 #define streq(a, b)	(strcmp((a), (b)) == 0)
 #define strstarts(s, prefix)	(strncmp((s), (prefix), strlen(prefix)) == 0)
 #define strprefixeq(a, n, b)	(strlen(b) == (n) && (memcmp(a, b, n) == 0))
 
 #define ALIGN(x, a)	(((x) + (a) - 1) & ~((a) - 1))
 
-/* Data blobs */
-enum markertype {
-	TYPE_NONE,
-	REF_PHANDLE,
-	REF_PATH,
-	LABEL,
-	TYPE_UINT8,
-	TYPE_UINT16,
-	TYPE_UINT32,
-	TYPE_UINT64,
-	TYPE_STRING,
-};
-extern const char *markername(enum markertype markertype);
-
-struct  marker {
-	enum markertype type;
-	int offset;
-	char *ref;
-	struct marker *next;
-};
-
-struct data {
-	int len;
-	char *val;
-	struct marker *markers;
-};
-
-
 #define empty_data ((struct data){ 0 /* all .members = 0 or NULL */ })
 
-#define for_each_marker(m) \
-	for (; (m); (m) = (m)->next)
-#define for_each_marker_of_type(m, t) \
-	for_each_marker(m) \
-		if ((m)->type == (t))
-
-size_t type_marker_length(struct marker *m);
-
 void data_free(struct data d);
 
 struct data data_grow_for(struct data d, int xlen);
@@ -156,71 +87,6 @@ bool data_is_one_string(struct data d);
 #define MAX_PROPNAME_LEN	31
 #define MAX_NODENAME_LEN	31
 
-/* Live trees */
-struct label {
-	bool deleted;
-	char *label;
-	struct label *next;
-};
-
-struct bus_type {
-	const char *name;
-};
-
-struct property {
-	bool deleted;
-	char *name;
-	struct data val;
-
-	struct property *next;
-
-	struct label *labels;
-	struct srcpos *srcpos;
-};
-
-struct node {
-	bool deleted;
-	char *name;
-	struct property *proplist;
-	struct node *children;
-
-	struct node *parent;
-	struct node *next_sibling;
-
-	char *fullpath;
-	int basenamelen;
-
-	cell_t phandle;
-	int addr_cells, size_cells;
-
-	struct label *labels;
-	const struct bus_type *bus;
-	struct srcpos *srcpos;
-
-	bool omit_if_unused, is_referenced;
-};
-
-#define for_each_label_withdel(l0, l) \
-	for ((l) = (l0); (l); (l) = (l)->next)
-
-#define for_each_label(l0, l) \
-	for_each_label_withdel(l0, l) \
-		if (!(l)->deleted)
-
-#define for_each_property_withdel(n, p) \
-	for ((p) = (n)->proplist; (p); (p) = (p)->next)
-
-#define for_each_property(n, p) \
-	for_each_property_withdel(n, p) \
-		if (!(p)->deleted)
-
-#define for_each_child_withdel(n, c) \
-	for ((c) = (n)->children; (c); (c) = (c)->next_sibling)
-
-#define for_each_child(n, c) \
-	for_each_child_withdel(n, c) \
-		if (!(c)->deleted)
-
 void add_label(struct label **labels, char *label);
 void delete_labels(struct label **labels);
 
@@ -269,29 +135,12 @@ uint32_t guess_boot_cpuid(struct node *tree);
 
 /* Boot info (tree plus memreserve information */
 
-struct reserve_info {
-	uint64_t address, size;
-
-	struct reserve_info *next;
-
-	struct label *labels;
-};
-
 struct reserve_info *build_reserve_entry(uint64_t start, uint64_t len);
 struct reserve_info *chain_reserve_entry(struct reserve_info *first,
 					 struct reserve_info *list);
 struct reserve_info *add_reserve_entry(struct reserve_info *list,
 				       struct reserve_info *new);
 
-
-struct dt_info {
-	unsigned int dtsflags;
-	struct reserve_info *reservelist;
-	uint32_t boot_cpuid_phys;
-	struct node *dt;		/* the device tree */
-	const char *outname;		/* filename being written to, "-" for stdout */
-};
-
 /* DTS version flags definitions */
 #define DTSF_V1		0x0001	/* /dts-v1/ */
 #define DTSF_PLUGIN	0x0002	/* /plugin/ */
diff --git a/treesource.c b/treesource.c
index 061ba8c9c5e8..03aad68f6db4 100644
--- a/treesource.c
+++ b/treesource.c
@@ -124,27 +124,6 @@ static void write_propval_int(FILE *f, const char *p, size_t len, size_t width)
 	}
 }
 
-static bool has_data_type_information(struct marker *m)
-{
-	return m->type >= TYPE_UINT8;
-}
-
-static struct marker *next_type_marker(struct marker *m)
-{
-	while (m && !has_data_type_information(m))
-		m = m->next;
-	return m;
-}
-
-size_t type_marker_length(struct marker *m)
-{
-	struct marker *next = next_type_marker(m->next);
-
-	if (next)
-		return next->offset - m->offset;
-	return 0;
-}
-
 static const char *delim_start[] = {
 	[TYPE_UINT8] = "[",
 	[TYPE_UINT16] = "/bits/ 16 <",
-- 
2.17.1

