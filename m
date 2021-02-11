From: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [DTC][RFC] dtc: Allow better error reporting
Date: Thu, 11 Feb 2021 16:57:21 +0530
Message-ID: <3950d7da35130a850ba9217ac7bfef781fa850b2.1613042485.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JU1gc/ALV1VkkX6EBW5FvgSlWlS/XoSIRN2HuCqDgyE=;
        b=VqH3nRtmV89x4jHYQhp7d1wniZooga5iMIAUwOyMk3NC1SwOwoh4WjBTc8P8LYu6V8
         oMkY1ErorG2ioNOMI9zp/H9kczqiwVQvOGvLjT1sHWUysiIWErHT1YGz69SIBv9htmYG
         YOu4qJmPAifHAd2GLd1p/N1tuY0qfFr/eicv52bF7c9uVOKSRad9a+nSpuDmEr6zfS/Z
         95T0cd2o8hWkyro9vjfXqhV9bvOcXy9gOIA3WHxCkvfhkHpE2CpXU12kV5ex+scvywOC
         hZOlQcQzBOgdTjA+dMomoCvaEdYLiLZKVL9+Rqd6hzASrXZUWV8N3w8F2b0OLVAgpXf5
         Nv1Q==
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vincent Guittot <vincent.guittot-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bill Mills <bill.mills-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Loeliger <loeliger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

The dtc tool doesn't do very elaborate error reporting to keep the size
of the executables small enough for all kind of applications.

This patch tries to provide a way to do better error reporting, without
increasing the size of the executables for such cases (where we don't
want elaborate error reporting).

The error reporting will only be enabled if 'VERBOSE' (as -DVERBOSE)
flag is passed during compilation of the tools.

This also updates the fdtoverlay tool to do better error reporting,
which is required by the Linux Kernel for now.

Signed-off-by: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

---
Hi David,

Unfortunately I am not a core DT guy and don't understand most of the
stuff going on here. I tried to do minimal changes to get more
information out on errors and it may require someone who understands the
code well to write better error logs.

FWIW, I stumbled upon this because of the discussion that happened here:

https://lore.kernel.org/lkml/74f8aa8f-ffab-3b0f-186f-31fb7395ebbb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org/

Thanks.

---
 dtc.h                |   6 ++
 fdtoverlay.c         |   1 +
 libfdt/fdt_overlay.c | 156 ++++++++++++++++++++++++++++++++++---------
 3 files changed, 132 insertions(+), 31 deletions(-)

diff --git a/dtc.h b/dtc.h
index d3e82fb8e3db..b8ffec155263 100644
--- a/dtc.h
+++ b/dtc.h
@@ -29,6 +29,12 @@
 #define debug(...)
 #endif
 
