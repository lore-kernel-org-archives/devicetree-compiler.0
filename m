Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794620648;
	b=nzEWmjYFgn/315uX6POAzIHFqcAOzqRzjp08Lrxr1oDZGDAYbA11h9cReGqNbJiA+snD
	 raf2vqrurYc4fF/P6deYx4OK5Yhv2PAlm9q6v/TjR6BtLFfwZHAgLelGFWcKHkyybSVRH
	 GVqpQ3wwD8QrAws0I1koPH0WdwnnEVDjEIHiWotOaIkqRb8sM1Cdz7gDALIof5P9kt4KA
	 VwJ2PVh+Pu0mGUVNUV0YD6QhR4u5/3ac2ofeW+FTKl5ccsVFwBod0oHBDEXbPIc7sjTVw
	 M8CETwqHvOWEpm8EttvBAA0Jd/nOJokCndrr330Lunewi6uHb3TVJV47Nq1gz43ivsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794620648;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=MoQMMKruj6/n++Nk1VIZBaoDNnUVvF0yb6c2vnsNgHM=;
	b=QaXkJJebt1ya4j47pmKFj2GP14X0mABtZAB/Ola7BesangMMiUwWR74BRLwoHLA7ZuLx
	 y1/NKbdgtCDgN1mTFKEViAy0q9xvZQtLRUav7GSttIAIpYoHAnZ7QSXC0UX6EeHTfYrrg
	 rHqptfkExM1QzaNjC1MACd9d4X+PJe/oEfOdWaO7IwvHISg8IhQcrfsE4NPsz4jYU8lqj
	 CfcUxcVIciQhGeok3vE/8OM3CtGjAH8AVrqT80zNe9oLbNXY/DCh5/pvhExiWeKek+dPD
	 JACd/YSzhO33lUuA3Q3tCfzx2e5+ciJkAhDMVg6D8TFXYaLqBxE/Cec/R4sTNvqH1tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=gwrHna+q;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E2D60A2625
	for <Devicetree-compiler@vger.kernel.org>; Sat, 14 Nov 2026 01:44:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01E2D60A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=gwrHna+q
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c5083bc0e28so314850966b.0
        for <Devicetree-compiler@vger.kernel.org>; Fri, 13 Nov 2026 17:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794620646; x=1795225446; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MoQMMKruj6/n++Nk1VIZBaoDNnUVvF0yb6c2vnsNgHM=;
        b=gwrHna+qM3NkyFyDfQAX/Q0/clTV5uud67HgoZlq0QPq6SSFjoFTMPLU0zmHh7EIbb
         o2dQh6jFmkFLCBWH5CGnnQ8MR+6p+PMUh7N0Gcohzd2jPQITRzjND+JPsLDvYE1QvSmP
         mwDi2ZLUuJJbLZMQxponkvRaXP7hGH8cfnDHg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794620646; x=1795225446;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MoQMMKruj6/n++Nk1VIZBaoDNnUVvF0yb6c2vnsNgHM=;
        b=SErE/XkjXnQY+VBzT5bN7sErwq8vE6FQFp4B0yhWM8nrFAVp47qMjmUx7UTBnZsO4Y
         1N014iySpZaZTZwgV5TGtF63/VRc4UlXIPlsc4/8IRjMJcxlferUFlE30PM0Rct93s7q
         KSoTs9pRB/ZLUfzT4hzfNj1ceauBmUjOlBZQTGD01Mm9KdflIIiTEO7KpyCJr2gg/jOB
         n3esNP40Q5fADEif2ONXeO6RsyKuPmXdDkWs5vCcqWGEl6HaI2V+PBr5YvIMaQRaRVEP
         Ud2Fb5L1o4fFKIyq18kRJ8zxNKGDDmw0vxZ1z6e9sD3MvSG208/q0KHk4IPU0njZISXY
         3Wew==
X-Gm-Message-State: APuU4Z91hyrs27rrm5uiGXuteWBGjRl1W66ufYCysFekRplJJL6qvph9
	LFE3KVH+N9yaxdPeUStFQc3ooqOB11tNj/ocFt8MSYu4yTpyZwqnI2Ri0bak4y+J/yVUtoKRLjN
	OkJBgKvKe
X-Gm-Gg: AYBFou0VyBptiEKiU+zxEqaysZPMiDnLpPXUXJ392h2A9l61KCWMynCj0OVyq2Lx5Ur
	QuYF45zXcGQQT/2TSLBzobYwqAdSx2gzYC3L+9dxm29a5F26LfAWwIXAOz80VkIjprS55DcfUAJ
	5ug3/JYUmeb/UVj/fwsYHI8sy30Y1zDHGnkVA7MI/lmfzQIR6I8OOXxP3/Uc1KMD2hWZc9ERFdQ
	9YQmyywPTPLfLwLx857u7fbIhaE/FENgu7CENc4rHJnxAfunTVYznRvZTv6Ki7eEs9HVT3G58qk
	QwHCKB2lzFipneWHy+N3wPfTXISncupxnyURjdwx7NSVGmqoQByd9ZUfiJNZf6MQ1Qu7Z7C3UiV
	S+bIFfDKOyvsgktmdIZT8sQsqqyCW/IdpNmwFY3B2yJu74MuzN6EE2mkpD9Z9MCrcOoFjHG64D8
	7J3WJPsY/1BV7iXin9arHvkOG2K4JbNcBXTosjuslWvxYOiXYJ3HMMhrK4T0RPY9UiQO3zABvid
	a4UaAz8arvHtZC9NOCSspWuo83YYFVCth/nnDrCfhrbFop8/0Tdbl7HIOUB+NgS2Wm4FlYqy1bq
	/+ofzn1q6Sc7UAP0Sc/iv1rNERt+ntrfSuLQF92xtlJdEn8voI0nh2nDoMXVtmVpesjg
