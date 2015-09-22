From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC PATCH v2 2/3] dtc: make check test for dtc --annotate
Date: Mon, 21 Sep 2015 22:38:27 -0700
Message-ID: <5600E953.40308@gmail.com>
References: <5600E191.9020903@gmail.com>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:reply-to:user-agent:mime-version:to:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=JddvchK/jDiC8BKftDxzOUnD1jklJ9obDbDLoqUggIc=;
        b=mYlD1Dk+4KoHfLdGhIS7J8bfmtvsW6RsPywhGyuTkz6j0qx6m1cH9rs6/L/9EB1vbL
         fm6461X4RB3i7ojM3HPB/HLV+UfEka86rrplRyAXk661T6btBcXqt0mFHGoDHZAgyEVE
         QzJMoY1xKQAWtRL+tek0kNjFp/gquB0sx9FjDxWZEAQu+uzkNYLBCnrESax0Uk1xtMkv
         sBIcXd5gG1jvpE0DUzaFGtfOeI0uaxOQE/jkfJv+bLTRXNud+S4NzU+faZi8s1thKdID
         lNPujUGiRAj9YFYzE9pIEyt3xjTYgwSgOowhv62g7qqrEx0Bhcnnz8XCPSWv/XRp7aR3
         C5Rg==
In-Reply-To: <5600E191.9020903-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, jdl-CYoMK+44s/E@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>

Add dtc tests.

  - dtc --annotate to create a .dts with annotations
  - compile the annotated .dts
  - compare the .dts created from include0.dts to the .dts created
    by first compiling include0.dts with annotations, then compiling
    the resulting .dts without --annotations to strip the annotation

Not-signed-off-by: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
---
 tests/run_tests.sh |   10 ++++++++++
 1 file changed, 10 insertions(+)

Index: b/tests/run_tests.sh
===================================================================
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -276,6 +276,16 @@ libfdt_tests () {
     run_dtc_test -I dts -O dtb -o sourceoutput.test.dts.test.dtb sourceoutput.test.dts
     run_test dtbs_equal_ordered sourceoutput.test.dtb sourceoutput.test.dts.test.dtb
 
+    # verify annotated .dts can be compiled
+    run_dtc_test --annotate -o sourceoutput.test.annotate.dts sourceoutput.dts
+    run_dtc_test -o sourceoutput.test.annotate.dts.test.dts sourceoutput.test.annotate.dts
+
+    # verify annotated .dts can be stripped to match non-annotated
+    run_dtc_test -o includes.dts include0.dts
+    run_dtc_test --annotate -o includes.annotate.dts include0.dts
+    run_dtc_test -o includes.annotate_undo.dts includes.annotate.dts
+    run_wrap_test cmp includes.dts includes.annotate_undo.dts
+
     run_dtc_test -I dts -O dtb -o embedded_nul.test.dtb embedded_nul.dts
     run_dtc_test -I dts -O dtb -o embedded_nul_equiv.test.dtb embedded_nul_equiv.dts
     run_test dtbs_equal_ordered embedded_nul.test.dtb embedded_nul_equiv.test.dtb
