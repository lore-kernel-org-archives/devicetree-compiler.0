Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795197102;
	b=mmgqP6yzlP5swcxnVoCFC+xJGr+J+LRoR+KL6dnGLU98PEXj9U4Rapz756Ka8AmfGru2
	 eSTzlXeXtdTphl5LtywsGB+VzqNfRhlO2JUSKQO5dDBpXtzGqn5QXiWQyZD+hHgzBYEOz
	 gY0e8SYufs9ub9plmiY9LQFeyqr3oRdfeM4n0dTE9jIV38vYwUKhVKn431BG9VCv1drYo
	 JIN5sqXHNHxj68Oem5LtuZGkVHh2MfJJbmgDUclncVqDqtTNL+cJHq24ZVEKIb5Zt2uVC
	 GayrtC/GOPXP4Qghxz3dX5ZjxL59MnA6n20TPpHWYYXv6hraCNv98X+4DsmQcUk3a+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795197102;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=kfWnuYyvEsTMkO5AVcaCTU5urGp2CGEcByvXShlC8zQ=;
	b=MW5Uxu9zPVA6mm9VHGnBxIsvb64KJLf4DWBJIv9UKSkY4gYgxwFiZWuwLwKJUA0m1/Lq
	 xIyZhaMghugEni6yycXxbyoOuVYtVk2+Q+lZBVAiCGEpuDI8n6X9DAz1PODU6+Pmiy+3g
	 jtyaHXFaF9sE15OQ5FtTLHARAXL1XvJRKdYhHwcroMT19gS1G864Bb6h0XKsBaa9Q2gRv
	 mRO8xqhi5sKjjY4qWj20aWVeK/WnmDnThphnLrgeX6eZlyBnb9EBb+QexqM+AshAXNXv8
	 Q/eEvW2pRbp0xVLtWkVxJfXEcKYdZraIB8yAO2gcz6eQ9npgFmLKjstKAQXybRufaUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=kkCY7P9V;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64041606A320
	for <Devicetree-compiler@vger.kernel.org>; Fri, 20 Nov 2026 17:51:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64041606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=kkCY7P9V
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b8a2518f7cso1436196a12.2
        for <Devicetree-compiler@vger.kernel.org>; Fri, 20 Nov 2026 09:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795197101; x=1795801901; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kfWnuYyvEsTMkO5AVcaCTU5urGp2CGEcByvXShlC8zQ=;
        b=kkCY7P9Vhgy74zTshyrEE3Fq30UcZeR/0tJRGz/TpL4SNg5akRsiJNI/3ob0zo96N3
         6K3/lqZURf0KTdk5jVHHp1eELE54329xx8l+EdhV08/fOGlB0RnGHEG12kW1EbTcx99Z
         +Q5TpLHPD4TkVXrs3xLFXk/e1WpsMqDqIzGII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795197101; x=1795801901;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kfWnuYyvEsTMkO5AVcaCTU5urGp2CGEcByvXShlC8zQ=;
        b=gqyUSmwozNyVkac8trStdgUtpAMQzo6omXSLohxDOjE+6q8V3OYc+SZtjwljNy67c2
         U+kSxFWI1EImeoT3LuUAT91SOFuzuAk2J8tzP/Q79zRdi23t56G7auphJcDNsEX55mD8
         HJAQ1nwGJs1u6lh+K6ZnF1jQiuNfmJOcxT/xaiqKjjD1i1DT10wrPZZ7UbsGi51ULlQJ
         zCMd1plTPeG56egf0/1Jg4vqxCo8pycPmBZpZyLsdjo2l8Y0E6MiRdH6aq/r4wia2OUq
         MOtupc+JKhW5BaHiYslw6oyNXXT8YFM93Xt7vKLy25iKL1nYQK1YzUgrc2fgzA4dqwLv
         ddFA==
X-Gm-Message-State: APuU4Z9NXkfAMeCa11eq2mfeXTpSmVNdwgiXraBpBMtwTzZLRg5+z+5s
	CMmjiv9xKsijddeGS3MwmQw1bSpEgw1vwK2Rh8Bhw9zTIpM7W2o9foTc2Wv9FQ9Z42FToFrimxx
	LZLhht4P4
X-Gm-Gg: AZFdTZctTa4c/ikl6/Mu9JPBh87FZp7D6mqmX6JQ6lZnnjOzD1Rov/aW/owV+joHfbj
	NwBPERuu7MSUOuwnfOCzz1E/VfOgWOVXxRziYRR+uu6GKUyiVVjhVleeiIUp2hxLKz3St2ik4dJ
	ayoXB3mm6gSRUZUKAuUE1JRjZaZvjESRK4e6Ie6ELUgO8G8UmjLt5Nsm2BEr1zD/IUEVZbUvjI4
	3gw0BFs4+3reDJBxq851H+37ZlUt0UYJzHeVEfWZK4XnLgaikg2vk4SKw0Esg0GMVYDSz7FCruz
	9wKFqBVeK6gbrSgHOa24wYb69t4OkOfT/OPgZTzfmKx01OZZlTL2+RXxM1EWRXUqeio/botdK6c
	D+gBq/MMphiFIhdO8ZyCB6d0QXKUcA5ZTsI85hRsy5KCMtRu6jXeg2UmWNVQNbfV25HhYe4sjHv
	4Y1xF4AWlXNcKPxW03IOc7g2xbFJJEQfbK8qaUC24WQcojVLYLQ/6VtGLqMZiDjW63nmkd0pLth
	7gdfSPuI3t1E/dtzAP49GBwmTvuwCagzFgWAZdg3ElocA/7VMMFMurMNgGFjQitB11KadwMfbgZ
	/TVOTGgkOI9D1G0GD+cv1ZB6mog47tsqedy7Ya+I7KoC//xOcSq0seDqFwHb7h401xCKud+5/oW
	FtVr0Kgs9oGvHdQ==
