From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/4] pylibfdt: Use setuptools instead of distutils
Date: Wed, 10 Nov 2021 19:11:32 -0600
Message-ID: <20211111011135.2386773-2-robh@kernel.org>
References: <20211111011135.2386773-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20211111011135.2386773-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Bruce Ashfield <bruce.ashfield-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>

The use of setuptools is favored over distutils. setuptools is needed to
support building Python 'wheels' and for pip support.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 pylibfdt/setup.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/pylibfdt/setup.py b/pylibfdt/setup.py
index ef40f1542cf1..f065a5947067 100755
--- a/pylibfdt/setup.py
+++ b/pylibfdt/setup.py
@@ -10,7 +10,7 @@ Copyright (C) 2017 Google, Inc.
 Written by Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
 """
 
-from distutils.core import setup, Extension
+from setuptools import setup, Extension
 import os
 import re
 import sys
-- 
2.32.0

