Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793186421;
	b=TFU8RPBLFjZgX3jfheIrbRVg2ugxJz5hMWkJamCxtsMCprq7o4cPAcb3aV+jFKy9OTO+
	 8mCe6NK240EvWiYI0IAsVA1NU9Sfd8zhgrqusYsELvDx79REXpO4VkrR0pqiE2RhQe3To
	 f/prJW0aB3y807f80ux8cFR3u97t4CclqV7Tc7fgsXsAV8ZUVViNe/pfZF6ceYpk8e1FR
	 XTNh6qbesbY1013Flf/jFQvrkAmVFweRr47VQpdqhgkNKmNyQReYyaJYUOKsX4vQmMVV2
	 aEepMa0XHtRNldq9Yl8JDke6/R0bmcp8uw8qqhUN9lWI6mOOAlu//kBAdkoLmyAR9Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793186421;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oUL0GJUK3De5utL6LhodLbRxxi8Srliqhz4tr/cum3A=;
	b=VWGNgTJJf74QGUFIZQBCOH4IhllBUNTWiiricpmF78v9qKn/tlOLPPc4KR3O3+XXDDFh
	 XXWpE+TMR50ge74ewh1tEqGt917qXJ6pjfr2g6b7i0BYXIrhFrLJXsZiVi5+8yT9p9vK6
	 FP2B4nfvy18J95WRBIFBUVwlIXZvA1tV8aAKUaP30RUBt3/bcaZ3SljXqhrHFSv65dwky
	 LSj2A3waCp5Xs2LctKHNsSxpSxiFPJuf2fEQcNmszoHEXaaw02byeeTMlT5/0FzXpFXFD
	 hWdXxk6ZZK2qSyb1p/QzZ/cLoy31aIG3llvVbNhj1rUXLYzobefvaKbazXgbavwrhkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=LeKVI5NO;
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52059606A321
	for <devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 11:20:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52059606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=LeKVI5NO
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6aa9606ddadso723408eaf.0
        for <devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 04:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793186419; x=1793791219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oUL0GJUK3De5utL6LhodLbRxxi8Srliqhz4tr/cum3A=;
        b=LeKVI5NOXFqUVupngw2VYYt9vEP1RsF6B32P+vJjZ1c9aHA98HKuPKXej/Q6Klqd5y
         ok6WH9ENtQekgDlGMBkkUn+JFsVW/V4X/VGLehX3LCtJutnzPHBmlDG3yRmMLj0Q8XBj
         l3lfOyrRAioBiBiOZ5tM3D8RktR5AOunhNP7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793186419; x=1793791219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oUL0GJUK3De5utL6LhodLbRxxi8Srliqhz4tr/cum3A=;
        b=EhCdSWczmreoR+urIdSETRKDsx+9qTFzR1HeaA2h5S54VuEoYP5SK6t6AW4J60Siie
         Yf0yA6oWWGL7cqQ2X+5eZdQdWooM3F7tZJxeXkzZzPBJ0BuPFtGkSwLMTNPMoE+R281j
         tVUqRydLjaQfjkfU8y1oDEoKmLS76Rx77Pose2VlyqUBxMd55a4TYp6ai2NyojDn3Tqj
         i7m6jQKSEHIwGgIFG5bZGsrHCWRCFjJ3UHtZ3RTVIT2R26wsXz7HUxicxwU7XEfeHiPx
         n64sWoegqvzdSfVBveOc5kzwcB0WF4TiemQHhgyQV27pHGRmEPdddwXs8fT2wM0pg4Vm
         AH+A==
X-Gm-Message-State: AFq9FYJK68K/tPUUrr/+G1vjW/QrDz53AI3jpsJArz6kAv43dRVJgOr5
	FLn8EPojaXqQJ4FVd2dTgypWkV6Ga+NZu4zWZdAHFSeCN8WMbq8zjuilbAch/A8jMiIaxm1drAf
	CWcvrqg==
