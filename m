Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9C01CD02;
	Fri,  5 Jul 2024 23:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720223233; cv=none; b=kCfw4vJ/BlEUSO0wgxWyRIXV5OdKNSxKmHcwa8z/sNLb2bVC5vDz1qV/ffAqjIeA/yZQF8AWwo5if1fLNo8ssTou2eZ5fCLz2NYoxF0JoeIhxdXKEnbTuAqKZj5CVtRyeyDG4khRRw7DchwuvRqswoyXKtn4/nmjEhZC2enM5Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720223233; c=relaxed/simple;
	bh=ZXI91hteVgV6hZah8UJOV9un9PntqH8D+psnOoOPm+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tnd89VyQnQj2/fIhNI1t6tjL2QfJTLkOyth1l6LN9RuRg5128ub8UD3ALcfseoSZc42/qXu66xFNFPNG1xFBqprsprBDF6e92kMk70q7ib307ybqW8FSIrkxnwdNPdHVgvcM7mmvx2TTl4GC4Il9TLxplLIRzRjE156+VDb8wjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=fail (0-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=MNnMjHAz reason="key not found in DNS"; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="MNnMjHAz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202312; t=1720223226;
	bh=0IEJWSRJc1bDYeAOIet9+b2NmjxcA5xTugFWIFbBDuc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MNnMjHAzeB+nZ5wkypo4/qLzQnvzIlpgcS0oJfggSx9xTVCcelBD70hCQ2PIsSi9k
	 cGNXmn8bq5Z2ZZj2fI192G6KFh6C/lrPMfXLCXKm057Yrpx/fPDan0e+ti64X2EnrS
	 cHRsKGHzDWeETC+NDTPBKBf1xC6ShP416BSNPP48NxbvBwxRL0fBwLBa408/19Z25D
	 nh6/lTZTo63q+3QcWLjlJtqfLkd7MXM5PrkpzMTWl/yaXFT+Mpm1CwY+NBy/HU3SPV
	 n/edGI9YlGn/olHqYBEoZKh4veZbN+SQuPvoC4qIv2qlmQhk/VzA4Dhvyp6vtaTu90
	 JoJ+ugMkLJL3Q==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4WG9Ct0N12z4wyR; Sat,  6 Jul 2024 09:47:06 +1000 (AEST)
Date: Sat, 6 Jul 2024 09:46:17 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Saravana Kannan <saravanak@google.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH] libfdt: overlay: Fix phandle overwrite check for new
 subtrees
Message-ID: <ZoiFyfnD7qpIh3XT@zatzit>
References: <20240626075551.2493048-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aNQZc6VLXZk5T8x5"
Content-Disposition: inline
In-Reply-To: <20240626075551.2493048-2-u.kleine-koenig@baylibre.com>


