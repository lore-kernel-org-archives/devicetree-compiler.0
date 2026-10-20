Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510664;
	b=rKzUykXqy9UTbT974zlVz+fXexr3hMFq3K64RrJ1oUMpLoAZTcXrrEy0IUn80WrpcRBG
	 mReNY1TfnkFGyR4tSM6uoABdFMYoDSTUgfhO7AhE8WRr+yvOJ3G12i9YKKQzdHKBz2aFR
	 +nPtc4wU7LeoHfhqn362B5ZunD2kk5cP/WqoeHXCbmbpcR9Ii7b0anzF6VeqiR31aW1Kw
	 63/8ynBm4XcKGQ6BPWglJZDCWB9WZ+Vew6l8RpSy8PpH3V/BSPhTogtI+Ug2rYKJqdWtx
	 y3q2UEks9gl0XrUSC+5ek28/ihlYE9/3ymSsBc0638UCMkR2sV9+WfMv2m+W9TcAVTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gf3+S05VHu9WM8VhO/IFJLzS95PZV+LAb8RqT/X+Ms4=;
	b=oTco276N4O7vr9QQZTBrU33Vzc4OeZm/L0olJ2oaXkdH2XLMq6uYjGJqf5WY7dv6S938
	 kQhj0ExFLRm2Wc8aMia1tj9qmwUEFFSljZh6i7DNMC2Eo8zhlV67wqnCbOlGersQjfNR9
	 B8uZHKHcUEQxjIwEFtylH1y+JPv3pItmOGS6CcBdfqih3vHabIuyF1oJXdOhInE7M7IrI
	 54fgeYVx87Gn74KKV7N40nKPAbF+kQnytdpNTBrc2WKTwMx4bm2dnPPXGMvzdrMF2Qdlp
	 M1S8s4X18MhoxFI9J1omU/TuCl35iqEgcqGKj+KY0hBaB/hEYabA8stty+4qJa+8qhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mhIuMtK1;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2611060A263E
	for <Devicetree-compiler@vger.kernel.org>; Tue, 20 Oct 2026 15:37:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2611060A263E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mhIuMtK1
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-366421dc8ebso1152994eec.1
        for <Devicetree-compiler@vger.kernel.org>; Tue, 20 Oct 2026 08:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792510663; x=1793115463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gf3+S05VHu9WM8VhO/IFJLzS95PZV+LAb8RqT/X+Ms4=;
        b=mhIuMtK1hVAjB0ZdSQ6nJXnf2JPyMVRO8RoMTKyv0WpHKMyWUP15K52usdHJilrDaL
         yStr2wh3ht/MSAPYDrTx0dcekeJlVdCUX8sCkbgbiVYYqIVusUlNPzWbYv0/1PNuY/Ku
         jBSMPyptSS5JlMFagKWeBy0JHIspxxjn0vTiY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792510663; x=1793115463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gf3+S05VHu9WM8VhO/IFJLzS95PZV+LAb8RqT/X+Ms4=;
        b=QqWMjrsrnFj9o5fYablMatW5WAQn5UdxN4aioTM3sFQwBGWeKHngD4LWuTsSsyKZ67
         bJbb2hql0XLeRJDfCxY6db186FTirOqDvT2vRqlC/jiIndAMDqvBlEVObje7sh1YNqDa
         j87uVCLvN4JYAlQrnJ4RulTku/x6MU9ECcdoqsDH8IGcLLLb9bojv1bzFljtGGsirtKC
         KSBUJef/WjR92z4w3I+V0W9AoGRLmm+7ZgiTIQeiH0Wb7Hp5BrxVt9Ljre4CJZVLrtM/
         IOjgaSg4yxNs9BWOPSlyeIH1X5GClpeKH1a/JC/XnOsCTju6zF0nTcMjxm9rbtwlZ2w0
         d3SQ==
X-Gm-Message-State: AFq9FYK2AB5rk1Ka2eXxZcL/TiJBm8CBcr6x5nV5R7LTzbCOygb0CF6J
	xcHNOaB+pUw/r7lx65MzFhV4mGve+xMy5aKhyH6b3hc8fbXaYXiK+RuSloD9C7FwKcs2bGsmoTo
	KMhETQg==
