Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB1F15853B;
	Mon, 19 Oct 2026 00:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792369476; cv=none; b=elBGN0r8sXzKNBW/IvrSa+9fVUEcm0KSsz3HR6/UuY6FOhnk1aZxF05qo7fnG5KvKD3eV7h5GKauwjfHGf3wAFe3swwujYoW8a5JqinmVz2HtWwRr9iQQdFGz5ZDyvd6ZxrVVYnJc/6nv6NRMzOZMO/PZWUHAq7RtRpbbVk9IHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792369476; c=relaxed/simple;
	bh=wn0MFjK+XfOkNKETBUI1rLlxWvPsfdk1iWHSdpByglY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XFs+MxK+3VbrDITwidRYkM4Vn9PUm1njoGD6PAFy29I244aToTcHw3auos5ltoOlCOQibB1k7uHw175doXB7RVFXgy54VU7fEQJ6Zw8pOC+VwKb6KwPqVaQSqf0xoyiAa7+Iy2MN8nNPjcGvig4v4qMyyn8nskpCua0KdViRl3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=vvgGAsg0; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="vvgGAsg0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1792369464;
	bh=yAWtbz7dW8wWk5ACGTN/Wql+b2NJXPrNGRl9kluETvc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vvgGAsg0bNICT8++So+UUQmyJi7lZ1Wt19BoYr2s3Z/ekOSMhhbqX/L79xOjZl/No
	 u95AeCYexEMymknusA/pOvy1H7qiTcuBD4tLL3sHzAi9JzYlNm2eELbCl9PkwP57f7
	 grQyRiSsqkgVVTiuYxBcJXTJyfF4OK23pTSGtRBHA1q/nwHG62qDYKYHc6+CRNJUw+
	 wGBRliKUhk68XYvIINcxvPvyqib71NqjU0IsREN+h1bqSGU8XSvgIPD2m4f09BByyZ
	 3aRyt4iL6nvzTXklw76RKhKK95XDZpcNn0Ij3ouCpMbuaQTUjYAllYsTBXUKW0NooF
	 9nN7J3k/yIeNg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4j7GWX1ZYxz4wLc; Mon, 19 Oct 2026 11:24:24 +1100 (AEDT)
Date: Mon, 19 Oct 2026 11:24:17 +1100
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
Subject: Re: [RFC PATCH v2 04/74] libfdt: Introduce
 fdt_get_structured_tag_data()
Message-ID: <atVjIcRxUPyak50o@gractus.seuss>
References: <20260826094950.1088288-1-herve.codina@bootlin.com>
 <20260826094950.1088288-5-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="McOvvLF7zAqgcgMa"
Content-Disposition: inline
In-Reply-To: <20260826094950.1088288-5-herve.codina@bootlin.com>

--McOvvLF7zAqgcgMa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 11:48:33AM +0200, Herve Codina wrote:
> With structured tag, data len can be encoded in the tag itself (no data,
> 1 cell data, 2 cells) or with a dedicated cell (varlen) added between
> the tag and the data.
>=20
> In multiple places, getting the data related to the tag will be needed.
>=20
> To avoid code duplication, introduce fdt_get_structured_tag_data() which
> purpose is to get the tag data part and its length based on the tag
> value.

I'd prefer to see this folded into the series introducing structured
tags:  the final result is no more complex than it started, so folding
th patches reduces churn and makes it easier to review.

