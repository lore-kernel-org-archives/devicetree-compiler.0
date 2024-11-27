Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7940E288B5
	for <devicetree-compiler@vger.kernel.org>; Wed, 27 Nov 2024 03:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732679805; cv=none; b=rUXL0ZxYb1KA5Doz7SpwHW5/HKNcqv4ZLvJKQiox8D1X6e438BzaKMiyLfLCBisz9P5j3t8hdIiiGGqcuqev9qv1ZOGYRv4Fwrz8+6xLluuGZM/QhALfBoJCKACJFcEaqdEcM7BDy3Atq2yqN8mByaYcPogRC+dgqwrvNC/4eU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732679805; c=relaxed/simple;
	bh=OAT27Ca5u/2zqGCqIwyQpCSMV4u/PtKLZUHpOxwAjm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a+atCksYsXVIWkh0XXmH8HlnyKGVGKKvTXpDNYDa1zt9IoyjrQhz/MU8apVZp7TRlsyGAEf+5Gx2pSoV08geR5z7+btn8jDytQ9Uf73/FMnUtwCjZ6A1HIwF7VU6Xr09u4e8nHqRDYbdE4bMC3ekq6rbqqb6hOW+HOg5PZ57hT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=AAb+Zydf; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="AAb+Zydf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202410; t=1732679792;
	bh=6lq2yBwviEk+ehbHIjjOfxgMbBdwlHiHl++OBokQ9MM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AAb+ZydfPpAhjqTP67Hx7gduuYYxI8Ou8MiOAiu7NN8x7nJ1KSkmYoO2YHb+EGWKG
	 IYbcdqZiJyYmO5XYAqkX3rrzN/rVN2+o7T2PeXQtaXQCvvs1uTbWApMaNIrXwwq861
	 d5J/iiBAndFf42wtwX0Jb3eH9LafLV0frp3nxDI7cWxAkmM3jb6VY0ff1xFPw+4DGm
	 +x2Ppqnd42BuUHWYl7ajB01I4yyKxMxcolkF5zyuvbMvUTI9hA306NqgaJvf2iUbWI
	 Tzfx921T/pFmgv5CEohNvYkm7gJOB5HyluaD2wt+miAIv0B4urm/RmOYFFDsHDje5g
	 uLu6CV80w38Jg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4XylxD6ZqCz4xgB; Wed, 27 Nov 2024 14:56:32 +1100 (AEDT)
Date: Wed, 27 Nov 2024 14:56:30 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] checks: Relax avoid_unnecessary_addr_size check to
 allow child ranges properties
Message-ID: <Z0aYbvYU0UXn66XZ@zatzit>
References: <20241106130108.852323-1-p.zabel@pengutronix.de>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lvYR8eXBKlf6wK4a"
Content-Disposition: inline
In-Reply-To: <20241106130108.852323-1-p.zabel@pengutronix.de>


--lvYR8eXBKlf6wK4a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 06, 2024 at 02:01:08PM +0100, Philipp Zabel wrote:
> Do not fail the unnecessary #address-cells/#size-cells check if any
> children of the node have a "ranges" property.
>=20
> Suggested-by: Rob Herring <robh@kernel.org>
> Link: https://lore.kernel.org/all/CAL_JsqKebRL454poAYZ9i=3DsCsHqGzmocLy0p=
sQcng-79UWJB-A@mail.gmail.com/
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

Applied, thanks.

Sorry it's taken so long.

> ---
> Changes in v2:
>  - Add comment to child 'reg'/'ranges' check.
>  - Add child 'ranges' to failure message.
>  - Link to v1: https://lore.kernel.org/all/20241025161307.3629901-1-p.zab=
el@pengutronix.de/
> ---
>  checks.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
>=20
> diff --git a/checks.c b/checks.c
> index 6e06aeab5503..9e6a7b6a3e97 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -1217,9 +1217,7 @@ WARNING(avoid_default_addr_size, check_avoid_defaul=
t_addr_size, NULL,
>  static void check_avoid_unnecessary_addr_size(struct check *c, struct dt=
_info *dti,
>  					      struct node *node)
>  {
> -	struct property *prop;
>  	struct node *child;
> -	bool has_reg =3D false;
> =20
>  	if (!node->parent || node->addr_cells < 0 || node->size_cells < 0)
>  		return;
> @@ -1228,13 +1226,18 @@ static void check_avoid_unnecessary_addr_size(str=
uct check *c, struct dt_info *d
>  		return;
> =20
>  	for_each_child(node, child) {
> -		prop =3D get_property(child, "reg");
> -		if (prop)
> -			has_reg =3D true;
> +		/*
> +		 * Even if the child devices' address space is not mapped into
> +		 * the parent bus (no 'ranges' property on node), children can
> +		 * still have registers on a local bus, or map local addresses
> +		 * to another subordinate address space. The properties on the
> +		 * child nodes then make #address-cells/#size-cells necessary:
> +		 */
> +		if (get_property(child, "reg") || get_property(child, "ranges"))
> +			return;
>  	}
> =20
> -	if (!has_reg)
> -		FAIL(c, dti, node, "unnecessary #address-cells/#size-cells without \"r=
anges\", \"dma-ranges\" or child \"reg\" property");
> +	FAIL(c, dti, node, "unnecessary #address-cells/#size-cells without \"ra=
nges\", \"dma-ranges\" or child \"reg\" or \"ranges\" property");
>  }
>  WARNING(avoid_unnecessary_addr_size, check_avoid_unnecessary_addr_size, =
NULL, &avoid_default_addr_size);
> =20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--lvYR8eXBKlf6wK4a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmdGmG0ACgkQzQJF27ox
2GdovhAAkLinFzDkQEVzGQxzMfa9ESrnRRcUDDzznC1U0eaEUPXvh8g98h4ly+S2
reJigCcXKa05JpcKIEOt7gba8cIqVxfjdKvNKVdXPbJFIgq5NLTic8OcsVC/GVMI
6QifhwxFoHZKtKyX5hZwEGDEftDqixjE6YIWR+wPZ7/Fa11r3gcBlPp8SIP6IvJt
fwTSi7Vjwbxuerr6GRGhGxqMId7x3+Evqc+5V3z84vwxmObqvlCXk2D+vUNemPIJ
Hk3PxS5E+4sMumLirppWRZCCXKCGmf4NtIfrTMthunpPj9AKty6VhPxjRvoyYDud
04sC5+FDwPDdjF4uUPx9voltGGKl60wACkvMd7yWvPLAq3y9WFgS90YNLDRNg5EM
Pnz27cphrrtCRI3+wd7d0KwThFjDI8L/R9QG/fjf8gTdTSiF0nmN7gJaaXOzSD85
SdLXyhKbbY0JsGA8nOp0UtxfqotsVs7GrE89DNnA/JtMVc0fQGLJcAMBTxWZ/MtB
53+cI+uaXvQSBbe9Zu6/NmAyyAujSMA+E55QpV/yeDVvDQXBND4t/SbpjwaaWkHq
NVOBsKCXSt+lWI0s1LEC/eCUewoI63Ta3qCzhVTG7wDS8183imysgOdhAuENj4+x
SK3p0yntX3X6nFXUwNs3EOh9anP7TxL/UUp99w3gjydhS0IF3XU=
=XaRP
-----END PGP SIGNATURE-----

--lvYR8eXBKlf6wK4a--
