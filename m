From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 3/4] pylibfdt: Split setup.py author name and email
Date: Wed, 10 Nov 2021 19:11:34 -0600
Message-ID: <20211111011135.2386773-4-robh@kernel.org>
References: <20211111011135.2386773-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20211111011135.2386773-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Bruce Ashfield <bruce.ashfield-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>

The 'author' field in setup.py is supposed to be just the name. The
email address goes in 'author_email' field.

Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 pylibfdt/setup.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/pylibfdt/setup.py b/pylibfdt/setup.py
index 52b61b6d7be2..75ce09ac8f6d 100755
--- a/pylibfdt/setup.py
+++ b/pylibfdt/setup.py
@@ -41,7 +41,8 @@ setup(
         "root": os.path.join(srcdir, '..'),
     },
     setup_requires = ['setuptools_scm'],
-    author='Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>',
+    author='Simon Glass',
+    author_email='sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org',
     description='Python binding for libfdt',
     ext_modules=[libfdt_module],
     package_dir={'': srcdir},
-- 
2.32.0

