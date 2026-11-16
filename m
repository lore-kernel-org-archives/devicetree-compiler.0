Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794803689;
	b=tYzXcGa2u8Ad4d/iYwzEyAzUxvFCFdXtdq3bjCN18SO+hc5yD9QyhLZj1iRTXZJhs5fi
	 F8usvpOxMJx3eMm6zOu78zDj83TLXNjDVrLZWicryHQeGPZQ4OZbJ4w1yaes452QMGD6g
	 Xvjf7eXyPBWVHXC+Kt7FAjQLoW6hq8N9pu1c6zf+uEPrDwoD44qNIAIAcXQKjbYCENtRA
	 yuBnTgp22IbHIlMiJX3IgrB9yuDok88BcIVpuM/LgNIWGoAA1xDPAY2VwJNBJv/p8H8n1
	 AW2Noz9ehDUnQ9T6RJCv4z+ZWXpe758RUdPrU3vJ5konrAWXmBABu9wuvgo5KxgzfWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794803689;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=TbJp/IIKkAdzPcFulE7WcoZc6glnyN9ckCwx3JdyggU=;
	b=aKrIptlDa3zgv5YZkbWMHMs17et6O+bRlrTJlCeyGpkNV1LywEaWBzU+wuvyoNuXnJ0k
	 g6BSNviORa7ZtE9LeiWAct/3XOVlLDa3Wl6BRPrLPMOg91AmS3bBlPHLAimtALL1byYok
	 i7OHnUGHiUVbnRaPOoLwohlCDe8zA+w/XrtCeYZgvEAbk4x5zClSMWa3stFci+xrSzJCD
	 k3ht20eIHuf9283mRDgk1OGsVa+1MFJMWJZRzl2+K92uIbt7o7Yq/6qhKOb/k/TteoZp6
	 Vyjdrj3xC/l0hvtz6rXiBGCVHswJH4U0yxZt+O5ngYse/khdmDMHICEPEVJ4hcyPqAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=K49EMIYW;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F92606A333
	for <devicetree-compiler@vger.kernel.org>; Mon, 16 Nov 2026 04:34:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95F92606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=K49EMIYW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1794803680;
	bh=TbJp/IIKkAdzPcFulE7WcoZc6glnyN9ckCwx3JdyggU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K49EMIYWSfMJJeB80HLbI6OSDZUYL1jWf3ok0UrjKXwQJhXobRXMj1/X1QK4VeFAM
	 P30VW70+vDEjqN7O4F0ftPId8jwDkkl8rDdP7t2DlU82yKfHy2V4CipVnsoTOTPFt0
	 5Lpi3gtEKxchf+JcHZ/ccygW28Te0ef0JM/zCivW/7iPZSMKecn/dL+hP5goJKxvCC
	 oM6fS4ugg3twhUwLsCkbFv5VoJmvo2SlGEhuAOOx73umaU+OoSCISJUkCB6FPBLZu8
	 5I+jpEXxzPxUeKJP/5XdhkfuMJYa/K6T6R6L2D4CR4xIqJRW6d1HlsodkunyU5HyPZ
	 GgdZUY7S5CR+g==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jSZlN1sDyz4wSL; Mon, 16 Nov 2026 15:34:40 +1100 (AEDT)
Date: Mon, 16 Nov 2026 14:49:43 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v3 13/18] dtc: Add helpers for the errors when merging a
 fragment
Message-ID: <avp9VgVC94lznIeY@gractus.seuss>
References: <20261106195159.2623314-1-sjg@chromium.org>
 <20261106195159.2623314-14-sjg@chromium.org>
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
	protocol="application/pgp-signature"; boundary="prnvG3mHJxpRzAss"
Content-Disposition: inline
In-Reply-To: <20261106195159.2623314-14-sjg@chromium.org>

