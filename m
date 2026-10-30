Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793364638;
	b=j5oMLj1XboxI5OabOfwO3Tpo+pjsZMOsGtcbBZMoGrFkAd860+jEqV/Ikb7NsvisTVnA
	 3v/M9irg9YW0WlVVOPPj06c9z3mQjDY6IFlbJ3j1io1NHGK08Fm6KN8Hsj16uNh8nIrvw
	 y65Qe8x30VP8LtK2IaOyNUjZT1zeJJ5oKvkIse/84U5yWYYo2XBA7mljN7jzCdXv8zZb1
	 yETZqhQBCwtQWah7RYft8+uiVbL9A72X7gdY1XV6BvsMwWsdF8si/9mMSwtmn4aXKQPpP
	 80g/yxFVCzeNh05pOpV0VnmJiExrIaN/SyWygalRMs4M6+PZxGJ1LXq3fuX4P10eRiw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364638;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:MIME-Version:
	 In-Reply-To:References:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=upMUJ0fHbuWdbhcc58kgwG4xc/y/+j+lYCouryGC2jg=;
	b=GDS86dtp9u8+imJ+52uiBQyUciTzHHhJ4ZpfBuoHFhOl1lI+aKCyIsknf+5FU2pOMaZQ
	 mrO81b+7H7OGftYrZhc0yZnFhlW2FcouK8gYRbL15Alrk9wqq+GlOuLWYSRJZJW0tMEuW
	 x26K/EKlvDU8/e1ZHXb91jlobPVaOhhObzYm84P+WBmknnGB0qfHI/Wh8UNqSs8Md3HKA
	 1EeV+yPbhIQg4gvCgnH4EXTWCNXVYIWQM8N/ZV0VMkD4IGDnfxssjtz1Qs+FOs8TT1y0r
	 Ur5Rhkq45jgLs7JocyS0RhX4W3MBnMNl8ojbOpRT/HZLXKgQUpybuvmC2woZJUtitMQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=CswuN4e4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E83560A2626
	for <Devicetree-compiler@vger.kernel.org>; Fri, 30 Oct 2026 12:50:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E83560A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=CswuN4e4
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b4b7dee316so630460a12.0
        for <Devicetree-compiler@vger.kernel.org>; Fri, 30 Oct 2026 05:50:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793364636; cv=none;
        d=google.com; s=arc-20260327;
        b=Gel++yFMpVR04T10JxfFnTEYSR0k2Q+sNA1qY9Nl4VCVPe+TiZclU28jecb0XRgDYX
         LeRvttApRJW1mHxT/HxOjwqfsLzF8tgHI/kTX8vwXulRP6DXeiLBUWNVLhAi9tbSL1Vy
         Kv0PjDuvALgDNI1lyAzaQhjz3cY40UZmb7h+hmNFfMOxsiFqVtDDURP4tjTnGSEX+18U
         7+jPKuXlgLsNTOfZmwNRarJSqkYbXe1OVv3x//GObjuCSk2AovftY4w0pS5Yuj6LpbH5
         gOVtKZxQplyZ8djQm95CWk9uhVuO0LwxEa7PI5WQwBpemVIcYAOvjwImExU0s5Mnb1lq
         XGtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=upMUJ0fHbuWdbhcc58kgwG4xc/y/+j+lYCouryGC2jg=;
        fh=v0GCJqyoWGhL0bL1BD0oUO+DkJ2nkPH0tE1OsgHyX7k=;
        b=pLzrmDOfU8D7YOc/6ZQdkM1CevOG8voE5S6Wc7GsZNKI7/kk+AUIi5ARV7/JsxnzNx
         v7lmvXHZR72mojDv0y5PfZb5oK/LWF/ppe8ulXB1Y4cVTgBBkMTd2h6+7egg78S7ir81
         TjwdmkFweQ8uS+nNWisU4f6eEnoR3TWVYz26Kx7lhzPmxW/krGX7rB9QYAvJtRrZAc/a
         oH3V/SUigMktQSxAgGaCuRZPISaFryLqPG1LtvKVaI/YfWrLrJo/IVJO/l8+XOpqBEk1
         Qsrlasd5UTMTMMLbx/RpbH14ukGvMOPNJVgkV7IZOpSASJ48SZZ2076lGnLQojkFLSqS
         9AXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793364636; x=1793969436; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=upMUJ0fHbuWdbhcc58kgwG4xc/y/+j+lYCouryGC2jg=;
        b=CswuN4e4SFhY65NI69nl0lKvSPx7/6/t+bfGIiMz6r7+Ht1mJaNA0sot1+MowGI1K0
         f0OXoZcyZlsSF4f+3xZTO/IuR6bFuNrCZa2OCCgDu2eoZ9D8khmOtRCgZ0Wp+bZTXThE
         C4Td8iq7wAYo5YfYC4XsMDwP/X/O9TLiduZmY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364636; x=1793969436;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=upMUJ0fHbuWdbhcc58kgwG4xc/y/+j+lYCouryGC2jg=;
        b=Mb4zlaSooCRGamCDvDDUANaZY/l5o+Xp2yfHRaT35heD7TwIIeHY7EKR9Fpo6qx9TS
         sVh6Me03Q9izH6mz06y77jE2k/1K9iITdqtpRNLipG83DcOiLfsfrYpjs1nsJoip5W36
         cGtSd9vton0WM76SyJKWxZ7ACVvbEOVwJbTP5XxCqbPFHzu72J55icNa2dD9RIqNogSe
         SiiH8nkDfus/REHbmiC1Xr2ZUMIwqR3evRMEqNISnpKkOjxxflwFwLuBz4A9QIv0IzFF
         u8k72zk8tsv3sTo95crLHDHlvSAcZad/vnRHKTQu2ZCKf1f6yecRrtipQ04TNsYKvOCr
         ln0w==
