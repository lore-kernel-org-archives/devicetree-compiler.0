From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v9 3/5] Mention pylibfdt in the documentation
Date: Sat,  4 Mar 2017 16:52:26 -0700
Message-ID: <20170304235229.5343-4-sjg@chromium.org>
References: <20170304235229.5343-1-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=pihiE6w/aeXqN2iRp8G5EgcGoEPJXN1kF/pXfefeE9w=;
        b=vmc0RC5CSJjq/lsQnviF03EQ+cM00p3dkluDox+OfY15nU96reDmvIw2UpyBYz5iMq
         Lp4bn4cXPCqBPyvbx0RzFZ28q8J3JLnJMFqGupiV9xVKIssuo+OoKXCzjOgKWTw+M/Aw
         O0eBwLzEZI3Bmo99dbOEwigGZ1R/b3PFbDpff2zCEpzc4RL0RRpcDWmlYK/RQ2uPHq12
         KC6QlVTOFiJfLz5tznAHDo3SbwcKXNfqkyklZJXruFSQDE+jiUZvQyhkdPGGgJmXkagk
         esGbDhSVWwTQgIj3teSb0lSI9hqhqUMPLWRlogZBGpxpP6ALxKl8ZKO9MA49hEH7fNsN
         lNUA==
In-Reply-To: <20170304235229.5343-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Benjamin Bimmermann <b.bimmermann-LWAfsSFWpa4@public.gmane.org>, Ulrich Langenbach <ulrich.langenbach-srmvecZYGfHobmly5n/iKBvVK+yQ3ZXh@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Add a note about pylibfdt in the README.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Reviewed-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
---

Changes in v9: None
Changes in v8: None
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
2.12.0.rc1.440.g5b76565f74-goog
