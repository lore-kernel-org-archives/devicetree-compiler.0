Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2383D14A0AA
	for <devicetree-compiler@vger.kernel.org>; Sun, 11 Aug 2024 15:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723388586; cv=none; b=U2w2HhghbOD5wtXla1dtlytIxh5kJ6jZt//2F6oBB2CPLvV2Rc0uvFtZjA71yjojgcFFKk1eeo6IuGvMvl9Kw87PS1VuA5od4WodOHyLP5IC73istwi3NLJhymKiqj9CUr/zFjIdPGGgSTsJq3Te2rBp8/4U7DU8Y6vXciiSPjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723388586; c=relaxed/simple;
	bh=FaOFA+wZz397dKVTzIv/UdxEBkt9DEPG17Z9e4ddJ/M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oE/cTFNGlbnAG2M2Kc2q6cBzwsGhkqEnLApul1WrYpwtbfAO7bgYZoA7JjlJn18wRxATAlHbJfirtOcUj0MMzh+RoCRzAEGb4vTnIzeIHYCDi1rfbU7mB+CzRhS2eDYaF94z3tjyaQtQcQi8qA+gZ+BeRFsWyL8OTM23FNvzf0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=X5jiPKdi; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="X5jiPKdi"
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-81fd1e1d38bso181977739f.1
        for <devicetree-compiler@vger.kernel.org>; Sun, 11 Aug 2024 08:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723388584; x=1723993384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+FByh4+nZdFGs0obQhsASZCi18HXiRNupM9hydWFiLg=;
        b=X5jiPKdi/D6HmAKL1PW8sZCQgldRLHC7pJsPejy6+Z6Tl+aMo2Zh5tk54+3D2bBwh9
         CqmdfMYw5X2sKoG0p4z3fusWdzI5PXpovr4R3cSfWnlQubytKxCwlJLZCzC71ooxh3iU
         S1iP+PCOTtmm4Q9rqHsuNUWJZ4RTBe/ilR4XQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723388584; x=1723993384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+FByh4+nZdFGs0obQhsASZCi18HXiRNupM9hydWFiLg=;
        b=Tl5yTzO+OLCbKPhu802iCbUeRVEhVHm1m8qZvPJ2UyqsBp6qGMhbETZzmUqM1zeIIe
         IzxuzAFhU9n2l8eJt3Y4dpkT1SJzjduhtZYjpML7g3L/QZIMo53agUZLpdi/B5kpnx1M
         p7VeoYZyIQ3mxhJKUrqKj4i514ECeghs0q4Gp2pUDJEjIZKWptJLpG1aaaAR7QCOPfcU
         QXZRRBqs2020roIxOOiohl/IMu1vzP3+dOPIqwVLbvg82DCXTX3IVP7ZzfhaWAg2MIMS
         YT+acIP8Fuec19PKSawk3L5M6dD5kOf7V4QvGnTgugnb4Bt1WwzMTqHff0KeUwkWerxe
         EHvw==
X-Gm-Message-State: AOJu0Yx9AzmrNBobo89UipE8XMux6DG4KxnTdMNwWF5eOkJICEya/qxI
	0oZ+brkcZXhWvVGjzLFAr/+vRgNOmO9aBfVlW099K42DsxF7gO40p/Yo9c/6hC6jj4ts1ztJ7OM
	=
X-Google-Smtp-Source: AGHT+IGs2HbEnfUiUBX9LFAn3e/sOB8vUteZYwfYyifKX0M4/YXAmD7o21HxnxRmNj7sXsNaLiBIKQ==
X-Received: by 2002:a05:6602:1647:b0:7f9:59af:c26b with SMTP id ca18e2360f4ac-8225eed34e3mr1144640239f.17.1723388583912;
        Sun, 11 Aug 2024 08:03:03 -0700 (PDT)
Received: from chromium.org (c-73-14-173-85.hsd1.co.comcast.net. [73.14.173.85])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ca7695a584sm1060611173.73.2024.08.11.08.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 08:03:03 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Gua Guo <gua.guo@intel.com>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH 6/6] setup: Add dependencies for Windows
Date: Sun, 11 Aug 2024 09:02:48 -0600
Message-Id: <20240811150248.7537-6-sjg@chromium.org>
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

From: Gua Guo <gua.guo@intel.com>

Windows apparently builds pylibfdt if swig is declared as a dependency
in the setup file. Otherwise it must be installed manually and Windows
does not sport a package manager, so this is hard for users.

This change seems to have no ill effects on Linux, at least.

So add a new setup_requires line.

Signed-off-by: Gua Guo <gua.guo@intel.com>
Signed-off-by: Simon Glass <sjg@chromium.org>
---
This was picked up from:

https://github.com/devicetree-org/pylibfdt/pull/2

 setup.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/setup.py b/setup.py
index 52844ce..6efdae6 100755
--- a/setup.py
+++ b/setup.py
@@ -76,6 +76,7 @@ setup(
     cmdclass = {'build_py' : BuildPy},
     author='Simon Glass',
     author_email='sjg@chromium.org',
+    setup_requires = ['swig'],
     description='Python binding for libfdt',
     ext_modules=[libfdt_module],
     package_dir={'': os.path.join(srcdir, 'pylibfdt')},
-- 
2.34.1