+#ifdef VERBOSE
+#define dtc_err(fmt, ...)	fprintf(stderr, "DTC: %s: %d: " fmt, __func__, __LINE__, ##__VA_ARGS__)
+#else
+#define dtc_err(fmt, ...)
+#endif
+
 #define DEFAULT_FDT_VERSION	17
 
 /*
diff --git a/fdtoverlay.c b/fdtoverlay.c
index 5350af65679f..5f60ce4e4cea 100644
--- a/fdtoverlay.c
+++ b/fdtoverlay.c
@@ -16,6 +16,7 @@
 
 #include <libfdt.h>
 
+#include "dtc.h"
 #include "util.h"
 
 #define BUF_INCREMENT	65536
diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
index d217e79b6722..b24286ac8c6c 100644
--- a/libfdt/fdt_overlay.c
+++ b/libfdt/fdt_overlay.c
@@ -10,6 +10,7 @@
 #include <libfdt.h>
 
 #include "libfdt_internal.h"
+#include "../dtc.h"
 
 /**
  * overlay_get_target_phandle - retrieves the target phandle of a fragment
@@ -160,12 +161,16 @@ static int overlay_adjust_node_phandles(void *fdto, int node,
 	int ret;
 
 	ret = overlay_phandle_add_offset(fdto, node, "phandle", delta);
-	if (ret && ret != -FDT_ERR_NOTFOUND)
+	if (ret && ret != -FDT_ERR_NOTFOUND) {
+		dtc_err("Failed to add phandle offset (%d: %s)\n", node, fdt_strerror(ret));
 		return ret;
+	}
 
 	ret = overlay_phandle_add_offset(fdto, node, "linux,phandle", delta);
-	if (ret && ret != -FDT_ERR_NOTFOUND)
+	if (ret && ret != -FDT_ERR_NOTFOUND) {
+		dtc_err("Failed to add linux,phandle offset (%d: %s)\n", node, fdt_strerror(ret));
 		return ret;
+	}
 
 	fdt_for_each_subnode(child, fdto, node) {
 		ret = overlay_adjust_node_phandles(fdto, child, delta);
@@ -239,12 +244,17 @@ static int overlay_update_local_node_references(void *fdto,
 		if (!fixup_val)
 			return fixup_len;
 
-		if (fixup_len % sizeof(uint32_t))
+		if (fixup_len % sizeof(uint32_t)) {
+			dtc_err("Invalid fixup length\n");
 			return -FDT_ERR_BADOVERLAY;
+		}
 		fixup_len /= sizeof(uint32_t);
 
 		tree_val = fdt_getprop(fdto, tree_node, name, &tree_len);
 		if (!tree_val) {
+			dtc_err("Failed to get property: %s: %d\n", name,
+				tree_len);
+
 			if (tree_len == -FDT_ERR_NOTFOUND)
 				return -FDT_ERR_BADOVERLAY;
 
@@ -274,11 +284,17 @@ static int overlay_update_local_node_references(void *fdto,
 								  poffset,
 								  &adj_val,
 								  sizeof(adj_val));
-			if (ret == -FDT_ERR_NOSPACE)
+			if (ret == -FDT_ERR_NOSPACE) {
+				dtc_err("Failed to update property's name: %s\n",
+					name);
 				return -FDT_ERR_BADOVERLAY;
+			}
 
-			if (ret)
+			if (ret) {
+				dtc_err("Failed to update property's name: %s: %s\n",
+					name, fdt_strerror(ret));
 				return ret;
+			}
 		}
 	}
 
@@ -289,10 +305,16 @@ static int overlay_update_local_node_references(void *fdto,
 
 		tree_child = fdt_subnode_offset(fdto, tree_node,
 						fixup_child_name);
-		if (tree_child == -FDT_ERR_NOTFOUND)
+		if (tree_child == -FDT_ERR_NOTFOUND) {
+			dtc_err("Failed to find subnode: %s\n",
+				fixup_child_name);
 			return -FDT_ERR_BADOVERLAY;
-		if (tree_child < 0)
+		}
+		if (tree_child < 0) {
+			dtc_err("Failed to find subnode: %s: %s\n",
+				fixup_child_name, fdt_strerror(tree_child));
 			return tree_child;
+		}
 
 		ret = overlay_update_local_node_references(fdto,
 							   tree_child,
@@ -332,6 +354,8 @@ static int overlay_update_local_references(void *fdto, uint32_t delta)
 		if (fixups == -FDT_ERR_NOTFOUND)
 			return 0;
 
+		dtc_err("Failed to find local_fixups (%s)\n",
+			fdt_strerror(fixups));
 		return fixups;
 	}
 
@@ -435,6 +459,8 @@ static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
 	value = fdt_getprop_by_offset(fdto, property,
 				      &label, &len);
 	if (!value) {
+		dtc_err("Failed to get property by offset (%s)\n",
+			fdt_strerror(len));
 		if (len == -FDT_ERR_NOTFOUND)
 			return -FDT_ERR_INTERNAL;
 
@@ -450,8 +476,10 @@ static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
 		int poffset, ret;
 
 		fixup_end = memchr(value, '\0', len);
-		if (!fixup_end)
+		if (!fixup_end) {
+			dtc_err("fixup_end can't be 0: %s: %s\n", value, label);
 			return -FDT_ERR_BADOVERLAY;
+		}
 		fixup_len = fixup_end - fixup_str;
 
 		len -= fixup_len + 1;
@@ -459,32 +487,47 @@ static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
 
 		path = fixup_str;
 		sep = memchr(fixup_str, ':', fixup_len);
-		if (!sep || *sep != ':')
+		if (!sep || *sep != ':') {
+			dtc_err("Missing ':' separator: %s: %s\n", value,
+				label);
 			return -FDT_ERR_BADOVERLAY;
+		}
 
 		path_len = sep - path;
-		if (path_len == (fixup_len - 1))
+		if (path_len == (fixup_len - 1)) {
+			dtc_err("Invalid path_len: %s: %s\n", value, label);
 			return -FDT_ERR_BADOVERLAY;
+		}
 
 		fixup_len -= path_len + 1;
 		name = sep + 1;
 		sep = memchr(name, ':', fixup_len);
-		if (!sep || *sep != ':')
+		if (!sep || *sep != ':') {
+			dtc_err("Missing ':' separator: %s: %s\n", value,
+				label);
 			return -FDT_ERR_BADOVERLAY;
+		}
 
 		name_len = sep - name;
-		if (!name_len)
+		if (!name_len) {
+			dtc_err("name_len can't be 0: %s: %s\n", value, label);
 			return -FDT_ERR_BADOVERLAY;
+		}
 
 		poffset = strtoul(sep + 1, &endptr, 10);
-		if ((*endptr != '\0') || (endptr <= (sep + 1)))
+		if ((*endptr != '\0') || (endptr <= (sep + 1))) {
+			dtc_err("Invalid name string: %s: %s\n", value, label);
 			return -FDT_ERR_BADOVERLAY;
+		}
 
 		ret = overlay_fixup_one_phandle(fdt, fdto, symbols_off,
 						path, path_len, name, name_len,
 						poffset, label);
-		if (ret)
+		if (ret) {
+			dtc_err("failed to fixup one phandle: %s: %s: %s\n",
+				value, label, fdt_strerror(ret));
 			return ret;
+		}
 	} while (len > 0);
 
 	return 0;
@@ -516,13 +559,19 @@ static int overlay_fixup_phandles(void *fdt, void *fdto)
 	fixups_off = fdt_path_offset(fdto, "/__fixups__");
 	if (fixups_off == -FDT_ERR_NOTFOUND)
 		return 0; /* nothing to do */
