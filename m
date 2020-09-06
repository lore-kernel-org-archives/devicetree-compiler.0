From: Andrei Ziureaev <andreiziureaev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC PATCH v3 2/4] dtc: Add a live tree API
Date: Sun,  6 Sep 2020 14:12:18 +0100
Message-ID: <20200906131220.6192-3-andrei.ziureaev@arm.com>
References: <20200906131220.6192-1-andrei.ziureaev@arm.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ZCK7Z1SQVq7rUTVbHhkIbEv88gh9d/ZKmypL3eIxpMc=;
        b=i4BMJAcKxntcjWd7PUpHqIeqtwYMJhYgWyWIkJwRnDPRzrUlrzi02g/JD15K4u6maB
         bB5t6tz4P66nW45nMCpAxm6JSq6UXvAJUgyrViptS342fDDzWTHVdZDzqg2XkrGDlpaX
         6mAFgoY09mm5EwJVHBnDZdx69raNHjFdmUCD+sbrBexl3pW9iwKMn7gXGMzSyP6e6TPR
         WmEnBwnH6GSA9bL0+iHfVe7TdqmACX+KCN5+w+OGZtcNVaEv/b0Ay5+l+cLSQk3oc9Gj
         Rdn1H6a+8+51KeV9deVrRPcFLzgOL8AG7Zulrke8pH0sJQcrNNSIx1gE0RIVl2peAnNP
         L4kg==
In-Reply-To: <20200906131220.6192-1-andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andrei.ziureaev-5wv7dgnIgG8@public.gmane.org

The purpose of this API is to completely abstract away the internal live
tree implementation.

This API can traverse the tree and read its values. This is enough to
validate the tree in Python, for example. We could add more
functionality, documentation and tests, and turn it into a separate
library.

Signed-off-by: Andrei Ziureaev <andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>
Signed-off-by: Andrei Ziureaev <andreiziureaev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 Makefile.dtc |   1 +
 dt.c         | 158 +++++++++++++++++++++++++++++++++++++++++++++++++++
 dt.h         |  63 ++++++++++++++++++++
 3 files changed, 222 insertions(+)
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
index 0000000..5024e63
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
+	return srcpos->file->dir;
+}
+
+const char *dt_srcpos_file_name(struct srcpos *srcpos)
+{
+	return srcpos->file->name;
+}
+
+int dt_srcpos_first_line(struct srcpos *srcpos)
+{
+	return srcpos->first_line;
+}
diff --git a/dt.h b/dt.h
new file mode 100644
index 0000000..c6af112
--- /dev/null
+++ b/dt.h
@@ -0,0 +1,63 @@
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
+enum dt_type {
+	DT_TYPE_NONE,
+	DT_TYPE_UINT,
+	DT_TYPE_STRING,
+};
+
+/* Traversal */
+struct node *dt_root(struct dt_info *dti);
+
+struct node *dt_first_child(struct node *node);
+struct node *dt_next_sibling(struct node *node);
+
+struct property *dt_first_property(struct node *node);
+struct property *dt_next_property(struct property *prop);
+
+/* A property value resembles a matrix (or a table). A marker with data
+ * type information can represent a row.
+ *
+ * So, each property has a linked list of rows. */
+struct marker *dt_first_row(struct property *prop);
+struct marker *dt_next_row(struct marker *row);
+
+/* Accessing data. Each row is an array of cells. */
+int dt_row_length(struct property *prop, struct marker *row);
+
+uint64_t dt_uint(struct property *prop, struct marker *row, int col);
+bool dt_cell_is_phandle(struct property *prop, struct marker *row, int col);
+const char *dt_string(struct property *prop, struct marker *row);
+
+/* Accessing metadata */
+enum dt_type dt_row_type(struct marker *row);
+const char *dt_row_type_name(struct marker *row);
+int dt_cell_width_bytes(struct marker *row);
+
+const char *dt_node_name(struct node *node);
+struct srcpos *dt_node_srcpos(struct node *node);
+
+const char *dt_property_name(struct property *prop);
+struct srcpos *dt_property_srcpos(struct property *prop);
+
+const char *dt_srcpos_dir(struct srcpos *srcpos);
+const char *dt_srcpos_file_name(struct srcpos *srcpos);
+int dt_srcpos_first_line(struct srcpos *srcpos);
+
+#endif /* DT_H */
-- 
2.17.1

