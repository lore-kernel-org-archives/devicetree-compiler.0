Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9CE275864;
	Mon, 19 Jan 2026 05:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768799937; cv=none; b=K4u+oQv9z+T6LE+RbAM9lvqe1z5x66PvGDbrO18qB9RmbWv5LrSMvzpWFnLQffIwUzLEoTKOm8oATL9SCr7hltyKFtCEQdV2LbyVlF2E/Fnl2Ic5vEjp7cvQlswqDeJPmezs12hil3Fgg/HcJaQl5N8TPh+m98uOaexk7uRZ6OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768799937; c=relaxed/simple;
	bh=I3VNLjG1hoEguetCI6FCtBYlzFk90AUZ5WIkWWbOjfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jC3wzQ+CHclQ9MK3jhmZnPQDDgEn/VFilmGcb/t1iIamBIfzv95Er3oMCy2WXobcWa5T1nIuD4gYzVPHnq5S9FH2jni7/FZlBwroJ1xEFV2iuNnFkLYYAU6uyjCSVEwW1I9ph4vSm71ytG9hsp3Ggh49I7uM1rw930a6CXMlCM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=mTIuIT5K; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="mTIuIT5K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202512; t=1768799927;
	bh=iu/YkGehEqTOAy1N3JAEWGC8gY1+DGEtq/Uwl9JRGv0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mTIuIT5Kj1jRysQS/+Otzn85IQBHD1bow21V63NgDsAbjSrJIhx9bycBiUY9X5v3B
	 y9d80RFN5lXeRZvx8/Nxs/KBuvurXcNpqSemjC6ScfYUQYMldThySbPnlZGMT9OxRR
	 h+WSXpdLUw/Qfki6nLG8WDwWGIQJ/s0QSO4M7gAiAmujbw/Y82XPd33Dg/f19Rsbr0
	 3uo0jFSN34iNCiUgHomOks2thZuCHvkBXQ4RvQYi2VlXhvFx0IwBTq8aCaRDZ7wqvK
	 grxOvMDh2oR78l5WRux5kYGy+252wHoEoHZTMdCmQmqj3xDIdlACwki2EaO5F3r1nU
	 LX5ByITz4XofQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4dvdzC0kwjz4wCG; Mon, 19 Jan 2026 16:18:47 +1100 (AEDT)
Date: Mon, 19 Jan 2026 16:13:35 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ayush Singh <ayush@beagleboard.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree-compiler@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree-spec@vger.kernel.org,
	Hui Pu <hui.pu@gehealthcare.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH 02/77] Introduce v18 dtb version
Message-ID: <aW29fwFEB6_qjVEc@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
 <20260112142009.1006236-3-herve.codina@bootlin.com>
 <aWgxAVfUYMUy9mz1@zatzit>
 <20260116100934.7d522b1a@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7vSweujQn3F8quAh"
Content-Disposition: inline
In-Reply-To: <20260116100934.7d522b1a@bootlin.com>


--7vSweujQn3F8quAh
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 16, 2026 at 10:09:34AM +0100, Herve Codina wrote:
> Hi David,
>=20
> On Thu, 15 Jan 2026 11:12:49 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Mon, Jan 12, 2026 at 03:18:52PM +0100, Herve Codina wrote:
> > > This v18 version will add support for
> > >  - metadata in device-tree blobs in order to have a better handling of
> > >    phandles and unresolved references.
> > >  - Addon device-tree blob (successor of device-tree overlay)
> > >  - Import and export symbols feature
> > >  - multiple trees in a addon device-tree blob (i.e. root device tree =
and
> > >    orphan node tree) =20
> >=20
> > So, once this patch is applied, the rest of the series pretty much has
> > to be applied "atomically" - otherwise a version built in the interim
> > will be lying in saying that it supports v18.
> >=20
> > I therefore suggest moving any changes that *can* be moved before this
> > patch, should be moved before this patch.  That will assist in
> > reviewing and merging the series piecemeal, rather than as a single
> > giant blob.
> >=20
> >=20
> > Regarding the content itself.  It seems like this is a pretty major
> > change to the dtb format - maybe that would suggest bumping the
> > version by more than one (e.g. like we went from v3 to v16 in the
> > past).
>=20
> I see your point.
>=20
> Maybe the Rob's idea related to 'unknown tag' and the suggestion I did [1]
> related to the generic tag value definition to support those 'unknown tag'
> could help here.

