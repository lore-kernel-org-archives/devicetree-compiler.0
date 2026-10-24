Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792829829;
	b=Pbq0mWnT1pJItDKdIQlSBwMT19krU1U8VFf5xV0x/YXxNNqelrUEM3MfCN1GgQnp10kv
	 fy68LztvkOB7uNPSAuJ45di1qKCrramAFUXBwwbT0LU9S1yfExNIicCirj4bvmVFNWl4v
	 FR2cC+LImk59Wqzvp2lKGF2A8EmMOPQ9Qw1BShsmCVnD0ThkG/wv8JV+cnX+lu+gpcNA1
	 6QTUoOPRi2zyuO81bgqQKmNhGb/Gsvo3UFjd8ufgu4fpTQ2tH6i8xtWUi51JkzXX9+vOr
	 lsp0ehJC7ojnD5/RKicaMnXGZd1XFTIRh/RJF9C7sGmPv1ynRQAatwtnWu+SSn5JPbw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792829829;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:MIME-Version:
	 In-Reply-To:References:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=EbwGmFVvCxw7pb1kddFLIfy9dvMVnOkwwNvXwS42h3c=;
	b=SQNEmrxoQqDb0za2f9ZIKbJMGLh+MlvIKf2zF0W73pgk6wQ9VQHyLU605pnv8eP+86/q
	 0RtLCGBd/FqSfjuNKXb4NVZW6Ogt/ZQrtjra8sMQrGfjN/+0Mj7UH/jGIAJN6ryokV6NL
	 nY2KYw0jFbE5L5QCBUqgiGS+aTD+XUKYwpleagZvgZuig4oO7hEyPX5XSD/l+q5LAeGSx
	 Elgvx/l39fg6YKAvQwNelImH9PAne13sVhXte0j6/I6GsrPXgrPUjJaTi4Wr57qxTFLYf
	 onYdUYfgAjgeFWwd6/rhRT5tQWP5qn+TewlZNmWOg+ZVmwl8aSzF8nKiBPeLrAMsGRQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QwTwqqUY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA834606A33E
	for <Devicetree-compiler@vger.kernel.org>; Sat, 24 Oct 2026 08:17:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA834606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QwTwqqUY
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6afa651700eso2176851a12.2
        for <Devicetree-compiler@vger.kernel.org>; Sat, 24 Oct 2026 01:17:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792829827; cv=none;
        d=google.com; s=arc-20260327;
        b=aOAY0ARaKBb08ePRURsaBYeliQTb+UjtvzQHzm5KyxsxtlC+ubqiBkHyRBZS4Ze+gb
         pDDUU+3r5QlxSwOK/bLt+yZ1XuJuFfgxRA/DbD85xeuJ0JJr8aKl52JMpXSZ/8SzlZb/
         Gj099Anr8BGbh1BzoTuHYvx73v2EcH74FaGWFdETGIrhzfeod73DbIkgEohyzC7RmpDm
         NlKILKDW+ge0ygXzIABnRXrnObUlS80Pi2lNzVr0tANxeexJ1VKuub9o5MsU428RnH5r
         b0HV9iPDf9ZQEu0CbltIS6VqMOpmlY7yH5VOee4f0Ubo1meuciBaSDbHmqvCu2o3SuUB
         MC2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=EbwGmFVvCxw7pb1kddFLIfy9dvMVnOkwwNvXwS42h3c=;
        fh=JFSTHaIHjqY/tMiG+oAwtuS9ySVOJu+TaL38s6G8qBU=;
        b=g4yRmaDmlrXUPCL/w5kLtjEE/GpD/dUSqHosYKuAaPHiMYjGQ0XXmYd6iZZCqgwH0r
         szI3YZf20dRJdMu+nqwUu407ALsQrm27+P/ZmuW/RwNauhmYZdwvV0pDanJZX49xja0K
         MTntLn3Fr/wfqnOTfaPw2uK6kmkzQH0gsq0A4sgEoKdSUfTaV3MjvaFa2cpuUM6F/VgK
         1ZH5g6i6QzRCWh/XTc2h1BTRS1vsHdF/AaIJwfUtnrPP2BHNQuXKBx/TehHWAV+AZGEc
         scfg+g5sbdiURFLCf9JVDyBmzwOmCB/X9A4OVHBHQ+7M2b0ZyHZC1rMVB90Koy9JD2jk
         XfnQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792829827; x=1793434627; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EbwGmFVvCxw7pb1kddFLIfy9dvMVnOkwwNvXwS42h3c=;
        b=QwTwqqUYzR4KMcjZ6tN3E7hw4q93B9dRCKd+92TnzApqiNKVxy9e3nOyWW54DY3jbg
         Ojsm+hc5971JCcfIrnwHh5AOki5VuhkbJKi2mOzK7wpGE4KFLMdJKywO6CuWLrvqLilv
         4iZB7FUgOsGFsggrv3fVelxSSBSYmX9hCrd+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792829827; x=1793434627;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EbwGmFVvCxw7pb1kddFLIfy9dvMVnOkwwNvXwS42h3c=;
        b=gWlVpYOHOOrY85QZFOlv6SLkKaSZyBuJtEtdmRBkHKLvQ0D1ZzEd4DH7ofr7bR6dsU
         4rcrS7TeCICwewRI4G07cPZrmdimWBZf7yj6A22aCpyMaNbxqymZFwSOx53/mykCk/6t
         Fh5k7yJ6njRG55lDrKURZzUjEWUkkdDQITZ16Bbz/mMUBIjjICWODk+XcpTzcrDfVRwy
         zT9Ezq9R3SnO9R8hvE+9SzuqJxQyfciQtMjDvQ8BplxZYW99G4yGqNrMsZ000MWQCIZw
         7cDvSBLoJYlo1Je1IEiu2kWN9xGmootKsHXSEshVOZYLg4ZuUMiPbtNU0PstgLndWAko
         0wHw==
