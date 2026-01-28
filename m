Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFE226FD9A;
	Wed, 28 Jan 2026 01:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769564996; cv=none; b=Sym2wQ3KllmHUa2QSH98LDYTDtLn10MXJb3YXL3pvIAHhSkSkS/lWMHQFGXflr3HwHrdtHUJYm+T8/IQ4JwDQcoey57+Om1OGBeEhlzOPkCl9ccmxxW63nmUdDU2xYl80UGC8Xfpqf0V4vAUBCq+Y4nmAOIjMayVxNtG02z5FDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769564996; c=relaxed/simple;
	bh=QUUAD7GQaZQbu5qThrgsR1BafMKAHz+6iqDj4V7+FuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hc07mLR4JexReheIHKGFXodBndf7vGUHg/S0ps6k7/tYlUXnmb0i/oS9Zr1+D724xjG58l7RmrDrUiL782b6ZE/FJNkiFIdmseTA3XnbzKKYJGz3rvTatFcJp4WqMJJFPuTGVmEPAIWoWo4ETnUwHkGcjP9QQRukP41ep8fi2i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=ad9Pt75H; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="ad9Pt75H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202512; t=1769564985;
	bh=PNOdLeY4VZFi4fskiltepKXu67qHHPmgG1x+z+EYgRg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ad9Pt75HQiOi1zP2pxtuWZdi1xyaC9m7I6apRc9RktngLE/8XgGadjVa1tuH1xBT2
	 7+5OIjynVEhAHJUQ/yoFUrCUK2OEy79HOAl3+KaFArtbxen8n/gBMzoKci1Xpjsm+K
	 zhrX1vQQQDdxvxq8EPm5zl4tRvcVjF+5Uypck8WQ5zqg4YrFJRaZkxFjs97srNIEq4
	 fXkW8IMRa1wRQKG8yfW+OYTAw/BvlS0mDLHbvZpN6voasLmAQf7cj2A7xMV/SpHn/E
	 OEMok9xAEW+YgbTZqnLe00pjbSLLba9J/gr8114bvdfaUY80A9RXwfL1EJPaVq6G1O
	 RnlxnMxmr6IIA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4f14vs3skMz4wDm; Wed, 28 Jan 2026 12:49:45 +1100 (AEDT)
Date: Wed, 28 Jan 2026 12:49:41 +1100
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
Message-ID: <aXlrNfLo1HejLspB@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
 <20260112142009.1006236-3-herve.codina@bootlin.com>
 <aWgxAVfUYMUy9mz1@zatzit>
 <20260116100934.7d522b1a@bootlin.com>
 <aW29fwFEB6_qjVEc@zatzit>
 <20260119104852.3e7043ee@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kr9h6MeMDqcAzZN7"
Content-Disposition: inline
In-Reply-To: <20260119104852.3e7043ee@bootlin.com>


--kr9h6MeMDqcAzZN7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2026 at 10:48:52AM +0100, Herve Codina wrote:
> On Mon, 19 Jan 2026 16:13:35 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Fri, Jan 16, 2026 at 10:09:34AM +0100, Herve Codina wrote:
> > > Hi David,
> > >=20
> > > On Thu, 15 Jan 2026 11:12:49 +1100
> > > David Gibson <david@gibson.dropbear.id.au> wrote:
> > >  =20
> > > > On Mon, Jan 12, 2026 at 03:18:52PM +0100, Herve Codina wrote: =20
> > > > > This v18 version will add support for
> > > > >  - metadata in device-tree blobs in order to have a better handli=
ng of
> > > > >    phandles and unresolved references.
> > > > >  - Addon device-tree blob (successor of device-tree overlay)
> > > > >  - Import and export symbols feature
> > > > >  - multiple trees in a addon device-tree blob (i.e. root device t=
ree and
> > > > >    orphan node tree)   =20
> > > >=20
> > > > So, once this patch is applied, the rest of the series pretty much =
has
> > > > to be applied "atomically" - otherwise a version built in the inter=
im
> > > > will be lying in saying that it supports v18.
> > > >=20
> > > > I therefore suggest moving any changes that *can* be moved before t=
his
> > > > patch, should be moved before this patch.  That will assist in
> > > > reviewing and merging the series piecemeal, rather than as a single
> > > > giant blob.
> > > >=20
> > > >=20
> > > > Regarding the content itself.  It seems like this is a pretty major
> > > > change to the dtb format - maybe that would suggest bumping the
> > > > version by more than one (e.g. like we went from v3 to v16 in the
> > > > past). =20
> > >=20
> > > I see your point.
> > >=20
> > > Maybe the Rob's idea related to 'unknown tag' and the suggestion I di=
d [1]
> > > related to the generic tag value definition to support those 'unknown=
 tag'
> > > could help here. =20
> >=20
> > Having a standard encoding of tag length so unknown tags can be
> > skipped is a reasonable idea.  I think you do need provision to mark a
> > tag as "safe to ignore" or not - e.g. something like FDT_BEGIN_NODE
> > could never be safely ignored.
>=20
> A bit can be used for marking a tag as "safe to ignore if unknown".
> I can reduce the bits 30..28 field.
>=20
> bit 30:
>  - 0b0: Do not ignore this tag if the tag id is unknown.
>         If this tag id is unknown an error in the parsing should be repor=
ted.
>  - 0b1: This tag can be safely ignore if its id is unknown. I that case t=
he
>         tag and its related data are simply skipped.
>=20
> bits 29..28:
>  - 0b00: No data
>  - 0b01: tag followed by 1 cell (u32) data
>  - 0b10: tag followed by 2 cells (2 x u32) data
>  - 0b11: Tag is followed by a cell (u32) indicating the size of following
>          data
>=20
> Also, it is worth noting that the 0x0....... tag value family can still be
> used.

