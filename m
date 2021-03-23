From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2 2/2] libfdt: Check that the root-node name is empty
Date: Tue, 23 Mar 2021 13:09:26 +1300
Message-ID: <20210323000926.3210733-2-sjg@chromium.org>
References: <20210323000926.3210733-1-sjg@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M+BZzhVado1HMJkIkLzucn/oRKV7I5bKFCTlgjH01LI=;
        b=PLHcJtTgFxOp93otI7VzmRHT+oqjJS3awW5qk0ZITmmHNWdGz/5hdvFBpWj3LGvg/J
         Ck+SF3x97tw0Q27KKBA9fq7QTommUjZbPC7WosYdEGZfMGXSKH+8aWaACMnIULDuYnvd
         2DUbwTMNtYbDZQZwBvVHRZcR4WwYGNrq9MYEA=
In-Reply-To: <20210323000926.3210733-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Arie Haenel <arie.haenel-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Julien Lenoir <julien.lenoir-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>

The root node is supposed to have an empty name, but at present this is
not checked. The behaviour of such a tree is not well defined. Most
software rightly assumes that the root node is at offset 0 and does not
check the name. This oddity was discovered as part of a security
investigation into U-Boot verified boot.

Add a check for this to fdt_check_full().

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Reported-by: Arie Haenel <arie.haenel-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Reported-by: Julien Lenoir <julien.lenoir-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
---

Changes in v2:
- Use FDT_ERR_BADSTRUCTURE instead of FDT_ERR_BADLAYOUT

 libfdt/fdt_check.c   | 10 ++++++++++
 tests/Makefile.tests |  2 +-
 tests/dumptrees.c    |  3 ++-
 tests/testdata.h     |  1 +
 tests/trees.S        | 15 +++++++++++++++
 5 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/libfdt/fdt_check.c b/libfdt/fdt_check.c
index 13595a2..fa410a8 100644
--- a/libfdt/fdt_check.c
+++ b/libfdt/fdt_check.c
@@ -59,6 +59,16 @@ int fdt_check_full(const void *fdt, size_t bufsize)
 			depth++;
 			if (depth > INT_MAX)
 				return -FDT_ERR_BADSTRUCTURE;
+
+			/* The root node must have an empty name */
+			if (depth == 1) {
+				const char *name;
+				int len;
+
+				name = fdt_get_name(fdt, offset, &len);
+				if (*name || len)
+					return -FDT_ERR_BADSTRUCTURE;
+			}
 			break;
 
 		case FDT_END_NODE:
diff --git a/tests/Makefile.tests b/tests/Makefile.tests
index fe5cae8..2b47627 100644
--- a/tests/Makefile.tests
+++ b/tests/Makefile.tests
@@ -33,7 +33,7 @@ LIB_TESTS_L = get_mem_rsv \
 LIB_TESTS = $(LIB_TESTS_L:%=$(TESTS_PREFIX)%)
 
 LIBTREE_TESTS_L = truncated_property truncated_string truncated_memrsv \
-	two_roots
+	two_roots named_root
 
 LIBTREE_TESTS = $(LIBTREE_TESTS_L:%=$(TESTS_PREFIX)%)
 
diff --git a/tests/dumptrees.c b/tests/dumptrees.c
index 02ca092..f1e0ea9 100644
--- a/tests/dumptrees.c
+++ b/tests/dumptrees.c
@@ -24,7 +24,8 @@ static struct {
 	TREE(ovf_size_strings),
 	TREE(truncated_property), TREE(truncated_string),
 	TREE(truncated_memrsv),
-	TREE(two_roots)
+	TREE(two_roots),
+	TREE(named_root)
 };
 
 #define NUM_TREES	(sizeof(trees) / sizeof(trees[0]))
diff --git a/tests/testdata.h b/tests/testdata.h
index d03f352..4f9e3ba 100644
--- a/tests/testdata.h
+++ b/tests/testdata.h
@@ -56,4 +56,5 @@ extern struct fdt_header ovf_size_strings;
 extern struct fdt_header truncated_string;
 extern struct fdt_header truncated_memrsv;
 extern struct fdt_header two_roots;
+extern struct fdt_header named_root;
 #endif /* ! __ASSEMBLY */
diff --git a/tests/trees.S b/tests/trees.S
index e2380b7..95d599d 100644
--- a/tests/trees.S
+++ b/tests/trees.S
@@ -298,3 +298,18 @@ two_roots_strings_end:
 
 two_roots_end:
 
+
+        /* root node with a non-empty name */
+        TREE_HDR(named_root)
+	EMPTY_RSVMAP(named_root)
+
+named_root_struct:
+	BEGIN_NODE("fake")
+	END_NODE
+	FDTLONG(FDT_END)
+named_root_struct_end:
+
+named_root_strings:
+named_root_strings_end:
+
+named_root_end:
-- 
2.31.0.rc2.261.g7f71774620-goog