X-Gm-Message-State: AFq9FYKAB5lSXN3B8CxpszCGSUThoV4/lkPPKvEM6UmHaPD6xnXezEwv
	+85iOSnlTub0ga6hbTKoUDPfN2qqUzPkx5uUthOng7C9WVyH1sGx/+zga9IS5fPK2Dm5ya7bAf4
	ENxfNSbHBIaAUiKnwf3hoBkwqdxOL9zyGhZM8Xr5Q
X-Gm-Gg: AYBFou1yFwrpu97+FCSyazlP6YqH+mk+TscW3Dod8cDbOFmZVF3yzZrs6QZgomRs860
	ssrROgEdhX2vTuro3SRmJSGmaTPWtKoypww4D8/0YpjnznCq3ui27j0UQEqisE/2gAy/diqhYOh
	B1Xz6XAI3TXpXm6J2KmoruHRuwVhn8K/hnwkHT1BqjiYhrWHTSya99EcV8jZ6vMUA6BmANhKdbk
	qZHXG898KZ1sXfU3UmtUNRfVfLQHGsPloCvps6jKkIYmdmPVHP2a3LqO4/NJHzI+Ch0boVoCZdt
	cf2n8jp1XRe260WlMSj6xrFtyy7I1hnnlgCyhVPJIa/MyyxfQunKR5hVCWu6nePXtj8QrWY4FqN
	gskG/ThDovHh9foIAxNDU42rW0XjzTorLlP32HlO6vUZ7wyUxCHgKbdtH
X-Received: by 2002:a05:6402:e0d:b0:6b4:20bc:f94 with SMTP id
 4fb4d7f45d1cf-6b442fd5c0emr1861005a12.19.1792829827097; Sat, 24 Oct 2026
 01:17:07 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:17:03 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 00:46:35 -0700
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261020083501.RFC.4.I5cd8aab4380bc4cfd302c4e4708af58c43370715@changeid>
References: <20261020153652.2907186-1-dianders@chromium.org> <20261020083501.RFC.4.I5cd8aab4380bc4cfd302c4e4708af58c43370715@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 24 Oct 2026 01:17:03 -0700
X-Gm-Features: AclHuK9YCJ7Mk4mSQDTbJDAZNMre28fNrdZjyMOx5ekb1ShhYgH8OFHnaV7iO1Y
Message-ID: <CAFLszTg6B2p30-RcmO6fk+2mdHwSdghU6PXotz0m=gqdk5dRNg@mail.gmail.com>
Subject: Re: [RFC PATCH 4/7] arm64: boot: Support building image.fit from a
 specified FIT_ITS script
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
	Andrew Jones <andrew.jones@linux.dev>, Breno Leitao <leitao@debian.org>, 
	David Sterba <dsterba@suse.com>, Gary Guo <gary@garyguo.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Luis Augenstein <luis.augenstein@tngtech.com>, 
	Marco Elver <elver@google.com>, Mark Rutland <mark.rutland@arm.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Nick Terrell <terrelln@fb.com>, 
	Peter Zijlstra <peterz@infradead.org>, Rong Xu <xur@google.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Content-Type: text/plain; charset="UTF-8"

