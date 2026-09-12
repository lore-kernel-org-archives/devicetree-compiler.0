Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C896E30F924;
	Sat, 12 Sep 2026 02:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789180520; cv=none; b=Bou/ksz8Nu3DsXBdv/n/3y1TLIkoOFnskGAkCQO/kZegCyO2gQF7D1jsRSIX5Dq7Hzu2gNsjLLbFkvfFNvHQmVNOe6dDGJ1mwfJ2NnPTRE2Y8AcyUXx+8cyuzbG9TAsXTBGWR6dR17Fx/Vn32BDXy/Klzc2aGy2nWuLYPWKC+So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789180520; c=relaxed/simple;
	bh=58hgpzwENQEpfFed/j0rymz0+upISqiFSlTfz21KsqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TQvDONqIgqtv9gfsyqqqzwOjNGqmu6VVR9xfWVpF6g3WQkO24PbPmhYYE5oM7WrbyC/mvYxSRJSKS+HJfLQxmFE2/4ka7/R33lu0LBWaWYLSmpolEa/xIExYegPI/Cu4wD5pdIyBeQfJ29coNuEvUcFN4xCvfkgoCkhuDoNWmYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=HDCIdZAB; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="HDCIdZAB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202608; t=1789180502;
	bh=1VVU2RoslZavprNdtO3OLmTE4nNUN2PVsPWOym9AUeo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HDCIdZABOEGaZlRPKgSyNyTM3NUiMBjgwxQNUQo7+hr2r6WSNsbJnKDOYpGnv39Mz
	 c3l+7ln0+pL4rzVj09nBNLyXD1Srm3Hjk+Plg0eoiljYmwPKlRhUMOUhyr9h9RhVzZ
	 0+UX9Wc2zLELjJpL+Ki0KOgVxP6FwtpJ5uk18WwAjykzYZd5vxtMQSdLpkzzB046D6
	 JGvaQb5e8JFE7hllwHbMe+UgkMXwh3Sia3IgYMzU/iL9VNSqhvMnMCB39TOnh5A83U
	 vBp6JZ9KP3HILNYFsU2zdTHuv0KyECVt7q6xJGPpkp+r+KIgJnkzRblTVgKC8xASKa
	 xRsbLhWFMNMZg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4hhb9L4q4qz4wck; Sat, 12 Sep 2026 12:35:02 +1000 (AEST)
Date: Sat, 12 Sep 2026 12:34:24 +1000
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
Message-ID: <aqS6HmkaVYbrePtN@gractus.seuss>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
 <20260826083146.304291-7-herve.codina@bootlin.com>
 <aqI3KnnQnUytqkEc@gractus.seuss>
 <20260910094126.4bf4cae6@bootlin.com>
 <aqJ5OhJcv4k-ZAj8@gractus.seuss>
 <20260911091653.37b22b0f@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aseTNSTGn8BecciZ"
Content-Disposition: inline
In-Reply-To: <20260911091653.37b22b0f@bootlin.com>

--aseTNSTGn8BecciZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 09:16:53AM +0200, Herve Codina wrote:
> Hi David,
>=20
> On Thu, 10 Sep 2026 19:32:48 +1000
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Thu, Sep 10, 2026 at 09:41:26AM +0200, Herve Codina wrote:
> > > Hi David,
> > >=20
> > > On Thu, 10 Sep 2026 14:51:08 +1000
> > > David Gibson <david@gibson.dropbear.id.au> wrote:
> > >  =20
> > > > On Wed, Aug 26, 2026 at 10:31:37AM +0200, Herve Codina wrote: =20
> > > > > The goal of structured tag values is to ease the introduction of =
new
> > > > > tags in future releases with the capability for an already existi=
ng
> > > > > release to ignore those structured tags. In order to do that data=
 length
> > > > > related to the unknown tag needs to be identified.
> > > > >=20
> > > > > Also add a flag to tell an old release if this tag can be simply =
skipped
> > > > > or must lead to an error.   =20
> > > >=20
> > > > I suggested/insisted on this in the past, but I've since realised t=
his
> > > > isn't actually useful.  The "structured tag" format is only useful
> > > > because it allows you to skip over unknown tags, which means there's
> > > > no point using it for ags that can't be skipped.  If we need new ta=
gs
> > > > that can't be safely skipped, they can be added as old-style tags
> > > > instead.
> > > >
> > > > In which case "old style" versus "new style" is no longer a good
> > > > characterization: they would exist side by side, so the distinction=
 is
> > > > more "skippable" versus "non skippable" tags.  Which suggests that
> > > > "skippable tags" or "metadata tags" might be a better term than
> > > > "structured tags" - that would focus more on the why than the how. =
=20
> > >=20
> > > Do you mean that the SKIP_SAFE bit should be removed ? =20
> >=20
> > Yes.
>=20
> So, in that case the term "skippable" tags makes sense.
>=20
> Any non-skippable tag are then defined using the "old style".

Right.  I kind of prefer the term "metadata" *if* it's actually
accurate, but I'm not sure it is.

> The only non-skippable tag that will be introduce later by addons is
> FDT_BEGIN_NODE_REF (patch 51/71 [1]).

Ok.

> Data related to this tag is the symbol name and so a string.
>=20
> Using the "old style" for this tag, I will remove the 32-bit data lengh.
> The next tag will be after the end of string '\0' + potential alignment.
>=20
> This is consistent with "old style" tags which have a string as data. Ind=
edd
> no 32-bit data lengh were present for those "old style" tags.
>=20
> Does it make sense on your side?

Yes, that makes sense.

