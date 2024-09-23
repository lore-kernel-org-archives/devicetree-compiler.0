Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65471946C4
	for <devicetree-compiler@vger.kernel.org>; Mon, 23 Sep 2024 09:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727082739; cv=none; b=TntYc8byZeRuig7WnPyMIsh54ixBCk1G1R6HrZNLCJLQnlq4Pu4oqj05DfjqE9zEnctEXi3UBXWDfphcrzbGtQ/vx7gz6vwMlWXKkDHZkHniKlNbfbacavEmFBiHSYzETs+xsx1RR2hgvJAuqq/i2w5EMaWmIIUsXm/0BKR8BMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727082739; c=relaxed/simple;
	bh=rmdgVFijWuiGmSMMGNowUZP1AO7RME+gs4UzOxJPujo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kd6xHh7mlfNJSdjrWOdWAkBasq8tX91wODivEZZlookvIrTG1QfmyK9PSd1kDrsllOmCqW+VdbsDONO8n0D78a5R8CH70SyP3pS/pUBrXje8RpEnXsQLVs5Qa5bjuUwEfvodOHjfea/WDJbRwf2X672rJQGzN1M8Ng6+j8cpfEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6db9f7969fdso31583457b3.0
        for <devicetree-compiler@vger.kernel.org>; Mon, 23 Sep 2024 02:12:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727082736; x=1727687536;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iiiA1DMVGWAWxIiY1h87ml1cx51gbSQY3LfOjryQlnk=;
        b=HxHAFygYsMXCj2z05J7SwinLbcoo2Ra19Dl+2nZOOeBh/GFL1lwbq1C3lzBNYGisk5
         /ETjUht6PMP2TTj092LOaXjHX0voW9yztq4lI/VBr4mclB1uSO9bIVR513GgEc1/FLNA
         lwL/JBOv1fYhayb7J3OKcomWAX1t/kG+Ge0bcQFCIVyzjusclXCZMre3ETnnTxy/QVMh
         65L69Fb8rC5c+WJB8SpV9fp/4RSmK00HMYYKSxq2kzSW5lN5rS9mwUiaHSojAVrOHz9s
         DTFEF1wMGbv1LjWzPpaobs5iYGFii05L43vGx5IlNGE4znIcMATGP4CBTwK3R1rKXL6k
         jEjQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8fLRDn6wutoXQUXTvMG8Gy+KT32gDPIFLXFQs1voW1pUAdg+s4Dttyl1M97S3CtN/t9sebks34uKhSeSOr/Bu4IOb@vger.kernel.org
X-Gm-Message-State: AOJu0YxoV8NZvEoGyrFJv0FPeJ7nArGD99Xt5f3jlgvSt4wXd0i6z9Vh
	tvhQRgdJIQH22DCV7Dvi4lgPaspdY2XFxW3ROODS25gBisxxHBGc2R48o9sb
X-Google-Smtp-Source: AGHT+IFmfCQBzgL9AdlKqwmooDxICQEBUzhBb3fimjYMC333DvaGvPR+CKR9f4nkUO/Fm6iF3Ey0Hw==
X-Received: by 2002:a05:690c:a86:b0:6d6:c5cd:bde0 with SMTP id 00721157ae682-6de09865398mr104010217b3.15.1727082735953;
        Mon, 23 Sep 2024 02:12:15 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6dbe2df0717sm32971667b3.28.2024.09.23.02.12.15
        for <devicetree-compiler@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Sep 2024 02:12:15 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6db9f7969fdso31583137b3.0
        for <devicetree-compiler@vger.kernel.org>; Mon, 23 Sep 2024 02:12:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVnGOv2PS+e7yb0CXfqRteF4jRWu6zmdDoRoZfxxCqdCLxREXtx6KcdKGnLEGQ6tvvpui5JPxv8RBbIe/095dU0YL4q@vger.kernel.org
X-Received: by 2002:a05:690c:23c5:b0:6dd:ba98:5c9b with SMTP id
 00721157ae682-6de09886fdcmr99733327b3.22.1727082734916; Mon, 23 Sep 2024
 02:12:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240902-symbol-phandle-v1-0-683efb2a944b@beagleboard.org>
 <20240902-symbol-phandle-v1-1-683efb2a944b@beagleboard.org>
 <Zt6Bog4Fqcb89ivO@zatzit.fritz.box> <3f062731-5819-4fb3-bf97-5748be63eb17@beagleboard.org>
 <ZuJiRfTWm8f8YfZ7@zatzit.fritz.box> <71d8be80-8dd0-470b-9881-414c13746eb1@beagleboard.org>
 <Zuo8yWrRPGcqnEwN@zatzit.fritz.box> <705b181e-2242-431f-bb6f-c00e178aa602@beagleboard.org>
 <ZvDjW7W1096FW8XL@zatzit.fritz.box> <CAMuHMdXG32pj=nO9iGTD69QSLY7p9BoASqnMi87LBmBuQg0GAA@mail.gmail.com>
 <ZvEpHCeKDi_8XGcz@zatzit.fritz.box>
In-Reply-To: <ZvEpHCeKDi_8XGcz@zatzit.fritz.box>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 23 Sep 2024 11:12:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWsKQZw+pDZ7t3X3amCV6ms76v4o_FsdZ6-XJEDrv4Gvg@mail.gmail.com>
Message-ID: <CAMuHMdWsKQZw+pDZ7t3X3amCV6ms76v4o_FsdZ6-XJEDrv4Gvg@mail.gmail.com>
Subject: Re: [PATCH 1/2] libfdt: overlay: Allow resolving phandle symbols
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Ayush Singh <ayush@beagleboard.org>, d-gole@ti.com, lorforlinux@beagleboard.org, 
	jkridner@beagleboard.org, robertcnelson@beagleboard.org, 
	nenad.marinkovic@mikroe.com, Andrew Davis <afd@ti.com>, 
	Robert Nelson <robertcnelson@gmail.com>, devicetree-compiler@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David,

On Mon, Sep 23, 2024 at 10:41=E2=80=AFAM David Gibson
<david@gibson.dropbear.id.au> wrote:
> On Mon, Sep 23, 2024 at 10:22:03AM +0200, Geert Uytterhoeven wrote:
> > On Mon, Sep 23, 2024 at 5:41=E2=80=AFAM David Gibson
> > <david@gibson.dropbear.id.au> wrote:
> > > So, essentially you're just adding new labels as aliases to existing
> > > labels?
> > >
> > > Ok, I can see at least two ways of doing that which I think are a mor=
e
> > > natural fit than allowing symbols to be phandles.
> >
> > [...]
> >
> > > # Method 2: /aliases
> >
> > Does the (Linux) DT overlay code support updating aliases?
> > Last time I needed that (almost a decade ago), it did not.
>
> Huh.  I hadn't realised the kernel kept a separate cache of aliases
> that wasn't updated.  Assuming that's still the case, that would
> complicate matters a bit.

Indeed.

> > "[PATCH/RFC 0/3] of/overlay: Update aliases when added or removed"[1]
> > was never applied, due to me never getting to all of the requested chan=
ges.
> >
> > [1] https://lore.kernel.org/all/1435675876-2159-1-git-send-email-geert+=
renesas@glider.be/

FTR, if anyone is interested in this, IIRC I have an updated version
somewhere that did implement some of the requested changes. Just ask.

Thanks!


Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
