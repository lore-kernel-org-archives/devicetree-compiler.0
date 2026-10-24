Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792829846;
	b=05aaEEW8TKIr/1xeN8roA/XkLuanKpKux6wZXWVvzNtMP0+5YBJbLmQkzo4VwFQ/EljV
	 4/eG0kf98bqsWffu0JHLciMSldVVycDcdxwNvwjudspcaz2j/ZIk/egoH+9KN8naCeiEL
	 R03B78NWSyBDDzVE9+VrhABYJwshYdiGnFX3kHeuVJSmfo75/5/X2pfRB391kbK/CGCen
	 /pndK0XizXCEOrr2B5/o+HW8HrGMOjTnZOBjZaM/oLzb4gB+vckhoi1ZE7mTPbhJJ9d3T
	 mIkX/Iojx51nZG9qg6NUju/mE3n3qCS+AFr7AHUjzUQc4jkmmdeTOt4j0GmC9pxuaoQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792829846;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:MIME-Version:
	 In-Reply-To:References:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=cyqk+XMSMcVf9vVXU4rdRbRmiDkDjXgnwovnotWECc4=;
	b=WPu2yi3IojRK3R/+0InC9P+qghYCYK1/UV+nuXkRd3bFJi3ZdVBLLDKtABlUtvusjmsb
	 Cyn9dMPRwNthogZUlmRtrTcSjsbtcwpXVryCRqdZLzezoha1aojUvBI6/avPw8ys2nrZo
	 +RQZhnTyN0W0UQBwR+a+0GsRd1aG28wKDOLxrjdn/RLpr3gWerB5spgKJSDN6J/AshYUR
	 yvw44ql1pXnrSPDpooL/TutIiLQqMbSftA0ZIouXtsx6z+ENkCaRSU8coJYBIJ9SpxS3c
	 qFgQoNpUEkXaF3/DzZAx/reBhJUq1OCB2oyzSv65B8b36+V88zcuE+lBkh2Z/cg5dJA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=W+scGDok;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B953F606A320
	for <Devicetree-compiler@vger.kernel.org>; Sat, 24 Oct 2026 08:17:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B953F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=W+scGDok
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cd5c9e52398so582959a12.1
        for <Devicetree-compiler@vger.kernel.org>; Sat, 24 Oct 2026 01:17:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792829845; cv=none;
        d=google.com; s=arc-20260327;
        b=lWlfckNR6oB5ekSiUrmCxGqv+t80YacIvtFh42izz7qolUmNktJxy4Tc1Of2QLLRe8
         DXv1UBu1XPM3w7irjCLVf6ptiNp2YFlhsRMSpI4nRFl5pnzrXbANxQM1Km3dYQ3DWhDf
         V0RxkbMmnZz7ZCxmb3EiIfBCITm9AU0cM4rhpyDdw8nk7CNr4vzmuOfNcY1QAVDxtpDF
         DrV+X1MghTiybiATOh69YgSdvYkOnxtwtXYf9l61XRJlwi1oQ+eZEk9hFNhwMvLCW5IC
         anMNcP8D7uJV4ACNGSHM0sPfdniIZ15KvJC2ynMY0LGRIEXAW8aH6tFRNRpUINdyOUrD
         lLKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=cyqk+XMSMcVf9vVXU4rdRbRmiDkDjXgnwovnotWECc4=;
        fh=7FGtW7k6T9sVATcG7cAb/futjfFzAdoWLhsMDMYgHmw=;
        b=MAL0AYIN7YjZdptXsth3UygXc4+1VGmqdIS9LlJbMdzVsHSjTaWpXqfnRucUrLY3ZN
         WphGNQuPTAJRv0c7Nb+9sFQ1mXdH1nw+qL+7VvvvlpS+JSjvRWmwbPchBFt7mwiiC/MR
         xurwhl/WzbVfQotvMRrp2+vG94bBAm6+T46MSMhAk5MYl1zoPEBmd14YfkPLfTMylL4X
         fpw1gMPIW3Y3vibgxFgTPfm6U/os91Htg5KAPr4DMEvnsrxxO3yEK2HMncp3Pf+8pE3y
         YNOq4+9gJntTXebkQHEPdOwBDMJNgOFm+YzRwx8QE6wUtEiZyLtCsXruueLDtHdg31JF
         Kjtw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792829845; x=1793434645; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cyqk+XMSMcVf9vVXU4rdRbRmiDkDjXgnwovnotWECc4=;
        b=W+scGDokeW8IVUlPw1qaHOR19xQPyTOtn+x7HYHtCqXqHaqa9rlnDqjOM+2Ceue7fL
         Aju4fOv9xr3yNjCoA1fmjYX1vQStbRNTO4lyjJ+X0ScdnOQnU3gmpoLqAC4vffWd2TMB
         smWVx5HbLNJaVGD3+OBLLSqtnKQQ46IxDRMvw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792829845; x=1793434645;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cyqk+XMSMcVf9vVXU4rdRbRmiDkDjXgnwovnotWECc4=;
        b=SWq9vUiPi1LayPzEkxz/aCGEQMBw0ji8nLrGIKhjQ+fp3zqOm1Ko9qCib7/ULlNKi9
         3q3IwLl+djEW4SEB79/kkH4n78eqPd0NVP3WgBJ58vjK4MHwwYU8pj4UMs9eaJ+XwlLg
         QPw8cgbIWLJeHWVDzfwgTXrL+TBN3EB5XLBRt+vHgNAezGc2nYJjFKrlS03ssXITBnKY
         HSzZ3Hj3IXctxHC7SccXywKDQgqkJbudANbJBfMWG601z3sMyDBSJpJreQnf1MKjhuMQ
         DT85IFBB0i1y7N3E2G+ZpUWDz7In4qbgB7skjjM+zShOXvuwAg17vlXJvctwqqTnJIFc
         knbA==
