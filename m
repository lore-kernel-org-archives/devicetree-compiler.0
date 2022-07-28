From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: [PATCH 1/4] Convert README to README.md
Date: Thu, 28 Jul 2022 17:53:45 +1000
Message-ID: <20220728075348.174412-2-david@gibson.dropbear.id.au>
References: <20220728075348.174412-1-david@gibson.dropbear.id.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1658994830;
        bh=iRob48sPctOH6Ho7hX8A8U10yAltKH2ktGUleFFkB4o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hsXN9DTPaOnmbVrp8VT3r/0Akd7+3zpBkzBBVLr3s5pXuPYheclS5acSNN0NKHmpy
         CaakVlWD0RPt5j0X/4LOs03VblMqAsj6KiyCDzrcnBNK55QMiD2Sdzwf/+OdlAO6ZO
         nfDrpJaLfgR5i0+JLB4/fymYs5kdyN7tKi68zQOg=
In-Reply-To: <20220728075348.174412-1-david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, loeliger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

Let's move vaguely into the twenty-first century by converting our old
plain text README file to Markdown.  While we're updating the formatting,
make some small polish changes to the content.

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
---
 README    | 106 -----------------------------------------------
 README.md | 120 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 120 insertions(+), 106 deletions(-)
 delete mode 100644 README
 create mode 100644 README.md

