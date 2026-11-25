Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795569312;
	b=ZsZYfdLBFz1rra6Em0ZqUPNKtwtfQvHyNyuV4yWkHFi+IN8Wxs35ooRucr21klVGJ5/B
	 B76oK9n8Nh5T2H7IsLC8yugjpPjqouUU80Sm7+8pwO5ptPLx7E4sl8xwfDhc7DfGJPdf5
	 bqiURY9CyceluYfxv/Fko8rqsKb6vNxYhPkbKcEa3qzuEU+0nQ5ixwhBT/+AWL3xfYdH8
	 mPpZ9Xf+o/VnvU5CG8xoHaj4orRZC0O7ZQfBV3DCfydt7zmTUKwWi184xbpFolIvJ8z7S
	 JeB9B8ZCQ2fNz9Wb69I0raMbxWlJ4EORr8rcQZhl3ZUdZs9vCR1xe/7Q4UFpG+Y+Mxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795569312;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=z0FfasYyWgtGTdCqLhd+0VuumL8pjx6Znf7rAitYRHo=;
	b=eO/WcyPHxe/x1U/tZWmZLfrfVP05lw24MnWo1EewJR6kJzw9IZfA9YzTt3HzZo6VqWwt
	 olK+Dxk65U2P8dzs9oYxq3uylq+rS0JWKyZNKdOpSTxS2pHch/gxG/VjjP34GBG231u+J
	 kFUb5oMtRfYVYljeJzerrtJdoRAiMH9YxdqMVGuIBt5djUYFRlry3ofUiR3LNertCZosL
	 QmLEtbzI4/8W5Sxf77KEIdqy6jlPpHmGJ9X9MCecUOo5EbyBs8iOWzcSvspPPwzdNoc67
	 Jdzc0kgIlzEi3VT+RzFugWuBPXJ5cKC2m6+e7BURPppBFnrUb9IqEVnNzhHzIZLeJSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=d1B2BQWz;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075C6606A31E
	for <devicetree-compiler@vger.kernel.org>; Wed, 25 Nov 2026 01:15:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 075C6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=d1B2BQWz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1795569309;
	bh=z0FfasYyWgtGTdCqLhd+0VuumL8pjx6Znf7rAitYRHo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d1B2BQWzdvkVlgqqCeFL0x/XlpxoLaF92vq2T2k9PpmohdGkN7btQNvO0EOKyohSU
	 WQ+oWXrFzu8Z25beONztco08PbMbj+I/wMud8Hcjshn+r95ZgNlZl9lTxosCGsiypj
	 iSuaq017zgR7gf4LHxmqDvbZ5zmNDQkNUFuiq432tVpoXL++iPO1nxjmHHXVXNbGJV
	 XLNBILIXqt2f6VYjeFpQpJ3Tv5U2LUWW0hhlsHGodLQAAUD653kXb2m8iz3N7ITTee
	 KcP0Et9ZBQnlC8XfamRP3AUJo5VzXoUAuRgs45lSU+qQyNlOEfQ4Z0CdYbHdM2jrnK
	 srcp8y04Tep/Q==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jZ1v075Rtz4wDk; Wed, 25 Nov 2026 12:15:08 +1100 (AEDT)
Date: Wed, 25 Nov 2026 12:15:00 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v4 04/10] dtc: Move the /omit-if-no-ref/ handling out of
 the grammar
Message-ID: <awY2jUXJd_GutzQM@gractus.seuss>
References: <20261116235813.935070-1-sjg@chromium.org>
 <20261116235813.935070-5-sjg@chromium.org>
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
	protocol="application/pgp-signature"; boundary="pRLdR1jFzK4vhbcR"
Content-Disposition: inline
In-Reply-To: <20261116235813.935070-5-sjg@chromium.org>

--pRLdR1jFzK4vhbcR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 04:57:58PM -0700, Simon Glass wrote:
> The grammar action for a top-level /omit-if-no-ref/ still holds its
> merge logic.
>=20
> Move it into a new merge_omit_if_no_ref(), passing it a struct fragment
> for the reference.
>=20
> The output does not change.
>=20
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