--prnvG3mHJxpRzAss
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 06, 2026 at 12:51:40PM -0700, Simon Glass wrote:
> Three of the merge functions look up the node which a fragment refers to
> and report 'Label or path not found' if it is missing, and two check
> for a label-relative reference in a plugin. Each of these has its own
> copy of the error, so a change to a message or its position must be made
> in several places.
>=20
> Add lookup_ref() to look up the node, reporting an error if it is not
> found, and check_relative_ref() to report a label-relative reference.
> Use these in the merge functions.
>=20
> The output does not change.
>=20
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>

A helper function is certainly an improvement over duplication.  But
could we do this more elegantly by putting the checks into
merge_fragment() and passing the already resolved reference to the
individual merge_*() functions?

> ---
>=20
> (no changes since v2)
>=20
> Changes in v2:
> - Return true from check_relative_ref() if the reference is OK
>=20
>  livetree.c | 75 +++++++++++++++++++++++++++++++++---------------------
>  1 file changed, 46 insertions(+), 29 deletions(-)
>=20
> diff --git a/livetree.c b/livetree.c
> index a1d5d71..a70a7ba 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -573,6 +573,40 @@ static bool is_ref_relative(const char *ref)
>  	return ref[0] !=3D '/' && strchr(&ref[1], '/');
>  }
> =20
> +/*
> + * Report an error at pos if a fragment uses a label-relative reference,=
 which
> + * a plugin does not support
> + *
> + * Returns true if the reference is OK, false if there is an error
> + */
> +static bool check_relative_ref(struct fragment *f, struct srcpos *pos)
> +{
> +	if (!is_ref_relative(f->ref))
> +		return true;
> +	srcpos_error(pos, "Error",
> +		     "Label-relative reference %s not supported in plugin",
> +		     f->ref);
> +
> +	return false;
> +}
> +
> +/*
> + * Look up the node which a fragment refers to, reporting an error if it=
 is
> + * not found
> + *
> + * Returns the node, or NULL if it is not found
> + */
> +static struct node *lookup_ref(struct node *dt, struct fragment *f)
> +{
> +	struct node *target =3D get_node_by_ref(dt, f->ref);
> +
> +	if (!target)
> +		srcpos_error(f->ref_srcpos, "Error",
> +			     "Label or path %s not found", f->ref);
> +
> +	return target;
> +}
> +
>  /*
>   * Make the tree at *dtp from a first fragment which refers to a label o=
r path,
>   * rather than being the root node. This is only valid in a plugin, wher=
e the
> @@ -582,17 +616,14 @@ static bool is_ref_relative(const char *ref)
>   */
>  static bool merge_first_ref(struct node **dtp, struct fragment *f, bool =
plugin)
>  {
> -	bool ok =3D true;
> +	bool ok;
> =20
> -	if (!plugin) {
> +	if (plugin) {
> +		ok =3D check_relative_ref(f, f->node->srcpos);
> +	} else {
>  		srcpos_error(f->node->srcpos, "Error",
>  			     "Label or path %s not found", f->ref);
>  		ok =3D false;
> -	} else if (is_ref_relative(f->ref)) {
> -		srcpos_error(f->node->srcpos, "Error",
> -			     "Label-relative reference %s not supported in plugin",
> -			     f->ref);
> -		ok =3D false;
>  	}
>  	/* Make a new, empty tree with a fragment@N node for the reference */
>  	*dtp =3D add_orphan_node(name_node(build_node(NULL, NULL, NULL), ""),
> @@ -618,13 +649,8 @@ static bool merge_ref(struct node *dt, struct fragme=
nt *f, bool plugin)
> =20
>  	assert(f->type =3D=3D FRAGMENT_NODE);
>  	if (plugin) {
> -		if (is_ref_relative(f->ref)) {
> -			srcpos_error(f->label ? f->label_srcpos : f->ref_srcpos,
> -				     "Error",
> -				     "Label-relative reference %s not supported in plugin",
> -				     f->ref);
> -			ok =3D false;
> -		}
> +		ok =3D check_relative_ref(f, f->label ? f->label_srcpos :
> +					f->ref_srcpos);
>  		if (!f->label &&
>  		    (f->ref[0] =3D=3D '/' || !get_node_by_ref(dt, f->ref))) {
>  			/* Add a fragment@N node for the reference */
> @@ -633,12 +659,9 @@ static bool merge_ref(struct node *dt, struct fragme=
nt *f, bool plugin)
>  		}
>  	}
> =20
> -	target =3D get_node_by_ref(dt, f->ref);
> -	if (!target) {
> -		srcpos_error(f->ref_srcpos, "Error",
> -			     "Label or path %s not found", f->ref);
> +	target =3D lookup_ref(dt, f);
> +	if (!target)
>  		return false;
> -	}
>  	if (f->label)
>  		add_label(&target->labels, f->label);
>  	merge_nodes(target, f->node);
> @@ -653,14 +676,11 @@ static bool merge_ref(struct node *dt, struct fragm=
ent *f, bool plugin)
>   */
>  static bool merge_delete_node(struct node *dt, struct fragment *f)
>  {
> -	struct node *target =3D get_node_by_ref(dt, f->ref);
> +	struct node *target =3D lookup_ref(dt, f);
> =20
>  	assert(f->type =3D=3D FRAGMENT_DELETE_NODE);
> -	if (!target) {
> -		srcpos_error(f->ref_srcpos, "Error",
> -			     "Label or path %s not found", f->ref);
> +	if (!target)
>  		return false;
> -	}
>  	delete_node(target);
> =20
>  	return true;
> @@ -674,14 +694,11 @@ static bool merge_delete_node(struct node *dt, stru=
ct fragment *f)
>   */
>  static bool merge_omit_if_no_ref(struct node *dt, struct fragment *f)
>  {
> -	struct node *target =3D get_node_by_ref(dt, f->ref);
> +	struct node *target =3D lookup_ref(dt, f);
> =20
>  	assert(f->type =3D=3D FRAGMENT_OMIT_IF_NO_REF);
> -	if (!target) {
> -		srcpos_error(f->ref_srcpos, "Error",
> -			     "Label or path %s not found", f->ref);
> +	if (!target)
>  		return false;
> -	}
>  	omit_node_if_unused(target);
> =20
>  	return true;
> --=20
> 2.43.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--prnvG3mHJxpRzAss
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmr6fVYACgkQzQJF27ox
2GfhaA//TQRFVsF+ogFyqNkxB6HNq+MwNkSe841kayLgiGtb4wn/s/bYlY0MOeTS
uBhsGRFvFJrmgPjnvvrTE4smV2t7sn5Q319ZsnhiRwEonE0pteVeHUYmqDlQqcPx
N7/TtbjKDsCi1xAoZcx84cnXrMVYhUTWlWZ1fzBACXTWMV5hhxKtfer1cPVgaPvp
7+qOkjMPgTqs6+AqetxlPw2krCf+1o4VuU/Y6QPJEjnca3ULkaI7nbr51ml8m0Km
0P+C7irJx+jFPluCbuwBG1Q37dkXHkeZVN99SSBih2+7b610lV/PSW78MLX6Wta8
DzMGkCg5oEzJM6AN+vu1m1QgOqm+mSbdGgS1sE4bFvEFFF8PHfLh1ev0uRvfVv4r
yBnaNdKEL5irjRjV5HR/bAsvKQrEXxxzIrsmANi7ioxkG3MUQrjoXs0zDixYJ2mV
sT0BEcYXL0nLVuQ2EN5upfNfT/m8eCh+Ls09qaGuAANnDgPB4DNFHa7miNhw5iZ2
jJjA6EmU8rHRmIpmc1Q3Ki5418N3q7QnAxgTTYCNCUpC0JfZzRmhM9T9gTc3XEIz
5sr49LcqqW/arBG4Q4S7tSIyncw3QV0yS6QciUOAzs0/XGyLp4obulyUJ8H7Dygh
vpEObMXnG4pVilxQhgWVeu+JWhC8K3s3B61j5YE67X43W5dDxA4=
=RP68
-----END PGP SIGNATURE-----

--prnvG3mHJxpRzAss--
