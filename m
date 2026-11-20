Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795188518;
	b=WFpRuUcTFa7eMeDujMXyhP5xky5KuWop3R/8y9BKUsqNb2XHMezc6TIhLLz/0VAEKmJP
	 7PcNDEahILRBlj6zOLFJ3xxz/xYqVvxCwFgKkfigCCMwyQnBeys3naLAkIp0/jKRXlefr
	 3g788KehlQe0+5Ip12+OXfuKHwDii4ndpYoz72ioc03m/nJDRDr2/YgJX4hlueSwKE6iD
	 JDZ9Gd0t+F39Kh6JRiY1kXzowZj9/lV3dYjK2a1UNjTv02IV+L2V/lsyo/0amNkODiJka
	 yBvOdTBzg+UYyHZBBnlbxdo/RV1uxxWlvDE0wfM50vuVh41sJw5SdyWx8YO85XfwndA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795188518;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:MIME-Version:
	 In-Reply-To:References:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=E/o/DO2Od/0aki1gWxDvnFBe5Khj9rSd55fktQ951+0=;
	b=VAi97oXsakrZTLGMrWgqXLNBo4KoT+IamtmLaU4yALM2ZsmwckkIuCPGWNt8/VacKYHN
	 zXIa8s9hyyrkMSeVd9hudrqhoi8IbGKT52lbZkNJLQfBnOQMLPNueUADbxb/awb3URJsP
	 Wwp1+d11ny1zzZf5SwLQh5ZhqCvS/s6Al63FCZ6WoKzZ+HW8tRmVE/uPAwG0f2AlxN7h1
	 +bFmhmfeNjkJ4fOmNoEzrsz5WUMY9hAggTJKjXxa4p0Eq3X33BD2f0ni1anyZJGlPBnxh
	 QZ/fzqz0M4ZGwA7lYxUHXR4q/9BuzcIJzxdT9O4njnVxb+qBxd2s4F9ugZP1YrJCZDg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=dpCi6kq4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3122D606A330
	for <Devicetree-compiler@vger.kernel.org>; Fri, 20 Nov 2026 15:28:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3122D606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=dpCi6kq4
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso1937799a91.0
        for <Devicetree-compiler@vger.kernel.org>; Fri, 20 Nov 2026 07:28:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795188517; cv=none;
        d=google.com; s=arc-20260327;
        b=GOaF5uJ7VYqxh1/kts8FfEugrRWIx+8emXW3q4OW6GjZ9mvD+Bjpzt7eSSUjPMCns5
         73beWdgo3zhDGHk+HevDz4CYoPSdgWQkkGy4gu0lSnbt9LRaMkiCX7om9zXp8JU5EMoG
         JDCUZwZY8n8f4EgGahOf/PRewyUDcglDZ2Ts0YPeVayFe0W03pCofy/OriSvIU8qDDI+
         nqgn/izjgbsmipgMprEYYNwNs2kzzMNhn5Hvypp8UBteVAGMPVay96Qu0TlkAPWaP3YP
         rNfCrSGqJqh22QipiQjAjJeEZvHs8ZNp6of+0dVL1qd+dHHPbM8eAjnJ1/0DoyQ9lOXV
         trJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=E/o/DO2Od/0aki1gWxDvnFBe5Khj9rSd55fktQ951+0=;
        fh=hgCycmTRN5MUyllYI/DZysF06+e1YJv60AR+HqulbV0=;
        b=b2iEFFomYepy4tiHXOWG4XvyQDB/cdNpxO1xXVLweLl6fmKdFXLhyE3DkMtYGrxr8a
         1MqTjDFyTl0F2gQCXChtxWkvuHNx2KXgNX1Amh8KMiVVmIKEl5EbfjXRAzl0cQu7ppZF
         qhsYK2mMzkIJa0z7QkWQwPQ+yP+hJ83IpB5+vj0D98TWuH/019LlkubYr6eYzGN+OowZ
         vQfYjQo4mX/2M43COkDwVONQcTiAlh0dbgWafhAnyWuLyWVEeyaLQQycbjm34fE6N1R9
         go98mgi0BGN8YxHGcFbE4XpLMrP6JN572rqiG9G/qQAovEqWV4McG+kHMOHteQKs5HtF
         +0HQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795188517; x=1795793317; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=E/o/DO2Od/0aki1gWxDvnFBe5Khj9rSd55fktQ951+0=;
        b=dpCi6kq4CDyvW1thHF5TaHWlZS/A8ljmB+P9fRGWV9YNiFE2znpfEOiQUBp6s2tzK5
         xJjAjM0Ly8IaXS3GAbQ9AIsDzXmUPUhQw5HNK8RQvfaAf7J6EGKIwQz21cNw41YgKm0g
         NuW4+IXdYQ85MXbzQbV8ZkJtuVhZXXvHnGiio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795188517; x=1795793317;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E/o/DO2Od/0aki1gWxDvnFBe5Khj9rSd55fktQ951+0=;
        b=w2ZtbMQOGNXtm1e/bouoeEbmTahG73/xB7atvSMY1UJg2PWVoe29enFRNAVkbsQSoW
         qdPm8WsI8wAv5mqv8cSFjEF6uYCbiV+eSfjl+vTqw0v50Y2eYi2UflaR2dwGe4p5omPI
         64W/TFGudAUPynLtUvqRBGN4NF1eBbzS9Ksa4SYLt44f5cDLor+LDZ+4bQ2+LuUEAlfu
         bXv9DtL989KjYxdJAd6Ov2o4mwBzhIOZk/7PwXincwheS8/GPgYVsfkLml6oMHJLmaNQ
         tRaGGxzF/MrvMVZy5cYHDsOVTSkg0cdn6K3VcyvbqFs5bVbyPtS5qHW4Yg0yO8Cj4ZLK
         VE1Q==
