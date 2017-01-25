From: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] manual: Fix typo it -> in
Date: Wed, 25 Jan 2017 11:30:34 -0800
Message-ID: <20170125193034.12180-1-stephen.boyd@linaro.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=YzniFl/0vgwY3nNw3hqPSfclRwZ/Jtj57oCJifohGMg=;
        b=YBJjLFhb4kcaVXTUp95O1uiIWf/lmKObPbBiKATEmKqLDnCXkjKhqt3XJTF+16tbd7
         LPRNtK7xjqSvMBJtqEXev7GqIZmZ1P5ZWO2LZ+kgfcrxq+Mw6juJunaRgpfrOMCTQues
         hwgCoh8D2gKgF7R5dro+0riCXhPzzKKodpBlg=
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Two its in a row can't be right.

Signed-off-by: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 Documentation/manual.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/manual.txt b/Documentation/manual.txt
index 74e27c4c4ee1..2f073501f82b 100644
--- a/Documentation/manual.txt
+++ b/Documentation/manual.txt
@@ -228,7 +228,7 @@ Node may contain sub-nodes to obtain a hierarchical structure.
 For example:
 
     - A child node named "childnode" whose unit name is
-      "childnode at address".  It it turn has a string property
+      "childnode at address".  It in turn has a string property
       called "childprop".
 
 	childnode@addresss {
-- 
2.10.0.297.gf6727b0
