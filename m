Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCBE2D3A71
	for <devicetree-compiler@vger.kernel.org>; Tue, 16 Sep 2025 13:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758029711; cv=none; b=JhOjNVID9MzepdIVfwWWWR4VPWNQ/oVc12RCnZmE4tjEmf5pX9HOYC5lp4VxzZ99oAnwqPJCPz3x5XdXNBVCiKMxDPwNcf8XbQiLjgZkpPhhHwkhsdzDKVvPYjc8VDMq+Y0ITIM96gUP/eir6/TLrg7r0TmZRemWKSVuguK8eTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758029711; c=relaxed/simple;
	bh=NOoxReonMuhobJtuMWdYRTzxwSsLvY6z6THmu84JRfk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i5SpezTKPN2W6khWuhx/T0bOscPp4WL1Vhz2SJFKpejkg7G/LnWvAa5BENbsxIKjM+p0DvTJIOIxZ6pcJ55sZabe5deqhKVsEpcJefldnPh23hBzsbxY265jfJ1Urqwwt1HVO7RHqo2qI5UYrSyVlp2LpnLhkzaUbQMUErwRjIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-55784771e9dso1597927137.1
        for <devicetree-compiler@vger.kernel.org>; Tue, 16 Sep 2025 06:35:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758029708; x=1758634508;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UPlGBFIad4u1SYY+YGVVawgiKQ3X/ZTy7ZgadUaNtos=;
        b=RoFmw6ubjQ7Gez9QhfVdXEAzlTAlYW5dq2KsZin3C2jNr5v7nyx1S6JVmb+U5+Ixi1
         17DcYPJICWwT5WcBRzvRZYbOVycO8/CujMzEU/OsLxt8wmVN3B/ARjZLFq6kX1K2Red1
         rUbOsBye+5b/BvzRsIEh+CTibxJC8QTm3KLIqiv2Swv4LIhplQdlsvXDJML0+Y+reqFu
         E60l5UfhOquw00qRe29PRlMsHmzXoE24XE5SsiUdFRIffS3ETduId2J8u2kDZFLCGvzb
         q2ryYyYZ09HvfHutP4UtSPOXj+9htTENAR9VIKrzu1zhF64r9+9zQYjgiM4aNocd1sOS
         huPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoDbWuYoY9WeEfo+8YYxnYJzgT5TfCSMR9LzB3IG8hKakvh22u8ivWxAlE6eeyBqxbNMz7neY4RK7MRQygFv8kL9XR@vger.kernel.org
X-Gm-Message-State: AOJu0YxbI+s8oNKIDQmthWfGImBmjlrQ4MiMpNdwtfvsVQ0Ygr7hDzJk
	XLsjCbwTnSM/7tL82OnARx8W/6sPcfNCnBvlBDgLXzutxbL7T4UAdtRURD50tvgZ
X-Gm-Gg: ASbGncvktHGij3ZBswbm3qP6Mah3M+gXLTjFTLgT/ocJHL7uMcjacllw9uLTzedSr3L
	o8IxnNI20AvuxPY5h8f4K4qZUalrBBLDkjxnEIL3HNn8lJ+NJPVj/A7uLn3v4HbVbp4lY6xV84S
	M9EaNw1L2so/B4M5Gha1leyEm/pGCb55457oFUtfU1Qby+UGpflIXQNcHpnSUHeR1JZ70/kzxxp
	fuIHIwcUtd4QUaouEtUEoxHXuSiY5/4cgtStXwsuSO1wBlpPfmKe8Yuyt8wG392bPmiOYLrLzns
	ufFVtZCkmmcql/nZP0YvYQLNZS0W2PBxhAzB87+6EZSsfbCdaGdAAXmx5WPFu1dAtE73IuM5BQX
	gtA8s0fkmMnBL/Gf5u18Y281brEqaeLIUXFuW2aCVl4CUbFmzuNVqJiEBM4x7
X-Google-Smtp-Source: AGHT+IFb2Kj0R66k5aXuRfGg2dJGIFXy+F7ddAlPqv5Ydz9VaS2BslDh4asJAhVBf/m8zWpxy2OQQw==
X-Received: by 2002:a05:6102:800a:b0:555:56e0:f351 with SMTP id ada2fe7eead31-55610115051mr5289610137.28.1758029707968;
        Tue, 16 Sep 2025 06:35:07 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54a0d424de5sm2767742e0c.26.2025.09.16.06.35.04
        for <devicetree-compiler@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 06:35:04 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-539bf3ca92eso1310769137.2
        for <devicetree-compiler@vger.kernel.org>; Tue, 16 Sep 2025 06:35:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXyjzq7VrM/XAOo6ocRYC1pXctCUTCrHg9/5izFgwuajlzy0Y9LUxkPbKlunjE6NAu4QIp6L6dQnAtDLipvz0vteoNF@vger.kernel.org
