Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF6A1E0DD8
	for <devicetree-compiler@vger.kernel.org>; Tue, 30 Sep 2025 07:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759218779; cv=none; b=odaIaQdR3ZU/9TWMFn+SmttiCNiAyQ7qPPYn6+vEFvNEXuUVmMAo8MysIIDAw5ILyV+8ZaibtZufBFogIpEmY4aA3AKErvlTRObESjlBlY5YvBebCfKaeKUNTXpEGSCYrdNlTIujI5ERP4FIgru3gmoy5wh7XScA91rH0KhN9qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759218779; c=relaxed/simple;
	bh=Ks2i8mOpB744eUk2A/ODTB+R+UAfytF25Eq134pKwt0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D4+DFw8XWXecwsLKi+WI2jKlKvXrzSe7rNGiA0YwXE9oBJzaCxXAKfk14w9CK7OL5lQThk8aIq06kyIwnTXf3kW13thzq+q/xpBgyRpFD7eW5R2HwFmYLtNM92UaRJvGBAjEqZibBHdMNdYJc7uCseXbir0CPfDzZwbUAhMIkwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-8e32821b5bcso1899091241.0
        for <devicetree-compiler@vger.kernel.org>; Tue, 30 Sep 2025 00:52:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759218777; x=1759823577;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Aa5DrkK9lamemzbezkeJMzZtq5kF5RPmPk7WlbJcb3g=;
        b=VvWz6mtUjl+Jpv0KYpR/O39AoLle+7/QAsJwcKY6nJ7AYPJGD78EwkvIQLzzUX4L/d
         ddKwwfzhX72w1fovoQqxYSL06PsaeO7nhW9ubgxfD3MhD95DuVL3CScjzEfvmFUl3fqs
         ijSb0f4KNJSb+DdXK/lWzhrJLV1OCbo7hKaxv7+FNgt9bqgc80/K2fOb9t5jvbtOudSW
         ECoCqrdA4XI4xy8S8M/4/BTaJu4sjrS2M/lKnryvEcwXiHfpQNs/sgFkcygKLnRwZbcA
         F/NVm0Ik85WW3RrQ0Wu0k1BBlOdJ68IV+HRWW3V5IwTYW2UHT8vFmfVyJjBAFqmqNwwh
         bZBA==
X-Forwarded-Encrypted: i=1; AJvYcCVcMgP25CqC0/UkTGtFiQkMkRbzN2+hQtqRJqqZ+rLXSo5ywSgwOffiq8NjFKKlM5f26zabdD5sWlZ++LKoHfOJ9cLc@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0cgKY7Uy2xsXsK3gYWar3FcjjuiQJIzkbFWK9PEJ8RINBrXr2
	nsJK/c97e8aYMLRKP20iuXJPao7Pw5f8TpwQShDonUL+a5D0CWMwKSAyD0lQ9s6O
X-Gm-Gg: ASbGncvvGQCsfiQkIfiPJURN6zHmi9eJTaSWEBSbtlsK1E2/KtM272J3cchtBhFqLl0
	+FIoki642pG02dFVdwyRD3kwz7yrQrFNk6NxSovrfF6z8h8J5T82J2lUrNyux8wsUeUgHfkuf8R
	nztXlSYzMbjvlLYK6VmorJHgbI8nMTsZ58piFMBQ8EXQM2ZHYvgKW7eqFSlJTJWKlEkDtUnIokB
	SEc0vh8dpqJmzuAojW/rPGN9PmV2oUyqiEx07t10rUlm/x0TM/g6qw+H9afFHmsKJKH1/9AaeYe
	PnQ5KQl1lzA/3Llk6oPkUT51+wMAC1xudlmDzkjxwva/SKoVVt4dG/LSHV0lB+iJXQtyJnmsxBj
	it7w82VEEohB3gLCHyHLvD1mqycevVDpfLH8E5l98htCG3sgikas15jv7wNP4Ezx8V3weo5HM7q
	XWuLT1cG8S
X-Google-Smtp-Source: AGHT+IEPhSjCFdbrwQxzHPhUKCTOoistSVMu9nwrlaYcyK9YYZ7Z+R0h/JPSBP9WNCJm7CwrL/mtQA==
X-Received: by 2002:a05:6122:2523:b0:54a:9927:7ab7 with SMTP id 71dfb90a1353d-54bea0e66a6mr8111293e0c.4.1759218776810;
        Tue, 30 Sep 2025 00:52:56 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54da3722370sm1218093e0c.26.2025.09.30.00.52.56
        for <devicetree-compiler@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Sep 2025 00:52:56 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-91a57bd6efeso1856314241.3
        for <devicetree-compiler@vger.kernel.org>; Tue, 30 Sep 2025 00:52:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUDAHCrV4c5cH6m56eITD7WccIQ5scksy7pRq9pEN7pZNPmb/Pawhd3Qfv/qWvESWewZHAgL28vE+oJYUsub+OUlhl9@vger.kernel.org
