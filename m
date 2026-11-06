Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793986265;
	b=ft4HciFUsUPEbl5MdMHYWLG7DqBJRXFXBWbDB1oVgOJNIRCZkJpgOMN43JDUiQdLtmXE
	 zy9tbfEIlMGsJD01h7f+9lVaDRbQCiEDm4oe/zFdn+r43WwN7d1VCjYxN14KTH8L3n7M5
	 Lxi2Oban0bg4F8N+LDYCRAs8Pw0wk2D+KyIFiKphSKJKd7MydXrwki1yOsZ2ePIa/HOpF
	 XbzZc4oViOkPOiB4aPvYEnTgkSLnE27Z+OIrXkF7bHcaaul0cOxRsWhtrJtO7viJiAMdk
	 DtBSWV2f0aMTKh/LV4YJGWLRgq7MnOm6/R8vYazPnk0CSiKMUj5ykDdoULDSrNV8sPw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793986265;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=Dlij4MB2jpxjFq890zdDpep8GzNDPySWD3DE1z+Vw40=;
	b=XkNPo7dH4M+zwmI08Bl3f9x3IzC0Xdm1I6efsPitwBOEOgLcHZxWTKgYA5OOcJi482Em
	 T+RsfaDY1r/v9C58U5zBsltcf5o6+wHBvtreJRCgCJtzXX1K3vH5m4UvZcXBix63NgON7
	 ygpYaP3B0leJAb+gO7NQD2w999cp/mKIojOrypRr/9KE80jDCi/2dR6FTTk03AMGl8SHr
	 WoBFvGeMa6MY8NfMSe+S/m8i6SxHddLG8bZqrewpytggpo/vo5Vtb+fuoGZv72sPBh8bf
	 k+wUd/QN8sbmIwN6q8FnqztVeIuNqGV5lUrWdO/Og8wg1WXUVyXfBjTdop8Fb1V/qoA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Htkvznjq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC2C606A338
	for <devicetree-compiler@vger.kernel.org>; Fri,  6 Nov 2026 17:31:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFC2C606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Htkvznjq
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b5669a5100so1225234a12.1
        for <devicetree-compiler@vger.kernel.org>; Fri, 06 Nov 2026 09:31:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793986263; cv=none;
        d=google.com; s=arc-20260327;
        b=qaTp97MoxlGfJj7TC+DdR4JSBmoZLfLOZ3pcyVnql+jAgtr5i10JfX9nfvpS7vkmhG
         ubF3n0jbASf4rukpebeZG8c6oeO3KhfYVok9XgzlvQwZeKplqhWDhB73wFqyj9u7L6xf
         7qdIpTzhFMqPM09+dBRWjEj5xr+cTu/WKaQvOmbTlvBkAw8lPe83MI+ORdGD6FSvtZRe
         9nHJVDVx4JA5Lwy4fnmO92hy4v9NkSN9EGOkZ3oUSRvfXVaPx3RJg9Rrk+BNZFs0R8Yg
         6cKQipyGvZ5bEZehZd+5yNDAcCeytgqVdO7K8h2w2mW8ci3VLILaIYrdu6UAkB3VD28T
         6hFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Dlij4MB2jpxjFq890zdDpep8GzNDPySWD3DE1z+Vw40=;
        fh=6uVpMO1Rx509ITfjJ1m8/U1FB11n9fR9E3zQL6G+9pQ=;
        b=VPCdOH1+GoqOjLFDnHkCBSr7raqWTltrY8YhuG7NMlxrL7QCigzZKzlPT3GiDvFtHs
         eVeUHlfR7L0ZidDieDczmAAw/WZhKFGT2d7CIJ70fiNhHfzuFX8Xajtom9xYoogSkMCK
         oew2gpbdm5lwxEiq2hG3Eos3fdBpd1gLE6ActXI92RyO3996Abhu+i8MmjCbQhbgGgPM
         X/b4JUHNjlQbKAEfuvFlvBmAfqWot2QchNouIWsmoGltpAFGRu2ruYTAQGZVcFqBL7nd
         zLrgoZ1lB1cueucHKLN1wsALkVOiLzjNmmYM5Ta+5pubfChobppoBxjayKInPy9IUQr/
         rcAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793986263; x=1794591063; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dlij4MB2jpxjFq890zdDpep8GzNDPySWD3DE1z+Vw40=;
        b=HtkvznjqCCR9v8zZiw290oa5444wSr4/IMKa43x4QpfFR64OktbOgR+5XHE6vf9Yz2
         bBGzBHirKw71yB9M6gy5pVxIIHTOp/hLid7po4FZ+yUOUqhdJLjFLFNccWadl+4xsIC6
         S5d2HmZuSqGohDMhRgoxr4C7ccrzLYCguTA28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793986263; x=1794591063;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dlij4MB2jpxjFq890zdDpep8GzNDPySWD3DE1z+Vw40=;
        b=OjYRqpkdzkvF5YDBlw3DWzLfNzcoYJSMXIMfGGCaEr6VJYzcnHW89QBvK8I6lGcn/V
         rcz5srflDLaNtHhxH0zMjS25oXoTepDr/TBIVG0eDMu0xeWC2D8E6HSqnUIga3Mbqfat
         YleFXS89sdr1SszNdLk8aZA26vLsFShGXt8XJ/gIyhdQdH0f3W1eHe9mTzpNAlB/aEp4
         1uJ5JSjhOnVvecVbTL0kloZWZ4Oeeo7Keb7e1Pi7u3io4wHMXHXa0N9xr74orzrV8oCH
         /WjTsOCnKo228fzRJB89Zhc54iKA2HdbH4c6wwjDaP5XZ4ViEIlX7eEhiI2loyrH51Lr
         0idw==
