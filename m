Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792829825;
	b=O+zQIGPGQbS0gPCCt/deuW+KBSxfnrvAJ9GNbMRZH/fqmZ9HTKQlRUINsx0coJ/ejJvz
	 TMXnivWR/PuXsJC2r5Zn4s/BoL2yoYXmaMkAtFMsmKw2jOthe4C2mwGOtQOmU5DjbQylI
	 hrUy3UOuIPWai6WCDywJQMZdLsm8sXVWkPVtDGcPNY58GdXS5gKVfsO/mInwzsqL3gTDt
	 zitJAJSn+W9QB5TUO7IvKbe+v4EECjSWt2hnWFnbXetip+K0lSah0aEk3ZYTGFjGzKn2r
	 CLu8+WQkm20TF2H60U3Y4Xbki0TyDuN8SCEYsFJa7rdWmO9APlT0lwKCDl9rEt0hJSA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792829825;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:MIME-Version:
	 In-Reply-To:References:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=TLRJCFJ6/AvG5AtMUG4l8vJsoXlpkLFbV3r+kxPNexI=;
	b=DmFn7bIYq5B3+4IH2kG76V3UnHZBJyiGxluF/Rnj+UR4MNw3n5QAjLikxso9wZZupkJH
	 JnpavZ24pofPhWmDeSwWlADRQ4pqvS401GbvDVU+RSbK7AUYMQ3J5tp2p2+MLJeTIdC/X
	 TxSP7GbZY0OowFg/dNr0AUwe8yQoMxc4Fti5lDOp0TVkkvyotkfSaVa1+B7wdbZSEePb/
	 s1vrI/wVMiy8WA3IMfb57gmj3UAa6YvaIEsQBF7aJcj9bORFvkKW0faLtgRGIrwdRXeIO
	 StoigoU4d6hHXPw0sobPueBcH2xGdFrObgj44BaAiBH2ZF2MAdhWveRU7D4T1inMeAQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=W+U+I4vJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5452B606A32C
	for <Devicetree-compiler@vger.kernel.org>; Sat, 24 Oct 2026 08:17:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5452B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=W+U+I4vJ
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6afa651700eso2176829a12.2
        for <Devicetree-compiler@vger.kernel.org>; Sat, 24 Oct 2026 01:17:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792829824; cv=none;
        d=google.com; s=arc-20260327;
        b=iwmPyQPADcagqfzFZy0l2sJeojUIaZjrhSaINoUq99qikM7Pg0u3HwQeJp8R7qk8WY
         ObK6Hf/JjsvKss+w8iQGz5I63c1T84apN6R4+b7Yord9VsG4aGBBLP3dcsy38GIRwbgs
         Uj5RKCU7I48Z8veqbhtfvkuyVYFMPLjsEUdhzh5R2EthGzHdwivsaDLvTh9fBV7/N8nZ
         H0BLutaQrfpdrcQeeEGo0idQleBXPrnvxrbivgqDAPfr7FOAvQLZSPNFvpwMnYXxrwfA
         HNx3V0lMN/1iLz6FT79FZbt1vVgQ9FBey9I50JfwyJ7+HVetyQidFbVTB/P2YTOuVuse
         I+ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=TLRJCFJ6/AvG5AtMUG4l8vJsoXlpkLFbV3r+kxPNexI=;
        fh=2S8heCVlBcN1L/Prklu4EHW4prEk3qO28OF9EGAWJfE=;
        b=O8ArQdxFwjvAvKCW/P+tyKGfZWesgWkopQ4JaNjGoHZ6ovYic0ID+hmD6/7uOHpjcs
         rGBZxabBFm99q+af1xWjm1BNJZZpbzGzq2RX74VTnI9h1JE0Du8zUIZ6OHi/nONSxGfI
         kIZrUyUiLXPxvMb47sgobNUBWasO76rZCEbKpDcbq+zI0G5h52m5pFT8DBe0p6BcFA4Y
         FSf2Lc/iXlWtBox2qDch93VE1mdw3eosT7FzEjghYVbPWsFCdkEY9/GqROxTDdB4WpcF
         fQdkGPnWFrNeVhsxm8g0VfUGXJxMTOLXrct2HRMqhkYRN1IXSDUxF3Alt/rmqFOf+GtA
         F3Xg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792829824; x=1793434624; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TLRJCFJ6/AvG5AtMUG4l8vJsoXlpkLFbV3r+kxPNexI=;
        b=W+U+I4vJebkEFb5QNBPTCYwC9ApUfixleuac2ENZaWXkwOuFj6DuA3cnaW3c8yPds0
         tHi/WvTYjGDVefxbMVw1K5IsCkrCxG4VepnxhsGx9ZqGiq0iU8X6iCkgER//dJugJW3r
         0D51CHQEWQQOefESyNTnu/XmmwlHjQ+dwEs2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792829824; x=1793434624;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TLRJCFJ6/AvG5AtMUG4l8vJsoXlpkLFbV3r+kxPNexI=;
        b=qzjBTcvk/HR7D2DWlEITg56WT9F7uCr/otm3weapItk8g/lYhvHLyrRMMsCkeOgOw0
         xc4FZt047Q7BlfcSjgld8O6/culJoLIHGAiSDHdb4Qrryg0KGtXm6emWYOd+utXJCGRA
         VKjmOqXIv+qh4FaFxdYx2TWoWwKAg9nJV7y9k7W+aZsZdCzk7+TnSjUGpye+arXePNj2
         yxB5mPp+83Q8EXmLZ+vVO8J5r+Vt1KZKS4PSpJZuaB8h225GozpCpQtv0tKWUwaM0MGF
         yOVnY/1Qq6sPfEsf1jDMWlTxJiy3aP1w313mS6rspGaLLOj4X7eMbeqkIbF7BRJHyPXd
         fbWQ==
