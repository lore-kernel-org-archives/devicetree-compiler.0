Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6153914A0AA
	for <devicetree-compiler@vger.kernel.org>; Sun, 11 Aug 2024 15:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723388584; cv=none; b=hkJD9ukWoqemSvbMB56kKSPvej2rL4GeaN8a7Xcg+0MVJt11KudnX79mCjBily+mpQ/5qy9zIBL8YQndafSt7kK14eVmzRW5Sd9l8bzMo4MSbO6Yw7jiAd+ignOrCZInS6rFQaMo01Qu1BlWN3ivTBIxpyNdRdLlfMoU6dwBriQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723388584; c=relaxed/simple;
	bh=ytBzqs9nGRb00k+crK9ywLWczKlWGY6FjEIwT8HyJ+4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kRYURRsvi9e1CR9TJMZfE/sue3M248TObVetYHU2wbHLEOO8mqMzfmz3ICjsDJlWY8wqBgohJz2LecxgAuLIBV1I7dTiN813H1PUbM9uAqVt8St7J1gLLC6g6c9WpSHDEtMuseZlTVMNsOv+Bqa23ME3OgQ9qFB4z2E2ojC4bLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EUyFy+y0; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EUyFy+y0"
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-81f9339e52cso167396939f.0
        for <devicetree-compiler@vger.kernel.org>; Sun, 11 Aug 2024 08:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723388581; x=1723993381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yx6RbUBpH5BCaXAUSwM503gwbGWhGxNuHseIW14ZhO4=;
        b=EUyFy+y0HBCW6JFbzFHARMYgXaygS2EFhx9me2f8zqv663oJq0gL5kXmf3mTR1l/yC
         rYsuz43yK5BxrICnIgXQLt2vvt1S0//DyimJ6A6UNQIy4PM/ldVVL8KxrvNGdxaB3aL3
         LShIWJ9gmvFbsOEzd9tBNOu7K79Xn/2FMPiB4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723388581; x=1723993381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yx6RbUBpH5BCaXAUSwM503gwbGWhGxNuHseIW14ZhO4=;
        b=CQmBb2NEmRMOxJqbQZuHnWRv0q6RGZ8gyrTBLaK8AFd5Wf6aCJiQKXxa852nNq4f7j
         CG/Ku7ca4L7PbCJ71iZ6bMK1zLWFg1uEaO0JJFeuxlHdtwkSkwrsnQtxvNNc+eSQkT8U
         SaRVTO+i2ngPWCshMrl6EDiptv13Se+0ldul5EHDdwaZGJEmacEXOhqD7GYCjtx/HJ7z
         3XMgztcYo9rz7EOiAEfPk4jGz7s2c3q1CXGAbP/UtIiUtCrcY0HiXa1PU8S9y3xvcIPL
         t4vdBLKWX6bmLkEzQWIP/IIxAmcUSX5+ErhA6csMHdI9xdxn8oSF9eZUGvHNglQ7kGuX
         A6hA==
X-Gm-Message-State: AOJu0YxTcWrcgtfzfIISBtWd37emsHGHZX8KO4siVfoUgGCQmdaaFHNp
	KiQ1KlHZXmGwoU7le2fzYbqzVhcptu5sFldgKjKiydtM/EOgOYh7XXjMCU3RDLDUDT4630fYOOs
	=
X-Google-Smtp-Source: AGHT+IFBUvgs/s63+uC+jfBYS26GyGjaPPeRd5HmRWJtJrmhHSGi58afQxNf9p3MYNM+VZ1VAw3Bqw==
X-Received: by 2002:a05:6602:168d:b0:809:83e3:a35c with SMTP id ca18e2360f4ac-8225ee77040mr818874139f.7.1723388581108;
        Sun, 11 Aug 2024 08:03:01 -0700 (PDT)
Received: from chromium.org (c-73-14-173-85.hsd1.co.comcast.net. [73.14.173.85])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ca7695a584sm1060611173.73.2024.08.11.08.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 08:03:00 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Gua Guo <gua.guo@intel.com>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH 2/6] Tidy up some pylint warnings
Date: Sun, 11 Aug 2024 09:02:44 -0600
Message-Id: <20240811150248.7537-2-sjg@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240811150248.7537-1-sjg@chromium.org>
References: <20240811150248.7537-1-sjg@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Resolve all the pylint warnings currently in setup.py

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 setup.py | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/setup.py b/setup.py
index 749bf1b..4e880e4 100755
--- a/setup.py
+++ b/setup.py
@@ -7,28 +7,32 @@ Copyright (C) 2017 Google, Inc.
 Written by Simon Glass <sjg@chromium.org>
 """
 
+import os
+import sys
+
 from setuptools import setup, Extension
 from setuptools.command.build_py import build_py as _build_py
 
-import os
-import re
-import sys
 
 srcdir = os.path.dirname(__file__)
 
-with open(os.path.join(srcdir, "README.md"), "r") as fh:
+with open(os.path.join(srcdir, "README.md"), "r", encoding='utf-8') as fh:
     long_description = fh.read()
 
-with open(os.path.join(srcdir, "VERSION.txt"), "r") as fh:
+with open(os.path.join(srcdir, "VERSION.txt"), "r", encoding='utf-8') as fh:
     version = fh.readline().strip()
 
 def get_top_builddir():
+    """Figure out the top-level directory containing the source code
+
+    Returns:
+        str: Directory to build in
+    """
     if '--top-builddir' in sys.argv:
         index = sys.argv.index('--top-builddir')
         sys.argv.pop(index)
         return sys.argv.pop(index)
-    else:
-        return srcdir
+    return srcdir
 
 top_builddir = get_top_builddir()
 
@@ -42,15 +46,18 @@ libfdt_module = Extension(
     swig_opts=['-I' + os.path.join(srcdir, 'libfdt')],
 )
 
-class build_py(_build_py):
+
+class BuildPy(_build_py):
+    """Small class to run the build_ext command"""
     def run(self):
         self.run_command("build_ext")
         return super().run()
 
+
 setup(
     name='libfdt',
     version=version,
-    cmdclass = {'build_py' : build_py},
+    cmdclass = {'build_py' : BuildPy},
     author='Simon Glass',
     author_email='sjg@chromium.org',
     description='Python binding for libfdt',
-- 
2.34.1

