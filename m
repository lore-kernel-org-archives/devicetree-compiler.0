From: Gurbir Arora <gurbaror-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH v2 5/6] libfdt: overlay_merge: Copy over various nodes and their properties
Date: Tue,  8 Sep 2020 12:33:35 -0700
Message-ID: <1599593616-308872-6-git-send-email-gurbaror@codeaurora.org>
References: <1599593616-308872-1-git-send-email-gurbaror@codeaurora.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1599593616-308872-1-git-send-email-gurbaror-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org
Cc: jdl-CYoMK+44s/E@public.gmane.org, pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org, maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, Srivatsa Vaddagiri <vatsa-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>

From: Srivatsa Vaddagiri <vatsa-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>

Many overlay fragment nodes that don't have a target node to be overlaid in base
device-tree will need to be copied over as-is into base-tree. This includes
merging properties found in special nodes such as __fixups__, __symbols__ and
__local_fixups__

Signed-off-by: Srivatsa Vaddagiri <vatsa-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 libfdt/fdt_overlay.c | 98 +++++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 94 insertions(+), 4 deletions(-)

diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
index 3c2ee88..d3a567f 100644
--- a/libfdt/fdt_overlay.c
+++ b/libfdt/fdt_overlay.c
@@ -795,9 +795,69 @@ static int overlay_apply_node(void *fdt, int target,
 }
 
 /**
+ * copy_node - copy a node hierarchically
+ * @fdt - pointer to base device tree
+ * @fdto - pointer to overlay device tree
+ * @fdt_child - offset of node in overlay device tree which needs to be copied
+ * @fdt_parent - offset of parent node in base tree under which @fdto_child
+ *		need to be copied
+ *
+ * This function copies a node in overlay tree along with its child-nodes and
+ * their properties, under a given parent node in base tree.
+ */
+static int copy_node(void *fdt, void *fdto, int fdt_parent, int fdto_child)
+{
+	const char *name, *value;
+	int offset, len, ret, prop, child;
+	void *p;
+
+	name = fdt_get_name(fdto, fdto_child, &len);
+	if (!name)
+		return len;
+
+	offset = fdt_subnode_offset(fdt, fdt_parent, name);
+	if (offset < 0) {
+		offset = fdt_add_subnode(fdt, fdt_parent, name);
+		if (offset < 0)
+			return offset;
+	}
+
+	fdt_for_each_subnode(child, fdto, fdto_child) {
+		ret = copy_node(fdt, fdto, offset, child);
+		if (ret < 0)
+			return ret;
+	}
+
+	fdt_for_each_property_offset(prop, fdto, fdto_child) {
+		int fdt_len = 0;
+
+		value = fdt_getprop_by_offset(fdto, prop,
+						  &name, &len);
+
+		if (fdt_getprop(fdt, offset, name, &fdt_len))
+			len += fdt_len;
+
+		ret = fdt_setprop_placeholder(fdt, offset, name,
+								len, &p);
+		if (ret < 0)
+			return ret;
+
+		if (fdt_len > 0) {
+			p = (char *)p + fdt_len;
+			len -= fdt_len;
+		}
+
+		memcpy(p, value, len);
+	}
+
+	return 0;
+}
+
+/**
  * overlay_merge - Merge an overlay into its base device tree
  * @fdt: Base Device Tree blob
  * @fdto: Device tree overlay blob
+ * @merge: Both input blobs are overlay blobs that are being merged
  *
  * overlay_merge() merges an overlay into its base device tree.
  *
@@ -809,7 +869,7 @@ static int overlay_apply_node(void *fdt, int target,
  *      0 on success
  *      Negative error code on failure
  */
-static int overlay_merge(void *fdt, void *fdto)
+static int overlay_merge(void *fdt, void *fdto, int merge)
 {
 	int fragment;
 
@@ -830,8 +890,21 @@ static int overlay_merge(void *fdt, void *fdto)
 			return overlay;
 
 		target = overlay_get_target(fdt, fdto, fragment, NULL);
-		if (target < 0)
+		if (target < 0) {
+			/*
+			 * No target found which is acceptable situation in case
+			 * of merging two overlay blobs. Copy this fragment to
+			 * base/combined blob, so that it can be considered for
+			 * overlay during a subsequent overlay operation of
+			 * combined blob on another base blob.
+			 */
+			if (target == -FDT_ERR_BADPHANDLE && merge) {
+				target = copy_node(fdt, fdto, 0, fragment);
+				if (!target)
+					continue;
+			}
 			return target;
+		}
 
 		ret = overlay_apply_node(fdt, target, fdto, overlay);
 		if (ret)
@@ -1081,7 +1154,7 @@ int fdt_overlay_apply(void *fdt, void *fdto)
 	if (ret)
 		goto err;
 
-	ret = overlay_merge(fdt, fdto);
+	ret = overlay_merge(fdt, fdto, 0);
 	if (ret)
 		goto err;
 
@@ -1428,6 +1501,8 @@ static int overlay_merge_local_fixups(void *fdt, void *fdto)
 		return fdto_local_fixups;
 
 	ret = copy_node(fdt, fdto, 0, fdto_local_fixups);
+
+	return ret;
 }
 
 int fdt_overlay_merge(void *fdt, void *fdto, int *fdto_nospace)
@@ -1459,7 +1534,7 @@ int fdt_overlay_merge(void *fdt, void *fdto, int *fdto_nospace)
 	if (ret)
 		goto err;
 
-	ret = overlay_merge(fdt, fdto);
+	ret = overlay_merge(fdt, fdto, 1);
 	if (ret)
 		goto err;
 
@@ -1467,6 +1542,21 @@ int fdt_overlay_merge(void *fdt, void *fdto, int *fdto_nospace)
 	if (ret)
 		goto err;
 
+	/* Can't have an overlay without __fixups__ ? */
+	ret = overlay_merge_node_properties(fdt, fdto, "/__fixups__");
+	if (ret)
+		goto err;
+
+	/* __symbols__ node need not be present */
+	ret = overlay_merge_node_properties(fdt, fdto, "/__symbols__");
+	if (ret && ret != -FDT_ERR_NOTFOUND)
+		goto err;
+
+	/* __local_fixups__ node need not be present */
+	ret = overlay_merge_local_fixups(fdt, fdto);
+	if (ret < 0 && ret != -FDT_ERR_NOTFOUND)
+		goto err;
+
 	/*
 	 * The overlay has been damaged, erase its magic.
 	 */
-- 
2.7.4

