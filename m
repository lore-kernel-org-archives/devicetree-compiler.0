From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 3/6] libfdt: Sync up with upstream
Date: Sun,  2 Oct 2016 17:59:27 -0600
Message-ID: <1475452771-16230-4-git-send-email-sjg@chromium.org>
References: <1475452771-16230-1-git-send-email-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=MKYMEaun7ZptS3eKAdKLkC/tY8Bv9YWlIeFPQ/6I0lw=;
        b=lvHdP+Jfn8A242rsvGdZn9Y+xbyIMTlD81hO+Gq61pIW3JnVRUPnH3xCF+9CCWMv+f
         v9Vsb2Rq5/7v/RoJGlnslke9QzZh3EkFAIzG1RdpcW8R1CTyRzeKlcD3ALzyyVLT2oVr
         1vCuBgoDY27xOqgbIu6qUUEqCFJ1MwxXeSMkFDWyfT8ERH4mABnD0YkzBqUNC5SqCclH
         OIZ8hFDtPBgMnMRqfpu5o3OlbrXof17EzaTkTbe000i0C+XCI635ofLbJuR5Ndng4gxf
         XRoWD9Gv9kI7lNmmY+AmKxNSqQ2PQbB8A0qbeHZsz5cuqk8tZ3ptLes8hQTZaG2CxLva
         8JMA==
In-Reply-To: <1475452771-16230-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

This includes small changes to the following functions, from upstream
commit 6d1832c:

- fdt_get_max_phandle() (upstream commit 84e0e134)
- fdt_node_check_compatible (upstream commit 53bf130b)
- fdt_setprop_inplace_namelen_partial() to remove useless brackets and
     use idx instead of index
- _fdt_resize_property() to use idx instead of index
- _fdt_splice() (upstream commit d4c7c25c)

It also includes various typo fixes in libfdt.h

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

 include/libfdt.h     | 77 ++++++++++++++++++++++++++++++----------------------
 lib/libfdt/fdt_ro.c  | 10 +++----
 lib/libfdt/fdt_rw.c  |  4 ++-
 lib/libfdt/fdt_wip.c |  6 ++--
 4 files changed, 55 insertions(+), 42 deletions(-)

diff --git a/include/libfdt.h b/include/libfdt.h
index b6a400a..3b1c788 100644
--- a/include/libfdt.h
+++ b/include/libfdt.h
@@ -61,7 +61,7 @@
 #define FDT_ERR_NOTFOUND	1
 	/* FDT_ERR_NOTFOUND: The requested node or property does not exist */
 #define FDT_ERR_EXISTS		2
-	/* FDT_ERR_EXISTS: Attemped to create a node or property which
+	/* FDT_ERR_EXISTS: Attempted to create a node or property which
 	 * already exists */
 #define FDT_ERR_NOSPACE		3
 	/* FDT_ERR_NOSPACE: Operation needed to expand the device
@@ -213,7 +213,7 @@ int fdt_next_subnode(const void *fdt, int offset);
 #define __fdt_set_hdr(name) \
 	static inline void fdt_set_##name(void *fdt, uint32_t val) \
 	{ \
-		struct fdt_header *fdth = (struct fdt_header*)fdt; \
+		struct fdt_header *fdth = (struct fdt_header *)fdt; \
 		fdth->name = cpu_to_fdt32(val); \
 	}
 __fdt_set_hdr(magic);
@@ -288,11 +288,13 @@ const char *fdt_string(const void *fdt, int stroffset);
  * @fdt: pointer to the device tree blob
  *
  * fdt_get_max_phandle retrieves the highest phandle in the given
- * device tree
+ * device tree. This will ignore badly formatted phandles, or phandles
+ * with a value of 0 or -1.
  *
  * returns:
  *      the highest phandle on success
- *      0, if an error occurred
+ *      0, if no phandle was found in the device tree
+ *      -1, if an error occurred
  */
 uint32_t fdt_get_max_phandle(const void *fdt);
 
