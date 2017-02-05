From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v4 3/5] Mention pylibfdt in the documentation
Date: Sun,  5 Feb 2017 13:13:21 -0700
Message-ID: <20170205201323.15411-4-sjg@chromium.org>
References: <20170205201323.15411-1-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=2wcoXbc1Kx+XlycNnaWKGPIRPGZ4qaVKYd0zMC5f1tc=;
        b=b9nmWfAX/FlSEmjs3dbdCed1ra+i2QXXfjEX9RmlUhjLqpRTt/Nfj0KQAqEMGNYCuw
         8Kftx0oHnPtFA7QbvehcZSv18aTXFN5UbYI9qUYysxtD3xk+Q83qHgiFPlEQHW1UuEOD
         pQnXbr6+Rq07gHyu1iRxrXSo95o/kK7YwRkXFx/goX2h0Rm1E6Vk55LGAYwkq8GobnGR
         7JGCWXoKaZdzHlT3x3PAOsni6QPKeMFB31ZmbszTC9R6NODRaL/1vhy/jepdHM3ZkjfR
         1v6Fsu31M9j6rW3rTVZHEcuD63kLpOt9g4TkltyFDAk/SIgY2ejgAj7f/Hi+A91WTGfo
         mi/g==
In-Reply-To: <20170205201323.15411-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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

Changes in v4: None
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
2.11.0.483.g087da7b7c-goog
