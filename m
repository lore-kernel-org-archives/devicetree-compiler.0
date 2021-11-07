From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v4 2/4] libfdt: Add functions to find regions in an FDT
Date: Sun,  7 Nov 2021 15:43:44 -0700
Message-ID: <20211107224346.3181320-3-sjg@chromium.org>
References: <20211107224346.3181320-1-sjg@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F1k5cbwTW4Fya9nfpBzXXJOX+zdZBB7QbL9mud6EIW8=;
        b=CHvgzm15opNMFDtyJvloq3IittHucZbpuQ+nDTY3STprs+67SUL0W7O7MUY6FiEuQT
         ULCfK2D77JLmHTH3hK0b3C7QRLwq1K1NinREDfVxkQ7geG1z7nABkGLJPk6R0T7GRYwo
         8BwSGZ+BpUPMhAMBNIe2vnftBuWq9kSRppExU=
In-Reply-To: <20211107224346.3181320-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Given a set of nodes and properties, find the regions of the device tree
which describe those parts.

Tests will come as part of fdtgrep.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

Changes in v4:
- Chop back to the minimal useful functionality

Changes in v3:
- Add a feature to include all subnodes

Changes in v2:
- Add long comment explaining theory of operation
- Add more comments about the -1 return value from h_include
- Add new FDT_ERR_TOODEEP error type and use it
- Add note that changes in node/property order can cause false hash misses
- Change returned error from BADLAYOUT to BADSTRUCTURE
- Drop FDT_IS_COMPAT and pass node offset to h_include function
- Drop stale comment about names / wildcards
- Fix info->count <= info->max_regions in fdt_add_region() merge case
- Move region code to separate fdt_region.c file
- Move to a model with fdt_first_region()/fdt_next_region()
- Return FDT_ERR_BADLAYOUT error if strings block is before structure block

 libfdt/Makefile.libfdt |   2 +-
 libfdt/fdt_region.c    | 369 +++++++++++++++++++++++++++++++++++++++++
 libfdt/libfdt.h        | 223 ++++++++++++++++++++++++-
 libfdt/meson.build     |   1 +
 libfdt/version.lds     |   2 +
 5 files changed, 595 insertions(+), 2 deletions(-)
 create mode 100644 libfdt/fdt_region.c

diff --git a/libfdt/Makefile.libfdt b/libfdt/Makefile.libfdt
index b6d8fc0..45a5bf4 100644
--- a/libfdt/Makefile.libfdt
+++ b/libfdt/Makefile.libfdt
@@ -8,7 +8,7 @@ LIBFDT_soname = libfdt.$(SHAREDLIB_EXT).1
 LIBFDT_INCLUDES = fdt.h libfdt.h libfdt_env.h
 LIBFDT_VERSION = version.lds
 LIBFDT_SRCS = fdt.c fdt_ro.c fdt_wip.c fdt_sw.c fdt_rw.c fdt_strerror.c fdt_empty_tree.c \
-	fdt_addresses.c fdt_overlay.c fdt_check.c
+	fdt_addresses.c fdt_overlay.c fdt_check.c fdt_region.c
 LIBFDT_OBJS = $(LIBFDT_SRCS:%.c=%.o)
 LIBFDT_LIB = libfdt-$(DTC_VERSION).$(SHAREDLIB_EXT)
 
