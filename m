Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968567FBA2;
	Thu, 29 Jan 2026 02:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769652058; cv=none; b=El5BGnkM1av1vN8UrmbKYT8L7W9IuMZgFZKbZVp4HpQluXUW49w/9Np/IUddVZKFdXFhOWhUo2vTu9CUYFHHdz8fg6s4wYnCrpjHQj4rcbAXzln1qiqH3VvFlXElKFShDymI0M4Jn7ZAv2ecvUEMtS9Pcib4681yZvgRNBM2Hu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769652058; c=relaxed/simple;
	bh=WO2qsE0ILyZ4nWlRhTLRSeROFa52+RLdm6lucpg+rHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E8oV9u4i228rH0pM3YM4gv32FnEfIOZScikxIFWqPWTvbR7i+8WPPbegNov+iY0nH6UXfaN106Ph6sqH34U59KpbQBLPHKu0F/b9MDJ5qkGXV/lZft/9isB28LMTQNGTegmhS7cCEb0EaR93kcWie3Cq69NOrOLmn0v77rbnORo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=vNCulfMT; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="vNCulfMT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202512; t=1769652032;
	bh=Lm9obnO7p+NhvV+EmKLu0TPIt+YP7qYII2qdhjXodhI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vNCulfMTaP/8r5mrZK8Ht3VNimwNTZFdZKqpRdqVbakqe3bQtUjYZslJlSgJ+DK0Y
	 OlDfmz3KA4IwD+8wLKJ5UJg2AxmmpuEhE/vq9ikMlFbq0Awfe6GwKNjqWL++/Fg5uN
	 apZt83pZU6pJf13n+MGTiFc6QKcrPbnPIiar9SzGKjU7tbyXcHD1MWDzg+X6Mgcq3P
	 UYm+ERbX+v61YZX4kY7W4j5XoMQoQ3kD4EdlNRjrzS7AqWgthuCYP1DVJrJ7ShiUYI
	 tZzT9pMX2SqTxZJksb3HrpSe4WVk/KWZjXrw78Mc6ST4YLaenCdHW/RjSCcj6Usg4b
	 0OfWxt8a1azlg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4f1j5r2V5Pz4wDP; Thu, 29 Jan 2026 13:00:32 +1100 (AEDT)
Date: Thu, 29 Jan 2026 12:40:12 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Rob Herring <robh@kernel.org>
Cc: Herve Codina <herve.codina@bootlin.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
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
Message-ID: <aXq6fKUytYzpMQAT@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
 <20260112142009.1006236-3-herve.codina@bootlin.com>
 <aWgxAVfUYMUy9mz1@zatzit>
 <20260116100934.7d522b1a@bootlin.com>
 <aW29fwFEB6_qjVEc@zatzit>
 <CAL_JsqLdKMPYq0q1Tw+8Ts9uD=AZR2HGDF2W9iY6Y=EGg=ujTw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1FEfLb+vw8NAWD2h"
Content-Disposition: inline
In-Reply-To: <CAL_JsqLdKMPYq0q1Tw+8Ts9uD=AZR2HGDF2W9iY6Y=EGg=ujTw@mail.gmail.com>


--1FEfLb+vw8NAWD2h
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2026 at 02:38:45PM -0600, Rob Herring wrote:
> On Sun, Jan 18, 2026 at 11:18=E2=80=AFPM David Gibson
> <david@gibson.dropbear.id.au> wrote:
> >
> > On Fri, Jan 16, 2026 at 10:09:34AM +0100, Herve Codina wrote:
> > > Hi David,
> > >
> > > On Thu, 15 Jan 2026 11:12:49 +1100
> > > David Gibson <david@gibson.dropbear.id.au> wrote:
> > >
> > > > On Mon, Jan 12, 2026 at 03:18:52PM +0100, Herve Codina wrote:
> > > > > This v18 version will add support for
> > > > >  - metadata in device-tree blobs in order to have a better handli=
ng of
> > > > >    phandles and unresolved references.
> > > > >  - Addon device-tree blob (successor of device-tree overlay)
> > > > >  - Import and export symbols feature
> > > > >  - multiple trees in a addon device-tree blob (i.e. root device t=
ree and
> > > > >    orphan node tree)
> > > >
> > > > So, once this patch is applied, the rest of the series pretty much =
has
> > > > to be applied "atomically" - otherwise a version built in the inter=
im
> > > > will be lying in saying that it supports v18.
> > > >
> > > > I therefore suggest moving any changes that *can* be moved before t=
his
> > > > patch, should be moved before this patch.  That will assist in
> > > > reviewing and merging the series piecemeal, rather than as a single
> > > > giant blob.
> > > >
> > > >
> > > > Regarding the content itself.  It seems like this is a pretty major
> > > > change to the dtb format - maybe that would suggest bumping the
> > > > version by more than one (e.g. like we went from v3 to v16 in the
> > > > past).
> > >
> > > I see your point.
> > >
> > > Maybe the Rob's idea related to 'unknown tag' and the suggestion I di=
d [1]
> > > related to the generic tag value definition to support those 'unknown=
 tag'
