From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 3/4] Mention pylibfdt in the documentation
Date: Thu, 17 Nov 2016 15:53:24 -0700
Message-ID: <1479423205-9817-4-git-send-email-sjg@chromium.org>
References: <1479423205-9817-1-git-send-email-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=pXMzGhjOMVrg88pgEXjEYZbjH+Hp1ba+YDIdV04OeQg=;
        b=XZJdddmiCVIBic0QD9d/FxPmD4XayPc+KbcplMflFzCZzUhs4+FGqVc8xl00FU3tWx
         c4qHm/CO1++PTrtnRrzw8spmXUJCCEkA5+Bk5SIjVJwsbfHIcLc4FyFW08IuuoBgTVm6
         4DWcLpPt9gLLUnrohq2kQI5nPaaY+KVsh0YI5/LWthLu2g/KOpkxlqeXedhRZBtVyWhv
         p3k7eAw5pMd6VFQZGCXGkpiXHyr79cFnRvbU9/L8187N1er+Tiimx5C8A8KQBMwOXL/J
         8PrBNcx+bq9pAnBSxq5AUqd0C7Klbm4FHh/gEXz6AnquoUuYUnK7sy5IF90r7WmKQEhc
         ZLpg==
In-Reply-To: <1479423205-9817-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Add a note about pylibfdt in the README.

Full documentation for pylibfdt will need to be provided also.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

 README | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/README b/README
index f92008f..dee77c8 100644
--- a/README
+++ b/README
@@ -7,6 +7,12 @@ DTC and LIBFDT are maintained by:
 David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
 Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
 
+A Python library is also available. To build this you will need to install
+swig and Python development files. On Debian distributions:
+
+   sudo apt-get install swig python-dev
+
+
 Mailing list
 ------------
 The following list is for discussion about dtc and libfdt implementation
-- 
2.8.0.rc3.226.g39d4020
