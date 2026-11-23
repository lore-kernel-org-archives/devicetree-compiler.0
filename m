Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795460058;
	b=AcpbVpTA7H57vYCjqY2FbZu+81CSl5WvhmUAiBnfFmJgcjZc8dLFSDl+3mmIuj9e0yKh
	 ztTjSs2D/4tbUluMnWqTsFCqX8qH1ucmlzj3glx2a5CioUVCc+z1AOQVxfN7F4h3AfrAP
	 QMaY/cK0R9UXaQhxYEkwqzTYho8VTwkiJYnpwzer0vpkPhml4YxQQyAyaV5TeVYZRYnVt
	 ZgJqAa0KbJdlADWZjnT3KdCywNBPryH2OlcXAjcObVWpBKt4zrlzbypuknNrsSUWZzJTt
	 2MqiFX2U7gzqCK1vj0f5tubxhh/Y+LjOskvX6f+EW73tWbqsXAYzwhfgKrmq85AikTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795460058;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=two3aFUDlRe6ZZ4UONF4BB5RVIRGpbzjScEc7cSi1BQ=;
	b=3LEh6KqgE+Am1oO85xUvt39qRhcoKxwbvvyraXRHakdVpcLgvv7L9kKWpw+NLO3DjVPq
	 SPZLA6ELuosCwZqkEyN9aRQzpdM2x28nLBQC/AiUiZJNP1vdtXMq5A1JE12S/DagoE+Ir
	 jzOMadXqj5Gx+azkFL8xtP+eSSe7NcspIWO7TGFwIjGkM+StIZJ3FpraKIjJISLTu4sck
	 6To1r+CLVcwbl4WUINWACztSfBGuPQRl1eu8rN9hbOQyEi9XiWkvPz0YSKjIaHK31FhWu
	 tWlE0kbcFBM1tRNWlyReg0ngD89pQDKeWm553GANmmsDmTm8gO7VdvDkFVUxmzKSL6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Hq9VkCts;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453F4606A32E
	for <Devicetree-compiler@vger.kernel.org>; Mon, 23 Nov 2026 18:54:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 453F4606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Hq9VkCts
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b88b74e54eso4385857a12.0
        for <Devicetree-compiler@vger.kernel.org>; Mon, 23 Nov 2026 10:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795460057; x=1796064857; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=two3aFUDlRe6ZZ4UONF4BB5RVIRGpbzjScEc7cSi1BQ=;
        b=Hq9VkCtsJg0qZ46IiReeuci/h9nnPsHs/tHg2FrJcdjn+txaqCfD6xduWv9mqs0cUP
         b+16oSbSc85jK7PeHZucvr6lhIEMbF9lM6jIRyVGGOM3pKo9UHAU+zjNHGTLLE+fC5gl
         jgO4irTr0+J1un5DAaIB+wuvQOzD0N8KIipBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795460057; x=1796064857;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=two3aFUDlRe6ZZ4UONF4BB5RVIRGpbzjScEc7cSi1BQ=;
        b=nyPXos4X9qyoLzVVdNMjpY0vdcJKC2odBDGE3pirYEVN7fkmZsEMiCd3X2s/BcbGzf
         VaehtjjHSz51jDQ/xH9AITd2eVb7WmEIyAFWBfXbyWtTTFa/CvjG1jN1sudMTU+SpE++
         TwcrGOOgQQrSsveKLB3MSkOVqR9G2ZFBcLjJXHNcG/nFc8/mix5kCLnv89FnKE39UNXZ
         r7HLv8k5wa0axTxrf/21CpWDwIngWrxed3EX/99Mg2GSNA/M1/cXWjX64CqbH1r67NbB
         LmFnj/bDklrrAVQxHPzQ6TbmJeY3j7Vn6CnXp7+4hc/FPsjd6yJwzKGfD5mscDP5oXp5
         7XDg==