diff --git a/libfdt/fdt_region.c b/libfdt/fdt_region.c
new file mode 100644
index 0000000..78a006a
--- /dev/null
+++ b/libfdt/fdt_region.c
@@ -0,0 +1,369 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+/*
+ * Selection of regions of a devicetree blob
+ *
+ * Copyright 2021 Google LLC
+ * Written by Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
+ */
+
+#include "libfdt_env.h"
+
+#include <fdt.h>
+#include <libfdt.h>
+
+#include "libfdt_internal.h"
+
+/**
+ * fdt_add_region() - Add a new region to our list
+ *
+ * The region is added if there is space, but in any case we increment the
+ * count. If permitted, and the new region overlaps the last one, we merge
+ * them.
+ *
+ * @info: State information
+ * @offset: Start offset of region
+ * @size: Size of region
+ */
+static int fdt_add_region(struct fdt_region_state *info, int offset, int size)
+{
+	struct fdt_region *reg;
+
+	reg = info->region ? &info->region[info->count - 1] : NULL;
+	if (info->can_merge && info->count &&
+			info->count <= info->max_regions &&
+			reg && offset <= reg->offset + reg->size) {
+		reg->size = offset + size - reg->offset;
+	} else if (info->count++ < info->max_regions) {
+		if (reg) {
+			reg++;
+			reg->offset = offset;
+			reg->size = size;
+		}
+	} else {
+		return -1;
+	}
+
+	return 0;
+}
+
+/**
+ * fdt_include_supernodes() - Include supernodes required by this node
+ *
+ * When we decided to include a node or property which is not at the top
+ * level, this function forces the inclusion of higher level nodes. For
+ * example, given this tree:
+ *
+ * / {
+ *     testing {
+ *     }
+ * }
+ *
+ * If we decide to include testing then we need the root node to have a valid
+ * tree. This function adds those regions.
+ *
+ * @info: State information
+ * @depth: Current stack depth
+ */
+static int fdt_include_supernodes(struct fdt_region_state *info, int depth)
+{
+	int base = fdt_off_dt_struct(info->fdt);
+	int start, stop_at;
+	int i;
+
+	/*
+	 * Work down the stack looking for supernodes that we didn't include.
+	 * The algortihm here is actually pretty simple, since we know that
+	 * no previous subnode had to include these nodes, or if it did, we
+	 * marked them as included (on the stack) already.
+	 */
+	for (i = 0; i <= depth; i++) {
+		if (!info->stack[i].included) {
+			start = info->stack[i].offset;
+
+			/* Add the FDT_BEGIN_NODE tag of this supernode */
+			fdt_next_tag(info->fdt, start, &stop_at);
+			if (fdt_add_region(info, base + start,
+					stop_at - start))
+				return -1;
+
+			/* Remember that this supernode is now included */
+			info->stack[i].included = 1;
+			info->can_merge = 1;
+		}
+
+		/* Force (later) generation of the FDT_END_NODE tag */
+		if (!info->stack[i].want)
+			info->stack[i].want = WANT_NODES_ONLY;
+	}
+
+	return 0;
+}
+
+int fdt_first_region(const void *fdt, fdt_region_func h_include, void *priv,
+		     struct fdt_region *region, char *path, int path_len,
+		     int flags, struct fdt_region_state *info)
+{
+	struct fdt_region_ptrs *p = &info->ptrs;
+
+	/* Set up our state */
+	info->fdt = fdt;
+	info->can_merge = 1;
+	info->max_regions = 1;
+	info->start = -1;
+	info->path = path;
+	info->path_len = path_len;
+	info->flags = flags;
+	p->want = WANT_NOTHING;
+	p->end = path;
+	*p->end = '\0';
+	p->nextoffset = 0;
+	p->depth = -1;
+	p->done = FDT_DONE_NOTHING;
+
+	return fdt_next_region(fdt, h_include, priv, region, info);
+}
+
+/*
+ * Theory of operation
+ *
+ * Note: in this description 'included' means that a node (or other part of
+ * the tree) should be included in the region list, i.e. it will have a region
+ * which covers its part of the tree.
+ *
+ * This function maintains some state from the last time it is called. It
+ * checks the next part of the tree that it is supposed to look at
+ * (p.nextoffset) to see if that should be included or not. When it finds
+ * something to include, it sets info->start to its offset. This marks the
+ * start of the region we want to include.
+ *
+ * Once info->start is set to the start (i.e. not -1), we continue scanning
+ * until we find something that we don't want included. This will be the end
+ * of a region. At this point we can close off the region and add it to the
+ * list. So we do so, and reset info->start to -1.
+ *
+ * One complication here is that we want to merge regions. So when we come to
+ * add another region later, we may in fact merge it with the previous one if
+ * one ends where the other starts.
+ *
+ * The function fdt_add_region() will return -1 if it fails to add the region,
+ * because we already have a region ready to be returned, and the new one
+ * cannot be merged in with it. In this case, we must return the region we
+ * found, and wait for another call to this function. When it comes, we will
+ * repeat the processing of the tag and again try to add a region. This time it
+ * will succeed.
+ *
+ * The current state of the pointers (stack, offset, etc.) is maintained in
+ * a ptrs member. At the start of every loop iteration we make a copy of it.
+ * The copy is then updated as the tag is processed. Only if we get to the end
+ * of the loop iteration (and successfully call fdt_add_region() if we need
+ * to) can we commit the changes we have made to these pointers. For example,
+ * if we see an FDT_END_NODE tag we will decrement the depth value. But if we
+ * need to add a region for this tag (let's say because the previous tag is
+ * included and this FDT_END_NODE tag is not included) then we will only commit
+ * the result if we were able to add the region. That allows us to retry again
+ * next time.
+ *
+ * We keep track of a variable called 'want' which tells us what we want to
+ * include when there is no specific information provided by the h_include()
+ * function for a particular property. This basically handles the inclusion of
+ * properties which are pulled in by virtue of the node they are in. So if you
+ * include a node, its properties are also included. In this case 'want' will
+ * be WANT_NODES_AND_PROPS.
+ *
+ * Using 'want' we work out 'include', which tells us whether this current tag
+ * should be included or not. As you can imagine, if the value of 'include'
+ * changes, that means we are on a boundary between nodes to include and nodes
+ * to exclude. At this point we either close off a previous region and add it
+ * to the list, or mark the start of a new region.
+ *
+ * Apart from the nodes, we have the FDT_END tag, mem_rsvmap and the string
+ * list. The last two are not handled at present. The FDT_END tag is dealt with
+ * as a whole (i.e. we create a region for it if is to be included).
+ */
+int fdt_next_region(const void *fdt, fdt_region_func h_include, void *priv,
+		    struct fdt_region *region, struct fdt_region_state *info)
+{
+	int base = fdt_off_dt_struct(fdt);
+	int last_node = 0;
+	const char *str;
+
+	info->region = region;
+	info->count = 0;
+
+	/*
+	 * Work through the tags one by one, deciding whether each needs to
+	 * be included or not. We set the variable 'include' to indicate our
+	 * decision. 'want' is used to track what we want to include absent
+	 * further information from the h_include() function - it allows us to
+	 * pick up all the properties (and/or subnode tags) of a node that we
+	 * have been asked to include.
+	 */
+	while (info->ptrs.done < FDT_DONE_STRUCT) {
+		const struct fdt_property *prop;
+		struct fdt_region_ptrs p;
+		const char *name;
+		int include = 0;
+		int stop_at = 0;
+		uint32_t tag;
+		int offset;
+		int val;
+		int len;
+
+		/*
+		 * Make a copy of our pointers. If we make it to the end of
+		 * this block then we will commit them back to info->ptrs.
+		 * Otherwise we can try again from the same starting state
+		 * next time we are called.
+		 */
+		p = info->ptrs;
+
+		/*
+		 * Find the tag, and the offset of the next one. If we need to
+		 * stop including tags, then by default we stop *after*
+		 * including the current tag
+		 */
+		offset = p.nextoffset;
+		tag = fdt_next_tag(fdt, offset, &p.nextoffset);
+		stop_at = p.nextoffset;
+
+		switch (tag) {
+		case FDT_PROP:
+			stop_at = offset;
+			prop = fdt_get_property_by_offset(fdt, offset, NULL);
+			str = fdt_string(fdt, fdt32_to_cpu(prop->nameoff));
+			val = h_include(priv, fdt, last_node, FDT_IS_PROP, str,
+					    strlen(str) + 1);
+			if (val == -1) {
+				include = p.want >= WANT_NODES_AND_PROPS;
+			} else {
+				include = val;
+				/*
+				 * Make sure we include the } for this block.
+				 * It might be more correct to have this done
+				 * by the call to fdt_include_supernodes() in
+				 * the case where it adds the node we are
+				 * currently in, but this is equivalent.
+				 */
+				if ((info->flags & FDT_REG_SUPERNODES) && val &&
+						!p.want)
+					p.want = WANT_NODES_ONLY;
+			}
+
+			/* Value grepping is not yet supported */
+			break;
+
+		case FDT_NOP:
+			include = p.want >= WANT_NODES_AND_PROPS;
+			stop_at = offset;
+			break;
+
+		case FDT_BEGIN_NODE:
+			last_node = offset;
+			p.depth++;
+			if (p.depth == FDT_MAX_DEPTH)
+				return -FDT_ERR_TOODEEP;
+			name = fdt_get_name(fdt, offset, &len);
+			if (p.end - info->path + 2 + len >= info->path_len)
+				return -FDT_ERR_NOSPACE;
+
+			/* Build the full path of this node */
+			if (p.end != info->path + 1)
+				*p.end++ = '/';
+			strcpy(p.end, name);
+			p.end += len;
+			info->stack[p.depth].want = p.want;
+			info->stack[p.depth].offset = offset;
+
+			/*
+			 * We are not intending to include this node unless
+			 * it matches, so make sure we stop *before* its tag.
+			 */
+			stop_at = offset;
+			p.want = WANT_NOTHING;
+			val = h_include(priv, fdt, offset, FDT_IS_NODE,
+					info->path, p.end - info->path + 1);
+
+			/* Include this if requested */
+			if (val)
+				p.want = WANT_NODES_AND_PROPS;
+
+			/* If not requested, decay our 'p.want' value */
+			else if (p.want)
+				p.want--;
+
+			/* Not including this tag, so stop now */
+			else
+				stop_at = offset;
+
+			/*
+			 * Decide whether to include this tag, and update our
+			 * stack with the state for this node
+			 */
+			include = p.want;
+			info->stack[p.depth].included = include;
+			break;
+
+		case FDT_END_NODE:
+			include = p.want;
+			if (p.depth < 0)
+				return -FDT_ERR_BADSTRUCTURE;
+
+			/*
+			 * If we don't want this node, stop right away, unless
+			 * we are including subnodes
+			 */
+			if (!p.want)
+				stop_at = offset;
+			p.want = info->stack[p.depth].want;
+			p.depth--;
+			while (p.end > info->path && *--p.end != '/')
+				;
+			*p.end = '\0';
+			break;
+
+		case FDT_END:
+			/* We always include the end tag */
+			include = 1;
+			p.done = FDT_DONE_STRUCT;
+			break;
+		}
+
+		/* If this tag is to be included, mark it as region start */
+		if (include && info->start == -1) {
+			/* Include any supernodes required by this one */
+			if (info->flags & FDT_REG_SUPERNODES) {
+				if (fdt_include_supernodes(info, p.depth))
+					return 0;
+			}
+			info->start = offset;
+		}
+
+		/*
+		 * If this tag is not to be included, finish up the current
+		 * region.
+		 */
+		if (!include && info->start != -1) {
+			if (fdt_add_region(info, base + info->start,
+				       stop_at - info->start))
+				return 0;
+			info->start = -1;
+			info->can_merge = 1;
+		}
+
+		/* If we have made it this far, we can commit our pointers */
+		info->ptrs = p;
+	}
+
+	/* Add a region for the END tag and a separate one for string table */
+	if (info->ptrs.done < FDT_DONE_END) {
+		if (info->ptrs.nextoffset != (int)fdt_size_dt_struct(fdt))
+			return -FDT_ERR_BADSTRUCTURE;
+
+		if (fdt_add_region(info, base + info->start,
+			       info->ptrs.nextoffset - info->start))
+			return 0;
+		info->ptrs.done++;
+	}
+
+	return info->count > 0 ? 0 : -FDT_ERR_NOTFOUND;
+}
diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index 7f117e8..dcac768 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -106,7 +106,12 @@ extern "C" {
 	/* FDT_ERR_ALIGNMENT: The device tree base address is not 8-byte
 	 * aligned. */
 
-#define FDT_ERR_MAX		19
+#define FDT_ERR_TOODEEP		20
+	/* FDT_ERR_TOODEEP: The depth of a node has exceeded the internal
+	 * libfdt limit. This can happen if you have more than
+	 * FDT_MAX_DEPTH nested nodes. */
+
+#define FDT_ERR_MAX		20
 
 /* constants */
 #define FDT_MAX_PHANDLE 0xfffffffe
@@ -2122,6 +2127,222 @@ int fdt_overlay_apply(void *fdt, void *fdto);
 
 const char *fdt_strerror(int errval);
 
+#ifndef SWIG /* Regions are not yet supported in Python */
+
+/*
+ * The following struction are for for internal libfdt use. Callers may use
+ * struct fdt_region_state for the purpose of allocating a struct to pass to
+ * fdt_first_region()/
+ *
+ * This is to avoid calling malloc(), or requiring libfdt to return the number
+ * of bytes needed for this struct.
+ */
+
+/**
+ * struct fdt_region - A region within the device tree
+ *
+ * @offset: Start offset in bytes from the start of the device tree
+ * @size: Size in bytes
+ */
+struct fdt_region {
+	int offset;
+	int size;
+};
+
+#define FDT_ANY_GLOBAL			(FDT_IS_NODE | FDT_IS_PROP)
+#define FDT_IS_ANY			0x3		/* all the above */
+
+/* We set a reasonable limit on the number of nested nodes */
+#define FDT_MAX_DEPTH			32
+
+/* Decribes what we want to include from the current tag */
+enum want_t {
+	WANT_NOTHING,
+	WANT_NODES_ONLY,		/* No properties */
+	WANT_NODES_AND_PROPS,		/* Everything for one level */
+};
+
+/* Keeps track of the state at parent nodes */
+struct fdt_subnode_stack {
+	int offset;		/* Offset of node */
+	enum want_t want;	/* The 'want' value here */
+	int included;		/* 1 if we included this node, 0 if not */
+};
+
+/* enum fdt_region_done_t - current state of progress through the dtb */
+enum fdt_region_done_t {
+	FDT_DONE_NOTHING,		/* Working on 'struct' region */
+	FDT_DONE_STRUCT,		/* Finished the 'struct' region */
+	FDT_DONE_END,			/* Finished the 'end' tag */
+};
+
+/* struct fdt_region_ptrs - Keeps track of all the position pointers */
+struct fdt_region_ptrs {
+	int depth;			/* Current tree depth */
+	enum fdt_region_done_t done;	/* What we have completed scanning */
+	enum want_t want;		/* What we are currently including */
+	char *end;			/* Pointer to end of full node path */
+	int nextoffset;			/* Next node offset to check */
+};
+
+/* The state of our finding algortihm */
+struct fdt_region_state {
+	struct fdt_subnode_stack stack[FDT_MAX_DEPTH];	/* node stack */
+	struct fdt_region *region;	/* Contains list of regions found */
+	int count;			/* Numnber of regions found */
+	const void *fdt;		/* FDT blob */
+	int max_regions;		/* Maximum regions to find */
+	int can_merge;		/* 1 if we can merge with previous region */
+	int start;			/* Start position of current region */
+	struct fdt_region_ptrs ptrs;	/* Pointers for what we are up to */
+
+	/* These hold information passed in to fdt_first_region(): */
+	int flags;
+	char *path;
+	int path_len;
+};
+
+/*
+ * Flags for region finding
+ *
+ * Add all supernodes of a matching node/property, useful for creating a
+ * valid subset tree
+ */
+#define FDT_REG_SUPERNODES		(1 << 0)
+
+/* Indicates what an fdt part is (node, property) in call to fdt_region_func */
+#define FDT_IS_NODE			(1 << 0)
+#define FDT_IS_PROP			(1 << 1)
+
+/**
+ * fdt_region_func: Determine whether to include a part or not
+ *
+ * This function is provided by the caller to fdt_first/next_region(). It is
+ * called repeatedly for each device tree element to find out whether it should
+ * be included or not. Every node will generate a call with @type == FDT_IS_NODE
+ * and every property will generate a call with @type = FDT_IS_PROP
+ *
+ * @priv: Private pointer as passed to fdt_find_regions()
+ * @fdt: Pointer to FDT blob
+ * @offset: Offset of this node / property
+ * @type: Type of this part, FDT_IS_...
+ * @data: Pointer to data (full path of node / property name)
+ * @size: Size of data (length of node path / property including \0 terminator
+ * @return 0 to exclude, 1 to include, -1 if no information is available
+ */
+typedef int (*fdt_region_func)(void *priv, const void *fdt, int offset,
+			       int type, const char *data, int size);
+
+/**
+ * fdt_first_region() - find regions in device tree
+ *
+ * Given a nodes and properties to include and properties to exclude, find
+ * the regions of the device tree which describe those included parts.
+ *
+ * The use for this function is twofold. Firstly it provides a convenient
+ * way of performing a structure-aware grep of the tree. For example it is
+ * possible to grep for a node and get all the properties associated with
+ * that node. Trees can be subsetted easily, by specifying the nodes that
+ * are required, and then writing out the regions returned by this function.
+ * This is useful for small resource-constrained systems, such as boot
+ * loaders, which want to use an FDT but do not need to know about all of
+ * it.
+ *
+ * Secondly it makes it easy to hash parts of the tree and detect changes.
+ * The intent is to get a list of regions which will be invariant provided
+ * those parts are invariant. For example, if you request a list of regions
+ * for all nodes but exclude the property "data", then you will get the
+ * same region contents regardless of any change to "data" properties.
+ *
+ * This function can be used to produce a byte-stream to send to a hashing
+ * function to verify that critical parts of the FDT have not changed.
+ * Note that semantically null changes in order could still cause false
+ * hash misses. Such reordering might happen if the tree is regenerated
+ * from source, and nodes are reordered (the bytes-stream will be emitted
+ * in a different order and many hash functions will detect this). However
+ * if an existing tree is modified using libfdt functions, such as
+ * fdt_add_subnode() and fdt_setprop(), then this problem is avoided.
+ *
+ * The nodes/properties to include/exclude are defined by a function
+ * provided by the caller. This function is called for each node and
+ * property, and must return:
+ *
+ *    0 - to exclude this part
+ *    1 - to include this part
+ *   -1 - for FDT_IS_PROP only: no information is available, so include
+ *		if its containing node is included
+ *
+ * The last case is only used to deal with properties. Often a property is
+ * included if its containing node is included - this is the case where
+ * -1 is returned.. However if the property is specifically required to be
+ * included/excluded, then 0 or 1 can be returned. Note that including a
+ * property when the FDT_REG_SUPERNODES flag is given will force its
+ * containing node to be included since it is not valid to have a property
+ * that is not in a node.
+ *
+ * Using the information provided, the inclusion of a node can be controlled
+ * either by a node name or its compatible string, or any other property
+ * that the function can determine.
+ *
+ * As an example, including node "/" means to include the root node and all
+ * root properties. A flag provides a way of also including supernodes (of
+ * which there is none for the root node), and another flag includes
+ * immediate subnodes, so in this case we would get the FDT_BEGIN_NODE and
+ * FDT_END_NODE of all subnodes of /.
+ *
+ * The subnode feature helps in a hashing situation since it prevents the
+ * root node from changing at all. Any change to non-excluded properties,
+ * names of subnodes or number of subnodes would be detected.
+ *
+ * When used with Flat Image Trees (FITs) this provides the ability to hash and
+ * sign parts of * the FIT based on different configurations in the FIT. Then it
+ * is * impossible to change anything about that configuration (include images
+ * attached to the configuration), but it may be possible to add new
+ * configurations, new images or new signatures within the existing
+ * framework.
+ *
+ * The device tree header is not included in the region list. Since the
+ * contents of the FDT are changing (shrinking, often), the caller will need
+ * to regenerate the header anyway.
+ *
+ * @fdt:	Device tree to check
+ * @h_include:	Function to call to determine whether to include a part or
+ *		not
+ * @priv:	Private pointer passed to h_include
+ * @region:	Returns first region found
+ * @path:	Pointer to a temporary string for the function to use for
+ *		building path names
+ * @path_len:	Length of path, must be large enough to hold the longest
+ *		path in the tree
+ * @flags:	Various flags that control the region algortihm, see
+ *		FDT_REG_...
+ * @return 0, on success
+ *	-FDT_ERR_BADSTRUCTURE (too deep or more END tags than BEGIN tags
+ *	-FDT_ERR_BADLAYOUT
+ *	-FDT_ERR_NOSPACE (path area is too small)
+ *	-FDT_ERR_TOODEEP if the tree is too deep
+ */
+int fdt_first_region(const void *fdt, fdt_region_func h_include,
+		     void *priv, struct fdt_region *region,
+		     char *path, int path_len, int flags,
+		     struct fdt_region_state *info);
+
+/** fdt_next_region() - find next region
+ *
+ * See fdt_first_region() for full description. This function finds the
+ * next region according to the provided parameters, which must be the same
+ * as passed to fdt_first_region().
+ *
+ * The flags value is used unchanged from the call to fdt_first_region().
+ *
+ * This function can additionally return -FDT_ERR_NOTFOUND when there are no
+ * more regions
+ */
+int fdt_next_region(const void *fdt, fdt_region_func h_include,
+		    void *priv, struct fdt_region *region,
+		    struct fdt_region_state *info);
+#endif /* SWIG */
+
 #ifdef __cplusplus
 }
 #endif
diff --git a/libfdt/meson.build b/libfdt/meson.build
index 0307ffb..d0c39dd 100644
--- a/libfdt/meson.build
+++ b/libfdt/meson.build
@@ -9,6 +9,7 @@ sources = files(
   'fdt_check.c',
   'fdt_empty_tree.c',
   'fdt_overlay.c',
+  'fdt_region.c',
   'fdt_ro.c',
   'fdt_rw.c',
   'fdt_strerror.c',
diff --git a/libfdt/version.lds b/libfdt/version.lds
index 7ab85f1..365d560 100644
--- a/libfdt/version.lds
+++ b/libfdt/version.lds
@@ -77,6 +77,8 @@ LIBFDT_1.2 {
 		fdt_appendprop_addrrange;
 		fdt_setprop_inplace_namelen_partial;
 		fdt_create_with_flags;
+                fdt_first_region;
+                fdt_next_region;
 	local:
 		*;
 };
-- 
2.34.0.rc0.344.g81b53c2807-goog

