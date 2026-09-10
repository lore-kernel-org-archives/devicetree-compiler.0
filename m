Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC81C3C4565;
	Thu, 10 Sep 2026 09:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789033323; cv=none; b=oUZzPAcLPK1MQ+opvN1cmeeLXRHujAlfVap/QfCrYPAmqe5otnVwuiBeQTMAInD1snuX0xGFodi5+1H57ALC0AlU5HgSSdOjSfNfTwWhsqDaeqO0WYkfulZzHSHHifVk09PNQajAqJ14m5j1RMBh9pMFfNb4hbYjBbvPMuIbf14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789033323; c=relaxed/simple;
	bh=OnJ09alaSIisWhcs5j7e4NvvBcazwq/cWXqI4AcAqy0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FhL0wbsrA+JlWAma4RXdpYN79dubhiU3AVHL2EkKUY/NQJL6GIavQUY8o1HX+f9HD0vsj5dC6WqdMGNkYfyEf/ZsMEBhfmrwl5gI4O18pOZgB8Wj/tVEn4GQo94Trocld14Dq4jBM38TUSvknMPgBEiXvqVv5S9zSp6xvxL+TzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=vdwNwco2; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="vdwNwco2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202608; t=1789033308;
	bh=zMjkhbncp6LyIqGxo0HFVjMieCcXve2PuU2kt24mtXU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vdwNwco2xWX1wwGekqrep4iN7r034aHOC5WBLqQHxDnZ8yI5R4qBidwTaF2wCNSba
	 ox9Q1tOggxX3LlkinM4QBHFqp0cdiiMYa6PB6+VCWJizWcZWYR57gegK1gQjBI/gxf
	 THtNzB4CId+osu6H/Z4pLpuNzMB3YxLPvZOVZaP8ptf+Xeb+9TTjhz/9Nv/99Op9Z5
	 2gLzjZu2yAfTLC8ahd4Kpj0MZDsN0k6vm6bsZaC0qutwuDXup4DQP3/fmyXQAeM3Bo
	 u5PrTIxvWHot5emnsaGtUD0sQbsGaxk18YXeS4PSyYx6OOkyRnIRs8ViDaTbKhdYbQ
	 On8A5+fsgDgOQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4hgXkh3XTnz4wSy; Thu, 10 Sep 2026 19:41:48 +1000 (AEST)
Date: Thu, 10 Sep 2026 19:32:48 +1000
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
Subject: Re: [PATCH v3 06/15] Introduce structured tag value definition
Message-ID: <aqJ5OhJcv4k-ZAj8@gractus.seuss>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
 <20260826083146.304291-7-herve.codina@bootlin.com>
 <aqI3KnnQnUytqkEc@gractus.seuss>
 <20260910094126.4bf4cae6@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7WUdZpUtE0ue46nT"
Content-Disposition: inline
In-Reply-To: <20260910094126.4bf4cae6@bootlin.com>

--7WUdZpUtE0ue46nT
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 09:41:26AM +0200, Herve Codina wrote:
> Hi David,
>=20
> On Thu, 10 Sep 2026 14:51:08 +1000
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Wed, Aug 26, 2026 at 10:31:37AM +0200, Herve Codina wrote:
> > > The goal of structured tag values is to ease the introduction of new
> > > tags in future releases with the capability for an already existing
> > > release to ignore those structured tags. In order to do that data len=
gth
> > > related to the unknown tag needs to be identified.
> > >=20
> > > Also add a flag to tell an old release if this tag can be simply skip=
ped
> > > or must lead to an error. =20
> >=20
> > I suggested/insisted on this in the past, but I've since realised this
> > isn't actually useful.  The "structured tag" format is only useful
> > because it allows you to skip over unknown tags, which means there's
> > no point using it for ags that can't be skipped.  If we need new tags
> > that can't be safely skipped, they can be added as old-style tags
> > instead.
> >
> > In which case "old style" versus "new style" is no longer a good
> > characterization: they would exist side by side, so the distinction is
> > more "skippable" versus "non skippable" tags.  Which suggests that
> > "skippable tags" or "metadata tags" might be a better term than
> > "structured tags" - that would focus more on the why than the how.
>=20
> Do you mean that the SKIP_SAFE bit should be removed ?

