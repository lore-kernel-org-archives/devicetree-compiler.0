Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792829818;
	b=F3E2P0HfnDkbg4TM62JzV/aITXonmeBW24e+cTPOL/lfHDT9ZA7fAVEwUAKvS9QhFgdQ
	 /9qYJf33yt923Gwm2AgG4C7A8ccVOo+LLMhw+Tj/rH1l9S8EkBZqbQjPaQANDrgT9cIcE
	 CLBlQiRsRfjmeefov3ArPncLcJgufalJKr+grdtp4YztfG8evb+wzqqjR6CI4gk98OAwz
	 J5RafeV8Nx+u4pK+vSjpv6XmT4p255v38VEozkCXN+sqsSn/4ySZQebFpJuRS0sBuKbCa
	 pICTemG4SNibDygtCxH38upCuG/Ze2ipcZAn1j7hgpBWvymZLWY3B7wauwl+EOUKC0w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792829818;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:MIME-Version:
	 In-Reply-To:References:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=lPv80ccJgYYw4AUwmqTrRtQb9q7abpSwK/Y4bqqZPDM=;
	b=Dr1ZO3TcB3VxcCTYybSFlZ/H4peD67LZwJqi61R0mpi34Up9mMtI00mFV5UwbT74k24h
	 W3IXGQr1kbkLuOS1KxJLRMTvoh3fTpv2Efg1xaR0wR3IMhzwNJZMe5/JO7xEZ+qqPwTxM
	 qLfsv+8pPsZVE+a8SspfyWXVJLuc9c5Vdnpmi6PUV3orGY54STZhcz+QvOouhjJ0ABTlA
	 cvp9CzZ6Xfd8SIE5tU0jAyjmTXqKG1/NNKc6j34CfaqNdbmlTtWc0xll43lSyZNCWRbrC
	 noT72WpeoM01DNf6/G42xvlTAGEIfy6za0rkjLkjfIuX8qbxVtG1HqTCtUCuEdGdEHg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=J7SknmwT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D128606A320
	for <Devicetree-compiler@vger.kernel.org>; Sat, 24 Oct 2026 08:16:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D128606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=J7SknmwT
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c3f04e0e65fso232791966b.2
        for <Devicetree-compiler@vger.kernel.org>; Sat, 24 Oct 2026 01:16:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792829816; cv=none;
        d=google.com; s=arc-20260327;
        b=oXQgnYlDDPA0S0a9EdO+srVfVV+wtFK9Rt0+Ha90JBiYsT4BMhqxhcS1WE1j1lTu7o
         1Y1Y+P4c4XMcOnGuuUpyVtuSICWAfZeJM8tu2JKqzlJi3xr2bN5s7Ez3HRmQqtsDOWyH
         cLEazkaHKRbf3Qpq0Uy3aaD60lw4MCD/NZu+ZnlwLo2gVZdTtqemuohdI3nXy1f6Medi
         m/8yP8fTYM4NccTnveMVo46Xq6L0YLPE39T85PyFbN+N3vmNykBB0NxHtyccmZIIO7Pe
         OlRXN3jM2VOWfMFkFnr0D3jrLDqLxZHjS3rX23r1gOnU+q44Pq+Q4KC1Z69Ki+XC4+IQ
         efyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=lPv80ccJgYYw4AUwmqTrRtQb9q7abpSwK/Y4bqqZPDM=;
        fh=xqEUNF1VNA5XvtCxZZJjL2n9OoX7EVuAaCgJkh9xtes=;
        b=szHbShYXFWFlkJkoVOzKsEFoceos9jlUbT1K0uuUfmjRSJ0Lc+g0LR96DvSkDQUCbq
         4+IgSLMK+g+Yh0W0o7CGSrNXYid5UxSPQOW0mfFYCW3p6hqB8Q/cFpM93+oEcLOK+Ulp
         pA5/16CwJp8NmsUzMMs+zvsTmaoJaqhnKth7K3We1gt2R0CyXzSvs7htqA1w2924WYpL
         Oac3NEuU+WcrhBc8txANQwPDj/sfnLZxZkitL3jNHKcsjDQJJ+AppiZBXEASTa+1DkEQ
         916yrjNb8mA02Xxx5bmet4i4Kp/yuAKzgl0RPC63bdLdR7j2L/e7eNlBMYjcV0CtU7yO
         H8Ng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792829816; x=1793434616; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lPv80ccJgYYw4AUwmqTrRtQb9q7abpSwK/Y4bqqZPDM=;
        b=J7SknmwTTzL7ECy7vAoxuDafrONez3XeCWql0X/0YXhgvAQE2BfBECDlTFWueGZ8Jh
         klrfah4NQphtxV5+spcx32j1zY8Lj6vh+cJFzrPDn1Ptw8VqQ53UpyioqrJd6EaGMvWO
         eSd9MJuHBLn7s+f0x+KjG9NHtf+4lfLEvhiOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792829816; x=1793434616;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lPv80ccJgYYw4AUwmqTrRtQb9q7abpSwK/Y4bqqZPDM=;
        b=BEXvnHZv2y3jPXbMXqao9LW1asLwsmRkJk9ZlJtA8TlZS6yyiIgLwBkf9uplL1b2Vk
         B99LlwYc4654B1dRrCh8ch4vfNgfcSGmBpswldtl2Wmf5tsSpmgqkfprXqApRcaj6VCM
         85vJmz5C4LipaCB16WlV10W4GxBPxupKLc/gDxogMMD7CNdFmZz5eCYiU9wCYEBc1RWy
         sk9AQesTlL8X0sbLnu16IrTqvHusfyDDwH7lEF13YJNKbQQqRT09kCo1tc13BQFG4AzJ
         VvKW38vfE8zRvW+CjHKqc6z6XYu4GNaqfMaWKHyMIxvRfpD4iNYLbfxEdfuALVgRioQ4
         gBxQ==
