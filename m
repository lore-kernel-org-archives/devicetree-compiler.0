Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD701494B2
	for <devicetree-compiler@vger.kernel.org>; Sun, 11 Aug 2024 15:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723388585; cv=none; b=EEup9HJw7jhuemUXMYnz/X0/VC59PGFr/UPnvb3eSX0N5KmFiPA1Arl/UWeyLn2AvfhkQoWUEntL1oocspCS3kvm6N1hL/ZWgyqzGVtRkuRCVu7/cBkyMR0ob1WfVtUQ1NDA4yrJypgb0AQbLifviw1dvBhh8OgVrLItJanfEN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723388585; c=relaxed/simple;
	bh=vH2WSbzNp/NwByQwK1F///9ODDqQsUdTXFW61KwRhjI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qp8QU77roQjY6yVTP0es8UQehhdUWaKra5+gyz2fFBF3IZLbK8T3B2zHe9a36ZJOCRSq77OVYMffZ0Na9eIqMzVhxnovjSImVGInEOWDomR6eTELt3R3F3MeCsOjs48qb1+oiqnEq+B09mLjD5pmq1uuV3qg72AUrbiuPbi6q/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WO8z5bjB; arc=none smtp.client-ip=209.85.166.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WO8z5bjB"
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-81f921c40a0so136193539f.0
        for <devicetree-compiler@vger.kernel.org>; Sun, 11 Aug 2024 08:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723388583; x=1723993383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n6eO2jMqchlUhyinF7d4Qt36qauivCMqsCbmwcMXwJk=;
        b=WO8z5bjBIse35SBF3sdiRtIQIgDzIa683L/CM/FCGtl8FE80CPzK9KTAygpv+Aj6tx
         l+c0ktqNk1mvFRTjkvBmdsOjDnrwMbREceg5yj2fohjdxpazZhfeWraNOIo8DgkZT2FQ
         9JeTuhSWLQyn4XoD8E68KcqfC+bVDz/m7jH8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723388583; x=1723993383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n6eO2jMqchlUhyinF7d4Qt36qauivCMqsCbmwcMXwJk=;
        b=lc2nWvXxpGQAonoJHA696ymCQGpIkcrVZTUyJpllbmOkwAtSxUf4WeTvlAfnfElw1k
         yWoRsiYAVAbqCGvhwmK6+WX3uZmr4Dm87wcQ8Ufy+0bcJ1JdkqUbkCrAQN3NImV54jgp
         +y37XkgJotSNBZzLCBcbcxD8X7MUPKVA92RfoIhgpSKMZXsS3Vr7s/nO+OS4UrFmYt6H
         9aQTMfTiBabaIUQcRSGrirg14FZJRYmikMPqoFUFKHXiiVcLLHRKlb6BKseYGDbUMk+D
         u8GEcdtzMnlF9l2T0P6tKJs/GjLo10m92OMrGQ/xqUft9KPH9ByQW804MjqltKSjx1dn
         ApKw==
X-Gm-Message-State: AOJu0YzeZEUWN/MujdI8Oagij62vqX98H7qtW2WPWRJA5Wgg7uDZznWA
	E/KiJVMD9hTQ0RZXJpV5U16peL7EIDPoUv4/em9EBmUPOHEipetQsEcMQp+ESNwvjJY6RSedB20
	=
X-Google-Smtp-Source: AGHT+IFe3MM9I7gRqTm/wGe3CmQaxsmBiYBdDPYZLETtFtallzx1OBa1m6VHKrKKuTPHKGfsMQYS3A==
X-Received: by 2002:a05:6602:2c82:b0:81f:938b:f0cd with SMTP id ca18e2360f4ac-8225ee392afmr1272372939f.13.1723388582949;
        Sun, 11 Aug 2024 08:03:02 -0700 (PDT)
Received: from chromium.org (c-73-14-173-85.hsd1.co.comcast.net. [73.14.173.85])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ca7695a584sm1060611173.73.2024.08.11.08.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 08:03:02 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Gua Guo <gua.guo@intel.com>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH 5/6] setup: Move setting of srcdir down to the bottom
Date: Sun, 11 Aug 2024 09:02:47 -0600
Message-Id: <20240811150248.7537-5-sjg@chromium.org>
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

Put this variable assignment next to the others. Pass it to
get_top_builddir() instead of relying on the global variable.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 setup.py | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/setup.py b/setup.py
index be3cf90..52844ce 100755
--- a/setup.py
+++ b/setup.py
@@ -14,8 +14,6 @@ from setuptools import setup, Extension
 from setuptools.command.build_py import build_py as _build_py
 
 
-srcdir = os.path.dirname(__file__)
-
 def scan_for_info(srcdir):
     """Scan for the version and long_description fields
 
@@ -35,9 +33,12 @@ def scan_for_info(srcdir):
     return version, long_description
 
 
-def get_top_builddir():
+def get_top_builddir(srcdir):
     """Figure out the top-level directory containing the source code
 
+    Args:
+        srcdir (str): Source-directory path
+
     Returns:
         str: Directory to build in
     """
@@ -55,8 +56,8 @@ class BuildPy(_build_py):
         return super().run()
 
 
+srcdir = os.path.dirname(__file__)
 version, long_description = scan_for_info(srcdir)
-top_builddir = get_top_builddir()
 
 libfdt_module = Extension(
     '_libfdt',
@@ -64,7 +65,7 @@ libfdt_module = Extension(
     define_macros=[('PY_SSIZE_T_CLEAN', None)],
     include_dirs=[os.path.join(srcdir, 'libfdt')],
     libraries=['fdt'],
-    library_dirs=[os.path.join(top_builddir, 'libfdt')],
+    library_dirs=[os.path.join(get_top_builddir(srcdir), 'libfdt')],
     swig_opts=['-I' + os.path.join(srcdir, 'libfdt')],
 )
 
-- 
2.34.1

