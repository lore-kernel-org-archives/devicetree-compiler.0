Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B7B4C7C
	for <devicetree-compiler@vger.kernel.org>; Mon, 16 Dec 2024 06:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734329430; cv=none; b=cYiC7YLTjX70f3ExjjEJnW5LHB+YooHI6YQ5AHMJB2HyhDsFcaHLozzlPhx3F1tji0AViy56ccEu99fnp2MakDuDsGYzvFKphytW4qn7IV+lsyRqCnVjCFw0kyoXfims6pZP6fjZ7ck1uRZhM2xt/tGxx1eNF7q7o0F/3wgo5zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734329430; c=relaxed/simple;
	bh=jKOcHfr4xfoIRowxqbaW2tet18vfpI9hW5zZMaeLUgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eiSWF5hcFYpYFezB80JpKeVm77KThrgpoguE0gcOZKyEKMmuNL+ua7lZSupHzFobYwkqoYg/kIkmBwML04vnP4O049FPmeajAWZgDFBz7pGZ6LutQXaRgnBwhVmGyfS6rw/540Nw/qCAvp/6fpZyOar3caD2i59rhRgjNy5X3Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=SXD0BOUT; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="SXD0BOUT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202412; t=1734329418;
	bh=rNuOV1OUXWSKVrQmjOboo+2PBL3dkuvMlO1CXNrp5F4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SXD0BOUTQixXA2oFB7ToUirE/24TgAt/Z+CFff3Uxx0EdrZOuv+74LY9xyfgmORLs
	 k7495bFABxPxDxhXmaLWqdtQBBb3QCMxaYyz4O6WHqDymeWUEIdA23dAMRVI8zQ1dA
	 z5FwRJkxrmt47i7m8GCnHH505fvckFiufbRCAnF2D4bSIx151Yj3EeDaTQbqRrwEuG
	 //YZ1P0DplEvNIxTf/I136scSIYFBm/t8eP/Y2i8YI4Y2a3/5nuSXKno3t39JdQTst
	 FkZKmLEUg+um3/Ox+3WGx7edPYhYCylu7s32dDMhwD5ZpA8hvROfbBQF/VbWu/78vp
	 N3rBDpx6LzLOg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4YBV0p0bZcz4x4v; Mon, 16 Dec 2024 17:10:18 +1100 (AEDT)
Date: Mon, 16 Dec 2024 17:09:55 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Andreas Gnau <andreas.gnau@iopsys.eu>
Cc: Ayush Singh <ayush@beagleboard.org>, d-gole@ti.com,
	lorforlinux@beagleboard.org, jkridner@beagleboard.org,
	robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com,
	Andrew Davis <afd@ti.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Robert Nelson <robertcnelson@gmail.com>,
	devicetree-compiler@vger.kernel.org, Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH v3 0/2] Add capability to append to property
Message-ID: <Z1_EM1dEmN4KHhBr@zatzit>
References: <20241111-append-v3-0-609c09401f3f@beagleboard.org>
 <58c44f5d-7b45-4489-bf26-2be36c44e39a@iopsys.eu>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7nJ1NNBBeBHaQkUn"
Content-Disposition: inline
In-Reply-To: <58c44f5d-7b45-4489-bf26-2be36c44e39a@iopsys.eu>


--7nJ1NNBBeBHaQkUn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2024 at 04:34:17PM +0100, Andreas Gnau wrote:
> On 2024-11-11 10:54, Ayush Singh wrote:
> > Allow appending values to a property instead of overriding the previous
> > values of property.
> >=20
> > Currently, we have /delete-node/ and /delete-property/, but lack
> > /append-property/. Hence we end up having to repeat all existing values
> > when appending to a property (e.g. see [1] appending to clocks from
> > [2]).
> >=20
> > This functionality is also important for creating a device tree based
> > implementation to support different types of addon-boards such as
> > mikroBUS, Grove [3], etc.
> >=20
> > In practice, it looks as follows:
> >=20
> > ```
> > dts-v1/;
> >=20
> > / {
> > 	str-prop =3D "0";
> > };
> >=20
> > / {
> > 	/append-property/ str-prop =3D "1";
> > };
> > ```
>=20
> If we add /append-property/, why not add /prepend-property/ as well? This=
 is
> not only "nice for consistency", but it would also enable solving a probl=
em
> where SoC compatible strings from dtsi [1] need to be repeated in board d=
ts
> [2], because one cannot prepend to an existing property.
>=20
> ```
> dts-v1/;
> / {
> 	compatible =3D "soc-vendor,soc1234";
> };
>=20
> / {
> 	/prepend-property/ compatible =3D "board-vendor,board-xyz";
> };
> ```
>=20
> What do you think?

So, this kind of demonstrates why I don't love /append-property/ as a
proposed syntax.  The way I'd prefer to do this, ideally, is to allow
properties to be described as expressions.  We already have integer
expressions that can be used in < > context, but I had intended to
extent to string and bytestring expressions - but I've never had the
time to implement that.

Under that proposal, I'd expect appending to look something like:
	str-prop =3D /previous-value/, "1";

Prepending,
	str-prop =3D "1", /previous-value/;

=2E. and you could do both at once in the obvious way.

The downside, of course, is that this is a much more complicated
proposal to implement.  Parsing that syntax isn't too hard, but I
think doing it sensibly will need some structural changes in order to
evaluate property values as expressions, rather than simply
constructing the properties directly left to right.  In particular the
interactions between expression syntax and within-property labels (and
other markers) could be fiddly to get right.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--7nJ1NNBBeBHaQkUn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmdfxCEACgkQzQJF27ox
2GfW9g/9HZuBZoSVVGNPvYgcADutoYy75/kImCJmRp0c4eLv0iG2MuK1rzoDO6IK
/Z8le/yL8fEDOqbLMZdC9Iff3mft4l07wsB07K2rx5nC93byvKKpZSzknc82YdxL
NMMhmT7KbDgezPoAv513EgK8TrK7E6ebkYSejIgOSD0MGtwmVTRuKCyLEkqzZHQ/
hy9ShcGiIUvjXmfk41YO79kLq0u5GMH9YhYwP41H7RjEYnk2arnEOHQvP/9sJnPP
ugUDuq632KOhKExnULzb1T/mzlmJCwKgkVQITFMEsPQJQDzCTRpJHwzOTEHnb0eB
aWgzFBIi3HjYcwASXYJRu2tnWGfYUaYGPJ1lzIQ7q2TBKYKWRMj1oL6+xLES1B+i
zwFjSZ+jOomOfisAUW0Djm6Fz2eMGUnYb6Jr7v3MYc81PgG0iZvu5hDtKr4HKNRj
zKvwtNzzmYUJx/m3WZXDzKPLuzzhrTK5Qe3jNLoveLFBbrvhCbnwYFp9U5WuaMd4
ototTSrqXtlYWDX40tu89p2MKHSZh5kFPm1G7PokMqRMMpCX1cWF1NXZtjPZQ3QM
4ohbmVPSva59CS/yNl699lBxWs3G+iZaWIN1SQQ5apoXht5mkPAwvWF8Cme9nRAf
2RIMYFP0PmjKM4L+l9Z35KpHqT1cwW+2jwjyHBeMWa8TeyX91lg=
=WkST
-----END PGP SIGNATURE-----

--7nJ1NNBBeBHaQkUn--
