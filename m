Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792548106;
	b=cOhkaqw+JEB6KWLOke7ujyi7qnC4qEI76kLr8ndpa6+n257g2OEGF0odahNpRNx7aD3Y
	 4c6K5q/aYVFLxnNN75aubAhtBnRlC8SdAl45Vu/faVDlG9yeBGxXOEhWR0qXKXRQqTyae
	 e5vK8LH1E8JAhxEn0aNh7ETe0kWFAt3RWK/JANF4xU89AEZanU0X6Z6jRun0IVzJT2OEJ
	 PyN+cl9ms+p9l++IBgy/l1YckBqIx7aC1Av76nYSV8KFm0GXVjc7mng4EU1XHQV/4W9VS
	 drHPRy3eZaFvYKAhIg70Vt3YZUIPt+WTbVv/ioo+vpPdItQRWaA0BKeBFy6mJsmmcTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792548106;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=fOjabxQvaz/pTvwO69ne1iH8snTeqttIoh/wjiL9lCI=;
	b=hdt1aQOU+33gajrfXsa4Jyq5F4FFFeoU+KW0cpygSd/+HvjAsC/rzTJwm5v/gj9Yb3VH
	 se62nfGNQ5sX+s0q7Uk4v5wiVpAeLSWtfTI1/gu6l8+KVm6WKBH92pMTKgCg0Lxi1qbQb
	 0u/Nm0wRyA1wTcgvG/LHKarzrFvZ2a6a2SBoTz1rxvYoZSHBlvT/NXJRfQvg5cwnKWa4q
	 o54xJ8Z5oEouGDWGLCsIb6e9o9YlAlSs3ksGh4UU6yTROif0XtGTQxwapqIXMUeVzm/U1
	 DqqeA+dOcSkKyaZmzPvRcH6hg1QDFW9HrCEu++umr2KZDY8nVlbhnmmpwMf9WY1TlNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=Qln5plQf;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32C7606A319;
	Wed, 21 Oct 2026 02:01:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F32C7606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=Qln5plQf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1792548102;
	bh=fOjabxQvaz/pTvwO69ne1iH8snTeqttIoh/wjiL9lCI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qln5plQfQwiGy6s8Uz+7zRqJKHEHW/AjzBuvF8L0lQw8A+UkIKr0GCCzEbMFaezuZ
	 0LauUd2XgrxdZ9ckjH3vl4rmJchvCe3QrfMD4jp5KocMRBOGR/bBlaR0XfFy4XtTS2
	 CQ8QzCMLPF1LEOnvOW0CcPC6Ta1CLRGtt+RIpAXwZwkyuda58S1rIgfuKYy4QKilan
	 viHZZbQ9Wt2aRPuG5T1g/gXc75km5UvmBDEYpKbDgkvRkE2Cgi5ptWyahz/+BEG/Oh
	 xFWPTkKeP5uoD/fGrdx04NdtdPWZzYfS4MqIlVZiyhz+XTyfXnWgcaJc5FetQiNLiO
	 Q0yEWKn5NRCUA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4j8XZt13qKz4wBF; Wed, 21 Oct 2026 13:01:42 +1100 (AEDT)
Date: Wed, 21 Oct 2026 12:44:32 +1100
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
Subject: Re: [RFC PATCH v2 05/74] libfdt: Prepare for metadata tag support
Message-ID: <atgY-n1eaKX24PPj@gractus.seuss>
References: <20260826094950.1088288-1-herve.codina@bootlin.com>
 <20260826094950.1088288-6-herve.codina@bootlin.com>
 <atVrHkfXl10FTEye@gractus.seuss>
 <20261019155659.4badecfb@bootlin.com>
 <atcM7MFZTFXLbap8@gractus.seuss>
 <20261020131406.02bd50ec@bootlin.com>
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
	protocol="application/pgp-signature"; boundary="cwD/UTWXTz39bYRM"
Content-Disposition: inline
In-Reply-To: <20261020131406.02bd50ec@bootlin.com>

--cwD/UTWXTz39bYRM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 01:14:06PM +0200, Herve Codina wrote:
> Hi David,
>=20
> On Tue, 20 Oct 2026 17:41:04 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Mon, Oct 19, 2026 at 03:56:59PM +0200, Herve Codina wrote:
> > > Hi David,
> > >=20
> > > On Mon, 19 Oct 2026 11:58:17 +1100
> > > David Gibson <david@gibson.dropbear.id.au> wrote:
> > >  =20
> > > > On Wed, Aug 26, 2026 at 11:48:34AM +0200, Herve Codina wrote: =20
> > > > > Metadata tags are tags carrying extra information, either global =
to
> > > > > the DTB, specific to a node, or specific to a property.
> > > > >=20
> > > > > In several places (e.g. node/property iterators), these tags just=
 need