Apart from the name change suggested elsewhere,

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>=20
> Changes in v4:
> - Free the fragment after merging it
>=20
> Changes in v2:
> - Check the fragment type with assert()
> - Return true on success from merge_omit_if_no_ref()
> - Use dt_ref instead of fragment_ref
>=20
>  dtc-parser.y | 12 +++++-------
>  dtc.h        |  1 +
>  livetree.c   | 21 +++++++++++++++++++++
>  3 files changed, 27 insertions(+), 7 deletions(-)
>=20
> diff --git a/dtc-parser.y b/dtc-parser.y
> index 6bf96a7..1a1a52d 100644
> --- a/dtc-parser.y
> +++ b/dtc-parser.y
> @@ -249,14 +249,12 @@ devicetree:
>  		}
>  	| devicetree DT_OMIT_NO_REF dt_ref ';'
>  		{
> -			struct node *target =3D get_node_by_ref($1, $3);
> -
> -			if (target)
> -				omit_node_if_unused(target);
> -			else
> -				ERROR(&@3, "Label or path %s not found", $3);
> -
> +			struct fragment *f;
> =20
> +			f =3D build_fragment_omit_if_no_ref($3, &@3);
> +			if (!merge_omit_if_no_ref($1, f))
> +				treesource_error =3D true;
> +			free_fragment(f);
>  			$$ =3D $1;
>  		}
>  	;
> diff --git a/dtc.h b/dtc.h
> index 41ba438..b9cb5f9 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -352,6 +352,7 @@ struct fragment *build_fragment_omit_if_no_ref(char *=
ref,
>  					       struct srcpos *ref_srcpos);
>  void free_fragment(struct fragment *f);
>  bool merge_delete_node(struct node *dt, struct fragment *f);
> +bool merge_omit_if_no_ref(struct node *dt, struct fragment *f);
> =20
>  struct dt_info {
>  	unsigned int dtsflags;
> diff --git a/livetree.c b/livetree.c
> index ce47fe2..669d8ba 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -554,6 +554,27 @@ bool merge_delete_node(struct node *dt, struct fragm=
ent *f)
>  	return true;
>  }
> =20
> +/*
> + * Mark the node which an /omit-if-no-ref/ fragment refers to, so that i=
t is
> + * dropped if nothing refers to it
> + *
> + * Returns true on success, false on an error, which has been reported.
> + */
> +bool merge_omit_if_no_ref(struct node *dt, struct fragment *f)
> +{
> +	struct node *target =3D get_node_by_ref(dt, f->ref);
> +
> +	assert(f->type =3D=3D FRAGMENT_OMIT_IF_NO_REF);
> +	if (!target) {
> +		srcpos_error(f->ref_srcpos, "Error",
> +			     "Label or path %s not found", f->ref);
> +		return false;
> +	}
> +	omit_node_if_unused(target);
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

--pRLdR1jFzK4vhbcR
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmsGNo0ACgkQzQJF27ox
2Ge0Gg//Su6HtV9m53q45USavKZUoqIXxY8agsOy4xzNeFkTv9Cgz6MYAdgomHY9
ZoXGZAAeqkPPEhn3GHPV64C7CiJLndDAjYId9jow3euT/EiUYR7JfDFTDOh505Px
0zKrK7TiBtBh2GA2WTUn1xotzxRzYTXQ1bBvOHglK98RTKOR58AKGP6thPV1Z0IX
HfJ380ja3Wd0DdMi4l6ju4TYmmrMJOdvZtyOebtPdWmMhLWSd7ja8/rG9dDH8FZQ
UTQxB/sRm4kWtc5l/6bCqV19AL0oYz9Vm38sFJqbvleBhr9YOEEe8g6OgWbdBpPO
jSYU9WyPY2JtpS0LcAU5rw5d0jjf+Kx+bkObXYSSQI4ayc14pBiuyF/vodAat7wf
j6zG7Cwa3kjaBWB0q1Qof268ltR5/umOc0GwsmgnzgIs4DIrPIToIvzWa1bvFG3m
5XlvXs/GSa4heXQT30TfvVJeS/hy23r8lV5HT8xa1Pf6iaUuCBvrpDd+U69JR0p4
EjMQPfeNZ7BBvGIhpltXAZzo6l8CaW+YQhn+AdMZA1zgMePUt5TjvULjeWCHWyn1
R9CBER++6whWlUt1BLcVdvOmIJAMPQ6kGaEqUziXesAamRkdiATLNtMWTMCTl9Nj
DO8yBW84MTpGQo1zHTK7o/K3ZwJTsUY7jxVkJvptPrDngEG5Dy0=
=9roP
-----END PGP SIGNATURE-----

--pRLdR1jFzK4vhbcR--
