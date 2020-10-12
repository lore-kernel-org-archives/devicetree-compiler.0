From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH] libfdt: Fix kernel-doc comments
Date: Mon, 12 Oct 2020 17:53:31 +0100
Message-ID: <20201012165331.25016-1-andre.przywara@arm.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

The API documentation in libfdt.h seems to follow the Linux kernel's
kernel-doc format[1].

Running "scripts/kernel-doc -v -none" on the file reports some problems,
mostly missing return values and missing parameter descriptions.

Fix those up by providing the missing bits, and fixing the other small
issues reported by the script.

Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/doc-guide/kernel-doc.rst
---
Hi,

this is just the basic low-hanging fruit part of the exercise. I refrained
from changing "returns:" to the canonical "Return:", as this seems to be
accepted by the kernel-doc script as well.

There is more potential work to be done to make this proper kernel-doc:
- "kernel-doc-ify" the error code descriptions (-FDT_ERR_*)
- Properly format the return value listings (they become all one line atm.)
- Mark parameters with "@" in the function descriptions
- Cosmetics like changing "returns:" to "Return:"

I don't have a Sphinx toolchain installed at the moment (my box wanted to
take the afternoon off to install all dependencies), but this has the
potential of creating the long lost, neatly formated libfdt API
documentation, which could be put to readthedocs, for instance.

Happy to provide some fixes, if we want to go forward with this.

Cheers,
Andre

 libfdt/libfdt.h | 111 ++++++++++++++++++++++++++++++++----------------
 1 file changed, 75 insertions(+), 36 deletions(-)

diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index 544d3ef..5979832 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -184,23 +184,23 @@ int fdt_next_node(const void *fdt, int offset, int *depth);
 
 /**
  * fdt_first_subnode() - get offset of first direct subnode
- *
  * @fdt:	FDT blob
  * @offset:	Offset of node to check
- * @return offset of first subnode, or -FDT_ERR_NOTFOUND if there is none
+ *
+ * Return: offset of first subnode, or -FDT_ERR_NOTFOUND if there is none
  */
 int fdt_first_subnode(const void *fdt, int offset);
 
 /**
  * fdt_next_subnode() - get offset of next direct subnode
+ * @fdt:	FDT blob
+ * @offset:	Offset of previous subnode
  *
  * After first calling fdt_first_subnode(), call this function repeatedly to
  * get direct subnodes of a parent node.
  *
- * @fdt:	FDT blob
- * @offset:	Offset of previous subnode
- * @return offset of next subnode, or -FDT_ERR_NOTFOUND if there are no more
- * subnodes
+ * Return: offset of next subnode, or -FDT_ERR_NOTFOUND if there are no more
+ *         subnodes
  */
 int fdt_next_subnode(const void *fdt, int offset);
 
@@ -225,7 +225,6 @@ int fdt_next_subnode(const void *fdt, int offset);
  * Note that this is implemented as a macro and @node is used as
  * iterator in the loop. The parent variable be constant or even a
  * literal.
