Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792829855;
	b=ILtfm5eb9uKBnrncY8OXlaw2fKkjmlK9LrjPZ0ivadteXaneIIDMemM6W5aN+zbK0d3h
	 VcXyxnbQ3QWdXxCezSVAVswAQ4IgPWMiH6bC4UsCfGeSQ2gyGRXTD2Veti3/FcpUtccvJ
	 Pw0H/PQi18dthQUv89PEj2JIr5MIbxvNcgpWV2fHWL0tmJm0rkvIoh+1zt9TRc68S61fW
	 QYN+38u6OuNlNW4LXIolyjwduBHPsERC03OeOKJza2+0ACgUQCc1hIDH5BG6QNhtDDF2C
	 T6vLYKb54Nrjv9Ibtyo3Y5kZCdQVEWv5iF7TdJ7xFCHELV/AzQgO8INVJLpy85HhnIg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792829855;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:MIME-Version:
	 In-Reply-To:References:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=f/c+EwpzzrIdTL0a0bddGX7KBZ15+Zku2avwoxWG2Wk=;
	b=lkyvsjVAV+tBntxu2lNHvA6n6IkTcYhHWtAcSDfvLt1J99Rq2+qJy0s38oK6oGkN43Wc
	 noOAPOPdwsvfQr1oDmSlrypyuRa1Tx8cpvAZh34+J636OgbubrRZttEwQw22Zb5QDUxDC
	 HQ32CAgmFtdukT/dNYtVB90mxGBQzFCi9bRxAqKRZiVtuBrW/g4n48ArfNUOTf/mAtc57
	 m7rkTL74k9GUr44iCWgWi3HifD7Bk34V/40Lr7vXHpgE1dmEz6avK5oVOB5Edko5ny0MB
	 aiviffKikCzVAglszbUIYCzGN2UVQkovtKdRHA/jvXpgCyYgYWKrewWYL4zk5V20fZQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=k059ccS5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF19606A323
	for <Devicetree-compiler@vger.kernel.org>; Sat, 24 Oct 2026 08:17:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AF19606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=k059ccS5
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3acd21ba21aso1271088a91.1
        for <Devicetree-compiler@vger.kernel.org>; Sat, 24 Oct 2026 01:17:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792829854; cv=none;
        d=google.com; s=arc-20260327;
        b=lB5hk6b2urCoL8ZcwL6Jd4R1XwDh8aSY4iZafVa9ziAlnjbXBMdwDLuXxsmZEPuDbD
         GAfuWa6a3uUUEGHtz6/q9Vh8ib86PGzCbh2e9xvjeOxi7zoQR6g/XdYEqpgfl6YzoUQe
         lP/I5Zuof5v9QqfkZbkHPCLSoBP/egV7mKWofKxMdTAoMfsw4+Ln2Zl00QWw0TQ3heUy
         I74RXK3mVdsZQscqDoYl+9alTY90SmMdhMlAPUNZOk9a9vkmlRM6P5X/S6SwzMbuXbCv
         e2ypIj6+t+0PepGlsK4mpiHAJGy+nJ9/nhfvqdFtYvnQQwPhB5fDLS+mzOofDF7DeX0Y
         i8tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=f/c+EwpzzrIdTL0a0bddGX7KBZ15+Zku2avwoxWG2Wk=;
        fh=yBrpO4y4us2ZxwRWIavhbK0QfB+pVi11EBhFrlXRu8g=;
        b=QqkUoYnS/UC2gDQRNZyVOH2TCjpCH9a5mjoE6gdwDmIsiWwj/IIngx0GyssNHycx8Z
         1jq7SP2ufJyHOE54ioVV3YOBIfxU959eSDVz/+UwGhW8cLgOZ8Ow59J1wWbHLtsXws1Z
         kdDJNGl96W18N8bQImeoClJDH2yaMggT3Mx72dS7SV9pJtHpgw/6U4RmENebaLOgxlvb
         UdOdGWEM0xczRaNQRR5aEx8Zr0dQNT2RyyVPjb7i6IR6hgbRiqTykL7WdSuulheITPXK
         NaRdZkRxckJhSuTbNmuBKzRV45sosxltqg3ma1Yekm25MujPQR7y8U3sYn2hrmkodxsE
         8UbA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792829854; x=1793434654; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=f/c+EwpzzrIdTL0a0bddGX7KBZ15+Zku2avwoxWG2Wk=;
        b=k059ccS55T1YaNzStugk5ne3uFifaL4k2aSKrT12fShPJOVrNwIpZsTVvJguE9dBVX
         ygElTWkmgtdIXDyK+7PyNXPPrJ9Md9fuHPq/S6rSCxD0nkfAZFvNflsz/tXuQHDdBLHD
         xL65BHj8HVU1+f0FgiCizf5ZuSn5MRY7FWfjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792829854; x=1793434654;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=f/c+EwpzzrIdTL0a0bddGX7KBZ15+Zku2avwoxWG2Wk=;
        b=wve2UfSEvcuMUHMwAA/Sz9Lgdfv7c1maAr10byTh39gsiGQlXRAZLzb0HmpFmMj1E+
         1mbAKfma6apj1JGkOGF3o/6BgUwtAz0YINX9rsttyI1SSorCmK6hlzPmPMruZqY7PgKV
         8g6lkIFqSmRYcPoGNHcfPDJGYLHn4kTb3hEtDMntHinoFNacWA8hEWUW1GwX/JBT5iwv
         p3hdlrUFuLr/lmoNz8HgfyZtOc81d0B2cniZTzQTg4igf2K2APP3hht4jycUkfpmSPCm
         LoOUJzwW53YuZHGs3qbChlsXnMIsmOVXMRtt67dGdkisEj+QwINHxQkISmUlZHNFt1Rm
         KeEQ==
