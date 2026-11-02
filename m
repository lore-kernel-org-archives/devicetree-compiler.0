Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793613896;
	b=vqNfjDZwql1orHT0M30jc/usAEod4xXlOQCYpac/owXjWBctOTfei9/HvzhVjqRdeiRg
	 byON8kTzpVHDfZHQ0U26B22rm3m+xKHGxfNSbR74YeFzggQK1ms6WI9pVQiE/ZKmfq5KY
	 9iGRcYvNftBjtKod3ZU7roaVDHKkEfV5/oFMv6Qo+3F8ZSIa82hX25iwUquDygxzlUvou
	 xm9i+quJcxVUDUY8mUcnv7svK5X+Hyo7F7tvnmDtOMo9H2IhdkgJr/uJqjXuSWUwhQyGJ
	 1lvcIovHmKWKJ6Z6+NoXmBIOk3g0P3bSadAv2Xeg0UEsSC01x19Ne3Ahp9W9f9k5LMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793613896;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=1kxafcVk8g6T7He86sdWVt9Dpr5SoqkXli6+R38n2oA=;
	b=LJLgjyWBHOU2roRMteKfkHNoMzMkX90TVmZDSZoTg/djDFfvSxKzj29i7gnBq1lZOSrh
	 L6kZqbIil7/MUFjiadQReEB2MEGC5m7jlyyGTaHp7XCduupNGuGB3oJA8pz8eIQAZ3j2a
	 X0KG/kEWRyxnx5k5juANaectCXErS9MwHLrV+I7oC0NdGaT4bZiFgHr/zmdLr762xrD3Y
	 hd9j4iyjteo65/uCqOC6d2TdQyErOYHaSBrGZoNMOdura8cBq8sdBltWbdNWKwTe9PH4b
	 ibrzMvLO/PKwUYY6Oa/ONvg1HfYYE1zyJfnWkMs4soGDDZtyrfGXgYjkQ5lsiRNhwhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=mK3WOY9P;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A30606A327
	for <devicetree-compiler@vger.kernel.org>; Mon,  2 Nov 2026 10:04:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35A30606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=mK3WOY9P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793613893;
	bh=1kxafcVk8g6T7He86sdWVt9Dpr5SoqkXli6+R38n2oA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mK3WOY9P8gmWo9zmyYoaRb4LJpMZBINoLCQtwQYnXh7WoRU+BEEdbRT0BGpfHaXoU
	 JMp44X5vvk3yKcTbomI2mOYDkY16aBI0wGvLC5AMXNcACMJAMyVQamOESWVeJKv7zN
	 1yC4Nz/bnaCKSGTWR46VipJC1Jk2gQGlgfdIorjGjG4pwUi/QEw1oaO5BfjyKyCHiB
	 TLbnDRaVVxsT/4goM2ZOcsK6+mDExnTIxTNZttq9f7CLDuB0huo6ab4p7n/yHJRXYZ
	 2yV5sPfr6X6MN8Cnk+8kZ3l0pdml59W6IbrtX6j4SP4FV+CjxuVdYO6+8yvXF0mNya
	 hhwMoVqkb50Fw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jJ6ks5Kxlz4wDh; Mon, 02 Nov 2026 21:04:53 +1100 (AEDT)
Date: Mon, 2 Nov 2026 21:04:49 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Subject: Re: [PATCH 05/13] dtc: Move is_ref_relative() to livetree.c
Message-ID: <auhgQNKOHm3Rr6PI@gractus.seuss>
References: <20261101163721.2458982-1-sjg@chromium.org>
 <20261101163721.2458982-6-sjg@chromium.org>
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
	protocol="application/pgp-signature"; boundary="KyxbQd8AsmqWdVfS"
Content-Disposition: inline
In-Reply-To: <20261101163721.2458982-6-sjg@chromium.org>