X-Gm-Gg: AYBFou3MYQV2rv8j8INPJtofN54V9AmIMUAzt29LrrUA+QfknO2HFbzlf8no0k5oK6f
	DCy7wXXhaF3b6ZdT87dUfkMjgHXBJ3R1piOL2m154IXOdZJf++FUhHZUUFRXoBOsiiM9NpHDNCe
	rNULY0tdjSOIzI+DJvOgAWPVQHdU6pvp3b2wAWCmcBVyrUuWCtmYaIEQJF31B1N9c0iWDJCmJ1D
	7UU04KD1FKLviXS5x4Qs2b+AEwkyZlOlbaOkcwN478+YEg1bcaa18prPu4HA2DWKb35tQpUxDAH
	sni4UvV6cJT7gngDeBoSLhooqzlLwlwyGP5G+qt/FEbNfAvJoFhUGC/VnvikcK1qJ/K4rdN9DcG
	ednzFn5L4NakbWYyJfMfA8ARcqKg7a9ms/6h4IcTcdbea1VYt4W0PeB4jSYldLhWUvC3oKWBNZZ
	5D0DZiWyRYvTzQy0xl4KLEtQ/FMsPx801xl0mIjRBZA0xRrUKcrq20ofjulCbmHP1rK3buMCgYw
	SpSMRLNyuxe+vuaBeIgB3hDBCGoqSZJAAsMAaXZDTfh1PtmiLhyjB9si/oN00wenIcs99OPtF3v
	3aMxX5ShKMDcrnb/m96THIVAWj57Z1IZiDn65KQ73VQ6JFOc+D1hgqQ6xR0Rmw==
X-Received: by 2002:a05:6820:a65e:20b0:70a:598b:12a9 with SMTP id 006d021491bc7-713eef4c448mr696275eaf.53.1793186419335;
        Wed, 28 Oct 2026 04:20:19 -0700 (PDT)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-7142c736d4dsm1150140eaf.8.2026.10.28.04.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:20:17 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH 2/2] README: Use meson in the Python section
Date: Wed, 28 Oct 2026 05:20:02 -0600
Message-ID: <20261028112007.3980089-2-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028112007.3980089-1-sjg@chromium.org>
References: <20261028112007.3980089-1-sjg@chromium.org>
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Python section of README.md assumes a make build. It installs with
'make install', disables the library with NO_PYTHON, and runs its
examples from the source tree, where make puts the built module. With
meson the module is in the build directory instead, so the help example
quietly imports whatever libfdt is installed, and the coverage example
fails.

Use meson to install and to disable the Python library, and run the
examples from the build directory.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---

 README.md | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/README.md b/README.md
index ed9039d..fcfc2e5 100644
--- a/README.md
+++ b/README.md
@@ -37,7 +37,8 @@ distributions:
 $ sudo apt-get install swig python3-dev
 ```
 
-The library provides an `Fdt` class which you can use like this:
+The library provides an `Fdt` class which you can use like this, from
+`build/tests` after running the tests:
 
 ```
 $ PYTHONPATH=../pylibfdt python3
@@ -59,7 +60,7 @@ You will find tests in `tests/pylibfdt_tests.py` showing how to use each
 method. Help is available using the Python help command, e.g.:
 
 ```
-$ cd pylibfdt
+$ cd build/pylibfdt
 $ python3 -c "import libfdt; help(libfdt)"
 ```
 
@@ -67,9 +68,9 @@ If you add new features, please check code coverage:
 
 ```
 $ sudo apt-get install python3-coverage
-$ cd tests
+$ cd build/tests
 # It's just 'coverage' on most other distributions
-$ python3-coverage run pylibfdt_tests.py
+$ python3-coverage run ../../tests/pylibfdt_tests.py
 $ python3-coverage html
 # Open 'htmlcov/index.html' in your browser
 ```
@@ -91,20 +92,21 @@ host system first. Generally, using `--user` or `--prefix` is not
 necessary and pip will use the default location for the Python
 installation which varies if the user is root or not.
 
-You can also install everything via make if you like, but pip is
+You can also install everything with meson if you like, but pip is
 recommended.
 
 To install both libfdt and pylibfdt you can use:
 
 ```
-$ make install [PREFIX=/path/to/install_dir]
+$ meson setup [--prefix=/path/to/install_dir] build
+$ meson install -C build
 ```
 
 To disable building the python library, even if swig and Python are available,
 use:
 
 ```
-$ make NO_PYTHON=1
+$ meson setup -Dpython=disabled build
 ```
 
 More work remains to support all of libfdt, including access to numeric
---
base-commit: 1d50f3f8fa8bf9429eebb0769dafa5df37381ae1
branch: readme-meson

-- 
2.43.0

