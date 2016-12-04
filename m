From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v3 3/4] Mention pylibfdt in the documentation
Date: Sat,  3 Dec 2016 17:48:09 -0700
Message-ID: <1480812490-11926-4-git-send-email-sjg@chromium.org>
References: <1480812490-11926-1-git-send-email-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ua64L+l2WdEkBXbAJzo6f/hthdS7K23+SEBxv0mHsAw=;
        b=QQGG0Ru6aWxYRLL0ouA1NVjvbwpA7gBbBwPxw4R4AHcMqknnlXglxH+PzQ9f2aXGGR
         GpdDOk6kgP+q7ylexJGFGAoWqKekfJoHER01g6SB2lzqq2jEXZuIYKNzzpNPlgDn5F9p
         Yi2w0XMqvY9ybDcUp5lsD6oaJXuQO4W01KB/oAbjrrKAvEwztPDLxs2J4SWZq1dZRckD
         Dv1L+W2CeEiVvyqUS+kU4jDvbmCjIflJ/npw2a/LCzM8xrI3eY2jMalp7TTZkZuE3NE5
         2QqmbpbgmQzsxamjIvQwh+dsKN+gDyM0PRjdxd9pdVCcn1mf33fX5FGCIWuEb1UbiPql
         WSkQ==
In-Reply-To: <1480812490-11926-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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

Changes in v3: None
Changes in v2:
- Add details on how to obtain full help and code coverage

 README | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/README b/README
index f92008f..7191d1b 100644
--- a/README
+++ b/README
@@ -7,6 +7,39 @@ DTC and LIBFDT are maintained by:
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
+    fdt = _ReadFdt('test_tree1.dtb')
+    node = fdt.path_offset('/test-node')
+    prop = fdt.first_property_offset(node)
+    print 'Property name: %s' % fdt.string(prop.nameoff)
+    print 'Property data: %s' % fdt.data(prop.nameoff)
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
 Mailing list
 ------------
 The following list is for discussion about dtc and libfdt implementation
-- 
2.8.0.rc3.226.g39d4020
