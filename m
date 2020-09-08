From: Gurbir Arora <gurbaror-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH v2 2/6] libfdt: overlay_merge: Rename fragments
Date: Tue,  8 Sep 2020 12:33:32 -0700
Message-ID: <1599593616-308872-3-git-send-email-gurbaror@codeaurora.org>
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

When merging two overlay blobs, fragment nodes whose target node can't be found
in base blob would need to be retained as-is (including the fragment names) in
the combined blob. Such unresolved symbols will also need to be listed in
__fixups__ section of combined blob. This could lead to name comflicts in
combined blob (two nodes with same name/path such as /fragment@0).

To avoid such name conflicts in combined blob, rename all fragment@xyz in
overlay blob as fragment@xyz+delta, where delta is the maximum count of fragment
nodes found in base blob

Signed-off-by: Srivatsa Vaddagiri <vatsa-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 libfdt/fdt_overlay.c | 329 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 329 insertions(+)

diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
index 65d7a29..d7d6f03 100644
--- a/libfdt/fdt_overlay.c
+++ b/libfdt/fdt_overlay.c
@@ -8,9 +8,12 @@
 
 #include <fdt.h>
 #include <libfdt.h>
+#include <stdio.h>
 
 #include "libfdt_internal.h"
 
+#define ULONG_MAX	(~0UL)
+
 /**
  * overlay_get_target_phandle - retrieves the target phandle of a fragment
  * @fdto: pointer to the device tree overlay blob
@@ -880,6 +883,325 @@ err:
 	return ret;
 }
 
+/*
+ * Property value could be in this format
+ *	fragment@M ...fragment@N....fragment@O..
+ *
+ * This needs to be converted to
+ *	fragment@M+delta...fragment@N+delta....fragment@O+delta
+ */
+static int rename_fragments_in_property(void *fdto, int offset,
+					int property, int delta)
+{
+	char *start, *sep, *end, *stop, *value;
+	int needed = 0, ret, len, found = 0, available, diff;
+	unsigned long index, new_index;
+	void *p = NULL;
+	const char *label;
+
+	value = (char *)(uintptr_t)fdt_getprop_by_offset(fdto, property,
+				      &label, &len);
+	if (!value)
+		return len;
+
+	start = value;
+	end = value + len;
+
+	/* Find the required additional space */
+	while (start < end) {
+		sep = memchr(start, '@', (end - start));
+		if (!sep) {
+			needed += end - start;
+			break;
+		}
+
+		/* Check if string "fragment" exists */
+		sep -= 8;
+
+		if (sep < start || strncmp(sep, "fragment", 8)) {
+			/* Start scan again after '@' */
+			sep = sep + 9;
+			needed += (sep - start);
+			start = sep;
+			continue;
+		}
+
+		found = 1;
+		sep += 9;
+		needed += (sep - start);
+		index = strtoul(sep, &stop, 10);
+		if (ULONG_MAX - index < delta)
+			return -FDT_ERR_BADVALUE;
+
+		new_index = index + delta;
+		needed += snprintf(NULL, 0, "%lu", new_index);
+		start = stop;
+	}
+
+	if (!found)
+		return 0;
+
+	p = value;
+	if (needed > len) {
+		ret = fdt_setprop_placeholder(fdto, offset, label, needed, &p);
+		if (ret < 0)
+			return ret;
+		len = needed;
+	}
+
+	start = p;
+	end = start + len;
+	ret = 0;
+
+	while (start < end) {
+		sep = memchr(start, '@', (end - start));
+		if (!sep)
+			break;
+
+		/* Check if string "fragment" exists */
+		sep -= 8;
+		if (sep < start || strncmp(sep, "fragment", 8)) {
+			/* Start scan again after '@' */
+			start = sep + 9;
+			continue;
+		}
+
+		sep += 9;
+		index = strtoul(sep, &stop, 10);
+		new_index = index + delta;
+
+		needed = snprintf(NULL, 0, "%lu", new_index);
+		available = stop - sep;
+
+		if (available < needed) {
+			diff = needed - available;
+			memmove(stop + diff, stop, (end - stop));
+		}
+
+		{
+			/* +1 for NULL char */
+			char buf[needed + 1];
+
+			snprintf(buf, needed + 1, "%lu", new_index);
+			memcpy(sep, buf, needed);
+		}
+
+		start = sep + needed;
+	}
+
+	return 0;
+}
+
+/**
+ * rename_fragments_in_node - Rename fragment@xyz instances in a node's
+ * properties
+ *
+ * @fdto    - pointer to a device-tree blob
+ * @nodename - Node in whose properties fragments need to be renamed
+ * @delta   - Increment to be applied to fragment index
+ */
+static int rename_fragments_in_node(void *fdto, const char *nodename,
+				     unsigned long delta)
+{
+	int offset, property;
+	int ret;
+
+	offset = fdt_path_offset(fdto, nodename);
+	if (offset < 0)
+		return offset;
+
+	fdt_for_each_property_offset(property, fdto, offset) {
+		ret = rename_fragments_in_property(fdto, offset,
+						   property, delta);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * rename_nodes - Rename all fragement@xyz nodes
+ *
+ * @fdto - pointer to device-tree blob
+ * @parent_node - node offset of parent whose child fragment nodes need to be
+ *		renamed
+ * @delta - increment to be added to fragment number
+ */
+static int rename_nodes(void *fdto, int parent_node, unsigned long delta)
+{
+	int offset = -1, ret, len, strsize;
+	int child_len, child_offset;
+	const char *name, *child_name, *idx;
+	char *stop = NULL;
+	unsigned long index, new_index;
+
+	offset = fdt_first_subnode(fdto, parent_node);
+	while (offset >= 0) {
+		name = fdt_get_name(fdto, offset, &len);
+		if (!name)
+			return len;
+
+		if (len < 9 || strncmp(name, "fragment@", 9))
+			goto next_node;
+
+		child_offset = fdt_first_subnode(fdto, offset);
+		if (child_offset < 0)
+			return child_offset;
+
+		child_name = fdt_get_name(fdto, child_offset, &child_len);
+		if (!child_name)
+			return child_len;
+
+		/* Extra FDT_TAGSIZE bytes for expanded node name */
+		strsize = FDT_TAGALIGN(len + 1 + FDT_TAGSIZE);
+
+		if (child_len >= 11 && !strncmp(child_name, "__overlay__", 11)){
+			char new_name[strsize];
+
+			idx = name + 9;
+			stop = NULL;
+			index = strtoul(idx, &stop, 10);
+			if (ULONG_MAX - delta < index)
+				return -FDT_ERR_BADVALUE;
+
+			new_index = index + delta;
+			ret = snprintf(new_name, sizeof(new_name),
+				       "fragment@%lu", new_index);
+			if (ret >= sizeof(new_name))
+				return -FDT_ERR_BADVALUE;
+
+			ret = fdt_set_name(fdto, offset, new_name);
+			if (ret < 0)
+				return ret;
+		}
+
+next_node:
+		offset = fdt_next_subnode(fdto, offset);
+	}
+
+	return 0;
+}
+
+/* Return maximum count of overlay fragments */
+static int count_fragments(void *fdt, unsigned long *max_base_fragments)
+{
+	int offset = -1, child_offset, child_len, len, found = 0;
+	const char *name, *child_name, *idx;
+	char *stop;
+	unsigned long index, max = 0;
+
+	offset = fdt_first_subnode(fdt, 0);
+	while (offset >= 0) {
+		name = fdt_get_name(fdt, offset, &len);
+		if (!name)
+			return len;
+
+		if (len < 9 || strncmp(name, "fragment@", 9))
+			goto next_node;
+
+		child_offset = fdt_first_subnode(fdt, offset);
+		if (child_offset < 0)
+			return child_offset;
+
+		child_name = fdt_get_name(fdt, child_offset, &child_len);
+		if (!child_name)
+			return child_len;
+
+		if (child_len < 11 || strncmp(child_name, "__overlay__", 11))
+			goto next_node;
+
+		found = 1;
+		idx = name + 9;
+		index = strtoul(idx, &stop, 10);
+		if (index > max)
+			max = index;
+next_node:
+		offset = fdt_next_subnode(fdt, offset);
+	}
+
+	if (!found)
+		return -FDT_ERR_NOTFOUND;
+
+	*max_base_fragments = max;
+
+	return 0;
+}
+
+/*
+ * Merging two overlay blobs involves copying some of the overlay fragment nodes
+ * (named as fragment@xyz) from second overlay blob into first, which can lead
+ * to naming conflicts (ex: two nodes of same name /fragment@0). To prevent such
+ * naming conflicts, rename all occurences of fragment@xyz in second overlay
+ * blob as fragment@xyz+delta, where delta is the maximum overlay fragments seen
+ * in first overlay blob
+ */
+static int overlay_rename_fragments(void *fdt, void *fdto)
+{
+	int ret, local_offset;
+	unsigned long max_base_fragments = 0;
+
+	ret = count_fragments(fdt, &max_base_fragments);
+	if (ret < 0)
+		return ret;
+
+	max_base_fragments += 1;
+	ret = rename_nodes(fdto, 0, max_base_fragments);
+	if (ret < 0)
+		return ret;
+
+	ret = rename_fragments_in_node(fdto, "/__fixups__", max_base_fragments);
+	if (ret < 0)
+		return ret;
+
+	ret = rename_fragments_in_node(fdto, "/__symbols__",
+						max_base_fragments);
+	if (ret < 0 && ret != -FDT_ERR_NOTFOUND)
+		return ret;
+
+	/*
+	 * renaming fragments in __local_fixups__ node's properties should be
+	 * covered by rename_nodes()
+	 */
+	local_offset = fdt_path_offset(fdto, "/__local_fixups__");
+	if (local_offset >= 0)
+		ret = rename_nodes(fdto, local_offset, max_base_fragments);
+
+	if (ret == -FDT_ERR_NOTFOUND)
+		ret = 0;
+
+	return ret;
+}
+
+/* merge a node's properties from fdto to fdt */
+static int overlay_merge_node_properties(void *fdt,
+					void *fdto, const char *nodename)
+{
+	int fdto_offset, ret;
+
+	fdto_offset = fdt_path_offset(fdto, nodename);
+	if (fdto_offset < 0)
+		return fdto_offset;
+
+	ret = copy_node(fdt, fdto, 0, fdto_offset);
+
+	return ret;
+}
+
+static int overlay_merge_local_fixups(void *fdt, void *fdto)
+{
+	int fdto_local_fixups, ret;
+
+	fdto_local_fixups = fdt_path_offset(fdto, "/__local_fixups__");
+	if (fdto_local_fixups < 0)
+		return fdto_local_fixups;
+
+	ret = copy_node(fdt, fdto, 0, fdto_local_fixups);
+}
+
 int fdt_overlay_merge(void *fdt, void *fdto, int *fdto_nospace)
 {
 	uint32_t delta = fdt_get_max_phandle(fdt);
@@ -890,6 +1212,13 @@ int fdt_overlay_merge(void *fdt, void *fdto, int *fdto_nospace)
 
 	*fdto_nospace = 0;
 
+	ret = overlay_rename_fragments(fdt, fdto);
+	if (ret) {
+		if (ret == -FDT_ERR_NOSPACE)
+			*fdto_nospace = 1;
+		goto err;
+	}
+
 	ret = overlay_adjust_local_phandles(fdto, delta);
 	if (ret)
 		goto err;
-- 
2.7.4

