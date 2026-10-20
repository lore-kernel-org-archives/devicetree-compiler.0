Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792491472;
	b=kH0RG/iUqqxaAW9by/QNv323Xpu/iyd4QljKkGhj6KTNcqt6erRFa2Gz/s/JdAoJM2w6
	 oB/xmnGAt0CffDguUbQThRbWAlsEE390NNQltrU1x89dbRza8Gov5rztwOUsLiz1sgD1R
	 5tCM2zqnLmG7a868bVUKbjqcRT2vFUNcl6n/MG84y3l6BiKip7VSWcbWvxBzBVWks+G3e
	 WU86Gj9Exwmze5NWhjPODypaVq/Lk7JnUj2p/MpTHohYG1NH1iJ1irPj3KHOXopT14TnV
	 KzVIkuhUQ7xLaxp3qgX2RTgLshpQ1Vj8+WtUsTqmxAs1lX/qhufiLzdQb3C6+a5xjHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792491472;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=ICNik0dsjcc6Mv+xhai3KizouLT2/SQ+t4vqJRh1Tlo=;
	b=0co7GcLN2gnFlzncIJZG7yZTh9kj8gLpWPC+J1j0dUHyECcyfW6viz7+Lz4ihJw3jVhU
	 CMojE0pgN55x8VBLjPgpW3+1MpwekZpiKDfe5UobKoL7MT1orZAfwKgZf2z0WDAqP0Sq9
	 HGdGD1ISFRwxf/PScsNZDxDONlJYklLhovrKVlB8sW0h3lvEPMUTcqELiH0CWZPjKJfnA
	 DSr2XakkjZ1g6rkJ5vx4KQ63nY7oaVUZ+GdJ+ia/bZ+iKE54MBXEI42V1cBJ7U7ryS2Hn
	 UeTkYYnww/AxrQGDAYQBOn5dNR/jymbjfb+R9AdKLxmyybro6t+oV0akJcEuPY5GPXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=kYSi5XsO;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A7E606A322;
	Tue, 20 Oct 2026 10:17:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3A7E606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=kYSi5XsO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1792491467;
	bh=ICNik0dsjcc6Mv+xhai3KizouLT2/SQ+t4vqJRh1Tlo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kYSi5XsOzLyl6h/jUeTaMzcYSXmm5fz00Gp8TGMpaVQUXbhxJxEsfMQ+aYB7qFQ0U
	 lGzxzqy5NAvie+qyY5a51o2Xwrzq5UvSRQqw3n08RKt+0NuoN59n5gLYNOilHgW7Qp
	 Ui9jjcs9uuPEyjKE6p+IqoLzCPx4VySOcyWH/u+TZc3j9K6nEeD9kwL+eatbc4mhuQ
	 uqkLQoE46YFaIH6bxBvkgtSI18jqgdg/41c5OeV/o7wNfUMORPdcBwRlZaI9khuNG8
	 svbOv4E1ctssAAXKt5is1IDqzQjyXI6VUpB6srBFW8LCoalgcjXwyP4VhqD2TK30U+
	 hwS13M/RphUsA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4j87dl63C9z4wJh; Tue, 20 Oct 2026 21:17:47 +1100 (AEDT)
Date: Tue, 20 Oct 2026 17:41:04 +1100
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
Message-ID: <atcM7MFZTFXLbap8@gractus.seuss>
References: <20260826094950.1088288-1-herve.codina@bootlin.com>
 <20260826094950.1088288-6-herve.codina@bootlin.com>
 <atVrHkfXl10FTEye@gractus.seuss>
 <20261019155659.4badecfb@bootlin.com>
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
	protocol="application/pgp-signature"; boundary="jxBJWVf2MuyBXzGZ"
Content-Disposition: inline
In-Reply-To: <20261019155659.4badecfb@bootlin.com>

