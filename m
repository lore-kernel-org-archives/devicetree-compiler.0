From: Andrei Ziureaev <andreiziureaev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC PATCH v4 2/4] dtc: Add a live tree API
Date: Tue, 15 Sep 2020 18:07:24 +0100
Message-ID: <20200915170726.15434-3-andreiziureaev@gmail.com>
References: <20200915170726.15434-1-andreiziureaev@gmail.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=uL+QDUm4V8pwc8lQVUq0xdwl7nB0cs0I/BsFu+2ZJbI=;
        b=govSlemmvcgSTEEjimzWZUwwTxAsU7mQKLG4ZT//J3WVlRHb4BMnwEdbmLVdl+9Yis
         zodUJwfRfoL4Fsa0og2ywFnCuy3OAoqIC39gJ0JVuXyJN0IRFtOuO6ZtPBQIOEoqQftx
         5SxGNMdG0MMZJ6KINV9cKaxPJzNmoSSug0Ekspg1ehhF8ZkqBOkgzfoeAxFwyAkgN8/n
         LsU/mONbA4HimI+8PTwt+sGHtvcfIApiKp69AC5yxyYFtcuw5hPlQpThWNj5nFjK1Y1E
         9QDOGwT6kv+lA6KssrL4a/iHCckAu8cB6DEVTiozH8j2sGBZ+ts1Ucj4IyyeBr790bnS
         FHpg==
In-Reply-To: <20200915170726.15434-1-andreiziureaev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org

From: Andrei Ziureaev <andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>

The purpose of this API is to completely abstract away the internal live
tree implementation.

This API can traverse the tree and read its values. This is enough to
validate the tree in Python, for example. Specifically, the API gives
read-only access to:
- source positions (directory names, file names, line numbers)
- node names and property names
- values of properties (strings and ints)
- if the value is an int, its width and whether it's a phandle

Signed-off-by: Andrei Ziureaev <andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>
Signed-off-by: Andrei Ziureaev <andreiziureaev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---

Changes in v4:
- full documentation
---
 Makefile.dtc |   1 +
 dt.c         | 158 ++++++++++++++++++++++++++
 dt.h         | 305 +++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 464 insertions(+)
 create mode 100644 dt.c
 create mode 100644 dt.h

diff --git a/Makefile.dtc b/Makefile.dtc
index 9c467b0..09b3123 100644
--- a/Makefile.dtc
+++ b/Makefile.dtc
@@ -7,6 +7,7 @@
 DTC_SRCS = \
 	checks.c \
 	data.c \
+	dt.c \
 	dtc.c \
 	flattree.c \
 	fstree.c \
