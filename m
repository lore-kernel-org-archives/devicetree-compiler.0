Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793236314;
	b=U9Tw5eX9eqJm31cZH1QqKcErOtyeGwB59opjy1At2pIhhA11p7NnrOhmjP9gVbv7n5AM
	 aIjrfXwyqt6bsdzkmqpbzBcdCM54+a7Osv1PVJypS+3tEv7lHsWPPTmJNVdDzkuxnhDWo
	 dFOwr/SSrcfeDPNnkdEMy+cZGj09suoDXnHPYjVFqii/a0imv8EWL50ibZYOXLIg+fhuU
	 azwHQ7DpGA1ohEtq+eY+pK+TizYkE7wZFoDPl+HaiDcq38Z8UX3+txgbffrhB+TSPkrS1
	 epDclW1wuMbCuJlsiionihCrMeYEbQxznWJcc2WVQxudlh4zaCQGLxub3XR+QMydxkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793236314;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=OVb4PJYx2JDTChbSggro1gVzVBqT/+21vxWRlhCW1w0=;
	b=2EWFGEqB3pxmaBsWJ2PLq+ETEfep8cbwRthCxSfRGuw7zJJDi/WZ6P7biln8AepwDs/w
	 odjv/AwmBpVyh4EX7gbb4TynTW5Ki7VPjN4qr7GMqtYEobzNyrN6OErYIpfN1dWBARoNM
	 DmA6oqvLm0zfPHsZyQ+noNShue8ERkTe4D20xsLggiDMlIiF8WEjl9spngnGtjv6sL8nw
	 BwDojtFAOCzxZ0rxUKlfgPGtiMEp81bbuCU7wdtAiDJLMw5sxRutABo9wJYWqjf85c5On
	 mkIxK6OUPLaGP2vZdKHblndZl2FyrqpIAymQfMdRKPSEArTpHJ7juYdsvdJbCsvajew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=B1v9iQ+9;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6DE606A31D;
	Thu, 29 Oct 2026 01:11:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC6DE606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=B1v9iQ+9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793236309;
	bh=OVb4PJYx2JDTChbSggro1gVzVBqT/+21vxWRlhCW1w0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B1v9iQ+9JOhYWMI9b6Mfy8KvFOD7D1O5+SXbC0+LBqJAmEX3VQXjYSdtlbbwKtHlm
	 iMX8ufxZvgW5mWYSsnU3RRmBWGYGQB7tgTvsmiyDHwSRPQRKFWHpo+RoEab8a5fGwm
	 rOEllnOb18L9DweO7uV2kPbWeP/IE4JTrhesZAvlgi8MBNS8rYDRAEtkOSvWkhe+tq
	 ECHrGwh92TdUpS/4+3xZzWTLLiskkMnZv6Cv3avp9SbS7nVc3/+EYgku2nGifgRRwK
	 ydZL3y59G8VTt5CD7mF8vvLABlE7K2yiY1neWYKT25M4+S3NIQvyMKmICdOtaAsi3y
	 BqzpftDN48CpA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jFR5d3p2Yz4wSk; Thu, 29 Oct 2026 12:11:49 +1100 (AEDT)
Date: Thu, 29 Oct 2026 11:27:51 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Doug Anderson <dianders@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>, linux-kernel@vger.kernel.org,
	Devicetree@vger.kernel.org, Brian Norris <briannorris@chromium.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Julius Werner <jwerner@chromium.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>
Subject: Re: [PATCH 0/4] fdtfactor: Introduce fdtfactor to auto-factor
 overlays
Message-ID: <auKS-dqpPfUQ8Vtv@gractus.seuss>
References: <20261015182221.2931742-1-dianders@chromium.org>
 <atrnN0ICA41TU1B3@gractus.seuss>
 <CAD=FV=XXp6rMfE0fwUOFHQ--eetjRu8N=L1pjZP71Lcu5n-yow@mail.gmail.com>
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ifC61zKW8teTOwOz"
Content-Disposition: inline
In-Reply-To: <CAD=FV=XXp6rMfE0fwUOFHQ--eetjRu8N=L1pjZP71Lcu5n-yow@mail.gmail.com>

--ifC61zKW8teTOwOz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 02:57:08PM -0700, Doug Anderson wrote:
> Hi David,
>=20
> On Thu, Oct 22, 2026 at 10:04=E2=80=AFPM David Gibson
> <david@gibson.dropbear.id.au> wrote:
> >
> > On Thu, Oct 15, 2026 at 11:21:33AM -0700, Douglas Anderson wrote:
> > >
> > > Devicetree overlays allow you to have a "base" compiled devicetree an=
d then
> > > to apply an "overlay" to it to add or modify nodes. Devicetree overla=
ys have
> > > at least two purposes:
> > >
> > > 1. Supporting add-on boards (like "hats" on a dev board). In this cas=
e the
> > >    main board is described as a base devicetree and the add-on board =
is an
> > >    overlay. In this case there is a clear separation between the base=
 and the
