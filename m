Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793805255;
	b=g4M+4cwVaanDI1VJm5UX0p4O81vFwfY1rLXUKe1tNIlKy2+Bf87FmMPaf3CzSpMEXVHF
	 oQR/pz10Gp1m40gnvXRxB6UDZTD2NplnTbe+FBY43CJKbcKyTqEf2/FnH4ngUqvUqbWnq
	 pxxE+s1PKj38GhciA+8VeW17wDtPdh+ht7GDB5s8Tz7o4/taC1rs2gfAg2Ida2MYekDfx
	 SLozwVUFFIoiPdav7PHXW6fSbHaLNQk5g23vXGfDyftyxzOMdZWxMbcAHxuYXsSfx90xU
	 jU2UG5RtLbgI/T3tYKWihy/AAiIkYUH+qRbS9CgAbqlffc+WRIW40+70lAqQJzCgFbw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805255;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:MIME-Version:
	 In-Reply-To:References:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=ROC4carc5ag3yruhjakvwE9XMb+//D3RtR/BQW4q+8c=;
	b=cZmKkCuhKMsh7bOyjBJVD+H+/SDKf95usADoXdQrYn88MSfDa7ppNHNTU/JKphAsH9VO
	 wVJ6ckbvwQvZ5RwV53CD6i48lG3DXcvVhVI63C6jV7HEpac17Dx3kBkQCIDOiJKTlbij4
	 auyhlHnqHAG1RhmNMwCriCk5E4Yt5QxftBi8Qn2sFvNg1vwOV28Ftjjc0ZNWDSrYeBvhN
	 dR7lO9fcs6SC88Pg2UIGpgEe7r35yyov4BqtkMiGW4Klr2VZKRgZVx+5otCOVe/okgegB
	 g3ChUNHga4iRb3lMl6ccR+wL/Um5QTs4Eoqj2qa3OleVPVyWWPIZaJ68LeTYHnGZHOQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Y1zsX378;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2690A606D803
	for <Devicetree-compiler@vger.kernel.org>; Wed,  4 Nov 2026 15:14:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2690A606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Y1zsX378
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b203527bceso1023328a12.0
        for <Devicetree-compiler@vger.kernel.org>; Wed, 04 Nov 2026 07:14:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793805253; cv=none;
        d=google.com; s=arc-20260327;
        b=rcFhEiOC/XnJiipoMIztk6R+wG1BUEJcbfTe7u9Vo6u5TAXSNygxcfSpB4dOft0aDc
         qMtQegXBlU6ps5rSr61cy2TGKXeOdMCL/w0B96u8stduJ88+NO/+R0Eyxwublb5BBJKE
         fN4qC5G5+0NOKFHEh9cMfurmH/pSfK85b7TFTOXDhytnrGD0XVlmu9DlKOTy8BTln56i
         E6uv0oGMWoyXQWPQCtY7PGipHCejM8xGoKLTly1EHY45vkDVsESL8TU+YMx14hs8p2ZU
         znb28jouxhu4ZXG0BxM4JJtSSmo6/M0tq9Qha2/z+loGlCBElVy4GgYZ95A48Y8pjQiL
         beCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=ROC4carc5ag3yruhjakvwE9XMb+//D3RtR/BQW4q+8c=;
        fh=4BA7Iq9H0VSWaCP4Je+uW1rc04Fmu9gG6jldUSQQ6Y0=;
        b=iZsn7gX8Ed8GYpLZNv242IZdn9xC2eoIRCUhu3idhZnjs0t2t0ZVow2zaozoc81QPF
         FubMT4ODhnFHjVN1C5sMgt3ayatrYezMcxOpRX0YT4GSJak5746s+a8E443NyK/2k/yN
         nLNckv1U1DVWTCeS59Ek8Dx0/NpigSIASnTxoRPWBzXcjon8qItJ9LPcCRXdYqiT4PZ3
         GtI47Yrrt0DRroiNKSLz4G7yEvB0sbir+NCuJGIn0bvbwiR9+dUGycuhxK36yB6u/bGq
         F8tL0Xsm2SCuwA89589sOFPYm/f4GxX+Vn+egNd9bsV8r/HNCJRi+3OPiBlAyz29o7Zs
         Xr4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793805253; x=1794410053; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ROC4carc5ag3yruhjakvwE9XMb+//D3RtR/BQW4q+8c=;
        b=Y1zsX378kusvubbo0IH/Kiu2MUjJnOlUaZHAsVp3UZZHyN5MFMSQ21ppiS9c6wgW6A
         6/zZl2+wCovE6yhcXCl4JQKET7Vg7Lj6GWMT7wFe2aM8Hi/iFqk/vwJR58AUu4CiVSUg
         /qPsunGogtch3I5R0noFWiEPrhzcFTA6FCXn0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793805253; x=1794410053;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ROC4carc5ag3yruhjakvwE9XMb+//D3RtR/BQW4q+8c=;
        b=Z9apHQF7wKfYLgdKfv29xGaxC5jboNWbKX8vCSHbOo9itOlWIhC20Wyh+/KiLZee0s
         YjTph48rpD6uhuz0tiVSLe9ZjkJW1razR2hNvHffnFPRLG2/tnCzAJe/ogT1Eej3QGNN
         gsR+OcwauqebirEVyozGOTcSUp5LjbmSqyTZiah2l9WdwZmP+g5O/+ZuR+X5yw0e2c5i
         Nry1/ql+Hj7C7zv2VvP3Cu+5QA3SNnxQklJhhbEgS+CUUvrltZRYEqyeu1BuloqGjOtT
         +KH1gnscCiHHINzFof54ySKtgVHPVN2o9UpUCHvKeS013Ng8DtOeETCmkJvIrpC4bg3j
         mQrQ==
