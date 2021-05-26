From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/5] yamltree: Remove marker ordering dependency
Date: Tue, 25 May 2021 20:03:31 -0500
Message-ID: <20210526010335.860787-2-robh@kernel.org>
References: <20210526010335.860787-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20210526010335.860787-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

The check for phandle markers is fragile because the phandle marker must
be after a type marker. The only guarantee for markers is they are in
offset order. The order at a specific offset is undefined.

Rework yaml_propval_int() to get the full marker list, so it can find a
phandle marker no matter the ordering.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 yamltree.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/yamltree.c b/yamltree.c
index e63d32fe142a..55908c829c98 100644
--- a/yamltree.c
+++ b/yamltree.c
@@ -29,11 +29,12 @@ char *yaml_error_name[] = {
 		    (emitter)->problem, __func__, __LINE__);		\
 })
 
-static void yaml_propval_int(yaml_emitter_t *emitter, struct marker *markers, char *data, unsigned int len, int width)
+static void yaml_propval_int(yaml_emitter_t *emitter, struct marker *markers,
+	char *data, unsigned int seq_offset, unsigned int len, int width)
 {
 	yaml_event_t event;
 	void *tag;
-	unsigned int off, start_offset = markers->offset;
+	unsigned int off;
 
 	switch(width) {
 		case 1: tag = "!u8"; break;
@@ -66,7 +67,7 @@ static void yaml_propval_int(yaml_emitter_t *emitter, struct marker *markers, ch
 			m = markers;
 			is_phandle = false;
 			for_each_marker_of_type(m, REF_PHANDLE) {
-				if (m->offset == (start_offset + off)) {
+				if (m->offset == (seq_offset + off)) {
 					is_phandle = true;
 					break;
 				}
@@ -114,6 +115,7 @@ static void yaml_propval(yaml_emitter_t *emitter, struct property *prop)
 	yaml_event_t event;
 	unsigned int len = prop->val.len;
 	struct marker *m = prop->val.markers;
+	struct marker *markers = prop->val.markers;
 
 	/* Emit the property name */
 	yaml_scalar_event_initialize(&event, NULL,
@@ -151,19 +153,19 @@ static void yaml_propval(yaml_emitter_t *emitter, struct property *prop)
 
 		switch(m->type) {
 		case TYPE_UINT16:
-			yaml_propval_int(emitter, m, data, chunk_len, 2);
+			yaml_propval_int(emitter, markers, data, m->offset, chunk_len, 2);
 			break;
 		case TYPE_UINT32:
-			yaml_propval_int(emitter, m, data, chunk_len, 4);
+			yaml_propval_int(emitter, markers, data, m->offset, chunk_len, 4);
 			break;
 		case TYPE_UINT64:
-			yaml_propval_int(emitter, m, data, chunk_len, 8);
+			yaml_propval_int(emitter, markers, data, m->offset, chunk_len, 8);
 			break;
 		case TYPE_STRING:
 			yaml_propval_string(emitter, data, chunk_len);
 			break;
 		default:
-			yaml_propval_int(emitter, m, data, chunk_len, 1);
+			yaml_propval_int(emitter, markers, data, m->offset, chunk_len, 1);
 			break;
 		}
 	}
-- 
2.27.0

