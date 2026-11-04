Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793805259;
	b=Xtm9hOf742cLmShSVArTDOopapmPn7a/Vz1gHQodg4ZCE9blULuX07FhlBPh2KyKVzmG
	 r7pKVNOg9kYPuWwGgaLADXUpDyEC+9tLIYvJniRYVnV9RQzGPaN2gJ3ok6MgWdS3wuzLa
	 vKObN4/3ctCrwlxHeRB8TqFnXO0D0ItQuBmaMPPCPkl5L41VxkosGeFRdMIGXojAkLEFl
	 1m2aPZLEOZW6epP5inRO6KFZijZrBcmIo+zEJcz2FcQVHuPENJn+RwCu1vcMu7OmNz5DE
	 ipPVpXLz8Xn0DlsX9HbliweQF4ZYftoTGw1RoqfZjBj1ZRwXHKdC7xJVw8F7z+gwwSg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805259;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:MIME-Version:
	 In-Reply-To:References:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=7aJLzL4K+pL9DSZnNvSRgm/7gCEWAB9vQb5KSH1v41I=;
	b=WU1AJ4FWhJtAdvBCUb7d2GFRtpAxeSCzuEXdpg7Sg2dcJkYZwEqSyk0O6ENK/eWvKwwD
	 FjtUXqPxiiJemPxdFQ59mBgoRJ1qQHVQbP7mrQ/SRCAdpW9CASlhkcP/WacgvxcWVmyTo
	 QiLj3dIkcWDSyUrn6H9PrYz2Bwis8lHYgE1kXdyNXCUbLWeXfK06ewTdkU+X7RFqPMBEg
	 Y2bAitR+ykUdfZ+/RheKgMPbUdThEAkTA+kMVzWuJM/ZrN4M7uTyZolKgThx27Tudj29/
	 qa5i113hk8ThJ58WvRE1g6zHzFOHSmHjXCTkhRKoCi+/q6oF3MhBrMPJMqqN/TSs3Qw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=X4twjPvM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690A6606A33F
	for <Devicetree-compiler@vger.kernel.org>; Wed,  4 Nov 2026 15:14:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 690A6606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=X4twjPvM
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c3f04e0e65fso120858666b.2
        for <Devicetree-compiler@vger.kernel.org>; Wed, 04 Nov 2026 07:14:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793805258; cv=none;
        d=google.com; s=arc-20260327;
        b=Uyy9GlRxmqohugfOzkCY+9UPU56RyXO30Mk0aY8EhYpqEo3jSjIBBBXRuzgJHwD0DT
         CFNt3jxZbmr5gs8m4B4+StARpf+A4zTG/Ig2fOoK+d6hn9yfr7gqxSvx616cX+LSgvUA
         qmgaMvpllo137Img//UfDb3ayK+W+EXBrVk+qNNUQiI/XYoIjtk5PdrxS0E+P8rYjfgp
         luJX4TKe0BcA30foRIM+qZMzOHvDwpl40cY0CemRjIM+yptJEbGyLTSCOxzUvUECe/kn
         8/olDG0KLkrtvX53aelcSp29Hubyz8MvjcZfiYsn51IaLPM7rp0UUhZuOZXij1TQQyNK
         NIRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=7aJLzL4K+pL9DSZnNvSRgm/7gCEWAB9vQb5KSH1v41I=;
        fh=4BA7Iq9H0VSWaCP4Je+uW1rc04Fmu9gG6jldUSQQ6Y0=;
        b=XMZX+NIfJEBRt32o0moaU/ecQUgqEkHV99S6YQYJRUNTKj/MRAeDSOgJ1fMIL1RcaM
         VADfReXjC5i+IawWzqYTpi/yXKGT+EsUJ2lAnSYWTybQKJS0MvnDvI7QMSSNjpG3nPBP
         k3qDOUR6IhKzEhKLf7rY+ApQxb5Mr5mnaUkVftRRhaSZ/K/ysZ40KrOjubz8DXlmsu1a
         EyVWuqvwuaW5zbu30DanAVgAsyH7t7iy5aSPD7CHJ1EZiWhO8hPXVdfAnO4Ycgf9qZvK
         dlR2QXRywo1kyd0NOBjUVKJIIrJ4QGTvlAngrcFOynd4EEJZvmQikZTT6UrYC3RG6s6n
         zNFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793805258; x=1794410058; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7aJLzL4K+pL9DSZnNvSRgm/7gCEWAB9vQb5KSH1v41I=;
        b=X4twjPvMo8O+/BkdL3YgGabPuN9DltmynN2uPyL45WP8/lgf2q9RpSqkWE9pvDG4ok
         P8LqF8f8bCvdIWISi5N0eUisbGtKhcofr5PLsVtXmvdmh6jQtOdFx8I+WtBIyX8Eqosw
         LyjWDJaho3C9yNu6DyNHRkKyz/RUwX6KVM1p4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793805258; x=1794410058;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7aJLzL4K+pL9DSZnNvSRgm/7gCEWAB9vQb5KSH1v41I=;
        b=0q0OQS2lM13JuJND1HgTiwGbkltgKUwG3gi6i5ONgrueNQLVif/Io1037cGBI3OGGS
         2vy94a04eFx4rBhGr12axCCUAfyDaLtiPDSH5qrxGW5mv/nghd1U+T28KlxalaR3OFIj
         z7xehlrtugIg0XQBbsCnOW/dQ+GxAu5AW6GtNbAtr/BsP/K4I7laya3q+Y4Ftx+vRIOY
         bHzjSOlYBvHdoue9WN2M17rBve/65dkk4uShido74oysR4kQzo8AvAd+N8Lv5fMmbxJZ
         CpywEc8kIIY/08ljbdv1pXb+FK2OiY8qxGTv9+jkJ97/N94GVfsDZFMUhdFf+BHayjZR
         LdBA==