--aNQZc6VLXZk5T8x5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 09:55:52AM +0200, Uwe Kleine-K=F6nig wrote:
> If the overlay's target is only created in a previous fragment, it
> doesn't exist in the unmodified base device tree. For the phandle
> overwrite check this can be ignored because in this case the base tree
> doesn't contain a phandle that could be overwritten.
>=20
> Adapt the corresponding check to not error out if that happens but just
> continue with the next fragment.
>=20
> This is currently triggered by
> arch/arm64/boot/dts/renesas/salvator-panel-aa104xd12.dtso in the kernel
> repository which creates /panel in its first fragment and modifies it in
> its second.
>=20
> Reported-by: Rob Herring <robh@kernel.org>
> Link: https://lore.kernel.org/all/CAL_JsqL9MPycDjqQfPNAuGfC6EMrdzUivr+fuO=
S7YgU3biGd4A@mail.gmail.com/
> Fixes: 1fad065080e6 ("libfdt: overlay: ensure that existing phandles are =
not overwritten")
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Merged, thanks.

> ---
>  libfdt/fdt_overlay.c                | 8 +++++++-
>  tests/overlay_overlay_bypath.dts    | 4 ++++
>  tests/overlay_overlay_no_fixups.dts | 8 ++++++++
>  3 files changed, 19 insertions(+), 1 deletion(-)
>=20
> diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
> index e19506fb56a5..28b667ffc490 100644
> --- a/libfdt/fdt_overlay.c
> +++ b/libfdt/fdt_overlay.c
> @@ -729,7 +729,13 @@ static int overlay_prevent_phandle_overwrite(void *f=
dt, void *fdto)
>  			return overlay;
> =20
>  		target =3D fdt_overlay_target_offset(fdt, fdto, fragment, NULL);
> -		if (target < 0)
> +		if (target =3D=3D -FDT_ERR_NOTFOUND)
> +			/*
> +			 * The subtree doesn't exist in the base, so nothing
> +			 * will be overwritten.
> +			 */
> +			continue;
> +		else if (target < 0)
>  			return target;
> =20
>  		ret =3D overlay_prevent_phandle_overwrite_node(fdt, target,
> diff --git a/tests/overlay_overlay_bypath.dts b/tests/overlay_overlay_byp=
ath.dts
> index f23e7b6035e2..dfcb7cdb25a4 100644
> --- a/tests/overlay_overlay_bypath.dts
> +++ b/tests/overlay_overlay_bypath.dts
> @@ -46,3 +46,7 @@
>  		new-sub-test-property;
>  	};
>  };
> +
> +&{/new-local-node} {
> +	another-new-property;
> +};
> diff --git a/tests/overlay_overlay_no_fixups.dts b/tests/overlay_overlay_=
no_fixups.dts
> index e8d0f96d889c..1dbdcdc2b40f 100644
> --- a/tests/overlay_overlay_no_fixups.dts
> +++ b/tests/overlay_overlay_no_fixups.dts
> @@ -72,6 +72,14 @@
>  		};
>  	};
> =20
> +	fragment@7 {
> +		target-path =3D "/new-local-node";
> +
> +		__overlay__ {
> +			another-new-property;
> +		};
> +	};
> +
>  	__local_fixups__ {
>  		fragment@5 {
>  			__overlay__ {
>=20
> base-commit: ff4f17eb58650784ffb2e8a8fbefebce1038f80b

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--aNQZc6VLXZk5T8x5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmaIhbUACgkQzQJF27ox
2GfKAhAAjG6L1dh4NYz3s+Phd79eaTD0R1biN+/SsxlQJRQCiB4/zNYjPndKgZ/A
vbBag9JsNwp6PfccssTV1mwZOlg0Bts/JyFNqP0ZLcDxAFPa4R92Lge6uz2jggW5
0t98teCB5ycEFTMQwJXC9CiPCHoI9uP+JylzaSoxaIT2pbO6oJVn1/v8K/pn/TeC
mqrKOFTELOHScReVJJd3X6/zSn47jkQNAR2wgpjlaElZ1Kb2ayQgctAXzQ53mf+9
nGLpAA85GfqtXG19cz7pPlJRPDuHW1WarJrfk7+sOgR5KlhFN3vZoyH73qyz7y1k
g7aG6gD71O0O2GQezAG2Z4CUQtMDBSQwhHJXAEBwDMaI8cE70o8koVTklfvFctR2
sY4kQuSDbtjnIvIksQczcwqraicCBpUqh5VyDbPlmUvKGnnMSswWibZC15bi67Ck
C9LcNRLd4A0tSgWY9yBve5gnWm/ng2Y+XJT0LY0cwzeDWErcGfov9jylNIeh+vYl
zwHTNCkOilTyNY0cARv7GCV9i8XPEafORPI1PPCbUrbhRZK0FrIgLzikSaEFdvEE
p0T6fdjOVu5ImYumJuE+7dLbGb1/wBAlMpdxcdEZPM2EtenwN6gY1bzj+00NTsZ2
tflkhNDu4PrccDnpaLX+HsvJb675gBFo9IbIk3XpsoJcUY2az4U=
=whnn
-----END PGP SIGNATURE-----

--aNQZc6VLXZk5T8x5--
