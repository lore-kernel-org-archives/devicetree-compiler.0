From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 09/10] README: Add a note about test_tree1.dts
Date: Sat, 19 Aug 2017 11:18:02 -0600
Message-ID: <20170819171803.195806-9-sjg@chromium.org>
References: <20170819171803.195806-1-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=4dQS76no2V/VtN7EfMMrzJfuX1dxDCpKIMgYNnHNcwM=;
        b=Z5I1IEgZJLeg2tf6o7YJe/BQzS8pbVcrKcuyRaf2EYSrofkgVkpRaB/m4oYMNAC8Fe
         AA/0ohfccuM9dDNacP7zMBy3isiYA9cEGk8lAJIA7/S5x75OaKq+VMUH3qidldIvcX9G
         waIkjGHdtxpA5fCv1pvY0+3xHNyi3hBjI8hfPhppm8F1sDvEa4FygsxWlqi917r+KgCg
         0vlUp2lJf3sCu/Hky3yC/eL2xD/8i4tU9WvO15QfstRH5baikr/5TTCPhE8aW3RhQjUx
         swS3r+Y0jezve0vOgugZiKOQ/WvhjMo9k48UPZLU0isggc51RrheHDYmUlxu7vv4bWp5
         qHoQ==
In-Reply-To: <20170819171803.195806-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Add a little note in the README about something which confused me.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

 README | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/README b/README
index 17dc845..15232ab 100644
--- a/README
+++ b/README
@@ -73,6 +73,17 @@ More work remains to support all of libfdt, including access to numeric
 values.
 
 
+Tests
+-----
+
+Test files are kept in the tests/ directory. Use 'make check' to build and run
+all tests.
+
+If you want to adjust a test file, be aware that tree_tree1.dts is compiled
+and checked against a binary tree from assembler macros in trees.S. So
+if you change that file you must change tree.S also.
+
+
 Mailing list
 ------------
 The following list is for discussion about dtc and libfdt implementation
-- 
2.14.1.480.gb18f417b89-goog
