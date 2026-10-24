Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792829840;
	b=dYYVb9AVNlmf6y/M7Ipw/I3aqOqGXWgpZd+BT1QMWHPEAxLg46RYafyY39t6BOwP7YWM
	 pb3LbiZrpI3kWnTC3eejFF8/cbZpfNNTc+T+ze/3HOn8LGAR9FEIWu7W5frcOBq7u3C0C
	 WTL2O4a2gJ5061W1mLoJ1SoVJG+xNnTpHylAJBMqZ99K80JmJVc78HFr27iC6/X39xGpR
	 6H9W7r3JcLa9w/t6J3CjRHjXhdaB3JDT7FNeU1xrt73AK1+PbkVJSH3iWbcSuyqgWWeNn
	 qoVbkPxeoFomCdWkiCJMDMpZQws9S9r9COyPxK0vNz1yVC27aU4S7CLDpjxxmu4E7fg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792829840;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:MIME-Version:
	 In-Reply-To:References:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=hmSpVMPxaxNz8ENjMhpdf7ua68LrA5ybGxRvYwN8M/o=;
	b=MmQsG4Kc2UOws5KiqoN6IL4cMQTrKJlSfBCsW41TM2LZTFJK6EXcOqolzCKKec3ZDD18
	 1da0MCy0w4AAAhRXqZAyc8sl1xb8pa2gLQB8hZlJ0NGdc+XKZVuV8Yaqr3J9Oy5WM2/Uj
	 0p8c+5/ZxkRWye7fs2OxeRO7BO8Kk9ZV5MaKHfynO49awzTtOQMMtaNmNEwGxK7g9HT6m
	 o9MCSh9avr18fkPLS21/ysnAcbGOeiTgIxa8UFuR+1LjWlGgLH6JuJJRGLSSmf1XUUmP3
	 hYPF7KL7RJRKM1+4+VudIt9LdFMK0KZKI6uDShTQfew4U3jf26IBKAPfciwrkjWQ4FA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ErxrGqoP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28BD606A320
	for <Devicetree-compiler@vger.kernel.org>; Sat, 24 Oct 2026 08:17:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A28BD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ErxrGqoP
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3acb512a7a0so860544a91.1
        for <Devicetree-compiler@vger.kernel.org>; Sat, 24 Oct 2026 01:17:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792829839; cv=none;
        d=google.com; s=arc-20260327;
        b=XLcFMjZRu6l7Rkc8I7T8mxc/NMH1qvzs/2FgvuEAvndHySmTjPWt9JKdXGyC80jdOh
         c4tahdHL1a0BdDl3uk3yl911J3MXrrOOahRxYne4Gz7VdM/l/VD8mhbd7S/9gTHEqOAm
         CXKKqTexRZz4hoVFcf+7xM+axYOAb8VafEs2eX6vd9+m4b2IpAOknhfsnpGz6Gx9LiFE
         xmLvt4l9j48TsZ15V97tJsmJdT3Uox9t9FPqR3fHhS6YHw09QZb5s4xu0FCV1p8cWder
         qH+yFGc+8friAYBoMKToTZOIJq5zecNkn6wPEaEC3bnsj3eb3eQWQLhu1K27aG4e7yuj
         iawA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=hmSpVMPxaxNz8ENjMhpdf7ua68LrA5ybGxRvYwN8M/o=;
        fh=xphIuIwntH26OBZpT3opXZRFn/uSZ2l3KOChuafUJ24=;
        b=gnQHhdKvHaLCRVHnnkyeBseX5Y7Z6EH0ATrvUBV6S1T5rzFR5p6ZRNSkr0AZQUPzZt
         jlXgc2mB2KKS8F75UtsFfmkxB9tirUTDKTz3ezQwLqzLtKJlCayKBuL7wiKa7QbK3dmX
         Da48ZPvn5OxSPCRLy8VNvbecx+4mmCIQ6TCl6cosAkZdJOh98baKt3WqcL0DZWE8eyXJ
         tk+QiRqBWisHRpZ976LkUjQIdkWH+iETluHM+aXpv9f8ZOOqNU4Q3LGedSsckXhUjWcQ
         WC2HHeYWllZAGz/wCbSy0H2aatcHq09mbNNbGwdX3acKdMWLQIBDnj0vwaHGaCuRTDaH
         P8Tw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792829839; x=1793434639; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hmSpVMPxaxNz8ENjMhpdf7ua68LrA5ybGxRvYwN8M/o=;
        b=ErxrGqoPZ/nb9CghxeboTYWi19dHZA+oLth5nqNwXEPLgCivWeROkUq1jgI00pLPis
         mnvEJZESOATfA4bwGakbWHbrbZfTg6q/+BsXRBGx/nCeAqO9mecP3eklEPue7ZRetFgl
         WAQbY6p0/CHxOoA6764p2Z33kLx+HvfLIdMSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792829839; x=1793434639;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hmSpVMPxaxNz8ENjMhpdf7ua68LrA5ybGxRvYwN8M/o=;
        b=z0aFs/C6ZpjL9w3WftAzyNVvRlzAEWW/1vAl4prtnvzf3Vz1X9LJt8sxif1EaC3kwy
         hFP+v1rN+oWog9LO6u0We6SO2S4ErzxzJrgniK8RdUtCkRrJkqKlQudiFJpp402I3It2
         77ZqWqByfvbf477BK1bbJE59GVI3si+qPFYwxp1989NyMeiZriINnqLyG44vxxxCOsGP
         Ed5X1eufil0dKAbRANgolT+VBUSdgI6dqHNxbhz663YaKCG0EWq3S1xhQJvw4fnNfs0Y
         YYBTRdWAUU8Lk6HsAe6Yk9QWf2RjyCejmdpyvZZv/yFuyAp5evJCDmIRRjDLFoO+tqsi
         WcJA==