X-Received: by 2002:a05:6402:320f:b0:6b6:f7cf:8088 with SMTP id 4fb4d7f45d1cf-6ba37ea5715mr2818531a12.32.1795197100743;
        Fri, 20 Nov 2026 09:51:40 -0800 (PST)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com. [209.85.221.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba37108c8esm1459205a12.31.2026.11.20.09.51.38
        for <Devicetree-compiler@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 09:51:40 -0800 (PST)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4acb44dcd7bso699339f8f.0
        for <Devicetree-compiler@vger.kernel.org>; Fri, 20 Nov 2026 09:51:38 -0800 (PST)
X-Received: by 2002:a05:6000:4607:b0:48e:69ff:ba36 with SMTP id
 ffacd0b85a97d-4abb2fc3fcbmr7271207f8f.28.1795197097454; Fri, 20 Nov 2026
 09:51:37 -0800 (PST)
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116205320.1621386-1-dianders@chromium.org>
 <20261116205320.1621386-10-dianders@chromium.org> <CAFLszTiAJz=qpc0vLFaS_rNBy2QRx27fi1=fzH=vU040f0ctbQ@mail.gmail.com>
In-Reply-To: <CAFLszTiAJz=qpc0vLFaS_rNBy2QRx27fi1=fzH=vU040f0ctbQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 20 Nov 2026 09:51:26 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VWy3wJOFA1O4_S8WKZx5mVX7j3tYMkqdL=o0s3-3EOUA@mail.gmail.com>
X-Gm-Features: Aa3M54og9uNzW7OTwraRJ_B2FTsV1ta7iDBWw_xV6LJGkyirIXgcCMCsJjFCpNo
Message-ID: <CAD=FV=VWy3wJOFA1O4_S8WKZx5mVX7j3tYMkqdL=o0s3-3EOUA@mail.gmail.com>
Subject: Re: [PATCH v4 09/14] libfdt: overlay: Update base /__local_fixups__
 on apply
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Devicetree@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Saravana Kannan <saravanak@kernel.org>, David Gibson <david@gibson.dropbear.id.au>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-kernel@vger.kernel.org, Brian Norris <briannorris@chromium.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Julius Werner <jwerner@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi Simon,

On Fri, Nov 20, 2026 at 7:28 AM Simon Glass <sjg@chromium.org> wrote:
>
> The test suite passes for me with -Doverlay-local-fixups set to 0, 1 and 2.
>
> One thing I'd like to check is the 'zero code-size increase' claim,
> which no longer holds now that fdt_add_empty_subnode_() is split (see
> below).
>
> [...]
>
> > diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
> > @@ -405,9 +397,32 @@ int fdt_add_subnode_namelen(void *fdt, int parentoffset,
> > +int fdt_add_subnode_namelen(void *fdt, int parentoffset,
> > +    const char *name, int namelen)
> > +{
> > + char *namep;
> > + int offset;
> > +
> > + FDT_RW_PROBE(fdt);
> > +
> > + offset = fdt_subnode_offset_namelen(fdt, parentoffset, name, namelen);
> > + if (offset >= 0)
> > + return -FDT_ERR_EXISTS;
> > + else if (offset != -FDT_ERR_NOTFOUND)
> > + return offset;
> > +
> > + offset = fdt_add_empty_subnode_(fdt, parentoffset, namelen, &namep);
>
> Since fdt_add_empty_subnode_() is not static, every build pays for the
> split, including IGNORE ones. With gcc -Os on x86-64 the text size of
> fdt_rw.o goes from 4610 to 4743 bytes for me (I have not tried other
> compilers or architectures).
>
> Please can you either avoid the growth when FDT_OVERLAY_LOCAL_FIXUPS
> is not UPDATE, or update the commit message and the comment in
> libfdt_internal.h to give the real cost?

Ah, right -- `.text` itself grew by ~37 bytes from the out-of-line
split, and `size` also counts the second function's `.eh_frame` unwind
entry (plus `endbr64` with `-fcf-protection`).

For v5 I added a small `VISIBLE_IF_LOCAL_FIXUPS_UPDATE` macro in
`libfdt_internal.h` (modeled on Linux's `VISIBLE_IF_KUNIT`) so
`fdt_add_empty_subnode_()` is `static` when `FDT_OVERLAY_LOCAL_FIXUPS !=
FDT_OVERLAY_LOCAL_FIXUPS_UPDATE` and inlines back into
`fdt_add_subnode_namelen()` (+12 bytes of `.text` from register
scheduling on x86-64 `gcc -Os`, zero `.eh_frame` growth). I also
tempered the wording in `libfdt_internal.h` and the commit message from
"zero" to "negligible code-size impact".

-Doug
