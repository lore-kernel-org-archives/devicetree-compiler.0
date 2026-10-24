Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792829828;
	b=ZYFGl2Fxr7r14NAvWIgTxxGkbScCZoybKxQ0E9yP09FpQahDmLk/05hGem1yf4mIOFPM
	 XB8WJxbMy99ThTSPRTVc2U6JRmkO6OZJdRW5eAWZ+YDasU8Hl4brk/Yjjm8+OO7TymjbV
	 gx7RSIP0nAY5BQJESHsj9ql7wm2nkPKcHc+4jjm3Wi3TPjPzDDlb1OtCEipZ4qmZFHEM2
	 k3bQ70+aitv3j6BIY7tYHpopCKNcUg/7r/u32uvbNFypsXJjGLYqINsk2ib737fCF1NTg
	 zDA8lNiyTwPT0i7R8GX9jxKU7eyE3X2uO+p25iM3XqAOIIrUGSWhD454EaBFmg/gKjw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792829828;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:MIME-Version:
	 In-Reply-To:References:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=AGDStmYSsmq+afHkW2UV6kbMdOLt3+TYcYPs+HdAPQ4=;
	b=3h+D4SH/KkcPIcw4FaZK/58T0I2YR2xHOHxO43FlbX/BtS2MFX2dZIzwcFPcSJcRKtVw
	 xaCHz3WP5W98iIQceGz9pSvyT4UTlLgmJdARrAnfUmlBMZGe+wZzdPKXk1h+gmngB30aG
	 0FFJwVbYarW8QLryvBf5pMwUUjb/fqhyq/hdoXuYbCzvpYJrhwOa3Gf1RwHjHyy/6lNTs
	 2KR1otRGJnjCsvWFRY1TniFQSGzJojRB9lEbqX0mqIaYg9I8+KUI18y+4oEvSV+47l3ds
	 HKMJ9TjBAgNVxzS5EMX0ShTybfEEZikpKZ0QBUEw0XGudAcQW9fo57dZqNDIytTg/Eg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="RQ/C/ciB";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDF9606A326
	for <Devicetree-compiler@vger.kernel.org>; Sat, 24 Oct 2026 08:17:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FDF9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=RQ/C/ciB
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b1f4d8e09aso2290595a12.1
        for <Devicetree-compiler@vger.kernel.org>; Sat, 24 Oct 2026 01:17:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792829826; cv=none;
        d=google.com; s=arc-20260327;
        b=XUf4Onq3WJiNaKC8hrLM3ZLrE4G3+DQEM/eOMZW/JPfbNUjIYzqx5C5K+Gy7596Px5
         Kh0JWkdXHJCYUHlG5UyO4IqAmNwogLYBKGjQJogAYCj3qWRRQ3XAXaHJN4taWSQA3BJV
         hnxyk9xWwfu7x1vp/VfzKxjYFGlqtM7VU4Ud8jAWWlSDZiECLl9ZhYY8MgIkZAJyMoEN
         M1UraBsHLsse42a234qiVG9XSI5duffP9gPu9Gr+ksaIizOdH5cl2l6bBkpTWHlNw3ED
         dW/L1EAZPtfUVTUo9WQivy2hmR7xTxmu+Lh2Uw9MaWLgMXnR529lQ1YGy6hTt8YFqLgz
         w5Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=AGDStmYSsmq+afHkW2UV6kbMdOLt3+TYcYPs+HdAPQ4=;
        fh=2S8heCVlBcN1L/Prklu4EHW4prEk3qO28OF9EGAWJfE=;
        b=czttZYuo6husdzey+lNP+/FDuGvInPe+ZNVLA5YQyVRTxAwQ2xKOPe6QwUDyGBcgKH
         yX2XtVEABFfsvfexsp6VdOinp6iNzaWLYyXF3Z7Qb8ghenM2jr3GGHSm7eOCR/zG+78G
         SsL8au71p4WDeprxhOqEYMpy9C2/NrVCcQoCeAsf8oARirMTyZ/f9cw9o84RgSHAryeL
         d/KMhreaMdOhswwPDk/K7F39HQcfcKd0hFK+pm+iaHsFrC5ESfTlRL/kvR6LO7VVMj3i
         mGwbp5TGxEGchI8TTGYJI2naqWTRdL11ZjGUvD1Nfbit3s0+ZmzQuQhNAHum2vQjQNs1
         qRVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792829826; x=1793434626; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AGDStmYSsmq+afHkW2UV6kbMdOLt3+TYcYPs+HdAPQ4=;
        b=RQ/C/ciBKZJHGdvCZm/dYrMbyOFdij4a0YW87tH+vXDq+9FS+P0+VhkPe2yvw8PouR
         1rl5NjCRsmehOHog4MCGLudY+nXK4o7aKeyawk/ABbhLZrLiG/YXwW5Ec453FETEL8A9
         gIgBxk5de6f7THQVvOrLyQmTAT4gg/7K+qaok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792829826; x=1793434626;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AGDStmYSsmq+afHkW2UV6kbMdOLt3+TYcYPs+HdAPQ4=;
        b=ShBqimaW5PAEg/KTdxVZXuVIcZBCxbcg/XuR9jEL6hm/44Rg6zY87pRVv0ouDs5CwR
         1iXql0XtXgtpCC2jnyVw2En6C753U2N/JWIKk3f2AIZq2HxoX4lTFKj6mGKczpRiOo3C
         ZHGG10Ib09VzyM2s5I33sP4zhzIEs/4rQZrcOU9eAIioGe6gy1MuDfdBNWzOoz1cOLdL
         CCPwC4aFX0mtG8ZV6JDTkxDccr8kZopDnpLwe5co8UAbO7LHA/lDWdXDRXh1vnR8BZeT
         s+tefw3EWjOoDeu89t1UC8q6ReVgYHpPmHGXXZE1PV/8fxDmWb75v5WHJLqw9pMyc5QE
         kYdA==
