Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA73F471CF6;
	Tue,  1 Sep 2026 08:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788249805; cv=none; b=pM26195Ty0ra8O1S49iS8OaY2oQ6QMslaklKAcpkvHqOpbMbKkOchfj61lo/jxrT5pHe5G8K2tOWw11XJ2Fxyl+0JLVeQC0d+hCI5VLGDV9MuvM/yGD4baUQB1KkN69FHLutsoCyVFqpDlkHmUAA7pacj4HlmLUeLnWwvaM7GQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788249805; c=relaxed/simple;
	bh=1npqyFXM9hvwsfmL9m1R+We1kw727Ndlba9ZMHeWWrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J4dSjcBDagjm/IHuCiUFxL149cr0r0NUXRnYFmlzdDFA2PTImZpT2C4THi5i6MFksl1z5DdIEbE9j1ANxsSPqUJhAX0cEfahPlN/FHD/tdsJw/5GDeRTmvbhAZzVoRY9b4AEk0GqBvdR+1LZ5Kjyd3gG+ZWuS/zilxB7ZgCGdoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=W0AIWiu7; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="W0AIWiu7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202608; t=1788249796;
	bh=KUrdf0hybDa9kX/gTs/UHT0nFC18EkaNJQTs9WetkZo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W0AIWiu766mYJqyoDMp6B2iHwglbuQ9mbAxUf9P6usXpumBc3BGQ1ufttgYc581Rp
	 oedNu8kxCstbOAXkMr66tA9JWWCuPcuPe6c9bDXsDrTZI9Dh8Fxy/TvfAe1lY2lkAD
	 R570dRYN7vwesTAYQUBaMyVPOPtvcaeHE1CVE5/cFasouA/mjWPQ6NmjwMZDj3kE8H
	 3Uw7xhSoggYm7mbdRX8PWn2OZ9TZ4L4zIp8nxX0KYWltzWy8y2eazXqBzNgauZqQ6E
	 0FAFseWdsjfprLkIa1M3ovTbE9PDs6yXRTfuZ7DuBQ48ctf6W4DYF0ggpeC/G9npsi
	 mfjazIDg3vIHQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4hYyz85pZRz4wJq; Tue, 01 Sep 2026 18:03:16 +1000 (AEST)
Date: Tue, 1 Sep 2026 17:42:02 +1000
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
Subject: Re: [PATCH v3 02/15] libfdt: Don't assume the root node is available
 at offset 0
Message-ID: <apaBuQ8kn2bOzYcI@gractus.seuss>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
 <20260826083146.304291-3-herve.codina@bootlin.com>
 <apOhk-NQusFgV5Sx@gractus.seuss>
 <20260831140119.1f14b420@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="g8J7he+hhoL9jjO3"
Content-Disposition: inline
In-Reply-To: <20260831140119.1f14b420@bootlin.com>

