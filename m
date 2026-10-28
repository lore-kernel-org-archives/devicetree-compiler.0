Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793224644;
	b=TMKl8cyjhoTiBmVUXP+4r5LNXpQhYWvbDgf2RlB7sr4Vwo+Mpk5FECChiIFec08W+wOd
	 2nMDwNrltmUK0PvgzQff9AosUrkO4pxNDYqSQpilkonyIiie1mHPiKptKC8BZWIP7LWUX
	 Cw4YRp1Dcu8riUrp3luhCljJ0Nr5PI5pqT1LiCpQOI6xXkcN4Q/sCeOuS48ZZDfh0aPbP
	 atRkBqdmvXhT2IsivBUepH9ATK9oLPU6EqpiGAmtYj1pzudqLsT0O4T3hwSdWAOGerdzD
	 BW07thmSQfuuDm+j1T/tTb7zrFFqvb3FKtaGz7n6IDVZykSW7EbwIbYVCV4zcrYm35A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793224644;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=07TvSjlSa6pD44ieWEKulZ7cEs4Mmh25/8EVSbg6l/E=;
	b=A8Pofjlw1xJKtRZDcbKGobwAHsiL0m+BHHDLc5aG6E8glNdJAhzS66SgjAin/Yy6XczG
	 Bv+i47J5YPXzocOzycvOmN/HPQZ8TTRq7N+C6qSb9s8rSc6FKoHl0Tdu0loeAbD5o68Wl
	 mQ0MeWo27iUqtgvWDrP8HgQEJw/vyQrVJaIa3dVhQI2qo3WHotLSZKblcUj4Afc52CTG/
	 5Y2GpUfwrIHlz9jXhuG9j7mN8DMmN5TQqIjdkTwH12ZWjTLUesRxMQCqFPen5VHuNx9KL
	 lzkB6dYQeizays6evvVNjzVJo1UmvttqYRHeFsu4hPqXKcuSkJsPahL6qD7TtTgXcHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=h5T+Kiva;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCAA606A31D
	for <Devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 21:57:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBCAA606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=h5T+Kiva
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c46822eefb6so190490766b.2
        for <Devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 14:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793224642; x=1793829442; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=07TvSjlSa6pD44ieWEKulZ7cEs4Mmh25/8EVSbg6l/E=;
        b=h5T+Kivajk660PyTRvPDoZaTKgFQxdsX+F3RtzA7fgBJl4dp3pcSbTOQ2tDO7hgTNW
         qQ0FksXJSA2iasMKbXMnIrxF5GTphgNd3FGx4QRJFF/Q5yomxowQuAzKIe82Cu9ccrWp
         si+GO9IJPN/EIsLgmhpFrMdPsC/ofXf5iaK70=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793224642; x=1793829442;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=07TvSjlSa6pD44ieWEKulZ7cEs4Mmh25/8EVSbg6l/E=;
        b=uegkJcKVurn4ohdm8JmqMRyg8KbKxzDXX6robVzXzAofBOYurpgGXCQZZeA711pSTe
         ogE+/zzIiiTM3MZCS95ve6h3i+MGSOvsFEJHgkcjC15KecHI9f/6yR7uVuTDCqde0k/+
         wqMYc5r5WRpz4XrtNUXn20gFUmLOEXSyhdaIxHk023Wh2mxs9lVoRoeTQHL8vg4ouzzH
         Ka86KLEVwRO8Mwp8H0jMCn/bsIczVZMrMhzmsyz505LsIZLFyWX9vP8t7215Xgm5W/in
         yD6UYBWkcDYHEnifbdyP6EBIhZU4NiF5geyaeyfjy+jbhoFuBsExC20tEuoW8uUN+1bs
         hHXg==
X-Gm-Message-State: AFq9FYKkCG0zx9n2g2Tr0LRJDmWHzAfucHg3DTNny8LSB+cIR/NXzRaD
	US3nc1P5D+KJTqbSVnLQwNUbv65T4T6wDzPBsWR/L1x3qSIWzHYn4dzK6ZNzSreaIg9Hq2zOdz+
	jivd3fcaN