-	if (fixups_off < 0)
+	if (fixups_off < 0) {
+		dtc_err("Failed to get fixups offset (%s)\n",
+			fdt_strerror(fixups_off));
 		return fixups_off;
+	}
 
 	/* And base DTs without symbols */
 	symbols_off = fdt_path_offset(fdt, "/__symbols__");
-	if ((symbols_off < 0 && (symbols_off != -FDT_ERR_NOTFOUND)))
+	if ((symbols_off < 0 && (symbols_off != -FDT_ERR_NOTFOUND))) {
+		dtc_err("Failed to get symbols offset (%s)\n",
+			fdt_strerror(symbols_off));
 		return symbols_off;
+	}
 
 	fdt_for_each_property_offset(property, fdto, fixups_off) {
 		int ret;
@@ -633,16 +682,27 @@ static int overlay_merge(void *fdt, void *fdto)
 		if (overlay == -FDT_ERR_NOTFOUND)
 			continue;
 
-		if (overlay < 0)
+		if (overlay < 0) {
+			dtc_err("Failed to find __overlay__ tag (%d: %s)\n",
+				fragment, fdt_strerror(overlay));
 			return overlay;
+		}
 
 		target = overlay_get_target(fdt, fdto, fragment, NULL);
-		if (target < 0)
+		if (target < 0) {
+			dtc_err("Failed to retrieve fragment's target (%d: %s)\n",
+				fragment, fdt_strerror(target));
 			return target;
+		}
 
 		ret = overlay_apply_node(fdt, target, fdto, overlay);
-		if (ret)
+		if (ret) {
+			if (ret != -FDT_ERR_NOSPACE) {
+				dtc_err("Failed to apply overlay node (%d: %d: %s)\n",
+					fragment, target, fdt_strerror(ret));
+			}
 			return ret;
+		}
 	}
 
 	return 0;
@@ -718,24 +778,35 @@ static int overlay_symbol_update(void *fdt, void *fdto)
 		root_sym = fdt_add_subnode(fdt, 0, "__symbols__");
 
 	/* any error is fatal now */