> > > > > to be skipped. Introduce fdt_next_tag_filter() which wraps
> > > > > fdt_next_tag() and uses a user-supplied filter function to decide
> > > > > whether a tag should be hidden from the caller. Filtered-out tags=
 are
> > > > > returned as FDT_NOP.
> > > > >=20
> > > > > Introduce fdt_tag_filter_skip_metadata() a filter function whose =
purpose
> > > > > is to filter metadata tags; actual metadata tag filtering will be=
 added
> > > > > when metadata tags are defined.
> > > > >=20
> > > > > Metadata tags must also be handled when a DTB is modified. They h=
ave to
> > > > > be removed or skipped depending on the modification.
> > > > >=20
> > > > > Here also, introduce fdt_tag_is_property_metadata() to provide a =
central
> > > > > check for whether a tag is a property metadata tag; actual metada=
ta
> > > > > check will be added when metadata tags are defined.
> > > > >=20
> > > > > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > > > > ---
> > > > >  libfdt/fdt.c             | 34 +++++++++++++--
> > > > >  libfdt/fdt_ro.c          |  3 +-
> > > > >  libfdt/fdt_rw.c          | 90 +++++++++++++++++++++++++++++++++-=
------
> > > > >  libfdt/fdt_wip.c         | 23 +++++++++-
> > > > >  libfdt/libfdt_internal.h | 10 +++++
> > > > >  5 files changed, 140 insertions(+), 20 deletions(-)
> > > > >=20
> > > > > diff --git a/libfdt/fdt.c b/libfdt/fdt.c
> > > > > index 7941632f..8c026f26 100644
> > > > > --- a/libfdt/fdt.c
> > > > > +++ b/libfdt/fdt.c
> > > > > @@ -323,6 +323,33 @@ uint32_t fdt_next_tag(const void *fdt, int s=
tartoffset, int *nextoffset)
> > > > >  	return fdt_next_tag_(fdt, startoffset, nextoffset, NULL);
> > > > >  }
> > > > > =20
> > > > > +uint32_t fdt_next_tag_filter(const void *fdt, int offset, int *n=
extoffset,
> > > > > +			     bool (*tag_filter)(void *priv, uint32_t tag),
> > > > > +			     void *priv)   =20
> > > >=20
> > > > I don't really see why a higher order function is more useful than
> > > > skipping tags you don't care about from the caller. =20
> > >=20
> > > Based on discussion we had related to fdt_next_tag() during the serie=
s introducing
> > > structured tags, I has been decided that fdt_next_tag() will return a=
ll tags and
> > > callers will handle them.
> > >=20
> > > With that done, fdt_next_tag_filter() doesn't make sense anymore. I h=
ave already
> > > planned to fully remove it. =20
> >=20
> > Ok, great.
> >=20
> > > > > +{
> > > > > +	int startoffset =3D offset;
> > > > > +	uint32_t tag;
> > > > > +
> > > > > +	tag =3D fdt_next_tag_(fdt, startoffset, nextoffset, NULL);
> > > > > +	if (tag =3D=3D FDT_END)
> > > > > +		return tag;
> > > > > +
> > > > > +	if (tag_filter(priv, tag))
> > > > > +		return FDT_NOP;
> > > > > +
> > > > > +	return tag;
> > > > > +} =20
> > >=20
> > > ...
> > >  =20
> > > > > =20
> > > > > +int fdt_prop_remove_metadata_tags(void *fdt, bool force_inplace,
> > > > > +				  int prop_offset)
> > > > > +{
> > > > > +	int nextoffset, offset;
> > > > > +	uint32_t tag;
> > > > > +
> > > > > +	/*
> > > > > +	 * Only inplace using nopify is supported even if we could use =
an other
> > > > > +	 * method involving splices if force_inplace is set to false.
> > > > > +	 */   =20
> > > >=20
> > > > As with earlier things, I'd really prefer to see this splice, based=
 on
> > > > principle of least surprise. =20
> > >=20
> > > Yes, splice will be done (already planned for unknown tags in the ser=
ies
> > > adding support for structured tags). =20
> >=20
> > Ok.
> >=20
> > > > > +
> > > > > +	tag =3D fdt_next_tag(fdt, prop_offset, &nextoffset);
> > > > > +	if (tag =3D=3D FDT_END)
> > > > > +		return nextoffset;
> > > > > +
> > > > > +	/*
> > > > > +	 * Look at all tags related to the current property. I.e. tags =
after the
> > > > > +	 * current property and before either the next property, a sub-=
node  or
> > > > > +	 * the end of current node
> > > > > +	 */
> > > > > +	do {
> > > > > +		offset =3D nextoffset;
> > > > > +		tag =3D fdt_next_tag(fdt, offset, &nextoffset);
> > > > > +		if (tag =3D=3D FDT_END)
> > > > > +			return nextoffset;
> > > > > +
> > > > > +		/* Remove metadata tags related to the property */
> > > > > +		if (fdt_tag_is_property_metadata(tag))
> > > > > +			fdt_nopify_area(fdt, offset, nextoffset);   =20
> > > >=20
> > > > The distinction between "metadata" and other tags doesn't make much
> > > > sense to me.  Specifically why would the tag being "metadata" make =
it
> > > > more of a candidate for removal?  What we need to know (for the
> > > > callers so far) is whether the tag is invalidated by changing the
> > > > contents of the property: I can't see how that would be related to
> > > > whether it's "metadata" or not. =20
> > >=20
> > > All of this is going to be reworked based on discussion we've already=
 had
> > > during the previous series (introducing structured tag) review.
> > >=20
> > > The distinction was done because for "unknown" tags, downgrade should
> > > be done whereas for "known" tags it shouldn't.
> > >=20
> > > Anyway, all of that is going to be reworked for the next iteration. =
=20
> >=20
> > Ok, fair enough.  Should I stop reviewing the current version of this
> > series, since it will probably need a lot of rework based on my
> > comments to the first series.
>=20
> I wouldn't say you should stop reviewing.

Ok, I'll carry on as time permits.

> Maybe you can have in mind that fdt_next_tag() will return all tags and s=
o,
> filtering out tags at fdt_next_tag() or using fdt_next_tag_filter() will =
not
> be there anymore. This will not change fundamentally the way tags are use=
d.
> If they are skipped by filter function in this series, they will be skipp=
ed
> by callers in the next iteration.

Ok, I'll bear that in mind.

> New tags added in the series will be there in the next iteration. The mea=
ning
> of those new tags will not be changed. As well as new dts keywords or oth=
er
> concepts such as referencing an orphan node by path.
>=20
> Tests introduced will also be there in the next iteration.
>=20
> A lot of things available in the series will be there in the next iterati=
on.
>=20
> For all those reasons, I thing your review can still be useful.
>=20
> Maybe you will find some other patches that could be applied or move to t=
he
> series introducing "structured" tags.
>=20
> IMHO, even if I (we) know that some modification discussed in the series
> adding support for structured tags will have impacts to this series, eith=
er
> due the modification itself or because I will keep things consistent, hav=
ing
> your feedback and potential discussion on this series is still relevant.

Certainly.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--cwD/UTWXTz39bYRM
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrYGPoACgkQzQJF27ox
2GfVNA//RRJjSE9FRnaMBIJaZQSR0MY+iV+nQSTyBdGbqexoaBFLH54lDD7H8PrG
Ivsh96Ub2EFrK2C+0Hyj3sRj1iQj345yk9ZlxHceg4XGMNpLPoZSwEE1wmXIB4FQ
4qzkUC9S73FQxjtxDElYslMhth1HfZVRu5wthpt4I1WjTudy/2tdWSQgxQd+KHm0
PQPpYo3Rl2nZGrPdSAnfl2YeFkZ1qWlNs3X4BrsmJxKysxBUOOvAtPl81MBxz28v
CgmnPmEF+ExuBJs/bJJ/dsqlE2F9qHmTEFaH2wwyrDjA1PXWss1nrv7D3eHmKzvH
8D59ZeScAGbL4M0c2Y+sRYrmBz64og86e5aMb6RXMIbtBnVTGllDOn67mj15rojm
yhpMD5XAwFicj9Xl/Zz4mBj5ctJ3/Ihpelf4BBa3WlKNET3YRk1QAVtGnyQg2O1d
kIY4KIR603x+wbcqdo9kf1eFTDt92rT2zewhDK0jbvPa1DjP7Yq7pumrOI4VzRrK
qX4tlERpK+jGRcirj17WgNOKEHwOWQV43de3ossisgmRD9MmPo2qBEjMPFFDwhkC
FepHnK3t6an+rIGhC87cTY6FIrYz//xC9nTAwe2qV7hgH4RcD1oG8iGSjacRItWj
gl9NcGAk4PIEM7NlSgfZmFcFuDl96GQNzzaxvM55oWGdKzCXzxI=
=zrgk
-----END PGP SIGNATURE-----

--cwD/UTWXTz39bYRM--