X-Gm-Message-State: AFq9FYICPecsmJJVMvZ+OvIeTkbeUhQ3n2tbjhvmT14gD6ZK6LaY0VE5
	3Gs3BHz3UBPb3o20wTZGjwakAlRIciKSkaDawum/xdXyRI4EVlPX9z8UBELBnYYlqG8bvEoxi2e
	uvVRcFuRD8pIOgfu7W1I8yUkAqIGvw+jSdaWxY6e3
X-Gm-Gg: AYBFou2c4RWcAOvbpOaZRee26pf3oXvIuXvgIwfIdTobelrpFOfslUKuvZwnMMBvuC1
	zFd4jVuo0BLLJp0V29L7mXtXJ0zOe/nENCY96mchPXJAfNng0Ib2Y32gX7/AjsU8dpFD8O5BtxW
	bZFyeyuNaPUPF+/eGmSheB9f0iab0hzgwbuOpB1LrxjullUamfCTAZGOxx+a1cHex0mTT1EKWFN
	EeCJ8HPK7gfwtxd/0FpbuSruSiBM5ThrugtV2j5IwRgeektbnK0pPW0yhHtm/isot70EjhrBDRW
	18nM3IAIN0lx74/mVP5NbbjjqZoWqM7e1FyBVvnS4lKFEg0P8kyKqqnAlZYrIGP5G4grJmOy5tx
	i/24JGg8p4dSJN6vrBLtCR/csDwHrOd8HCITl
X-Received: by 2002:a17:90b:2891:b0:3ad:4a8b:c6e1 with SMTP id
 98e67ed59e1d1-3adea9dca56mr1447422a91.19.1792829839011; Sat, 24 Oct 2026
 01:17:19 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:17:14 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:13:02 -0700
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261020083501.RFC.5.I4a691041bb6d31e5ab2fde8cd4139ca72ee72c5b@changeid>
References: <20261020153652.2907186-1-dianders@chromium.org> <20261020083501.RFC.5.I4a691041bb6d31e5ab2fde8cd4139ca72ee72c5b@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 24 Oct 2026 01:17:14 -0700
X-Gm-Features: AclHuK-tg0PdtuvuCVecn4H2MwI1d9lfukkzfH1KNqgDlJ_Y2JdAvjK8N50Iivk
Message-ID: <CAFLszTh6vmFGVD4_Reewe9p4QqQjN=CVJ3SgfQKosAhedJpAQA@mail.gmail.com>
Subject: Re: [RFC PATCH 5/7] kbuild: fit: Add opt-in FIT_FACTOR_DTBS support
 using fdtfactor
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-kbuild@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>, linux-arm-msm@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Devicetree@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Will Deacon <will@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Alice Ryhl <aliceryhl@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Marco Elver <elver@google.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, Rong Xu <xur@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi Doug,

