Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793383059;
	b=M427MvCXAtJcA2ebnce0opM3nMq1/sM+qnJq3E8LQRrPspGfbgYx2AdcBqNZwaAjJEdh
	 H9o4YXAEx8YrABNbL4+zcB7z1apYds0yivsWReS4oU0yEuREsoMElcFLPSHD8j+UYX3tm
	 kRFIyfzx6KI+8Xv1fl50ioPFJewGWGIvWMXt9RRTU16GA50DQQrIG+dcV/x5mznjwx7nY
	 WYHBEhaxTPQYhaM7quAhDZLICJV1kWYuNVzwTLtRUtbWuk1LL/VLpVMYUtZXCfbXJ0bd/
	 90ekqXAvruQKaT5AsEcN/4lAa2P2qG8IphBJcdZ+ba+LKNDxEMGCBzo0xdOK0JBsysw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793383059;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=5xW8+9GwRkkDymGKlTSxdD6HQA3l4qwY0F4/6VRy06w=;
	b=ddAr0wDDZtu6Rl8q3ntINi4Wgyi81ugAl0q75Blx1M7rytw2oRNiUybo3kVZLaiQuUxs
	 77FUR/S7I6GDddKrB5xQ6Dsna/i5qrLA//s9GUgm8G2Pu+WxNBmF1hdCRX0WMMfaygRDo
	 56BWU7ANcMcyjZTK3MowSf6df2j+ehzxGSFzhuQbcHu9CIN/B/ujyBtWgFIbVnVzbPwEo
	 b/2JR9XQ1bloSxwUH5nFuiphTLbvo3pOYRdiQqUxLtH5ICvNpfLtZobxepQ9ZrjQ2CcKl
	 zErxV2Yn3vVOErOxa+U/1EWtU7FgcpGGpZRsSSo7xDW2aGDeFNmutODyC5hsjscunyA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=fvPyA4Sz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E363E606A333
	for <devicetree-compiler@vger.kernel.org>; Fri, 30 Oct 2026 17:57:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E363E606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=fvPyA4Sz
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b4e814214aso664047a12.3
        for <devicetree-compiler@vger.kernel.org>; Fri, 30 Oct 2026 10:57:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793383057; cv=none;
        d=google.com; s=arc-20260327;
        b=H7rg8mMTzx8h+dDnY0eVgnznWDU8I3L4VydS96hqDb7TFeOcYKJH/UQiDKdo6Tdesg
         0iZX3E+4g24zLoj8zAVFQLLBkv0OFQzLcL0cWAuwlmg3/nqiAmJxEGjCO+aw7iwhjG0f
         FB++GP2RDZlDQB1j0NZ2omQhMExfwwiY5uVZ3hXGHGLJw8oL4EBh6+A9Z2uZhK/QP553
         VYjyR1Ii91X0KTmIXKu629oO7cKuxTqNJ7UaqHGlEg5pJWLgyzdnw2I0Xdz81q0FQVrX
         QZK72lHe8nq79I+EvRIbljoGmGC7QujfNuxPQ8NEhS1Ou2ngz+qRSCw6YV5YPyWNk7DI
         1CYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5xW8+9GwRkkDymGKlTSxdD6HQA3l4qwY0F4/6VRy06w=;
        fh=arriF4o2yiPrGChz08bUEljpL7XipURYD/zzcu+j4ug=;
        b=apqN3MzbctWzMHJKznYIddCrZbMhR1aSkA38LtjnS3eLXFUGqNXSkTUZ6wv+Sn6L4/
         6zeq8/zYBP/NJ1st6RLmeHO4rNZ1aI2TCHEeMuva4ry7ijnaPiujJZg5fwE3W8oDa57e
         7CiC44A+m7dwGoPx1ObKquvfs7MZYw9qKaO/4JOWtRhUxTQhW2P1rf70h9DkocRpiVTb
         UQWOO3x5cee3f3laFKP7Ji+VDNouqXwh/zodLtw3i0tT0zcINq7Rq4E6nqjqVyLd7K0Q
         rboujPcMw77j+Fi2nS4R+d2JZlw1JVDvdwqrKP1aQDUBTRAVvRtZ8Ks0VD+nLqzwLBHM
         eKzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793383057; x=1793987857; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5xW8+9GwRkkDymGKlTSxdD6HQA3l4qwY0F4/6VRy06w=;
        b=fvPyA4Szn3huAhPYDu/0t95U/f2j+Mgky2u25yGP2y2dUlzuzjeV7c+KMZxreh55A1
         cRReph+h7AgaLUnvA+EEIDqympKjDO7awzvoE6Af4LR3ceH6SFicBNYMdDsMHzO9KGzi
         kjIZhRKi9uhsH4oILKmmxwfPr7esYgs46No+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793383057; x=1793987857;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5xW8+9GwRkkDymGKlTSxdD6HQA3l4qwY0F4/6VRy06w=;
        b=kSCbfLmM+cenafNfmlfpgLa6TYELL8KbiL8F8TQVqCiPb/r5BliP26hYnY5mk9Hcsd
         86tEyJkVnBKsnYLuQSTz3cOIrIyuaL252pW+rRFTduA28mRsmEXX6OMMu3/1E7578hf8
         hWSw6X2qGoCytmXX6ITsdLgIVXKEkK3NTauKgtd0NY7rXVEhcmZyZt6wwakkDrA/lsrv
         GDF8mnalsBmAAml82w7AJujkjBg1zQE5RO9GE3kmvdVYC04uboQe4Ril1JObRXiVYxW6
         hW3TCciV8zJxXXyxDZl1EIKKXh+XIIY1EoZfsJeu+FibLuv+KTfUPTWeLSNBkX/YfQYA
         dLag==