Having a standard encoding of tag length so unknown tags can be
skipped is a reasonable idea.  I think you do need provision to mark a
tag as "safe to ignore" or not - e.g. something like FDT_BEGIN_NODE
could never be safely ignored.

> As a reminder here, this generic tag value definition consist in:
> --- 8< ---
> A tag value is on 32bits. We can define the structure of this value.
>   - bit 31 (msb):
>      - 0: This is not a new kind to tag and so it doesn't follow this def=
inition.
>           All existing tags are in this category
>      - 1: New kind of tag adopting this definition
>=20
>   - bits 30..28:
>      tag data length encoding
>      0b000: No data related to the tag
>      0b001: 1 data cell (u32) directly follows the tag
>      0b010: 2 data cells (2 u32) directly follow the tag
>      ...
>      0b110: 6 data cells (6 u32) directly follow the tag
>      0b111: Tag is followed by a cell (u32) indicating the size (in bytes)
>             of data available just after this cell (including any padding
>             if needed).

I'd suggesting giving a byte length not including alignment padding.
That way if you wanted to encode a bytestring in there, you wouldn't
need a way of encoding the unpadded length in adddition to the
standard way encoding the padded length.

> 	    Because this size include some possible padding, its value is a
>             multiple of 4 bytes.
>             The offset of the tag + 4 + size points to the next tag.
>          =20
>=20
>   - bit 27..0
>      tag specific identifier
> --- 8< ---
>=20
> I mean dtb version v20 could be:
>=20
>  - New header size with dt_flags added in the header (if this new field is
>    kept).
>=20
>  - Support for the generic tag values and so the notion of 'unknown tag'
>=20
> With that done, everything else added afterward will have no impact on the
> dtb format itself.

Well... maybe.  It's not entirely clear to me whether all the new tags
can be safely ignored by something that doesn't understand them.
e.g. a consumer can't safely ignore the tags which give unresolved
phandle references if it then expects the phandle values in the actual
property values to be correct.
>=20
> Only libfdt and dtc will have versions defined at some point with support=
 for
> some new flags or new keyword.
>=20
> What do you think about this v20 dtb version?
>=20
> >=20
> > It would also be nice to have some docs for the new dtb extensions
> > before or at the same time as this.
>=20
> Yes, the generic tag value definition.

We'd want that, but it's not enough.  The specific tag types should be
documented as well.

>=20
>=20
> [1] https://lore.kernel.org/all/20260114171822.2a44d2a5@bootlin.com/
>=20
> Best regards
> Herv=E9
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--7vSweujQn3F8quAh
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmltvX4ACgkQzQJF27ox
2GcRLA/+J8npN1Eyj2g9S9mfYZB4XVACwYw5P6QjxTs4RfqBhniemgziJ2yIiwTq
rOctVHo2SCeHEtWH7TLiL3bIZ0TwtlL+HPdV6FWugwtSnsGsXYgvE6tIIgon5HIP
zqxk+BxcC42dNkkKzE/j5Ia6rUYFBuwEefPtL2GrvI0kg8zYgjQHaITDIDFjWg08
yYE+JMonzI25F4eWo1huaB2x7WLaqKmtFZkvpQsrU7d1BsChb5u6iX5HPCDHj23I
QYFyR6qwtYMOfAhU8WFsGpv7JdgGyEdp6ONTA2hxqmpL/dlIATFh7FSDE0yHWR7F
gF0ZS720MXkCoDnNCgB88AlumXuKBG6UZQeioP/feX27UARQ91DNaBWAoaxGuOuN
R44HeOw8UdGBS2HgecGXGcTjk85ybSzrTrTiBEooBFw6OCZu6HfQi+YmBptT1On2
AieRLNoSVoLvnyrMmMrPRhqhj2fTdsd6UJ40D1cpT+OYxw3HVEBGQD/weezq+uWy
rqjsyR3RoRfVeiQJBCjek9hKVxrbgHReexvSIbeXKuv/xwv/tCdAyFRtxThJ4o6d
R4JT0+tn71cKtt5YZFP/uHO2m7LZd3HafG6vlBDNcNUHQf63eIn7ysY/ukkkmArZ
sihE7+1qcPNdjIDCS+0qC//dN7oGaKGcK3/yKGSzTB/Yrp2MlAs=
=ccDv
-----END PGP SIGNATURE-----

--7vSweujQn3F8quAh--
