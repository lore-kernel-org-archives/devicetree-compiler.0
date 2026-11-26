Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795718410;
	b=JDd20TA4HdfpPxRTJJiM6WIGooXpr2y9+FoNlQgDeA/lueYA7RmhTZSLrGYraSUwcmnD
	 7slyftav2gsigHxt1eDWYuMTyMOiJSd4LtaffdszWADclTD/QW93qyRTBS3gniSBnHn+Y
	 UwkLASjwLoyIQDfLXXQGK0vA+gW7Mn4AKOAIURb2t+5XOtPWi+6NN/9GtpPs6Qrwkrj5q
	 jD7Qt9xoPvp6rbbPgJkQJHjf0a97Jf+RKAoZMrWqLoRPvZU2CEfJfoxHvmPuH2rBPZqk+
	 3q1bfaZIhe6pqo+nWRm/WRRY6NmcuPwN4k+DagNAF5EAFBukX8a4NdQY/VkoYuv47rw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795718410;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:MIME-Version:
	 from:In-Reply-To:References:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=69KV1mLP5cHudbXLpQuYBCC3rVIHgNu4TyAmQrnaiuA=;
	b=Jb2l8NoRxBRfgnHES+88GF+J3OKaqglLzc8h3lcQl51VjGLzZs7CbeRbF196vQCRkaIJ
	 8+mIaMgCJ2K9otPcB46XnAsZyX58nnBFt/Xx1e4RWIkMpZkjLLEYz79EUvORKPMzkzfd0
	 +1OOR3s+bAkzW+XsWHLRv26BPMHXBXII+iRs4CvdwNYGtUVqcy+zyS2dHOtJjc6vrbMRT
	 Pm6J/1MoEfQrQinSsIAIweHM5kZ+jnRljUwBQQtzjUUwWI+LPffu0xB/Mscv3gNeZmWdH
	 e5rcRAfXbJE8ggk05fbzcImkX+eBg03zlCi4lq6ugo4J9+v3hRjEHcydIgF9CZifpjA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=VKa0061+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A8D606A323
	for <devicetree-compiler@vger.kernel.org>; Thu, 26 Nov 2026 18:40:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48A8D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=VKa0061+
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b8b20b2538so8490456a12.3
        for <devicetree-compiler@vger.kernel.org>; Thu, 26 Nov 2026 10:40:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795718408; cv=none;
        d=google.com; s=arc-20260327;
        b=KtdkX3c5+7oJF3oPxJ5rf050I9Yh7wYbbMVwU90DRBv/nS9QZxcXnI99Ks/2MFGXe/
         TSTcRdjMZdzXPnuF5z4ybR6W4XlfAKamMC+DJpIcpW5wLy4CEwxoSO2Bxy0siINyQ/DH
         EjXpKd5+ukcLiUlpY9hFIaROh3bkBnAY6Xfb+VZjkK9bV7ZuJn2vI+3SrFC36nmXq913
         es062M/CgiR1Cb+PJqCAgEP/vPuF2rjFoY+MVYkKjr1r+waVvMFDDG59sWFPxPqniiPK
         E49QIZ14+sC8eLN3ZHeEnrOkVlR/whWwzmocihZUnyz4uWoz4WBjcP5ey9XYMUl0vzz7
         jCYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=69KV1mLP5cHudbXLpQuYBCC3rVIHgNu4TyAmQrnaiuA=;
        fh=mqQIQk6NAYxyS97NAWCo63T4PX2HDnM54/E1mUMNKCM=;
        b=C9szAblwctYS294ULfZSBoDRrAoSXu6VSISgjHPPTLJxyKhISF80uFQdRxA6rIxz1s
         VMBIFRQPr5KkpTOw0relw6akSJzCtYVnX1VL9k6MIuN5W9JgI2Pb5A98VYSvXbmePBss
         SA7TP7UQFFGtP+3RvIUeoHi4+Fb2A+okjyGZVVY4qkSTlG5T6zdADA+mlEVE8x7kXQEP
         QB+0xOILhJ01zwzrOuMYQJO/rPTB+gAm0qf0Zq1zX+sJUftRH54YgGk4+TZ+IpgCOa0/
         f76cGWMczivuHyNzelpEL2ss5ews7J5JJhUVSM+X+DH40lGOT2PuE/aNOsW5M9Y3betd
         NmVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795718408; x=1796323208; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=69KV1mLP5cHudbXLpQuYBCC3rVIHgNu4TyAmQrnaiuA=;
        b=VKa0061+WeAZwD+tanCoIQKy0NaJMBWTx9V1+345r9YCcmngZZ+0Tg0KP/PGcfky4B
         5pDGfFJdHfzBMJw2CMOZ1Q9I+zq8D4qcGxV9aXTWqc0z+mdHMr8qOML8X++M5rMxld7b
         3ZV66MhhiEVHTgxDb/9larWyej99x4hweKsLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795718408; x=1796323208;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=69KV1mLP5cHudbXLpQuYBCC3rVIHgNu4TyAmQrnaiuA=;
        b=iAu6U+/rdbjF+4LHo4VkyZ4EmGcruAWEx9boUrI4KK0QT0mVH0VI+TgzAD/SqtMFQc
         TDP+WcIf99f56Lu98e+Mk9CCk8lMjq85AXRelEbx73huqr8qDGQSy32HSBtgsS9c7dnu
         1q8uyL/S0pS8yL54jL2nhkKlSj2ckA4kww3/3okwtTJMlYWzldnoEE+wM0bBaL1C+kog
         slAMv5IUagZ6Iu1UVGFQLd3sVU3n9uLVy78pcT7H3drHjzQgqCCXLVbv/eyGspk+ibgS
         +fG0VM3SfVE9NYnpZGvd5/zNGdT5blt/yGsybqwfzp+wozmD4j8U4GGWFOu48eBQ/OdW
         1cCQ==
