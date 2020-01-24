From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] Revert "yamltree: Ensure consistent bracketing of properties with phandles"
Date: Fri, 24 Jan 2020 08:46:57 -0600
Message-ID: <20200124144657.29749-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

This reverts commit 18d7b2f4ee45fec422b7d82bab0b3c762ee907e4.

This doesn't work for properties such as 'interrupt-map' that has
phandle in the middle of an entry. It would also not work for a 0 or -1
phandle value that acts as a NULL.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 yamltree.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/yamltree.c b/yamltree.c
index 43ca869dd6a8..5b6ea8ea862f 100644
--- a/yamltree.c
+++ b/yamltree.c
@@ -138,27 +138,6 @@ static void yaml_propval(yaml_emitter_t *emitter, struct property *prop)
 		(yaml_char_t *)YAML_SEQ_TAG, 1, YAML_FLOW_SEQUENCE_STYLE);
 	yaml_emitter_emit_or_die(emitter, &event);
 
-	/* Ensure we have a type marker before any phandle */
-	for_each_marker(m) {
-		int last_offset = 0;
-		struct marker *type_m;
-
-		if (m->type >= TYPE_UINT8)
-			last_offset = m->offset;
-
-		if (!(m->next && m->next->type == REF_PHANDLE &&
-		      last_offset < m->next->offset))
-			continue;
-
-		type_m = xmalloc(sizeof(*type_m));
-		type_m->offset = m->next->offset;
-		type_m->type = TYPE_UINT32;
-		type_m->ref = NULL;
-		type_m->next = m->next;
-		m->next = type_m;
-	}
-
-	m = prop->val.markers;
 	for_each_marker(m) {
 		int chunk_len;
 		char *data = &prop->val.val[m->offset];
-- 
2.20.1

