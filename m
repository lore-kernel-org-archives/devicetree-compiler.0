Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7BFC1A683E;
	Sun, 30 Aug 2026 03:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788060082; cv=none; b=Iyrn2evNfmOF6AN5Sd0VVZYVTbJke2ljxQviMdpANvqXlGKmSp65u+Cc8egLO66yXSk1ZXnNi23yf5HeoFA6lZ1ek8JXPEziK5LJrq+ASva8QZNKJFWaocY4ZPEBu0Gtk3rihbE4xR5gM9cHQKm35yaIR0+ga1sMHWbnfnfdI4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788060082; c=relaxed/simple;
	bh=k84M6b37GpQtxp7vyQUjLWnDIJLlKBHs5Obj/n0e8e0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YnQyVqLa1R1TMxqSDegSyjJbhwHGTOKZ75XF5InkemCDa65kO/g2VNj9q/zIPcLXXWOnFgF5fMAnmXke6IYgF4/G2lTmAMeogK+xshk6JOkFQPQekk8ba2+HFAJTJjVnQjGk0SWrzWefk4bfQ1YMcvxCgaSFjif2r1HnjTPYDwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=ACc0CSV/; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="ACc0CSV/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202608; t=1788060074;
	bh=pwvHQ7sQ4i5V9A8dA+KcJSp5mEoEfWmEAr9Pci8Kj38=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ACc0CSV/UnyIrjvvXf4rVETmaOTLATs6IPxfK4FRfp1f2azHo0ZiHYJ8E0+PoR949
	 0H0gfmlb5V9QxnHMwiFR6SWBQ10J25p0gh8vrzid1s1nuARbxHMzQQ6um/jEwx+9kN
	 DFfha8mRA2pJgyVCydjYz5gDq6V15IovFqVS/OkXRktIQKj8J1fj8oSthA8yys/kUJ
	 m8b1xscjnFExTuBf93h4ovm9AESJEOkapffqn0ToLoL+Ol8+MCMsWB1MzPjwR9gU94
	 FR+6RAV8LBX8c3sy3RKKO0md7CrPH1x8W9kQIuf7LHtypWNRSH5paIo9b+EvW1/tcR
	 DFdNR4ignegbA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4hXcpf0GPZz4wB9; Sun, 30 Aug 2026 13:21:14 +1000 (AEST)
Date: Sun, 30 Aug 2026 13:21:06 +1000
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
Message-ID: <apOhk-NQusFgV5Sx@gractus.seuss>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
 <20260826083146.304291-3-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CWN4j8b8cQMO/8fp"
Content-Disposition: inline
In-Reply-To: <20260826083146.304291-3-herve.codina@bootlin.com>

--CWN4j8b8cQMO/8fp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 10:31:33AM +0200, Herve Codina wrote:
> In several places, libfdt assumes that the root offset (i.e. the first
> FDT_BEGIN_NODE tag) is present at the offset 0 of the structure block.
>=20
> This assumption is not correct. A FDT_NOP can be present at the offset 0
> and this is a legit case. Indeed, the device-tree specification [0]
> defines the FDT_NOP tag as follow:
>=20
>    The FDT_NOP token will be ignored by any program parsing the device
>    tree. This token has no extra data; so it is followed immediately by
>    the next token, which can be any valid token. A property or node
>    definition in the tree can be overwritten with FDT_NOP tokens to
>    remove it from the tree without needing to move other sections of
>    the tree=E2=80=99s representation in the devicetree blob.
>=20
> Nothing refers to any location for this tag and it has to be simply
> ignored. Having this tag at offset 0 doesn't make an exception, the tag
> has to be ignored.
>=20
> Introduce fdt_root_offset() in order to get the offset of the root
> node (first FDT_BEGIN_NODE tag) available in a fdt blob taking care of
> FDT_NOP tags.
>=20
> Use this function to get the root node offset instead of looking for
> this node at offset 0.
>=20
> [0] https://github.com/devicetree-org/devicetree-specification/blob/main/=
source/chapter5-flattened-format.rst?plain=3D1#L317


You convinced me of the necessity of this the last time around, but I
think the implementation could be improbved.

> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  libfdt/fdt.c       | 39 +++++++++++++++++++++++++++++--
>  libfdt/fdt_ro.c    | 57 ++++++++++++++++++++++++++++++++++++++--------
>  libfdt/fdt_rw.c    | 12 ++++++++++
>  libfdt/libfdt.h    | 15 +++++++++++-
>  libfdt/version.lds |  1 +
>  5 files changed, 111 insertions(+), 13 deletions(-)
>=20
> diff --git a/libfdt/fdt.c b/libfdt/fdt.c
> index 56d4dcb2..eb803e8a 100644
> --- a/libfdt/fdt.c
> +++ b/libfdt/fdt.c
> @@ -252,13 +252,48 @@ int fdt_check_prop_offset_(const void *fdt, int off=
set)
>  	return offset;
>  }
> =20
> -int fdt_next_node(const void *fdt, int offset, int *depth)
> +int fdt_root_offset(const void *fdt)
>  {
>  	int nextoffset =3D 0;
> +	int offset;
> +	uint32_t tag;
> +
> +	do {
> +		offset =3D nextoffset;
> +		tag =3D fdt_next_tag(fdt, offset, &nextoffset);
> +		switch (tag) {
> +		case FDT_END_NODE:
> +		case FDT_PROP:
> +			return -FDT_ERR_BADSTRUCTURE;
> +
> +		case FDT_BEGIN_NODE:
> +			return offset;
> +
> +		default:
> +			break;
> +		}
> +	} while (tag !=3D FDT_END);
> +
> +	return (nextoffset < 0) ? nextoffset : -FDT_ERR_NOTFOUND;

This should be BADSTRUCTURE rather than NOTFOUND: a dtb without a root
node is not validly constructed.  (This could matter quite a lot if
this error gets propagated up a call chain - a NOTFOUND is usually
non-fatal, but BADSTRUCTURE means there's basically nothing that can
usefully be done with the dtb, which the caller needs to know as soon
as possible).

> +}
> +
> +int fdt_next_node(const void *fdt, int offset, int *depth)
> +{
> +	int nextoffset =3D offset;

This initialiser should be omitted, since it is now overwritten in
every possible case.

>  	uint32_t tag;
> =20
> +	/*
> +	 * Get the root node if asked for next node from the root node
> +	 * (offset =3D=3D 0) or if the given offset is not valid (negative).
> +	 */
> +	if (offset <=3D 0) {
> +		nextoffset =3D fdt_root_offset(fdt);
> +		if (nextoffset < 0)
> +			return nextoffset;
> +	}
> +

The various changes you've made look correct, but I don't love the
fact that it requires nearly every function which takes a node offset
to be altered non-trivially.  As well as making for a large diff, it
strikes me as fragile - a bit of logic that could easily be forgotten
on a new function.

I think we want to move the offset 0 handling into a common helper.
Logically that should be fdt_check_node_offset_(), since that's the
standard way of validating a node offset parameter.  As you've pointed
out, that doesn't work with the current signature/semantics of
fdt_check_node_offset_() - but it's a strictly internal function, so
we can alter its signature freely.

>  	if (offset >=3D 0)
> -		if ((nextoffset =3D fdt_check_node_offset_(fdt, offset)) < 0)
> +		if ((nextoffset =3D fdt_check_node_offset_(fdt, nextoffset)) < 0)
>  			return nextoffset;
> =20
>  	do {
> diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> index 11f2e2ee..856c62f1 100644
> --- a/libfdt/fdt_ro.c
> +++ b/libfdt/fdt_ro.c
> @@ -231,6 +231,12 @@ int fdt_subnode_offset_namelen(const void *fdt, int =
offset,
> =20
>  	FDT_RO_PROBE(fdt);
> =20
> +	if (!offset) {
> +		offset =3D fdt_root_offset(fdt);
> +		if (offset < 0)
> +			return offset;
> +	}
> +
>  	for (depth =3D 0;
>  	     (offset >=3D 0) && (depth >=3D 0);
>  	     offset =3D fdt_next_node(fdt, offset, &depth))
> @@ -253,13 +259,17 @@ int fdt_path_offset_namelen(const void *fdt, const =
char *path, int namelen)
>  {
>  	const char *end =3D path + namelen;
>  	const char *p =3D path;
> -	int offset =3D 0;
> +	int offset;
> =20
>  	FDT_RO_PROBE(fdt);
> =20
>  	if (!can_assume(VALID_INPUT) && namelen <=3D 0)
>  		return -FDT_ERR_BADPATH;
> =20
> +	offset =3D fdt_root_offset(fdt);
> +	if (offset < 0)
> +		return offset;
> +
>  	/* see if we have an alias */
>  	if (*path !=3D '/') {
>  		const char *q =3D memchr(path, '/', end - p);
> @@ -304,14 +314,24 @@ int fdt_path_offset(const void *fdt, const char *pa=
th)
> =20
>  const char *fdt_get_name(const void *fdt, int nodeoffset, int *len)
>  {
> -	const struct fdt_node_header *nh =3D fdt_offset_ptr_(fdt, nodeoffset);
> +	const struct fdt_node_header *nh;
>  	const char *nameptr;
>  	int err;
> =20
> +	if (!nodeoffset) {
> +		nodeoffset =3D fdt_root_offset(fdt);
> +		if (nodeoffset < 0) {
> +			err =3D nodeoffset;
> +			goto fail;
> +		}
> +	}
> +
> +
>  	if (!can_assume(VALID_DTB) && (((err =3D fdt_ro_probe_(fdt)) < 0)
>  	    || ((err =3D fdt_check_node_offset_(fdt, nodeoffset)) < 0)))
>  			goto fail;
> =20
> +	nh =3D fdt_offset_ptr_(fdt, nodeoffset);
>  	nameptr =3D nh->name;
> =20
>  	if (!can_assume(LATEST) && fdt_version(fdt) < 0x10) {
> @@ -344,6 +364,12 @@ int fdt_first_property_offset(const void *fdt, int n=
odeoffset)
>  {
>  	int offset;
> =20
> +	if (!nodeoffset) {
> +		nodeoffset =3D fdt_root_offset(fdt);
> +		if (nodeoffset < 0)
> +			return nodeoffset;
> +	}
> +
>  	if ((offset =3D fdt_check_node_offset_(fdt, nodeoffset)) < 0)
>  		return offset;
> =20
> @@ -581,7 +607,7 @@ int fdt_get_path(const void *fdt, int nodeoffset, cha=
r *buf, int buflen)
>  	if (buflen < 2)
>  		return -FDT_ERR_NOSPACE;
> =20
> -	for (offset =3D 0, depth =3D 0;
> +	for (offset =3D fdt_root_offset(fdt), depth =3D 0;
>  	     (offset >=3D 0) && (offset <=3D nodeoffset);
>  	     offset =3D fdt_next_node(fdt, offset, &depth)) {
>  		while (pdepth > depth) {
> @@ -619,7 +645,7 @@ int fdt_get_path(const void *fdt, int nodeoffset, cha=
r *buf, int buflen)
>  	else if (offset =3D=3D -FDT_ERR_BADOFFSET)
>  		return -FDT_ERR_BADSTRUCTURE;
> =20
> -	return offset; /* error from fdt_next_node() */
> +	return offset; /* error from fdt_next_node() or fdt_root_offset() */
>  }
> =20
>  int fdt_supernode_atdepth_offset(const void *fdt, int nodeoffset,
> @@ -627,13 +653,21 @@ int fdt_supernode_atdepth_offset(const void *fdt, i=
nt nodeoffset,
>  {
>  	int offset, depth;
>  	int supernodeoffset =3D -FDT_ERR_INTERNAL;
> +	int root_offset;
> =20
>  	FDT_RO_PROBE(fdt);
> =20
>  	if (supernodedepth < 0)
>  		return -FDT_ERR_NOTFOUND;
> =20
> -	for (offset =3D 0, depth =3D 0;
> +	root_offset =3D fdt_root_offset(fdt);
> +	if (root_offset < 0)
> +		return root_offset;
> +
> +	if (!nodeoffset)
> +		nodeoffset =3D root_offset;
> +
> +	for (offset =3D root_offset, depth =3D 0;

Do you need this special casing? Won't the fact you've update
fdt_next_node() to handle the offset 0 case be enough?

>  	     (offset >=3D 0) && (offset <=3D nodeoffset);
>  	     offset =3D fdt_next_node(fdt, offset, &depth)) {
>  		if (depth =3D=3D supernodedepth)
> @@ -663,12 +697,15 @@ int fdt_supernode_atdepth_offset(const void *fdt, i=
nt nodeoffset,
>  int fdt_node_depth(const void *fdt, int nodeoffset)
>  {
>  	int nodedepth;
> -	int err;
> +	int offset;
> +
> +	offset =3D fdt_supernode_atdepth_offset(fdt, nodeoffset, 0, &nodedepth);
> +	if (offset < 0)
> +		return offset;
> +
> +	if (!can_assume(LIBFDT_FLAWLESS) && offset !=3D fdt_root_offset(fdt))
> +		return -FDT_ERR_INTERNAL;
> =20
> -	err =3D fdt_supernode_atdepth_offset(fdt, nodeoffset, 0, &nodedepth);
> -	if (err)
> -		return (can_assume(LIBFDT_FLAWLESS) || err < 0) ? err :
> -			-FDT_ERR_INTERNAL;

Replacing the extremly cryptic logic above is a nice byproduct.

>  	return nodedepth;
>  }
> =20
> diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
> index 850aafe4..ceef49b8 100644
> --- a/libfdt/fdt_rw.c
> +++ b/libfdt/fdt_rw.c
> @@ -226,6 +226,12 @@ static int fdt_add_property_(void *fdt, int nodeoffs=
et, const char *name,
>  	int err;
>  	int allocated;
> =20
> +	if (!nodeoffset) {
> +		nodeoffset =3D fdt_root_offset(fdt);
> +		if (nodeoffset < 0)
> +			return nodeoffset;
> +	}
> +
>  	if ((nextoffset =3D fdt_check_node_offset_(fdt, nodeoffset)) < 0)
>  		return nextoffset;
> =20
> @@ -377,6 +383,12 @@ int fdt_add_subnode_namelen(void *fdt, int parentoff=
set,
> =20
>  	FDT_RW_PROBE(fdt);
> =20
> +	if (!parentoffset) {
> +		parentoffset =3D fdt_root_offset(fdt);
> +		if (parentoffset < 0)
> +			return parentoffset;
> +	}
> +
>  	offset =3D fdt_subnode_offset_namelen(fdt, parentoffset, name, namelen);
>  	if (offset >=3D 0)
>  		return -FDT_ERR_EXISTS;
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> index c69a18ed..7a1915a5 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -503,6 +503,19 @@ int fdt_num_mem_rsv(const void *fdt);
>   */
>  int fdt_get_mem_rsv(const void *fdt, int n, uint64_t *address, uint64_t =
*size);
> =20
> +/**
> + * fdt_root_offset - Get the offset of the root node
> + * @fdt: pointer to the device tree blob
> + *
> + * The root node can be located after the offset 0. Indeed FDT_NOP tags =
can be
> + * present at offset 0. fdt_root_offset() takes care of those possible F=
DT_NOP
> + * tags.
> + *
> + * returns: offset of the root node or negative libfdt error value other=
wise
> + */
> +int fdt_root_offset(const void *fdt);
> +
> +
>  /**
>   * fdt_subnode_offset_namelen - find a subnode based on substring
>   * @fdt: pointer to the device tree blob
> @@ -1025,7 +1038,7 @@ int fdt_get_path(const void *fdt, int nodeoffset, c=
har *buf, int buflen);
>   * at a specific depth from the root (where the root itself has depth
>   * 0, its immediate subnodes depth 1 and so forth).  So
>   *	fdt_supernode_atdepth_offset(fdt, nodeoffset, 0, NULL);
> - * will always return 0, the offset of the root node.  If the node at
> + * will always return the offset of the root node.  If the node at
>   * nodeoffset has depth D, then:
>   *	fdt_supernode_atdepth_offset(fdt, nodeoffset, D, NULL);
>   * will return nodeoffset itself.
> diff --git a/libfdt/version.lds b/libfdt/version.lds
> index cbfef546..d0b71669 100644
> --- a/libfdt/version.lds
> +++ b/libfdt/version.lds
> @@ -7,6 +7,7 @@ LIBFDT_1.2 {
>  		fdt_string;
>  		fdt_num_mem_rsv;
>  		fdt_get_mem_rsv;
> +		fdt_root_offset;
>  		fdt_subnode_offset_namelen;
>  		fdt_subnode_offset;
>  		fdt_path_offset_namelen;
> --=20
> 2.55.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--CWN4j8b8cQMO/8fp
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmqToZMACgkQzQJF27ox
2GflyQ/+JsvDvjlIRSGuLsc7QH2/XtCB56dW841tZ1J6NqNO0jAd/9eTRszw1B92
2PC0R2w0MpzCowf7jcDK61byqeolqnJsNxgyudg/qoWq2FBkoTUhKi3zvagkMRos
JPZ/ZMW3vT2MahKDZgD+XD7aIVASa5YlO/LKqLGGQW6JwRVNqugZby9mOs8TBGW7
OM3+QVMrl5dWp0TUuKBN8ceXUrXGRCxaPyo/1nKRwBaXJStqnxuCmsFO7TJPUUvi
WnbuBYi2msQL/37t/UaY7J6q9MK36sXvqSKkbYqyBR0DaBK34QmYX8xqy1uiLeNk
rbMi47X+sQ+eqsYUOcpbSTImu8bHmaKvANd+R+rfOnIZbRco6oRS25sVYgc1YUdj
oB3OCaQPttwoIZWtbnkIwPtnISfY3lP8jnUocUnYzgCDnluvMSvqvgZVhhZgPAYX
doBjHNmxNjwelN+/c+KBeVNd0qBMMe90fuugEv0JkACpUXby1Ui2XWgA6UFj9LCa
CG9zm+tcBf3TGLruFH/pjc7Tp/McDJSH8Of5i9Akw3rQZVE1LgkXx/O5YAF6OFpZ
62/H7HgzWNu5L6USqY3Br5h4pnXAXs8q7g3AoXEGmRnzjHckyCavFD8Owyaqv+c6
KYjeTWAL2F0SkKfAd9r359QbCxFLVy0iLe1wC8avAi3JWYOdFpU=
=yU4H
-----END PGP SIGNATURE-----

--CWN4j8b8cQMO/8fp--
