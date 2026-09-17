Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0444AEBCA;
	Thu, 17 Sep 2026 09:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789637844; cv=none; b=tOqndUDbq0jA9Mf46upTaHXDUVGhT9g3ut2sOlb8YDbvZZH6Mx6Mk8n6w4XE47MzEhq2wQPrJGHp1LpKT9IgUWq9Kq0w/I0gms6aZywQdU6LUOk+Q0p1M4KxgGgSu8vXyVS9XuFOwUodNOUNAkRYpTYpsd3SeUzw/2rk7k4ctcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789637844; c=relaxed/simple;
	bh=2glyYQQCszky8rl66NXms4t7EIhq6XpGsMd0kdsutwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rUVkmyD701+m7TIorXasK7uBTTaWDj7L6ibC4crfZRyRuFhLu9bvZQX76pXXpLL13asnmG8t/cJa4wIu7HJUsCtMi0ruONYxN6CqSY9oQsdYcsVjr+UXB+c1u4N16xWSDmuIRzZgQafAY/NOhhvyv4AAU0JXrYXvUhdMs84Wtbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=nQm7IH+T; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="nQm7IH+T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202608; t=1789637804;
	bh=HZSUJk5EhB6gSFvPVZ9ndjhf3AQcmj0uP7Af9rewRAk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nQm7IH+TWa39hRZJOKRst58XHleslAmOXARbKbjvSaHRH9B0AuilV5mnEFIceiCoV
	 dcyRalg2LnFnXIm1aZ+nNzNEdKYB/I4gZbKhSzHAcfEk+eSejHRtVMAkCLQci1gjFY
	 aPyDD0tb4TU87H3lLVgWrCM4HjUazHQhreKMJeDtEKJwuo+zUEboVZv1TLkphAx7B3
	 PEJ5zs0Ix+jhN7hbs7mAtrfur0pNVovqXy3upp19o2rMHu0GIB+ZZ2TNf6tcGPfHhL
	 MKZbtsNDDfN/l+Z/5sPlAO7QO9RrJuMfbrQ4EbGuZ/n+1HWPA9X5/wLs/8OLjlE8Lq
	 5zGH7T/dfuYAQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4hlrHc1tPyz4wBB; Thu, 17 Sep 2026 19:36:44 +1000 (AEST)
Date: Thu, 17 Sep 2026 19:36:06 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	David Lechner <dlechner@baylibre.com>,
	Ayush Singh <ayush@beagleboard.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree-compiler@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree-spec@vger.kernel.org,
	Hui Pu <hui.pu@gehealthcare.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 09/15] libfdt: Handle unknown tags in fdt_next_tag()
Message-ID: <aqu0c3qMJOLoD0Ho@gractus.seuss>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
 <20260826083146.304291-10-herve.codina@bootlin.com>
 <aqpc9HZ2T74Q2lYs@gractus.seuss>
 <20260917103410.1fcfe0f1@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VR2ExKS03k5cF0qq"
Content-Disposition: inline
In-Reply-To: <20260917103410.1fcfe0f1@bootlin.com>

--VR2ExKS03k5cF0qq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 10:34:10AM +0200, Herve Codina wrote:
> Hi David,
>=20
> On Wed, 16 Sep 2026 19:10:27 +1000
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Wed, Aug 26, 2026 at 10:31:40AM +0200, Herve Codina wrote:
> > > The structured tag value definition introduced recently gives the
> > > ability to ignore unknown tags without any error when they are read.
> > >=20
> > > libfdt uses fdt_next_tag() to get a tag.
> > >=20
> > > Filtering out tags that should be ignored in fdt_next_tag() allows to
> > > have the filtering done globally and allows, in future releases, to h=
ave
> > > a central place to add new known tags that should not be filtered out.
> > >=20
> > > An already known tag exists with the meaning of "just ignore". This t=
ag
> > > is FDT_NOP. fdt_next_tag() callers already handle the FDT_NOP tag.
> > >=20
> > > Avoid unneeded modification at callers side and use a fake FDT_NOP tag
> > > when an unknown tag that should be ignored is encountered.
> > >=20
> > > Add also fdt_next_tag_() internal function for callers who need to kn=
ow
> > > if the FDT_NOP tag returned is a real FDT_NOP or a fake FDT_NOP due to
> > > an unknown tag. =20
> >=20
> > I'm a bit unsure about this one.  If we were designing the libfdt
> > interface from scratch, I'd definitely say that fdt_next_tag() - as a
> > low level function - should return every tag, and it's up to the
> > caller to skip unknown ones.  fdt_next_tag() already provides
> > nextoffset making it fairly easy to do so.
> >=20
> > But, of course, we're not building from scratch so we do need to
> > consider backwards compatibility.  Supplying a skipping and
> > non-skipping version as you have here is the obvious approach.
> >=20
> > But I'm not entirely convinced it's the only or best approach.  A user
> > which calls fdt_next_tag() is, in a sense, already opting in to
> > low-level handling of the dtb.  They could well already be broken by
> > new tags (depending on how they handle the default case).  Arguably
> > it's reasonable to require them to be updated (once only) for this new
> > family of tags.
>=20
> I can go in that way. We will have same kind of sequence in almost all
> callers.
>=20
>    do {
>       tag =3D fdt_next_tag()
>    } while (!fdt_tag_is_unknown(tag));

