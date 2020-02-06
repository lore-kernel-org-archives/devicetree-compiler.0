From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v5 7/7] libfdt: Allow exclusion of fdt_check_full()
Date: Wed,  5 Feb 2020 22:40:34 -0700
Message-ID: <20200206054034.162732-8-sjg@chromium.org>
References: <20200206054034.162732-1-sjg@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AQuajV4W+Zpz7IIBfzl0YRzuJazLyfk/Pxkxqjxi1Gs=;
        b=AHlDz5lqnUqocSo8SLDg9OaGJDYQRDpy+adGHzncdiq9eZGn8PmhzZzCKr9RW4x6mN
         hzLvDhvOQqXauxRVzsyNh3ZWMraSlISqjxHVfqRVV1KQXndcxs6/teyUMvo2opDSn1PU
         PvhgE00ixEP5qFQnJu3o0EH/44kQxGOJQUDV8=
In-Reply-To: <20200206054034.162732-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

This function is used to perform a full check of the device tree. Allow
it to be excluded if all assumptions are enabled.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Reviewed-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
---

Changes in v5: None
Changes in v4: None
Changes in v3:
- Fix 'santiy' typo
- Instead of excluding fdt_check_full() put it in its own file
- Rearrange code in terms of checks instead of files changed, to aid review
- Replace 'unsigned' with 'unsigned int'
- Update commit message a little

Changes in v2:
- Add a comment to fdt_find_add_string_()
- Correct inverted version checks in a few cases
- Drop optimised code path in fdt_nodename_eq_()
- Update to use new check functions
- Use fdt_chk_base() in fdt_blocks_misordered_()

 libfdt/Makefile.libfdt |  2 +-
 libfdt/fdt_check.c     | 74 ++++++++++++++++++++++++++++++++++++++++++
 libfdt/fdt_ro.c        | 63 -----------------------------------
 3 files changed, 75 insertions(+), 64 deletions(-)
 create mode 100644 libfdt/fdt_check.c

diff --git a/libfdt/Makefile.libfdt b/libfdt/Makefile.libfdt
index e546397..b6d8fc0 100644
--- a/libfdt/Makefile.libfdt
+++ b/libfdt/Makefile.libfdt
@@ -8,7 +8,7 @@ LIBFDT_soname = libfdt.$(SHAREDLIB_EXT).1
 LIBFDT_INCLUDES = fdt.h libfdt.h libfdt_env.h
 LIBFDT_VERSION = version.lds
 LIBFDT_SRCS = fdt.c fdt_ro.c fdt_wip.c fdt_sw.c fdt_rw.c fdt_strerror.c fdt_empty_tree.c \
-	fdt_addresses.c fdt_overlay.c
+	fdt_addresses.c fdt_overlay.c fdt_check.c
 LIBFDT_OBJS = $(LIBFDT_SRCS:%.c=%.o)
 LIBFDT_LIB = libfdt-$(DTC_VERSION).$(SHAREDLIB_EXT)
 
diff --git a/libfdt/fdt_check.c b/libfdt/fdt_check.c
new file mode 100644
index 0000000..7f6a96c
--- /dev/null
+++ b/libfdt/fdt_check.c
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+/*
+ * libfdt - Flat Device Tree manipulation
+ * Copyright (C) 2006 David Gibson, IBM Corporation.
+ */
+#include "libfdt_env.h"
+
+#include <fdt.h>
+#include <libfdt.h>
+
+#include "libfdt_internal.h"
+
+int fdt_check_full(const void *fdt, size_t bufsize)
+{
+	int err;
+	int num_memrsv;
+	int offset, nextoffset = 0;
+	uint32_t tag;
+	unsigned int depth = 0;
+	const void *prop;
+	const char *propname;
+
+	if (bufsize < FDT_V1_SIZE)
+		return -FDT_ERR_TRUNCATED;
+	err = fdt_check_header(fdt);
+	if (err != 0)
+		return err;
+	if (bufsize < fdt_totalsize(fdt))
+		return -FDT_ERR_TRUNCATED;
+
+	num_memrsv = fdt_num_mem_rsv(fdt);
+	if (num_memrsv < 0)
+		return num_memrsv;
+
+	while (1) {
+		offset = nextoffset;
+		tag = fdt_next_tag(fdt, offset, &nextoffset);
+
+		if (nextoffset < 0)
+			return nextoffset;
+
+		switch (tag) {
+		case FDT_NOP:
+			break;
+
+		case FDT_END:
+			if (depth != 0)
+				return -FDT_ERR_BADSTRUCTURE;
+			return 0;
+
+		case FDT_BEGIN_NODE:
+			depth++;
+			if (depth > INT_MAX)
+				return -FDT_ERR_BADSTRUCTURE;
+			break;
+
+		case FDT_END_NODE:
+			if (depth == 0)
+				return -FDT_ERR_BADSTRUCTURE;
+			depth--;
+			break;
+
+		case FDT_PROP:
+			prop = fdt_getprop_by_offset(fdt, offset, &propname,
+						     &err);
+			if (!prop)
+				return err;
+			break;
+
+		default:
+			return -FDT_ERR_INTERNAL;
+		}
+	}
+}
diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
index 63cb60e..c29925d 100644
--- a/libfdt/fdt_ro.c
+++ b/libfdt/fdt_ro.c
@@ -859,66 +859,3 @@ int fdt_node_offset_by_compatible(const void *fdt, int startoffset,
 
 	return offset; /* error from fdt_next_node() */
 }
-
-int fdt_check_full(const void *fdt, size_t bufsize)
-{
-	int err;
-	int num_memrsv;
-	int offset, nextoffset = 0;
-	uint32_t tag;
-	unsigned depth = 0;
-	const void *prop;
-	const char *propname;
-
-	if (bufsize < FDT_V1_SIZE)
-		return -FDT_ERR_TRUNCATED;
-	err = fdt_check_header(fdt);
-	if (err != 0)
-		return err;
-	if (bufsize < fdt_totalsize(fdt))
-		return -FDT_ERR_TRUNCATED;
-
-	num_memrsv = fdt_num_mem_rsv(fdt);
-	if (num_memrsv < 0)
-		return num_memrsv;
-
-	while (1) {
-		offset = nextoffset;
-		tag = fdt_next_tag(fdt, offset, &nextoffset);
-
-		if (nextoffset < 0)
-			return nextoffset;
-
-		switch (tag) {
-		case FDT_NOP:
-			break;
-
-		case FDT_END:
-			if (depth != 0)
-				return -FDT_ERR_BADSTRUCTURE;
-			return 0;
-
-		case FDT_BEGIN_NODE:
-			depth++;
-			if (depth > INT_MAX)
-				return -FDT_ERR_BADSTRUCTURE;
-			break;
-
-		case FDT_END_NODE:
-			if (depth == 0)
-				return -FDT_ERR_BADSTRUCTURE;
-			depth--;
-			break;
-
-		case FDT_PROP:
-			prop = fdt_getprop_by_offset(fdt, offset, &propname,
-						     &err);
-			if (!prop)
-				return err;
-			break;
-
-		default:
-			return -FDT_ERR_INTERNAL;
-		}
-	}
-}
-- 
2.25.0.341.g760bfbb309-goog

