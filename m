Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793416683;
	b=cmPJH2kYkWzB9iJUx2uRWJ1OZMksdOg0KPkdKDsuPiXkzPks4Da+W8A5/V3Wy8PVmTAo
	 l97WkqdqcIp7MgxCG+jJKZpcdBBTZM5RSa0fiznT1MjclgOUQKbh3B28RCFNjw+TrhqHA
	 Sj4thbPDVFeT2BcD4303V5YyfkNIzhNLYUPz/pT5sgqPXSb0YDORduSdeFt73E+T9x1dm
	 ppazBPQaD2A8i4WEDnlAo69hkpp3M31Y7WUteO0JYOQafuxBU56A24Vo6P1K4Ma8qbhNn
	 Ox+6DM9mhtrEz6qI/EHBRDKyaZ80yPtYHVT1eoFZE0uhI9aAZJx5osVv1CcZ/8dsXlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793416683;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=PaQvshL8roUle9Khhx9uxLt6U4tXSGazn/JXYOhcGzc=;
	b=Y5ecQxIIbjG0MvOmUYo+eXTE61S3jm1ngXFdh2Po7uswS94ZAZqrJHMMnudJvE3dbpdN
	 o2FxGGiIhmo4gUWDbl5NdvbKADwLfDly+DJczpIhspilZDOfCbVYC+NELP/Rvl/Xe4B1i
	 0qrz1b8lPl2NqjTbCXF1NgaZw8NXtVqx1jhtP1mRMpc1fPpyLj1qCwTlu6uMbM/c3MY14
	 cJ/1NRXGfrlncmNbOwhnHk90kwsbyJ5laNImsLYqerDWz01yRLesC3iixo9CXHuGwY4sQ
	 eyNVPa4EmL1E1/62/qdvxk3Vk9vaGvuag0zUwNaDYqEZLYVuZ4KbsDCwUHkJ7282QXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b="nk7gBTM/";
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2841606A31A;
	Sat, 31 Oct 2026 03:18:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2841606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=nk7gBTM/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793416672;
	bh=PaQvshL8roUle9Khhx9uxLt6U4tXSGazn/JXYOhcGzc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nk7gBTM/nhxwfoXdrdcjQAvxYtiemldpUgscldjFGInCEs1bN6TDzk1PP83wDlsxm
	 a44uhWTmAnlzZc9pF43RdZh8xdQHDSWRIvBkRCitDjiYAjxlH1b4KrsHA9jfhe5psG
	 +4oSADuXbt+Xdf9gjRyepRaD8Y4Wt4BR7rQB1e49bfsxQEk/rEttrKUl84Rmkp7A8m
	 LuVs0uN5aTwM+2Zy+11QDkgSarsk+GBXloRGAifG5UU1xw7+eBDEo5RuWuoHdcVSbi
	 AOOujTLpknf14hX6ECraANRI89/fWeNKjSWBNgQ6f7hBBfI+qHhBC5+qiXpJTzYuOe
	 bJYdZXZIv95jA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jGjp863cTz4wt0; Sat, 31 Oct 2026 14:17:52 +1100 (AEDT)
Date: Sat, 31 Oct 2026 14:17:47 +1100
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
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH v2 10/74] tests: Add basic metadata tests
Message-ID: <auVdylQ7ny1FvL-5@gractus.seuss>
References: <20260826094950.1088288-1-herve.codina@bootlin.com>
 <20260826094950.1088288-11-herve.codina@bootlin.com>
 <auQqI8WEOVeDRZM_@gractus.seuss>
 <20261030120117.24afadf7@bootlin.com>
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
	protocol="application/pgp-signature"; boundary="qGRKqLyeF2vUtYlJ"
Content-Disposition: inline
In-Reply-To: <20261030120117.24afadf7@bootlin.com>