--g8J7he+hhoL9jjO3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 02:01:19PM +0200, Herve Codina wrote:
> Hi David,
>=20
> On Sun, 30 Aug 2026 13:21:06 +1000
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> ...
>=20
> > > -int fdt_next_node(const void *fdt, int offset, int *depth)
> > > +int fdt_root_offset(const void *fdt)
> > >  {
> > >  	int nextoffset =3D 0;
> > > +	int offset;
> > > +	uint32_t tag;
> > > +
> > > +	do {
> > > +		offset =3D nextoffset;
> > > +		tag =3D fdt_next_tag(fdt, offset, &nextoffset);
> > > +		switch (tag) {
> > > +		case FDT_END_NODE:
> > > +		case FDT_PROP:
> > > +			return -FDT_ERR_BADSTRUCTURE;
> > > +
> > > +		case FDT_BEGIN_NODE:
> > > +			return offset;
> > > +
> > > +		default:
> > > +			break;
> > > +		}
> > > +	} while (tag !=3D FDT_END);
> > > +
> > > +	return (nextoffset < 0) ? nextoffset : -FDT_ERR_NOTFOUND; =20
> >=20
> > This should be BADSTRUCTURE rather than NOTFOUND: a dtb without a root
> > node is not validly constructed.  (This could matter quite a lot if
> > this error gets propagated up a call chain - a NOTFOUND is usually
> > non-fatal, but BADSTRUCTURE means there's basically nothing that can
> > usefully be done with the dtb, which the caller needs to know as soon
> > as possible).
>=20
> Now yes, a dtb without a root node is an invalid dtb but soon with addon =
this
> will be allowed [1].

Ah, ok.  I haven't looked at the addon stuff yet.  I do intend to, but
it will certainly take a while (70+ patches!).

So, I'm guessing here, but it still seems odd to me that an addon with
no BEGIN_NODE tags at all could be useful.

> addon dtbs will be clearly identified (the dt_flags header field has
> FDT_FLAG_ADDON set for addon dtbs) and so what do you think if the error =
code
> returned depends on this flag.
>=20
> NOTFOUND in case of addon and BADSTRUCTURE otherwise.

I'd need to look at the details of addons to figure out if this makes
sense but I'm not opposed to the approach in principle.

> If you are ok with that, I will update this current patch to return BADST=
RUCTURE
> in all case. Indeed, addon are not yet available.

Right, regardless of where we go with addons eventually, I think it's
preferable to return BADSTRUCTURE for now.  That can be changed once
addons are actually implemented.

>=20
> [1] https://lore.kernel.org/all/20260826094950.1088288-54-herve.codina@bo=
otlin.com/
>=20
> >=20
> > > +}
> > > +
> > > +int fdt_next_node(const void *fdt, int offset, int *depth)
> > > +{
> > > +	int nextoffset =3D offset; =20
> >=20
> > This initialiser should be omitted, since it is now overwritten in
> > every possible case.
>=20
> Yes indeed, will be updated in the next iteration.
>=20
> >=20
> > >  	uint32_t tag;
> > > =20
> > > +	/*
> > > +	 * Get the root node if asked for next node from the root node
> > > +	 * (offset =3D=3D 0) or if the given offset is not valid (negative).
> > > +	 */
> > > +	if (offset <=3D 0) {
> > > +		nextoffset =3D fdt_root_offset(fdt);
> > > +		if (nextoffset < 0)
> > > +			return nextoffset;
> > > +	}
> > > + =20
> >=20
> > The various changes you've made look correct, but I don't love the
> > fact that it requires nearly every function which takes a node offset
> > to be altered non-trivially.  As well as making for a large diff, it
> > strikes me as fragile - a bit of logic that could easily be forgotten
> > on a new function.
> >=20
> > I think we want to move the offset 0 handling into a common helper.
> > Logically that should be fdt_check_node_offset_(), since that's the
> > standard way of validating a node offset parameter.  As you've pointed
> > out, that doesn't work with the current signature/semantics of
> > fdt_check_node_offset_() - but it's a strictly internal function, so
> > we can alter its signature freely.
>=20
> Ok, you insist on this point. I will updade fdt_check_node_offset_() to
> handle the offset 0 case.

Great.

>=20
> >=20
> > >  	if (offset >=3D 0)
> > > -		if ((nextoffset =3D fdt_check_node_offset_(fdt, offset)) < 0)
> > > +		if ((nextoffset =3D fdt_check_node_offset_(fdt, nextoffset)) < 0)
> > >  			return nextoffset;
> > > =20
> > >  	do {
> > > diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> > > index 11f2e2ee..856c62f1 100644
> > > --- a/libfdt/fdt_ro.c
> > > +++ b/libfdt/fdt_ro.c
> > > @@ -231,6 +231,12 @@ int fdt_subnode_offset_namelen(const void *fdt, =
int offset,
> > > =20
> > >  	FDT_RO_PROBE(fdt);
> > > =20
> > > +	if (!offset) {
> > > +		offset =3D fdt_root_offset(fdt);
> > > +		if (offset < 0)
> > > +			return offset;
> > > +	}
> > > +
> > >  	for (depth =3D 0;
> > >  	     (offset >=3D 0) && (depth >=3D 0);
> > >  	     offset =3D fdt_next_node(fdt, offset, &depth))
> > > @@ -253,13 +259,17 @@ int fdt_path_offset_namelen(const void *fdt, co=
nst char *path, int namelen)
> > >  {
> > >  	const char *end =3D path + namelen;
> > >  	const char *p =3D path;
> > > -	int offset =3D 0;
> > > +	int offset;
> > > =20
> > >  	FDT_RO_PROBE(fdt);
> > > =20
> > >  	if (!can_assume(VALID_INPUT) && namelen <=3D 0)
> > >  		return -FDT_ERR_BADPATH;
> > > =20
> > > +	offset =3D fdt_root_offset(fdt);
> > > +	if (offset < 0)
> > > +		return offset;
> > > +
> > >  	/* see if we have an alias */
> > >  	if (*path !=3D '/') {
> > >  		const char *q =3D memchr(path, '/', end - p);
> > > @@ -304,14 +314,24 @@ int fdt_path_offset(const void *fdt, const char=
 *path)
> > > =20
> > >  const char *fdt_get_name(const void *fdt, int nodeoffset, int *len)
> > >  {
> > > -	const struct fdt_node_header *nh =3D fdt_offset_ptr_(fdt, nodeoffse=
t);
> > > +	const struct fdt_node_header *nh;
> > >  	const char *nameptr;
> > >  	int err;
> > > =20
> > > +	if (!nodeoffset) {
> > > +		nodeoffset =3D fdt_root_offset(fdt);
> > > +		if (nodeoffset < 0) {
> > > +			err =3D nodeoffset;
> > > +			goto fail;
> > > +		}
> > > +	}
> > > +
> > > +
> > >  	if (!can_assume(VALID_DTB) && (((err =3D fdt_ro_probe_(fdt)) < 0)
> > >  	    || ((err =3D fdt_check_node_offset_(fdt, nodeoffset)) < 0)))
> > >  			goto fail;
> > > =20
> > > +	nh =3D fdt_offset_ptr_(fdt, nodeoffset);
> > >  	nameptr =3D nh->name;
> > > =20
> > >  	if (!can_assume(LATEST) && fdt_version(fdt) < 0x10) {
> > > @@ -344,6 +364,12 @@ int fdt_first_property_offset(const void *fdt, i=
nt nodeoffset)
> > >  {
> > >  	int offset;
> > > =20
> > > +	if (!nodeoffset) {
> > > +		nodeoffset =3D fdt_root_offset(fdt);
> > > +		if (nodeoffset < 0)
> > > +			return nodeoffset;
> > > +	}
> > > +
> > >  	if ((offset =3D fdt_check_node_offset_(fdt, nodeoffset)) < 0)
> > >  		return offset;
> > > =20
> > > @@ -581,7 +607,7 @@ int fdt_get_path(const void *fdt, int nodeoffset,=
 char *buf, int buflen)
> > >  	if (buflen < 2)
> > >  		return -FDT_ERR_NOSPACE;
> > > =20
> > > -	for (offset =3D 0, depth =3D 0;
> > > +	for (offset =3D fdt_root_offset(fdt), depth =3D 0;
> > >  	     (offset >=3D 0) && (offset <=3D nodeoffset);
> > >  	     offset =3D fdt_next_node(fdt, offset, &depth)) {
> > >  		while (pdepth > depth) {
> > > @@ -619,7 +645,7 @@ int fdt_get_path(const void *fdt, int nodeoffset,=
 char *buf, int buflen)
> > >  	else if (offset =3D=3D -FDT_ERR_BADOFFSET)
> > >  		return -FDT_ERR_BADSTRUCTURE;
> > > =20
> > > -	return offset; /* error from fdt_next_node() */
> > > +	return offset; /* error from fdt_next_node() or fdt_root_offset() */
> > >  }
> > > =20
> > >  int fdt_supernode_atdepth_offset(const void *fdt, int nodeoffset,
> > > @@ -627,13 +653,21 @@ int fdt_supernode_atdepth_offset(const void *fd=
t, int nodeoffset,
> > >  {
> > >  	int offset, depth;
> > >  	int supernodeoffset =3D -FDT_ERR_INTERNAL;
> > > +	int root_offset;
> > > =20
> > >  	FDT_RO_PROBE(fdt);
> > > =20
> > >  	if (supernodedepth < 0)
> > >  		return -FDT_ERR_NOTFOUND;
> > > =20
> > > -	for (offset =3D 0, depth =3D 0;
> > > +	root_offset =3D fdt_root_offset(fdt);
> > > +	if (root_offset < 0)
> > > +		return root_offset;
> > > +
> > > +	if (!nodeoffset)
> > > +		nodeoffset =3D root_offset;
> > > +
> > > +	for (offset =3D root_offset, depth =3D 0; =20
> >=20
> > Do you need this special casing? Won't the fact you've update
> > fdt_next_node() to handle the offset 0 case be enough?
>=20
> The full loop is the following:
> --- 8< ---
> 	for (offset =3D root_offset, depth =3D 0;
> 	     (offset >=3D 0) && (offset <=3D nodeoffset);
> 	     offset =3D fdt_next_node(fdt, offset, &depth)) {
> 		if (depth =3D=3D supernodedepth)
> 			supernodeoffset =3D offset;
>=20
> 		if (offset =3D=3D nodeoffset) {
> 			if (nodedepth)
> 				*nodedepth =3D depth;
>=20
> 			if (supernodedepth > depth)
> 				return -FDT_ERR_NOTFOUND;
> 			else
> 				return supernodeoffset;
> 		}
> 	}
> --- 8< ---
>=20
> The test 'offset =3D=3D nodeoffset' is the problematic one. nodeoffset
> is the parameter passed to the function.
>=20
> I have chosen to avoid offset 0 for the root node and I have updated 'nod=
eoffset'
> previously if it is 0.
>=20
> Even if fdt_next_node() updates 'offset' if it is 0, 'nodeoffset' has als=
o to be
> update if it is 0. Indeed, 'offset' will be updated from 0 to the real ro=
ot node
> offset. In all case to have the test be correct, 'nodeoffset' should be u=
pdated
> to the real root node offset if it is 0.

> Having fdt_next_node() updating 'offset' if it is 0 will not handle all c=
ase.
> When offsets comparison is done, both offsets should consider the real of=
fset of
> the root node instead of the 0 value.

Ah, right.  I missed the fact it was updating the nodeoffset
parameter, rather than the working/starting offset.

> Also the fdt_supernode_atdepth_offset() can be called with 'nodeoffset' s=
et to the
> real root node offset instead of 0. Indeed, fdt_root_offset() is availabl=
e (and
> needed).

Theoretically we could avoid explicitly looking at the root offset for
'offset', by starting 'offset' negative and moving the fdt_next_node()
to the start of the loop body instead of the end.  That would handle
the nodeoffset =3D=3D root_offset case, not not the nodeoffset =3D=3D 0 cas=
e.
Arguably we could disallow the later - finding the non-existent
supernode of something we know at compile time to be the root node
isn't very useful - if it only turned out to be the root node at
runtime, I'd expect it to have come from another function, which
should give us root_offset rather than 0.

But.. it's certainly safer to keep it working whether passed 0 or the
real root offset.  There are other ways we could do it, but I think
they'd turn out equally inelegant.

Ok, makes sense to me.

> My feeling was that it is less error prone to have offset 0 converted to =
the real
> root node offset as soon as possible and then consider only the real offs=
et of the
> root node instead of a mix between the real offset and the offset 0.

That's fair.

> I think that "for (offset =3D root_offset, ..." will still be needed.
>=20
> Best regards,
> Herv=E9
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--g8J7he+hhoL9jjO3
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmqWgbkACgkQzQJF27ox
2GdA2xAAnu2Fe6i7s8+MTUa09N7EqzdXVKUwFybg/3a8t8nL41jwqauEPSJydnNU
CXIGnp8C34E0Ov4LOrJHcm7KXh4KN2YznXwGbooifqRMC/xL7cN8ua8f9QhgD90o
vsx30HLfPVs1wORQq6F7lVmzfy7Bl9Hfi0c2QK+Nm6Iqw8mcThU+AUsZjNIeoQFQ
w48tGtz8v0rn82MdCjsmDijJWAxIiZ5FM2xAeABy6rc4rRyouq8UjuOt8cvT6G5T
hxWWIpF+Q6T0PMfiJoLGlIfUlBGD+Ymy4n87eAKu2lcpqPKQpsJ0gTJjWTca1kLW
JYcs06PbJ+YyXMUwYzbcct98ASoiPj/wuQxNXluTObUaorcs1y4dtJW1S5pBEQAA
T+R/EAWvjJ12hYXaBYD/SgR9oAb+Sc8eAdwzwTy+iXnn7jkMBiJw8GrN20CX7eA3
xSu9LRINPL3eUTeqykSPVDTZSTk1hWxCVcdQVKyZN26/yC0whr5UXK7GBQP6U91G
dmQ2pmzzBOreQjZMZEPGwCeDEpYTGyAn/LhJ0Ghh04oRopzr37USI+mryk3+2pC6
W+/utNdADpyM+hJTLR3CaPNL6b7hgx7kH4Q7orlTtTbePrjJG411jw9/+IxkcVnF
lVxTKE9+tWG+wpHgCFuo5LzJkYioKHlUMV6DQi5NZe7wV+hR8ww=
=K+9U
-----END PGP SIGNATURE-----

--g8J7he+hhoL9jjO3--