Yes.

> I like the defined structure with the DATA_LEN_ENCODING part. Even for ta=
gs
> which are not "skippable".
>=20
> This ensures a kind of standardized format for all future tags instead of=
 a=20
> specific definition (related to the length of the data) for each new tag.

If we were designing the dtb format from scratch, I'd agree.  But
given we already have what we have I think the drawbacks of
introducing a second way of doing tags outweighs the benefits.

> For this kind of information related to the length of data, I prefer a gl=
obal
> rule instead of tag-specific rules.

Right, but it can't truly be global, because we have the existing
tags.

> > > Structured tag value is defined on 32bit and is defined as follow:
> > >=20
> > >   Bits  | 31 | 30        | 29             28 | 27    0|
> > >   ------+----+-----------+-------------------+--------+
> > >   Fields| 1  | SKIP_SAFE | DATA_LEN_ENCODING | TAG_ID |
> > >   ------+----+-----------+-------------------+--------+
> > >=20
> > > Bit 31 is always set to 1 to identify a structured tag value.
> > >=20
> > > Bit 30 (SKIP_SAFE) is set to 1 if the tag can be safely ignored when =
its
> > > TAG_ID value is not a known value (unknown tag). If the SKIP_SAFE bit=
 is
> > > set to 0 this tag must not be ignored and an error should be reported
> > > when its TAG_ID value is not a known value (unknown tag).
> > >=20
> > > Bits 29..28 (DATA_LEN_ENCODING) indicates the length of the data rela=
ted
> > > to the tag. Following values are possible:
> > >   - 0b00: No data.
> > >           The tag is followed by the next tag value. =20
> >=20
> > I think "next tag." would be clearer than "next tag value." - "next
> > tag value" could be confused as meaning the data that comes after the
> > tag.
>=20
> Ok, will be updated.
>=20
> >=20
> > >   - 0b01: 1 cell data
> > >           The tag is followed by a 1 cell (u32) data. The next tag is
> > >           available after this cell. =20
> >=20
> > Remove "available", it doesn't add any information.
>=20
> Ok, will be updated.
>=20
> >=20
> > >   - 0b10: 2 cells data
> > >           The tag is followed by a 2 cells (2 * u32) data. The next t=
ag
> > >           is available after those two cells. =20
> >=20
> > Ditto.
>=20
> Will be update as well.
>=20
> >=20
> > >   - 0b11: Data length encoding
> > >           The tag is followed by a cell (u32) indicating the size of =
the
> > >           data. This size is given in bytes. Data are available right
> > >           after this cell.
> > >=20
> > >           The next tag is available after the data. Padding is present
> > >           after the data in order to have the next tag aligned on 32b=
its.
> > >           This padding is not included in the size of the data. =20
> >=20
> > I'm guessing the 1 & 2 cell cases are pretty common so it saves a
> > moderate amount of dtb size to have this encoding.  However, it does
> > come at the cost of greater code complexity.  Is it worth it?  I'm
> > willing to believe it is, but I think the case needs to be made.
>=20
> In term of code complexity, FDT_PROPDATA_PHANDLE introduced in the addons
> series, patch 7/74 [0], is a 1-cell (or 1-fdt32) "structured" tag.
>=20
> It can be compared with FDT_PROPDATA_PHANDLE_REF, introduced in patch 11/=
74 [1].
> FDT_PROPDATA_PHANDLE_REF is a "Data length encoding" tag.
>=20
> Modifications in libfdt/fdt.c are pretty similar for both tags.