X-Gm-Message-State: APuU4Z/4hDgVJB9UBj66L4TZ6RXlKixOX7oe9Fg9+BFRtfuVb4lQ0oal
	6V5FHelgCp9Eh5OdjDa1hSAlKabUdA44PWI98ozaoR2D6aTAM/WpJ2eEVmrrcbNHz98ZcSxp/Rm
	iBCrJKXujJ88CqNVTLB5b9tJmpL51HuWgZdTECttM
X-Gm-Gg: AZFdTZc+Uvr4CT+N0yGBlsb4Hh2nlWOjvEuagd9eU5TdxsG0sALEBHN6AatraC6L2QA
	xOi27WtY7ocQ9CyDY+X/qGak1Ceh2u2riXtn/Mj25m1mG0IDnCMEW1GEDEi/1OOX9/2an+04JDU
	lIX46WlwCPWYM0yTxAP/AApeJcrwzw6Mzz5HThDo/RFx5UzDVXsqpIx7qKFGTP7ofVnvXAyvzLP
	3UwMqzMsO4ZqBgkxUyFGAMqiBTgpbtZo+7KI/X9LmzVeVvYaLWHQIvoWbr9Yy37IDyL6nUsLkXZ
	FvrjPZ9qAr/VjSqTBLyTYGYbikY7ATmV6EPDktBUxxOHyJu4+qoY+KWwtGX+24Rq0fX6eOlJnaM
	2mzESerKDMAAOFb3XTQSV0bXbcyeL6hhgPpj1natXlQPM8VHSQxabtP4aPxkwFV2Fts01PMw=
X-Received: by 2002:a17:90b:1d02:b0:3b0:9f78:4c18 with SMTP id
 98e67ed59e1d1-3b40a613683mr3653287a91.41.1795188517468; Fri, 20 Nov 2026
 07:28:37 -0800 (PST)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 20 Nov 2026 07:28:33 -0800
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 20 Nov 2026 07:28:25 -0800
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261116205320.1621386-10-dianders@chromium.org>
References: <20261116205320.1621386-1-dianders@chromium.org> <20261116205320.1621386-10-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 20 Nov 2026 07:28:33 -0800
X-Gm-Features: AclHuK-qPItHO7bqTa5oLj6xwjAWer8yBK3PhZJ5Dri-PQsIA-QqfOCBITlcfJM
Message-ID: <CAFLszTiAJz=qpc0vLFaS_rNBy2QRx27fi1=fzH=vU040f0ctbQ@mail.gmail.com>
Subject: Re: [PATCH v4 09/14] libfdt: overlay: Update base /__local_fixups__
 on apply
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Devicetree@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Saravana Kannan <saravanak@kernel.org>, David Gibson <david@gibson.dropbear.id.au>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Simon Glass <sjg@chromium.org>, linux-kernel@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Julius Werner <jwerner@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi Doug,