> > >    add-on board and the base/overlay separation models reality nicely.
> > >
> > > 2. Supporting a "family" of similar boards in a space-efficient way. =
In
> > >    upstream Linux, there are 47 distinct sc7180-trogdor boards suppor=
ted.
> > >    These board are all highly similar, but we compile (and ship) a se=
parate
> > >    devicetree for each. Devicetree overlays can make this much more e=
fficient
> > >    by factoring the common bits to the base devicetree and having each
> > >    of the 47 boards represented by a small devicetree overlay.
> > >
> > > Up to this point, the usage of overlays in the upstream devicetree re=
po has
> > > mostly been for case #1.
> >
> > I don't think it invalidates the concept you're going for, but this
> > description is a bit misleading without some historical context.  In
> > particular this is a bit confused by the fact that there are both
> > source-level (dts) overlays and binary-level (dtb) overlays.
> >
> > Source overlays came first, in conjuction with /include/ support in
> > dtc, and were intended for use case (2) and similar.  A group of
> > boards with the same SoC was the most common case, but families of
> > similar boards and families of similar SoCs also used this mechanism.
> > At the time this was still envisaging that a complete tree was built
> > at boot time, and didn't change.
> >
> > This started to drift into use case (1) since without hotplug (we'll
> > get to that), a board with different hats (or whatever) can be
> > considered variants of the same base board.
> >
> > That still required the complete tree be built at compile time (or at
> > least bootloader / kernel installation time).  That wasn't great for
> > two reasons, roughly matching your two use cases:
> >
> >  1. Compile time is obviously no good for hotplugged hats.  Even for
> >     coldplug hats, it's desirable to be able to complete the tree at
> >     boot time rather than compile / deploy time.
> >
> >  2. Bootloaders often want to support a variety of related boards, not
> >     just a single configuration.  That was already possible by
> >     incorporating a full dtb for every variant, but it gets pretty
> >     bulky and bootloaders are often pretty constrained.
> >
> > dtb overlays were invented to address these, though I don't know that
> > difference between the two motivations was particularly well
> > understood at the time.
> >
> > dtb overlays were pretty much a direct transcription of dts overlay
> > semantics to dtb and runtime.  The use of "in band" encoding (special
> > properties) is kind of inelegant, but it worked well enough to become
> > popular.
> >
> > This works reasonably well for use case (2).  That makes sense: the
> > semantics are based on dts overlays which were designed for use case
> > (2).
> >
> > But, dtb overlays have always been a nasty hack for case (1), even
> > though that's become the predominant one.  Overlays can change
> > anywhere in the tree, whether or not that's physically sensible via
> > the hat connector (or whatever).  The semantics of applying an overlay
> > lose information (by design), which means that removing an overlay for
> > hot unplug is a complete mess.  The way we encode the information
> > necessary to apply an overlay is kind of messy and inconsistent.
> >
> > Still, they worked well enough for (1) that they've become widespread.
> > Herv=C3=A9 Condina is now working on a new scheme (dubbed "addons") whi=
ch
> > is actually designed for case (1), and should suit it much better.
> > It's a fair way off being ready for use, but it's a good development.
>=20
> Interesting. I'd have never thought to call the "dts" vs. "dtsi" split
> "overlays".

Technically they're not quite the same thing, you can have an
overlay within a single dts file:

	/ {
		prop =3D "somthing";
	}
	/ {
		prop =3D "else";
	}

But yes, they're not very useful without includes and the dts/dtsi
split tends to match the overlay pieces.

This was where the term "overlay" originated (I believe I coined it
myself), referring to the fact that later fragments overwrite / cover
/ "overlay" the earlier fragments.

> I'll try to reword this in the cover letter.
>=20
>=20
> > > I've used this tool to reduce sc7180-trogdor device tree files (which
> > > are stored lz4 compressed) from 1.71 MB to 213 KB, a 87.5% savings.
> >
> > Nice.  I suspect this gap would be substantially smaller with a large
> > window compressor.  The trick here is that the factoring is finding
> > long distance redundancies which lz4 won't be able to see.
>=20
> FWIW, I don't think the large window compressor would have helped
> here. Each .dtb file is compressed on its own, right? This means that
> the bootloader doesn't need to read/decompress all of the devicetree
> files--just the ones actually cares about.

Oh, good point, the large window compressor would only help
substantially if all the overlays were compressed together.