X-Gm-Gg: AYBFou2y/wwX/hMIpXbhWAm5z34I5teXy1vSXkWDHDMvrQb6eCYjPuD8Ajf5Bw8yoqm
	wiqwJ1ob9onsVfXFLYDzXwOF6EjU6Pjv18Szy+pEjUkfovHMon1cl1f7H2JcKAT5NJLnKzwu7Xj
	jkM9qZNOI1tWAlwTEguITzP7cB7/BHfswrY2qQm0bAsArt9x3SLB7dMkgVsNQDn8btW/CPc6Q4u
	pY+IogLsa1MtdiBzieeEeKHBC8H9dIfnW9AMhdasD8xrx8AomPvP6uFwr8KEGOS/r0aQSI1IHy6
	IsKHOba7p+2Qe0heIW8LX6IsnB79tgvnSEDG+etdKLBYryFMVKCftHUdujsgzKXN2vsaoMexM2+
	K1f6ytVugaJ21JBlQ2l5R31zqNW9LUKSOzN10sddBeCQBIUHEdwI9HT6hhfhiVbbQL1a56j4SJS
	7nkQFVtuhSsk5fPt0YyzmqT7Gd2NVZSp2j55/ubkydPW8U9n+Ef+nGMDO66btVXQhIcvugwDV6W
	FNGQRaHEjeeCy6IQyGY6x0XdtPLaqNWNpwTWG8+7ujG79GabcvZSi3wZTrOs37hj/Yg3JsQo45d
	UNZFgHgeiZFV/X7+5zSF9P3Igc1vffIKwB+PnLHY
X-Received: by 2002:a05:7301:619b:10b0:361:2a55:b94e with SMTP id 5a478bee46e88-365fb17e9d4mr2922006eec.15.1792510663086;
        Tue, 20 Oct 2026 08:37:43 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:1eb1:e432:2cc7:349c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm51324714eec.3.2026.10.20.08.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:37:41 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kbuild@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-msm@vger.kernel.org,
	Nicolas Schier <nsc@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Devicetree@vger.kernel.org,
	Julius Werner <jwerner@chromium.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Will Deacon <will@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Douglas Anderson <dianders@chromium.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Marco Elver <elver@google.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Rong Xu <xur@google.com>,
	devicetree@vger.kernel.org
Subject: [RFC PATCH 5/7] kbuild: fit: Add opt-in FIT_FACTOR_DTBS support using fdtfactor
Date: Tue, 20 Oct 2026 08:35:23 -0700
Message-ID: <20261020083501.RFC.5.I4a691041bb6d31e5ab2fde8cd4139ca72ee72c5b@changeid>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261020153652.2907186-1-dianders@chromium.org>
References: <20261020153652.2907186-1-dianders@chromium.org>
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

Add opt-in support for factoring the DTBs inside a compiled FIT image
into shared base DTBs and per-board overlays using `fdtfactor` when
`FIT_FACTOR_DTBS=1` is passed to make:

- When `FIT_FACTOR_DTBS` is set, pass `-@ -L` to `dtc` for the DTBs
  included in the FIT image so they retain `/__symbols__` and
  `/__local_fixups__` metadata needed for factoring.
- Run `$(FDTFACTOR) $(FDTFACTOR_ARGS) -f $@` (with `FDTFACTOR_ARGS`
  defaulting to `--strip-local-fixups`) at the end of `cmd_fit` and
  `cmd_fit_its` when `FIT_FACTOR_DTBS` is set.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
You can see the fdtfactor post at:
 http://lore.kernel.org/r/20261015182221.2931742-1-dianders@chromium.org

This patch obviously could only land if some form of that series
lands. Presumably we'd also want to import fdtfactor into the local
kernel copy of the devicetree compiler before this patch.