On 2026-11-16T20:52:57, Douglas Anderson <dianders@chromium.org> wrote:
> libfdt: overlay: Update base /__local_fixups__ on apply
>
> When a base device tree is compiled with `dtc -L` (`--local-fixups`), it
> contains a root `/__local_fixups__` node recording the byte offsets of
> all phandle references in its properties (for example, so an OS kernel
> can identify phandle cells at runtime, so a composite `.dtb` built by
> `fdtoverlay` such as Linux's `foo-dtbs := base.dtb bar.dtbo` retains
> complete phandle metadata for tools like `fdtfactor`, or so a merged
> tree matches what `dtc -L` produces).
>
> `fdt_overlay_apply()` updates the base tree's `/__symbols__` via
> `overlay_symbol_update()`, but leaves the base tree's
> `/__local_fixups__` untouched. As a result, applying an overlay to a
> base tree with `/__local_fixups__` leaves `/__local_fixups__` missing
> the phandle references introduced by the overlay (both from the
> overlay's `/__local_fixups__` and from its resolved `/__fixups__`), and
> leaves stale offsets if the overlay overwrites a base property that
> previously had phandle references.
>
> Add `overlay_local_fixups_update()`, controlled by a 3-state
> compile-time `FDT_OVERLAY_LOCAL_FIXUPS` setting in
> `libfdt/libfdt_internal.h`:
>
> - `0` (`FDT_OVERLAY_LOCAL_FIXUPS_IGNORE`): Leave `/__local_fixups__`
>   untouched. This is the `#ifndef` fallback in `libfdt_internal.h` so
>   that size-sensitive embedded environments (such as U-Boot SPL) that
>   vendor `libfdt` directly get zero code-size increase and no behavior
>   change unless they opt in.

The test suite passes for me with -Doverlay-local-fixups set to 0, 1 and 2.

One thing I'd like to check is the 'zero code-size increase' claim,
which no longer holds now that fdt_add_subnode_namelen() is split (see
below).

> [...]
>
>  Makefile                 |   6 +-
>  libfdt/fdt_overlay.c     | 525 ++++++++++++++++++++++++++++++++++++++++++++++-
>  libfdt/fdt_rw.c          |  37 +++-
>  libfdt/libfdt.h          |   7 +
>  libfdt/libfdt_internal.h |  23 +++
>  meson.build              |   5 +
>  meson_options.txt        |   2 +
>  tests/Makefile.tests     |   6 +-
>  tests/meson.build        |   1 +
>  tests/overlay.c          | 154 ++++++++++++++
>  tests/run_tests.sh       |  32 +++
>  11 files changed, 780 insertions(+), 18 deletions(-)

> diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
> @@ -405,9 +397,32 @@ int fdt_add_subnode_namelen(void *fdt, int parentoffset,
> +int fdt_add_subnode_namelen(void *fdt, int parentoffset,
> +			    const char *name, int namelen)
> +{
> +	char *namep;
> +	int offset;
> +
> +	FDT_RW_PROBE(fdt);
> +
> +	offset = fdt_subnode_offset_namelen(fdt, parentoffset, name, namelen);
> +	if (offset >= 0)
> +		return -FDT_ERR_EXISTS;
> +	else if (offset != -FDT_ERR_NOTFOUND)
> +		return offset;
> +
> +	offset = fdt_add_empty_subnode_(fdt, parentoffset, namelen, &namep);

Since fdt_add_empty_subnode_() is not static, every build pays for the
split, including IGNORE ones. With gcc -Os on x86-64 the text size of
fdt_rw.o goes from 4610 to 4743 bytes for me (I have not tried other
compilers or architectures).

Please can you either avoid the growth when FDT_OVERLAY_LOCAL_FIXUPS
is not UPDATE, or update the commit message and the comment in
libfdt_internal.h to give the real cost?

Regards,
Simon