X-Gm-Message-State: APuU4Z8ReOoYsPZp9vm4jU2RSLuLbKvU+KJ+OkfFG496KzYTcLhyr40U
	sEyslzUO5xUELXCAGnJ9F/557M5YnW5dXfPOyUoqvuVzIK4R8nb0RpcAxvvLbr+WEt4JnhVIuDL
	18gCev6OXhNGoTvK3pnU+sfBsxtSqw15InvNPkIzu
X-Gm-Gg: AZFdTZfC1nSvfNRBAUThNaflQdmAX131+y4JJRXCtZFpKL7wQ5KkQJP8PLWXT7l4saI
	ZX+T6iNnyljNwQPuIo3tfT5IhXTp2uRaQ/myrf++bNef8/R+t4pMR6hejq3im8j7YzU7KllzNdS
	NuC8DL0AAjclJigJfH/kCim6C5XvmrQmZn3Uw1yhdhAwrtlgUWmuG8eSE8H55w8tTqnKBuz3qdg
	6McJo8m7fDl1Hfvya1NRrZP2zoCQkF223kkBj6E4wDADKXTMyM0Fe38wOcNWKwp5vxRXDH7blX6
	lbvBDSVg+b0uRG57IjVkwCD3YPE/6Ra0xhxfm42Fm3EgYBFNs5KzhJn0E0xVY1lUOpVk1I2jUOb
	H35gP8ek34x5iPy+rzEF81MvemudBJCJdSNN5ql2GTOhlXiL0HreXUOkYuYqr5Ee5Dphngr0=
X-Received: by 2002:aa7:da51:0:b0:6af:a64f:bd44 with SMTP id
 4fb4d7f45d1cf-6ba37ee193dmr12589575a12.45.1795718408626; Thu, 26 Nov 2026
 10:40:08 -0800 (PST)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 26 Nov 2026 10:40:07 -0800
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 26 Nov 2026 10:40:06 -0800
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
from: Simon Glass <sjg@chromium.org>
In-Reply-To: <awYtBTUE2zhepJU2@gractus.seuss>
References: <20261116235813.935070-1-sjg@chromium.org> <20261116235813.935070-2-sjg@chromium.org>
 <awYtBTUE2zhepJU2@gractus.seuss>
Date: Thu, 26 Nov 2026 10:40:07 -0800
X-Gm-Features: Aa3M54pLFagh9bvxWlcy2RnhskN4wVYWd3hzS3zyEfi7H2tfoRhZNTBi0rQRzL8
Message-ID: <CAFLszTi0HPP0wXRaNB1ekcL5hK+ogp+xwz4=biHvuc8P=i5b9g@mail.gmail.com>
Subject: Re: [PATCH v4 01/10] tests: Check how the fragments of a dts file are merged
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>, 
	Herve Codina <herve.codina@bootlin.com>
Content-Type: text/plain; charset="UTF-8"

Hi David,

On 2026-11-25T00:34:30, David Gibson <david@gibson.dropbear.id.au> wrote:

> > +/* A label outside the plugin cannot be used in a label-relative reference */
> > +&{baselabel/node} {
>
> This seems redundant with merge-labelled-relative.dts, and arguably
> with nmerge-first-ref-relative.dts as well.

Actually let me be a bit more specific...

At present the three go through different grammar actions (path
reference, labelled reference and first reference), which this series
moves in separate patches, so each one checks its own patch. Once the
series is in, the path and labelled cases both end up in merge_ref(),
so I'll drop merge-path-relative.dts then.

> > +/* This is an overlay fragment for the root node of the base tree */
> > +&{/} {
>
> Might be worth commenting that this wasn't particularly intentional
> and it's not clear if this difference is a good thing, although it's
> certainly existing behaviour.

Done in v5, in a new first patch.

Regards,
Simon
