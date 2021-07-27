From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v3 1/5] Move marker functions to dtc.h
Date: Tue, 27 Jul 2021 12:30:19 -0600
Message-ID: <20210727183023.3212077-2-robh@kernel.org>
References: <20210727183023.3212077-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20210727183023.3212077-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

In preparation to share the marker related functions, let's move them all
out of treeresource.c into dtc.h. Rework the next_type_marker()
implementation to use for_each_marker() instead of open coding it.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
v3:
 - New patch
---
 dtc.h        | 23 ++++++++++++++++++++++-
 treesource.c | 23 +----------------------
 2 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/dtc.h b/dtc.h
index cf2c6ac6e81e..0a1f54991026 100644
--- a/dtc.h
+++ b/dtc.h
@@ -116,6 +116,12 @@ enum markertype {
 	TYPE_UINT64,
 	TYPE_STRING,
 };
+
+static inline bool is_type_marker(enum markertype type)
+{
+	return type >= TYPE_UINT8;
+}
+
 extern const char *markername(enum markertype markertype);
 
 struct  marker {
@@ -140,7 +146,22 @@ struct data {
 	for_each_marker(m) \
 		if ((m)->type == (t))
 
-size_t type_marker_length(struct marker *m);
+static inline struct marker *next_type_marker(struct marker *m)
+{
+	for_each_marker(m)
+		if (is_type_marker(m->type))
+			break;
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
 
 void data_free(struct data d);
 
diff --git a/treesource.c b/treesource.c
index 061ba8c9c5e8..db2ff69f5ccb 100644
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
@@ -230,7 +209,7 @@ static void write_propval(FILE *f, struct property *prop)
 		size_t data_len = type_marker_length(m) ? : len - m->offset;
 		const char *p = &prop->val.val[m->offset];
 
-		if (has_data_type_information(m)) {
+		if (is_type_marker(m->type)) {
 			emit_type = m->type;
 			fprintf(f, " %s", delim_start[emit_type]);
 		} else if (m->type == LABEL)
-- 
2.27.0