> > > I'll freely admit that the patches in this series were pretty heavily=
 vibe
> > > coded. I'll not pretend that I have a deep understanding of the intra=
cicies
> > > of how overlays are implemented. That being said:
> > > * I've spent quite a bit of time reviewing the code from a high-level
> > >   perspective: confirming that functions are well documented, well st=
ructured,
> > >   and make sense.
> > > * I believe that what the tool is doing and how the tool is used make=
 sense.
> > > * I have had quite a number of internal "the AI reviews the AI" round=
s to
> > >   the point of diminishing returns.
> > > At this point, I'm not embarassed to put my name behind this. While I=
 won't
> > > promise that there is zero cases of the AI doing something really stu=
pid,
> > > I'd be willing to bet that the end result is better (and cleaner / be=
tter
> > > structured) than what I would have coded up if I had spend a few week=
s doing
> > > this on my own.
> >
> > Thanks for that clear and helpful context.  My views on AI are
> > complicated, leaning negative, but I do think it can be a useful tool
> > and have no plans to reject patches purely because they're AI
> > assisted.  A statement like that goes a long way to convincing me that
> > I'm not about to waste my effort reviewing slop.  c.f. my rather
> > unfriendly response[2] to a recent very sloppish bug report which
> > vastly overestimated the impact of the bugs in question.
>=20
> Sorry if it still wasn't super amazing. FWIW, it was definitely much
> worse when I first started with it. :-P The quick prototype was done
> in 30 minutes, but then I spent a big chunk of time trying to whip it
> into something sensible. ...but obviously (as you found in reviewing
> it) there were a bunch of things that looked reasonable to me but
> weren't ideal. FWIW, there were at least some things that I simply
> made the wrong choice on. I wasn't sure how much you would want
> fdtfactor to stay out of the way of the rest of "dtc" (AKA keep my
> changes self-contained) vs. actually improving / fixing the dtc source
> base. I chose to stay out of the way in a few cases. That's changed in
> v2 which makes fdtfactor smaller.

Ok, good.

> FWIW, I've attempted to get my AI to improve the later patches in the
> series based on your feedback in the cover letter and patch #2.
> Hopefully this makes things look better to you in v2...
>=20
>=20
> > [2] https://lore.kernel.org/devicetree-compiler/as8RYmIp0pDCplpu@gractu=
s.seuss/
> >
> > Understand that all dtc maintainership is unpaid volunteer time for
> > me, so I'm less responsive about reviews than would be ideal.  I am
> > gradually chiping away at the backlog, though.
>=20
> I really appreciate the time you took on this. I've made it a priority
> to go through all of your feedback and ensure everything is addressed.
>=20
> I'm sure v2 won't be perfect, but hopefully it's a bunch better.

Excellent.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--ifC61zKW8teTOwOz
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrikvkACgkQzQJF27ox
2GefmQ/+JqBysJ+JOcgOPAUq79jcDb4976oLlcv+PjaM7wlob47BrbAa7sn5GvX7
eWQ4SJgwpqUlLf4qQzUf2qc8A0sfb5zwb4ht8mWh1VvuW06zXSfVSZqCzB97fuiW
v5uOyUbFsEK44Yt5qMvZ6zOQAngGBK/YNSZztxqCK3C/SRRMZP8Sj/wRxXyV6n7u
OZAnKyv2Z6qad8zXoZTWXf/UKO9rJmgT0YTbzi4SE9XyGLXzbELhdVzq53k8Rj4D
xip96wBfSsiqBVKVjvllYGVdPbpt0KUizn6s0Ye06/+inu2P9ZVBvdWW4ZMrJQp7
nOPdKt25pY/7Lv8yYKyVWga1XSPN4MtWJ+NoxQnBjpPuN96MczZ0i1zwYC/jEhw9
RTKgAnhxofk5U07LytbV/CxoIlJVqUlOHyRfO2KSKQR/L6Aze1KspqAqFXqhjSCd
LAkcUShF4BPT8mcvL5EjTu+cK8dK0MC0kiDv/Imef6q/8Jl1mFzu+7E+w1WC+WCp
u1/7LwXC6xLO2ld0BgLN3pFSGa7xT998vD/bxbxCh4OjdKZi/gLqsn/URneo0Q5q
PGVwjWNlu1e30X4ciqsU2TvMt6GJ6XDNbTXbL7Z7ZNLzhFJZQczxWUHTXYtPxsue
j8DYbQCqlFlqi8HpvC/8VgZyJvyTeQnmIzWAbZp6P8Voaoc8das=
=LwJs
-----END PGP SIGNATURE-----

--ifC61zKW8teTOwOz--
