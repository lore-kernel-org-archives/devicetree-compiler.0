From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v5 3/5] Mention pylibfdt in the documentation
Date: Tue, 14 Feb 2017 20:51:58 -0700
Message-ID: <20170215035200.29934-4-sjg@chromium.org>
References: <20170215035200.29934-1-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=KnFxM3sAWffbJbNHJ3TszMFQfy3axixAN0aczIy/7Eo=;
        b=H014P95A68DpJbzkut1FQYnn6PfloyT+5Q4GTQYNFsf17Ho4qd5bv+Zb97xcpe0Y/Y
         BwQxNJJXFTsuPmAmRs6HaWMv8giSKkJ6X5W2KLtiF/1kfKAx7nsSVbpmoS+36UASYcV+
         UU7tX4bpxc/cJYBTIncoViOQumC3zqGJHlI/a3VWSzlphqre0JvIkjg2Nv1tKlR+mb/4
         9/1QIQDUQ/cY+GLYvyP0GRV1GunRtr9b2nHIydpvxUihWQcS94O60+73tmBtuivq3Xqh
         i0/qC7g2wpNz+Td4h5ZRAhOzND9PnyP2+z+eCdvSvY4PSjTXME9delQLxkfMraeG2MVM
         DInw==
In-Reply-To: <20170215035200.29934-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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

Changes in v5:
- Use an interactive session to demonstrate pylibfdt
- Mention that more work remains

Changes in v4: None
Changes in v3: None
Changes in v2:
- Add details on how to obtain full help and code coverage

 README | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/README b/README
index f92008f..d4157ad 100644
--- a/README
+++ b/README
@@ -7,6 +7,49 @@ DTC and LIBFDT are maintained by:
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
+>>> prop_offset = fdt.first_property_offset(node)
+>>> prop = fdt.get_property_by_offset(prop_offset)
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