X-Gm-Message-State: APuU4Z9KjsPaiCjmd8bqVBA11S38p0mAgQXWj/34pSGKPmfdgJqRSJW/
	OwR8rJPoOjb/qtFZU4ejPiYqfa5JpLJEAjGk7uz3YBfFYuI0uW8g6rLXJiAONietmtuBhg/85gR
	B/VRb4dozr/Iw0GD7EH0Zy2f8LUeUu/TUAB2vZTp4
X-Gm-Gg: AYBFou02vVeVEEWki0ueNOK7pUPD6xBOe4WLkROQErvi8gi+8O/SSrTIhWGoT/fpIdi
	uYo0+rZ1oVchAJuX4i9sNa9JUY+4LXC72EZZ7Fx0dPcve+lTI2H4d8JlFbxjyD/i/zBjZdY52+i
	PGwfX1oZcU54z968EXmKPfno1gJSuV7JYmBuhPggw2r2RZdWK/grlirlNMvAhGoELxWfaC1thSI
	WVEmMA3L9UpR3l+ucnW2BAEHpryQJfsOsnCnOhzOXC/CsVTvI9VqWt/6bXOcqtavALdPc/fwyqz
	a4zxpki9Y+ZxbtGH8BwHD0tYWTRBxLaScOlLLLWQ8xTsKKpDpJemdbwyFijiB8Y9FEvWYcXsz3J
	9Kx/qQjOBuV7W57+ztqmhgRNlLEgkItqi17YQgtrsqqVTM+pEBLrOKJfSG9WtB11QKPu4Obk=
X-Received: by 2002:a17:906:c145:b0:c46:7ec3:fdfd with SMTP id
 a640c23a62f3a-c4ca7a1c3ccmr1586536466b.14.1793805257870; Wed, 04 Nov 2026
 07:14:17 -0800 (PST)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Nov 2026 07:14:16 -0800
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 3 Nov 2026 06:16:49 -0800
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261101220224.1436242-11-dianders@chromium.org>
References: <20261101220224.1436242-1-dianders@chromium.org> <20261101220224.1436242-11-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 4 Nov 2026 07:14:16 -0800
X-Gm-Features: AclHuK9ApV58fCR-2zSxW0lIXRwkMPc7QZYOG9hrN35s6jfXd6uS4NXmkfDPcWw
Message-ID: <CAFLszTi-3DOb3GxHdDW=kxBFWrynhnnrvXNdQLnkRnyWeSOkMA@mail.gmail.com>
Subject: Re: [PATCH v3 10/15] libfdt: overlay: Make fdto const in overlay_apply_node()
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

On 2026-11-01T22:01:07, Douglas Anderson <dianders@chromium.org> wrote:
> libfdt: overlay: Make fdto const in overlay_apply_node()
>
> `overlay_apply_node()` only reads from the overlay blob `@fdto` while
> merging properties and subnodes into `@fdt`. Mark `@fdto` as
> `const void *` so callers holding a `const void *fdto` pointer (such as
> the upcoming `/__local_fixups__` update logic) can call
> `overlay_apply_node()` without casting away `const`.
>
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
>  libfdt/fdt_overlay.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