-	if (root_sym < 0)
+	if (root_sym < 0) {
+		dtc_err("Failed to get root __symbols__ (%s)\n",
+			fdt_strerror(root_sym));
 		return root_sym;
+	}
 
 	/* iterate over each overlay symbol */
 	fdt_for_each_property_offset(prop, fdto, ov_sym) {
 		path = fdt_getprop_by_offset(fdto, prop, &name, &path_len);
-		if (!path)
+		if (!path) {
+			dtc_err("Failed to get prop by offset (%s)\n",
+				fdt_strerror(path_len));
 			return path_len;
+		}
 
 		/* verify it's a string property (terminated by a single \0) */
-		if (path_len < 1 || memchr(path, '\0', path_len) != &path[path_len - 1])
+		if (path_len < 1 || memchr(path, '\0', path_len) != &path[path_len - 1]) {
+			dtc_err("Invalid property (%d)\n", path_len);
 			return -FDT_ERR_BADVALUE;
+		}
 
 		/* keep end marker to avoid strlen() */
 		e = path + path_len;
 
-		if (*path != '/')
+		if (*path != '/') {
+			dtc_err("Path should start with '/' (%s : %s)\n", path,
+				name);
 			return -FDT_ERR_BADVALUE;
+		}
 
 		/* get fragment name first */
 		s = strchr(path + 1, '/');
@@ -769,26 +840,38 @@ static int overlay_symbol_update(void *fdt, void *fdto)
 		ret = fdt_subnode_offset_namelen(fdto, 0, frag_name,
 					       frag_name_len);
 		/* not found? */
-		if (ret < 0)
+		if (ret < 0) {
+			dtc_err("Failed to find fragment index (%s: %s: %d)\n",
+				path, frag_name, ret);
 			return -FDT_ERR_BADOVERLAY;
+		}
 		fragment = ret;
 
 		/* an __overlay__ subnode must exist */
 		ret = fdt_subnode_offset(fdto, fragment, "__overlay__");
-		if (ret < 0)
+		if (ret < 0) {
+			dtc_err("Failed to find __overlay__ subnode (%s: %s: %d)\n",
+				path, frag_name, ret);
 			return -FDT_ERR_BADOVERLAY;
+		}
 
 		/* get the target of the fragment */
 		ret = overlay_get_target(fdt, fdto, fragment, &target_path);
-		if (ret < 0)
+		if (ret < 0) {
+			dtc_err("Failed to get target for the fragment (%s: %s: %d)\n",
+				path, frag_name, ret);
 			return ret;
+		}
 		target = ret;
 
 		/* if we have a target path use */
 		if (!target_path) {
 			ret = get_path_len(fdt, target);
-			if (ret < 0)
+			if (ret < 0) {
+				dtc_err("Failed to get path length (%s: %s: %d)\n",
+					path, name, ret);
 				return ret;
+			}
 			len = ret;
 		} else {
 			len = strlen(target_path);
@@ -796,14 +879,20 @@ static int overlay_symbol_update(void *fdt, void *fdto)
 
 		ret = fdt_setprop_placeholder(fdt, root_sym, name,
 				len + (len > 1) + rel_path_len + 1, &p);
-		if (ret < 0)
+		if (ret < 0) {
+			dtc_err("Failed to set prop placeholder (%s: %s: %d)\n",
+				path, name, ret);
 			return ret;
+		}
 
 		if (!target_path) {
 			/* again in case setprop_placeholder changed it */
 			ret = overlay_get_target(fdt, fdto, fragment, &target_path);
-			if (ret < 0)
+			if (ret < 0) {
+				dtc_err("Failed to get target (%s: %s: %d)\n",
+					path, name, ret);
 				return ret;
+			}
 			target = ret;
 		}
 
@@ -811,8 +900,11 @@ static int overlay_symbol_update(void *fdt, void *fdto)
 		if (len > 1) { /* target is not root */
 			if (!target_path) {
 				ret = fdt_get_path(fdt, target, buf, len + 1);
-				if (ret < 0)
+				if (ret < 0) {
+					dtc_err("Failed to get target path (%s: %s: %d)\n",
+						path, name, ret);
 					return ret;
+				}
 			} else
 				memcpy(buf, target_path, len + 1);
 
@@ -836,8 +928,10 @@ int fdt_overlay_apply(void *fdt, void *fdto)
 	FDT_RO_PROBE(fdto);
 
 	ret = fdt_find_max_phandle(fdt, &delta);
-	if (ret)
+	if (ret) {
+		dtc_err("Failed to find max phandle (%s)\n", fdt_strerror(ret));
 		goto err;
+	}
 
 	ret = overlay_adjust_local_phandles(fdto, delta);
 	if (ret)
-- 
2.25.0.rc1.19.g042ed3e048af