If people hate this patch, we could certainly just run `fdtfactor`
after the kernel build finishes.

 scripts/Makefile.dtbs |  8 ++++++++
 scripts/Makefile.lib  | 18 ++++++++++++------
 2 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/scripts/Makefile.dtbs b/scripts/Makefile.dtbs
index 1bc42b30cc52..4b8d7039e45d 100644
--- a/scripts/Makefile.dtbs
+++ b/scripts/Makefile.dtbs
@@ -137,6 +137,14 @@ DTC_FLAGS += -Wnode_name_chars_strict \
              -Wunique_unit_address
 endif
 
+# When FIT_FACTOR_DTBS is set, pass -@ -L to dtc so the built DTBs retain the
+# /__symbols__ and /__local_fixups__ nodes required by fdtfactor.
+ifneq ($(FIT_FACTOR_DTBS),)
+ifneq ($(filter arch/$(SRCARCH)/boot/dts%, $(obj)),)
+DTC_FLAGS += -@ -L
+endif
+endif
+
 DTC_FLAGS += $(DTC_FLAGS_$(target-stem))
 
 # Set -@ if the target is a base DTB that overlay is applied onto
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 91880648fe21..bcb2b0e749a3 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -425,6 +425,8 @@ quiet_cmd_uimage = UIMAGE  $@
 # ---------------------------------------------------------------------------
 
 MAKE_FIT := $(srctree)/scripts/make_fit.py
+FDTFACTOR ?= fdtfactor
+FDTFACTOR_ARGS ?= --strip-local-fixups
 
 # Use this to override the compression algorithm
 FIT_COMPRESSION ?= gzip
@@ -434,7 +436,9 @@ quiet_cmd_fit = FIT     $@
 		--name '$(UIMAGE_NAME)' $(FIT_EXTRA_ARGS) \
 		$(if $(findstring 1,$(KBUILD_VERBOSE)),-v) \
 		$(if $(FIT_DECOMPOSE_DTBS),--decompose-dtbs) \
-		--compress $(FIT_COMPRESSION) -k $< @$(word 2,$^)
+		--compress $(FIT_COMPRESSION) -k $< @$(word 2,$^) \
+		$(if $(FIT_FACTOR_DTBS),&& $(FDTFACTOR) $(FDTFACTOR_ARGS) \
+			$(if $(findstring 1,$(KBUILD_VERBOSE)),-v) -f $@)
 
 # If FIT_ITS is specified on the command line (either relative to $(srctree)
 # or relative to arch/$(SRCARCH)/boot/dts/), locate that .its script and
@@ -465,10 +469,10 @@ $(obj)/image.fit: $(FIT_ITS_IMAGES) $(FIT_ITS_DTBS) $(FIT_ITS_FILE)
 endif
 endif
 
-# Build the FIT image from the .its script with mkimage and populate any
-# missing 'compatible' property on /configurations/conf-* nodes from the
-# corresponding uncompressed .dtb's root '/compatible' property using
-# fdtget/fdtput.
+# Build the FIT image from the .its script with mkimage, populate any missing
+# 'compatible' property on /configurations/conf-* nodes from the corresponding
+# uncompressed .dtb's root '/compatible' property using fdtget/fdtput, and
+# optionally factor the DTBs with fdtfactor when FIT_FACTOR_DTBS is set.
 quiet_cmd_fit_its = FIT     $@
       cmd_fit_its = \
 		PATH="$(abspath $(objtree))/scripts/dtc:$(PATH)"; \
@@ -486,7 +490,9 @@ quiet_cmd_fit_its = FIT     $@
 			dtb="$(objtree)/$${inc%.dtb*}.dtb"; \
 			compat=$$(fdtget -ts "$$dtb" / compatible); \
 			fdtput -ts $@ $$conf compatible $$compat; \
-		done
+		done \
+		$(if $(FIT_FACTOR_DTBS),; $(FDTFACTOR) $(FDTFACTOR_ARGS) \
+			$(if $(findstring 1,$(KBUILD_VERBOSE)),-v) -f $@)
 
 # XZ
 # ---------------------------------------------------------------------------
-- 
2.56.0.212.g129ede20d9-goog

