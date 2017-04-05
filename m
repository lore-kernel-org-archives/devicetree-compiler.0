From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v3 2/5] pylibfdt: Fix code style in setup.py
Date: Wed,  5 Apr 2017 10:01:39 -0600
Message-ID: <20170405160142.10564-3-sjg@chromium.org>
References: <20170405160142.10564-1-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=xZkYG5XfcO/3D3SNFCygBe0sNU09nziBbUiGKwZIi+c=;
        b=VIy6Geh96N1FC/gq7GaWV4v8XoXAIJDx7JGLwIu2aCKj/xe17pIMISG4nSYlAScl2P
         lQurjQ5YOUaxIOzG8e9OMjCY+kHJEe74vjF1kdTzoGZ3ogQBUIIwsuId1ESpJZh6vIJm
         PHxYkEIIjpRT4dsnUaFFiy49804Woo8EKhIEeEjjBhfhXU8BjuLV1LAP0/7Mhg/LIA5g
         hRr/yvt+shSLjDt7yqx4J6Vg3svKtgo3KVVt9MUZ6sgnD53UnGRyFm49Q5y1O2BLWJ44
         Eiw+tap1WoaBLLirgoYM3d6DxDRM3Lbig0yyocEMBdULdtQgYcdRzWwU0Np+hWJs/1Uk
         a7iA==
In-Reply-To: <20170405160142.10564-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

We should follow PEP8 even for our setup() call.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Suggested-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
---

Changes in v3:
- Add new patch to fix code style in setup.py

Changes in v2: None

 pylibfdt/setup.py | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/pylibfdt/setup.py b/pylibfdt/setup.py
index 3bafe30..1597b44 100644
--- a/pylibfdt/setup.py
+++ b/pylibfdt/setup.py
@@ -24,11 +24,12 @@ libfdt_module = Extension(
     extra_compile_args = cflags
 )
 
-setup (name = 'libfdt',
-       version = version,
-       author      = "Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>",
-       description = """Python binding for libfdt""",
-       ext_modules = [libfdt_module],
-       package_dir = {'': objdir},
-       py_modules = ["libfdt"],
-       )
+setup(
+    name='libfdt',
+    version= version,
+    author='Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>',
+    description='Python binding for libfdt',
+    ext_modules=[libfdt_module],
+    package_dir={'': objdir},
+    py_modules=['libfdt'],
+)
-- 
2.12.2.715.g7642488e1d-goog