On 2026-10-20T15:35:18, Douglas Anderson <dianders@chromium.org> wrote:
> kbuild: fit: Add opt-in FIT_FACTOR_DTBS support using fdtfactor
>
> Add opt-in support for factoring the DTBs inside a compiled FIT image
> into shared base DTBs and per-board overlays using `fdtfactor` when
> `FIT_FACTOR_DTBS=1` is passed to make:

Please can you add a short paragraph at the start saying why this is
wanted (the bootloader needs a base DTB plus a per-board DTBO) and
where fdtfactor comes from? It is not in scripts/dtc, so someone
reading the git log won't know where the tool lives or which version
is needed. A link to the dtc series would help.

>
> - When `FIT_FACTOR_DTBS` is set, pass `-@ -L` to `dtc` for the DTBs
>   included in the FIT image so they retain `/__symbols__` and
>   `/__local_fixups__` metadata needed for factoring.
> - Run `$(FDTFACTOR) $(FDTFACTOR_ARGS) -f $@` (with `FDTFACTOR_ARGS`
>   defaulting to `--strip-local-fixups`) at the end of `cmd_fit` and
>   `cmd_fit_its` when `FIT_FACTOR_DTBS` is set.
>
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
>  scripts/Makefile.dtbs |  8 ++++++++
>  scripts/Makefile.lib  | 18 ++++++++++++------
>  2 files changed, 20 insertions(+), 6 deletions(-)

> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> @@ -425,6 +425,8 @@ quiet_cmd_uimage = UIMAGE  $@
>  MAKE_FIT := $(srctree)/scripts/make_fit.py
> +FDTFACTOR ?= fdtfactor
> +FDTFACTOR_ARGS ?= --strip-local-fixups

Patches 1-3 go to some trouble to build fdtget and fdtput in-tree, and
cmd_fit_its puts scripts/dtc on the PATH, but fdtfactor comes from the
host. So FIT_FACTOR_DTBS=1 uses whatever fdtfactor happens to be on
the PATH, and the build does not depend on it. Is the plan to sync
fdtfactor.c into scripts/dtc once it lands upstream? If so, it would
be worth saying so under the --- line.

> diff --git a/scripts/Makefile.dtbs b/scripts/Makefile.dtbs
> @@ -137,6 +137,14 @@ DTC_FLAGS += -Wnode_name_chars_strict \
> +# When FIT_FACTOR_DTBS is set, pass -@ -L to dtc so the built DTBs retain the
> +# /__symbols__ and /__local_fixups__ nodes required by fdtfactor.
> +ifneq ($(FIT_FACTOR_DTBS),)
> +ifneq ($(filter arch/$(SRCARCH)/boot/dts%, $(obj)),)
> +DTC_FLAGS += -@ -L
> +endif
> +endif

One thing I'd like to check is composite DTBs (the foo-dtbs :=
base.dtb bar.dtbo entries built by cmd_fdtoverlay). My understanding
is that fdt_overlay_apply() merges the overlay's __symbols__ into the
base but drops its __local_fixups__ after using them to renumber
phandles inside the overlay. So the __local_fixups__ in a composite
DTB only cover the base part, even though both inputs were built with
-L

This doesn't affect lga or trogdor, but the make_fit.py path packs
every DTB in dtbs-list, and qcom has lots of composite entries
(lemans-evk-camera.dtb, etc). If fdtfactor relies on __local_fixups__
to find phandle properties, it may silently produce a bad overlay for
these. Please can you check this? It might be enough to detect such
DTBs and skip or refuse them.

> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> @@ -486,7 +490,9 @@ quiet_cmd_fit_its = FIT     $@
> -		done
> +		done \
> +		$(if $(FIT_FACTOR_DTBS),; $(FDTFACTOR) $(FDTFACTOR_ARGS) \
> +			$(if $(findstring 1,$(KBUILD_VERBOSE)),-v) -f $@)

Just to check, does fdtfactor handle compressed DTBs in the FIT, i.e.
nodes with compression = 'lz4' as in sc7180-trogdor.its from patch 7?
If not, FIT_FACTOR_DTBS=1 with that .its will either fail or silently
skip the DTBs. Either way, it would be worth mentioning in the commit
message.

Regards,
Simon