diff --git a/dt.c b/dt.c
new file mode 100644
index 0000000..715eba3
--- /dev/null
+++ b/dt.c
@@ -0,0 +1,158 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * (C) Copyright Arm Holdings.  2020
+ */
+
+#include "dt.h"
+#include "dtc.h"
+
+struct node *dt_root(struct dt_info *dti)
+{
+	return dti->dt;
+}
+
+struct node *dt_first_child(struct node *node)
+{
+	return node->children;
+}
+
+struct node *dt_next_sibling(struct node *node)
+{
+	return node->next_sibling;
+}
+
+struct property *dt_first_property(struct node *node)
+{
+	return node->proplist;
+}
+
+struct property *dt_next_property(struct property *prop)
+{
+	return prop->next;
+}
+
+struct marker *dt_first_row(struct property *prop)
+{
+	return next_type_marker(prop->val.markers);
+}
+
+struct marker *dt_next_row(struct marker *row)
+{
+	return next_type_marker(row->next);
+}
+
+int dt_row_length(struct property *prop, struct marker *row)
+{
+	int length_bytes = type_marker_length(row) ? : prop->val.len - row->offset;
+	return length_bytes / dt_cell_width_bytes(row);
+}
+
+uint64_t dt_uint(struct property *prop, struct marker *row, int col)
+{
+	int width = dt_cell_width_bytes(row);
+	const char *p = &dt_string(prop, row)[col * width];
+
+	switch(width) {
+	case 2:
+		return dtb_ld16(p);
+	case 4:
+		return dtb_ld32(p);
+	case 8:
+		return dtb_ld64(p);
+	default:
+		return *(const uint8_t*)p;
+	}
+}
+
+bool dt_cell_is_phandle(struct property *prop, struct marker *row, int col)
+{
+	int width = dt_cell_width_bytes(row);
+	int off = row->offset + col * width;
+
+	if (width != 4)
+		return false;
+
+	return markers_have_type_at_offset(row, REF_PHANDLE, off);
+}
+
+const char *dt_string(struct property *prop, struct marker *row)
+{
+	return &prop->val.val[row->offset];
+}
+
+enum dt_type dt_row_type(struct marker *row)
+{
+	switch (row->type) {
+	/* fallthrough */
+	case TYPE_UINT8:
+	case TYPE_UINT16:
+	case TYPE_UINT32:
+	case TYPE_UINT64:
+		return DT_TYPE_UINT;
+	case TYPE_STRING:
+		return DT_TYPE_STRING;
+	default:
+		return DT_TYPE_NONE;
+	}
+}
+
+const char *dt_row_type_name(struct marker *row)
+{
+	switch (dt_row_type(row)) {
+	case DT_TYPE_UINT:
+		return "uint";
+	case DT_TYPE_STRING:
+		return "string";
+	default:
+		return "none";
+	}
+}
+
+int dt_cell_width_bytes(struct marker *row)
+{
+	switch (row->type) {
+	case TYPE_UINT16:
+		return 2;
+	case TYPE_UINT32:
+		return 4;
+	case TYPE_UINT64:
+		return 8;
+	default:
+		return 1;
+	}
+}
+
+const char *dt_node_name(struct node *node)
+{
+	return *node->name ? node->name : "/";
+}
+
+struct srcpos *dt_node_srcpos(struct node *node)
+{
+	return node->srcpos;
+}
+
+const char *dt_property_name(struct property *prop)
+{
+	return prop->name;
+}
+
+struct srcpos *dt_property_srcpos(struct property *prop)
+{
+	return prop->srcpos;
+}
+
+const char *dt_srcpos_dir(struct srcpos *srcpos)
+{
+	return srcpos->file->dir ? : "";
+}
+
+const char *dt_srcpos_file_name(struct srcpos *srcpos)
+{
+	return srcpos->file->name ? : "";
+}
+
+int dt_srcpos_first_line(struct srcpos *srcpos)
+{
+	return srcpos->first_line;
+}
diff --git a/dt.h b/dt.h
new file mode 100644
index 0000000..09a5796
--- /dev/null
+++ b/dt.h
@@ -0,0 +1,305 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef DT_H
+#define DT_H
+
+/*
+ * (C) Copyright Arm Holdings.  2020
+ */
+
+#include <stdint.h>
+#include <stdbool.h>
+
+#include "srcpos.h"
+
+struct dt_info;
+struct node;
+struct property;
+struct marker;
+
+/**
+ * enum dt_type - The type of data stored in a row.
+ * @DT_TYPE_NONE: This row has no type and can be ignored.
+ * @DT_TYPE_UINT: This row stores integers. Their width can be queried
+ *                using dt_cell_width_bytes().
+ * @DT_TYPE_STRING: This row is a string.
+ *
+ * The type of a row can be queried using dt_row_type().
+ */
+enum dt_type {
+	DT_TYPE_NONE,
+	DT_TYPE_UINT,
+	DT_TYPE_STRING,
+};
+
+/**********************************************************************/
+/* Traversal functions                                                */
+/**********************************************************************/
+
+/**
+ * dt_root() - Get the root of the device tree.
+ * @dti: Pointer to the device tree.
+ *
+ * Retrieves the topmost node of the device tree. This node is the
+ * starting point for traversing the tree.
+ *
+ * Return:
+ * 	Pointer to the root node of the device tree,
+ * 	NULL if the root doesn't exist.
+ */
+struct node *dt_root(struct dt_info *dti);
+
+/**
+ * dt_first_child() - Get the first child of a node.
+ * @node: Pointer to a node.
+ *
+ * dt_first_child() retrieves the first child of @node. The first child
+ * can be passed to dt_next_sibling() to retrieve @node's second child,
+ * and so on.
+ *
+ * Return:
+ * 	Pointer to the fist child of @node,
+ * 	NULL if @node has no children.
+ */
+struct node *dt_first_child(struct node *node);
+
+/**
+ * dt_next_sibling() - Get the next sibling of a node.
+ * @node: Pointer to a node.
+ *
+ * Every node is part of a list of siblings. dt_next_sibling() retrieves
+ * the next sibling of @node.
+ *
+ * Return:
+ * 	Pointer to the next sibling of @node,
+ * 	NULL if @node is the last sibling.
+ */
+struct node *dt_next_sibling(struct node *node);
+
+/**
+ * dt_first_property() - Get the first property of a node.
+ * @node: Pointer to a node.
+ *
+ * dt_first_property() retrieves the first property of @node. The first
+ * property can be passed to dt_next_property() to retrieve @node's
+ * second property, and so on.
+ *
+ * Return:
+ * 	Pointer to the fist property of @node,
+ * 	NULL if @node has no properties.
+ */
+struct property *dt_first_property(struct node *node);
+
+/**
+ * dt_next_property() - Get the next property.
+ * @prop: Pointer to the current property.
+ *
+ * Every property is part of a list. Given that @prop is the current
+ * property in that list, dt_next_property() retrieves the next property
+ * in that list.
+ *
+ * Return:
+ * 	Pointer to the property after @prop,
+ * 	NULL if @prop is the last property.
+ */
+struct property *dt_next_property(struct property *prop);
+
+/**
+ * DOC: How to Traverse Properties
+ *
+ * A property resembles a table. It is a list of rows.
+ *
+ * Rows can be iterated over using dt_first_row() and dt_next_row(). A
+ * row is an array of cells, but it can also be a string. Its type can
+ * be queried using dt_row_type().
+ *
+ * If a row is a string, its value can be obtained using dt_string().
+ * Otherwise, it's an array of cells and each cell needs to be obtained
+ * one by one.
+ *
+ * A cell is just an integer. Its value can be obtained using dt_uint().
+ * The number of columns (or cells) in a row can be acquired using
+ * dt_row_length().
+ */
+
+/**
+ * dt_first_row() - Get the first row of a property.
+ * @prop: Pointer to a property.
+ *
+ * Return:
+ * 	Pointer to a marker, which represents @prop's first row.
+ * 	NULL if @prop doesn't contain any data, in which case, it's a
+ * 		"boolean" with a value of "true".
+ */
+struct marker *dt_first_row(struct property *prop);
+
+/**
+ * dt_next_row() - Get the next row.
+ * @row: Pointer to a marker, which represents the current row.
+ *
+ * Every row is part of a list. Given that @row is the current row in
+ * that list, dt_next_row() retrieves the next row in that list.
+ *
+ * Return:
+ * 	Pointer to a marker, which represents the row after @row,
+ * 	NULL if @row is the last row.
+ */
+struct marker *dt_next_row(struct marker *row);
+
+/**
+ * dt_row_length() - Get the number of cells in this row.
+ * @prop: Pointer to the property, to which @row belongs.
+ * @row: Pointer to a marker, which represents the row.
+ *
+ * dt_row_length() retrieves the number of cells in @row. This number
+ * can be used in a for loop to iterate over the cells, using functions
+ * like dt_uint().
+ *
+ * Return:
+ * 	Number of cells in @row.
+ */
+int dt_row_length(struct property *prop, struct marker *row);
+
+/**********************************************************************/
+/* Data access functions                                              */
+/**********************************************************************/
+
+/**
+ * dt_uint() - Get the integer value of a cell.
+ * @prop: Pointer to the property, to which @row belongs.
+ * @row: Pointer to a marker, which represents the row.
+ * @col: Column index.
+ *
+ * Return:
+ * 	Integer value at @col in @row in @prop.
+ */
+uint64_t dt_uint(struct property *prop, struct marker *row, int col);
+
+/**
+ * dt_cell_is_phandle() - Returns whether a cell is a phandle.
+ * @prop: Pointer to the property, to which @row belongs.
+ * @row: Pointer to a marker, which represents the row.
+ * @col: Column index.
+ *
+ * Return:
+ * 	Whether the cell at @col in @row in @prop is a phandle.
+ */
+bool dt_cell_is_phandle(struct property *prop, struct marker *row, int col);
+
+/**
+ * dt_string() - Get the data stored in a row as a ``char`` array.
+ * @prop: Pointer to the property, to which @row belongs.
+ * @row: Pointer to a marker, which represents the row.
+ *
+ * Return:
+ * 	Null-terminated string if @row is of type ``DT_TYPE_STRING``,
+ * 	otherwise, @row's data as an array of bytes.
+ */
+const char *dt_string(struct property *prop, struct marker *row);
+
+/**********************************************************************/
+/* Metadata access functions                                          */
+/**********************************************************************/
+
+/**
+ * dt_row_type() - Get the type of data stored in a row.
+ * @row: Pointer to a marker, which represents the row.
+ *
+ * Return:
+ * 	Type of data stored in @row.
+ */
+enum dt_type dt_row_type(struct marker *row);
+
+/**
+ * dt_row_type_name() - Get a string describing the type of data stored
+ * in a row.
+ * @row: Pointer to a marker, which represents the row.
+ *
+ * Return:
+ * 	Type of data stored in @row as a null-terminated string.
+ * 		Possible values are:
+ * 		"none"   - corresponds to ``DT_TYPE_NONE``,
+ * 		"uint"   - corresponds to ``DT_TYPE_UINT``,
+ * 		"string" - corresponds to ``DT_TYPE_STRING``.
+ */
+const char *dt_row_type_name(struct marker *row);
+
+/**
+ * dt_cell_width_bytes() - Get the width of a cell in this row.
+ * @row: Pointer to a marker, which represents the row.
+ *
+ * Return:
+ * 	Width of a cell in @row in bytes.
+ * 		Can be 1, 2, 4, or 8.
+ */
+int dt_cell_width_bytes(struct marker *row);
+
+/**
+ * dt_node_name() - Get the name of a node.
+ * @node: Pointer to a node.
+ *
+ * Return:
+ * 	Name of @node as a non-empty null-terminated string.
+ */
+const char *dt_node_name(struct node *node);
+
+/**
+ * dt_node_srcpos() - Get the source position of a node.
+ * @node: Pointer to a node.
+ *
+ * Return:
+ * 	Pointer to the source position struct of @node,
+ * 	NULL if this struct doesn't exist.
+ */
+struct srcpos *dt_node_srcpos(struct node *node);
+
+/**
+ * dt_property_name() - Get the name of a property.
+ * @prop: Pointer to a property.
+ *
+ * Return:
+ * 	Name of @prop as a non-empty null-terminated string.
+ */
+const char *dt_property_name(struct property *prop);
+
+/**
+ * dt_property_srcpos() - Get the source position of a property.
+ * @prop: Pointer to a property.
+ *
+ * Return:
+ * 	Pointer to the source position struct of @prop,
+ * 	NULL if this struct doesn't exist.
+ */
+struct srcpos *dt_property_srcpos(struct property *prop);
+
+/**
+ * dt_srcpos_dir() - Get the path to a source file.
+ * @srcpos: Pointer to a source position struct.
+ *
+ * Return:
+ * 	Path to the file specified in @srcpos as a null-terminated
+ * 		string. Can be empty.
+ */
+const char *dt_srcpos_dir(struct srcpos *srcpos);
+
+/**
+ * dt_srcpos_file_name() - Get the name of a source file.
+ * @srcpos: Pointer to a source position struct.
+ *
+ * Return:
+ * 	Name of the file specified in @srcpos as a null-terminated
+ * 		string.
+ * 	Empty string if the name is unknown.
+ */
+const char *dt_srcpos_file_name(struct srcpos *srcpos);
+
+/**
+ * dt_srcpos_first_line() - Get the first line number of a source
+ * position.
+ * @srcpos: Pointer to a source position struct.
+ *
+ * Return:
+ * 	First line number of @srcpos.
+ */
+int dt_srcpos_first_line(struct srcpos *srcpos);
+
+#endif /* DT_H */
-- 
2.17.1

