From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v6 3/5] Mention pylibfdt in the documentation
Date: Thu, 16 Feb 2017 21:47:57 -0700
Message-ID: <20170217044759.20974-4-sjg@chromium.org>
References: <20170217044759.20974-1-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ZbZxTbtQvzmPLcTogDvHm0UNNvpuw22mGTKV6RRWO1M=;
        b=MOSXHqRvNFwPAp5HDRAOJSuc2wtlMa8mb/JyPv1+sL48/1lxrQ2R9t+brVoylj6a2d
         JvzzkTYySzCzItxvj2PxXvw/2Zj7Z8W40Yv4Q/Sa3tPZzE7Q20BhBW9aLEEkZRc0fSUS
         tIs2PL1jUMpgjOtTnMl1H7evtQ8Qg3zP4pORDi5COkag8OxOIQjtYDWe2cK1Hk3yMZDg
         inW3uupuLWy/qae2Bi+mxDNkBRM3ydHdSAr3t6+1kcvdGws/k4w6O+Xzm5YPq+QlJy2J
         svL+tHhtJNW2/+C/SXhXiDF6sYi+T93pkFSGzrfy6W8TpB2v0xv4wD4fIqxsPYIKvSyD
         LI2g==
In-Reply-To: <20170217044759.20974-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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
