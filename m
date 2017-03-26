From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 1/7] pylibfdt: Allow pkg-config to be supplied in the environment
Date: Sun, 26 Mar 2017 13:06:17 -0600
Message-ID: <20170326190623.27518-2-sjg@chromium.org>
References: <20170326190623.27518-1-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Rnu4PivPZJ/tpeSzlvHZ2vxMswk49AmGlM6hyeaVqOQ=;
        b=Huc2ey0VLbpDIUheFB7xbIFRHVHVCdF6s6TgJuTxnTdstGmyBz22nsx8rDdXN5Tj+z
         80vtIems1qNEj0vI2fMv911J6GQDMlynmlRjk5GhurqZdDGQ4JNqXv5UUFAHJbrLjlxY
         vHXhtJU4pt5p8Ytdj5/nuicuY86vwMjegQL5IP5waLJS+3Km7FR6T8C+AcjjylDwdgBd
         K8y8jAxGoVK3L/HK3XZ6kfV4lby3Lzb+bTH2wVMO08gNXIFc4874k90wSXs2DEaDQByO
         h1oFsqKFkhdhoWMf7h4m8tPw0zCLy8cpJjJ+DvsdkeF8Rns8soYXnknFsqXltGCBnDEk
         YzEA==
In-Reply-To: <20170326190623.27518-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Some build systems have their own version of the pkg-config tool.
Use a variable for this instead of hard-coding it, to allow for this.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Suggested-by: Mike Frysinger <vapier-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

 Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 1d08ec1..e6d8251 100644
--- a/Makefile
+++ b/Makefile
@@ -23,6 +23,7 @@ CFLAGS = -g -Os -fPIC -Werror $(WARNINGS)
 BISON = bison
 LEX = flex
 SWIG = swig
+PKG_CONFIG ?= pkg-config
 
 INSTALL = /usr/bin/install
 DESTDIR =
@@ -119,7 +120,7 @@ SCRIPTS = dtdiff
 # We need both Python and swig to build pylibfdt.
 .PHONY: maybe_pylibfdt
 maybe_pylibfdt: FORCE
-	if pkg-config --cflags python >/dev/null 2>&1; then \
+	if $(PKG_CONFIG) --cflags python >/dev/null 2>&1; then \
 		if which swig >/dev/null 2>&1; then \
 			can_build=yes; \
 		fi; \
-- 
2.12.1.578.ge9c3154ca4-goog
