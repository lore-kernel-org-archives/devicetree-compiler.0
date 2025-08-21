Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5338227F756
	for <devicetree-compiler@vger.kernel.org>; Thu, 21 Aug 2025 04:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755750708; cv=none; b=ZhauhL9z942uc4jyZcQ+QaDXNRCq0Cb2T5ceoYtOOS7nTKX/3X8wV43E0ljmkF4c4QhiNd5s5c1ZfjFE5/fcgmysg6XvCDxhE3BLK4xkbAUxCWZMzlwDKNwwUPlIKX712SzxdPkjAQu1AhcBEhzGajXa0uWlgvgz7QJYF5j3NyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755750708; c=relaxed/simple;
	bh=XEvLQDflCZqcK0oHf+ldTOjbs+MZPlYiPkL3qSY1YRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a70rVIzWb3wlr2TqxFuQ/XHHSYdedv+xsEOsZR+pf224QOLbfFHWuOhHtUm+j2fqFf97qeH8gXlk0oUjO+LaDO9GiQZkG7ITYiWgXsfheQjDuoHWRI3/CVQ0ArqKuXy1FzKAzbV+tcag1eCSrXX6a0m0iHkDz6XQTv+a+ZiQ0gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=giQEtQB9; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="giQEtQB9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202508; t=1755750703;
	bh=Wyqmv29179eCdWAlJjv5ttgvK43k2stZAoVFatgW+1w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=giQEtQB9sSjl0bxwmjs67Kblu87pNspiWjpklApdJa0y1Lwf/+LbSfNlILDZpl+B7
	 jnm2qu+FjdiGnl6dEjYG6wTXXx5KQ/TlOf/KQO5y4WigBNWtq61oIxY9DWTlMH2Cw5
	 ZhAmPpqe/snxPAUpNb3437huHR5+Jf8JL1i+qkSlA6NJ+rQ9HOqas8o7IYU6/8+wUm
	 uRRE8cpmlZ/3ro+8H5M6Lx9lFnSsGLZR/ZH2h+JE2ehPzu0XZucKiQVwODnO2Xgrmc
	 g2DcMCYRrzYufIiqPYYCxwUYyb7fnPGhVjbEmOVl7OAOBTa8v4JQdfSx6xSyuuXNJn
	 SKzGMxfX4UQ2w==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4c6r4b5NHLz4wcg; Thu, 21 Aug 2025 14:31:43 +1000 (AEST)
Date: Thu, 21 Aug 2025 14:23:56 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH 5/6] Restore phandle references from __local_fixups__ node
Message-ID: <aKafXFazdBqX596x@zatzit>
References: <cover.1755692822.git.u.kleine-koenig@baylibre.com>
 <cf647c343aded75d394a49d86b3848fd9812f91e.1755692822.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TZjokstcb5H0sc9P"
Content-Disposition: inline
In-Reply-To: <cf647c343aded75d394a49d86b3848fd9812f91e.1755692822.git.u.kleine-koenig@baylibre.com>


