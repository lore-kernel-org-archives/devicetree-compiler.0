Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794511726;
	b=LG/XG8KbA5xiBeF2XEuLyt6IIr5I6u1kNc8kk6SNYVEeTOIam4RkHwTbTXMyrTlmshS8
	 TZCKpStJNP8C1dpdFdvGCVyYdYEQBFhx7NYDhgW8B3YJZGzhSQKff2vvSLpfSYKFdXlpz
	 GM5Tj+GLGuOkwo4KN4GwsV5osp79M3rYOlXPtJAjJOf9WNEsiQ4l/aPQ2S6NHBveSs5yc
	 vwIuDIn/0bMVG6vCs2WSnGhz+ihBeVg9SijLWyOoF53WFmmMeMtOpDjmKrskSj5a2T0f4
	 /l42X4cqH8OYeQcT+FPjrB3aaVo3aMIdZPL+0nRaEkRv+YZ84RoMqXRL0cp2gqYdCYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794511726;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xUK0OTdat1/PmiFM0+zREWUqOBXRwzcDhYc88YTrSTw=;
	b=IJUJnboU4spEUhym9mfD8/p8znBULubrXb9XKd+jUNfly4oWdppOVck0CmNUaU0zlEsn
	 1P77AZKdFlKU3d3yLqOguhmtogoyWlueUNS8YO83omATqEt0r4hhFLjGrtYtC3DEKT/I1
	 FJ2IXaqk2yfGtXQDvG6yvyGQ+elu9JAr7wk/GSQvCk90Q9N9nWzhuOCb+Doq7CslwMSuc
	 8OJ5fopm9+fgzhqqAvCcgw5LAok+xMDN9tfBjLWP2n4rT6PDJi1IWg2VLYyJaXUHLRaJb
	 Ybq67O7ZCgPZZrWwg8AAm03w16z625uzm5i+5T2TQrqfTvk4jHBFfvg0w89GyG5jgqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Ntm4h6oM;
	arc=none smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB74606A31C
	for <Devicetree-compiler@vger.kernel.org>; Thu, 12 Nov 2026 19:28:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AB74606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Ntm4h6oM
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b581b6b0e9so214456a12.2
        for <Devicetree-compiler@vger.kernel.org>; Thu, 12 Nov 2026 11:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794511724; x=1795116524; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xUK0OTdat1/PmiFM0+zREWUqOBXRwzcDhYc88YTrSTw=;
        b=Ntm4h6oMbZtyqSa2JGYJ60Ndw3pnTBKUvrnqLF1RgWRBQPSzVDyTzn+ay7NBV6OVau
         d53NZPwz8D7VRFBejJJ1Jn+zF21zzU3qEDaCmHwi8yrUvJ/2TfrEtmctgrjd6uJy2u3O
         MH9LSUsw825BnJalEaDPkDcVcXqxsavHcdvag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794511724; x=1795116524;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xUK0OTdat1/PmiFM0+zREWUqOBXRwzcDhYc88YTrSTw=;
        b=LNapwfVDRUG3O1LvMUm3QsuAD0HkAyeHvOqyIGxl4c53KvCriiFWiCDGHyTorlmHr5
         sIotOSJF6fmx1PEL2bwrzQmFZ6SiO8UjvdpECKwQFarhOo1cMtsCjLzJnssg9/XwIQxu
         DKu9h+AXHtpqB2NSFVkK1sK5QThdaNI2pgpWLG62ed/cgbov09vhZ6CUezpiJ+rVop9y
         Irqbq4H5x4M8T2uo3b92r4pCTbDuvZrtLeHUur7t5b6P7C7oWx0PtWBFLG7SoNhqGPng
         pBhHsRBgPR1OA5dS4tNOG2DofUMfHou7oNiy7Pud7UvvhGK3Ju7losXkkO9V15U3vl/l
         Q71g==
X-Forwarded-Encrypted: i=1; AL+hErHkHbGx9tD4unc2auWhhJVgY8BNPP8KfgOufW59WNrFD6+gAB6LGMwr7o2lp4yxO93jrSfYOvhl/XLb9U4lXc/Kg6xs@vger.kernel.org
X-Gm-Message-State: APuU4Z/Zwo6NDXp5Zy/Vc7v+8w6ylACHiuiFccgR9x2SEcu6zxuNlMlY
	GQxSss4GQ3BEDKaxU+qGN+UOEbDFypJmYrs72FBXqxt7eOtZRbfVks/2vKzw5KofqmVi5vCib5O
	ReKQKlhY/
