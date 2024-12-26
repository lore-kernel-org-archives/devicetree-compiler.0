Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEB914D708
	for <devicetree-compiler@vger.kernel.org>; Thu, 26 Dec 2024 11:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735211422; cv=none; b=CnmG7iib6PelE3Z1qEEjzb3tPPch61+J5PwB313HCX0vllPijKVMSBywy3/JrFfwN7j0UUXP2vGrqkhO8HV1lKv7UwjSSijcjsQZ4VgoHhIPb00F1d/a+c53BNXVvNRYVghPIz2gX+AUXajd2u9sJOMZKNcVTr6YP0h+DVzL1AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735211422; c=relaxed/simple;
	bh=km9HCLshPL7us/1C+2u9D5RclLGlfvVR0/LggiKWzwk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B1aaNijXuXuAConpYLHUNJhIbdrwMgGycEhYQZr8SCOBy7NLWUqxnYQKD9RU2pMzK35z/tQnLvw6wNZj1DDcHtSADGcSWmmdmPjghvdJoAqIQMeH4MukrFOWTjfA69t2085jY5GOWdHvjij13amZXM4CsSkZyJQ8gLhMUJcNaqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4aff620b232so1932324137.0
        for <devicetree-compiler@vger.kernel.org>; Thu, 26 Dec 2024 03:10:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735211417; x=1735816217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SvPNyzUzzql17yjZkvBZhbkmzSwnu0hPdZ4UHe2bcuQ=;
        b=aQUFp/W3L78kYJpt4kU5N7F+Mj3zEayBNnfIe+kfu3Ht2y1Lr6vPMq53NJFtfs0U1/
         X5hycRNywY4EKuTGzbLtbIrUE4DpMFWqpVdBYIEW+oOLjLrBihmUf9dskH2CJnnm0rKC
         OhVUxjL3M6DvzdSxk+l1cq63kdMEFH9dj9XnR/parsvVs6ZVh6yr/0TrxNJ3joc2Zm4p
         k0oj7Ki/ERuBa0xG3GDccrbMsr/+z1lyWX411pJprh4DXU7bOw/Bbhg/KmvEiVCOIcJ6
         G/yRY2U+BKXGI3scXQLd0AmLuP4Z1XotQvZnkIiAFgSXBwHYA00DogiIQXEGKgiCnpFu
         p32w==
X-Forwarded-Encrypted: i=1; AJvYcCXSFgEw6u+CiHt58M7qpfifx5ixOJhaApRq+tQvZtal0M1RPAArIspqR0UloXFhTX04Ju39zxwBdOZKCjOi2s4Zj10S@vger.kernel.org
X-Gm-Message-State: AOJu0YyPyo3B+eqEpt+u/ir9Wu0gU/G+1/MkDWn6r3PC3LO+SAojzrhJ
	zO6Fl+LFLcMront4jjn9947kwbv+ALdRaGJ31sQGBhxxI1pj+TY/urAS0vUr
X-Gm-Gg: ASbGncuDawBvRIPvrb9rhf6Lo1sFT3/6eiC2wD5IF06dy97OKt5nqfBFCJ4xsvufvKX
	gmd3HyecPn7O3BzlPbrRMYOD+QWShQAy7XYbEheXp+CXi4rHaGe0Z0mmg+ekwzz2pgJkk4c7S0W
	e1vgdpTUb5B94gT8W4CACFj9VO6+UYt0VjgYZr8fmD6E78JWCsvezOVN9gj9Dv8GUkSPBDv+ijE
	2tmWJBIRKXazu9SIbcBXoZwnFoQPPlM0QklhItHG1WEjHxxTJXbFAVQ7dXJXdnThBmTrsFV/Cd5
	Kjb51qdY8xFi3TsvpVWN8X0=
X-Google-Smtp-Source: AGHT+IG4iO1lGQ3fy5YkjyhHIuMZ1ShW6hBR29m0ObfmiTfNs1+PKaXw1ICY91X0XzoCA0sP5DdJ3g==
X-Received: by 2002:a05:6102:6cf:b0:4b1:16f8:efc4 with SMTP id ada2fe7eead31-4b2cc36a2f3mr20801284137.12.1735211417651;
        Thu, 26 Dec 2024 03:10:17 -0800 (PST)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b2bfa8d590sm2577327137.26.2024.12.26.03.10.17
        for <devicetree-compiler@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Dec 2024 03:10:17 -0800 (PST)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-51bc2363fd7so285733e0c.2
        for <devicetree-compiler@vger.kernel.org>; Thu, 26 Dec 2024 03:10:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW36nWS1nj+fOYzP6uay+FirvIpvJaoR7T52fmVGjorCUEbO+jf781Onw2Eqxe3kEQ+lMIOhHF5W5/0mRevGlM2p68k@vger.kernel.org