X-Gm-Message-State: APuU4Z9u6/Gm1QYvZPdAohMMekEizChl/CbC3ughw2zDwBAUyVGj2XgI
	18pwPfyQAGbB8dlYJfnq9OAM2ielxSAtHez77H2z1O/nZ8z0YuTSk/rFI7JTQiSWOmPfUB2Kmse
	PrTg3sw==
X-Gm-Gg: AZFdTZdaf4QnsF9RhTRrL8RDx1NbszDTLuqhqHmYDvmqhWim0elaA7yK6kLfhlMtbD2
	qJKItglgB/RRsahLYdQ3UdZOntdi72LZEf02w9ZtWKA/0s7KbOxFzCCZtMlPzYpYc9kWwGW6eZZ
	jiMAI60+kxoisRdaSBMeX6oL7DAsBMDIQRnziYbDLX71+OxSS2WmUYr6qdoxjKfIy2Z3ROVuba8
	tOYuno9vQ/nA5C2xSrswisrMV17XRNA9kZ+10Uc36ySeumoNlDBxMLEEFwRACLkYqgz0CQuMDC9
	n5urlcqAWPEVLvsD6IbasxrnBsBjVg4elCgc50Wc59+jwjCQdcyvQSSoYygE4VLnQ0w05N81lKs
	rsaGOXE43vMkM5Nj4rLn5SRW6M26mf84z9ToxYyL5ve/Hqs6SauUSnvAXnAUVSrljFr/3907q1c
	RKaabLr0695+RJUlcl1XwVjvKTNGBQ220ek5X8IewJLX+9o9Eje55m2H2/Ys9v7yHmoRq/DtyrV
	kvjIwb9Ye6xtQfwOU7wL+uc+hr1KGpSMF3lJ0M/0jBH6VRNTHbz4jYEw4DSXY5j3fZGV2sfKgo8
	tQHwDqsRUTdBUbVMTvbzafs46uAEXKe3saH+qEAQycY9V6svhn4ipuGC48oru6gcX+MK
X-Received: by 2002:a05:6402:1603:b0:6b9:f00b:6553 with SMTP id 4fb4d7f45d1cf-6ba37d6289cmr6408376a12.11.1795460056637;
        Mon, 23 Nov 2026 10:54:16 -0800 (PST)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com. [209.85.128.42])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cbeecsm5833868a12.6.2026.11.23.10.54.15
        for <Devicetree-compiler@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 10:54:15 -0800 (PST)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso35863945e9.3
        for <Devicetree-compiler@vger.kernel.org>; Mon, 23 Nov 2026 10:54:15 -0800 (PST)
X-Received: by 2002:a05:600d:8449:b0:4bb:8e95:8ce1 with SMTP id
 5b1f17b1804b1-4bb8e958ce4mr161086305e9.23.1795460054386; Mon, 23 Nov 2026
 10:54:14 -0800 (PST)
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
 <20261116205320.1621386-7-dianders@chromium.org> <avvOUIIn9t00XqY_@gractus.seuss>
 <CAD=FV=WAWUn4t8nyjyFP1if=i1ik1uQ4w=w=28i2MKPr=zsvXg@mail.gmail.com> <awOzcZqcrKwMjE7e@gractus.seuss>