X-Received: by 2002:a05:6122:3c92:b0:54a:a5ac:5107 with SMTP id
 71dfb90a1353d-54bea256dccmr7837048e0c.15.1759218775649; Tue, 30 Sep 2025
 00:52:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250916084631.77127e29@bootlin.com> <aMt5kEI_WRDOf-Hw@zatzit>
 <20250918094409.0d5f92ec@bootlin.com> <aMzhgDYOuG4qNcc0@zatzit>
 <dcbeaff2-0147-4a27-bb46-e247e42810d7@beagleboard.org> <aNJVqSpdAJzGliNx@zatzit>
 <20250923114849.2385736d@bootlin.com> <CAMuHMdWmDwedyPnBERs-tSYEG15nMUuh9u1Q+W_FdquHpUC0-A@mail.gmail.com>
 <aNNvaN4xJtKBFmWT@zatzit> <cd9763b7-919a-4b44-a347-f1491d9584b9@beagleboard.org>
 <aNtXnAeLj3xNwkyE@zatzit>
In-Reply-To: <aNtXnAeLj3xNwkyE@zatzit>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Sep 2025 09:52:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV+sUZpMtbCtWqJMiL_JC_nFEJcFDOoZJZPhhzhY8zQJQ@mail.gmail.com>
X-Gm-Features: AS18NWCn2Nf_ET6vEoGNsB6ZKan8jeS0YTKv9inR2GremBjiwmJIe_zbvyBIsgE
Message-ID: <CAMuHMdV+sUZpMtbCtWqJMiL_JC_nFEJcFDOoZJZPhhzhY8zQJQ@mail.gmail.com>
Subject: Re: Device tree representation of (hotplug) connectors: discussion at ELCE
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Ayush Singh <ayush@beagleboard.org>, Herve Codina <herve.codina@bootlin.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Andrew Davis <afd@ti.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, devicetree@vger.kernel.org, 
	Jason Kridner <jkridner@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree-compiler@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Tue, 30 Sept 2025 at 06:34, David Gibson <david@gibson.dropbear.id.au> wrote:
> On Wed, Sep 24, 2025 at 10:33:50PM +0530, Ayush Singh wrote:
> > On 9/24/25 09:41, David Gibson wrote:
> > > > On Tue, 23 Sept 2025 at 11:49, Herve Codina <herve.codina@bootlin.com> wrote:
> > > > > On Tue, 23 Sep 2025 18:09:13 +1000
> > > > > David Gibson <david@gibson.dropbear.id.au> wrote:
> > > > > > Ah, right.  To be clear: we absolutely don't want multiple addons
> > > > > > altering the same nodes.  But I think we could do that in ways other
> > > > > > than putting everything under a connector.  This is exactly why I
> > > > > > think we should think this through as an end-to-end problem, rather
> > > > > > trying to do it as a tweak to the existing (crap) overlay system.
> > > > > >
> > > > > > So, if we're thinking of this as an entirely new way of updating the
> > > > > > base dt - not "an overlay" - we can decide on the rules to ensure that
> > > > > > addition and removal is sane.  Two obvious ones I think we should
> > > > > > definitely have are:
> > > > > >
> > > > > > a) Addons can only add completely new nodes, never modify existing
> > > > > >     ones.  This means that whatever addons are present at runtime,
> > > > > >     every node has a single well defined owner (either base board or
> > > > > >     addon).
> > > > > In this rule I suppose that "never modify existing ones" should be understood
> > > > > as "never modify, add or remove properties in existing ones". Because, of course
> > > > > adding a full node in a existing one is allowed (rule b).
> > > > What if the add-on board contains a provider for the base board.
> > > > E.g. the connector has a clock input, fed by an optional clock generator
> > > > on the add-on board.  Hooking that into the system requires modifying
> > > > a clocks property in the base board, cfr. [1].
> > > > Or is there some other solution?
> > > Hmm.  My first inclination would be that this case is not in scope for
> > > the protocol we're trying to design now.  If the widget provides
> > > things to the base board as well as the other way around, it's no
> > > longer an "addon" for the purposes of this spec.
> > >
> > > But it's possible I've underestimated how common / useful such a case
> > > is.
> > >
> > > Note that I'd expect the existing overlay mechanism to still be
> > > around.  It may be ugly and not very well thought out, but its
> > > drawbacks are much less severe if you're not dealing with hot unplug.
> >
> > Well, while that was not an initial use-case in my mind, external clock
> > inputs are a valid use-case when talking about connectors for board headers
> > specifically (e.g. pocketbeagle connector).
>
> I guess I'm not familiar enough with modern embedded hardware.  I'm
> having a hard time wrapping my head around what's going on here.  If
> the external clock input is optional (hence under a connector), how is
> anything on the base board dependent on it?  If nothing on the base
> board is dependent, why do we need to modify its properties to
> represent it?
>
> Is this a design flaw in the clocks binding?

In my example, the external clock input is indeed optional, and not
used by the base board itself.  Still, it is a clock input to the SoC,
and may be used as a reference clock when an add-on board is connected
that needs to use the exact clock frequency of that reference clock.

https://elixir.bootlin.com/linux/v6.17/source/arch/arm64/boot/dts/renesas/white-hawk-ard-audio-da7212.dtso
AUDIO_CLKIN_V is the optional clock input to the SoC.
GP1_25/SL_SW2_V/TPU is the reference clock (actually it is not
generated on the add-on board, but by a PWM controller on the base
board, but it could just be a crystal oscillator on the add-on board
instead)

I hope this makes it clearer.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