X-Gm-Message-State: AFq9FYIbI+8bry8vRPNBHG8Rg2vPSWYgt7GN/bMWYgQi9tvXXmznWjDV
	GfiXWueucAzZvInP9aHB6OXt6k0ciu18DPdkTM2u5DIRf+yDTXrcp2Pi5rPc9krE+9ryd/y9PUb
	iWAvWc2kLEmCPf65PMVTBvts/1IjkxluJLqXWuWyM
X-Gm-Gg: AYBFou2o1OvniTrvU44tdc8sXMqjpxyGBd120AOy0thdVhue0gMvumfsGcm25b7FPcU
	EWGhQ1SnQzurzayb6mUd6ReKy+tO4xeoij/EZTwXbVoLrKUiM2KlgB7ruXZN++srlqP/mYxqs8k
	qSyH5PYeYs9hP2XlnIxqORjipZVlZkyf7XEYhMJxFO5pTW8fcmLcuT/QvHVOeJ2Eb6EXOAaQSvY
	dMux8Qkq1k+aN6lWHMjyVS21pp7iQrSYnHM8bQT03CQhblSM7SfXDKXfVeEsCrVzhHNMhwFJYZM
	Kzrg0bh2K8I8P2LKpIgB12QsLVXLgBiy1Y1YHfgXRNvjhOmahKXdFr+/zd2UuwzdtDyOzlB+Di5
	JwuByYrWDh6L7i9whkRKPElzWsY+7k8sufgc=
X-Received: by 2002:a05:6402:1344:b0:6b1:d9fe:88e3 with SMTP id
 4fb4d7f45d1cf-6b442fe4a1dmr1113081a12.25.1792829823688; Sat, 24 Oct 2026
 01:17:03 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:17:02 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 00:46:32 -0700
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261020083501.RFC.3.I241638bd918efb045650102349d174cc3216468b@changeid>
References: <20261020153652.2907186-1-dianders@chromium.org> <20261020083501.RFC.3.I241638bd918efb045650102349d174cc3216468b@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 24 Oct 2026 01:17:02 -0700
X-Gm-Features: AclHuK-hmUOppF09H1eQU74y6c4oDjFc2inDxQbdayDVgWED5bCCmINGnHLl7Qo
Message-ID: <CAFLszTjATXFecK3ryfO=yVY=C9yt9nc52acFZvxfdu5kqGNvZg@mail.gmail.com>
Subject: Re: [RFC PATCH 3/7] scripts/dtc: Build fdtget and fdtput host tools
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

On 2026-10-20T15:35:18, Douglas Anderson <dianders@chromium.org> wrote:
> scripts/dtc: Build fdtget and fdtput host tools
>
> Build `fdtget` and `fdtput` alongside `dtc` and `fdtoverlay` when
> `CONFIG_DTC` is enabled so Kbuild rules can query and update properties
> in compiled device tree / FIT blobs.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
>  scripts/dtc/.gitignore | 2 ++
>  scripts/dtc/Makefile   | 6 ++++--
>  2 files changed, 6 insertions(+), 2 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
