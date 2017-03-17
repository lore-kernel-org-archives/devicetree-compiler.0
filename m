From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v11 5/5] Build pylibfdt as part of the normal build process
Date: Fri, 17 Mar 2017 16:14:34 -0600
Message-ID: <20170317221434.15390-6-sjg@chromium.org>
References: <20170317221434.15390-1-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=tWDZooLYtQO5j76UYDiob0FUPozmAY7VXuyjKYLwzzc=;
        b=J8U3Hf6PXtAm/NG2qZGbzqAd8nScecEGFdyZzJzzwiu8ducc7j09HAsVt2UBJfWFvx
         tU5Ntw+oqNsVafXaJ7XoYx7p4IDqQThyyVEopRj1+9rvm1YNL2aR/fjwXRlA4Nf0XL3i
         2iTIRRX3o2+0cPsTpmO7mkOM8tntvL+zIIOCFgjHl4p7vzmPyVcSt/lRooDnfrwX/D4O
         ZR77aLw+MDOZjDLh00OIq9j3/bT2VApbV45pu44BgC9Zmhx5Q2wXH+OpUAT5qMSvx9CF
         aQ0x0/x5Sk60kXmCHsK4HO1gpjFVnssbdebDJmdFHn9YZdhEigYWHJfqG00DZ3rFoHal
         6ugw==
In-Reply-To: <20170317221434.15390-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Benjamin Bimmermann <b.bimmermann-LWAfsSFWpa4@public.gmane.org>, Ulrich Langenbach <ulrich.langenbach-srmvecZYGfHobmly5n/iKBvVK+yQ3ZXh@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

If swig and the Python are available, build pylibfdt automatically.
Adjust the tests to run Python tests too in this case.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

Changes in v11:
- Show test output always

Changes in v10:
- Show test output when there are failures

Changes in v9:
- Support 'make clean' properly with pylibfdt
- Move run_tests.sh updates to this patch
- Only run the pylibfdt tests automatically if we can build pylibfdt
- Update commit message to reflect swig/Python.h detection
- Update Makefile shell command to support dash shell

Changes in v8:
- Only build pylibfdt if we have swig and Python.h

Changes in v7: None
Changes in v6: None
Changes in v5:
- Fix 'possible' typo

Changes in v4: None
Changes in v3: None
Changes in v2: None

 Makefile           | 34 ++++++++++++++++++++++++++++++++--
 tests/run_tests.sh | 28 ++++++++++++++++++++++++++++
 2 files changed, 60 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 1b69f53..0db7fc7 100644
--- a/Makefile
+++ b/Makefile
@@ -116,7 +116,21 @@ BIN += fdtput
 
 SCRIPTS = dtdiff
 
-all: $(BIN) libfdt
+# We need both Python and swig to build pylibfdt.
+.PHONY: maybe_pylibfdt
+maybe_pylibfdt: FORCE
+	if pkg-config --cflags python >/dev/null 2>&1; then \
+		if which swig >/dev/null; then \
+			can_build=yes; \
+		fi; \
+	fi; \
+	if [ "$$can_build" = "yes" ]; then \
+		$(MAKE) pylibfdt; \
+	else \
+		echo "Please install python-dev and swig to build pylibfdt"; \
+	fi
+
+all: $(BIN) libfdt maybe_pylibfdt
 
 
 ifneq ($(DEPTARGETS),)
@@ -203,6 +217,22 @@ dist:
 	cat ../dtc-$(dtc_version).tar | \
 		gzip -9 > ../dtc-$(dtc_version).tar.gz
 
+
+#
+# Rules for pylibfdt
+#
+PYLIBFDT_srcdir = pylibfdt
+PYLIBFDT_objdir = pylibfdt
+
+include $(PYLIBFDT_srcdir)/Makefile.pylibfdt
+
+.PHONY: pylibfdt
+pylibfdt: $(PYLIBFDT_objdir)/_libfdt.so
+
+pylibfdt_clean:
+	@$(VECHO) CLEAN "(pylibfdt)"
+	rm -f $(addprefix $(PYLIBFDT_objdir)/,$(PYLIBFDT_cleanfiles))
+
 #
 # Release signing and uploading
 # This is for maintainer convenience, don't try this at home.
@@ -244,7 +274,7 @@ include tests/Makefile.tests
 STD_CLEANFILES = *~ *.o *.$(SHAREDLIB_EXT) *.d *.a *.i *.s core a.out vgcore.* \
 	*.tab.[ch] *.lex.c *.output
 
-clean: libfdt_clean tests_clean
+clean: libfdt_clean pylibfdt_clean tests_clean
 	@$(VECHO) CLEAN
 	rm -f $(STD_CLEANFILES)
 	rm -f $(VERSION_FILE)
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index ed489db..1d7c442 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -769,6 +769,26 @@ fdtdump_tests () {
     run_fdtdump_test fdtdump.dts
 }
 
+pylibfdt_tests () {
+    TMP=/tmp/tests.stderr.$$
+    python pylibfdt_tests.py -v 2> $TMP
+
+    # Use the 'ok' message meaning the test passed, 'ERROR' meaning it failed
+    # and the summary line for total tests (e.g. 'Ran 17 tests in 0.002s').
+    # We could add pass + fail to get total tests, but this provides a useful
+    # sanity check.
+    pass_count=$(grep "\.\.\. ok$" $TMP | wc -l)
+    fail_count=$(grep "^ERROR: " $TMP | wc -l)
+    total_tests=$(sed -n 's/^Ran \([0-9]*\) tests.*$/\1/p' $TMP)
+    cat $TMP
+    rm $TMP
+
+    # Extract the test results and add them to our totals
+    tot_fail=$((tot_fail + $fail_count))
+    tot_pass=$((tot_pass + $pass_count))
+    tot_tests=$((tot_tests + $total_tests))
+}
+
 while getopts "vt:me" ARG ; do
     case $ARG in
 	"v")
@@ -788,6 +808,11 @@ done
 
 if [ -z "$TESTSETS" ]; then
     TESTSETS="libfdt utilfdt dtc dtbs_equal fdtget fdtput fdtdump"
+
+    # Test pylibfdt if the libfdt Python module is available.
+    if [ -f ../pylibfdt/_libfdt.so ]; then
+        TESTSETS="$TESTSETS pylibfdt"
+    fi
 fi
 
 # Make sure we don't have stale blobs lying around
@@ -816,6 +841,9 @@ for set in $TESTSETS; do
 	"fdtdump")
 	    fdtdump_tests
 	    ;;
+	"pylibfdt")
+	    pylibfdt_tests
+	    ;;
     esac
 done
 
-- 
2.12.0.367.g23dc2f6d3c-goog