In-Reply-To: <awOzcZqcrKwMjE7e@gractus.seuss>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 23 Nov 2026 10:54:02 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U9BRBp482ZNavG2SioZ3BqDx-qH5Qh13k50qMVdN-s9A@mail.gmail.com>
X-Gm-Features: Aa3M54q7_XT74h_vNqApIdx5UmvbqmG72OJ4vaE3NHyGaBbVB8eeNq9DNlLx3DU
Message-ID: <CAD=FV=U9BRBp482ZNavG2SioZ3BqDx-qH5Qh13k50qMVdN-s9A@mail.gmail.com>
Subject: Re: [PATCH v4 06/14] pylibfdt: Speed up FdtRo.properties() with a C helper
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Devicetree@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Saravana Kannan <saravanak@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Simon Glass <sjg@chromium.org>, linux-kernel@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Julius Werner <jwerner@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Nov 23, 2026 at 12:39=E2=80=AFAM David Gibson
<david@gibson.dropbear.id.au> wrote:
>
> On Tue, Nov 17, 2026 at 08:17:33AM -0800, Doug Anderson wrote:
> > Hi David,
> >
> > On Mon, Nov 16, 2026 at 7:47 PM David Gibson
> > <david@gibson.dropbear.id.au> wrote:
> > >
> > > > On one stress test (walking all ~573k nodes and ~2.06M properties a=
cross
> > > > 438 arm64 Qualcomm DTBs) this reduced `FdtRo.properties()` time by
> > > > ~1.8x.
> > >
> > > Hm, optimizing pylibfdt has never been a focus, on the general
> > > assumption that if speed is really important to you, you shouldn't be
> > > using Python.  I'm happy enough with patch 4, because it's a speed wi=
n
> > > with a very small and simple change.  This optimization is a much
> > > larger chunk of code, so I'm not so convinced this is worth the sourc=
e
> > > complexity we pay for it.
> > >
> > > That's not an outright rejection, but I'd need convincing this is
> > > worth it.
> >
> > Right, if we're trying to get the absolute maximum speed then of course
> > we wouldn't choose Python. For a tool like `fdtfactor`, speed is
> > certainly not the top priority and Python is the superior choice.
> > Writing it in C would have been a much bigger pain.
> >
> > That all being said, just because speed isn't the top priority doesn't
> > mean it doesn't matter at all. When I started looking at optimizations =
I
> > was seeing my 438-DTB run take ~25 seconds, which is just a bit too
> > much. With all the optimizations I ended up with ~12 seconds. That's
> > still a lot and it would be nice to make it even better, but it also
> > starts getting into the realm of acceptable.
> >
> > `FdtRo.properties()` stood out in profiling because
> > `DeviceTree.unflatten()` calls it on every node (~573k nodes / ~2.06M
> > properties across the 438 Qualcomm DTBs). In the pure-Python generator,
> > each node makes `1 + 2 * num_props` SWIG calls (~4.7M boundary
> > crossings, each going through Python `check_err` / `check_err_null`
> > wrappers and generator suspension/resumption) and allocates a fresh
> > non-interned `str` for repeated property names like `compatible`, `reg`=
,
> > `status`, and `phandle`.
> >
> > Below is a small standalone script (`bench_properties.py`) that builds =
a
> > 1,300-node (~140 KB) DTB in memory via `FdtSw` and walks it 400 times
> > (~520k nodes, ~2.08M properties) with patch 06/14 applied. On my
> > machine:
> > * Default `meson setup build` (`-O0`):
> >   - `FdtRo.properties()`: `2.52s -> 1.50s` (1.68x faster)
> >   - Full tree walk: `3.35s -> 2.25s` (1.49x faster)
> > * `meson setup --buildtype=3Drelease` (`-O3`):
> >   - `FdtRo.properties()`: `1.76s -> 0.98s` (1.81x faster)
> >   - Full tree walk: `2.24s -> 1.43s` (1.57x faster)
> >
> > On the source-complexity side, roughly half of
> > `fdt_node_properties_stub()` in v4 is repetitive `Py_DECREF`
> > error-cleanup boilerplate -- using `PyObject_CallFunction(prop_cls,
> > "Oy#", ...)` and a single `err:` label trims it from 55 lines down to
> > ~30 lines. That said, as noted in the patch notes, ~1 second on a
> > 400-DTB run isn't make-or-break, so if you'd still rather not carry the
> > C helper in `pylibfdt/libfdt.i` I'm totally fine dropping this patch in
> > v5 (or trimming it to the ~30-line version if that tips the
> > balance).
>
> Let's leave it out for this series.  I'm ok with revisiting this
> later.  Fwiw, gotos for error handling are generally acceptable (along
> the lines commonly used in the kernel, if that helps).

Sure. Dropped from my draft v5.

-Doug