--jxBJWVf2MuyBXzGZ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 03:56:59PM +0200, Herve Codina wrote:
> Hi David,
>=20
> On Mon, 19 Oct 2026 11:58:17 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Wed, Aug 26, 2026 at 11:48:34AM +0200, Herve Codina wrote:
> > > Metadata tags are tags carrying extra information, either global to
> > > the DTB, specific to a node, or specific to a property.
> > >=20
> > > In several places (e.g. node/property iterators), these tags just need
> > > to be skipped. Introduce fdt_next_tag_filter() which wraps
> > > fdt_next_tag() and uses a user-supplied filter function to decide
> > > whether a tag should be hidden from the caller. Filtered-out tags are
> > > returned as FDT_NOP.
> > >=20
> > > Introduce fdt_tag_filter_skip_metadata() a filter function whose purp=
ose
> > > is to filter metadata tags; actual metadata tag filtering will be add=
ed
> > > when metadata tags are defined.
> > >=20
> > > Metadata tags must also be handled when a DTB is modified. They have =
to
> > > be removed or skipped depending on the modification.
> > >=20
> > > Here also, introduce fdt_tag_is_property_metadata() to provide a cent=
ral
> > > check for whether a tag is a property metadata tag; actual metadata
> > > check will be added when metadata tags are defined.
> > >=20
> > > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > > ---
> > >  libfdt/fdt.c             | 34 +++++++++++++--
> > >  libfdt/fdt_ro.c          |  3 +-
> > >  libfdt/fdt_rw.c          | 90 +++++++++++++++++++++++++++++++++-----=
--
> > >  libfdt/fdt_wip.c         | 23 +++++++++-
> > >  libfdt/libfdt_internal.h | 10 +++++
> > >  5 files changed, 140 insertions(+), 20 deletions(-)
> > >=20
> > > diff --git a/libfdt/fdt.c b/libfdt/fdt.c
> > > index 7941632f..8c026f26 100644
> > > --- a/libfdt/fdt.c
> > > +++ b/libfdt/fdt.c
> > > @@ -323,6 +323,33 @@ uint32_t fdt_next_tag(const void *fdt, int start=
offset, int *nextoffset)
> > >  	return fdt_next_tag_(fdt, startoffset, nextoffset, NULL);
> > >  }
> > > =20
> > > +uint32_t fdt_next_tag_filter(const void *fdt, int offset, int *nexto=
ffset,
> > > +			     bool (*tag_filter)(void *priv, uint32_t tag),
> > > +			     void *priv) =20
> >=20
> > I don't really see why a higher order function is more useful than
> > skipping tags you don't care about from the caller.
>=20
> Based on discussion we had related to fdt_next_tag() during the series in=
troducing
> structured tags, I has been decided that fdt_next_tag() will return all t=
ags and
> callers will handle them.
>=20
> With that done, fdt_next_tag_filter() doesn't make sense anymore. I have =
already
> planned to fully remove it.

Ok, great.