Hi Doug,

On 2026-10-20T15:35:18, Douglas Anderson <dianders@chromium.org> wrote:
> arm64: boot: Support building image.fit from a specified FIT_ITS script

Most of this patch is generic kbuild rather than arm64: the top-level
Makefile clean pattern, cmd_lz4_frame, the compressed .dtb rules, the
dtb-y filtering in Makefile.dtbs and the FIT_ITS handling in
Makefile.lib. Please can you split the lz4-frame and compressed-DTB
rules into their own 'kbuild:' patch, with the kbuild maintainers on
Cc?

>
> Allow passing `FIT_ITS=<path>` on the make command line (relative to
> either `$(srctree)` or `arch/arm64/boot/dts/`) when building `image.fit`
> to assemble the FIT image from a checked-in `.its` script via `mkimage`
> instead of auto-generating a FIT image with `scripts/make_fit.py`. When
> `FIT_ITS` is not specified, `image.fit` continues to be built using
> `scripts/make_fit.py` as before.
>
> Supporting a checked-in `.its` script includes:
> - Adding `cmd_lz4_frame` (`Image-framed.lz4` and `%.dtb.lz4`) for
>   standard LZ4 frame compression (magic `0x184d2204`) expected by FIT
>   bootloaders such as U-Boot and depthcharge, plus generic compressed
>   DTB rules (`bz2`, `gz`, `lz4`, `lzma`, `lzo`, `zst`, `xz`) in
>   `scripts/Makefile.dtbs`.
> - Restricting `$(dtb-y)` to the DTBs referenced via `/incbin/(...)` in
>   `$(FIT_ITS)` and automatically building the referenced kernel image
>   target (e.g. `Image-framed.lz4`) and any compressed `.dtb.<ext>`
>   blobs.
> - Populating any omitted `compatible` property on
> [...]
>
>  Makefile                 |  2 +-
>  arch/arm64/Makefile      |  3 +++
>  arch/arm64/boot/Makefile |  9 +++++---
>  scripts/Makefile.dtbs    | 43 ++++++++++++++++++++++++++++++++++-
>  scripts/Makefile.lib     | 59 ++++++++++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 111 insertions(+), 5 deletions(-)

> diff --git a/scripts/Makefile.dtbs b/scripts/Makefile.dtbs
> @@ -5,6 +5,26 @@ all-dtb := $(dtb-y) $(dtb-)
> +ifdef FIT_ITS_FILE
> +ifneq ($(filter arch/$(SRCARCH)/boot/dts%, $(obj)),)
> +its-dtb-files := $(notdir $(shell $(call fit_its_incbin,\.dtb)))

Just to check, is it intended that this also restricts 'make dtbs' and
'make dtbs_install' whenever FIT_ITS is set, not just image.fit? If
so, please say so in the commit message. Also, matching on notdir
means a DTB with the same name in another vendor directory would be
built too. There are no such duplicates today, but comparing the
directory with $(obj) would be more robust.

> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> @@ -429,6 +436,58 @@ quiet_cmd_fit = FIT     $@
> +			fdt=$$(fdtget $@ $$conf fdt); \
> +			inc=$$($(call fit_its_incbin,\.dtb,$$fdt)); \
> +			dtb="$(objtree)/$${inc%.dtb*}.dtb"; \
> +			compat=$$(fdtget -ts "$$dtb" / compatible); \

A FIT configuration can list more than one fdt (a base followed by
overlays, e.g. fdt = 'fdt-1', 'fdt-2'). Then $$fdt is 'fdt-1 fdt-2',
the sed range never matches, $$inc is empty and fdtget fails on
'$(objtree)/.dtb', breaking the build. Please can you use only the
first word here, since the base DTB carries the root compatible?

> +		configs=$$(fdtget -l $@ /configurations); \
> +		for c in $$configs; do \

BTW, adding 'compatible' to the configuration nodes after mkimage runs
would break any configuration signature, since the properties of a
signed config node are hashed. mkimage isn't given -k here, so signing
isn't supported anyway, but a comment would stop someone adding
signing later without noticing.

Regards,
Simon