X-Gm-Message-State: AFq9FYLFCn87s1BxfJkzJufuLxIvr/sR6oXCdYjzhuglIgwxBnIKsUmz
	3iia3SORNOOhfL1t2EwDhNkh71XBxHjjIkaktXfItnV1/O30uUvAG58W//YOLGXo+XIRs8ZQtMV
	P94Mcb8p12Nn/Gu1R3LQIGfOe7I2pzfSAGma0UC8N
X-Gm-Gg: AYBFou1mZ6c6q46/KIsz2WBqNreoIBC8fXIk/+QvUY4YNNwVnTjpBFGaEP21Kls/Kus
	cGgBjMJr4QQcnJNylFuMUgtQi+6x6qNwYZ3BLTBsrR/3x0EpmuTEoURUnxNFCdU1PjndeLwSDH7
	wHwgvphHVc+zRbcphEh31elN9HAODfCZ87VOKtUQO58Jauc0BKxe6+h5wx1Xjvcqt0oSugksbOP
	hYo5mFkNLdvuCFaVy17JLxsfDCI02t10aNs+rBaMMjTV7v8c9f7S4/ZQ2XGwJ9rNIgFga+dBnUF
	Q/zkB4vqMaD0z2VVeSbnyoOL0BHn+gnAcdPSXcgYx4VFmE4pbOjYIEVbXHruIzWf8wHDSuUPSfR
	62tbYmZvaIJgMcYiCBVs+KJfhrJVQYxbyczY=