X-Gm-Message-State: AFq9FYLPquWWw4t5fAclkrw5+D/GUlLR3E5w3Mj8hJYAVx64H86r0tHX
	0fw4DUgxY9T2kGJ7OODB4Jyw3bVjwWXlUvp/5Y38gHhHgKBvH5FEHvnUHiZAADe2drJwnhFCpIe
	PvROSuouSpKBzhuZU2at7tS5xynzRdE/wHk9f4Lwt
X-Gm-Gg: AYBFou13T4n4XkrFiBeOZL8RSECoG9f2XDQvrmy8rYkUcOou1aQr6jo+648ofQv3Ce3
	5DIdcl7u3AIJUB+LJPPhDOB9GVoqhhRHAoIrCiKY4Yr0h8phYp5ivRzicgOc1LYWY4g6vfSqXAi
	hEuWmVwSqBtKrTFrwKP9xlOybM46spBk5Y9e3slHkLeVed/6TCicQPp1Wu+mFia2IJ4/lRfEqGk
	j8g79je54oibsoeq+bM67Vu2lQTDm1v2VszdpsNqBOoXnXe7aPr/ftvzicFqVCSFaS1TapQqBaB
	WEXLr0VdDQo3er4s3ZDLUaM38hlWi9EQJE+ClWOLDppFVrrAvXVzjmyxTX0tbfy/u9JcnVgyO8I
	8CwLOcNvR+dq59dYpvl1y21fuk+u1KX7z9K4=
X-Received: by 2002:a17:90b:4d09:b0:3ab:31e6:12fc with SMTP id
 98e67ed59e1d1-3ade9475f03mr1281929a91.0.1792829845190; Sat, 24 Oct 2026
 01:17:25 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:17:19 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:14:33 -0700
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261020083501.RFC.6.Idfb669fd6c518bc86e45d8555f159c0ec611a6f9@changeid>
References: <20261020153652.2907186-1-dianders@chromium.org> <20261020083501.RFC.6.Idfb669fd6c518bc86e45d8555f159c0ec611a6f9@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 24 Oct 2026 01:17:19 -0700
X-Gm-Features: AclHuK9OzNbsUxoUq8dndEPiTUrFf9OR8thbHVNZoTYdjjGKeFC-1VE0qwrhJ4E
Message-ID: <CAFLszThr=rPCTxQxst2_Br6MWwaRFe_rHamzLXY=ua4Qr8mAeA@mail.gmail.com>
Subject: Re: [RFC PATCH 6/7] arm64: dts: google: lga: Add lga.its FIT image script
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
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Doug,

On 2026-10-20T15:35:18, Douglas Anderson <dianders@chromium.org> wrote:
> arm64: dts: google: lga: Add lga.its FIT image script
>
> Add an Image Tree Source (`lga.its`) describing the FIT image for Google
> Tensor G5 (LGA) Pixel 10 family boards (`lga-blazer.dtb`,
> `lga-frankel.dtb`, and `lga-mustang.dtb`) with board and SoC ID/revision
> metadata in the configuration descriptions, allowing the LGA FIT image
> to be built with:
>
>   make \
>     FIT_ITS=google/lga.its \
>     FIT_FACTOR_DTBS=1 \
>     FDTFACTOR_ARGS="--strip-local-fixups --single-base-dtb" \
>     image.fit
>
> NOTE: At the moment, Pixel 10 doesn't directly boot from a FIT
> image. However, packaging scripts will be able to take an image as
> built above and convert it into a format that the bootloader can
> handle.
>
> It should also be noted that the "description" of the various
> [...]
>
>  arch/arm64/boot/dts/google/lga.its | 68 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 68 insertions(+)

> diff --git a/arch/arm64/boot/dts/google/lga.its b/arch/arm64/boot/dts/google/lga.its
> @@ -0,0 +1,68 @@
> +		fdt-1 {
> +			description = "lga-blazer.dtb";
> +			data = /incbin/("arch/arm64/boot/dts/google/lga-blazer.dtb");
> +			type = "flat_dt";
> +			arch = "arm64";
> +			compression = "none";
> +			hash-1 {
> +				algo = "sha1";
> +			};
> +		};

Just to check, does fdtfactor recalculate hash-1 when it rewrites the
fdt-N data? With FIT_FACTOR_DTBS=1 (as used in the commit message),
mkimage computes the sha1 over the full lga-blazer.dtb and then the
data is replaced by the base or overlay. If the hash is not updated,
anything that verifies it will reject the image. I'm also not sure why
the FDTs get a hash but kernel-1 does not. If the hashes are only
there because the trogdor script has them, it might be simpler to drop
them here, since the packaging scripts repack everything anyway.

> diff --git a/arch/arm64/boot/dts/google/lga.its b/arch/arm64/boot/dts/google/lga.its
> @@ -0,0 +1,68 @@
> +		conf-1 {
> +			description = "Blazer (board_id=0x070406,board_rev=0x010000,soc_id=0x0005,soc_rev=0x010000)";

Since tools are expected to parse this string, please can you add a
comment at the top of the file describing the format? For example: are
the keys required or optional, can they come in any order, are the
numbers always hex, and does the width matter (6 digits for board_id
but 4 for soc_id)? Otherwise the format is whatever the first
packaging script happens to accept, and anyone adding a board or
revision has to copy the existing lines and hope. But I think we
should get this into the FIT spec - will mention that on the cover
letter.

Regards,
Simon
