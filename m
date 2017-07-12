From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] dtc: change default phandles to ePAPR style instead of both
Date: Wed, 12 Jul 2017 17:20:30 -0500
Message-ID: <20170712222030.22258-1-robh@kernel.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Currently, both legacy (linux,phandle) and ePAPR (phandle) properties
are inserted into dtbs by default. The newer ePAPR style has been
supported in dtc and Linux kernel for 7 years. That should be a long
enough transition period. We can save a little space by not putting both
into the dtb.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 dtc.c              | 2 +-
 tests/run_tests.sh | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/dtc.c b/dtc.c
index f5eed9d72c02..5ed873c72ad1 100644
--- a/dtc.c
+++ b/dtc.c
@@ -31,7 +31,7 @@ int reservenum;		/* Number of memory reservation slots */
 int minsize;		/* Minimum blob size */
 int padsize;		/* Additional padding to blob */
 int alignsize;		/* Additional padding to blob accroding to the alignsize */
-int phandle_format = PHANDLE_BOTH;	/* Use linux,phandle or phandle properties */
+int phandle_format = PHANDLE_EPAPR;	/* Use linux,phandle or phandle properties */
 int generate_symbols;	/* enable symbols & fixup support */
 int generate_fixups;		/* suppress generation of fixups on symbol support */
 int auto_label_aliases;		/* auto generate labels -> aliases */
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 5df148048758..ccd301738726 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -420,7 +420,7 @@ dtc_tests () {
     run_dtc_test -I dts -O dtb -o dtc_path-references.test.dtb path-references.dts
     run_test path-references dtc_path-references.test.dtb
 
-    run_test phandle_format dtc_references.test.dtb both
+    run_test phandle_format dtc_references.test.dtb epapr
     for f in legacy epapr both; do
 	run_dtc_test -I dts -O dtb -H $f -o dtc_references.test.$f.dtb references.dts
 	run_test phandle_format dtc_references.test.$f.dtb $f
-- 
2.11.0