X-Gm-Gg: AYBFou3VqZ3WA/mRZ+fWh/y8o6wS7st1U/vELb+++kwIv/4LrRu7bNnR3KYxJFnkf+B
	iJJ+ak/k0NNKdWxkhnrnBkyurW8OmQA/twbNNn+H7jALHaKmBsJ3Jf0Cw8sG5yALeiv7sGy8Key
	7Sg6pI+98ARHuRXIVlfU8e0G3oGpwYKGWQoMUD7boginfLbs3effB4pL7vGl7ruU5Ke0W7spI98
	ksXfUGzpGS5x2sypgUchiA0cref8l85LcY2v+SUHVMq6G13sHmbQC5HY/T+WZGvkgGgm4j+IGSI
	j2mEs93rOSM+DPNUPNzLUQ+YfNGbiSdnHkBLmYrYaUgp5fOltbEpNF4i0Gp2urPtMGocE7fYuud
	DYp2EJfCe2ueQY6B9vq1a8TBfXOEk+8qZ8V7zjmGe/qwh2ssjAbwWVdu3MI1gusf1meqGfRVL0r
	clB+2uo2ZcLx+/FSaayt2oNxG8N2HlHqU7/MZL+I2tCU30sEil2N5f2pFAiM98f6xYvX1C27fLP
	F4+RSzk9SOHl6C2qzvauJS8ni0cxT3maquBxPfa8l0YstgDI3F22JttwOxKaGrgyj11MMw7wDd8
	FE5os2vR21Wd0XTgFGlMo7dDcc+fuOmSHAPw1Jl9/ikCVb7vrOixH9iWpp5hfIS7/TIx
X-Received: by 2002:a17:907:d92:b0:c44:14d:d95d with SMTP id a640c23a62f3a-c49bdf5ad8dmr306521366b.23.1793224642241;
        Wed, 28 Oct 2026 14:57:22 -0700 (PDT)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com. [209.85.221.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd77e1e9sm659112866b.67.2026.10.28.14.57.21
        for <Devicetree-compiler@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 14:57:21 -0700 (PDT)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48c5358fc28so1218241f8f.0
        for <Devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 14:57:21 -0700 (PDT)
X-Received: by 2002:a05:6000:250a:b0:48d:ed98:2a55 with SMTP id
 ffacd0b85a97d-48e5d5995bemr7521102f8f.22.1793224640054; Wed, 28 Oct 2026
 14:57:20 -0700 (PDT)
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015182221.2931742-1-dianders@chromium.org> <atrnN0ICA41TU1B3@gractus.seuss>
In-Reply-To: <atrnN0ICA41TU1B3@gractus.seuss>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 28 Oct 2026 14:57:08 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XXp6rMfE0fwUOFHQ--eetjRu8N=L1pjZP71Lcu5n-yow@mail.gmail.com>
X-Gm-Features: AclHuK8NLTlui-V6h-KJogbMRPIZx2bj01wfY_NZiveWxCtCuxzAidtcDBdEMUQ
Message-ID: <CAD=FV=XXp6rMfE0fwUOFHQ--eetjRu8N=L1pjZP71Lcu5n-yow@mail.gmail.com>
Subject: Re: [PATCH 0/4] fdtfactor: Introduce fdtfactor to auto-factor overlays
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	linux-kernel@vger.kernel.org, Devicetree@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David,

On Thu, Oct 22, 2026 at 10:04=E2=80=AFPM David Gibson
<david@gibson.dropbear.id.au> wrote:
>
> On Thu, Oct 15, 2026 at 11:21:33AM -0700, Douglas Anderson wrote:
> >
> > Devicetree overlays allow you to have a "base" compiled devicetree and =
then
> > to apply an "overlay" to it to add or modify nodes. Devicetree overlays=
 have
> > at least two purposes:
> >
> > 1. Supporting add-on boards (like "hats" on a dev board). In this case =
the
> >    main board is described as a base devicetree and the add-on board is=
 an
> >    overlay. In this case there is a clear separation between the base a=
nd the
> >    add-on board and the base/overlay separation models reality nicely.
> >
> > 2. Supporting a "family" of similar boards in a space-efficient way. In
> >    upstream Linux, there are 47 distinct sc7180-trogdor boards supporte=
d.
> >    These board are all highly similar, but we compile (and ship) a sepa=
rate
> >    devicetree for each. Devicetree overlays can make this much more eff=
icient
> >    by factoring the common bits to the base devicetree and having each
> >    of the 47 boards represented by a small devicetree overlay.
> >
> > Up to this point, the usage of overlays in the upstream devicetree repo=
 has
> > mostly been for case #1.
>
> I don't think it invalidates the concept you're going for, but this
> description is a bit misleading without some historical context.  In
> particular this is a bit confused by the fact that there are both
> source-level (dts) overlays and binary-level (dtb) overlays.
>
> Source overlays came first, in conjuction with /include/ support in
> dtc, and were intended for use case (2) and similar.  A group of
> boards with the same SoC was the most common case, but families of
> similar boards and families of similar SoCs also used this mechanism.
> At the time this was still envisaging that a complete tree was built
> at boot time, and didn't change.
>
> This started to drift into use case (1) since without hotplug (we'll
> get to that), a board with different hats (or whatever) can be
> considered variants of the same base board.
>
> That still required the complete tree be built at compile time (or at
> least bootloader / kernel installation time).  That wasn't great for
> two reasons, roughly matching your two use cases:
>
>  1. Compile time is obviously no good for hotplugged hats.  Even for
>     coldplug hats, it's desirable to be able to complete the tree at
>     boot time rather than compile / deploy time.
>
>  2. Bootloaders often want to support a variety of related boards, not
>     just a single configuration.  That was already possible by
>     incorporating a full dtb for every variant, but it gets pretty
>     bulky and bootloaders are often pretty constrained.
>
> dtb overlays were invented to address these, though I don't know that
> difference between the two motivations was particularly well
> understood at the time.
>
> dtb overlays were pretty much a direct transcription of dts overlay
> semantics to dtb and runtime.  The use of "in band" encoding (special
> properties) is kind of inelegant, but it worked well enough to become
> popular.
>
> This works reasonably well for use case (2).  That makes sense: the
> semantics are based on dts overlays which were designed for use case
> (2).
>
> But, dtb overlays have always been a nasty hack for case (1), even
> though that's become the predominant one.  Overlays can change
> anywhere in the tree, whether or not that's physically sensible via
> the hat connector (or whatever).  The semantics of applying an overlay
> lose information (by design), which means that removing an overlay for
> hot unplug is a complete mess.  The way we encode the information
> necessary to apply an overlay is kind of messy and inconsistent.
>
> Still, they worked well enough for (1) that they've become widespread.
> Herv=C3=A9 Condina is now working on a new scheme (dubbed "addons") which
> is actually designed for case (1), and should suit it much better.
> It's a fair way off being ready for use, but it's a good development.

Interesting. I'd have never thought to call the "dts" vs. "dtsi" split
"overlays".

I'll try to reword this in the cover letter.


> > I've used this tool to reduce sc7180-trogdor device tree files (which
> > are stored lz4 compressed) from 1.71 MB to 213 KB, a 87.5% savings.
>
> Nice.  I suspect this gap would be substantially smaller with a large
> window compressor.  The trick here is that the factoring is finding
> long distance redundancies which lz4 won't be able to see.