X-Received: by 2002:a05:6102:3050:b0:51c:3187:e82 with SMTP id
 ada2fe7eead31-55609657675mr5087196137.1.1758029703622; Tue, 16 Sep 2025
 06:35:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250902105710.00512c6d@booty> <aLkiNdGIXsogC6Rr@zatzit>
 <337281a8-77f9-4158-beef-ae0eda5000e4@beagleboard.org> <aL5dNtzwiinq_geg@zatzit>
 <20250908145155.4f130aec@bootlin.com> <aL-2fmYsbexEtpNp@zatzit>
 <20250909114126.219c57b8@bootlin.com> <aMD_qYx4ZEASD9A1@zatzit>
 <20250911104828.48ef2c0e@bootlin.com> <aMebXe-yJy34kST8@zatzit>
 <20250916084631.77127e29@bootlin.com> <CAMuHMdXXi97HN-G_Ozbs7vc141GmbMTPD6Ew6U_0ERj5wh6gvg@mail.gmail.com>
 <397483db-91de-4ff2-82e3-52ae785bc343@beagleboard.org>
In-Reply-To: <397483db-91de-4ff2-82e3-52ae785bc343@beagleboard.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 16 Sep 2025 15:34:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUgnw4Q90a5yzOcK30iBUAQTgUDgAauzSifnngQf7bwqQ@mail.gmail.com>
X-Gm-Features: AS18NWArFS09GxFXzr9rCLXIPOSv-zNSXEkjGvdknIBx7wlKxz_Awydcjb3L0Fc
Message-ID: <CAMuHMdUgnw4Q90a5yzOcK30iBUAQTgUDgAauzSifnngQf7bwqQ@mail.gmail.com>
Subject: Re: Device tree representation of (hotplug) connectors: discussion at ELCE
To: Ayush Singh <ayush@beagleboard.org>
Cc: Herve Codina <herve.codina@bootlin.com>, David Gibson <david@gibson.dropbear.id.au>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Jason Kridner <jkridner@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree-compiler@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Andrew Davis <afd@ti.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

Hi Ayush,

On Tue, 16 Sept 2025 at 14:22, Ayush Singh <ayush@beagleboard.org> wrote:
> On 9/16/25 15:44, Geert Uytterhoeven wrote:
> > On Tue, 16 Sept 2025 at 08:46, Herve Codina <herve.codina@bootlin.com> wrote:
> >> On Mon, 15 Sep 2025 14:51:41 +1000
> >> David Gibson <david@gibson.dropbear.id.au> wrote:
> >>> On Thu, Sep 11, 2025 at 10:48:28AM +0200, Herve Codina wrote:
> >>>>  From the addon board point of view, the only think we can
> >>>> say is "me, as an addon board, I need a connector of type 'foo' and a
> >>>> connector of type 'bar'".
> >>> Agreed.
> >>>
> >>>> Also, at base board level, statically defined in the DT
> >>>> connA is described (type 'foo'), connB and connC are
> >>>> described (type 'bar').
> >>>>
> >>>> The choice to map connA to the type 'foo' connector expected by the addon
> >>>> and the choice to map connB or connC to the type 'bar' connector expected by
> >>>> the addon can only be done at runtime and probably with the help of a driver
> >>>> that have the knowledge of the 3 connectors.
> >>> Agreed.
> >>>
> >>>> I have the feeling that the choice of physical connectors to which the addon
> >>>> board is connected to is a human choice when the board is connected.
> >>> Yes.  Although if the addons have an EEPROM, or some other sort of ID
> >>> register, it may be possible for some connector drivers to probe this.
> >> Right, I think we agree that a driver is needed to help in the mapping at
> >> least when multiple connectors are involved.
>
> > I agree you need a driver to read an ID EEPROM.
> > But why would you need a driver if no ID EEPROM is involved?
> > If the connector types on base board and add-on match, it should work.

> How would a connector be disabled in such a setup? I guess maybe status
> property can be used while applying overlay to check if the connector is
> enabled. But maybe that goes outside the scope of fdtoverlay?

Why would you want to disable a connector?

> Also, I would assume that most such connectors would want to provide
> some kind of configfs based API to add/remove addon boards.

Yes, we need some way to configure add-on board add/remove,
and on which connector(s).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
