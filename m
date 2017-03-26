From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 2/7] pylibfdt: Allow building to be disabled
Date: Sun, 26 Mar 2017 13:06:18 -0600
Message-ID: <20170326190623.27518-3-sjg@chromium.org>
References: <20170326190623.27518-1-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=HVhqzYVnheFVsM41q6WIXI4oYyZSCdTxWCc1Imkz+8U=;
        b=ASlpcx96q/abreza89XJYXDFs108c2vZO7QHpRp24nwjQxbarTrTiC9uOYl/TLLYx7
         go6ERSwcRYzTJV8dCQ4+VikqnEZv5Nr73s9mqFQgy2q6EHT4upwct4OuBMtHe7hGRJWi
         6LLybJzqLEMJbCCf0wdnhFszFUAC+sXkZtWbjo18OWqopAY7Pml9UFMinjTO0FixwTNk
         qRLoxFbBra+ibop4hKxQdboZCOYgxCGxfreQAoXdnzljewz0J0Kb/We5f0Q5y/okwlhi
         7TcBAvdPabYx31G1o4fxRAfYB2LjJZpupgmmt0z3IECEpag263/u0vKs3B9we1bXiRI6
         eXgA==
In-Reply-To: <20170326190623.27518-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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
2.12.1.578.ge9c3154ca4-goog