Not really - users of fdt_next_tag() will typically already have a
switch on the tag type, so the unknown tag handling would be an
addition to the 'default' case, not requiring an extra loop.

> We have to care about those "unknown_and_skippable" tags only when
> we modify a dtb. This is handled by a few functions.
>=20
> The vast majority of callers of fdt_next_tag() just want to skip
> unknown tags.

I'm not sure that's true of the (few) callers outside libfdt itself.

> > Another potential approach would be to actually use the symbol
> > versioning we have, but have som far only minimally exploited.  The
> > LIBFDT_1.2 version of fdt_next_tag() would skip tags that postdate it,
> > but we'd introduce a new version tag and the new default version of
> > fdt_next_tag() would return all tags.  That would of course require
> > figuring out how to do that with the verison script.
>=20
> Hum, I really don't want to have versioning in loop for fdt_next_tag().

I'm not sure what you mean by "in loop" here.

> Also, this could work in the dynamic lib (.so) case but not for static
> link and even less for libfdt code copy compiled in bootloaders or Linux
> kernel code.

Are symbol versions entirely unsupported with static libraries?
Obviously they'd have to be resolved at (static) link time, not
runtime, but I don't see that it's impossible.

> fdt_next_tag() is a low level function accessible out of libfdt (API).
> If it doesn't skip unknown tags even for other libfdt internal function it
> will be a too lower function.

I don't really follow what you're saying here.

> Ok, we can have a wrapper on top of
> fdt_next_tag() to skip unknown tags.
>=20
> fdt_next_tag() is a low level function but the rule related to skipping
> unknown tags is also a low level rule.
>=20
> We have to choose:
> a) fdt_next_tag() as I proposed
>    Of course ok for me
>=20
> b) fdt_next_tag() returns all tags -> Full handling at caller side
>    Ok, we can go in that direction but it will bring quite a lot of
>    code duplication.

I'm not sure it's that bad, since fdt_next_tag() loops will typically
already have a 'default' case for irrelevant tags, which will
generally be handled the same as unknown tags.

> I am not fully convinced by this option.
>=20
> c) lib version
>    I disagree on my side

Yeah, I'm not really convinced by this one either.

> d) Other idea
>    Of course, I am still open.

I haven't thought of any more ideas yet.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--VR2ExKS03k5cF0qq
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmqrtHMACgkQzQJF27ox
2GfdMA/+OBqCOmRfZx4kDV6Zd1JmiTSgVH8jOzPgRdi3bmxvfBcVXqd9CPT6o3cy
56RPxzQI3QRYWI/JXTLQ2AOuaxhRPHXrC/5Czoj7EBTPj19mvDUxzXTsYwPqe7dr
eT/aIxbJsEVPgpr+nByN106TZ8qKdKuVptWkczApMq5AdeYmc2HmF+onkY/yMUVW
WjhAyhZVMdBw6qvBNEpoTZl6Tfldm4740F7tpkwZU8JAeS82kerhm11mQFFnAxh0
3OSOEIuk0YyDoWT5tmBUsUcUdqQ70zV+t6WdntPAwo0bUWQpgWv+qVr97c44PmYI
5ZV4wvb0I5t56GN9ni9xSqe1CV7o26QF2Gwhp8LmPzHck72gt/yI/lq+0REt9hxv
/uSvzK0/d3MiAMONWlUJ7jiQUfKPG0kUD4tmeITZDoHfg6HrTwMNnPZBHQaRwpPG
1gL+ohSCJtPP7LCZC1FRgRo78y8sgbZ9a1Wf9Q2aO/BT2dlLAxsMFBqFdr58MLjp
BLmpeG89I1DBi9KWj5A3S5HhogYAJv2CXfm0H3C9eM76tIwUN6shBcGe2ILiHcJI
Zd5Dx6gCE0QdxmrgYzzlB+p/hH46ayKvNJKT22ZEw1vBrV6X7nOLBTv1QLBWhUQ0
D/pQEYO2dDyXW/aWzk2rXGb8EHFEVk8JzGwwuwZ9AbU0YwGA+yQ=
=tbOD
-----END PGP SIGNATURE-----

--VR2ExKS03k5cF0qq--
