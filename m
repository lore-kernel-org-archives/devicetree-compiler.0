Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793364634;
	b=fkGsoQMb7dQ/mIJwDteMaHMp1xN5CVHWMsukxhoNampb/quqwaAo1CLnkTg/ObIxMybC
	 5iMsxkBR8IiAxiEo9hqnZ50vLpypX45hjAxjgeXov7P9F0kjF9RpscsB8Pp0TllggdAsP
	 OriecvUsr0R9dJGDrdrMHq+KS/rYikp0HT5k0Ge8f/bcfC15xJhWLIieH03U8syHsQ+YO
	 nA9GD7TcELtcthGgbF/xMiEvy6muphcy3tknVCIwfMwCIz4yy0J6U18HMgBHmjcHmFjQE
	 bWuhNVYsHIT8CNlV0Hel7xIKDoyl7pDtdVZwcJcoM3071pFUWbifVUgIq5d1P/cHSiw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364634;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:MIME-Version:
	 In-Reply-To:References:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=NfpnBNATdJxRwGxwDYzc8qVCy/56bkd+pdGBxDe2S28=;
	b=IlM62xEpsVDBWqeQSrCalzoBZwBP6VDp0kmXcrP01wdUY6sTMMlJ7Icb1t1LAMyBJtrl
	 yjW4HwBUCqPfsMQZoBkR4E5WRCC4YaXMlUSITKjUk9dQEjq89fsHu8zSMs4lGrldDZ2yT
	 GvQ7hKyqWp6pA2BhMzMat7uOi0tOmMSGnXdrowYLd45TYgMHdMvSgKFhdcmFXj4SQBnDT
	 P0chFOE7rL1cRMsBnUBZALsqdtgxqLk+GanvPLn79JzH7yRC6YmjeJw3gRkf5H1wt6E4S
	 AM/sMfrcQM8HXOlHl8pSOjE0BuQQ9OgpVWEHPCiZsWuM85uTR6b6tae5yEPD2Lnj4sQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=SYbesSV1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467C5606A32C
	for <Devicetree-compiler@vger.kernel.org>; Fri, 30 Oct 2026 12:50:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 467C5606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=SYbesSV1
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b1aa377c61so765021a12.3
        for <Devicetree-compiler@vger.kernel.org>; Fri, 30 Oct 2026 05:50:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793364632; cv=none;
        d=google.com; s=arc-20260327;
        b=AnVZ6CtD54eaeF9CcS94jnU+gFxRrY37WsXt+he4heddm3HEWSKczU0zrZNqLamBrM
         eqXs9xvy6rh1W/ibeY7v8Z61eBNT2W6HiwACn/OMGQejSKFun0e3dnwL9vFRYsorkX4I
         ykMbs9MfT4wtQv8O1KerLNrxDle6wxeIOUx8F878FaIonYjacYPha9L/nhR7ETYZ93A6
         luSpbl3ozhVAVH3ZOSY9cQFM6Lg5kVRm+Ldtsu/RcJOLYr5GsRjcNKgkB7UrXvwMS3/r
         C3vZcxXBE/6wiROD+esQI+PzzrwH3ys0MLkuMN5+blu3ts1SANh/nJXSMocNvt6vvDXR
         VRmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=NfpnBNATdJxRwGxwDYzc8qVCy/56bkd+pdGBxDe2S28=;
        fh=v0GCJqyoWGhL0bL1BD0oUO+DkJ2nkPH0tE1OsgHyX7k=;
        b=JbnCXdeq+7zUkgcGt7Zqoy4KQPFCeU3JEgxgEX5/gQhCKMqLTs+aKEQsuqXCPqsaLz
         04vIP4gD3/VkgpdLuLUZE2Xb9vmGEevT50OHvBWzgbjz5mU2StnJus59fCrB9RJtuaMM
         TGhMTeFxR1LURlCg9VtptzGUvB7DJNd9JXuvYxvFM1yOc71oBprWINeMpRa4dHt2yrB6
         Hmd1gIUlWW2GR+zeGKRK6pV8mv7tjWvhFXlZ4Gj/z7Ft/KBEu7S2X6tbshOebM8EW1ZN
         i9LlvzjhdmiYH5PoSSCF0YDDsbfFE5ABPvjU0jO9hjtDvOM8tRidWbawypYbe9oDhuSt
         hDrw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793364632; x=1793969432; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NfpnBNATdJxRwGxwDYzc8qVCy/56bkd+pdGBxDe2S28=;
        b=SYbesSV15T5/9mZIx8kfcRNmn6l3YY8QGeI1q8Hely+8rS2podieFf9mOy2+xsDRsj
         U77SNQy5fVGsS8tR6YhEeb++HJ5Oyn9vwVGmcIRXhieoNGGDnTKkc3HaDUzzXbgMzq8F
         dYVn/3f8xOtoGt2MJk/Msw8qqcBWv4EKr1+wA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364632; x=1793969432;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NfpnBNATdJxRwGxwDYzc8qVCy/56bkd+pdGBxDe2S28=;
        b=U8sat7xRTgK+qmHArGVHluG0pjKtHqML+e7OYryz8RvNO5kJO1UEAv9LYNLFKBlKDV
         PkNevATnwHy3Ga1ksV2BfI89BaZroLYfrMEamoQZII/Ha/ya40OZrnFENTp8yL86WOId
         ggdv5KP1Yru1cKrWeeMnpx5PQDh5KVC2wUMWK/WsTo3jk/9Yayu6JqV5kzfiWY9S+0Oa
         R9yi3oUZ64arZgTY2adEiM4Mk5BIng2NKw8DGjI54p+CpVT94fzEc3dgZtlQib/P8cja
         BB9qT0Ihl3oX9wapssn3royTJ0avzhpl0x1CIK7fxHG9EH2JAM++oanwJzzLnW1+EpNb
         y+Iw==