Right, it won't be in the case of specific tag handling.  It's the
general case skipping that's more complex, because it has to consider
both cases.

> [0] https://lore.kernel.org/all/20260826094950.1088288-8-herve.codina@boo=
tlin.com/
> [1] https://lore.kernel.org/all/20260826094950.1088288-12-herve.codina@bo=
otlin.com/
>=20
> >=20
> > I'd also avoid the term "cell" here.  To me a "cell" is specifically a
> > term applying to a 32-bit value _within a device tree property_.
> > These are 32-bits, but not part of a property.  Plus if Segher
> > reappears, he'll complain that in the old days of OF, a cell wasn't
> > necessarily 32-bits :).
>=20
> ok, I will avoid the term "cell" in the next iteration.
>=20
> >=20
> > > Bits 27..0 (TAG_ID) is the tag identifier defining a specific tag.
> > >=20
> > > Introduce the structured tag values definition and some specific tags
> > > reserved for tests based on this structure definition.
> > >=20
> > > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > >  libfdt/fdt.h | 23 +++++++++++++++++++++++
> > >  1 file changed, 23 insertions(+)
> > >=20
> > > diff --git a/libfdt/fdt.h b/libfdt/fdt.h
> > > index a07abfcc..f41a355f 100644
> > > --- a/libfdt/fdt.h
> > > +++ b/libfdt/fdt.h
> > > @@ -49,6 +49,7 @@ struct fdt_property {
> > > =20
> > >  #define FDT_MAGIC	0xd00dfeed	/* 4: version, 4: total size */
> > >  #define FDT_TAGSIZE	sizeof(fdt32_t)
> > > +#define FDT_CELLSIZE	sizeof(fdt32_t) =20
> >=20
> > I'd avoid creating this constant for similar reasons to avoid the term
> > "cell" above.
>=20
> Ok, I will avoid the constant and use sizeof(fdt32_t) directly when needed
> in the code.
>=20
> Also, I will avoid the CELL in all other part of this file.
>=20
> Best regards,
> Herv=E9
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--7WUdZpUtE0ue46nT
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmqieToACgkQzQJF27ox
2Gce8xAAnGtqrxmwNkUlUVB9kExadHjeusIfgnJtoQ83YZ1AFWpCOQ9pfvXv356U
5uwdIpYVxim66UPqSWsP9TxTYRaoOLLsCFy4xot1qfaKT5LIlx3wfOITVYzJGEdP
L71d57tuWaHck4IpMWmRYGJMIYoD8087habUyOSMRRT+7s/9Q0XbFyKoIpxwwc1j
mJ7IhucaN2UyLx/H69GDamnVcew2m0sSEu5a9Uk8LUQ2aqCrQV9DtGUjIlhn1/0R
HuLQSfNt/OZl/oZaNo7NxXak03GVwICn+jsBQIWk0YAIZ2kZuKvg6DlCjrKT32k6
KHrrjQXbiUSvZDZRQa8jRHHWamFjH77DhCUQnYGjRaGB2Dwzj28odCS9g6kqG4lV
0VpHVuXAuSTO7hZby8FLo2lPBwZIxZE3nWT+Ao/qzVnJTS825LqDFaqf96O78k16
SC4X3IDS8jeZ0BZqAmgXDVwEAjNkDBsBB/7KE8fxMJGOxJXRCw2y1U6P7G6KxF09
vjKtzua6/5DtHN172JsoyK+uAKdOReKIZY+SjLPkZgkgCT9WK6PXuns+U4unNFZS
hzM4bcgMextV8sb08YFDyJMUMxVa07easC+GfKleu3qv/qovEea5rJSN2eYE/XQf
NGTfh8U9M3yTSepTJGWD5PLmTKwFKv2odmq9ugMaFvEwC5la4Ac=
=Fa9x
-----END PGP SIGNATURE-----

--7WUdZpUtE0ue46nT--
