From: Ilya Lipnitskiy <ilya.lipnitskiy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/4] checks: clean up string parsing
Date: Mon,  3 May 2021 20:59:40 -0700
Message-ID: <20210504035944.8453-1-ilya.lipnitskiy@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=03WTmOEW6ni4PR0tOfbZ1UfmVaeg9msEeEyEvcBzIXQ=;
        b=TDQMtC2LPCH2gNW4GA2IHAsBPQPWu/DrySFBNUM2N5ZB8g1r4vQAGdBiwuFIY3BIOt
         KxlXJasKayPrDi41MwIphwPvC0x2Bu4lv7lrDD3nfLX5YV9B6kbkY3fd5jCRask4UgLG
         adeLUJPeTpI4OUDx20ZO6yVi2aHFbs+iSNFpWLy9fbX569uku07kv9rbxRQZxL5oYzn3
         34E2bD2sayQN80xX3F9yRNXQYIscjlpQzBPj54bHuWxQOO4l/WyjaN+TbnyyFvuI+X3t
         RfbzpodSwqICMLZdxt3L129e/HLn5IvIH6GAtp7fs1TF2zEr3Ifsz7YBA3VovXcvEmUD
         xzdQ==
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <loeliger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Ilya Lipnitskiy <ilya.lipnitskiy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Add a new function, strends(), as suggested in [0]. Replace existing
suffix logic with calls to strends().

Make nr-gpios exception stricter by aligning with the devicetree spec
and the logic in the Linux kernel.

Add a test case to cover correct non-deprecated GPIO properties.

[0]: https://www.spinics.net/lists/devicetree-compiler/msg03634.html

Ilya Lipnitskiy (4):
  checks: tigthen up nr-gpios prop exception
  dtc.h: add strends for suffix matching
  checks: replace strstr and strrchr with strends
  tests: add a positive gpio test case

 checks.c            | 25 +++++++------------------
 dtc.h               | 10 ++++++++++
 tests/good-gpio.dts | 12 ++++++++++++
 tests/run_tests.sh  |  2 ++
 4 files changed, 31 insertions(+), 18 deletions(-)
 create mode 100644 tests/good-gpio.dts

-- 
2.31.1