X-Gm-Message-State: AFq9FYKYPluHmsCPR2TD2LYEB1eDXBuMz7cZg0akixb4okP/RPOG+bhP
	p+1e/pO5SG0RpJADTYN4/WtvK09X2W8HSE1EuY/fWfM6AJJUM9QP9hUPTZBg/7mC/75hnHaOrii
	ncLqTKGTioCmM9RmDUlDhr03EeqFKldTdbaj5Sr5g
X-Gm-Gg: AYBFou2I0rvKs0E6Zp7PQ8XYuA9s7OHN0L0I+VlD9iDfsLJuXGapH7z4g3Rki3y4aXa
	9MuIdUM5zlZHUXOkJNv9WvNIxXMqgb6JmzPl7gh/5q1GwtT6Bd/JQ78uVJDQgL6UnBcgkZ7evh6
	d0AecGRLzxoqgT1WGB1CamWgWJDLJaDI1QHlrjO3B/O3FLwsgn22oj3zMcrJpxP5TmEBjhHQlKw
	Cl8s+iT3N4aSRy4nBGQINQIDHoDoPQ52psnteyVIlVSReyWbFrfgz7trOEhzDQIvGBFQrkuQTiI
	8+s5nmQr1HirihSNqAOh6sXc47fDJh9oMkBeIDxZ4yUr8q9kVK9w1m8wjm7KcsIWvcih36ElaAV
	GepgJjKzlZiYCTrjpy+IfhnNPTb2Quz+z51NH
X-Received: by 2002:a17:90b:1fc8:b0:3ad:c14:35ce with SMTP id
 98e67ed59e1d1-3adeb0f4b03mr1215366a91.64.1792829854594; Sat, 24 Oct 2026
 01:17:34 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:17:32 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:15:41 -0700
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261020083501.RFC.7.I1683fb18dd1cb29680af5efb2c2d3c3f539af0f4@changeid>
References: <20261020153652.2907186-1-dianders@chromium.org> <20261020083501.RFC.7.I1683fb18dd1cb29680af5efb2c2d3c3f539af0f4@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 24 Oct 2026 01:17:31 -0700
X-Gm-Features: AclHuK_RH6hRiswn7VkHcSfsxk2rWaTJ0grpI4PKmWKFGktw6V3bTGvWs-_Kz3M
Message-ID: <CAFLszTgz66uz4gU6deR_go028R6MhwYuB=Jb5RJ8hqtzb5j80Q@mail.gmail.com>
Subject: Re: [RFC PATCH 7/7] arm64: dts: qcom: sc7180: Add sc7180-trogdor.its
 FIT image script
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
	Bjorn Andersson <andersson@kernel.org>, cros-qcom-dts-watchers@chromium.org
Content-Type: text/plain; charset="UTF-8"

Hi Doug,

On 2026-10-20T15:35:18, Douglas Anderson <dianders@chromium.org> wrote:
> arm64: dts: qcom: sc7180: Add sc7180-trogdor.its FIT image script
>
> Add an Image Tree Source (`sc7180-trogdor.its`) describing the FIT
> image for SC7180 Trogdor family boards using `Image-framed.lz4` and
> LZ4-compressed board DTBs (`*.dtb.lz4`), allowing the Trogdor FIT image
> to be built with:

This says what the file is but not why it is wanted. Please can you
move a short version of your notes below the --- into the commit
message (matching what the ChromeOS scripts produce, a model for
future Chromebooks, helping people who run upstream kernels on
trogdor)?

>
>   make FIT_ITS=qcom/sc7180-trogdor.its image.fit
>
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.its | 728 ++++++++++++++++++++++++++++
>  1 file changed, 728 insertions(+)

> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.its b/arch/arm64/boot/dts/qcom/sc7180-trogdor.its
> @@ -0,0 +1,728 @@
> +	configurations {
> +		conf-1 {
> +			description = "sc7180-trogdor-coachz-r1-lte";
> +			kernel = "kernel-1";
> +			fdt = "fdt-1";
> +		};

One thing I'd like to check. Patch 4 says the main reason for a
checked-in .its is to have a hand-written description per
configuration, but here each description is just the DTB filename, the
compatible is filled in automatically, and patch 5 adds fdtfactor to
cmd_fit too. So as far as I can tell, the only thing this file gives
over 'make FIT_COMPRESSION=lz4 image.fit' is limiting the FIT to the
trogdor DTBs. In exchange there are 47 entries which must be updated
by hand whenever a trogdor board is added to or removed from
qcom/Makefile, and nothing checks this. The list matches the Makefile
today, but the two are likely to drift apart. Would a way to filter
the dtbs-list passed to make_fit.py (e.g. by a pattern such as
sc7180-trogdor-*) get you the same result without the duplication?
What do you think?

Regards,
Simon