X-Gm-Message-State: AFq9FYK6XSFu+bw35Tl6ldRtY1g89l5oSrYyfWv+KufskI+OWabNrKnH
	8yqSabY4bUkP3Jo34SM+VtO0lq7Iecht1hflSANSWnnhsanUWBkE2V4pA1M0VJ+dvTVYJ1LDGk/
	DckENEXA5pvm37AEYETKrOc8qnGuxMiRkI9i9zQWe
X-Gm-Gg: AYBFou3nk0sHcO1muUy4v7JTEPXjSCW2YML09+9BOGtM8RL5cEgTenBFxVOPmk2GfGC
	db8YGr+/iJgpOdGbcgm/dRb+x+1k6yARWBCyH3RIklFbhBbcuqcgYsH4+e+nhf4GQl38fWJpmJu
	Ka/thMD2mlYow+hCKOHJdf3CHuKobvtPyFxA17AYi+i1Yo+Kd5w2yli/PAC2sFApvoM3kmKrZcm
	WELw4F5NFvKa58NJGsbqn4IVp2n0PtsGbnEIVEmc6oAALVIktFmb7Ljw0WXeUnaacKOohY69wEw
	bA1w5RUzro2kBFQW2PC1H1zfavjzGHkkA/l3nEmMNgjWs8/XYBFdvMqdmM+5xCel7Xr0g0PmF4z
	rR1emNL+bYHK0oPxiq+m1UWMH2QjJA9+TcIMws6UEMMQLKRuuUN+LsyyCLh5sYjqdafBMpOM=
X-Received: by 2002:a05:6402:234b:b0:6b3:c499:457b with SMTP id
 4fb4d7f45d1cf-6b4d5ee4694mr1571580a12.37.1793364631626; Fri, 30 Oct 2026
 05:50:31 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 30 Oct 2026 05:50:30 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 29 Oct 2026 01:16:40 -0700
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261028215600.1713475-8-dianders@chromium.org>
References: <20261028215600.1713475-1-dianders@chromium.org> <20261028215600.1713475-8-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 30 Oct 2026 05:50:30 -0700
X-Gm-Features: AclHuK_bLtvWnT_sBBLVpqNMOqp9dk3T0gTPOazDaN2_jgPIOOOV0mKPKAh7ZHQ
Message-ID: <CAFLszTjddQakuBaj3UYk0sKxVsOvhrE0+6KnGOQ6tQJ2o=aVng@mail.gmail.com>
Subject: Re: [PATCH v2 07/10] fdtfactor: Add tool to split DTBs into a base
 DTB and overlays
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Brian Norris <briannorris@chromium.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Devicetree@vger.kernel.org, Simon Glass <sjg@chromium.org>, 
	David Gibson <david@gibson.dropbear.id.au>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	linux-kernel@vger.kernel.org, Julius Werner <jwerner@chromium.org>, 
	Saravana Kannan <saravanak@kernel.org>, Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On 2026-10-28T21:46:49, Douglas Anderson <dianders@chromium.org> wrote:
> fdtfactor: Add tool to split DTBs into a base DTB and overlays
>
> When shipping a single firmware or kernel image that supports many
> closely related board variants or SKUs, bundling a full compiled .dtb
> for every variant results in substantial duplication.
>
> Add `fdtfactor`, a Python tool built on `pylibfdt` that takes a set of
> compiled device tree blobs (.dtb) compiled with `-@ -L` (`/__symbols__`
> and `/__local_fixups__`) and splits them into a single common
> `base.dtb` and per-board `.dtbo` overlays:
>
> - Common nodes present across all input DTBs are placed in `base.dtb`,
>   with each common property assigned the value shared by at least two
>   boards that maximizes byte savings across overlays.
> - Using `/__local_fixups__`, phandle references inside property values
>   are normalized to target node paths so common properties referencing
>   common nodes match even when numeric phandles differ across input
>   DTBs.
> - Any common node that carries a phandle in any input DTB receives its
>   phandle in `base.dtb` so overlays only emit `phandle` properties on
>   newly added subnodes, matching the requirements of `libfdt`, Linux's
>   `drivers/of/overlay.c`, and coreboot's `dt_apply_overlay()`.
>
> Add a `fdtfactor` test suite in `tests/run_tests.sh` verifying that
> applying each generated `.dtbo` to `base.dtb` with `fdtoverlay`
> reconstructs the original DTB (verified via `dtbs_equal_unordered`,
> including across input DTBs with shifted phandle numbers).
>
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
>  Makefile                           |   2 +-
>  README.md                          |  43 ++
>  fdtfactor                          | 814 +++++++++++++++++++++++++++++++++++++
>  meson.build                        |   1 +
>  tests/Makefile.tests               |   4 +-
>  tests/fdtfactor_board1.dts         |  38 ++
>  tests/fdtfactor_board2.dts         |  36 ++
>  tests/fdtfactor_board3.dts         |  34 ++
>  tests/fdtfactor_board3_shifted.dts |  34 ++
>  tests/meson.build                  |   2 +-
>  tests/run_tests.sh                 |  65 ++-
>  tests/testutils.sh                 |   1 +
>  12 files changed, 1067 insertions(+), 7 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
