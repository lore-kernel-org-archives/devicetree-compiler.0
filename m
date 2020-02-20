From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v7 2/8] Add a way to control the level of checks in the code
Date: Thu, 20 Feb 2020 14:45:51 -0700
Message-ID: <20200220214557.176528-3-sjg@chromium.org>
References: <20200220214557.176528-1-sjg@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cG5dFpAg9FCN3Few4Qpc2VMrkhPiCeA15T/u3Bk7VFk=;
        b=MA7TJ1PWRyiypEcbkB6p795NZ6Tie7DA4PA9/y1972Df9CDUy2GbjoDxsIbpj+kvFa
         5lYE5rSNqfEaTgnEfjxFTKwGlvidns3/4OKUgCCqHxtfsp8THIZJILioTRK+Qvg8TcRV
         7Z1pTYXc2XF9bPIc668yZWDcMOjDYFasnu0WA=
In-Reply-To: <20200220214557.176528-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Add a new ASSUME_MASK option, which allows for some control over the
checks used in libfdt. With all assumptions enabled, libfdt assumes that
the input data and parameters are all correct and that internal errors
cannot happen.

By default no assumptions are made and all checks are enabled.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

Changes in v7:
- Use ASSUME_LIBFDT_ORDER for the ordering flag

Changes in v6:
- Add an option to skip the ordering check

Changes in v5:
- Rename _can_assume() to can_assume_()
- Split SANE into VALID_DTB and VALID_INPUT
- Update comment for ASSUME_PERFECT to mention invalid parameters

Changes in v4:
- Add a can_assume() macros and squash the inline functions into one
- Drop unnecessary FDT_ prefix
- Fix 'Incosistencies' typo
- Merge the 'friendly' and 'sane' checks into one
- Update and expand comments

Changes in v3:
- Expand the comments about each check option
- Invert the checks to be called assumptions
- Move header-version code to fdt.c
- Move the comments on check options to the enum
- Use hex for CHK_MASK

Changes in v2:
- Add an fdt_ prefix to avoid namespace conflicts
- Use symbolic names for _check functions and drop leading underscores

 Makefile                 |   6 ++-
 libfdt/libfdt_internal.h | 104 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 109 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index e73576a..0dff03f 100644
--- a/Makefile
+++ b/Makefile
@@ -16,7 +16,11 @@ EXTRAVERSION =
 LOCAL_VERSION =
 CONFIG_LOCALVERSION =
 
-CPPFLAGS = -I libfdt -I .
+# Control the assumptions made (e.g. risking security issues) in the code.
+# See libfdt_internal.h for details
+ASSUME_MASK ?= 0
+
+CPPFLAGS = -I libfdt -I . -DFDT_ASSUME_MASK=$(ASSUME_MASK)
 WARNINGS = -Wall -Wpointer-arith -Wcast-qual -Wnested-externs \
 	-Wstrict-prototypes -Wmissing-prototypes -Wredundant-decls -Wshadow
 CFLAGS = -g -Os $(SHAREDLIB_CFLAGS) -Werror $(WARNINGS) $(EXTRA_CFLAGS)
diff --git a/libfdt/libfdt_internal.h b/libfdt/libfdt_internal.h
index 058c735..e9913cd 100644
--- a/libfdt/libfdt_internal.h
+++ b/libfdt/libfdt_internal.h
@@ -48,4 +48,108 @@ static inline struct fdt_reserve_entry *fdt_mem_rsv_w_(void *fdt, int n)
 
 #define FDT_SW_MAGIC		(~FDT_MAGIC)
 
+/**********************************************************************/
+/* Checking controls                                                  */
+/**********************************************************************/
+
+#ifndef FDT_ASSUME_MASK
+#define FDT_ASSUME_MASK 0
+#endif
+
+/*
+ * Defines assumptions which can be enabled. Each of these can be enabled
+ * individually. For maximum saftey, don't enable any assumptions!
+ *
+ * For minimal code size and no safety, use ASSUME_PERFECT at your own risk.
+ * You should have another method of validating the device tree, such as a
+ * signature or hash check before using libfdt.
+ *
+ * For situations where security is not a concern it may be safe to enable
+ * ASSUME_SANE.
+ */
+enum {
+	/*
+	 * This does essentially no checks. Only the latest device-tree
+	 * version is correctly handled. Inconsistencies or errors in the device
+	 * tree may cause undefined behaviour or crashes. Invalid parameters
+	 * passed to libfdt may do the same.
+	 *
+	 * If an error occurs when modifying the tree it may leave the tree in
+	 * an intermediate (but valid) state. As an example, adding a property
+	 * where there is insufficient space may result in the property name
+	 * being added to the string table even though the property itself is
+	 * not added to the struct section.
+	 *
+	 * Only use this if you have a fully validated device tree with
+	 * the latest supported version and wish to minimise code size.
+	 */
+	ASSUME_PERFECT		= 0xff,
+
+	/*
+	 * This assumes that the device tree is sane. i.e. header metadata
+	 * and basic hierarchy are correct.
+	 *
+	 * With this assumption enabled, normal device trees produced by libfdt
+	 * and the compiler should be handled safely. Malicious device trees and
+	 * complete garbage may cause libfdt to behave badly or crash.
+	 *
+	 * Note: Only checks that relate exclusively to the device tree itself
+	 * (not the parameters passed to libfdt) are disabled by this
+	 * assumption. This includes checking headers, tags and the like.
+	 */
+	ASSUME_VALID_DTB	= 1 << 0,
+
+	/*
+	 * This builds on ASSUME_VALID_DTB and further assumes that libfdt
+	 * functions are called with valid parameters, i.e. not trigger
+	 * FDT_ERR_BADOFFSET or offsets that are out of bounds. It disables any
+	 * extensive checking of parameters and the device tree, making various
+	 * assumptions about correctness.
+	 *
+	 * It doesn't make sense to enable this assumption unless
+	 * ASSUME_VALID_DTB is also enabled.
+	 */
+	ASSUME_VALID_INPUT	= 1 << 1,
+
+	/*
+	 * This disables checks for device-tree version and removes all code
+	 * which handles older versions.
+	 *
+	 * Only enable this if you know you have a device tree with the latest
+	 * version.
+	 */
+	ASSUME_LATEST		= 1 << 2,
+
+	/*
+	 * This assume that it is OK for a failed additional to the device tree
+	 * due to lack of space or some other problem can skip any rollback
+	 * steps (such as dropping the property name from the string table).
+	 * This is safe to enable in most circumstances, even though it may
+	 * leave the tree in a sub-optimal state.
+	 */
+	ASSUME_NO_ROLLBACK	= 1 << 3,
+
+	/*
+	 * This assumes that the device tree components appear in the correct
+	 * order. As such it disables a check in fdt_open_into() and removes the
+	 * ability to fix the problem there. This is safe if you know that the
+	 * device tree is correctly ordered. See fdt_blocks_misordered_().
+	 */
+	ASSUME_LIBFDT_ORDER	= 1 << 4,
+};
+
+/**
+ * can_assume_() - check if a particular assumption is enabled
+ *
+ * @mask: Mask to check (ASSUME_...)
+ * @return true if that assumption is enabled, else false
+ */
+static inline bool can_assume_(int mask)
+{
+	return FDT_ASSUME_MASK & mask;
+}
+
+/** helper macros for checking assumptions */
+#define can_assume(_assume)	can_assume_(ASSUME_ ## _assume)
+
 #endif /* LIBFDT_INTERNAL_H */
-- 
2.25.0.265.gbab2e86ba0-goog