FWIW, I don't think the large window compressor would have helped
here. Each .dtb file is compressed on its own, right? This means that
the bootloader doesn't need to read/decompress all of the devicetree
files--just the ones actually cares about.


> > I'll freely admit that the patches in this series were pretty heavily v=
ibe
> > coded. I'll not pretend that I have a deep understanding of the intraci=
cies
> > of how overlays are implemented. That being said:
> > * I've spent quite a bit of time reviewing the code from a high-level
> >   perspective: confirming that functions are well documented, well stru=
ctured,
> >   and make sense.
> > * I believe that what the tool is doing and how the tool is used make s=
ense.
> > * I have had quite a number of internal "the AI reviews the AI" rounds =
to
> >   the point of diminishing returns.
> > At this point, I'm not embarassed to put my name behind this. While I w=
on't
> > promise that there is zero cases of the AI doing something really stupi=
d,
> > I'd be willing to bet that the end result is better (and cleaner / bett=
er
> > structured) than what I would have coded up if I had spend a few weeks =
doing
> > this on my own.
>
> Thanks for that clear and helpful context.  My views on AI are
> complicated, leaning negative, but I do think it can be a useful tool
> and have no plans to reject patches purely because they're AI
> assisted.  A statement like that goes a long way to convincing me that
> I'm not about to waste my effort reviewing slop.  c.f. my rather
> unfriendly response[2] to a recent very sloppish bug report which
> vastly overestimated the impact of the bugs in question.

Sorry if it still wasn't super amazing. FWIW, it was definitely much
worse when I first started with it. :-P The quick prototype was done
in 30 minutes, but then I spent a big chunk of time trying to whip it
into something sensible. ...but obviously (as you found in reviewing
it) there were a bunch of things that looked reasonable to me but
weren't ideal. FWIW, there were at least some things that I simply
made the wrong choice on. I wasn't sure how much you would want
fdtfactor to stay out of the way of the rest of "dtc" (AKA keep my
changes self-contained) vs. actually improving / fixing the dtc source
base. I chose to stay out of the way in a few cases. That's changed in
v2 which makes fdtfactor smaller.

FWIW, I've attempted to get my AI to improve the later patches in the
series based on your feedback in the cover letter and patch #2.
Hopefully this makes things look better to you in v2...


> [2] https://lore.kernel.org/devicetree-compiler/as8RYmIp0pDCplpu@gractus.=
seuss/
>
> Understand that all dtc maintainership is unpaid volunteer time for
> me, so I'm less responsive about reviews than would be ideal.  I am
> gradually chiping away at the backlog, though.

I really appreciate the time you took on this. I've made it a priority
to go through all of your feedback and ensure everything is addressed.

I'm sure v2 won't be perfect, but hopefully it's a bunch better.



-Doug