> [1] https://lore.kernel.org/all/20260826094950.1088288-52-herve.codina@bo=
otlin.com/
>=20
> >=20
> > > I like the defined structure with the DATA_LEN_ENCODING part. Even fo=
r tags
> > > which are not "skippable".
> > >=20
> > > This ensures a kind of standardized format for all future tags instea=
d of a=20
> > > specific definition (related to the length of the data) for each new =
tag. =20
> >=20
> > If we were designing the dtb format from scratch, I'd agree.  But
> > given we already have what we have I think the drawbacks of
> > introducing a second way of doing tags outweighs the benefits.
> >=20
> > > For this kind of information related to the length of data, I prefer =
a global
> > > rule instead of tag-specific rules. =20
> >=20
> > Right, but it can't truly be global, because we have the existing
> > tags.
> >=20
> > > > > Structured tag value is defined on 32bit and is defined as follow:
> > > > >=20
> > > > >   Bits  | 31 | 30        | 29             28 | 27    0|
> > > > >   ------+----+-----------+-------------------+--------+
> > > > >   Fields| 1  | SKIP_SAFE | DATA_LEN_ENCODING | TAG_ID |
> > > > >   ------+----+-----------+-------------------+--------+
> > > > >=20
> > > > > Bit 31 is always set to 1 to identify a structured tag value.
> > > > >=20
> > > > > Bit 30 (SKIP_SAFE) is set to 1 if the tag can be safely ignored w=
hen its
> > > > > TAG_ID value is not a known value (unknown tag). If the SKIP_SAFE=
 bit is
> > > > > set to 0 this tag must not be ignored and an error should be repo=
rted
> > > > > when its TAG_ID value is not a known value (unknown tag).
> > > > >=20
> > > > > Bits 29..28 (DATA_LEN_ENCODING) indicates the length of the data =
related
> > > > > to the tag. Following values are possible:
> > > > >   - 0b00: No data.
> > > > >           The tag is followed by the next tag value.   =20
> > > >=20
> ...=20
> > > > >   - 0b11: Data length encoding
> > > > >           The tag is followed by a cell (u32) indicating the size=
 of the
> > > > >           data. This size is given in bytes. Data are available r=
ight
> > > > >           after this cell.
> > > > >=20
> > > > >           The next tag is available after the data. Padding is pr=
esent
> > > > >           after the data in order to have the next tag aligned on=
 32bits.
> > > > >           This padding is not included in the size of the data.  =
 =20
> > > >=20
> > > > I'm guessing the 1 & 2 cell cases are pretty common so it saves a
> > > > moderate amount of dtb size to have this encoding.  However, it does
> > > > come at the cost of greater code complexity.  Is it worth it?  I'm
> > > > willing to believe it is, but I think the case needs to be made. =
=20
> > >=20
> > > In term of code complexity, FDT_PROPDATA_PHANDLE introduced in the ad=
dons
> > > series, patch 7/74 [0], is a 1-cell (or 1-fdt32) "structured" tag.
> > >=20
> > > It can be compared with FDT_PROPDATA_PHANDLE_REF, introduced in patch=
 11/74 [1].
> > > FDT_PROPDATA_PHANDLE_REF is a "Data length encoding" tag.
> > >=20
> > > Modifications in libfdt/fdt.c are pretty similar for both tags. =20
> >=20
> > Right, it won't be in the case of specific tag handling.  It's the
> > general case skipping that's more complex, because it has to consider
> > both cases.
>=20
> I don't understand. What do you mean ?
>=20
> Current implementation for skipping tags is not so complex.

Not that complex, no, but still more complex than it would be if we
always have the 32-bit length field.

> Do you mean that we should avoid the DATA_LEN_ENCODING and always have the
> 32-bit value right after the tag to give the size for all "skippable" tag=
s?

Yes.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--aseTNSTGn8BecciZ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmqkuh4ACgkQzQJF27ox
2Gfw2Q//b48hjtTO+dVZW3cWnT3DodCs3xdRej7INVymfZ8YxhlzNnT+lXEa0pDo
u3BceRkAVoR6J93k58fB0MbxcS3+BGLUEO0YWV+9R0MndzY+YW1JC4inlABmiCPP
pqfrHsxmhTPa/jCnHLw8H9Jzt0jWzuJaGP81kGnlCClq3CN0hK+R4PRWNn1wNG4w
Daqf3EsmOZo6FnYmM/gkQiHoFBUoYCj9HxLVX2KPJODa9G4BLWJqD0YwpauJbwAo
wgFLtH7iq1Tsy1qHHXGkXLFywQymbMHzxDiOn8zDjXNfw96MKY7rtkReGWK/ehUQ
JpqpdFvmObXJAwhNv4RYGEhvaYS/H3xlR6AIl8FPhtp3D7vMsOfba6i56j4Ub6Dy
KzPtoSChhKK8oAJqAKhFWRHarijkMBQgRrvW768jZF7X07Em0r/Vwx0OkUD61Lmz
Bs8PD/jQ5RGJekjge/YKue6H1V9DbVGhCbvoixRrMSYaM8QXFKEh/3TCQruTAMUo
l7hK6QpC+z0d4H7g4H/QvCb5bSBx3xJb+Eto6KcIvTLCEFaB51S6LswaX+l7BLHx
07jE0JYRICkYU+0wza04FIdyW47EvAp6pb3BK5oV6idzUK52pvvgVSGhG5M3Do9V
BKFrPHlEMCjJNiJY8ThNk038vbuHMYdxHt3aY+eWIlSjDXTVHfA=
=XalL
-----END PGP SIGNATURE-----

--aseTNSTGn8BecciZ--