--qGRKqLyeF2vUtYlJ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 12:01:17PM +0100, Herve Codina wrote:
> On Fri, 30 Oct 2026 16:24:52 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Wed, Aug 26, 2026 at 11:48:39AM +0200, Herve Codina wrote:
> > > This first test is related to local phandle references used in
> > > properties (FDT_PROPDATA_PHANDLE dtb tag).
> > >=20
> > > The test pattern used is
> > >   - Generate a dts (xxx.dts.dts) from an input dts
> > >   - Check this generated dts against expected contents
> > >   - Generate a dtb (xxx.dtb) from the same input dts
> > >   - Check this generated dtb against expected contents
> > >   - Generate a dts (xxx.dtb.dts) from the generated dtb
> > >   - Check this generated dts against expected contents
> > >   - Generate a dtb (xxx.dtb.dts.dtb) from the generated dts
> > >   - Check this generated dtb, expect the same contents as for xxx.dtb
> > >=20
> > > Even if only one meta-data feature is currently tested in this tests
> > > introduction, use a loop in order to ease future addition consisting =
in
> > > adding new input dts as soon as new meta-data feature are supported.
> > >=20
> > > Signed-off-by: Herve Codina <herve.codina@bootlin.com> =20
> >=20
> > As noted elsewhere, I'd prefer to see new helper tools for comparing
> > metadata in binary rather than using text comparisons.
>=20
> Right, be ready to see treegen.c growing a lot.
>=20
> Indeed, to compare in binary, I need to generate the expected binary (I d=
on't
> want to store it directly in git).

Sure.

> I already plan to split the treegen.c file in several files. Indeed, with
> unknown "structured" tags, a bunch of expected dtbs (instead to text file=
s)
> are going to be generated.
>=20
> The plan is then to have one .c files per expected dtbs set and so the
> concept of dtbs harnesses.
>=20
> The problem I see here with known meta-data, is that we:
>   1) Need to keep consistency between the dts file (input source use in t=
est)
>      and the treegen source file (which generate the expected dtb).
>=20
>   2) If new meta-data tags are added in the future, treegen source files
>      will need an update. This update will be more complex than looking at
>      expected text files (fdtdump or other), and commiting the new expect=
ed
>      files if the diff is explained.

Hm, only when/if the new tags are required / automatic.

> I've proposed 'fdtanalyze' as a new tool [1] to convert a dtb to a "frien=
dly"
> text file. The output of 'fdtanalyze' could be something like that:
> --- 8< ---
>   (0x1-FDT_BEGIN_NODE): "my_node"
>     (0x3-FDT_PROP): ...
>     (0x3-FDT_PROP): ...
>   (0x2-FDT_END_NODE)
>   ...
>   (0x9-FDT_END)
> --- 8< ---
>=20
> No complex analysis but you don't seem to like it neither.

It's better than relying on fdtdump, but at this point it's just
making a text format that's isomorphic to the binary and I don't see a
lot of point.

> Without fdtanalyze, fdtdump nor other ideas, I will use treegen and
> dtbs_equal_ordered to perform tests.
>=20
> [1] https://lore.kernel.org/all/20260925144003.61f72c0e@bootlin.com/
>=20
> Best regards,
> Herv=E9
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--qGRKqLyeF2vUtYlJ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrlXcoACgkQzQJF27ox
2GdGjQ//e6G/W5rXwEy8Nrf1QNAci5wcd3u6SaRWPCtsAhhv2/dHfRFXN9oeNevp
ZXVfJS+rSfKe8RJggpij1XBnXz9O4R/+IGIfKv0jgi/5OCmktjBcGQRQYKzPId7H
sTde5ygmDQEgnZjHDbAcFE7foLNSoKhJVog50TyQF4di5cQYlZWFKTI6RVF7YrrO
5dX9yHtddNxrZ0XsfVx1eDwd4Q3xDCY2nMWbYWRM6kg8LknHBth7+GJ20IcWmQj+
Dv8yAzNNq63u0BvsYUbE92Hr4WOitySTpe87D1WiqBb0udYCKAGo0mJxCjZZOmpr
QKOIURIPyewHwXGlg5/VArUGG2nf5hkMSSI9PYcchkN4Ar8yS2VPS/hrYXtrJCQM
DzuuG75ZfisrNayD6Mw+hz/JrlRLei6F8gm70jN4cyOYcK+ykc2t9WvKTpyqDzPe
Og3wbDw82P6k/oH74NxBX/aK8yyFpZ/uCLgh7yFJL0bhDYRCpg6+TfAO5k+vWpqp
xbINrUv8XAmHrCdykmyLEKQnq4dhKFUg7j/g/2b6Q+ddDxhdE2E3dNkcdMX3BU6U
agNzeG64XTAcgciRPWCpXLa57XqQ3UX7QHDjiC2+rnDT3oaHqb27IXWPxOq6wYaO
Oj47D2pmjsdV0imDCzm7xNFgHxg7Hyoqw78ooIVyieDIHW0EuyQ=
=wUhV
-----END PGP SIGNATURE-----

--qGRKqLyeF2vUtYlJ--