>=20
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  libfdt/fdt.c             | 80 ++++++++++++++++++++++++++--------------
>  libfdt/libfdt_internal.h |  3 ++
>  2 files changed, 55 insertions(+), 28 deletions(-)
>=20
> diff --git a/libfdt/fdt.c b/libfdt/fdt.c
> index 506e0dd3..7941632f 100644
> --- a/libfdt/fdt.c
> +++ b/libfdt/fdt.c
> @@ -167,11 +167,56 @@ const void *fdt_offset_ptr(const void *fdt, int off=
set, unsigned int len)
>  	return fdt_offset_ptr_(fdt, offset);
>  }
> =20
> +int fdt_get_structured_tag_data(uint32_t tag, const void *fdt, int offse=
t,
> +				uint32_t *data_len)
> +{
> +	int data_offset =3D offset;
> +	uint32_t len =3D 0, sum;
> +	const fdt32_t *lenp;
> +
> +	if (!(tag & FDT_TAG_STRUCTURED))
> +		return -FDT_ERR_INTERNAL;
> +
> +	switch (tag & FDT_TAG_DATA_MASK) {
> +	case FDT_TAG_DATA_NONE:
> +		break;
> +	case FDT_TAG_DATA_1CELL:
> +		len =3D FDT_CELLSIZE;
> +		break;
> +	case FDT_TAG_DATA_2CELLS:
> +		len =3D 2 * FDT_CELLSIZE;
> +		break;
> +	case FDT_TAG_DATA_VARLEN:
> +		/* Get the length */
> +		lenp =3D fdt_offset_ptr(fdt, offset, sizeof(*lenp));
> +		if (!can_assume(VALID_DTB) && !lenp)
> +			return -FDT_ERR_BADSTRUCTURE;
> +		len =3D fdt32_to_cpu(*lenp);
> +
> +		/* Skip the cell encoding the length */
> +		data_offset +=3D sizeof(*lenp);
> +
> +		/* Check for the length value */
> +		sum =3D len + data_offset;
> +		if (!can_assume(VALID_DTB) &&
> +		    (sum >=3D INT_MAX || sum < (uint32_t) offset))
> +			return -FDT_ERR_BADSTRUCTURE;
> +
> +		break;
> +	}
> +
> +	if (data_len)
> +		*data_len =3D len;
> +
> +	return data_offset;
> +}
> +
>  static uint32_t fdt_next_tag_all(const void *fdt, int startoffset, int *=
nextoffset)
>  {
>  	const fdt32_t *tagp, *lenp;
>  	uint32_t tag, len, sum;
>  	int offset =3D startoffset;
> +	int tmp_offset;
>  	const char *p;
> =20
>  	*nextoffset =3D -FDT_ERR_TRUNCATED;
> @@ -221,34 +266,13 @@ static uint32_t fdt_next_tag_all(const void *fdt, i=
nt startoffset, int *nextoffs
>  		if (!(tag & FDT_TAG_STRUCTURED) || !(tag & FDT_TAG_SKIP_SAFE))
>  			return FDT_END;
> =20
> -		switch (tag & FDT_TAG_DATA_MASK) {
> -		case FDT_TAG_DATA_NONE:
> -			break;
> -		case FDT_TAG_DATA_1CELL:
> -			offset +=3D FDT_CELLSIZE;
> -			break;
> -		case FDT_TAG_DATA_2CELLS:
> -			offset +=3D 2 * FDT_CELLSIZE;
> -			break;
> -		case FDT_TAG_DATA_VARLEN:
> -			/* Get the length */
> -			lenp =3D fdt_offset_ptr(fdt, offset, sizeof(*lenp));
> -			if (!can_assume(VALID_DTB) && !lenp)
> -				return FDT_END; /* premature end */
> -			len =3D fdt32_to_cpu(*lenp);
> -			/*
> -			 * Skip the cell encoding the length and the
> -			 * following length bytes
> -			 */
> -			len +=3D sizeof(*lenp);
> -			sum =3D len + offset;
> -			if (!can_assume(VALID_DTB) &&
> -			    (sum >=3D INT_MAX || sum < (uint32_t) offset))
> -				return FDT_END; /* premature end */
> -
> -			offset +=3D len;
> -			break;
> -		}
> +		tmp_offset =3D fdt_get_structured_tag_data(tag, fdt, offset, &len);
> +		if (tmp_offset < 0)
> +			return FDT_END; /* premature end */
> +
> +		/* Skip the whole data bloc */
> +		offset =3D tmp_offset + len;
> +		break;
>  	}
> =20
>  	if (!fdt_offset_ptr(fdt, startoffset, offset - startoffset))
> diff --git a/libfdt/libfdt_internal.h b/libfdt/libfdt_internal.h
> index ce128fda..d4154119 100644
> --- a/libfdt/libfdt_internal.h
> +++ b/libfdt/libfdt_internal.h
> @@ -23,6 +23,9 @@ int32_t fdt_ro_probe_(const void *fdt);
>  uint32_t fdt_next_tag_(const void *fdt, int startoffset, int *nextoffset,
>  		       bool *is_unknown);
> =20
> +int fdt_get_structured_tag_data(uint32_t tag, const void *fdt, int offse=
t,
> +				uint32_t *data_len);
> +
>  int fdt_check_node_offset_(const void *fdt, int offset);
>  int fdt_check_prop_offset_(const void *fdt, int offset);
> =20
> --=20
> 2.55.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--McOvvLF7zAqgcgMa
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrVYyEACgkQzQJF27ox
2GdTfg/8CoNS7y9LwlPhUo1YbvE8l0mk/MuF78fQeCiGo4BdI4kUhVM91tVyqH7B
xwwTVTB7aj2pUpD8y/gpJetW+fGW0/q9ahyqQja3sNaAUz1Ay+/AB2y1XIDBZc6t
Z9HobfH2uV6G/XlXgbUMa5DsN4MHQO6e1Ha1GAoVPnFyb9u3WjCJ815fjuggDF3g
JqS81l3BYzNeeig11J8n9zIVrT2SXfJWWaKy83PYwaFa7gNg6TovehqXwU3z2O3j
X/9QOKAdjOY6coCl0Ter7YogP0LQwQuRFrFx3oF9HtkUFe8rc/k3ziuZvWEpWjbS
nyOE/ekri8m3EBvfs1wpbEGLirPGJBiyNA8+ypq/gkVZ9/rS40YadgamPj/+lU5n
b5gwKQ0pMUpTBc0sZRFI/B98JHxJKIXC6WKEerjr6AQL8s0gB3YnQimWtEbZPtsK
wNkQEa+V0098iy5w2MeHOG8rXcCCEVF63MAUVlUnHd6ZHMHXvlJBwUjY3YT/lNUF
9jPPgxsWlr177YM/HBCwEj7X2tzAkanVUv6e+qxzIBLlrhy5GfyNDuz2EjjKxzgf
Y36H8DF21uqUGwCVYodEkypRGqNjuMwpn5kXINMRJKPRrONqfuqqV2BMVjPICpYs
WLe+2xU4TULGLGjayia16i3CsKNEa0poG6GBfAxoNL6KtBiylWs=
=zypH
-----END PGP SIGNATURE-----

--McOvvLF7zAqgcgMa--
