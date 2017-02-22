From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v7 3/5] Mention pylibfdt in the documentation
Date: Tue, 21 Feb 2017 21:33:38 -0700
Message-ID: <20170222043340.17008-4-sjg@chromium.org>
References: <20170222043340.17008-1-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=9zv57ol+WVdWRb/JzxImwyIQpHzR/6j16I4DaorX09w=;
        b=pCv/vxyU9UG+NssrU09ejcYaMlFAhd4NA0kbFbIHExpRX3fF3w1QB84JclQ5e5WaT+
         UUOnMpTm/U+y9vspsnCOZ+I32R56twRgD3UQ2/4DaRwn9wml6iFpHtmKJ3nGYJXjZ17E
         UShRCVGKpzCfuD6TlZ43ggrKi0WNXaAehAf8lXUy6MA3YKPbsJfxohy2k/9118DIGflY
         Uw6Cp6UkGEfj6Y4tbU+8eQlxuPjDsb8ZUFqZQVMzSOFvtMMX5rfLgaTThgUV2RWqOIYP
         Ts47hhV46sq/FzS1mja4kQtAGCh3xXWtnLkGjR5Didnbx6YMTZy6/Ha+QDzizHXxBtdH
         pjcw==
In-Reply-To: <20170222043340.17008-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Benjamin Bimmermann <b.bimmermann-LWAfsSFWpa4@public.gmane.org>, Ulrich Langenbach <ulrich.langenbach-srmvecZYGfHobmly5n/iKBvVK+yQ3ZXh@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Add a note about pylibfdt in the README.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

Changes in v7: None
Changes in v6:
- Update example to print the node value as an integer
- Update example to print the bytestring as well as the string

Changes in v5:
- Use an interactive session to demonstrate pylibfdt
- Mention that more work remains

Changes in v4: None
Changes in v3: None
Changes in v2:
- Add details on how to obtain full help and code coverage

 README | 47 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/README b/README
index f92008f..96d8486 100644
--- a/README
+++ b/README
@@ -7,6 +7,53 @@ DTC and LIBFDT are maintained by:
 David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
 Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
 
+
+Python library
+--------------
+
+A Python library is also available. To build this you will need to install
+swig and Python development files. On Debian distributions:
+
+   sudo apt-get install swig python-dev
+
+The library provides an Fdt class which you can use like this:
+
+$ PYTHONPATH=../pylibfdt python
+>>> import libfdt
+>>> fdt = libfdt.Fdt(open('test_tree1.dtb').read())
+>>> node = fdt.path_offset('/subnode@1')
+>>> print node
+124
+>>> prop_offset = fdt.first_property_offset(node)
+>>> prop = fdt.get_property_by_offset(prop_offset)
+>>> print '%s=%r' % (prop.name, prop.value)
+compatible=bytearray(b'subnode1\x00')
+>>> print '%s=%s' % (prop.name, prop.value)
+compatible=subnode1
+>>> node2 = fdt.path_offset('/')
+>>> print fdt.getprop(node2, 'compatible')
+test_tree1
+
+You will find tests in tests/pylibfdt_tests.py showing how to use each
+method. Help is available using the Python help command, e.g.:
+
+    $ cd pylibfdt
+    $ python -c "import libfdt; help(libfdt)"
+
+If you add new features, please check code coverage:
+
+    $ sudo apt-get install python-pip python-pytest
+    $ sudo pip install coverage
+    $ cd tests
+    $ coverage run pylibfdt_tests.py
+    $ coverage html
+    # Open 'htmlcov/index.html' in your browser
+
+
+More work remains to support all of libfdt, including access to numeric
+values.
+
+
 Mailing list
 ------------
 The following list is for discussion about dtc and libfdt implementation
-- 
2.11.0.483.g087da7b7c-goog
