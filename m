From: Gurbir Arora <gurbaror-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH v2 3/6] libfdt: overlay_merge: Ignore unresolved symbols
Date: Wed,  9 Sep 2020 10:17:59 -0700
Message-ID: <1599671882-310027-4-git-send-email-gurbaror@codeaurora.org>
References: <1599671882-310027-1-git-send-email-gurbaror@codeaurora.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1599671882-310027-1-git-send-email-gurbaror-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org
Cc: jdl-CYoMK+44s/E@public.gmane.org, pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org, Srivatsa Vaddagiri <vatsa-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>

From: Srivatsa Vaddagiri <vatsa-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>

fdt_overlay_merge(), like fdt_overlay_apply(), has to perform similar operations
on DT blobs, one of which is going through external symbol references specified
in __fixups__ node of overlay DT blob and resolving them in base DT blob (as
performed by overlay_fixup_phandles()).

Unlike overlay case though, in case of merging two overlay blobs, its quite
normal that some of the external references specified in __fixups__ node are not
found in base blob. Modify overlay_fixup_phandles() to understand this
possibility.

Signed-off-by: Srivatsa Vaddagiri <vatsa-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 libfdt/fdt_overlay.c | 219 +++++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 205 insertions(+), 14 deletions(-)

diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
index d7d6f03..9ea106a 100644
--- a/libfdt/fdt_overlay.c
+++ b/libfdt/fdt_overlay.c
@@ -408,12 +408,147 @@ static int overlay_fixup_one_phandle(void *fdt, void *fdto,
 						   sizeof(phandle_prop));
 };
 
+#define PATH_MAX	256
+
+static int overlay_add_to_local_fixups(void *fdt, const char *value, int len)
+{
+	const char *path, *fixup_end, *prop;
+	const char *fixup_str = value;
+	uint32_t clen;
+	uint32_t fixup_len;
+	char *sep, *endptr;
+	const char *c;
+	int poffset, nodeoffset, ret, localfixup_off;
+	int pathlen, proplen;
+	char propname[PATH_MAX];
+
+	localfixup_off = fdt_path_offset(fdt, "/__local_fixups__");
+	if (localfixup_off < 0 && localfixup_off == -FDT_ERR_NOTFOUND)
+		localfixup_off = fdt_add_subnode(fdt, 0, "__local_fixups__");
+
+	if (localfixup_off < 0)
+		return localfixup_off;
+
+	while (len > 0) {
+		/* Assumes null-terminated properties! */
+		fixup_end = memchr(value, '\0', len);
+		if (!fixup_end)
+			return -FDT_ERR_BADOVERLAY;
+
+		fixup_len = fixup_end - fixup_str;
+
+		len -= (fixup_len + 1);
+		value += fixup_len + 1;
+
+		c = path = fixup_str;
+		sep = memchr(c, ':', fixup_len);
+		if (!sep || *sep != ':')
+			return -FDT_ERR_BADOVERLAY;
+		pathlen = sep - path;
+		if (pathlen == (fixup_len - 1))
+			return -FDT_ERR_BADOVERLAY;
+
+		fixup_len -= (pathlen + 1);
+		c = path + pathlen + 1;
+
+		sep = memchr(c, ':', fixup_len);
+		if (!sep || *sep != ':')
+			return -FDT_ERR_BADOVERLAY;
+
+		prop = c;
+		proplen = sep - c;
+
+		if (proplen >= PATH_MAX)
+			return -FDT_ERR_BADOVERLAY;
+
+		/*
+		 * Skip fixups that involves the special 'target' property found
+		 * in overlay fragments such as
+		 *	/fragment@0:target:0
+		 *
+		 * The check for one node in path below is to ensure that we
+		 * handle 'target' properties present otherwise in any other
+		 * node, for ex:
+		 *	/fragment@0/__overlay__/xyz:target:0
+		 */
+
+		/* Does path have exactly one node? */
+		c = path;
+		clen = pathlen;
+		if (*c == '/') {
+			c++;
+			clen -= 1;
+		}
+
+		sep = memchr(c, '/', clen);
+		if (!sep && proplen >= 6 && !strncmp(prop, "target", 6))
+			continue;
+
+		memcpy(propname, prop, proplen);
+		propname[proplen] = 0;
+
+		fixup_len -= (proplen + 1);
+		c = prop + proplen + 1;
+		poffset = strtoul(c, &endptr, 10);
+
+		nodeoffset = localfixup_off;
+
+		c = path;
+		clen = pathlen;
+
+		if (*c == '/') {
+			c++;
+			clen -= 1;
+		}
+
+		while (clen > 0) {
+			char nodename[PATH_MAX];
+			int nodelen, childnode;
+
+			sep = memchr(c, '/', clen);
+			if (!sep)
+				nodelen = clen;
+			else
+				nodelen = sep - c;
+
+			if (nodelen + 1 >= PATH_MAX)
+				return -FDT_ERR_BADSTRUCTURE;
+			memcpy(nodename, c, nodelen);
+			nodename[nodelen] = 0;
+
+			childnode = fdt_add_subnode(fdt, nodeoffset, nodename);
+			if (childnode == -FDT_ERR_EXISTS)
+				childnode = fdt_subnode_offset(fdt,
+							      nodeoffset, nodename);
+			nodeoffset = childnode;
+			if (nodeoffset < 0)
+				return nodeoffset;
+
+			c += nodelen;
+			clen -= nodelen;
+
+			if (*c == '/') {
+				c++;
+				clen -= 1;
+			}
+		}
+
+		ret = fdt_setprop_u32(fdt, nodeoffset, propname, poffset);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
 /**
  * overlay_fixup_phandle - Set an overlay phandle to the base one
  * @fdt: Base Device Tree blob
  * @fdto: Device tree overlay blob
  * @symbols_off: Node offset of the symbols node in the base device tree
  * @property: Property offset in the overlay holding the list of fixups
+ * @fixups_off: Offset of __fixups__ node in @fdto
+ * @merge: Both input blobs are overlay blobs that are being merged
  *
  * overlay_fixup_phandle() resolves all the overlay phandles pointed
  * to in a __fixups__ property, and updates them to match the phandles
@@ -428,11 +563,11 @@ static int overlay_fixup_one_phandle(void *fdt, void *fdto,
  *      Negative error code on failure
  */
 static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
-				 int property)
+				int property, int fixups_off, int merge)
 {
 	const char *value;
 	const char *label;
-	int len;
+	int len, ret = 0;
 
 	value = fdt_getprop_by_offset(fdto, property,
 				      &label, &len);
@@ -449,7 +584,7 @@ static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
 		uint32_t path_len, name_len;
 		uint32_t fixup_len;
 		char *sep, *endptr;
-		int poffset, ret;
+		int poffset;
 
 		fixup_end = memchr(value, '\0', len);
 		if (!fixup_end)
@@ -489,7 +624,36 @@ static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
 			return ret;
 	} while (len > 0);
 
