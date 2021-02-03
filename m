From: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] gitignore: Add cscope files
Date: Wed,  3 Feb 2021 13:14:22 +0530
Message-ID: <3c39a6324ef2be64f839e6e6205f4afc63486216.1612338199.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U1ucixK16klgyJeB0ByozTt3uMqhYXbJNdVfKOc/aYg=;
        b=agdMsyqi1YWqtXDIkM5Q58lKJVStpCKhf/rHBL03KjEl2hbz8VAkqHRZKp+H2A6axk
         4BgtXjiescEVEKQ6gtlDjz0uLkAai4/sw7dTiXd/roCas3s5MmWIcoXDpv8ayO7E5enj
         BpC0CjfuuZ2nJu5oWszDztP9HIRcSZR2TBeNNTrYAks1gI0OKqnZhuR0cehIvMgQGqzg
         7v3BCWyxuV9Cx36HqJarJld+MqN2YZPyulz/P5qGG4SsPDnr7WuEbVwVv9b/6IUoJt/e
         QfxlG9qGJATDh2i24ULCD0/QYTAZfOb1NZiCvBOU34hhNhS0I7NEfWs/z/2p1kdyGwev
         bizw==
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vincent Guittot <vincent.guittot-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Add cscope files in gitignore.

Signed-off-by: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 .gitignore | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/.gitignore b/.gitignore
index 1f2a0f250a61..cfea8a434eed 100644
--- a/.gitignore
+++ b/.gitignore
@@ -17,3 +17,7 @@ lex.yy.c
 /fdtoverlay
 /patches
 /.pc
+
+# cscope files
+cscope.*
+ncscope.*
-- 
2.25.0.rc1.19.g042ed3e048af

