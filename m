Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793557453;
	b=r1MFLD5i+FCXVOpEbC17OHy4HFewua5+O6UYdyssTOTysprgXEvhFI9gJkM8xy8jKgSq
	 pw24yWo5wOHK3UTfIZa9MV9pJour8hX9kf/7TSUmiE1SkVz5wJ8T1UVsCJI+37YBgYYlh
	 KJLC3QYxfH4FbseKGZzMVrGKeHgH7ZgQ157dQhepJeeQrrnBL1+zA4Mr9+DLV+SLsEme6
	 6KuTPuF/cG7p+M6z4qah67lhbcJpyiXrVSOp6Jyq1bH/4YSvOk75D1cZGaJhM7sc4f8W3
	 uojJ0aAD0MwelvmybVN5rFls9798QJAXHngg9+atmvku2PMVkmQ57Zfq2wLzP8codTg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793557453;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=96teaYnUVw+qmSPZSQ9mv0mg9Xg+qcC3cxATHfuP4yI=;
	b=LmRhD8OeM++Gugyd8jSKJrngWfJuAIPibeT4J94qpRRW8ufmuDBLFwea9V+lS+mQUyZC
	 BgnwgLSR4iFDd2IZe/ZsTwcOVWSMBpDXMropBtVLCARbX0QL/bxVm/Vvokf7MEhRFTzGh
	 qFBRPtf16YKCaH9Rj2GoTbe/aa3tTfP5UD0lWsVxnbkMM6iurFKOjN7KVYjde5LhW5LSj
	 O3pSfNZB/43Z0oUFmSU/WjYgpruQQyeV8gf3bMzZ/ajCe9Z2PVPNBHRhYxy3yNq79TO1L
	 aCsXVFjlOS6v6xPdPnmlk+RofmmWu4e1t41u83Pn8u4Q15zv7+cV8mOij3BKeKswBfw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="Y/jkwSrG";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D22606A324
	for <devicetree-compiler@vger.kernel.org>; Sun,  1 Nov 2026 18:24:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8D22606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Y/jkwSrG
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b1ab2ad719so3176339a12.3
        for <devicetree-compiler@vger.kernel.org>; Sun, 01 Nov 2026 10:24:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793557451; cv=none;
        d=google.com; s=arc-20260327;
        b=BqiqUWlV3vCicOsn0yk/J7n/QyMDg4NYDTYUDLGZfHvItInEYqDPR9+lIavmxDVCm/
         9ek1i2BozFWsz33th9IkQFbFmESx+Tdisot+zy2Aj0iNCYmOqTcdv2OOzihPC9Izr3XN
         xSjYUIKT2qsPLXxFo69b16WKg4EofGCptkJ+ZSCRf/GuzIN+Xiop9JgtjJZ2ThWuJs3D
         TUhtx8T49ZM4i/gxlzd9iA8gAnxjRoZijUw0eXIq4JwQN0p1elueI3Ek84Fu5+b0A1Xp
         zYK4NfgRXB1XkKyN+SnwclOIkMSAsV69fSqBF/EMmVHYyrxeTXj3po9bedWH16Et7SIv
         5b+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=96teaYnUVw+qmSPZSQ9mv0mg9Xg+qcC3cxATHfuP4yI=;
        fh=UJKvz5sujBkyAc7b880zQBIzJZUekKWpRP952H9Zowg=;
        b=T5gpvLtC7VqTeu6pZjNhQErluxbAl9d+HKphq5KskTAXlfIb/yIwujiSD6hTRO+o1O
         gB9JA4jWKLlOldodzFIDwbGslOTFxOv8G65l7paUoBGIZSwtHK1nKdVW5V1zKf5mSCXa
         t0gPKwmU4aUmWXSkF8NxOxLs6mS+rUUJ7Z/YSIy4U0L2YHH/fQDZNZMtb765m4KasynH
         MN2c/3kSK6cEVA9NkDSg+y/ZAkQv9jhEPRUW72bPATm8+IJlBWyipTw6MVcSpnxw+O8u
         rMDii+/mA2h9oyeazVBS5d70fSmF+WUtHEjtg/6sL5w8GFJsSN1SvfU3L2GG/ddnsdRK
         3y5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793557451; x=1794162251; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=96teaYnUVw+qmSPZSQ9mv0mg9Xg+qcC3cxATHfuP4yI=;
        b=Y/jkwSrGAKtws03uL9ltO9d7ft9VnIvxnVkrRNeb8PJ2yf7GLQFDiF6ERt/xd8bWEz
         iqASGqH6e0hY9cAhDDBdKqgb47ots6YBlSWyS5LuMqUVw39KYZxWGTh3TVCvYO6SXjk4
         Mj8+vuEhI58rISGt6fgra9hkZTmEHpZt3IPe0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793557451; x=1794162251;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=96teaYnUVw+qmSPZSQ9mv0mg9Xg+qcC3cxATHfuP4yI=;
        b=i1wOcMOn0Ep3sWiNGrr3GihuRStVuXSH3uryEcrM0zNhiIlroO5/94L+l8peMT+l/c
         wfU4B7tiNEQXSSd/qf+qjOhza/WlaAj4oMXuuJe7bZ41thPcGBjIwmvuvAlRZ5ePXNZ1
         Oio/v278gwAEIKqStbCRHxxEYZMQMsxyjY/GN/0VUnHZjbJl+nSuC3Oia4Rzki8oJ3tk
         690qHFhCwZu3P7TZm81+39vGYAnUY62Nt5VWKZK2MAACT1m5qoITRuk2+M8s67DdM8y7
         RnEx4KwZloUo0w/249M5ybAnp1KsVeOE2u0eUPT69mrC5T6KQz8oLMYf4W1/tOYaeLrL
         TYAg==
