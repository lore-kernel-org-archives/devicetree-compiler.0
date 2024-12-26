Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C676017591
	for <devicetree-compiler@vger.kernel.org>; Thu, 26 Dec 2024 06:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735196075; cv=none; b=hYoQHsbPQCikDnA+NiYkKUwnW1zkFPPpIVsQ3+nzBeJN1kVDWcXwMMVmp37st3KL/0FPkX4D5NR9+SCAXWIkYVbYZx6UAQutdMFuDBCzCFRbwACagTdqnyZL2LXk4gAMOLNCDjdOnYdPVdloBndSc+SxEX9Efz4vYCMKGnA+zbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735196075; c=relaxed/simple;
	bh=W7vt7YtMLqhHzo1uzmXWb8IGGZhSWLSF0d9CbdWwAa0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fY1YRVzaWH0yua6+75mwr/sg4p5w9Vk3IzPGk98T3uawJD+7l1+Npu75ILfcQ3m+SoA1zndZ2++om/6mJnEK9UB3SuGDbwbIzVX5Gqo+ex6505+PlwUkENPo11bTTNNon2Edczzvk56DN93Hw/gyJAm7hzpZF9PCRV3EDG2vy9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=IjZLDrHo; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="IjZLDrHo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202412; t=1735196064;
	bh=w3UUdZaXgH0/wHHVDl6WieHWMv8i8wZRpWohlHlCPY4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IjZLDrHoOzdRrTlO8OfBfBuKOqAg1C/p6Bfbm+3ekDgZfOvrqzwz+6NnDJAIN+Esk
	 tY1EZXv8+vAr65AXRo+MK5yW/+GZEVUYhuqmwUDZi6tHj6U7f0aGGjzTy3xgxMGzZV
	 m/mzPzIZjx+IhmsfiE7TIV0SL4fXwQd+xyTjoxp9gMD7L0uAu530RvDI9RQWRbmGit
	 pED8IMGRFlWdijbwPlY7HdK2V7rKJ3bkxC3oTY7wkmpfe5sa2yzSj5sz7sBlfkWgWs
	 NEC8muTVdPiK0pjpj2uBYkoZkIyUPHKNhfSMyMas5V/6vfPYMMtAJXczn5Cgwvlzla
	 f416srC7ToP6A==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4YJfW40tylz4x6T; Thu, 26 Dec 2024 17:54:24 +1100 (AEDT)
Date: Thu, 26 Dec 2024 17:54:18 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Ayush Singh <ayush@beagleboard.org>
Cc: Andreas Gnau <andreas.gnau@iopsys.eu>, d-gole@ti.com,
	lorforlinux@beagleboard.org, jkridner@beagleboard.org,
	robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com,
	Andrew Davis <afd@ti.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Robert Nelson <robertcnelson@gmail.com>,
	devicetree-compiler@vger.kernel.org, Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH v3 0/2] Add capability to append to property
Message-ID: <Z2z9mk8nrMzLi-gy@zatzit>
References: <20241111-append-v3-0-609c09401f3f@beagleboard.org>
 <58c44f5d-7b45-4489-bf26-2be36c44e39a@iopsys.eu>
 <Z1_EM1dEmN4KHhBr@zatzit>
 <89073be9-c5f6-47ef-81d3-e7d57070f8d0@beagleboard.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VwvU+955ubOjIK+3"
Content-Disposition: inline
In-Reply-To: <89073be9-c5f6-47ef-81d3-e7d57070f8d0@beagleboard.org>


