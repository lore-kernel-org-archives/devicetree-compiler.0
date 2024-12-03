Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE4A2500C5
	for <devicetree-compiler@vger.kernel.org>; Tue,  3 Dec 2024 08:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733213662; cv=none; b=MZ3eRO4xzeEIiYsErZLH75crcQLne0SXLToX5FwQvBtVWD/+gwAFcqpXTwZwaivFofYOTRec3Nn/zgEhYxi/BtRQitxMZp8MKQKnuoW63AGrQSsDr0gMuouacJAGeVmdo2xlFtv+cdzI1pJg6/FkmRSWsjaQ+9MPYUHH6SRcVPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733213662; c=relaxed/simple;
	bh=CRifWwRr9HBdJGWaRK5ZMBKekqAOl4UoOSm3Geso3x8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PWp7e6j6/7GVofLgF+nz9+VWGAdEl4aJ9j3byqyL2aU4ehUR9uFrVwUUHWcka0fRuyUzi4AsRoszd4MReA53LSyjsptsoHzJ2vVraI5C3xXlzYjPlmF4B2qfeM15C7Hpdk8DUigdYz4W37qFTNc1TdBEwkDvbqMPornO8iApuP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-51511a1bd53so1122033e0c.1
        for <devicetree-compiler@vger.kernel.org>; Tue, 03 Dec 2024 00:14:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733213657; x=1733818457;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CgTKuor6v4KnfkR9QvcZhFhmc4fVVglWLf1F9DK0BJw=;
        b=ntIt7N285GJVImPH5aHUkKL0muoAfTD5F8tb4utrZZlI4UDPhA7/nAn4c4/e7Updbl
         CGDRNkRxDOQFfbItLg+Q6MEDKRz7MreuFiNG/mXHWjxsnhoSxh0wivusA2DzGnZETL6Q
         ERsQHsz4/Ak/CzFX8aMv/IkPj1h4CdmUbSBJS+h+QZEXYahCArfcuICF4FTCvzuFgkv0
         pNQi2tqwSsn23T1KPbajSSBeol3guN4t2UuadldtBHRzKoMA2t0KAARJTxdm2PFAgQVG
         tevoTz9gT/vOM4lS2J4IRZBBaWwKIiMCHYOADOs5Ex9vA7NMbpeJhcsbj52xRas3nD3o
         0eEA==
X-Forwarded-Encrypted: i=1; AJvYcCX6whE/h3bOK6rY+nncfNECum6VO0plJ9e0FTCg/cgvglgJWX3yCSSSPyf6saH4DSRvolCYvSCkV8qjlcl42p11L/LD@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo2KC/izdUe1h0InfAxCONI6/pRr6YtGaXtK3jqXaPcdXBz4/X
	VCNt0qCdb6Cq12LtwibJRtIIMV5j7puWs0g8w1xdHc+z8tvEvDXBxjtVi5kI
X-Gm-Gg: ASbGnctlB9MFWIrAINC+MhuI0oGXuPorJ255uQgKOwrtl6x/rKfS1t6+WVYiMOocScv
	2AB47LPKfy/4DglFhLjuOHz5kNWRk/hIwRgy03dnXV08mhqR/zPLEN43BLloe+BXxZADDitLiJH
	Wl5dgLoqrFgX0szSjTH3K/GEYDy08zADuZ72nfwBmOIJlfI79iggYiV/k+jhBto90oFdmfvXrzO
	mm5rhdm+tK4/5HzDmD3gTqB5tQWjjS3Q9gLFXgk9NrkCQtzM7y21eZ5auQCNlXaft9zi48SUUO/
	au+/Y6JeIOEk
X-Google-Smtp-Source: AGHT+IGrK67jn/2zPFxs84tT2M79zEWESZV0CR/Xom0bMnkeUBFnmAKDDjuTbxSUI1VR5KJFr7sPZw==
X-Received: by 2002:a05:6122:641b:10b0:515:c854:d3c6 with SMTP id 71dfb90a1353d-515c854db15mr56199e0c.4.1733213657035;
        Tue, 03 Dec 2024 00:14:17 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5156cd230ccsm1248454e0c.29.2024.12.03.00.14.16
        for <devicetree-compiler@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 00:14:16 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-4af5ed9c8b4so1167911137.2
        for <devicetree-compiler@vger.kernel.org>; Tue, 03 Dec 2024 00:14:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXaJvhMfQFSvjPS04luT8BmoyXaeoqKcSMFuSk2ZvQEdlxUgly+m1HGiWxlj1K+yn6yOPBcQbKRrxQGMZiOAUKRHrl6@vger.kernel.org
X-Received: by 2002:a05:6102:304e:b0:4af:4eda:9957 with SMTP id
 ada2fe7eead31-4af97251baemr2308582137.18.1733213656706; Tue, 03 Dec 2024
 00:14:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241116-overlay-path-v1-0-ac3e121359e9@beagleboard.org>
 <20241116-overlay-path-v1-1-ac3e121359e9@beagleboard.org> <Z06GPpmkDEPU1XUP@zatzit>
 <b34fa351-ba29-4e40-8ffa-69d40cdbb3c4@beagleboard.org>
In-Reply-To: <b34fa351-ba29-4e40-8ffa-69d40cdbb3c4@beagleboard.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 3 Dec 2024 09:14:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXDC+VPD1i=hONCJbzCXtLLoJiy7E09TdvKse18F6wnhQ@mail.gmail.com>
Message-ID: <CAMuHMdXDC+VPD1i=hONCJbzCXtLLoJiy7E09TdvKse18F6wnhQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] dtc: Allow path fixups in overlays
To: Ayush Singh <ayush@beagleboard.org>
Cc: David Gibson <david@gibson.dropbear.id.au>, d-gole@ti.com, lorforlinux@beagleboard.org, 
	jkridner@beagleboard.org, robertcnelson@beagleboard.org, 
	nenad.marinkovic@mikroe.com, Andrew Davis <afd@ti.com>, 
	Robert Nelson <robertcnelson@gmail.com>, devicetree-compiler@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ayush,

On Tue, Dec 3, 2024 at 8:29=E2=80=AFAM Ayush Singh <ayush@beagleboard.org> =
wrote:
> On 03/12/24 09:47, David Gibson wrote:
> > On Sat, Nov 16, 2024 at 08:30:19PM +0530, Ayush Singh wrote:
> >> --- a/livetree.c
> >> +++ b/livetree.c
> >> @@ -908,6 +908,13 @@ static bool any_fixup_tree(struct dt_info *dti, s=
truct node *node)
> >>                      if (!get_node_by_ref(dti->dt, m->ref))
> >>                              return true;
> >>              }
> >> +            m =3D prop->val.markers;
> >> +            for_each_marker_of_type(m, REF_PATH)
> >> +            {
> >
> > Opening brace goes on the same line as the for_each()
> >
> >> +                    if (m->ref) {
> >
> >
> > As for phandle references, you don't need to emit a fixup if the
> > reference can be resolved within the current tree, so you want a
> > get_node_by_ref() before returning true.
> >
> >> +                            return true;
> >> +                    }
> >
> > No braces around single statements in dtc style.
>
> Is there any clang-format config or something for dtc? I am currently
> using the format config from Linux kernel.

The above are the same rules as the Linux kernel style rules?

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
