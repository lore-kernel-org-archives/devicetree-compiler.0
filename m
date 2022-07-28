From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: [PATCH 3/4] Split out information for contributors to CONTRIBUTING.md
Date: Thu, 28 Jul 2022 17:53:47 +1000
Message-ID: <20220728075348.174412-4-david@gibson.dropbear.id.au>
References: <20220728075348.174412-1-david@gibson.dropbear.id.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1658994830;
        bh=Ibhh2P625QoQfZ+PtJqMqGqWvWK3e2xrw+dcxCT9jhM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Za0I+CbMOsgVKREIykUehFIhEPAJYiWTynSYNiCDj+RMnVwvpV8LbiT1TeDTClKW3
         GY3uK2LhXVul5Lc7nu3+dznA3epaBlCGTUaYyxsGqyTdgB0MeUt6QO2FJgp3PaT/CZ
         EDV6UT1pgnPht9sFQE8bQ5JnWRhkrqaBpA0tAryM=
In-Reply-To: <20220728075348.174412-1-david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, loeliger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

README.md covers both general information for people using and building
the software, and more specific information for people contributing to
either dtc or libfdt.  Split out the latter information into its own file
for easier reference.

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
---
 CONTRIBUTING.md | 25 +++++++++++++++++++++++++
 README.md       | 19 -------------------
 2 files changed, 25 insertions(+), 19 deletions(-)
 create mode 100644 CONTRIBUTING.md

diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md
new file mode 100644
index 0000000..51f7a82
--- /dev/null
+++ b/CONTRIBUTING.md
@@ -0,0 +1,25 @@
+# Contributing to dtc or libfdt
+
+There are two ways to submit changes for dtc or libfdt:
+
+* Post patches directly to the the
+  [devicetree-compiler](mailto:devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org)
+  mailing list.
+* Submit pull requests via
+  [Github](https://github.com/dgibson/dtc/pulls)
+
+## Adding a new function to libfdt.h
+
+The shared library uses `libfdt/version.lds` to list the exported
+functions, so add your new function there. Check that your function
+works with pylibfdt. If it cannot be supported, put the declaration in
+`libfdt.h` behind `#ifndef SWIG` so that swig ignores it.
+
+## Tests
+
+Test files are kept in the `tests/` directory. Use `make check` to build and run
+all tests.
+
+If you want to adjust a test file, be aware that `tree_tree1.dts` is compiled
+and checked against a binary tree from assembler macros in `trees.S`. So
+if you change that file you must change `tree.S` also.
diff --git a/README.md b/README.md
index 36a3912..8f1a5d2 100644
--- a/README.md
+++ b/README.md
@@ -91,25 +91,6 @@ $ make NO_PYTHON=1
 More work remains to support all of libfdt, including access to numeric
 values.
 
-
-## Adding a new function to libfdt.h
-
-The shared library uses `libfdt/version.lds` to list the exported
-functions, so add your new function there. Check that your function
-works with pylibfdt. If it cannot be supported, put the declaration in
-`libfdt.h` behind `#ifndef SWIG` so that swig ignores it.
-
-
-## Tests
-
-Test files are kept in the `tests/` directory. Use `make check` to build and run
-all tests.
-
-If you want to adjust a test file, be aware that `tree_tree1.dts` is compiled
-and checked against a binary tree from assembler macros in `trees.S`. So
-if you change that file you must change `tree.S` also.
-
-
 ## Mailing lists
 
 * The [devicetree-compiler](mailto:devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org)
-- 
2.37.1