X-Gm-Message-State: AFq9FYIQZulDdzb872lgPKCdwru98WZl8StWO/OC5+JQAyGIRkQVEuMT
	RDR0gigqYnurkh3XCEKFEMFLtzJ2A355NRJRdJtLoCXW4ca9X1lawf0KlIbSPDY5iDam3li91Zz
	o+AaKuuoby5NXEnD2U5ycGMve11eDn6gBr2NWEPmU
X-Gm-Gg: AYBFou16bI+/W0pvhjWRSfs1PiN3FzRb3eHo8MRkLciX3tcNaQ32BtvutAWcjvs2wyR
	XgfjnYj+Xu4qoEowo3h3d9y1mwgSq8AVFx9smNJYTC1Nhdr0SsCDJ3h/lSSXV019FMKJchlH36E
	GyW0HPRo9KAtrtNS7Tv7ni5nyHDU7qtHq2Q/t8sHAZybw0em6Fafm8Hk8tBK30ZVLuhA7Xho5G1
	Yo9tjrTNsfnnl7mOxFvAyjNZuG2gKVX1UuGzFKWzXXUiVolH0we6jdedEseNC6vysgpOi+k5upI
	79rudcRjKzVdsviJe/zfxTzZHViqVye1vWxoykD13GYIg9SqrT87ZQKx4cq2ns2+sk0MDPv4R6I
	MbdRAIEsewEdxLEKdJEAtzPED6Gh2n4fdosM=
X-Received: by 2002:a17:906:9f84:b0:c44:494:692b with SMTP id
 a640c23a62f3a-c46bde198e0mr151110066b.22.1792829815874; Sat, 24 Oct 2026
 01:16:55 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:16:54 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:16:49 -0700
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261020153652.2907186-1-dianders@chromium.org>
References: <20261020153652.2907186-1-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 24 Oct 2026 01:16:54 -0700
X-Gm-Features: AclHuK_VJyuusU7nyQWEvJVdBRj5rBge31M7RaY0GTXZjSe04p7xrEJjqvNNRK4
Message-ID: <CAFLszTgzpQ-donjjtcPwy5T3pfWg_u83QMh0GcdpY2JCq_s75w@mail.gmail.com>
Subject: Re: [RFC PATCH 0/7] arm64: Add fit images for sc7180-trogdor and google,lga
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
	Alice Ryhl <aliceryhl@google.com>, Andrew Jones <andrew.jones@linux.dev>, 
	Bjorn Andersson <andersson@kernel.org>, Breno Leitao <leitao@debian.org>, 
	David Sterba <dsterba@suse.com>, Gary Guo <gary@garyguo.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Luis Augenstein <luis.augenstein@tngtech.com>, 
	Marco Elver <elver@google.com>, Mark Rutland <mark.rutland@arm.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Nick Terrell <terrelln@fb.com>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Rong Xu <xur@google.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	cros-qcom-dts-watchers@chromium.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Doug!

On 2026-10-20T15:35:18, Douglas Anderson <dianders@chromium.org> wrote:

> 1. It uses a checked-in .its script to associate metadata with each
>    board's devicetree. Other tools can parse this metadata in order to
>    craft a package that the Pixel bootloader can understand.

One thing I'd like to check before this goes further. In lga.its the
metadata is a string packed into the configuration description
(board_id=...,board_rev=...,soc_id=...,soc_rev=...). The FIT spec
treats 'description' as human-readable text, so this turns a
free-form, undocumented string into an ABI that bootloaders and
packaging tools must parse. I'd much prefer proper properties in the
configuration node, defined in the FIT spec [1], so that every tool
can rely on the same names and types. I'm happy to help get that into
the spec. What do you think?

> How does this series help us?

The FIT_ITS path is a second way to build image.fit alongside
make_fit.py, and much of it repeats what make_fit.py already does: it
puts the root compatible from each DTB into the configuration and
compresses the DTBs. The series adds fdtget/fdtput, sed parsing of
/incbin/ paths and a shell loop in Makefile.lib to do the same for a
hand-written .its file, and the .its files repeat the DTB lists from
the Makefiles. Have you thought about extending make_fit.py to take
the per-board metadata (e.g. from a small file next to the DTs, or via
FIT_EXTRA_ARGS) and to run fdtfactor itself? That would avoid the
in-tree fdtget/fdtput, the mkimage dependency and most of the Makefile
logic, and trogdor would come almost for free.

The new FIT_ITS, FIT_FACTOR_DTBS and FDTFACTOR_ARGS variables aren't
documented anywhere, including the image.fit entry in the arm64 'make
help' output. Please can you add something, perhaps alongside wherever
FIT_DECOMPOSE_DTBS ends up being described.

[1] https://github.com/open-source-firmware/flat-image-tree

Regards,
Simon
