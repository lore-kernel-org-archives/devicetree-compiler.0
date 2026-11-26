Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795718068;
	b=2faoSxDuVSSIsVKleRNvRFrS2AuSFMWxm5PskYW7QeGA02gJbPErZ9ACpPFSXLKIzuHv
	 GXpFnjB4MJhHddMvSaTs33LktchFABEgKVIULBolqFTgmWYreemOUBbT+jFCBHg1ZdStn
	 xKk7rbscaYpi+LB+NsF34ojMOpQiwzu7M1P+kbKkO1QRH4Ffhjc3m26BYK+4BBHsf2L9W
	 VsgkwMYRizl93DfCufV9k+7jzvzUNPAg76GmbPpYUhUU7zNNx6s4Q9qAan2mQjRK0w235
	 fZwTi4Bt1HEz22trRGrV32sAj5jRfjQ8K6tSJbfjBt1jxjt9gRUJ/sxl3Ykb/lGSQdA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795718068;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:MIME-Version:
	 from:In-Reply-To:References:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=G00i0CZFBf+BwffOnaDRXGIgNjg1t3Af4sxdjW0hNKo=;
	b=Lv3/FzfHg5bjjxH7Iut/S52iWFLYE0liRDzgHCLyjNKzFQWhy+hTO+2Fd57TkTouJci3
	 jjNFssldg54F/IJbgiXl3u8om3uHP9sOQdMahiF/B/O+SnmR5OXtFdPCw9belC7omV4K8
	 j8NZwXJvl+u+/UH6WIf5iddB0FygPLngouLbH0tzZjWbZcJn4wWNQJpAExhYtMBvj0/6Y
	 Pt3PVAJohjyQ+DbryQvurknmPpfrB6RnbpNRGHniotQhV8sHvfi1g+ar4OIYXZTa9ruo/
	 tEaTJ1RDO1+cqrjTYJYMkTJMYUt6TX7n+N+I8WDMp+TRNiVtAnG2siwCnSGnJ4FhfJQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=oNpCYTPK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B47606A31E
	for <devicetree-compiler@vger.kernel.org>; Thu, 26 Nov 2026 18:34:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92B47606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=oNpCYTPK
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b596afb4c5so8583295a12.1
        for <devicetree-compiler@vger.kernel.org>; Thu, 26 Nov 2026 10:34:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795718066; cv=none;
        d=google.com; s=arc-20260327;
        b=mnuSSbrbAPj3wd63XHcSJt4MDj+kvgdXDc+Az4enFQ0DkKmhIwD0dXDLp822N4klvt
         8AVTWuLVesEEB3cfXSNshMqjLKN51ppG9L7FjnFvpinLfT8+Qd4F4e7Ac9OSIz+2fcXA
         spLM1RZDaaUe0auyGq24YAltBG3/aJQXkAR8lJBQL09/DtSuB/+L5sZsjwIfrnL5LV5Y
         UETSqTfbK/VJb0qu/H1S8d7h5BKVvW2FRzrWvdxpmg0+UjRx8hzPWbb1Hwb3NbbgtU9r
         3or2gLQ11Gph76hyEzHIiRC8PLGPeWngrLIpXTUQAyitX3+P7u0FFeT2Swl4pkMdcyPK
         A2ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=G00i0CZFBf+BwffOnaDRXGIgNjg1t3Af4sxdjW0hNKo=;
        fh=mqQIQk6NAYxyS97NAWCo63T4PX2HDnM54/E1mUMNKCM=;
        b=WA1BrL6W24iGvHq7Ao1jy/oFV6aMIRu8t2c/iLGDY02w6UiavRajmfXfhaE3vY2icv
         9Ti1oJuOe+KCM/RZVZooCSGpVurIiVjUBM9ZA0MFjcEpUZ+sYmLceQSgiPZZ2FX7nxxq
         UOkmd3F+HY/wAxFFec21tlNGWxDgog6OZVzBac/OrV5RYWXR9w2GiSur7EJIE6vz3x7L
         +kgwkFStx738SKGygx9iXznCtiL1g0PgD9U0Xl5RM+CxDp25nDc29T48sO97gSrM7fll
         8VM4zFyzVS9uFp9Ka+uG0r2grcZFZF/ry/wcYIjl8y1O/jwXrQc/rjit8B2/NKT0rG5F
         xSTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795718066; x=1796322866; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G00i0CZFBf+BwffOnaDRXGIgNjg1t3Af4sxdjW0hNKo=;
        b=oNpCYTPKIlT1jit3H+2MCx99blXtkvPwjiQyhMlUZGoMYOH4tZEIztZJl3AB1mqZvy
         R1B8w8Z8MmAnIS/zl34R8CEB47k59utpLhQeyX9uVvV/PO3j9veEZHMZUrQt3r3fNZtP
         QsghAnPzJN0lya/qH/YQkmg8wdgNBSpyKIk/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795718066; x=1796322866;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G00i0CZFBf+BwffOnaDRXGIgNjg1t3Af4sxdjW0hNKo=;
        b=tfnFwHmHK/ZXCesJBuArsdt7IYO0HgN9ySNp0Lr5ptDiWLITeZyJgQFstfH0PYC8/w
         77R2YF0tTC309aI6c5tXyr+vR0eRm4JOIcNuJuvSl9GMDtGGPmucXfZl8+9fToBtM6J9
         FwOSvQVT0QrdSbbV8IKoyk17Zo+TANLsbC7x0758DjCFBDRYph3Jf9/wpgv6XGO7+xvN
         s1LTSlMGp9+TOOoFXMAhmFC2fzTr7chk87bRSq7LvowIGhdpbuGSnDDU5BTR1N9frExp
         qRJqmSeZXAMvqq4UJygmcC8lpVZCteCljVf5XYXhb7Duz9JIRjOkUzpywauxyIfbgWjf
         KXdA==