Actually, that's a good point.  We can do this more simply: the new
ranges with defined lengths are only used for ignorable tags.  If we
need to add new tags which aren't safe to ignore, they go in the 0x0
range, like the existing tags.

> Even if related to "old" tags, if a tag in this family is an unknwown tag,
> the parser will report an error (at least because it doesn't know how to
> skip the data part).
>=20
> >=20
> > > As a reminder here, this generic tag value definition consist in:
> > > --- 8< ---
> > > A tag value is on 32bits. We can define the structure of this value.
> > >   - bit 31 (msb):
> > >      - 0: This is not a new kind to tag and so it doesn't follow this=
 definition.
> > >           All existing tags are in this category
> > >      - 1: New kind of tag adopting this definition
> > >=20
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
> > >             if needed). =20
> >=20
> > I'd suggesting giving a byte length not including alignment padding.
> > That way if you wanted to encode a bytestring in there, you wouldn't
> > need a way of encoding the unpadded length in adddition to the
> > standard way encoding the padded length.
>=20
> And so, next tag is always length + sizeof(padding). Next tag is aligned
> on 32bits.

Exactly.  Or to make it clearer that we don't need any additional
information, next tag is at ALIGN_UP(length, FDT_TAG_SIZE).  We
already do something like this with with FDT_BEGIN_NODE tags - we
ignore bytes to realign after the node name string.

> > > 	    Because this size include some possible padding, its value is a
> > >             multiple of 4 bytes.
> > >             The offset of the tag + 4 + size points to the next tag.
> > >          =20
> > >=20
> > >   - bit 27..0
> > >      tag specific identifier
> > > --- 8< ---
> > >=20
> > > I mean dtb version v20 could be:
> > >=20
> > >  - New header size with dt_flags added in the header (if this new fie=
ld is
> > >    kept).
> > >=20
> > >  - Support for the generic tag values and so the notion of 'unknown t=
ag'
> > >=20
> > > With that done, everything else added afterward will have no impact o=
n the
> > > dtb format itself. =20
> >=20
> > Well... maybe.  It's not entirely clear to me whether all the new tags
> > can be safely ignored by something that doesn't understand them.
> > e.g. a consumer can't safely ignore the tags which give unresolved
> > phandle references if it then expects the phandle values in the actual
> > property values to be correct.
>=20
> I would say that it depends on new (future) tags.

Certainly.

> For instance, FDT_EXPORT_SYM, the tag used for exported symbols can be ig=
nore
> by the bootloader if it doesn't know about this tag.
> Indeed, it doesn't need to understand and manipulate this tag. It just ne=
eds to
> keep it in the dtb passed to the kernel.

Ow, that's when it gets complicated.  Whether a tag is safely
ignorable depends on what the consumer is doing with it.  Fixups and
exports can be safely ignored by something just passing it through.
However reference fixups *can't* be safely ignored by something that
will consult phandles, because they might not be correct until the
fixups are applied.

> > > Only libfdt and dtc will have versions defined at some point with sup=
port for
> > > some new flags or new keyword.
> > >=20
> > > What do you think about this v20 dtb version?
> > >  =20
> > > >=20
> > > > It would also be nice to have some docs for the new dtb extensions
> > > > before or at the same time as this. =20
> > >=20
> > > Yes, the generic tag value definition. =20
> >=20
> > We'd want that, but it's not enough.  The specific tag types should be
> > documented as well.
>=20
> Yes they will be documented as soon as they are introduced.
>=20
> The generic tag value definition is the first step to have in docs to all=
ow
> the "skip if unknown" feature.
>=20
> Best regards,
> Herv=E9
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--kr9h6MeMDqcAzZN7
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAml5azQACgkQzQJF27ox
2Gd73A/+IQXr8NNWRqRkk07D6kuHG58FD/5bGh+zv60pygPqc20H4JSb9Advl9ik
1cE+2GPbG4eBT7M24T0qOE51Exe+ZWFUFHPYXIAaQ5WWsKRJ5Ktg5pTEPXqP/wFN
nbG6OSGH/I5ELrT8E0JGD98sRkkgak1dzUBx1atW3jL+MnSJs9tOQOuUfKn6PedM
FZLpXELHQbYCm0hZq1EhiuhaTELZe4PZ3776XO2oAtCRAFiKtbC82l9f8AgR4IIM
dpB70/ATZcVGBQKZ8acnLZXoaRbT6K3H6wcldTU76Ob87vdqp6bw2kb0H6AXZnbU
yZGG8C9F40K0BuUaMI8lsuPTGBjue6D8xyhqlD2V+kapelBl5Y7KOz70a2MCG9gF
F7h0jM3oEL2hFQXaGr4IWmNqNMCJPh91IM+F/xpaNmyl9DUqpCgm0qRXHXqk4XrS
NSLER/CUs2napL+mOjkPQtZ9jua343slOzXDEWX0VT32lMoXNsW81B+m2aZRogWQ
ILatme/lS++GIMfgw8pgo0RtbPV8PCXwx+eXHyZLQl7Vp6rboSfjNIwh2KfDEfMV
SrNA54u+9qy8QOqHMmAQ5iGQKUGyeQqSTPbfQ4iJzF4fAk5VX2eDduAtHtAA6Ccc
ZOVYB/vh44bSg/p6KQFpP0s6BCK/sZfh88DcCP2Lh8+i0xjbWv0=
=jnme
-----END PGP SIGNATURE-----

--kr9h6MeMDqcAzZN7--
