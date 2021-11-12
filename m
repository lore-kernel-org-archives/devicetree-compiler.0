From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 4/6] tests: rename pylibfdt_tests.py to test_pylibfdt.py
Date: Thu, 11 Nov 2021 22:16:31 -0600
Message-ID: <20211112041633.741598-5-robh@kernel.org>
References: <20211112041633.741598-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20211112041633.741598-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

This follows the normal Python test_*.py naming convention. With this
change, pytest can automatically find and run the tests.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 README                                        | 4 ++--
 tests/run_tests.sh                            | 2 +-
 tests/{pylibfdt_tests.py => test_pylibfdt.py} | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename tests/{pylibfdt_tests.py => test_pylibfdt.py} (100%)

diff --git a/README b/README
index 5f5655df6898..380c79759ce9 100644
--- a/README
+++ b/README
@@ -32,7 +32,7 @@ compatible=subnode1
 >>> print(fdt.getprop(node2, 'compatible').as_str())
 test_tree1
 
-You will find tests in tests/pylibfdt_tests.py showing how to use each
+You will find tests in tests/test_pylibfdt.py showing how to use each
 method. Help is available using the Python help command, e.g.:
 
     $ cd pylibfdt
@@ -43,7 +43,7 @@ If you add new features, please check code coverage:
     $ sudo apt-get install python3-coverage
     $ cd tests
     # It's just 'coverage' on most other distributions
-    $ python3-coverage run pylibfdt_tests.py
+    $ python3-coverage run test_pylibfdt.py
     $ python3-coverage html
     # Open 'htmlcov/index.html' in your browser
 
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 140ac03e721d..7c768052179d 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -1013,7 +1013,7 @@ fdtoverlay_tests() {
 
 pylibfdt_tests () {
     TMP=/tmp/tests.stderr.$$
-    $PYTHON "$SRCDIR/pylibfdt_tests.py" -v 2> $TMP
+    $PYTHON "$SRCDIR/test_pylibfdt.py" -v 2> $TMP
 
     # Use the 'ok' message meaning the test passed, 'ERROR' meaning it failed
     # and the summary line for total tests (e.g. 'Ran 17 tests in 0.002s').
diff --git a/tests/pylibfdt_tests.py b/tests/test_pylibfdt.py
similarity index 100%
rename from tests/pylibfdt_tests.py
rename to tests/test_pylibfdt.py
-- 
2.32.0

