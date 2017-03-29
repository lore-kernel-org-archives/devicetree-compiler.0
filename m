From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2 1/6] pylibfdt: Allow building to be disabled
Date: Wed, 29 Mar 2017 12:15:36 -0600
Message-ID: <20170329181541.28856-2-sjg@chromium.org>
References: <20170329181541.28856-1-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=gL0wGIHFaLv60OzsKfDtiifS9tRu5q3Ti4Y6IJGhY6k=;
        b=kCBLtZ4mkWI3VQHAls/DU2mOrY6CmfoEji1zKVh3vC9lhfr8DxAtH8dNPytYeE+W8W
         iKssBiYD35USBaAo/ABAozdF07YMvnL8fM9FzwBufJrIgxgCmaca9u+RueYIOHOpEWZK
         IDLghHVruPu1PioUE7uW869/ZLt6x9vrFY9hF5GsTU88X7UykeW6qnoWlc7bXzJEyEnD
         csDk3lviHUp+MkfBVGSiXGBejI2rxsxSTgAx3HZzJThqwTvMdX3uEkI8nxp7N66tSDOI
         m6C+vHJ+WhJ9yUGE2jxBXFCkq6o1uFY8CFueSGKQv3Z1ijFnpBQdQxSDGQYt4hWzAosf
         ycow==
In-Reply-To: <20170329181541.28856-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Some build systems want to build python libraries separately from the
rest of the build.

Add a NO_PYTHON option to enable this.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

Changes in v2: None

 Makefile | 1 +
 README   | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/Makefile b/Makefile
index e6d8251..5cf4aee 100644
--- a/Makefile
+++ b/Makefile
@@ -120,6 +120,7 @@ SCRIPTS = dtdiff
 # We need both Python and swig to build pylibfdt.
 .PHONY: maybe_pylibfdt
 maybe_pylibfdt: FORCE
+	if [ -n "${NO_PYTHON}" ]; then exit; fi; \
 	if $(PKG_CONFIG) --cflags python >/dev/null 2>&1; then \
 		if which swig >/dev/null 2>&1; then \
 			can_build=yes; \
diff --git a/README b/README
index 96d8486..d2323fd 100644
--- a/README
+++ b/README
@@ -50,6 +50,12 @@ If you add new features, please check code coverage:
     # Open 'htmlcov/index.html' in your browser
 
 
+To disable building the python library, even if swig and Python are available,
+use:
+
+    make NO_PYTHON=1
+
+
 More work remains to support all of libfdt, including access to numeric
 values.
 
-- 
2.12.2.564.g063fe858b8-goog