--TZjokstcb5H0sc9P
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 20, 2025 at 03:11:31PM +0200, Uwe Kleine-K=F6nig wrote:
> The __local_fixups__ node contains information about phandles. Parse it
> to improve the result when decompiling a device tree blob.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
> ---
>  dtc.c        |  2 ++
>  dtc.h        |  2 ++
>  livetree.c   | 57 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  treesource.c | 33 ++++++++++++++++++++++++++++++
>  4 files changed, 94 insertions(+)
>=20
> diff --git a/dtc.c b/dtc.c
> index 63a6c85da5cf..9f90b373967d 100644
> --- a/dtc.c
> +++ b/dtc.c
> @@ -343,6 +343,8 @@ int main(int argc, char *argv[])
>  	if (generate_symbols)
>  		generate_label_tree(dti, "__symbols__", true);
> =20
> +	local_fixup_phandles(dti, "__local_fixups__");
> +
>  	if (generate_fixups) {
>  		generate_fixups_tree(dti, "__fixups__");
>  		generate_local_fixups_tree(dti, "__local_fixups__");
> diff --git a/dtc.h b/dtc.h
> index f97f3c29e2d4..d07a583441f6 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -343,6 +343,7 @@ void generate_labels_from_tree(struct dt_info *dti, c=
onst char *name);
>  void generate_label_tree(struct dt_info *dti, const char *name, bool all=
ocph);
>  void generate_fixups_tree(struct dt_info *dti, const char *name);
>  void generate_local_fixups_tree(struct dt_info *dti, const char *name);
> +void local_fixup_phandles(struct dt_info *dti, const char *name);
> =20
>  /* Checks */
> =20
> @@ -358,6 +359,7 @@ struct dt_info *dt_from_blob(const char *fname);
> =20
>  /* Tree source */
> =20
> +void add_phandle_marker(struct dt_info *dti, struct property *prop, unsi=
gned int offset);
>  void dt_to_source(FILE *f, struct dt_info *dti);
>  struct dt_info *dt_from_source(const char *f);
> =20
> diff --git a/livetree.c b/livetree.c
> index 8aafc9aa5cd6..3dbef9071017 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -1160,3 +1160,60 @@ void generate_local_fixups_tree(struct dt_info *dt=
i, const char *name)
>  			"Warning: Preexisting data in %s malformed, some content could not be=
 added.\n",
>  			name);
>  }
> +
> +static void local_fixup_phandles_node(struct dt_info *dti, struct node *=
lf, struct node *n)
> +{
> +	struct property *lfp;
> +	struct node *lfsubnode;
> +
> +	for_each_property(lf, lfp) {
> +		struct property *p =3D get_property(n, lfp->name);
> +		fdt32_t *offsets =3D (fdt32_t *)lfp->val.val;
> +		size_t i;
> +
> +		if (!p) {
> +			if (quiet < 1)
> +				fprintf(stderr, "Warning: Property %s in %s referenced in __local_fi=
xups__ missing\n",
> +					lfp->name, n->fullpath);
> +			continue;
> +		}
> +
> +		/*
> +		 * Each property in the __local_fixups__ tree is a concatenation
> +		 * of offsets, so it must be a multiple of sizeof(fdt32_t).
> +		 */
> +		if (lfp->val.len % sizeof(fdt32_t)) {
> +			if (quiet < 1)
> +				fprintf(stderr, "Warning: property %s in /__local_fixups__%s malform=
ed\n",
> +					lfp->name, n->fullpath);
> +			continue;
> +		}
> +
> +		for (i =3D 0; i < lfp->val.len / sizeof(fdt32_t); i++)
> +			add_phandle_marker(dti, p, dtb_ld32(offsets + i));
> +	}
> +
> +	for_each_child(lf, lfsubnode) {
> +		struct node *subnode =3D get_subnode(n, lfsubnode->name);
> +
> +		if (!subnode) {
> +			if (quiet < 1)
> +				fprintf(stderr, "Warning: node %s/%s referenced in __local_fixups__ =
missing\n",
> +					lfsubnode->name, n->fullpath);
> +			continue;
> +		}
> +
> +		local_fixup_phandles_node(dti, lfsubnode, subnode);
> +	}
> +}
> +
> +void local_fixup_phandles(struct dt_info *dti, const char *name)
> +{
> +	struct node *an;
> +
> +	an =3D get_subnode(dti->dt, name);
> +	if (!an)
> +		return;
> +
> +	local_fixup_phandles_node(dti, an, dti->dt);
> +}
> diff --git a/treesource.c b/treesource.c
> index 576495902f0d..5b8d7a679519 100644
> --- a/treesource.c
> +++ b/treesource.c
> @@ -183,6 +183,39 @@ static void add_string_markers(struct property *prop=
, unsigned int offset, int l
>  		mi =3D add_marker(mi, TYPE_STRING, offset + l, NULL);
>  }
> =20
> +void add_phandle_marker(struct dt_info *dti, struct property *prop, unsi=
gned int offset)
> +{
> +	cell_t phandle;
> +	struct node *refn;
> +	char *ref;
> +
> +	if (prop->val.len < offset + 4) {
> +		if (quiet < 1)
> +			fprintf(stderr,
> +				"Warning: property %s too short to contain a phandle at offset %u\n",
> +				prop->name, offset);

You print the error, but don't exit the function.

> +
> +	}
> +
> +	phandle =3D dtb_ld32(prop->val.val + offset);
> +	refn =3D get_node_by_phandle(dti->dt, phandle);
> +
> +	if (!refn) {
> +		if (quiet < 1)
> +			fprintf(stderr,
> +				"Warning: node referenced by phandle 0x%x in property %s not found\n=
",
> +				phandle, prop->name);
> +		return;
> +	}
> +
> +	if (refn->labels)
> +		ref =3D refn->labels->label;
> +	else
> +		ref =3D refn->fullpath;

The new marker will point to data in different structures by
reference, which makes me worried about lifetimes.  But this is not
new, and probably not the only hairy lifetime issue in dtc.

> +
> +	add_marker(&prop->val.markers, REF_PHANDLE, offset, ref);
> +}
> +
>  static enum markertype guess_value_type(struct property *prop, unsigned =
int offset, int len)
>  {
>  	const char *p =3D prop->val.val + offset;

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--TZjokstcb5H0sc9P
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmimn1IACgkQzQJF27ox
2Gflog/+LBCZ3fHnsaUT2tAxBhFXuETJUizkFnVpvxKHLey6sEUYvu4eo55eOBEJ
p5PeWBcYWKNcybJJCZQaLmUdEtjwisfqJhXKVPyiywVTLcuE8ueP19DUu3tEzv76
M2c64yQLk4WnHnUjNWZtnqjH9uW3p3y2j8fel9ujKMp7AoZm1Iy9PuS0awo0qe+U
Mp3xLQ2XZROPaGMhLQ5pKLwr9cZmlj8FKI2ZqYGs0zQW5iwImYpU0tuZj/9n+3su
SzLoZGypWU7ysY9wrrAn1APkpwh68Pw1xMgEEXZpBJqiRqpizJ3z3Xr7TgjyiYKr
F/7CDH78ciE9YjpiAVtr32y7rGz80wWLyhfuI4VEYej1rShbuGFIFtSvlxAl7f/y
I29aMEYsvTjc6oM8qkv9rv5NUsn5pQzeZwAKEylhyieXzzTWKXltN0o7IOLsAsqe
4ZAbihmou7DxOTIfbKgP5YyAv/AQf68eQ/IyrAo77QcpNCLjFOZSAX/bRqfb2r1t
Yj7kIgqYURUS2lFHLfjKBHcRVtP3Vo9QRVimmhA1n6ns4G8d9+AlHUHtKDiTAvcz
i1JINcnBCnMFD4kRFouAwJe1U2LqpCuOR64YK2DoGo33VNO8s+cskz0rqCSOQHLx
OOcPLwAWHIfjH6s32r7Pp651jnbOrAdUTREsB5QfU4FZsYCsiCk=
=rGvR
-----END PGP SIGNATURE-----

--TZjokstcb5H0sc9P--
