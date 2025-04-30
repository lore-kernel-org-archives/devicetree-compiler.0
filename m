Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AD72609CA
	for <devicetree-compiler@vger.kernel.org>; Wed, 30 Apr 2025 15:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746026771; cv=none; b=fU2DA863F8scVYmFtjtF1MjXk8rAlI9fkgUjbBO9Q4VxIK6a3Wi187FZQy5wd+cRwmdnmFsA+0aWP8qvZxjz4Kp8Jlt7TIwWVvx247DKejECt9suVkz89qGxAHZ3Zc7PTzXAdC9y4to6oAIvghgoYhdbPQE0iW2qh2XiqdNTe5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746026771; c=relaxed/simple;
	bh=apEh09pLdZkK4Z7Zolf8z2OUype+mgu/9I4eRcofiFc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r+pFFO5RK1q+jQJ+2ooEMHMEGSJxfAMTI4YIIaeQX9cNapq+YYropBWLjN2NaWNY5fKA4382f06UHPj2/8wgnyNOM2dPjiKaxarz0HXj8HkPQKll7Dz3kZ97bVDN+ysQG4IZTYzmyFTQuNDgpgUTB0+7OKqiILq71gvIkxNElQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eYxh6vdi; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eYxh6vdi"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6e8fb83e137so399286d6.0
        for <devicetree-compiler@vger.kernel.org>; Wed, 30 Apr 2025 08:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746026768; x=1746631568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8MUN7aMAQfnEMIkdJCqctAN6QvaIvI2bskXt43vLDos=;
        b=eYxh6vdiFP2S9aFUDbAjHUJr4iYdyz9k4uQwUPuUIyDQnbksiRW+vhgsmeGSmywV7z
         wFajZo+rEUMb1chAXmE3vjBql3isLlMFJ7imMdmTqPt4juKqTyRjsjWTnqJkjUks9sbG
         lAv8VRPfWbtcHZaPMZyCKNqXEISYzhStW3/CnTfnWnaNmJ0A/Xtcs5bnaFPkePxwn7hH
         J/jSmnd+kmL8PNOjHbYavT7xQ7kh9B9FUfzM9ODbqeYdoBP8OZTaBau9LeRStYQCalf9
         5Vfy6IFFrfPMkj9/LXCFCLS7Uviq56+aLLBnKvGnQ6vm2lQnnfwMvyleWvmDSMpjThRv
         eO3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746026768; x=1746631568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8MUN7aMAQfnEMIkdJCqctAN6QvaIvI2bskXt43vLDos=;
        b=XRzOkYmCjqv01mQKbmh+1mlWFXDpm6+/zqXNAeQcmelf0du57ixm/cHQtNXF+Qr5xp
         cTX0cCbPrIqDz/muwRtRKjSSCqe/bhRs+q/7Xj+oOnkfBjl8PtHjK0K9MstTGC0sCYQa
         7QcYZqef5oONfYFPu27Wre+0wXMr67piQufPE7mcoEPdOxHf69UGmGuXYWJDmXC1yfmQ
         QdvVLUZz9lREMQHDFGXhTl37lI7QNDTYTHH5rllCfv2V+uYRwpXUYX8VnA0zhNRmhcaA
         WFzb0nSJs0eWqAxIiNz9M5CSdK7oXtNyXI9STVaDSXS/kN4hsHMZKR65gBT8U2TyQ2kl
         RP0A==
X-Gm-Message-State: AOJu0YwzRNJyP+5BXfPs+Jn0vwvhBKzh8auHLO5GV1ui2dUy4PYytM0R
	i+s48bB3G9YI3lCLhT+ERCaIo/HhzMs2fUe6B3VnWlcfn8wTqXCIqV17/w==
X-Gm-Gg: ASbGnctYRCMIRjAdk4OJkoYMcJrSzrmiuomsG5RPa8BS2GMJ4vaUxYpzIRttxBaDnic
	3for0xCZogeJcPBYpOG3pbeLgaM5MUt6qlu4bv/cbGzRtuztOGRzw0CZBe/mRlNxQNqttZVVz2J
	WCY6Tb5qtPUdxt225ReDMyfTFlCjB+Iw90JUw55jmljRPujPldiYlvNUYgIl1VhaP8sxCpDq4a6
	xongoJxHszVUc84yis4XHoJ8Y98kIsTQts1kc8xxUx4o6jJ1bz1syphR8C+TJ7YpaEHJ3gxDZvS
	dSWZdDNy/t8/J0OB2L/piwxX408uAvlEztJT/k2R5qJQc4kS
