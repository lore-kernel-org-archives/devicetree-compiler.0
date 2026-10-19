Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652DB2AEF5;
	Mon, 19 Oct 2026 00:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792371508; cv=none; b=O2BKI0ty1ebiYPNA4okA40wEGMyOpdkgZte/bYzTV/fQJ9YePVuMF011O5+27CjkyNsT07TbOXCgeev9f7UDQPi9lnQx50NJh7GzL6q0HtDVfWMwa71/Z+F7vDVtKGHjnafcDzFS5qWLdfFtY4fT0z/hibpCMuR/E/gQWCN+GiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792371508; c=relaxed/simple;
	bh=Fc3y4ITQf/DyEsy9eOyVxSO63STURXzlW/Oa91B2Xpc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cFYFzIQhpK4WUQ3qjvc7upYw+JO3gQGCSxpe/ttJUdnf2dRSBZLVuEWeDgF4gz0Sz06aPHOpJjzt4am04O625W5Qzq8cUXPUCgTVsQyDPwBRht8UR2i1nMbKY4pvmdqtMe+QN1PANaANp4xzMbMQGbR6eh77yo7fRPjhIHGaLpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=IbLNJaTu; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="IbLNJaTu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1792371502;
	bh=2cIHH2W9NqLn2dpAmqry6mn1QN+98mdvENWNahqFizw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IbLNJaTuNbh9MP1AWvPChWP5SGTQ4zGv42l6sEQd9j0mNkAspSubnVFiVIjFNEXOe
	 3iM0sndpO0eS/m2cAyHL/s7OzHhvsjvd0rcNYFT5R2PiwZz3u2cLzW6AaL6fW/vNs+
	 LWU74fbvQYgGHnSiiStaWQkFD5iiyhcRifpRd7VqRjytvH5d+tDlB2WXWPtHDfMJUy
	 4lwQrE3Xh2uy5z3HiS7hRwIJaHEJkMmFnIgMktFRWGUW4861oX1WAd4vKGH3WJDDAb
	 WTRCck6sitWRDMQ1Ktwrn7P5M57N6nMMwFYC7ryuQ+aWLDibKtru6H3if05zLZ7jHw
	 e6fXKBsoBlnWw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4j7HGk32vKz4wLc; Mon, 19 Oct 2026 11:58:22 +1100 (AEDT)
Date: Mon, 19 Oct 2026 11:58:17 +1100
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
Message-ID: <atVrHkfXl10FTEye@gractus.seuss>
References: <20260826094950.1088288-1-herve.codina@bootlin.com>
 <20260826094950.1088288-6-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HzIh3zK9fu7b/KqE"
Content-Disposition: inline
In-Reply-To: <20260826094950.1088288-6-herve.codina@bootlin.com>

--HzIh3zK9fu7b/KqE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 11:48:34AM +0200, Herve Codina wrote:
> Metadata tags are tags carrying extra information, either global to
> the DTB, specific to a node, or specific to a property.
>=20
> In several places (e.g. node/property iterators), these tags just need
> to be skipped. Introduce fdt_next_tag_filter() which wraps
> fdt_next_tag() and uses a user-supplied filter function to decide
> whether a tag should be hidden from the caller. Filtered-out tags are
> returned as FDT_NOP.
>=20
> Introduce fdt_tag_filter_skip_metadata() a filter function whose purpose
> is to filter metadata tags; actual metadata tag filtering will be added
> when metadata tags are defined.
>=20
> Metadata tags must also be handled when a DTB is modified. They have to
> be removed or skipped depending on the modification.
>=20
> Here also, introduce fdt_tag_is_property_metadata() to provide a central
> check for whether a tag is a property metadata tag; actual metadata
> check will be added when metadata tags are defined.
>=20
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  libfdt/fdt.c             | 34 +++++++++++++--
>  libfdt/fdt_ro.c          |  3 +-
>  libfdt/fdt_rw.c          | 90 +++++++++++++++++++++++++++++++++-------
>  libfdt/fdt_wip.c         | 23 +++++++++-
>  libfdt/libfdt_internal.h | 10 +++++
>  5 files changed, 140 insertions(+), 20 deletions(-)
>=20
> diff --git a/libfdt/fdt.c b/libfdt/fdt.c
> index 7941632f..8c026f26 100644
> --- a/libfdt/fdt.c
> +++ b/libfdt/fdt.c
> @@ -323,6 +323,33 @@ uint32_t fdt_next_tag(const void *fdt, int startoffs=
et, int *nextoffset)
>  	return fdt_next_tag_(fdt, startoffset, nextoffset, NULL);
>  }
> =20
> +uint32_t fdt_next_tag_filter(const void *fdt, int offset, int *nextoffse=
t,
> +			     bool (*tag_filter)(void *priv, uint32_t tag),
> +			     void *priv)

