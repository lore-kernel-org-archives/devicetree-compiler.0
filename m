From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 1/2] libfdt: Check that there is only one root node
Date: Tue, 23 Mar 2021 12:19:40 +1300
Message-ID: <20210322231941.3202986-1-sjg@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hZ0z1w1WJxbKWznxgkq8jLUIXuwGMbWb+36iVgxKTME=;
        b=TwwxW0xVfqCUU937pCNCIyzrCLswHDSGgihCecp9V8XQWehMIRQuj3F9tHfZryTPc5
         odSjJu2ohrHsb5dSLtZF+zeTH3ijKfFecIHcmdsYkvIP600nWc/N/ujRPY9cTbTG5g5y
         2/t+rSQ/axvd/rey2ZRQDwRJlFFtLmBSKyNTc=
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Arie Haenel <arie.haenel-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Julien Lenoir <julien.lenoir-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>

At present it is possible to have two root nodes and even access nodes
in the 'second' root. Such trees should not be considered valid. This
was discovered as part of a security investigation into U-Boot verified
boot.

Add a check for this to fdt_check_full().

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Reported-by: Arie Haenel <arie.haenel-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Reported-by: Julien Lenoir <julien.lenoir-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
---

 libfdt/fdt_check.c   |  7 +++++++
 tests/Makefile.tests |  4 +++-
 tests/dumptrees.c    |  1 +
 tests/run_tests.sh   |  2 +-
 tests/testdata.h     |  1 +
 tests/trees.S        | 19 +++++++++++++++++++
 6 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/libfdt/fdt_check.c b/libfdt/fdt_check.c
index 9ddfdbf..84870a5 100644
--- a/libfdt/fdt_check.c
+++ b/libfdt/fdt_check.c
@@ -19,6 +19,7 @@ int fdt_check_full(const void *fdt, size_t bufsize)
 	unsigned int depth = 0;
 	const void *prop;
 	const char *propname;
+	bool expect_end = false;
 
 	if (bufsize < FDT_V1_SIZE)
 		return -FDT_ERR_TRUNCATED;
@@ -41,6 +42,10 @@ int fdt_check_full(const void *fdt, size_t bufsize)
 		if (nextoffset < 0)
 			return nextoffset;
 
+		/* If we see two root nodes, something is wrong */
+		if (expect_end && tag != FDT_END)
+			return -FDT_ERR_BADLAYOUT;
+
 		switch (tag) {
 		case FDT_NOP:
 			break;
@@ -60,6 +65,8 @@ int fdt_check_full(const void *fdt, size_t bufsize)
 			if (depth == 0)
 				return -FDT_ERR_BADSTRUCTURE;
 			depth--;
+			if (depth == 0)
+				expect_end = true;
 			break;
 
 		case FDT_PROP:
diff --git a/tests/Makefile.tests b/tests/Makefile.tests
index cb66c9f..fe5cae8 100644
--- a/tests/Makefile.tests
+++ b/tests/Makefile.tests
@@ -32,7 +32,9 @@ LIB_TESTS_L = get_mem_rsv \
 	fs_tree1
 LIB_TESTS = $(LIB_TESTS_L:%=$(TESTS_PREFIX)%)
 
-LIBTREE_TESTS_L = truncated_property truncated_string truncated_memrsv
+LIBTREE_TESTS_L = truncated_property truncated_string truncated_memrsv \
+	two_roots
+
 LIBTREE_TESTS = $(LIBTREE_TESTS_L:%=$(TESTS_PREFIX)%)
 
 DL_LIB_TESTS_L = asm_tree_dump value-labels
diff --git a/tests/dumptrees.c b/tests/dumptrees.c
index aecb326..02ca092 100644
--- a/tests/dumptrees.c
+++ b/tests/dumptrees.c
@@ -24,6 +24,7 @@ static struct {
 	TREE(ovf_size_strings),
 	TREE(truncated_property), TREE(truncated_string),
 	TREE(truncated_memrsv),
+	TREE(two_roots)
 };
 
 #define NUM_TREES	(sizeof(trees) / sizeof(trees[0]))
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 4b8dada..82543fc 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -518,7 +518,7 @@ libfdt_tests () {
 	run_test check_full $good
     done
     for bad in truncated_property.dtb truncated_string.dtb \
-				      truncated_memrsv.dtb; do
+		truncated_memrsv.dtb two_roots.dtb; do
 	run_test check_full -n $bad
     done
 }
diff --git a/tests/testdata.h b/tests/testdata.h
index 0d08efb..d03f352 100644
--- a/tests/testdata.h
+++ b/tests/testdata.h
@@ -55,4 +55,5 @@ extern struct fdt_header bad_prop_char;
 extern struct fdt_header ovf_size_strings;
 extern struct fdt_header truncated_string;
 extern struct fdt_header truncated_memrsv;
+extern struct fdt_header two_roots;
 #endif /* ! __ASSEMBLY */
diff --git a/tests/trees.S b/tests/trees.S
index efab287..e2380b7 100644
--- a/tests/trees.S
+++ b/tests/trees.S
@@ -279,3 +279,22 @@ truncated_memrsv_rsvmap:
 truncated_memrsv_rsvmap_end:
 
 truncated_memrsv_end:
+
+
+        /* two root nodes */
+        TREE_HDR(two_roots)
+	EMPTY_RSVMAP(two_roots)
+
+two_roots_struct:
+	BEGIN_NODE("")
+	END_NODE
+	BEGIN_NODE("")
+	END_NODE
+	FDTLONG(FDT_END)
+two_roots_struct_end:
+
+two_roots_strings:
+two_roots_strings_end:
+
+two_roots_end:
+
-- 
2.31.0.rc2.261.g7f71774620-goog