X-Received: by 2002:a05:6102:3f0f:b0:4b1:8b53:2987 with SMTP id
 ada2fe7eead31-4b2cc31f957mr18654171137.1.1735211416950; Thu, 26 Dec 2024
 03:10:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241111-append-v3-0-609c09401f3f@beagleboard.org>
 <58c44f5d-7b45-4489-bf26-2be36c44e39a@iopsys.eu> <Z1_EM1dEmN4KHhBr@zatzit>
 <89073be9-c5f6-47ef-81d3-e7d57070f8d0@beagleboard.org> <Z2z9mk8nrMzLi-gy@zatzit>
In-Reply-To: <Z2z9mk8nrMzLi-gy@zatzit>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Dec 2024 12:10:04 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVQZ0Ffhi5LGWdPeiMbaGp-ctN=OAg9kvrwJgpxEpENmw@mail.gmail.com>
Message-ID: <CAMuHMdVQZ0Ffhi5LGWdPeiMbaGp-ctN=OAg9kvrwJgpxEpENmw@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Add capability to append to property
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Ayush Singh <ayush@beagleboard.org>, Andreas Gnau <andreas.gnau@iopsys.eu>, d-gole@ti.com, 
	lorforlinux@beagleboard.org, jkridner@beagleboard.org, 
	robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com, 
	Andrew Davis <afd@ti.com>, Robert Nelson <robertcnelson@gmail.com>, 
	devicetree-compiler@vger.kernel.org, Simon Glass <sjg@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 26, 2024 at 7:54=E2=80=AFAM David Gibson
<david@gibson.dropbear.id.au> wrote:
> On Fri, Dec 20, 2024 at 09:00:14PM +0530, Ayush Singh wrote:
> > On 16/12/24 11:39, David Gibson wrote:
> > > On Tue, Dec 10, 2024 at 04:34:17PM +0100, Andreas Gnau wrote:
> > > > If we add /append-property/, why not add /prepend-property/ as well=
? This is
> > > > not only "nice for consistency", but it would also enable solving a=
 problem
> > > > where SoC compatible strings from dtsi [1] need to be repeated in b=
oard dts
> > > > [2], because one cannot prepend to an existing property.
> > > >
> > > > ```
> > > > dts-v1/;
> > > > / {
> > > >   compatible =3D "soc-vendor,soc1234";
> > > > };
> > > >
> > > > / {
> > > >   /prepend-property/ compatible =3D "board-vendor,board-xyz";
> > > > };
> > > > ```
> > > >
> > > > What do you think?
> > > So, this kind of demonstrates why I don't love /append-property/ as a
> > > proposed syntax.  The way I'd prefer to do this, ideally, is to allow
> > > properties to be described as expressions.  We already have integer
> > > expressions that can be used in < > context, but I had intended to
> > > extent to string and bytestring expressions - but I've never had the
> > > time to implement that.
> > >
> > > Under that proposal, I'd expect appending to look something like:
> > >     str-prop =3D /previous-value/, "1";
> > >
> > > Prepending,
> > >     str-prop =3D "1", /previous-value/;
> > >
> > > .. and you could do both at once in the obvious way.
> > >
> > > The downside, of course, is that this is a much more complicated
> > > proposal to implement.  Parsing that syntax isn't too hard, but I
> > > think doing it sensibly will need some structural changes in order to
> > > evaluate property values as expressions, rather than simply
> > > constructing the properties directly left to right.  In particular th=
e
> > > interactions between expression syntax and within-property labels (an=
d
> > > other markers) could be fiddly to get right.
> >
> > Do you wish to allow `/previous-value/` to be repeated in the same prop=
erty?
> > Something like this:
> >
> >     str-prop =3D "1", /previous-value/, "2", /previous-value/, "3";
>
> Yes, I'd expect that to work.  Note that I don't particularly like the
> name "/previous-value/" - that was just an example to demonstrate what
> I had in mind.  If anyone can think of a better or more succinct name
> for this, please suggest it.

Something like "/./"? (dot is also used in assembler for the current addres=
s)
So e.g.

    str-prop =3D "1", /./, "2", /./, "3";

Or would that be too short? "/orig/"?

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