> > > could help here.
> >
> > Having a standard encoding of tag length so unknown tags can be
> > skipped is a reasonable idea.  I think you do need provision to mark a
> > tag as "safe to ignore" or not - e.g. something like FDT_BEGIN_NODE
> > could never be safely ignored.
> >
> > > As a reminder here, this generic tag value definition consist in:
> > > --- 8< ---
> > > A tag value is on 32bits. We can define the structure of this value.
> > >   - bit 31 (msb):
> > >      - 0: This is not a new kind to tag and so it doesn't follow this=
 definition.
> > >           All existing tags are in this category
> > >      - 1: New kind of tag adopting this definition
> > >
> > >   - bits 30..28:
> > >      tag data length encoding
> > >      0b000: No data related to the tag
> > >      0b001: 1 data cell (u32) directly follows the tag
> > >      0b010: 2 data cells (2 u32) directly follow the tag
> > >      ...
> > >      0b110: 6 data cells (6 u32) directly follow the tag
> > >      0b111: Tag is followed by a cell (u32) indicating the size (in b=
ytes)
> > >             of data available just after this cell (including any pad=
ding
> > >             if needed).
> >
> > I'd suggesting giving a byte length not including alignment padding.
> > That way if you wanted to encode a bytestring in there, you wouldn't
> > need a way of encoding the unpadded length in adddition to the
> > standard way encoding the padded length.
> >
> > >           Because this size include some possible padding, its value =
is a
> > >             multiple of 4 bytes.
> > >             The offset of the tag + 4 + size points to the next tag.
> > >
> > >
> > >   - bit 27..0
> > >      tag specific identifier
> > > --- 8< ---
> > >
> > > I mean dtb version v20 could be:
> > >
> > >  - New header size with dt_flags added in the header (if this new fie=
ld is
> > >    kept).
> > >
> > >  - Support for the generic tag values and so the notion of 'unknown t=
ag'
> > >
> > > With that done, everything else added afterward will have no impact o=
n the
> > > dtb format itself.
> >
> > Well... maybe.  It's not entirely clear to me whether all the new tags
> > can be safely ignored by something that doesn't understand them.
> > e.g. a consumer can't safely ignore the tags which give unresolved
> > phandle references if it then expects the phandle values in the actual
> > property values to be correct.
>=20
> I think we'd want some higher level "this is an addon or base DT" than
> presence of tags. Maybe that's just the version. Perhaps a new header
> field to say this is a base or addon DT. Or both?

I think Herve's flags proposed flags field does that.  I tend to
prefer the idea of using new and different magic numbers for the
variant forms though - makes it really clear that they're a different
thing from a "normal" fdt.

>=20
> Everything in this series intended for the base DT should be safe to
> ignore just as __symbols__ (and __local_fixups__ if you add /plugin/)
> is safe to ignore.

That kind of depends what you're doing with the DT.  If you need to do
phandle lookups, you can't safely ignore the fixups.

> It's only software that understands and wants to
> use the new "addons" that needs to understand.
>=20
> Rob
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--1FEfLb+vw8NAWD2h
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAml6unwACgkQzQJF27ox
2GdmSw/5AW8iC48H1xchqCaR6Zhi2KtjEp0kEzZJdnEzWPP/wDXuqKRfjK4Nd42I
XQ1REscNGpoejfhR5DXw3KCVuftobWF90wn+h3WGfux25JIU2R5ZSYDkXDYuoOLt
ku2YOzWZpGtDnM7BAna2W/08pRkYXI5yArwrJuM7aKGnZ0yxvJc5dnF5ZFEaMmDr
g/6DZOneROTU3StuW7laOqEWZfHjgLDV2duLwe4CI+TyCjMA2sHQprDaKDtHq4AW
ZW1kx2Lc6ZBlkLkXrLGOaTkcDfIn5RYCr8fKkL1kMvDFFPCcUOUIM225Cr1VsvMT
XLYXQWIh4kVKMSiwMNAtcEprBQl4HzxwrrHltXMT7vHvwM/74EASqaxAUio5BtIn
EjeBYmnpdgrp2qX1L3O7/zKxl1uZ8+4BXKwl7iwP9lmTuh/40jJKQdLkPJCbcfYO
L/HZufTpzBUDyc5/vFowONhoh6gZdSBuzjo4SJlGaVTXVtNbxeLsq9Kw+9uIc35T
eMjUeYJ9CELLw9+WUlvJSRZ87ANOOIML069F9Tcgo5Ep2Xd5IXLvxUBgpiFjM3AB
XvsDoWIatSIGr4wRotYoEwO2RoRZvyYsY5EbXs4Abjs7oUV1+xfhsVwjZUQ+o6zO
A8wsVFI9Vkq8a4ar/mAICpb73EcEbqjkf+v2mH0NjKv4DZYZncw=
=z+Rj
-----END PGP SIGNATURE-----

--1FEfLb+vw8NAWD2h--