X-Gm-Message-State: APuU4Z80NQQAhw29IU7dl+CvSP/GDklMN7VyIp8QYeGVTRlo4GcTzLB4
	B4w6+0DpiXetvjieyMbnIQdhQTnqvNSFsLhhS3lGwPiqYv4HIN7KkODeEnSdi5uFZUj51RlUInL
	nMJYqxpkz+tCkmTS99Jm7Oq+aYkbrVOPKpD6FjjE3
X-Gm-Gg: AZFdTZe+AleN+RhhLUdKyLmOUZBqemEgix+AhDqtTHmP2fsfGFzN9Kyt5U+PcBqqpIR
	Z1ZPuMMxgSg61w8uOn3C2omUJqQMBxz04I7UNLq2XrVVj2x1sJ2A+JBrn2erQsxjgpWY7ESCA+6
	ZXcyfRFyOFrCWk0lCDwNOXy3sYFFzEEAF6b2qq8BWjPtW+LXyByy7Cu+RQmTFYowzNqPGgxGpR6
	W4I3+gL+RE4LSnOmYjLTjyM7FPRIuNkMc2f1qrqLkxjpRurv5+viapY3jJblyi8x6TBLpUeT+NM
	hiDPyh+pkfC/nhLqEP3h69EqsEYlEtwaePgdMs3+4NKnyJOjDbojgLpqlvXZHOWaQp8YWwUcTOL
	z4paFUnINLhphitxYieg3O+Lq12onlsERI/XWUindWkRwBv0ZPC9tCtIwObPAz4O+N7+pBTA=
X-Received: by 2002:a05:6402:3645:b0:6b8:7ec0:7506 with SMTP id
 4fb4d7f45d1cf-6ba37e95796mr14768030a12.25.1795718065951; Thu, 26 Nov 2026
 10:34:25 -0800 (PST)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 26 Nov 2026 10:34:24 -0800
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 26 Nov 2026 10:34:23 -0800
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
In-Reply-To: <awYvRAeiVSO9f0ls@gractus.seuss>
References: <20261116235813.935070-1-sjg@chromium.org> <20261116235813.935070-3-sjg@chromium.org>
 <awYvRAeiVSO9f0ls@gractus.seuss>
Date: Thu, 26 Nov 2026 10:34:24 -0800
X-Gm-Features: Aa3M54qt06RJ_N7r9kL9IhcUD-frC3K48XbHzgGypkEjJnUPgKRVcgEU_hO8IS8
Message-ID: <CAFLszTjALSPc+oJ7uVYaqZoPxUKJ0ggKSB2LU_QhyohSVaSyLw@mail.gmail.com>
Subject: Re: [PATCH v4 02/10] dtc: Add a struct for the top-level fragments of
 a dts file
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>, 
	Herve Codina <herve.codina@bootlin.com>
Content-Type: text/plain; charset="UTF-8"

Hi David,

On 2026-11-25T00:44:05, David Gibson <david@gibson.dropbear.id.au> wrote:

> After consideration of our previous discussions, I'm leaning towards
> using the term "source layer" for these top level components (thanks
> for the "layer" suggestion).  It's more verbose than I'd like, but I
> think disambiguating from dtb level "fragments" is worth it.

OK, done in v5, through the series. The struct is struct source_layer,
but to keep the lines short the helpers just say 'layer':
build_layer_ref(), free_layer(), LAYER_NODE and so on. Let me know if
you would prefer source_layer throughout. 'Overlay fragment' and
fragment@N are unchanged.

Regards,
Simon