@@ -356,8 +358,9 @@ int fdt_subnode_offset_namelen(const void *fdt, int parentoffset,
  * returns:
  *	structure block offset of the requested subnode (>=0), on success
  *	-FDT_ERR_NOTFOUND, if the requested subnode does not exist
- *	-FDT_ERR_BADOFFSET, if parentoffset did not point to an FDT_BEGIN_NODE tag
- *      -FDT_ERR_BADMAGIC,
+ *	-FDT_ERR_BADOFFSET, if parentoffset did not point to an FDT_BEGIN_NODE
+ *		tag
+ *	-FDT_ERR_BADMAGIC,
  *	-FDT_ERR_BADVERSION,
  *	-FDT_ERR_BADSTATE,
  *	-FDT_ERR_BADSTRUCTURE,
@@ -366,13 +369,13 @@ int fdt_subnode_offset_namelen(const void *fdt, int parentoffset,
 int fdt_subnode_offset(const void *fdt, int parentoffset, const char *name);
 
 /**
- * fdt_path_offset_namelen - find a tree node based on substring
+ * fdt_path_offset_namelen - find a tree node by its full path
  * @fdt: pointer to the device tree blob
  * @path: full path of the node to locate
- * @namelen: number of characters of name to consider
+ * @namelen: number of characters of path to consider
  *
- * Identical to fdt_path_offset(), but only examine the first
- * namelen characters of path for matching the node path.
+ * Identical to fdt_path_offset(), but only consider the first namelen
+ * characters of path as the path name.
  */
 int fdt_path_offset_namelen(const void *fdt, const char *path, int namelen);
 
@@ -389,7 +392,8 @@ int fdt_path_offset_namelen(const void *fdt, const char *path, int namelen);
  * address).
  *
  * returns:
- *	structure block offset of the node with the requested path (>=0), on success
+ *	structure block offset of the node with the requested path (>=0), on
+ *		success
  *	-FDT_ERR_BADPATH, given path does not begin with '/' or is invalid
  *	-FDT_ERR_NOTFOUND, if the requested node does not exist
  *      -FDT_ERR_BADMAGIC,
@@ -416,10 +420,12 @@ static inline int fdt_path_offset(const void *fdt, const char *path)
  *
  * returns:
  *	pointer to the node's name, on success
- *		If lenp is non-NULL, *lenp contains the length of that name (>=0)
+ *		If lenp is non-NULL, *lenp contains the length of that name
+ *			(>=0)
  *	NULL, on error
  *		if lenp is non-NULL *lenp contains an error code (<0):
- *		-FDT_ERR_BADOFFSET, nodeoffset did not point to FDT_BEGIN_NODE tag
+ *		-FDT_ERR_BADOFFSET, nodeoffset did not point to FDT_BEGIN_NODE
+ *			tag
  *		-FDT_ERR_BADMAGIC,
  *		-FDT_ERR_BADVERSION,
  *		-FDT_ERR_BADSTATE, standard meanings
@@ -468,23 +474,26 @@ int fdt_first_property_offset(const void *fdt, int nodeoffset);
 int fdt_next_property_offset(const void *fdt, int offset);
 
 /**
- * fdt_for_each_property - iterate over all properties of a node
- * @property_offset:	property offset (int)
+ * fdt_for_each_property_offset - iterate over all properties of a node
+ *
+ * @property_offset:	property offset (int, lvalue)
  * @fdt:		FDT blob (const void *)
  * @node:		node offset (int)
  *
  * This is actually a wrapper around a for loop and would be used like so:
  *
- *	fdt_for_each_property(fdt, node, property) {
- *		...
- *		use property
+ *	fdt_for_each_property_offset(property, fdt, node) {
+ *		Use property
  *		...
  *	}
  *
+ *	if ((property < 0) && (property != -FDT_ERR_NOT_FOUND)) {
+ *		Error handling
+ *	}
+ *
  * Note that this is implemented as a macro and property is used as
- * iterator in the loop. It should therefore be a locally allocated
- * variable. The node variable on the other hand is never modified, so
- * it can be constant or even a literal.
+ * iterator in the loop. The node variable can be constant or even a
+ * literal.
  */
 #define fdt_for_each_property_offset(property, fdt, node)	\
 	for (property = fdt_first_property_offset(fdt, node);	\
@@ -527,8 +536,8 @@ const struct fdt_property *fdt_get_property_by_offset(const void *fdt,
  * @namelen: number of characters of name to consider
  * @lenp: pointer to an integer variable (will be overwritten) or NULL
  *
- * Identical to fdt_get_property_namelen(), but only examine the first
- * namelen characters of name for matching the property name.
+ * Identical to fdt_get_property(), but only examine the first namelen
+ * characters of name for matching the property name.
  */
 const struct fdt_property *fdt_get_property_namelen(const void *fdt,
 						    int nodeoffset,
@@ -555,7 +564,8 @@ const struct fdt_property *fdt_get_property_namelen(const void *fdt,
  *	NULL, on error
  *		if lenp is non-NULL, *lenp contains an error code (<0):
  *		-FDT_ERR_NOTFOUND, node does not have named property
- *		-FDT_ERR_BADOFFSET, nodeoffset did not point to FDT_BEGIN_NODE tag
+ *		-FDT_ERR_BADOFFSET, nodeoffset did not point to FDT_BEGIN_NODE
+ *			tag
  *		-FDT_ERR_BADMAGIC,
  *		-FDT_ERR_BADVERSION,
  *		-FDT_ERR_BADSTATE,
@@ -647,7 +657,8 @@ static inline void *fdt_getprop_namelen_w(void *fdt, int nodeoffset,
  *	NULL, on error
  *		if lenp is non-NULL, *lenp contains an error code (<0):
  *		-FDT_ERR_NOTFOUND, node does not have named property
- *		-FDT_ERR_BADOFFSET, nodeoffset did not point to FDT_BEGIN_NODE tag
+ *		-FDT_ERR_BADOFFSET, nodeoffset did not point to FDT_BEGIN_NODE
+ *			tag
  *		-FDT_ERR_BADMAGIC,
  *		-FDT_ERR_BADVERSION,
  *		-FDT_ERR_BADSTATE,
@@ -689,7 +700,7 @@ const char *fdt_get_alias_namelen(const void *fdt,
 				  const char *name, int namelen);
 
 /**
- * fdt_get_alias - retreive the path referenced by a given alias
+ * fdt_get_alias - retrieve the path referenced by a given alias
  * @fdt: pointer to the device tree blob
  * @name: name of the alias th look up
  *
@@ -749,11 +760,11 @@ int fdt_get_path(const void *fdt, int nodeoffset, char *buf, int buflen);
  * structure from the start to nodeoffset.
  *
  * returns:
-
  *	structure block offset of the node at node offset's ancestor
  *		of depth supernodedepth (>=0), on success
  *	-FDT_ERR_BADOFFSET, nodeoffset does not refer to a BEGIN_NODE tag
-*	-FDT_ERR_NOTFOUND, supernodedepth was greater than the depth of nodeoffset
+ *	-FDT_ERR_NOTFOUND, supernodedepth was greater than the depth of
+ *		nodeoffset
  *	-FDT_ERR_BADMAGIC,
  *	-FDT_ERR_BADVERSION,
  *	-FDT_ERR_BADSTATE,
@@ -1060,7 +1071,7 @@ int fdt_size_cells(const void *fdt, int nodeoffset);
  * @nodeoffset: offset of the node whose property to change
  * @name: name of the property to change
  * @namelen: number of characters of name to consider
- * @index: index of the property to change in the array
+ * @idx: index of the property to change in the array
  * @val: pointer to data to replace the property value with
  * @len: length of the property value
  *
@@ -1071,7 +1082,7 @@ int fdt_size_cells(const void *fdt, int nodeoffset);
  */
 int fdt_setprop_inplace_namelen_partial(void *fdt, int nodeoffset,
 					const char *name, int namelen,
-					uint32_t index, const void *val,
+					uint32_t idx, const void *val,
 					int len);
 
 /**
@@ -1700,9 +1711,11 @@ int fdt_add_subnode_namelen(void *fdt, int parentoffset,
  * change the offsets of some existing nodes.
 
  * returns:
- *	structure block offset of the created nodeequested subnode (>=0), on success
+ *	structure block offset of the created nodeequested subnode (>=0), on
+ *		success
  *	-FDT_ERR_NOTFOUND, if the requested subnode does not exist
- *	-FDT_ERR_BADOFFSET, if parentoffset did not point to an FDT_BEGIN_NODE tag
+ *	-FDT_ERR_BADOFFSET, if parentoffset did not point to an FDT_BEGIN_NODE
+ *		tag
  *	-FDT_ERR_EXISTS, if the node at parentoffset already has a subnode of
  *		the given name
  *	-FDT_ERR_NOSPACE, if there is insufficient free space in the
diff --git a/lib/libfdt/fdt_ro.c b/lib/libfdt/fdt_ro.c
index 9cc98db..005f267 100644
--- a/lib/libfdt/fdt_ro.c
+++ b/lib/libfdt/fdt_ro.c
@@ -60,11 +60,11 @@ uint32_t fdt_get_max_phandle(const void *fdt)
 			return max_phandle;
 
 		if (offset < 0)
-			return 0;
+			return (uint32_t)-1;
 
 		phandle = fdt_get_phandle(fdt, offset);
 		if (phandle == (uint32_t)-1)
-			return 0;
+			continue;
 
 		if (phandle > max_phandle)
 			max_phandle = phandle;
@@ -623,10 +623,8 @@ int fdt_node_check_compatible(const void *fdt, int nodeoffset,
 	prop = fdt_getprop(fdt, nodeoffset, "compatible", &len);
 	if (!prop)
 		return len;
-	if (fdt_stringlist_contains(prop, len, compatible))
-		return 0;
-	else
-		return 1;
+
+	return !fdt_stringlist_contains(prop, len, compatible);
 }
 
 int fdt_node_offset_by_compatible(const void *fdt, int startoffset,
diff --git a/lib/libfdt/fdt_rw.c b/lib/libfdt/fdt_rw.c
index 47447b2..87d4030 100644
--- a/lib/libfdt/fdt_rw.c
+++ b/lib/libfdt/fdt_rw.c
@@ -60,6 +60,8 @@ static int _fdt_splice(void *fdt, void *splicepoint, int oldlen, int newlen)
 
 	if (((p + oldlen) < p) || ((p + oldlen) > end))
 		return -FDT_ERR_BADOFFSET;
+	if ((p < (char *)fdt) || ((end - oldlen + newlen) < (char *)fdt))
+		return -FDT_ERR_BADOFFSET;
 	if ((end - oldlen + newlen) > ((char *)fdt + fdt_totalsize(fdt)))
 		return -FDT_ERR_NOSPACE;
 	memmove(p + newlen, p + oldlen, end - p - oldlen);
@@ -164,7 +166,7 @@ static int _fdt_resize_property(void *fdt, int nodeoffset, const char *name,
 	int err;
 
 	*prop = fdt_get_property_w(fdt, nodeoffset, name, &oldlen);
-	if (!(*prop))
+	if (!*prop)
 		return oldlen;
 
 	if ((err = _fdt_splice_struct(fdt, (*prop)->data, FDT_TAGALIGN(oldlen),
diff --git a/lib/libfdt/fdt_wip.c b/lib/libfdt/fdt_wip.c
index 216c512..45fb964 100644
--- a/lib/libfdt/fdt_wip.c
+++ b/lib/libfdt/fdt_wip.c
@@ -16,7 +16,7 @@
 
 int fdt_setprop_inplace_namelen_partial(void *fdt, int nodeoffset,
 					const char *name, int namelen,
-					uint32_t index, const void *val,
+					uint32_t idx, const void *val,
 					int len)
 {
 	void *propval;
@@ -27,10 +27,10 @@ int fdt_setprop_inplace_namelen_partial(void *fdt, int nodeoffset,
 	if (!propval)
 		return proplen;
 
-	if (proplen < (len + index))
+	if (proplen < (len + idx))
 		return -FDT_ERR_NOSPACE;
 
-	memcpy(propval + index, val, len);
+	memcpy((char *)propval + idx, val, len);
 	return 0;
 }
 
-- 
2.8.0.rc3.226.g39d4020