X-Received: by 2002:a17:907:968d:b0:c50:52b5:e17 with SMTP id a640c23a62f3a-c5096307645mr382693566b.13.1794620646303;
        Fri, 13 Nov 2026 17:44:06 -0800 (PST)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com. [209.85.221.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b23b09sm158460766b.26.2026.11.13.17.44.04
        for <Devicetree-compiler@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 17:44:04 -0800 (PST)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e09aa5264so727397f8f.2
        for <Devicetree-compiler@vger.kernel.org>; Fri, 13 Nov 2026 17:44:04 -0800 (PST)
X-Received: by 2002:a05:6000:2c02:b0:493:fdf6:14aa with SMTP id
 ffacd0b85a97d-49c74e22bd3mr9494147f8f.56.1794620643883; Fri, 13 Nov 2026
 17:44:03 -0800 (PST)
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015182221.2931742-1-dianders@chromium.org>
 <20261015182221.2931742-3-dianders@chromium.org> <at7cBFtlAQOFJ8jG@gractus.seuss>
 <CAD=FV=VqKkxC6-JaxGZOP_TRMwmq5axceT0xDZJhC2WMjxp2Aw@mail.gmail.com>
In-Reply-To: <CAD=FV=VqKkxC6-JaxGZOP_TRMwmq5axceT0xDZJhC2WMjxp2Aw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 13 Nov 2026 17:43:52 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XS6Ekjeb=a5kEqU7_Y5Bucw1D7H0UzbZfS=17qVth1Ag@mail.gmail.com>
X-Gm-Features: AclHuK_6lVpuSzYwB58kym1CDulRnl8LT1eNGamtTJcSG4OQySKnpGhD8T4I49M
Message-ID: <CAD=FV=XS6Ekjeb=a5kEqU7_Y5Bucw1D7H0UzbZfS=17qVth1Ag@mail.gmail.com>
Subject: Re: [PATCH 2/4] fdtfactor: Add tool to split DTBs into a base DTB and overlays
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

Hi

On Wed, Oct 28, 2026 at 2:57=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> > > +* **Multi-level overlays**: Support hierarchical overlay layers (for
> > > +  example, SoC base -> board family intermediate overlay -> SKU leaf
> > > +  overlay) when multiple boards share large sub-trees not present ac=
ross
> > > +  all boards.
> >
> > That sounds like a useful extension for the future.  An interim step
> > would be to extend to instead of taking a bunch of dtbs as input, take
> > a single (already generated) base dtb and a bunch of dtbos.  You'd
> > leave the given base alone, but find further common things between the
> > dtbs, in the context of that base.  The idea is you'd run fdtfactor
> > once on the raw dtbs, then run it again on a subset of the dtbos
> > emitted from the first pass to find further commonalities in that
> > subset.
>
> Improved the TODO to incorporate this.

So interesting story. Earlier today I responded to David's question in
my v3 about the arbitrary 50% overlap [1]. My current v4 draft makes
this a parameter. It made me think that this is exactly what we need
here for multi-level overlays.

Using the same 438-DTB Qualcomm `image.fit` I talked about in my
response earlier today [1], I ended up running several passes of
`fdtfactor` where I varied the overlap in each pass. Here are a few
notable numbers. I've also added in data with an experiment I did with
FDT_DECOMPOSE=3D1 (see the kernel Makefile) and fdtfactor (these are
gziped size of all dtbs):

* No fdtfactor, no FDT_DECOMPOSE: 9.27 MB
* No fdtfactor, yes FDT_DECOMPOSE: 6.94 MB
* Yes fdtfactor, no FDT_DECOMPOSE: 3.59 MB
* Yes fdtfactor, yes FDT_DECOMPOSE: 3.03 MB
* 5-pass fdtfactor, yes FDT_DECOMPOSE: 2.03 MB

Neat, huh? The 5-pass fdtfactor used the thresholds "[98, 92, 82, 68,
50]" for the 5 passes. NOTE that with the same 5 passes but _without_
FDT_DECOMPOSE, I still got to 2.06 MB, so nearly the same. Also note
that a 2-pass fdtfactor [85, 50] atop FDT_DECOMPOSE still ended up
with a respectable 2.39 MB.

For now, this is still future work that can be in the TODO, but I
don't think it would be hard to implement.


[1] https://lore.kernel.org/r/CAD=3DFV=3DWGTD8FtjPFE5mFSJP343Z9-2HNXHH3g4us=
qpWPVuwPUg@mail.gmail.com/