- *
  */
 #define fdt_for_each_subnode(node, fdt, parent)		\
 	for (node = fdt_first_subnode(fdt, parent);	\
@@ -269,17 +268,21 @@ fdt_set_hdr_(size_dt_struct);
 /**
  * fdt_header_size - return the size of the tree's header
  * @fdt: pointer to a flattened device tree
+ *
+ * Return: size of DTB header in bytes
  */
 size_t fdt_header_size(const void *fdt);
 
 /**
- * fdt_header_size_ - internal function which takes a version number
+ * fdt_header_size_ - internal function to get header size from a version number
+ * @version: devicetree version number
+ *
+ * Return: size of DTB header in bytes
  */
 size_t fdt_header_size_(uint32_t version);
 
 /**
  * fdt_check_header - sanity check a device tree header
-
  * @fdt: pointer to data which might be a flattened device tree
  *
  * fdt_check_header() checks that the given buffer contains what
@@ -404,8 +407,7 @@ static inline uint32_t fdt_get_max_phandle(const void *fdt)
  * highest phandle value in the device tree blob) will be returned in the
  * @phandle parameter.
  *
- * Returns:
- *   0 on success or a negative error-code on failure
+ * Return: 0 on success or a negative error-code on failure
  */
 int fdt_generate_phandle(const void *fdt, uint32_t *phandle);
 
@@ -425,9 +427,11 @@ int fdt_num_mem_rsv(const void *fdt);
 /**
  * fdt_get_mem_rsv - retrieve one memory reserve map entry
  * @fdt: pointer to the device tree blob
- * @address, @size: pointers to 64-bit variables
+ * @n: index of reserve map entry
+ * @address: pointer to 64-bit variable to hold the start address
+ * @size: pointer to 64-bit variable to hold the size of the entry
  *
- * On success, *address and *size will contain the address and size of
+ * On success, @address and @size will contain the address and size of
  * the n-th reserve map entry from the device tree blob, in
  * native-endian format.
  *
@@ -450,6 +454,8 @@ int fdt_get_mem_rsv(const void *fdt, int n, uint64_t *address, uint64_t *size);
  * namelen characters of name for matching the subnode name.  This is
  * useful for finding subnodes based on a portion of a larger string,
  * such as a full path.
+ *
+ * Return: offset of the subnode or -FDT_ERR_NOTFOUND if name not found.
  */
 #ifndef SWIG /* Not available in Python */
 int fdt_subnode_offset_namelen(const void *fdt, int parentoffset,
@@ -489,6 +495,8 @@ int fdt_subnode_offset(const void *fdt, int parentoffset, const char *name);
  *
  * Identical to fdt_path_offset(), but only consider the first namelen
  * characters of path as the path name.
+ *
+ * Return: offset of the node or negative libfdt error value otherwise
  */
 #ifndef SWIG /* Not available in Python */
 int fdt_path_offset_namelen(const void *fdt, const char *path, int namelen);
@@ -588,9 +596,9 @@ int fdt_next_property_offset(const void *fdt, int offset);
 /**
  * fdt_for_each_property_offset - iterate over all properties of a node
  *
- * @property_offset:	property offset (int, lvalue)
- * @fdt:		FDT blob (const void *)
- * @node:		node offset (int)
+ * @property:	property offset (int, lvalue)
+ * @fdt:	FDT blob (const void *)
+ * @node:	node offset (int)
  *
  * This is actually a wrapper around a for loop and would be used like so:
  *
@@ -653,6 +661,9 @@ const struct fdt_property *fdt_get_property_by_offset(const void *fdt,
  *
  * Identical to fdt_get_property(), but only examine the first namelen
  * characters of name for matching the property name.
+ *
+ * Return: pointer to the structure representing the property, or NULL
+ *         if not found
  */
 #ifndef SWIG /* Not available in Python */
 const struct fdt_property *fdt_get_property_namelen(const void *fdt,
@@ -745,6 +756,8 @@ const void *fdt_getprop_by_offset(const void *fdt, int offset,
  *
  * Identical to fdt_getprop(), but only examine the first namelen
  * characters of name for matching the property name.
+ *
+ * Return: pointer to the property's value or NULL on error
  */
 #ifndef SWIG /* Not available in Python */
 const void *fdt_getprop_namelen(const void *fdt, int nodeoffset,
@@ -766,10 +779,10 @@ static inline void *fdt_getprop_namelen_w(void *fdt, int nodeoffset,
  * @lenp: pointer to an integer variable (will be overwritten) or NULL
  *
  * fdt_getprop() retrieves a pointer to the value of the property
- * named 'name' of the node at offset nodeoffset (this will be a
+ * named @name of the node at offset @nodeoffset (this will be a
  * pointer to within the device blob itself, not a copy of the value).
- * If lenp is non-NULL, the length of the property value is also
- * returned, in the integer pointed to by lenp.
+ * If @lenp is non-NULL, the length of the property value is also
+ * returned, in the integer pointed to by @lenp.
  *
  * returns:
  *	pointer to the property's value
@@ -814,8 +827,11 @@ uint32_t fdt_get_phandle(const void *fdt, int nodeoffset);
  * @name: name of the alias th look up
  * @namelen: number of characters of name to consider
  *
- * Identical to fdt_get_alias(), but only examine the first namelen
- * characters of name for matching the alias name.
+ * Identical to fdt_get_alias(), but only examine the first @namelen
+ * characters of @name for matching the alias name.
+ *
+ * Return: a pointer to the expansion of the alias named @name, if it exists,
+ *	   NULL otherwise
  */
 #ifndef SWIG /* Not available in Python */
 const char *fdt_get_alias_namelen(const void *fdt,
@@ -828,7 +844,7 @@ const char *fdt_get_alias_namelen(const void *fdt,
  * @name: name of the alias th look up
  *
  * fdt_get_alias() retrieves the value of a given alias.  That is, the
- * value of the property named 'name' in the node /aliases.
+ * value of the property named @name in the node /aliases.
  *
  * returns:
  *	a pointer to the expansion of the alias named 'name', if it exists
@@ -1004,14 +1020,13 @@ int fdt_node_offset_by_prop_value(const void *fdt, int startoffset,
 int fdt_node_offset_by_phandle(const void *fdt, uint32_t phandle);
 
 /**
- * fdt_node_check_compatible: check a node's compatible property
+ * fdt_node_check_compatible - check a node's compatible property
  * @fdt: pointer to the device tree blob
  * @nodeoffset: offset of a tree node
  * @compatible: string to match against
  *
- *
  * fdt_node_check_compatible() returns 0 if the given node contains a
- * 'compatible' property with the given string as one of its elements,
+ * @compatible property with the given string as one of its elements,
  * it returns non-zero otherwise, or on error.
  *
  * returns:
@@ -1075,7 +1090,7 @@ int fdt_node_offset_by_compatible(const void *fdt, int startoffset,
  * one or more strings, each terminated by \0, as is found in a device tree
  * "compatible" property.
  *
- * @return: 1 if the string is found in the list, 0 not found, or invalid list
+ * Return: 1 if the string is found in the list, 0 not found, or invalid list
  */
 int fdt_stringlist_contains(const char *strlist, int listlen, const char *str);
 
@@ -1084,7 +1099,8 @@ int fdt_stringlist_contains(const char *strlist, int listlen, const char *str);
  * @fdt: pointer to the device tree blob
  * @nodeoffset: offset of a tree node
  * @property: name of the property containing the string list
- * @return:
+ *
+ * Return:
  *   the number of strings in the given property
  *   -FDT_ERR_BADVALUE if the property value is not NUL-terminated
  *   -FDT_ERR_NOTFOUND if the property does not exist
@@ -1104,7 +1120,7 @@ int fdt_stringlist_count(const void *fdt, int nodeoffset, const char *property);
  * small-valued cell properties, such as #address-cells, when searching for
  * the empty string.
  *
- * @return:
+ * return:
  *   the index of the string in the list of strings
  *   -FDT_ERR_BADVALUE if the property value is not NUL-terminated
  *   -FDT_ERR_NOTFOUND if the property does not exist or does not contain
@@ -1128,7 +1144,7 @@ int fdt_stringlist_search(const void *fdt, int nodeoffset, const char *property,
  * If non-NULL, the length of the string (on success) or a negative error-code
  * (on failure) will be stored in the integer pointer to by lenp.
  *
- * @return:
+ * Return:
  *   A pointer to the string at the given index in the string list or NULL on
  *   failure. On success the length of the string will be stored in the memory
  *   location pointed to by the lenp parameter, if non-NULL. On failure one of
@@ -1217,6 +1233,8 @@ int fdt_size_cells(const void *fdt, int nodeoffset);
  * starting from the given index, and using only the first characters
  * of the name. It is useful when you want to manipulate only one value of
  * an array and you have a string that doesn't end with \0.
+ *
+ * Return: 0 on success, negative libfdt error value otherwise
  */
 #ifndef SWIG /* Not available in Python */
 int fdt_setprop_inplace_namelen_partial(void *fdt, int nodeoffset,
@@ -1330,8 +1348,13 @@ static inline int fdt_setprop_inplace_u64(void *fdt, int nodeoffset,
 
 /**
  * fdt_setprop_inplace_cell - change the value of a single-cell property
+ * @fdt: pointer to the device tree blob
+ * @nodeoffset: offset of the node containing the property
+ * @name: name of the property to change the value of
+ * @val: new value of the 32-bit cell
  *
  * This is an alternative name for fdt_setprop_inplace_u32()
+ * Return: 0 on success, negative libfdt error number otherwise.
  */
 static inline int fdt_setprop_inplace_cell(void *fdt, int nodeoffset,
 					   const char *name, uint32_t val)
@@ -1403,7 +1426,7 @@ int fdt_nop_node(void *fdt, int nodeoffset);
 
 /**
  * fdt_create_with_flags - begin creation of a new fdt
- * @fdt: pointer to memory allocated where fdt will be created
+ * @buf: pointer to memory allocated where fdt will be created
  * @bufsize: size of the memory space at fdt
  * @flags: a valid combination of FDT_CREATE_FLAG_ flags, or 0.
  *
@@ -1421,7 +1444,7 @@ int fdt_create_with_flags(void *buf, int bufsize, uint32_t flags);
 
 /**
  * fdt_create - begin creation of a new fdt
- * @fdt: pointer to memory allocated where fdt will be created
+ * @buf: pointer to memory allocated where fdt will be created
  * @bufsize: size of the memory space at fdt
  *
  * fdt_create() is equivalent to fdt_create_with_flags() with flags=0.
@@ -1486,7 +1509,8 @@ int fdt_pack(void *fdt);
 /**
  * fdt_add_mem_rsv - add one memory reserve map entry
  * @fdt: pointer to the device tree blob
- * @address, @size: 64-bit values (native endian)
+ * @address: 64-bit start address of the reserve map entry
+ * @size: 64-bit size of the reserved region
  *
  * Adds a reserve map entry to the given blob reserving a region at
  * address address of length size.
@@ -1691,8 +1715,14 @@ static inline int fdt_setprop_u64(void *fdt, int nodeoffset, const char *name,
 
 /**
  * fdt_setprop_cell - set a property to a single cell value
+ * @fdt: pointer to the device tree blob
+ * @nodeoffset: offset of the node whose property to change
+ * @name: name of the property to change
+ * @val: 32-bit integer value for the property (native endian)
  *
  * This is an alternative name for fdt_setprop_u32()
+ *
+ * Return: 0 on success, negative libfdt error value otherwise.
  */
 static inline int fdt_setprop_cell(void *fdt, int nodeoffset, const char *name,
 				   uint32_t val)
@@ -1863,8 +1893,14 @@ static inline int fdt_appendprop_u64(void *fdt, int nodeoffset,
 
 /**
  * fdt_appendprop_cell - append a single cell value to a property
+ * @fdt: pointer to the device tree blob
+ * @nodeoffset: offset of the node whose property to change
+ * @name: name of the property to change
+ * @val: 32-bit integer value to append to the property (native endian)
  *
  * This is an alternative name for fdt_appendprop_u32()
+ *
+ * Return: 0 on success, negative libfdt error value otherwise.
  */
 static inline int fdt_appendprop_cell(void *fdt, int nodeoffset,
 				      const char *name, uint32_t val)
@@ -1967,13 +2003,16 @@ int fdt_delprop(void *fdt, int nodeoffset, const char *name);
  * fdt_add_subnode_namelen - creates a new node based on substring
  * @fdt: pointer to the device tree blob
  * @parentoffset: structure block offset of a node
- * @name: name of the subnode to locate
+ * @name: name of the subnode to create
  * @namelen: number of characters of name to consider
  *
- * Identical to fdt_add_subnode(), but use only the first namelen
- * characters of name as the name of the new node.  This is useful for
+ * Identical to fdt_add_subnode(), but use only the first @namelen
+ * characters of @name as the name of the new node.  This is useful for
  * creating subnodes based on a portion of a larger string, such as a
  * full path.
+ *
+ * Return: structure block offset of the created subnode (>=0),
+ *	   negative libfdt error value otherwise
  */
 #ifndef SWIG /* Not available in Python */
 int fdt_add_subnode_namelen(void *fdt, int parentoffset,
@@ -1992,7 +2031,7 @@ int fdt_add_subnode_namelen(void *fdt, int parentoffset,
  *
  * This function will insert data into the blob, and will therefore
  * change the offsets of some existing nodes.
-
+ *
  * returns:
  *	structure block offset of the created nodeequested subnode (>=0), on
  *		success
-- 
2.17.5