X-Gm-Message-State: APuU4Z/lakw+qFGZFg3mii1bjuMCKzdCbWVJ43X8oTDa8g7/dFBH3p5a
	ec/eFVGMC5xfV2ZPXSTt0YM7F6mkovLncX30I0Ex6AwDawQz5JY9h2nct4szJWlDLdrNGdKhYPl
	oJbp/GaZoLguvoqng56R3SfpmALR45lnHPcks+e3D
X-Gm-Gg: AYBFou0cEoMWzL2kC2BEdqTvAEjWygiEmlWJCdFsTESQ/khTNFz2eSnvU0624LEhcxl
	+LvBtGnyCNGQ3is5u32l6AWyHijJ9WpeqiqOMdjcGq76tG9ZxQj+/NpNeyCzUo78S4BtLPqdS+3
	K28j/3AKacCwCJXNhOC8T6IEhPfXu77oFh+7ynGGsyxoBRwdfMI5AI+z/DnHp86CnQATEf/vVVu
	RMBjorblSrVQQa8oqS4HGGNura0ha1O/LptknPGdbPiOYTy+acH4asos7D8LCVAdzM4aqRFc0A3
	J0N4Nldbm1fbPFrXkxSkXIKMhPTs0glHTHlLE4j7bZlLfDf3aF3SxJGY4MZ13/xTQBKj+6tqaAE
	n20ZGRgYFdQ1fbrFwPh9kixTuP0QdwXcRmDsHszPtXYQU3sa0CMucFhUwoZZ60wAH7WmQG94x
X-Received: by 2002:a05:6402:1ec9:b0:6b5:1056:cb7d with SMTP id
 4fb4d7f45d1cf-6b51056cf3cmr8934538a12.1.1793805253293; Wed, 04 Nov 2026
 07:14:13 -0800 (PST)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Nov 2026 07:14:10 -0800
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Nov 2026 08:59:22 -0600
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261101220224.1436242-10-dianders@chromium.org>
References: <20261101220224.1436242-1-dianders@chromium.org> <20261101220224.1436242-10-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 4 Nov 2026 07:14:10 -0800
X-Gm-Features: AclHuK8q32ivZzhO-lFGb67WnRAtUcaaYFEqbKx9Uqfw07KWfEsdfk6B_95tIQY
Message-ID: <CAFLszThcMXxh05R6NNq=oBYb1w=xB5iZhpBT4sG48+PLceHQtA@mail.gmail.com>
Subject: Re: [PATCH v3 09/15] libfdt: overlay: Prepare fragment path helper
 for reuse
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Saravana Kannan <saravanak@kernel.org>, Devicetree@vger.kernel.org, 
	Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Julius Werner <jwerner@chromium.org>, Brian Norris <briannorris@chromium.org>, 
	linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Simon Glass <sjg@chromium.org>
