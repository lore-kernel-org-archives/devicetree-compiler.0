From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC PATCH 2/3] dtc: make check test for dtc --annotate
Date: Tue, 15 Sep 2015 21:24:59 -0700
Message-ID: <55F8EF1B.1040003@gmail.com>
References: <55F8EB35.5010601@gmail.com>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:reply-to:user-agent:mime-version:to:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=fW71uF9vRHIeKTnU/AtCXXWNGxllbePxqntq8e6USOA=;
        b=jItXJZZqocTWFL0BkcVBLzNMFWFd8tVd3ePdeWvn3tYh7HW9xikYTFYDGpJ8CAincp
         UBoRdNGb6H+2mQFVzOkqPWvTC2UMeTTVhI5Fjx4cWYe3Bqa9Xzo7O1iiceULwy2cCJjW
         5zv1WyAywOIsDQdWzth3OYJERH1uOraPQkfcAg2OT3zgocccA3TiwiVGHo3QWLOACI25
         YGPg0Rwk+xiBfpBvhf6o7XnoCfRlCctUWgPVm3RL6hzUiACOLDGiV2NszLGi1zavvrPh
         ePOiGiP0BamfXTVf5JATryHcOs7HfZSgxQG4XVLMsDUwGy9TZyZ4IrouuauW55X+bVlm
         xr1Q==
In-Reply-To: <55F8EB35.5010601-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>

Add dtc tests.

  - dtc --annotate to create a .dts with annotations
  - compile the annotated .dts

Not-signed-off-by: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
---
 tests/run_tests.sh |    3 +++
 1 file changed, 3 insertions(+)

Index: b/tests/run_tests.sh
===================================================================
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -276,6 +276,9 @@ libfdt_tests () {
     run_dtc_test -I dts -O dtb -o sourceoutput.test.dts.test.dtb sourceoutput.test.dts
     run_test dtbs_equal_ordered sourceoutput.test.dtb sourceoutput.test.dts.test.dtb
 
+    run_dtc_test --annotate -o sourceoutput.test.annotate.dts sourceoutput.dts
+    run_dtc_test -o sourceoutput.test.annotate.dts.test.dts sourceoutput.test.annotate.dts
+
     run_dtc_test -I dts -O dtb -o embedded_nul.test.dtb embedded_nul.dts
     run_dtc_test -I dts -O dtb -o embedded_nul_equiv.test.dtb embedded_nul_equiv.dts
     run_test dtbs_equal_ordered embedded_nul.test.dtb embedded_nul_equiv.test.dtb