X-Google-Smtp-Source: AGHT+IH0xBxG9f2Bz8grVoHKw/4yxyJfQRTJb8kDG4CUCmwXp2z3MXB1nWMpIAP3a5HyheENl//4Mg==
X-Received: by 2002:a05:6214:2a8a:b0:6f2:a886:7c6d with SMTP id 6a1803df08f44-6f4fce2e6e5mr57938146d6.3.1746026768057;
        Wed, 30 Apr 2025 08:26:08 -0700 (PDT)
Received: from acleverhostname.lan ([2603:6011:3f0:6f00::12ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4fe85d881sm9228086d6.105.2025.04.30.08.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 08:26:07 -0700 (PDT)
From: Eli Schwartz <eschwartz93@gmail.com>
X-Google-Original-From: Eli Schwartz <eschwartz@gentoo.org>
To: devicetree-compiler@vger.kernel.org
Subject: [PATCH v3 0/2] port python bindings to native Meson
Date: Wed, 30 Apr 2025 11:25:24 -0400
Message-ID: <20250430152601.43554-1-eschwartz@gentoo.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <aBI_wad4TnNRCTWA@zatzit>
References: <aBI_wad4TnNRCTWA@zatzit>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Eli Schwartz (2):
  Makefile: deprecate in favor of Meson
  meson: port python bindings to build natively via meson and
    meson-python

 MANIFEST.in                | 12 -----
 Makefile                   | 53 ++-------------------
 libfdt/meson.build         | 32 +++++++------
 meson.build                |  3 +-
 meson_options.txt          |  2 +
 pylibfdt/Makefile.pylibfdt | 30 ------------
 pylibfdt/meson.build       | 28 +++++++----
 pyproject.toml             | 33 +++++++++++++
 setup.py                   | 97 --------------------------------------
 9 files changed, 77 insertions(+), 213 deletions(-)
 delete mode 100644 MANIFEST.in
 delete mode 100644 pylibfdt/Makefile.pylibfdt
 create mode 100644 pyproject.toml
 delete mode 100755 setup.py

Range-diff against v2:
1:  142d7e4 ! 1:  e5220b1 Makefile: deprecate in favor of Meson
    @@ Commit message
         true, we deprecate the latter and warn when you use it.
     
         GNU Make can emit a $(warning) on every Makefile run, which is a bit
    -    noisly but means we don't need to have every target depend on a PHONY
    +    noisy but means we don't need to have every target depend on a PHONY
         target (preventing built targets from being seen as up to date).
     
      ## Makefile ##
    @@ Makefile
      # Device Tree Compiler
      #
      
    -+$(warning WARNING: Building dtc using the Makefile is deprecated, in favor of using the Meson build system instead.)
    ++$(warning WARNING: Building dtc using make is deprecated, in favour of using Meson (https://mesonbuild.com))
     +$(warning )
    -+$(warning https://mesonbuild.com)
    -+$(warning )
    -+$(warning Use `meson setup builddir/ && ninja -C builddir/` to build, or `meson configure` to see build options.)
    ++$(warning Use `meson setup builddir/ && meson compile -C builddir/` to build, `meson test -C builddir/` to test, or `meson configure` to see build options.)
     +
      #
      # Version information will be constructed in this order:
2:  5d0590f ! 2:  3490690 meson: port python bindings to build natively via meson and meson-python
    @@ pyproject.toml (new)
     +    'License :: OSI Approved :: GNU General Public License v2 or later (GPLv2+)',
     +    'Operating System :: OS Independent',
     +]
    -+description = 'Pthon binding for libfdt'
    ++description = 'Python binding for libfdt'
     +readme = 'README.md'
     +requires-python = '>=3.8'
     +dynamic = ['version']
-- 
2.49.0