> > > +{
> > > +	int startoffset =3D offset;
> > > +	uint32_t tag;
> > > +
> > > +	tag =3D fdt_next_tag_(fdt, startoffset, nextoffset, NULL);
> > > +	if (tag =3D=3D FDT_END)
> > > +		return tag;
> > > +
> > > +	if (tag_filter(priv, tag))
> > > +		return FDT_NOP;
> > > +
> > > +	return tag;
> > > +}
>=20
> ...
>=20
> > > =20
> > > +int fdt_prop_remove_metadata_tags(void *fdt, bool force_inplace,
> > > +				  int prop_offset)
> > > +{
> > > +	int nextoffset, offset;
> > > +	uint32_t tag;
> > > +
> > > +	/*
> > > +	 * Only inplace using nopify is supported even if we could use an o=
ther
> > > +	 * method involving splices if force_inplace is set to false.
> > > +	 */ =20
> >=20
> > As with earlier things, I'd really prefer to see this splice, based on
> > principle of least surprise.
>=20
> Yes, splice will be done (already planned for unknown tags in the series
> adding support for structured tags).

Ok.

> > > +
> > > +	tag =3D fdt_next_tag(fdt, prop_offset, &nextoffset);
> > > +	if (tag =3D=3D FDT_END)
> > > +		return nextoffset;
> > > +
> > > +	/*
> > > +	 * Look at all tags related to the current property. I.e. tags afte=
r the
> > > +	 * current property and before either the next property, a sub-node=
  or
> > > +	 * the end of current node
> > > +	 */
> > > +	do {
> > > +		offset =3D nextoffset;
> > > +		tag =3D fdt_next_tag(fdt, offset, &nextoffset);
> > > +		if (tag =3D=3D FDT_END)
> > > +			return nextoffset;
> > > +
> > > +		/* Remove metadata tags related to the property */
> > > +		if (fdt_tag_is_property_metadata(tag))
> > > +			fdt_nopify_area(fdt, offset, nextoffset); =20
> >=20
> > The distinction between "metadata" and other tags doesn't make much
> > sense to me.  Specifically why would the tag being "metadata" make it
> > more of a candidate for removal?  What we need to know (for the
> > callers so far) is whether the tag is invalidated by changing the
> > contents of the property: I can't see how that would be related to
> > whether it's "metadata" or not.
>=20
> All of this is going to be reworked based on discussion we've already had
> during the previous series (introducing structured tag) review.
>=20
> The distinction was done because for "unknown" tags, downgrade should
> be done whereas for "known" tags it shouldn't.
>=20
> Anyway, all of that is going to be reworked for the next iteration.

Ok, fair enough.  Should I stop reviewing the current version of this
series, since it will probably need a lot of rework based on my
comments to the first series.

> > > +
> > > +	} while ((tag !=3D FDT_PROP) && (tag !=3D FDT_BEGIN_NODE) &&
> > > +		 (tag !=3D FDT_END_NODE));
> > > +
> > > +	return 0;
> > > +}
>=20
> ...
>=20
> > > @@ -332,10 +377,10 @@ static int fdt_add_property_(void *fdt, int nod=
eoffset, const char *name,
> > > =20
> > >  	/*
> > >  	 * nextoffset it at the first tag after the node.
> > > -	 * Skip possible unknown tags related to the node in order to add t=
he
> > > -	 * property after those tags.
> > > +	 * Skip possible unknown tags and metadata tags related to the node=
 in
> > > +	 * order to add the property after those tags.
> > >  	 */
> > > -	nextoffset =3D fdt_node_skip_unknown_tags(fdt, nextoffset);
> > > +	nextoffset =3D fdt_node_skip_unknown_and_metadata_tags(fdt, nextoff=
set); =20
> >=20
> > This makes even less sense to me.  The tags following the node belong
> > to the node, until either FDT_BEGIN_NODE, FDT_END_NODE or FDT_PROP.
> > We need to skip all of them regardless of whether they're "metadata"
> > or not.
>=20
> Yes, I will rework that part too.
>=20
> >=20
> > >  	if (nextoffset < 0)
> > >  		return nextoffset;
> > > =20
> > > @@ -453,6 +498,12 @@ int fdt_appendprop(void *fdt, int nodeoffset, co=
nst char *name,
> > >  		if (err)
> > >  			return err;
> > > =20
> > > +		/*
> > > +		 * We append data to the property. If known metadata tags are
> > > +		 * present, they are related to existing data and not impacted
> > > +		 * by data added. No need to remove them. =20
> >=20
> > You don't know that.  It might be true for the tags you have in mind
> > so far, but there's no guarantee.  It's a contrived example, but a tag
> > which gives "number of 0 bytes in the property" would be invalidated
> > by an append, for example.
>=20
> We talk about known tags. "Known" tags are tags that will be added in thi=
s series.
> If other tags are added in the future, this could become incorrect indeed=
 and should
> be handle when those tags are introduce (in the future).
>=20
> Anyway, I will probably rework this part too in order to make things clea=
r.
>=20
> The idea was to keep existing known tags related to the property if not
> impacted by the append.

Well.. more accurately, because we know the tags, we'll know whether
they need to be removed or updated based on their specific semantics.

> > > +		 */
> > > +
> > >  		newlen =3D len + oldlen;
> > >  		err =3D fdt_splice_struct_(fdt, prop->data,
> > >  					 FDT_TAGALIGN(oldlen),
> > > @@ -484,11 +535,16 @@ int fdt_delprop(void *fdt, int nodeoffset, cons=
t char *name)
> > >  	if (!prop)
> > >  		return len;
> > > =20
> > > +	/* The property is going to be removed. Remove its metadata tags */
> > > +	prop_offset =3D fdt_ptr_offset_(fdt, prop);
> > > +	err =3D fdt_prop_remove_metadata_tags(fdt, false, prop_offset);
> > > +	if (err)
> > > +		return err; =20
> >=20
> > All tags from the property to the next END_NODE or FDT_PROP need to be
> > removed, regardless of whether they're "metadata" or not.
> >=20
> > Also, rather than removing them one by one, I'd prefer to see the
> > total length of them calculated, and remove the property and extra
> > tags with a single splice.
>=20
> Will be updated in the next iteration.
>=20
> >=20
> > > +
> > >  	/*
> > > -	 * The property is going to be removed. Remove also possible unknown
> > > -	 * tags related to this property. Keep the dtb version unchanged.
> > > +	 * Remove also possible unknown tags related to this property.
> > > +	 * Keep the dtb version unchanged.
> > >  	 */
> > > -	prop_offset =3D fdt_ptr_offset_(fdt, prop);
> > >  	err =3D fdt_prop_remove_unknown_tags(fdt, false, prop_offset, false=
);
> > >  	if (err)
> > >  		return err;
> > > @@ -522,10 +578,15 @@ int fdt_add_subnode_namelen(void *fdt, int pare=
ntoffset,
> > >  		return offset;
> > > =20
> > >  	/*
> > > -	 * Try to place the new node after the parent's properties and unkn=
own
> > > -	 * tags related to those properties.
> > > -	 * Unknown tags are reported as FDT_NOP tags by fdt_next_tag.
> > > -	 * Skipping FDT_NOP tags will correctly skip unknown tags.
> > > +	 * Try to place the new node after:
> > > +	 *  - the parent's properties
> > > +	 *  - the metadata tags related to those properties =20
> >=20
> > Again, the "metadata" distinction doesn't really make sense.  You want
> > to place the new node immediately before the first FDT_BEGIN_NODE or
> > FDT_END_NODE tag within the parent node.
>=20
> Here also, will be updated.
>=20
> >=20
> > > +	 *  - unknown tags related to those properties.
> > > +	 * Unknown tags are reported as FDT_NOP tags by fdt_next_tag_filter.
> > > +	 * metadata tags are also reported as FDT_NOP by fdt_next_tag_filter
> > > +	 * thanks to the filter function used.
> > > +	 * Skipping FDT_NOP tags will correctly skip unknown tags and metad=
ata
> > > +	 * tags.
> > >  	 */
> > >  	tag =3D fdt_next_tag(fdt, parentoffset, &nextoffset);
> > >  	/* the fdt_subnode_offset_namelen() should ensure this never hits */
> > > @@ -533,7 +594,8 @@ int fdt_add_subnode_namelen(void *fdt, int parent=
offset,
> > >  		return -FDT_ERR_INTERNAL;
> > >  	do {
> > >  		offset =3D nextoffset;
> > > -		tag =3D fdt_next_tag(fdt, offset, &nextoffset);
> > > +		tag =3D fdt_next_tag_filter(fdt, offset, &nextoffset,
> > > +					  fdt_tag_filter_skip_metadata, NULL);
> > >  	} while ((tag =3D=3D FDT_PROP) || (tag =3D=3D FDT_NOP));
> > > =20
> > >  	nh =3D fdt_offset_ptr_w_(fdt, offset);
> > > diff --git a/libfdt/fdt_wip.c b/libfdt/fdt_wip.c
> > > index 7ca3ffbc..b2f9f8d1 100644
> > > --- a/libfdt/fdt_wip.c
> > > +++ b/libfdt/fdt_wip.c
> > > @@ -31,6 +31,17 @@ int fdt_setprop_inplace_namelen_partial(void *fdt,=
 int nodeoffset,
> > >  	if ((unsigned)proplen < (len + idx))
> > >  		return -FDT_ERR_NOSPACE;
> > > =20
> > > +	if (idx < (unsigned)proplen) {
> > > +		/*
> > > +		 * The property existing data are going to be modified.
> > > +		 * The property metadata tags are related to the property
> > > +		 * data. Remove them.
> > > +		 */
> > > +		err =3D fdt_prop_remove_metadata_tags(fdt, true, prop_offset);
> > > +		if (err)
> > > +			return err;
> > > +	} =20
> >=20
> > Similar to removal, I'd prefer to see a calculation of the total
> > length and a single splice_region, rather than removing them one by
> > one.
>=20
> Yes.
>=20
> Best regards
> Herv=E9
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--jxBJWVf2MuyBXzGZ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrXDOwACgkQzQJF27ox
2Gfo8w//U7yOq+bK7MyRsws/EmkGoiaS7U+DXNV8qg4pEHvToiip4luY3nZzsoQ/
AhnRHSGjG08ADGpwHuq9/q816U+MzmbCdxKmw2Xa3yP2YJyJIGGe/3PT+YTGwq0p
j3aKw+s/5iHwjLSzbrtOLxBb/8cryD96Yupx64u5eU7yYkg+GTVrbTvRp9r9Kpoz
laG/sQQVuk6zrwiNE1KGDEkOLTQFrMSu1AkEV+YPE3Qr3BJ14TVQDyOTug+BkqMy
vVNJvRj8DDIwyIML6b8veB+agOuBswQimQRqM9qdE7/Jb3lt0TQe/nPF6b6cVyqU
Wo74fOmyg39H4t//8K62LuNIl0KAnH/C+OkwTz4lIqbSpRT9j8cKUi7LeWWGhNc5
Wwm0aaRw3wx9u6ZZz6nUFV1dfHFI0ABXILMY/rILvPNblww9klSPipPU8bWv1rVh
FdPYG4ESv733sYiR5HJS3CKwsKE8wmRAXV9wtmvpITo6JhSAbh9k/5zkpcS7n8KK
/AM3wiFMQ5sDgkPFadyjCFaWho3y9fTbfxjrJyAYQFDLRHP4lLEJtsvgKUmM+RgM
po7AJPk4Ow7jJcnevncnGBkydNZ5jC02KGFVHzq87mwE1shUzCQ8Xg8bdoLXlllY
BrnWem5SZp2OGUr/0N5SsiUBOsbovDo5MkhY9Vo3kn631yc7Y3I=
=NR7R
-----END PGP SIGNATURE-----

--jxBJWVf2MuyBXzGZ--