X-Gm-Message-State: APuU4Z/Q4FJAmIw0CkRmKPX9IlXAdG6EE9i/WFElfb9bsQ5s00Yiw1+C
	0uXX2G5kCEhtUX22sI9xqLdqsHBVs2qWTuXlmm5Z/RDVsYRTw0AKWU7K5TD7aSpx6AcWmmfzQOs
	Rioag6B6jE7NXmxMS45dykuqYdLY40P9oMarLzpJM
X-Gm-Gg: AYBFou35kdy2h26uEt8sX5Pf3MY5IV37WWDPKhvpZedlfuArqrEtV1ohjgFgyxWCWdl
	9TbBDSXJ5PJheEa9VPsl7ohdY3Fi7ZmQ4FOZYwjYaqp3ffxRiX6H/nHDKTaXHWtxbyyWWzG1hn5
	H4EIJ46vqPx1/3KULJo/lHqsHZPSg56k0lcU4buLmdhQVbZTL667UvjfzGymCENQUQJbcdY5B9R
	CNUXII12KZOfcSgdc15CsXgf1RcSEJz3pY+54dXRng4eYWLQBm2TxDaoTID1UAfGaY9mR4v5H3r
	0xO5QZwyd0yCZKRpIVa+dVVO65xydR6lJodflZSLS90IUbrZ0K2Al4GNfusm5jD0vLcikI2Wa6w
	s0Q/CbshAa3TLwpL24Vc+m9RUSn9o2yViNlE0noUSnsCVzvnC+itXBKx0By4g6j0tdKl/HykUVw
	==
X-Received: by 2002:a05:6402:234c:b0:6ac:c618:8e76 with SMTP id
 4fb4d7f45d1cf-6b4d4d6dc82mr5633636a12.16.1793557451107; Sun, 01 Nov 2026
 10:24:11 -0800 (PST)
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260617204401.2275738-1-briannorris@chromium.org>
In-Reply-To: <20260617204401.2275738-1-briannorris@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Sun, 1 Nov 2026 18:23:55 +0000
X-Gm-Features: AclHuK-zr1eYGqGulQ_qMcit2Ag-Kv1e0QIiwl2oAtpgS2_NHl0XW2AvSCzFse0
Message-ID: <CAFLszTgWq0SaZdSjzQn8WKsD-i_KMS8DgQrL4L1SgfEP1y0V8A@mail.gmail.com>
Subject: Re: [PATCH] checks: Avoid warnings for reg override in __overlay__
To: Brian Norris <briannorris@chromium.org>
Cc: devicetree-compiler@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Brian,

On Wed, 17 Jun 2026 at 14:44, Brian Norris <briannorris@chromium.org> wrote:
>
> A simple overlay case can hit a number of false warnings just because it
> provides a 'reg' property [1]:
>
>  * avoid_default_addr_size: the generated fragment@0 node is an
>    artificial node, where #address-cells/#size-cells can't exist.
>
>  * reg_format: we're assuming the wrong/default #address-cells here, so
>    the analysis is wrong. (We don't know how many cells should be in
>    this 'reg', in isolation.)
>
>  * unit_address_vs_reg: we don't know the real node name here. (It's not
>    actually going to be "__overlay__".)
>
> All these cannot be checked by the overlay compiler in isolation.
> Suppress them when we identify we're running in plugin mode, and we're
> likely looking at a generated __overlay__ hierarchy that can't be
> analyzed in this way.
>
> [1]
> $ dtc -I dts -O dts tests/overlay-reg-override.dtso
> tests/overlay-reg-override.dtso:5.2-14: Warning (reg_format): /fragment@0/__overlay__:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
> tests/overlay-reg-override.dtso:4.6-6.3: Warning (unit_address_vs_reg): /fragment@0/__overlay__: node has a reg or ranges property, but no unit name
> <stdout>: Warning (pci_device_reg): Failed prerequisite 'reg_format'
> <stdout>: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
> <stdout>: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
> <stdout>: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
> <stdout>: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
> tests/overlay-reg-override.dtso:4.6-6.3: Warning (avoid_default_addr_size): /fragment@0/__overlay__: Relying on default #address-cells value
> tests/overlay-reg-override.dtso:4.6-6.3: Warning (avoid_default_addr_size): /fragment@0/__overlay__: Relying on default #size-cells value
> <stdout>: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
> <stdout>: Warning (unique_unit_address): Failed prerequisite 'avoid_default_addr_size'
> /dts-v1/;
>
> / {
>
>         fragment@0 {
>                 target = <&foo>;
>
>                 __overlay__ {
>                         reg = <0x00>;
>                 };
>         };
>
>         __fixups__ {
>                 foo = "/fragment@0:target:0";
>         };
> };
>
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
>  checks.c                        | 17 ++++++++++++++---
>  tests/overlay-reg-override.dtso |  6 ++++++
>  tests/run_tests.sh              |  1 +
>  3 files changed, 21 insertions(+), 3 deletions(-)
>  create mode 100644 tests/overlay-reg-override.dtso
>

[..]

I made an attempt to file a bug for this, at least.

https://github.com/dgibson/dtc/issues/198

Regards,
Simon