X-Gm-Gg: AYBFou2tf0wgO7llusKlXHSM14cB0XOMdr/9XtY9db7p8IavfA58RmutFg3r/yM8sLG
	FCIo35URfd5LtY07z7LSgK3DRj/N9HmDBp/3IEO4dz54U54iUV72VJVUtwAiHgFaVzCTX6Qez52
	RX1v6V+gv5TlupGsUMIqkXeokWtu3HLymJCwKr1hjKn2SPnK1eLBivQP9RMAAmzlK57bww4nngj
	XOiHh/gTvEZB/Bqwd8n2T0xjvZv/N40NLZsvwF1G6XghNv+Bo0GZ6P9JVCqOPmTktfT+eZdbVQj
	TzehAZDRJoQT+1lpUMZkNpYqDeFD9GwfPufqnbwHV61RW9j28hEb0q1ZdWbv4ApOSdOShaU4liw
	lCiAoIHUlLgWWlHhxL+8ldds64O5twWKJ+t4mYQf1VVbn6Eo4HV+HjBEBbVWMRJowrZO9yAUQRZ
	azYC6uGD3eUE1uYfjeug5xWWJKQKSLGgoLinGMsUd43YmqB/QRJmir8v6umphCeTQTY9SC3XkSI
	/ugTJK3ihiytdK6/DYpiADVbgBgVJsAfqUBRvYKDlcGesNekrlcW+JyxbPQtsKxHXL8Sf1r8oJZ
	XAKyBADosMsfpyDZZ2yT8EiMG6Sn7LrVWR/LV+tI+6fs+gWbIhPiYmyZC2RXiV3DmsgA
X-Received: by 2002:a05:6402:4492:b0:6b3:c320:8858 with SMTP id 4fb4d7f45d1cf-6b7c0bb0bc9mr556822a12.24.1794511724438;
        Thu, 12 Nov 2026 11:28:44 -0800 (PST)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com. [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23dde49sm70944a12.23.2026.11.12.11.28.42
        for <Devicetree-compiler@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 11:28:44 -0800 (PST)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4b7252a32c8so2124685e9.0
        for <Devicetree-compiler@vger.kernel.org>; Thu, 12 Nov 2026 11:28:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEU+eThVVH/kv9uxVHrBNkcDlBTKxrO/iNnoHVcnG40F2iqXk+3cp0hXWb2SiecIlJa45FzVCA8rkMaiv/OeBJaOeJR@vger.kernel.org
X-Received: by 2002:a05:6000:2385:b0:48f:d7cd:a5af with SMTP id
 ffacd0b85a97d-49c6a645dd4mr1080826f8f.0.1794511721573; Thu, 12 Nov 2026
 11:28:41 -0800 (PST)
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101220224.1436242-1-dianders@chromium.org>
 <20261101220224.1436242-8-dianders@chromium.org> <CAFLszTgY5oOMYQjsk2sg-8w88uKq2hOqEiF4o5iAi5pMC8TZGw@mail.gmail.com>
 <CAD=FV=V3CMALQsKUc-jDzvsH45y_h4hNxtjYXxaHOwyCsZ3s7Q@mail.gmail.com>
 <avPZeSgU8ABix34f@gractus.seuss> <CAFLszTiUYv2rx2OzvLR6UyO-uoya0WthPsr+oohQtCa+_itZsw@mail.gmail.com>
 <avUZ-uqxLAu2ICyJ@gractus.seuss>
In-Reply-To: <avUZ-uqxLAu2ICyJ@gractus.seuss>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 12 Nov 2026 11:28:29 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WAAk7ddDM3Uq8fRVYF4fCEDnufDbCiVgHfH2cwLqrT7g@mail.gmail.com>
X-Gm-Features: AclHuK-14XxhBI8vAM9M4iq5bb2RGksEhVHE_lHln7MuRG1naDAYFNT2nkSydH8
Message-ID: <CAD=FV=WAAk7ddDM3Uq8fRVYF4fCEDnufDbCiVgHfH2cwLqrT7g@mail.gmail.com>
Subject: Re: [PATCH v3 07/15] devicetree: Add DeviceTree live tree representation
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Simon Glass <sjg@chromium.org>, Devicetree-compiler@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Saravana Kannan <saravanak@kernel.org>, Devicetree@vger.kernel.org, 
	Chen-Yu Tsai <wenst@chromium.org>, Julius Werner <jwerner@chromium.org>, 
	Brian Norris <briannorris@chromium.org>, linux-kernel@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Nov 11, 2026 at 6:31=E2=80=AFPM David Gibson
<david@gibson.dropbear.id.au> wrote:
>
> > > > > > +++ b/devicetree.py
> > > > > > @@ -0,0 +1,226 @@
> > > > > > +# SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
> > > > > > +"""devicetree - Non-flattened in-memory device tree representa=
tion in Python."""
> > > > >
> > > > > I'd forgotten about this but PyPI has Zephyr's python-devicetree
> > > > > [1][2], which installs a top-level 'devicetree' package.
> > > > >
> > > > > I'm not sure what to suggest. Would libfdt_devicetree be too awfu=
l?
> > > >
> > > > Right. I'm OK with libfdt_devicetree. David: do you have any
> > > > objections?
> > >
> > > Don't love it, but can't quickly think of a better option.
> >
> > Would libfdt_tree be better?
>
> Not really.  The problem with all of the above is that they're making
> this library which is about managing a non-flattened device tree a
> part of the library/project/namespace that's explicitly about
> flattened device trees.

Personally, I kinda liked "libfdt.devicetree" that Simon suggested
(though my analysis says accomplishing that would be difficult).
...but I can also see David's objections to namespacing this under
"libfdt". Does this mean "libfdt_devicetree" is out, too?

One other option is "dt_livetree". That matches the "livetree.c" that
already exists in the source base. What do folks think about that? If
we switch to this, should I move the ".py" file? In my draft v4 I
still have it under "pylibfdt/", but I could move it to a
"pylivetree/" directory...

-Doug