X-Gm-Message-State: APuU4Z8vE+4UrPbKeVQKjD5HOzE0xnbUulGQ9T0fyqPCOXApdF1Mbrtv
	kjHdA98DUhPZmANVXG2IrDe30+lbTonEWAQhZbkr2seWvlXE1ut6A90xE83iKNcYCrXwDHlgoAL
	Ncv5SqLY2hozm6/pUvuA123wuzvb4Fb+8ffJKUrGR
X-Gm-Gg: AYBFou1GHoBqIEXfFyJf/p22ObL0iyCjpdA2uEO2imabOlfP2TY0WZAeChflY4XxNLv
	IYhwQgeIPf0ESG77mCizh97XEgWcKj+IsD1z5IOiCDaW36faL3hUv/musTZb7xhBkFOqEjIbGvu
	yRxfnksKve5lXI/bw3DAWtWx70PzhQWxxdqq+MYMLpG/49XKhPK5EpQXuGd3P43Q0a4MeTjiygc
	Jdu+DvC8371Xc+/bYT8fZHn+rQ1jXwB+1o6u9jhAOsoBVrnq6hMPestZzxU9owdt6gLHfD+PsF2
	/AzctMKwKEdBqj0HjYnw6HrHfOlgE+Z3VC+X7tO7aVS/6pMPLPFFSv0lZGq6A2M1aEpwMnNIrq5
	DZGRpay0+ZLaGmv2/ON429h4LpoZyPJ8ua92cTInaVQICwBuaaOa+h5o9xtuFjEtNmIryR9W6
X-Received: by 2002:a05:6402:27cb:b0:6b1:eeca:87c1 with SMTP id
 4fb4d7f45d1cf-6b597824952mr2391816a12.21.1793986263219; Fri, 06 Nov 2026
 09:31:03 -0800 (PST)
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104211807.972610-1-sjg@chromium.org> <20261104211807.972610-8-sjg@chromium.org>
 <20261105100714.47bf0434@bootlin.com> <CAFLszTg4tSr7+zJb35efy12TfMWiXc8xujcceL_H+_eGzqW-5g@mail.gmail.com>
 <20261106075641.0fd421ab@bootlin.com> <CAFLszTh4do1Yf0FF7LH3OpF7aOpKXpNN_fHjm0_VOY+7yLN8nQ@mail.gmail.com>
 <20261106165504.43b35ba2@bootlin.com>
In-Reply-To: <20261106165504.43b35ba2@bootlin.com>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 6 Nov 2026 10:30:51 -0700
X-Gm-Features: AclHuK_AQwXiGamrgyXCqBXdZsj0XAKnrvOUy_vuj4P1-_TILAFRU9SFJBtcUHg
Message-ID: <CAFLszTiDaUSsG4FivB-HhZjXeH0wj+e7g59uWhBoaCUaQJrAmg@mail.gmail.com>
Subject: Re: [PATCH v2 07/15] dtc: Move label-reference handling out of the grammar
To: Herve Codina <herve.codina@bootlin.com>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>, 
	David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Herve,

On Fri, 6 Nov 2026 at 08:55, Herve Codina <herve.codina@bootlin.com> wrote:
>
> Hi Simon,
>
> On Fri, 6 Nov 2026 06:05:52 -0700
> Simon Glass <sjg@chromium.org> wrote:
>
> ...
>
> >
> > It's only very minor. For example:
> >
> > /plugin/;
> > &foo { mine: x { a; }; };
> > / { bar { }; };
> > &mine { b; };
> > &foo { c; };
> >
> > This series will have bar between fragment@0 and fragment@1, but with
> > this change it comes before both fragments. I think that is fine to do
> > that, just that to my mind it fits better with step 2b of David=E2=80=
=99s
> > plan, where each fragment is wrapped in fragment@N after the merge.
> > There are a couple of other corner cases too, which I'm looking at.
>
> I suppose fragment@0 and fragment@1 are the overlay output dts. If so, ye=
s,
> I think also it is fine.

OK good

>
> Still need to be acked by David.
>
> Otherwise the solution could be to have only fragments after parsing (the
> root node is a fragment).
>
> merge_fragments() merge fragments in previous one.
>
> The fragment list in dt_info contains orphans + the root node.
> The fragments order shouldn't be modified in that case.
>
> Then overlay_convert_output_format() will have to deal with that.
>
> Anyway, I don't think that adding this complexity is necessary to handle
> this "bar in middle" use case.
>
> In the end, nodes are not supposed to be ordered. Anything depending on
> node ordering is not correct.

Agreed it doesn't seem worth it. Ordering isn't in the spec, after
all. Also, none of the Linux files show any difference with this
change.

>
> IHMO, internal fragments are obviously in an ordered list (same order as
> input file) but nodes in the output file don't have any order requirement=
s
> except if '--sort' option is used but it should be already ok if you perf=
orm
> the sort after the overlay_convert_output_format() call.

Yes. From the point of view of humans I think it is nice to keep the
order stable if we can, so the source code matches the dtb output. Of
course this doesn't really apply when you are talking about overlays
and fragments.

>
> >
> > Anyway I've got a patch for your change and I'd like to put it at the
> > end of the v3 series, since I am trying to move code largely unchanged
> > out of the parser, avoiding behaviour changes as much as possible in
> > this series. Does that sound OK?
>
> No problem. Having it at the end of the series is ok on my side.

OK I'll do that. I probably should have split the series after the v1
feedback, but I'll send v3 as a monolithic series and we'll see how we
go.

Regards,
Simon
