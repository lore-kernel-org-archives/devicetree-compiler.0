Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794542959;
	b=f70Wiiq0n59cjBE2fxHrwnG+QEOBU1khEeuZEaSLhb4aNWuSA7SL7IGr3h3Oh3WQhd4G
	 0fgSkQgQ4aKKJv4OhsA23waWlSc4q1WjD+av2v69S1ahu3t5htX/yhNzw/XX3XHcUp9FA
	 I4j5SdNAgdfnCxJCVYuJ8iaVPkY+NLD6mTg7+LiUbg/R+m8vZ7GtlUtDoA3J68xf+eunJ
	 QHG+8qk1IDl+tHx77EN1wLmX4HBXVyqizah3qqyamntSCNRUIxhGLQuX4bbVv7e4rGFih
	 oaRGTETTqer3yyRcKeczg282XdYspjbwlw0VjGLm+uNU0iYgvPMI9zxQjFkkms25aYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794542959;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=YwTTWzotzYloPMhZ71J4IfO3vkU2p3m4dpNJdmvWhME=;
	b=4CQB4IbEtq9NGUeyP1iF29ATrq5qIyR1+okmAot0BvmgpdlNRlBXc9jV+StJ6DzCbm0i
	 Um1HmmH754hWTZ209yndPaV2OZ0La7z6diwJQ0xYHlEvgS5L1Gh25N/goVaEM9Te3hBY9
	 kytTkTSbQ8kQQNVeObTr8eWjN1xAsJ0FcxS49/3OPmtvewBsniwGwgFYTkuS9orGSKxm4
	 BXi7tJqmepI8uf7/xU6ES35lvWTu7eY4X+RXgkpydYMGTD8SCnFV+WgBlSwUxHMKs8FFc
	 w9BxR/kTdIftqeDUNcCatQ7oR3nWJyaFJTSV1EcLzuVh5X88iCjdmGipPcy8YJXpwEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=KzUSeMve;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C94606A32A
	for <devicetree-compiler@vger.kernel.org>; Fri, 13 Nov 2026 04:09:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14C94606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=KzUSeMve
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1794542956;
	bh=YwTTWzotzYloPMhZ71J4IfO3vkU2p3m4dpNJdmvWhME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KzUSeMveQF+jQG3B2hecM3/uUOcp2vHUeWyxXwfUrS2Z9sD7G4JjPNODc+aYzqOdd
	 YqXi+1tmI+7kYQevtAyGQUTC0NyvvgyBtoQYGRgiD+e+DYzieSSsajKJZPEB9GQI/M
	 TOtqHwde9zbziPg6X4e6YBshhUdkWigqNTmddTdl60/78iqQGUJlNLf1RH5NdC2I6i
	 fscHcII/1LRvTeIH/jjSk+UtWINnuJ7M4Dv2LZDvyKLEcMkFbGZjfp8mxS0/bqmdK4
	 Rrf4cOsUPmzg6Z6SbwtNfBi/mMNm49BPMn+yf9VDZ3YMPBIF+zyDbjVYvyW2q24H/4
	 6UE/54uHRfp8g==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jQkKS0Kqkz4wTj; Fri, 13 Nov 2026 15:09:16 +1100 (AEDT)
Date: Fri, 13 Nov 2026 14:49:34 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v3 04/18] dtc: Move the /delete-node/ handling out of the
 grammar
Message-ID: <avaIzYnu1BdPcTAf@gractus.seuss>
References: <20261106195159.2623314-1-sjg@chromium.org>
 <20261106195159.2623314-5-sjg@chromium.org>
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
	protocol="application/pgp-signature"; boundary="5qtrCr4kIUygXshX"
Content-Disposition: inline
In-Reply-To: <20261106195159.2623314-5-sjg@chromium.org>

--5qtrCr4kIUygXshX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 06, 2026 at 12:51:31PM -0700, Simon Glass wrote:
> The grammar actions merge each top-level fragment of a dts file into the
> tree as it is parsed, so the merge logic is spread over the rules for
> each kind of fragment. This makes it hard to follow and to change.
>=20
> As a first step towards moving this logic into livetree.c, move the
> action for a top-level /delete-node/ into a new merge_delete_node(),
> passing it a struct fragment for the reference.
>=20
> The output does not change.
>=20
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>

LGTM, except for any rework needed to accomodate changes suggested in
earlier patches.