-	return 0;
+	/*
+	 * Properties found in __fixups__ node are typically one of
+	 * these types:
+	 *
+	 * 	abc = "/fragment@2:target:0"		(first type)
+	 *	abc = "/fragment@2/__overlay__:xyz:0"	(second type)
+	 *
+	 * Both types could also be present in some properties as well such as:
+	 *
+	 *	abc = "/fragment@2:target:0", "/fragment@2/__overlay__:xyz:0"
+	 *
+	 * While merging two overlay blobs, a successful overlay phandle fixup
+	 * of second type needs to be recorded in __local_fixups__ node of the
+	 * combined blob, so that the phandle value can be further updated via
+	 * overlay_update_local_references() when the combined overlay blob gets
+	 * overlaid on a different base blob.
+	 *
+	 * Further, since in the case of merging two overlay blobs, we will also
+	 * be merging contents of nodes such as __fixups__ from both overlay
+	 * blobs, delete this property in __fixup__  node, as it no longer
+	 * represents a external phandle reference that needs to be resolved
+	 * during a subsequent overlay of combined blob on a base blob.
+	 */
+	if (merge) {
+		ret = overlay_add_to_local_fixups(fdt, value, len);
+		if (!ret)
+			ret = fdt_delprop(fdto, fixups_off, label);
+	}
+
+	return ret;
 }
 
 /**
@@ -497,6 +661,7 @@ static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
  *                          device tree
  * @fdt: Base Device Tree blob
  * @fdto: Device tree overlay blob
+ * @merge: Both input blobs are overlay blobs that are being merged
  *
  * overlay_fixup_phandles() resolves all the overlay phandles pointing
  * to nodes in the base device tree.
@@ -509,10 +674,10 @@ static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
  *      0 on success
  *      Negative error code on failure
  */
-static int overlay_fixup_phandles(void *fdt, void *fdto)
+static int overlay_fixup_phandles(void *fdt, void *fdto, int merge)
 {
 	int fixups_off, symbols_off;
-	int property;
+	int property, ret = 0, next_property;
 
 	/* We can have overlays without any fixups */
 	fixups_off = fdt_path_offset(fdto, "/__fixups__");
@@ -526,15 +691,41 @@ static int overlay_fixup_phandles(void *fdt, void *fdto)
 	if ((symbols_off < 0 && (symbols_off != -FDT_ERR_NOTFOUND)))
 		return symbols_off;
 
-	fdt_for_each_property_offset(property, fdto, fixups_off) {
-		int ret;
-
-		ret = overlay_fixup_phandle(fdt, fdto, symbols_off, property);
-		if (ret)
+	/* Safeguard against property being deleted in below loop */
+	property = fdt_first_property_offset(fdto, fixups_off);
+	while (property >= 0) {
+		next_property = fdt_next_property_offset(fdto, property);
+		ret = overlay_fixup_phandle(fdt, fdto, symbols_off,
+					   property, fixups_off, merge);
+		if (ret && (!merge || ret != -FDT_ERR_NOTFOUND))
 			return ret;
+
+		if (merge && !ret) {
+			/* Bail if this was the last property */
+			if (next_property < 0)
+				break;
+
+			/*
+			 * Property is deleted in this case. Next property is
+			 * available at the same offset, so loop back with
+			 * 'property' offset unmodified. Also since @fdt would
+			 * have been modified in this case, refresh the offset
+			 * of /__symbols__ node
+			 */
+			symbols_off = fdt_path_offset(fdt, "/__symbols__");
+			if (symbols_off < 0)
+				return symbols_off;
+
+			continue;
+		}
+
+		property = next_property;
 	}
 
-	return 0;
+	if (merge && ret == -FDT_ERR_NOTFOUND)
+		ret = 0;
+
+	return ret;
 }
 
 /**
@@ -849,7 +1040,7 @@ int fdt_overlay_apply(void *fdt, void *fdto)
 	if (ret)
 		goto err;
 
-	ret = overlay_fixup_phandles(fdt, fdto);
+	ret = overlay_fixup_phandles(fdt, fdto, 0);
 	if (ret)
 		goto err;
 
@@ -1227,7 +1418,7 @@ int fdt_overlay_merge(void *fdt, void *fdto, int *fdto_nospace)
 	if (ret)
 		goto err;
 
-	ret = overlay_fixup_phandles(fdt, fdto);
+	ret = overlay_fixup_phandles(fdt, fdto, 1);
 	if (ret)
 		goto err;
 
-- 
2.7.4