diff --git a/README b/README
deleted file mode 100644
index a48312a..0000000
--- a/README
+++ /dev/null
@@ -1,106 +0,0 @@
-The source tree contains the Device Tree Compiler (dtc) toolchain for
-working with device tree source and binary files and also libfdt, a
-utility library for reading and manipulating the binary format.
-
-DTC and LIBFDT are maintained by:
-
-David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
-Jon Loeliger <loeliger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
-
-
-Python library
---------------
-
-A Python library is also available. To build this you will need to install
-swig and Python development files. On Debian distributions:
-
-   sudo apt-get install swig python3-dev
-
-The library provides an Fdt class which you can use like this:
-
-$ PYTHONPATH=../pylibfdt python3
->>> import libfdt
->>> fdt = libfdt.Fdt(open('test_tree1.dtb', mode='rb').read())
->>> node = fdt.path_offset('/subnode@1')
->>> print(node)
-124
->>> prop_offset = fdt.first_property_offset(node)
->>> prop = fdt.get_property_by_offset(prop_offset)
->>> print('%s=%s' % (prop.name, prop.as_str()))
-compatible=subnode1
->>> node2 = fdt.path_offset('/')
->>> print(fdt.getprop(node2, 'compatible').as_str())
-test_tree1
-
-You will find tests in tests/pylibfdt_tests.py showing how to use each
-method. Help is available using the Python help command, e.g.:
-
-    $ cd pylibfdt
-    $ python3 -c "import libfdt; help(libfdt)"
-
-If you add new features, please check code coverage:
-
-    $ sudo apt-get install python3-coverage
-    $ cd tests
-    # It's just 'coverage' on most other distributions
-    $ python3-coverage run pylibfdt_tests.py
-    $ python3-coverage html
-    # Open 'htmlcov/index.html' in your browser
-
-
-The library can be installed with pip from a local source tree:
-
-    pip install . [--user|--prefix=/path/to/install_dir]
-
-Or directly from a remote git repo:
-
-    pip install git+git://git.kernel.org/pub/scm/utils/dtc/dtc.git@main
-
-The install depends on libfdt shared library being installed on the host system
-first. Generally, using --user or --prefix is not necessary and pip will use the
-default location for the Python installation which varies if the user is root or
-not.
-
-You can also install everything via make if you like, but pip is recommended.
-
-To install both libfdt and pylibfdt you can use:
-
-    make install [PREFIX=/path/to/install_dir]
-
-To disable building the python library, even if swig and Python are available,
-use:
-
-    make NO_PYTHON=1
-
-
-More work remains to support all of libfdt, including access to numeric
-values.
-
-
-Adding a new function to libfdt.h
----------------------------------
-
-The shared library uses libfdt/version.lds to list the exported functions, so
-add your new function there. Check that your function works with pylibfdt. If
-it cannot be supported, put the declaration in libfdt.h behind #ifndef SWIG so
-that swig ignores it.
-
-
-Tests
------
-
-Test files are kept in the tests/ directory. Use 'make check' to build and run
-all tests.
-
-If you want to adjust a test file, be aware that tree_tree1.dts is compiled
-and checked against a binary tree from assembler macros in trees.S. So
-if you change that file you must change tree.S also.
-
-
-Mailing list
-------------
-The following list is for discussion about dtc and libfdt implementation
-mailto:devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
-
-Core device tree bindings are discussed on the devicetree-spec list:
-mailto:devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
diff --git a/README.md b/README.md
new file mode 100644
index 0000000..30212bc
--- /dev/null
+++ b/README.md
@@ -0,0 +1,120 @@
+# Device Tree Compiler and libfdt
+
+The source tree contains the Device Tree Compiler (dtc) toolchain for
+working with device tree source and binary files and also libfdt, a
+utility library for reading and manipulating the binary format.
+
+dtc and libfdt are maintained by:
+
+* [David Gibson `<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>`](mailto:david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org)
+* [Jon Loeliger `<loeliger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>`](mailto:loeliger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org)
+
+## Python library
+
+A Python library wrapping libfdt is also available. To build this you
+will need to install `swig` and Python development files. On Debian
+distributions:
+
+```
+$ sudo apt-get install swig python3-dev
+```
+
+The library provides an `Fdt` class which you can use like this:
+
+```
+$ PYTHONPATH=../pylibfdt python3
+>>> import libfdt
+>>> fdt = libfdt.Fdt(open('test_tree1.dtb', mode='rb').read())
+>>> node = fdt.path_offset('/subnode@1')
+>>> print(node)
+124
+>>> prop_offset = fdt.first_property_offset(node)
+>>> prop = fdt.get_property_by_offset(prop_offset)
+>>> print('%s=%s' % (prop.name, prop.as_str()))
+compatible=subnode1
+>>> node2 = fdt.path_offset('/')
+>>> print(fdt.getprop(node2, 'compatible').as_str())
+test_tree1
+```
+
+You will find tests in `tests/pylibfdt_tests.py` showing how to use each
+method. Help is available using the Python help command, e.g.:
+
+```
+$ cd pylibfdt
+$ python3 -c "import libfdt; help(libfdt)"
+```
+
+If you add new features, please check code coverage:
+
+```
+$ sudo apt-get install python3-coverage
+$ cd tests
+# It's just 'coverage' on most other distributions
+$ python3-coverage run pylibfdt_tests.py
+$ python3-coverage html
+# Open 'htmlcov/index.html' in your browser
+```
+
+The library can be installed with pip from a local source tree:
+
+```
+$ pip install . [--user|--prefix=/path/to/install_dir]
+```
+
+Or directly from a remote git repo:
+
+```
+$ pip install git+git://git.kernel.org/pub/scm/utils/dtc/dtc.git@main
+```
+
+The install depends on libfdt shared library being installed on the
+host system first. Generally, using `--user` or `--prefix` is not
+necessary and pip will use the default location for the Python
+installation which varies if the user is root or not.
+
+You can also install everything via make if you like, but pip is
+recommended.
+
+To install both libfdt and pylibfdt you can use:
+
+```
+$ make install [PREFIX=/path/to/install_dir]
+```
+
+To disable building the python library, even if swig and Python are available,
+use:
+
+```
+$ make NO_PYTHON=1
+```
+
+More work remains to support all of libfdt, including access to numeric
+values.
+
+
+## Adding a new function to libfdt.h
+
+The shared library uses `libfdt/version.lds` to list the exported
+functions, so add your new function there. Check that your function
+works with pylibfdt. If it cannot be supported, put the declaration in
+`libfdt.h` behind `#ifndef SWIG` so that swig ignores it.
+
+
+## Tests
+
+Test files are kept in the `tests/` directory. Use `make check` to build and run
+all tests.
+
+If you want to adjust a test file, be aware that `tree_tree1.dts` is compiled
+and checked against a binary tree from assembler macros in `trees.S`. So
+if you change that file you must change `tree.S` also.
+
+
+## Mailing lists
+
+* The [devicetree-compiler](mailto:devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org)
+  list is for discussion about dtc and libfdt implementation.
+* Core device tree bindings are discussed on the
+  [devicetree-spec](mailto:devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org) list.
+
-- 
2.37.1