X-Gm-Message-State: AFq9FYJGAWEfqb6GccPn/VwkibrBBIVsfSKjzc2tLbOiYXgqvoBSjxzH
	oQ9s07aBbPpjD4XmyP5dcwqq9ckZ23HETQOdZw8RYjnMmRzmBy9oOXlYp+Wm5oCWKWxlxs79fJy
	iYT+ot7ayrlBMiouWSwXkqllbgd7hyoEHCK/FlT9B
X-Gm-Gg: AYBFou2dbQvzgFSSObWXupBmo2KejjoHdT4ZFT6p5ywworQcJaounhaw2AFL6MjTvqB
	PUfhblXPqR+DgbfwB+X4eCT29v8+8JD4wmMjR+QRrXmfgLTBCyEqGE+JRcPA7SAwAwqSeDpAMxN
	wbw+yLzhNSkag54HCpQT/SWNKoma+DnHDazKnv7SleARX4gAW08db56RCIQjLGnIidq8aznE887
	Br4IvFrys6u/0hVLAqoIwGE0P4qgklbO5N5EUImob3j5g1nEiIzTrHvBqsanc++aTAg2n9NRwkf
	D/z5Xyjct5gCUeiYn5lcrzvtOmcgAd5kGzAVjkh+R2sMou3fxPD4VCUzjImbRMOYKuZPrKGm/zX
	nPQOR9p1lLxGjhHP7gyyXL+l7gDgrQwo4Ve4JckFd8ycjzyv8EOa8mTf0j3R7UjKniMI4h0o=
X-Received: by 2002:a05:6402:741:b0:6b4:201f:17db with SMTP id
 4fb4d7f45d1cf-6b4d4675627mr1615560a12.18.1793383057043; Fri, 30 Oct 2026
 10:57:37 -0700 (PDT)
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028112007.3980089-1-sjg@chromium.org> <auKeh8KVIeaxW9Pp@gractus.seuss>
In-Reply-To: <auKeh8KVIeaxW9Pp@gractus.seuss>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 30 Oct 2026 17:57:23 +0000
X-Gm-Features: AclHuK8twO9NEqez5sWbiRpUevDDFuLjlp6wqaFT0XbCLVZYiC9SM_OGi-wJpd0
Message-ID: <CAFLszTg=SNsmq+X0YOdWj9A4rCZcgSKzz266L5siKT8x2kUVcQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] README: Explain how to build with meson
To: sjg@chromium.org
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>, 
	David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"

On 2026-10-28T11:20:01, Simon Glass <sjg@chromium.org> wrote:
> README: Explain how to build with meson
>
> Building with make is deprecated in favour of meson, but README.md only
> gives instructions for make, in its Python section, and CONTRIBUTING.md
> says to use 'make check'. The meson commands only appear in the warning
> which the Makefile prints.
>
> Add a short Building section to README.md with the meson commands for
> building, testing and installing, pointing to the Meson quick guide and
> to scripts/install-deps.sh. Use meson for running the tests in
> CONTRIBUTING.md too.
>
> Closes: https://github.com/dgibson/dtc/issues/83
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>
>
>  CONTRIBUTING.md |  4 ++--
>  README.md       | 19 +++++++++++++++++++
>  2 files changed, 21 insertions(+), 2 deletions(-)

Applied to main.

[1/2] README: Explain how to build with meson
      66975bab448e

Regards,
Simon
