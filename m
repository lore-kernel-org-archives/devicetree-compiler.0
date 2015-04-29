From: Jack Miller <jack-jZyo8ZIaZD9AfugRpC6u6w@public.gmane.org>
Subject: [PATCH] Fix crash with poorly defined #size-cells
Date: Wed, 29 Apr 2015 14:02:24 -0500
Message-ID: <1430334144-26986-1-git-send-email-jack@codezen.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:from:to:subject:date:message-id;
        bh=NfJAykOx0wmBXIJinnEwIYqhDhL4gCKBHTz8mKtnHSs=;
        b=MrqDO0upBDM8F9sSicAAc3mwjEwFFu6V+bxxJf1Wr6ovyJLF1FPeXAPLxCiwieRFu5
         7fFhyWDQkqfRzyFwEuqIdeBTqEHzi3pF2DwgNjKLvF8GpGsJlvocQsy1bwPH/c9S8AUr
         8G3+sitwqyTh/58vN2wXHzuAW3jHKMutE3OJjeeZ2QHZMJbcyOEmsUj5xaeQw2odeVRd
         uexllPHn80lvPUEGoUjThtjfaOFTFDD9vwqldPgONvlZ+LG2OypV3ipcHtUg3zkOUBMD
         nZsZcXpXAHDxxgvEyXnp07guQ6RqAwD5THkvCPQqHAFVX98ugUwTA99OCmGGZxnC/4HQ
         unnw==
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

If you have a parent block with #size-cells improperly set to 0, and
then subsequently try to include a regs property in the child, dtc will
crash with SIGFPE while validating it. This patch fixes that crash,
instead printing the same invalid length warning that was causing it.

Test included.

Signed-off-by: Jack Miller <jack-jZyo8ZIaZD9AfugRpC6u6w@public.gmane.org>
---
 checks.c                 |  2 +-
 tests/bad-size-cells.dts | 12 ++++++++++++
 tests/run_tests.sh       |  2 ++
 3 files changed, 15 insertions(+), 1 deletion(-)
 create mode 100644 tests/bad-size-cells.dts

diff --git a/checks.c b/checks.c
index e81a8c7..0c03ac9 100644
--- a/checks.c
+++ b/checks.c
@@ -560,7 +560,7 @@ static void check_reg_format(struct check *c, struct node *dt,
 	size_cells = node_size_cells(node->parent);
 	entrylen = (addr_cells + size_cells) * sizeof(cell_t);
 
-	if ((prop->val.len % entrylen) != 0)
+	if (!entrylen || (prop->val.len % entrylen) != 0)
 		FAIL(c, "\"reg\" property in %s has invalid length (%d bytes) "
 		     "(#address-cells == %d, #size-cells == %d)",
 		     node->fullpath, prop->val.len, addr_cells, size_cells);
diff --git a/tests/bad-size-cells.dts b/tests/bad-size-cells.dts
new file mode 100644
index 0000000..515c0cc
--- /dev/null
+++ b/tests/bad-size-cells.dts
@@ -0,0 +1,12 @@
+/dts-v1/;
+
+/ {
+	mangled {
+		#address-cells = <0x0>;
+		#size-cells = <0x0>;
+
+		valid {
+            reg = <0x0 0x4000000>;
+        };
+    };
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 5331856..c870432 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -279,6 +279,8 @@ libfdt_tests () {
     run_dtc_test -I dts -O dtb -o embedded_nul.test.dtb embedded_nul.dts
     run_dtc_test -I dts -O dtb -o embedded_nul_equiv.test.dtb embedded_nul_equiv.dts
     run_test dtbs_equal_ordered embedded_nul.test.dtb embedded_nul_equiv.test.dtb
+
+    run_dtc_test -I dts -O dtb bad-size-cells.dts
 }
 
 dtc_tests () {
-- 
2.3.6