> ---
>=20
> (no changes since v2)
>=20
> Changes in v2:
> - Use dt_ref instead of fragment_ref
> - Return true on success from merge_delete_node()
> - Check the fragment type with assert()
>=20
>  dtc-parser.y | 11 ++++-------
>  dtc.h        |  1 +
>  livetree.c   | 20 ++++++++++++++++++++
>  3 files changed, 25 insertions(+), 7 deletions(-)
>=20
> diff --git a/dtc-parser.y b/dtc-parser.y
> index e47f80d..bba98b6 100644
> --- a/dtc-parser.y
> +++ b/dtc-parser.y
> @@ -238,14 +238,11 @@ devicetree:
>  		}
>  	| devicetree DT_DEL_NODE dt_ref ';'
>  		{
> -			struct node *target =3D get_node_by_ref($1, $3);
> -
> -			if (target)
> -				delete_node(target);
> -			else
> -				ERROR(&@3, "Label or path %s not found", $3);
> -
> +			struct fragment *f;
> =20
> +			f =3D build_fragment_delete_node($3, &@3);
> +			if (!merge_delete_node($1, f))
> +				treesource_error =3D true;
>  			$$ =3D $1;
>  		}
>  	| devicetree DT_OMIT_NO_REF dt_ref ';'
> diff --git a/dtc.h b/dtc.h
> index f15a162..5dca8bc 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -372,6 +372,7 @@ struct fragment *build_fragment_omit_if_no_ref(char *=
ref,
>  					       struct srcpos *ref_srcpos);
>  struct fragment *append_fragment(struct fragment *list, struct fragment =
*new);
>  void free_fragment(struct fragment *f);
> +bool merge_delete_node(struct node *dt, struct fragment *f);
> =20
>  struct dt_info {
>  	unsigned int dtsflags;
> diff --git a/livetree.c b/livetree.c
> index 85725d3..35beee0 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -567,6 +567,26 @@ struct dt_info *build_dt_info(unsigned int dtsflags,
>  	return dti;
>  }
> =20
> +/*
> + * Delete the node which a /delete-node/ fragment refers to
> + *
> + * Returns true on success, false on an error, which has been reported.
> + */
> +bool merge_delete_node(struct node *dt, struct fragment *f)
> +{
> +	struct node *target =3D get_node_by_ref(dt, f->ref);
> +
> +	assert(f->type =3D=3D FRAGMENT_DELETE_NODE);
> +	if (!target) {
> +		srcpos_error(f->ref_srcpos, "Error",
> +			     "Label or path %s not found", f->ref);
> +		return false;
> +	}
> +	delete_node(target);
> +
> +	return true;
> +}
> +
>  /*
>   * Tree accessor functions
>   */
> --=20
> 2.43.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--5qtrCr4kIUygXshX
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmr2iM0ACgkQzQJF27ox
2Gflsg/+PZ5F7sbE7UsLMuVdmuuBQyYnSUZBmfw13ZAlxWIeqwuPpGj95Iz/+vLU
2My/edSkKz9uvjzLMuH/dWXjE9kRmJVFUrohXyw1UJ3I61x+Wa/1x2x3NLyfVsgm
DIYyy64fxztXBZ8VPbZnW7+h3EI5ojiTU29mtYYatzQMB63XJihUKCWLqrP4nzfM
Gtcr9XyLBXyBFmB7T/guPhwreCO8GmrFz7+q/I6LsN/k+fmI+V5+HDIlxqf70eUH
BGtvhrLTSBwyUpJwIgBVSZ9eZDSDPISsBqkq7VZciGB/xs5OyNdN3YpdRXPlmuXc
HmOwAJBwC5gU8wYeYIzpdcfSqbOM7zxt1xRAivFJiv7fNcfkbcjzRyOJ5xqZxrZN
pwhFepmSZHsR7s9M9U7el23G2xaHvuatcQ7ofCeMs+6AXEZp7os4avkP9LtpZHEW
rRoKPvoF4Cg2bVkg3dn7MlcOlklttRTTR7xsTtMhFXiip+WXsjeDz2o8yFr+nSQx
CnJ843sSf7y1/oce0zNP8168Kej9Lbh355dAk6dbsmCM8JSKJzqwjjp3ursa0xky
/d7KShke1QPT6WPWnauo4T3MnZeR31Dn5u0A1SW1KZVeUCo8fk05sfbhJpMA5B8M
zpSOG4JEuvp7GK9fWV9AVv2ezjyiK4CgymQ72aw4BHOT8VldE1Q=
=HXkL
-----END PGP SIGNATURE-----

--5qtrCr4kIUygXshX--