X-Gm-Message-State: AFq9FYK+qMpzkJjdd6XprpJ6F1GYvD+Z3qRiATOudfTupIH44ZJ8j0xJ
	O+lSjkI7mbVed6NYBc7VILICCEGIO6hAFS5AodfR7TJbFX4jAbcakzy78l5/HwOQldvmf8TmVnf
	tJT1Ffkh26viQNSG01XyRdaHUo/1eaoJpLgIEqouh
X-Gm-Gg: AYBFou348lf57WtGKWGSdwx9vbx7iadX8IMLVeH2Ej2Z/KDR40W2gIr0kAdoNZSltvG
	wCW2FV8zpJo5Z2vBU9J9wBLUGb4gwk8TTCO1DXB6MXTIvX7km0YLGUXcKSwznxynBoA7xunW76s
	/fnoOePFViiLqbLr0UmEvzTdxawpFGTdkZmHKraslzmQP5HEroldjTTsingM2p0CxfHTcgaqN8O
	WqembNezC75/di7Ev4J45N9PwBrUUxtHnanNmU28/+1V6e5S9SPxaK4g1DyKUDK5QRxtD2Y5uE6
	hr5Twj8aqS7y1mjKt7lho3A7UDvTBShYi9tu71HAT6XTuAx+iACXNa7+tqW0P+QNY8KIkvmONR3
	MnZRGIlQZLZwCskPZICW+7jXklhk/U5StZrBrZR4ugExH78ubXNxvIfV0mZlfT8TDr/e14Dte
X-Received: by 2002:a05:6402:c4d5:20b0:6aa:a040:cbd3 with SMTP id
 4fb4d7f45d1cf-6b4d337d51cmr1265781a12.3.1793364636473; Fri, 30 Oct 2026
 05:50:36 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 30 Oct 2026 05:50:35 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 29 Oct 2026 01:16:42 -0700
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261028215600.1713475-10-dianders@chromium.org>
References: <20261028215600.1713475-1-dianders@chromium.org> <20261028215600.1713475-10-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 30 Oct 2026 05:50:34 -0700
X-Gm-Features: AclHuK8Q6LSStP9w_jyKcuIwAnO4J0Fv84SaEEt_21aYQDW37VQYsqL6XDDTA-w
Message-ID: <CAFLszTgS0Bp9KncngS7Nw7A5dXroXywiDkoHfUtWpCEexecqPQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] fdtfactor: Support compressed DTB inputs and outputs
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
> fdtfactor: Support compressed DTB inputs and outputs
>
> Firmware and FIT image build pipelines frequently store device tree
> blobs compressed with LZ4, LZMA/XZ, or gzip (e.g., `.dtb.lz4`).
>
> Extend `fdtfactor` to detect compressed input blobs by magic bytes or
> file extension, transparently decompress them before factoring, and
> compress the resulting `.dtbo` and `base.dtb` outputs when appropriate:
>
> - Support `.lz4` (including legacy `-l` frames via the `lz4` CLI),
>   `.lzma`/`.xz` (via Python's `lzma` module, using `CHECK_CRC32` for XZ
>   compatibility with kernel/bootloader decompressors), and `.gz` (via
>   Python's `gzip` module).
> - Preserve the input compression format on generated `.dtbo` files and
>   compress `base.dtb` according to `--base-compression` (which defaults
>   to `auto`, auto-detecting from `--base-dtb`'s filename extension such
>   as `-b base.dtb.lz4`).
> - Report compressed size savings alongside uncompressed savings when
>   `-s`/`--stats` is specified.
>
> On the 47 Qualcomm SC7180 Trogdor Chromebook `.dtb.lz4` files,
> `fdtfactor -S` reduces total LZ4-compressed size from 1.71 MB to 213 KB
> (87.5% savings).
>
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
>  README.md            |  17 ++-
>  fdtfactor            | 312 +++++++++++++++++++++++++++++++++++++++++++++++----
>  tests/Makefile.tests |   5 +-
>  tests/run_tests.sh   |  77 ++++++++++++-
>  4 files changed, 379 insertions(+), 32 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