--KyxbQd8AsmqWdVfS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 01, 2026 at 09:36:59AM -0700, Simon Glass wrote:
61;8401;1c> The remaining grammar actions which merge a fragment use
> is_ref_relative() to reject a label-relative reference in a plugin.
>=20
> Move it to livetree.c, so that it is available when these actions move
> there too, and add a comment.
>=20
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>=20
>  dtc-parser.y | 5 -----
>  dtc.h        | 1 +
>  livetree.c   | 6 ++++++
>  3 files changed, 7 insertions(+), 5 deletions(-)
>=20
> diff --git a/dtc-parser.y b/dtc-parser.y
> index 089ab55..7545895 100644
> --- a/dtc-parser.y
> +++ b/dtc-parser.y
> @@ -24,11 +24,6 @@ extern void yyerror(char const *s);
>  extern struct dt_info *parser_output;
>  extern bool treesource_error;
> =20
> -static bool is_ref_relative(const char *ref)
> -{
> -	return ref[0] !=3D '/' && strchr(&ref[1], '/');
> -}
> -
>  %}
> =20
>  %union {
> diff --git a/dtc.h b/dtc.h
> index e747dc0..d145b03 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -368,6 +368,7 @@ struct fragment *build_fragment_ref(char *ref, bool p=
ath_ref,
>  				    struct srcpos *srcpos);
>  struct fragment *append_fragment(struct fragment *list, struct fragment =
*new);
>  void free_fragment(struct fragment *f);
> +bool is_ref_relative(const char *ref);
>  bool merge_delete_node(struct node *dt, struct fragment *f);
>  bool merge_omit_if_no_ref(struct node *dt, struct fragment *f);
> =20
> diff --git a/livetree.c b/livetree.c
> index 5ed2085..027682a 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -542,6 +542,12 @@ struct dt_info *build_dt_info(unsigned int dtsflags,
>  	return dti;
>  }
> =20
> +/* Check whether a reference is relative to a label, e.g. &{label/node} =
*/
> +bool is_ref_relative(const char *ref)
> +{
> +	return ref[0] !=3D '/' && strchr(&ref[1], '/');
> +}
> +
>  /*
>   * Delete the node which a /delete-node/ fragment refers to
>   *
> --=20
> 2.43.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--KyxbQd8AsmqWdVfS
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmroYEAACgkQzQJF27ox
2GcWjhAAh4h7epaFa+75W3C7UvUgpzaPZVfUDYWCC+n9a79EvthIZKxGmQaBt/Jb
VuPcHIXm8j2rN7hpdEO/J0fSXBKyHdIeRgWAX48tqjIbY1owu4351SkTzC+yRyVl
7AZJ3LKRVtT3Pdp0ZXKJAirlOndhQbdxiCyM2Bx4SxUhxdMU7oepyhNERyYOK/td
sx5wEqMZoE+n/bvNFFzwgYPW5ovI+8WWdBg+8tZ9bGdo3Q+WyuoxZ+pJi0YttI3n
Ei+ycygbGkuomnyqOqXMOwsJiUKutqOhcbqGRj9HKiZ9N7xiV34fXXSNkVE1q2jL
T5J10cFjzKNiTZFMfwpr7P8SiA0UnimnnP8CmwkD9wFydAP0XB92X6oOlHJDPP8G
UudqAagdQqYLQfNchgNJM1OMWTkwk6Px2aPyzgVMbeyMVaYOatJYd+fW1VNmizjn
Q1JsGqi/HpssedTRoBhQMouqTNm+UhJsCLSy2DJKG6C08sJ0jFQeXdoEFPtJduEO
VevylSCT5IdFN/H4I7a7v0FTh16lKu1TSfOOOFiND+PG4m+HUNtxMLyTyfp7kxAW
vfmAdiR60qq7aCvsB7QFx7FzCJ3g7E6DSiaabUhfjdI3N9k74zx8LOB/iUSVWhrD
3eC9Z+K+ASlr/LdOBsl3Logz6OLJ0ZXAU3Hnmzl2bUi01gEs7Qc=
=uXl8
-----END PGP SIGNATURE-----

--KyxbQd8AsmqWdVfS--