I don't really see why a higher order function is more useful than
skipping tags you don't care about from the caller.

> +{
> +	int startoffset =3D offset;
> +	uint32_t tag;
> +
> +	tag =3D fdt_next_tag_(fdt, startoffset, nextoffset, NULL);
> +	if (tag =3D=3D FDT_END)
> +		return tag;
> +
> +	if (tag_filter(priv, tag))
> +		return FDT_NOP;
> +
> +	return tag;
> +}
> +
> +bool fdt_tag_filter_skip_metadata(void *data, uint32_t tag)
> +{
> +	return false;
> +}
> +
> +bool fdt_tag_is_property_metadata(uint32_t tag)
> +{
> +	return false;
> +}
> +
>  int fdt_check_node_offset_(const void *fdt, int offset)
>  {
>  	if (!can_assume(VALID_INPUT)
> @@ -355,7 +382,8 @@ int fdt_root_offset(const void *fdt)
> =20
>  	do {
>  		offset =3D nextoffset;
> -		tag =3D fdt_next_tag(fdt, offset, &nextoffset);
> +		tag =3D fdt_next_tag_filter(fdt, offset, &nextoffset,
> +					  fdt_tag_filter_skip_metadata, NULL);
>  		switch (tag) {
>  		case FDT_END_NODE:
>  		case FDT_PROP:
> @@ -393,8 +421,8 @@ int fdt_next_node(const void *fdt, int offset, int *d=
epth)
> =20
>  	do {
>  		offset =3D nextoffset;
> -		tag =3D fdt_next_tag(fdt, offset, &nextoffset);
> -
> +		tag =3D fdt_next_tag_filter(fdt, offset, &nextoffset,
> +					  fdt_tag_filter_skip_metadata, NULL);
>  		switch (tag) {
>  		case FDT_PROP:
>  		case FDT_NOP:
> diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> index 50c0a8bc..ea6a540d 100644
> --- a/libfdt/fdt_ro.c
> +++ b/libfdt/fdt_ro.c
> @@ -206,7 +206,8 @@ static int nextprop_(const void *fdt, int offset)
>  	int nextoffset;
> =20
>  	do {
> -		tag =3D fdt_next_tag(fdt, offset, &nextoffset);
> +		tag =3D fdt_next_tag_filter(fdt, offset, &nextoffset,
> +					  fdt_tag_filter_skip_metadata, NULL);
> =20
>  		switch (tag) {
>  		case FDT_END:
> diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
> index 1c6ce0a3..30f3da40 100644
> --- a/libfdt/fdt_rw.c
> +++ b/libfdt/fdt_rw.c
> @@ -259,6 +259,42 @@ int fdt_prop_remove_unknown_tags(void *fdt, bool for=
ce_inplace,
>  	return 0;
>  }
> =20
> +int fdt_prop_remove_metadata_tags(void *fdt, bool force_inplace,
> +				  int prop_offset)
> +{
> +	int nextoffset, offset;
> +	uint32_t tag;
> +
> +	/*
> +	 * Only inplace using nopify is supported even if we could use an other
> +	 * method involving splices if force_inplace is set to false.
> +	 */

As with earlier things, I'd really prefer to see this splice, based on
principle of least surprise.

> +
> +	tag =3D fdt_next_tag(fdt, prop_offset, &nextoffset);
> +	if (tag =3D=3D FDT_END)
> +		return nextoffset;
> +
> +	/*
> +	 * Look at all tags related to the current property. I.e. tags after the
> +	 * current property and before either the next property, a sub-node  or
> +	 * the end of current node
> +	 */
> +	do {
> +		offset =3D nextoffset;
> +		tag =3D fdt_next_tag(fdt, offset, &nextoffset);
> +		if (tag =3D=3D FDT_END)
> +			return nextoffset;
> +
> +		/* Remove metadata tags related to the property */
> +		if (fdt_tag_is_property_metadata(tag))
> +			fdt_nopify_area(fdt, offset, nextoffset);

The distinction between "metadata" and other tags doesn't make much
sense to me.  Specifically why would the tag being "metadata" make it
more of a candidate for removal?  What we need to know (for the
callers so far) is whether the tag is invalidated by changing the
contents of the property: I can't see how that would be related to
whether it's "metadata" or not.

> +
> +	} while ((tag !=3D FDT_PROP) && (tag !=3D FDT_BEGIN_NODE) &&
> +		 (tag !=3D FDT_END_NODE));
> +
> +	return 0;
> +}
> +
>  static int fdt_resize_property_(void *fdt, int nodeoffset,
>  				const char *name, int namelen,
>  				int len, struct fdt_property **prop)
> @@ -273,10 +309,18 @@ static int fdt_resize_property_(void *fdt, int node=
offset,
>  		return oldlen;
> =20
>  	/*
> -	 * The property is resized. Remove possible unknown tags related to the
> -	 * property downgrading the dtb version.
> +	 * The property is resized and data are going to be modified. Remove
> +	 * property metadata tags
>  	 */
>  	prop_offset =3D fdt_ptr_offset_(fdt, *prop);
> +	err =3D fdt_prop_remove_metadata_tags(fdt, false, prop_offset);
> +	if (err)
> +		return err;
> +
> +	/*
> +	 * Remove also possible unknown tags related to the property downgrading
> +	 * the dtb version.
> +	 */
>  	err =3D fdt_prop_remove_unknown_tags(fdt, false, prop_offset, true);
>  	if (err)
>  		return err;
> @@ -289,7 +333,7 @@ static int fdt_resize_property_(void *fdt, int nodeof=
fset,
>  	return 0;
>  }
> =20
> -static int fdt_node_skip_unknown_tags(void *fdt, int next)
> +static int fdt_node_skip_unknown_and_metadata_tags(void *fdt, int next)
>  {
>  	int nextoffset =3D next;
>  	int offset;
> @@ -299,6 +343,7 @@ static int fdt_node_skip_unknown_tags(void *fdt, int =
next)
>  	 * Skip all tags related to the current node. I.e. tags after the
>  	 * current node and before either the next property, a sub-node or the
>  	 * end of current node.
> +	 * FDT_NOP, unknown tags and potential node metadata tags are skipped.
>  	 */
>  	do {
>  		offset =3D nextoffset;
> @@ -332,10 +377,10 @@ static int fdt_add_property_(void *fdt, int nodeoff=
set, const char *name,
> =20
>  	/*
>  	 * nextoffset it at the first tag after the node.
> -	 * Skip possible unknown tags related to the node in order to add the
> -	 * property after those tags.
> +	 * Skip possible unknown tags and metadata tags related to the node in
> +	 * order to add the property after those tags.
>  	 */
> -	nextoffset =3D fdt_node_skip_unknown_tags(fdt, nextoffset);
> +	nextoffset =3D fdt_node_skip_unknown_and_metadata_tags(fdt, nextoffset);

This makes even less sense to me.  The tags following the node belong
to the node, until either FDT_BEGIN_NODE, FDT_END_NODE or FDT_PROP.
We need to skip all of them regardless of whether they're "metadata"
or not.

>  	if (nextoffset < 0)
>  		return nextoffset;
> =20
> @@ -453,6 +498,12 @@ int fdt_appendprop(void *fdt, int nodeoffset, const =
char *name,
>  		if (err)
>  			return err;
> =20
> +		/*
> +		 * We append data to the property. If known metadata tags are
> +		 * present, they are related to existing data and not impacted
> +		 * by data added. No need to remove them.

You don't know that.  It might be true for the tags you have in mind
so far, but there's no guarantee.  It's a contrived example, but a tag
which gives "number of 0 bytes in the property" would be invalidated
by an append, for example.

> +		 */
> +
>  		newlen =3D len + oldlen;
>  		err =3D fdt_splice_struct_(fdt, prop->data,
>  					 FDT_TAGALIGN(oldlen),
> @@ -484,11 +535,16 @@ int fdt_delprop(void *fdt, int nodeoffset, const ch=
ar *name)
>  	if (!prop)
>  		return len;
> =20
> +	/* The property is going to be removed. Remove its metadata tags */
> +	prop_offset =3D fdt_ptr_offset_(fdt, prop);
> +	err =3D fdt_prop_remove_metadata_tags(fdt, false, prop_offset);
> +	if (err)
> +		return err;

All tags from the property to the next END_NODE or FDT_PROP need to be
removed, regardless of whether they're "metadata" or not.

Also, rather than removing them one by one, I'd prefer to see the
total length of them calculated, and remove the property and extra
tags with a single splice.

> +
>  	/*
> -	 * The property is going to be removed. Remove also possible unknown
> -	 * tags related to this property. Keep the dtb version unchanged.
> +	 * Remove also possible unknown tags related to this property.
> +	 * Keep the dtb version unchanged.
>  	 */
> -	prop_offset =3D fdt_ptr_offset_(fdt, prop);
>  	err =3D fdt_prop_remove_unknown_tags(fdt, false, prop_offset, false);
>  	if (err)
>  		return err;
> @@ -522,10 +578,15 @@ int fdt_add_subnode_namelen(void *fdt, int parentof=
fset,
>  		return offset;
> =20
>  	/*
> -	 * Try to place the new node after the parent's properties and unknown
> -	 * tags related to those properties.
> -	 * Unknown tags are reported as FDT_NOP tags by fdt_next_tag.
> -	 * Skipping FDT_NOP tags will correctly skip unknown tags.
> +	 * Try to place the new node after:
> +	 *  - the parent's properties
> +	 *  - the metadata tags related to those properties

Again, the "metadata" distinction doesn't really make sense.  You want
to place the new node immediately before the first FDT_BEGIN_NODE or
FDT_END_NODE tag within the parent node.

> +	 *  - unknown tags related to those properties.
> +	 * Unknown tags are reported as FDT_NOP tags by fdt_next_tag_filter.
> +	 * metadata tags are also reported as FDT_NOP by fdt_next_tag_filter
> +	 * thanks to the filter function used.
> +	 * Skipping FDT_NOP tags will correctly skip unknown tags and metadata
> +	 * tags.
>  	 */
>  	tag =3D fdt_next_tag(fdt, parentoffset, &nextoffset);
>  	/* the fdt_subnode_offset_namelen() should ensure this never hits */
> @@ -533,7 +594,8 @@ int fdt_add_subnode_namelen(void *fdt, int parentoffs=
et,
>  		return -FDT_ERR_INTERNAL;
>  	do {
>  		offset =3D nextoffset;
> -		tag =3D fdt_next_tag(fdt, offset, &nextoffset);
> +		tag =3D fdt_next_tag_filter(fdt, offset, &nextoffset,
> +					  fdt_tag_filter_skip_metadata, NULL);
>  	} while ((tag =3D=3D FDT_PROP) || (tag =3D=3D FDT_NOP));
> =20
>  	nh =3D fdt_offset_ptr_w_(fdt, offset);
> diff --git a/libfdt/fdt_wip.c b/libfdt/fdt_wip.c
> index 7ca3ffbc..b2f9f8d1 100644
> --- a/libfdt/fdt_wip.c
> +++ b/libfdt/fdt_wip.c
> @@ -31,6 +31,17 @@ int fdt_setprop_inplace_namelen_partial(void *fdt, int=
 nodeoffset,
>  	if ((unsigned)proplen < (len + idx))
>  		return -FDT_ERR_NOSPACE;
> =20
> +	if (idx < (unsigned)proplen) {
> +		/*
> +		 * The property existing data are going to be modified.
> +		 * The property metadata tags are related to the property
> +		 * data. Remove them.
> +		 */
> +		err =3D fdt_prop_remove_metadata_tags(fdt, true, prop_offset);
> +		if (err)
> +			return err;
> +	}

Similar to removal, I'd prefer to see a calculation of the total
length and a single splice_region, rather than removing them one by
one.


>  	/*
>  	 * Remove unknown tags related to the property downgrading the dtb
>  	 * version.
> @@ -81,10 +92,18 @@ int fdt_nop_property(void *fdt, int nodeoffset, const=
 char *name)
>  		return len;
> =20
>  	/*
> -	 * The property is going to be removed (nopified). Remove unknown tags
> -	 * related to this property. Keep the dtb version unchanged.
> +	 * The property is going to be removed (nopified). Remove its metadata
> +	 * tags
>  	 */
>  	prop_offset =3D fdt_ptr_offset_(fdt, prop);
> +	err =3D fdt_prop_remove_metadata_tags(fdt, true, prop_offset);
> +	if (err)
> +		return err;
> +
> +	/*
> +	 * Remove also possible unknown tags related to this property.
> +	 * Keep the dtb version unchanged.
> +	 */
>  	err =3D fdt_prop_remove_unknown_tags(fdt, true, prop_offset, false);
>  	if (err)
>  		return err;
> diff --git a/libfdt/libfdt_internal.h b/libfdt/libfdt_internal.h
> index d4154119..47dfc0d4 100644
> --- a/libfdt/libfdt_internal.h
> +++ b/libfdt/libfdt_internal.h
> @@ -23,6 +23,14 @@ int32_t fdt_ro_probe_(const void *fdt);
>  uint32_t fdt_next_tag_(const void *fdt, int startoffset, int *nextoffset,
>  		       bool *is_unknown);
> =20
> +uint32_t fdt_next_tag_filter(const void *fdt, int offset, int *nextoffse=
t,
> +			     bool (*tag_filter)(void *priv, uint32_t tag),
> +			     void *priv);
> +
> +bool fdt_tag_filter_skip_metadata(void *data, uint32_t tag);
> +
> +bool fdt_tag_is_property_metadata(uint32_t tag);
> +
>  int fdt_get_structured_tag_data(uint32_t tag, const void *fdt, int offse=
t,
>  				uint32_t *data_len);
> =20
> @@ -31,6 +39,8 @@ int fdt_check_prop_offset_(const void *fdt, int offset);
> =20
>  int fdt_prop_remove_unknown_tags(void *fdt, bool force_inplace,
>  				 int prop_offset, bool downgrade_version);
> +int fdt_prop_remove_metadata_tags(void *fdt, bool force_inplace,
> +				  int prop_offset);
> =20
>  int fdt_getprop_offset_namelen(const void *fdt, int nodeoffset,
>  			       const char *name, int namelen);
> --=20
> 2.55.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--HzIh3zK9fu7b/KqE
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrVax4ACgkQzQJF27ox
2Gf56w//WMZCZ9MQ6My2TfyRgksA/QQR3DmlSxAPKBI3iKrErB+HGPh5TB6T3F6m
ediAUWfqmrvWupYLKb9wt8l6ikMck4S8XqzegQzGxk/wCyzeSjUYHXk8uUiWE62Y
JCiMY3kSstP6mr2p8qQ68533LE3qfwdyqa5c9jPPAbV5oO7vIG+KVFjZ/3Us0QUX
QYPt78O+gZwjSrVKcFFT68XvLuwjW+ClwsqdA9YKss/BuARR4loyLTQmE4ZXJ9XO
sCI+ZwbgdUIhQ5jIeRXmX2qPruI7DjDvM9LApp5jwA6iIruI8x2zG3kuMRp6yJQy
+ATG7fgh9AEsNKc7NXrDYeaJTOnTBA4wPdaQneMozy+zN+fhN4d0jnfDDHmW8mkT
D1E7gnaV8aO+ITXXN2Qs0Evg2DpvKq3wNmU8R3DSMMzhMDbRUyIn3ntWqpubzBAF
Gi+vrw75qoIKPTJ8EcJzlYUH+opCNY4RoJ8Y3iR+FxOCYZ9Fo7gRPw/1G5MebE3V
5TnEfy1O4UipvE6KTEK3V5Ar7Hryuy1DZdC0uVd/aS7l0Q+L6eRIwydJuVfkWL1S
EBA/izhzNbdUHAf0LYYsS34qKppGQZkzPC5lPaISqkyrCZk00mS8P/Jbc4CkEU5F
EsP+PR4s1f3ZMRXojBEnV5fl54gGeEFKk67Aivvs3zy4vx3Y39U=
=0dcH
-----END PGP SIGNATURE-----

--HzIh3zK9fu7b/KqE--
