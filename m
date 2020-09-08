From: Gurbir Arora <gurbaror-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH v2 4/6] libfdt: overlay_merge: remove resolved symbols
Date: Tue,  8 Sep 2020 12:33:34 -0700
Message-ID: <1599593616-308872-5-git-send-email-gurbaror@codeaurora.org>
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

Merging two overlay blobs will involve merging contents of nodes such as
__symbols__. Not all properties need to be merged however at the end of merge
process. overlay_symbol_update() may already have updated base blob's
__symbols__ node to reflect new position of some nodes from overlay blob. Remove
such symbols from overlay blob's __symbols__ node, to prevent a subsequent merge
of __symbols__ node of both blobs from creating duplicate entries representing
same node.

Signed-off-by: Srivatsa Vaddagiri <vatsa-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 libfdt/fdt_overlay.c | 49 +++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 43 insertions(+), 6 deletions(-)

diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
index 9ea106a..3c2ee88 100644
--- a/libfdt/fdt_overlay.c
+++ b/libfdt/fdt_overlay.c
@@ -873,6 +873,7 @@ static int get_path_len(const void *fdt, int nodeoffset)
  * overlay_symbol_update - Update the symbols of base tree after a merge
  * @fdt: Base Device Tree blob
  * @fdto: Device tree overlay blob
+ * @merge: Both input blobs are overlay blobs that are being merged
  *
  * overlay_symbol_update() updates the symbols of the base tree with the
  * symbols of the applied overlay
@@ -885,9 +886,9 @@ static int get_path_len(const void *fdt, int nodeoffset)
  *      0 on success
  *      Negative error code on failure
  */
-static int overlay_symbol_update(void *fdt, void *fdto)
+static int overlay_symbol_update(void *fdt, void *fdto, int merge)
 {
-	int root_sym, ov_sym, prop, path_len, fragment, target;
+	int root_sym, ov_sym, prop, next_prop, path_len, fragment, target;
 	int len, frag_name_len, ret, rel_path_len;
 	const char *s, *e;
 	const char *path;
@@ -915,7 +916,12 @@ static int overlay_symbol_update(void *fdt, void *fdto)
 		return root_sym;
 
 	/* iterate over each overlay symbol */
-	fdt_for_each_property_offset(prop, fdto, ov_sym) {
+
+	/* Safeguard against property being possibly deleted in this loop */
+	prop = fdt_first_property_offset(fdto, ov_sym);
+	while (prop >= 0) {
+		next_prop = fdt_next_property_offset(fdto, prop);
+
 		path = fdt_getprop_by_offset(fdto, prop, &name, &path_len);
 		if (!path)
 			return path_len;
@@ -973,8 +979,14 @@ static int overlay_symbol_update(void *fdt, void *fdto)
 
 		/* get the target of the fragment */
 		ret = overlay_get_target(fdt, fdto, fragment, &target_path);
-		if (ret < 0)
+		if (ret < 0) {
+			if (ret == -FDT_ERR_BADPHANDLE && merge) {
+				prop = next_prop;
+				continue;
+			}
+
 			return ret;
+		}
 		target = ret;
 
 		/* if we have a target path use */
@@ -1015,6 +1027,31 @@ static int overlay_symbol_update(void *fdt, void *fdto)
 		buf[len] = '/';
 		memcpy(buf + len + 1, rel_path, rel_path_len);
 		buf[len + 1 + rel_path_len] = '\0';
+
+		/*
+		 * In case of merging two overlay blobs, we will be merging
+		 * contents of nodes such as __symbols__ from both overlay
+		 * blobs. Delete this property in __symbols__ node of second
+		 * overlay blob, as it has already been reflected in
+		 * first/combined blob's __symbols__ node.
+		 */
+		if (merge) {
+			ret = fdt_delprop(fdto, ov_sym, name);
+			if (ret < 0)
+				return ret;
+
+			/* Bail if this was the last property */
+			if (next_prop < 0)
+				break;
+
+			/*
+			 * Continue with same 'prop' offset, as the next
+			 * property is now available at the same offset
+			 */
+			continue;
+		}
+
+		prop = next_prop;
 	}
 
 	return 0;
@@ -1048,7 +1085,7 @@ int fdt_overlay_apply(void *fdt, void *fdto)
 	if (ret)
 		goto err;
 
-	ret = overlay_symbol_update(fdt, fdto);
+	ret = overlay_symbol_update(fdt, fdto, 0);
 	if (ret)
 		goto err;
 
@@ -1426,7 +1463,7 @@ int fdt_overlay_merge(void *fdt, void *fdto, int *fdto_nospace)
 	if (ret)
 		goto err;
 
-	ret = overlay_symbol_update(fdt, fdto);
+	ret = overlay_symbol_update(fdt, fdto, 1);
 	if (ret)
 		goto err;
 
-- 
2.7.4

