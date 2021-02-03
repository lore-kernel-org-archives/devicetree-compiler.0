From: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] gitignore: Ignore the swp files
Date: Wed,  3 Feb 2021 15:26:36 +0530
Message-ID: <15496f8669ac2bb3b4b61a1a7c978947623cb7c3.1612346186.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oG59iMJIMmDeK8cuiUot17ySm03fXmfM+6j2IaQrxgI=;
        b=Ch37i8Zi02Utrh9sxL3yVcj8EgQH6OlNQMBbfKKnRhn47kvbjJGntfsNZlS/kMr3IC
         ZaZ27ipWWfymMz1D7wUn+UuytVD6XrXNlxlAvcc7TKz3AhWxxE9YeMECdKtFJqegrSFh
         64LGpJApc2jf5fNG4H6xeOP1qIS9zACYsljO6ePn03DqqKWxTj0hNFN5DtxUWrRkMulu
         wLwXWxTMEnsiO8PuCVGo4JiLSsjCd5i4H7DfQ2aPz6r+gvtld7l0X120YKNn4LxJ594X
         ejHq9BnMwtjdbyFYwIQjzvnyJHdg9yxxfgZJjAWouGK3ys9eAHTucDFAhlaclBpNuUr6
         E9Hw==
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vincent Guittot <vincent.guittot-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Ignore the temporary .*.swp files.

Signed-off-by: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 .gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index cfea8a434eed..8e332d8d8e07 100644
--- a/.gitignore
+++ b/.gitignore
@@ -8,6 +8,7 @@
 *.tab.[ch]
 lex.yy.c
 *.lex.c
+.*.swp
 /dtc
 /fdtdump
 /convert-dtsv0
-- 
2.25.0.rc1.19.g042ed3e048af