--VwvU+955ubOjIK+3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 20, 2024 at 09:00:14PM +0530, Ayush Singh wrote:
>=20
> On 16/12/24 11:39, David Gibson wrote:
> > On Tue, Dec 10, 2024 at 04:34:17PM +0100, Andreas Gnau wrote:
> > > On 2024-11-11 10:54, Ayush Singh wrote:
> > > > Allow appending values to a property instead of overriding the prev=
ious
> > > > values of property.
> > > >=20
> > > > Currently, we have /delete-node/ and /delete-property/, but lack
> > > > /append-property/. Hence we end up having to repeat all existing va=
lues
> > > > when appending to a property (e.g. see [1] appending to clocks from
> > > > [2]).
> > > >=20
> > > > This functionality is also important for creating a device tree bas=
ed
> > > > implementation to support different types of addon-boards such as
> > > > mikroBUS, Grove [3], etc.
> > > >=20
> > > > In practice, it looks as follows:
> > > >=20
> > > > ```
> > > > dts-v1/;
> > > >=20
> > > > / {
> > > > 	str-prop =3D "0";
> > > > };
> > > >=20
> > > > / {
> > > > 	/append-property/ str-prop =3D "1";
> > > > };
> > > > ```
> > > If we add /append-property/, why not add /prepend-property/ as well? =
This is
> > > not only "nice for consistency", but it would also enable solving a p=
roblem
> > > where SoC compatible strings from dtsi [1] need to be repeated in boa=
rd dts
> > > [2], because one cannot prepend to an existing property.
> > >=20
> > > ```
> > > dts-v1/;
> > > / {
> > > 	compatible =3D "soc-vendor,soc1234";
> > > };
> > >=20
> > > / {
> > > 	/prepend-property/ compatible =3D "board-vendor,board-xyz";
> > > };
> > > ```
> > >=20
> > > What do you think?
> > So, this kind of demonstrates why I don't love /append-property/ as a
> > proposed syntax.  The way I'd prefer to do this, ideally, is to allow
> > properties to be described as expressions.  We already have integer
> > expressions that can be used in < > context, but I had intended to
> > extent to string and bytestring expressions - but I've never had the
> > time to implement that.
> >=20
> > Under that proposal, I'd expect appending to look something like:
> > 	str-prop =3D /previous-value/, "1";
> >=20
> > Prepending,
> > 	str-prop =3D "1", /previous-value/;
> >=20
> > .. and you could do both at once in the obvious way.
> >=20
> > The downside, of course, is that this is a much more complicated
> > proposal to implement.  Parsing that syntax isn't too hard, but I
> > think doing it sensibly will need some structural changes in order to
> > evaluate property values as expressions, rather than simply
> > constructing the properties directly left to right.  In particular the
> > interactions between expression syntax and within-property labels (and
> > other markers) could be fiddly to get right.
> >=20
>=20
> Do you wish to allow `/previous-value/` to be repeated in the same proper=
ty?
> Something like this:
>=20
> =A0=A0=A0 str-prop =3D "1", /previous-value/, "2", /previous-value/, "3";

Yes, I'd expect that to work.  Note that I don't particularly like the
name "/previous-value/" - that was just an example to demonstrate what
I had in mind.  If anyone can think of a better or more succinct name
for this, please suggest it.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--VwvU+955ubOjIK+3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmds/ZEACgkQzQJF27ox
2GfXfQ/+NV/AS8vE+ZYeobKjRfJ9hBUBm/DVaQfubhGDMeO7msaibECzoj7hNMUU
M9IBNF8ugFxopw38keIoiC/Fdpeb75tITFavUEJIx0clAtQHGZkZ5+ybeT7o/yZn
k7O2fHV08PjZFtuipVFE2yaMnHo6PfX2erUEDb8E6Z2wtov+YWE7sGla8EK99QmA
FjOfU1EoDwFDiGfKq8owT8cftdNYqzFgulIUAXyJWt3b9lJn6r1rOx2aDDZMKPTr
X41J7ePn9r3yBOR1+vcGfx7A9XDXdZ6V844uJmXbSE6zvTaChODZyhWwqUNF1n8c
IN3VJam6oKIADKQgrS06zT2ZVwRuZWATowRpvLReEUbDpYZ54YssUAXXe+LJeMpY
mkVjpDiG9GWBGxbokR3Y4lCpP6CJSPD9emz2ml3i4sv0MRLIcQzcOUni8UEuLzwm
QMqJnMPkR8zgWxe2xjipm3p/G72sF1FDtI+4dmExVQ2P83/dR/sfQlNe7cQBTUaE
+m3GsNejJttO9NYHTmNjAbGI7B6h9GfJ92DmFywNo5U+7h5LBD2SBoEMxFhbrp6e
DQEHBdlGEl2COGZdET/hhYl8zyX+YLWeKgt41VOwPfwcBxY+zhQn2EfIOr6Fnbyw
eiLGSOyoUwcfIdWfhHZjshDSHVie4UgPMxKH3JHgsPsQgr2yU/8=
=aYDb
-----END PGP SIGNATURE-----

--VwvU+955ubOjIK+3--