X-Received: by 2002:aa7:d6da:0:b0:6aa:e46b:2ca with SMTP id
 4fb4d7f45d1cf-6b442ff19aamr1213416a12.30.1792829825967; Sat, 24 Oct 2026
 01:17:05 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:17:01 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:11:00 -0700
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261020083501.RFC.2.I4f270f317b44e1ba96f016c6fd9d93390ccafcdc@changeid>
References: <20261020153652.2907186-1-dianders@chromium.org> <20261020083501.RFC.2.I4f270f317b44e1ba96f016c6fd9d93390ccafcdc@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 24 Oct 2026 01:17:01 -0700
X-Gm-Features: AclHuK_qmQOwk_OOKs0VN1cm__skt9GZJUv6Fec-Si_oH1IGjBDYDz8yVEqOjak
Message-ID: <CAFLszTidu1NFSJ9dprCHts0-XY73gk-ZPAhz0V9BdYPoCcXmvQ@mail.gmail.com>
Subject: Re: [RFC PATCH 2/7] scripts/dtc: Update to upstream version v1.8.1-22-gf3451d12532b
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
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Doug,

On 2026-10-20T15:35:18, Douglas Anderson <dianders@chromium.org> wrote:
> scripts/dtc: Update to upstream version v1.8.1-22-gf3451d12532b
>
> This adds the following commits from upstream:

>
> f3451d12532b meson: Only take the version from dtc's own git repository

The script builds this list from the last sync point (v1.7.2-69), so
fdtget.c and fdtput.c get loads of changes beyond what this lists.
That's fine, but you could mention it (e.g. the new -r and -d options
in fdtput, automatic growth of the blob, long options, strtol()
instead of sscanf() for parsing integers, fdt_pack() before writing,
the libfdt iterators in fdtget)

I built scripts/dtc and lib/fdt_rw.o at this patch with no warnings,
which covers the in-kernel libfdt now that fdt_setprop() and
fdt_setprop_placeholder() are no longer inline.

>
> f3451d12532b meson: Only take the version from dtc's own git repository
> 7a1e01792600 libfdt: pass sources as keyword argument to library()
> 8c37c14c95d9 fdtget: Use libfdt iterators instead of open coded loops
> 89c99ce78ac8 pylibfdt: Add add_mem_rsv() and del_mem_rsv()
> 3750493c8b0f pylibfdt: Add address_cells() and size_cells()
> 0748c384fde6 pylibfdt: Grow the FdtSw buffer geometrically
> 5008d1d6a356 pylibfdt: Replace removed SWIG Python 2 compatibility macros
> 66e1201c3775 libfdt: fdt_check_full: Add can_assume(PERFECT) check
> 214372a27398 tests: Replace trees.S/dumptrees with treegen for making test dtbs
> 4df9ca4c8ddb tests: Add treegen, a pure C replacement for trees.S + dumptrees
> f116f4800edc tests: Dont have test cases link directly against example dtb data
> 9b53b9a4c2f9 tests: Add missing unterminated_memrsv to dumptrees
> 5f919a25d71b ci: Merge make and meson jobs using build matrix
> 6c1426dfa963 ci: Add macOS support to install-deps.sh
> 23fd89bc8ed8 ci: Move FreeBSD CI from Cirrus CI to GitHub Actions
> 3ad5ebbdd9d5 ci: Upgrade actions/checkout v4 to v6 for Node.js 24 support
> [...]
>
>  scripts/dtc/checks.c        |   2 +-
>  scripts/dtc/fdtget.c        | 207 ++++++++++++++++----------------
>  scripts/dtc/fdtput.c        | 280 +++++++++++++++++++++++++++++++++-----------
>  scripts/dtc/libfdt/fdt_ro.c |   2 +
>  scripts/dtc/libfdt/fdt_rw.c |  41 +++++--
>  scripts/dtc/libfdt/fdt_sw.c |   3 +-
>  scripts/dtc/libfdt/libfdt.h |  70 ++++++-----
>  scripts/dtc/livetree.c      |   2 +-
>  scripts/dtc/version_gen.h   |   2 +-
>  9 files changed, 391 insertions(+), 218 deletions(-)

Regards,
Simon
