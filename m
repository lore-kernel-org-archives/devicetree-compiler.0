Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A274037CD3A;
	Wed,  9 Sep 2026 06:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788935914; cv=none; b=meLH57JHLj1MSr5T+noozNfd2UY7prGnWJZfz8t+CKByd4IKna9AEO2UHuSNDTdio0dNDzeHxJYFHTk3tDw+1HAD8sdXlKl2gnEO0zDi5rRadRnZ3xsMPvKOQUkxVIBg7LVskj/rjAEoMN4SKOmmoPDTfXrfho5qGsEQ+8YXD/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788935914; c=relaxed/simple;
	bh=UaIdji8NEtlfoefjnaKdXcnvMFGMrqOl7BlgXiQJyTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g8lmyprO3U+KWKVOuioHGs3TzuU1xC3ysR7uacech2vX1HJ0eRTVw+a06kXa6VUlzhwd+NHkBxsVRhlp5OrhzCtFxLrZQL4crEDIWYLkahHk0OsK/er0to97NzUCa2fdyaeOOAPycJuv95llrNEENIqn7Xo7WKmtFl7aackIwWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=ZJUbXApF; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="ZJUbXApF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202608; t=1788935897;
	bh=sQ2ccdLCDWYB8CuKHAwsJqQXF9yoxyVRzyQ3rWcsEMo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZJUbXApFm6WJVXzNTdo3NK0WW9HD879B7TfI4Dv/gaD1WgSs6ddWmY2Vn/554+Yqy
	 DD4qJfgBqdvwoYFxFpFlsjnuompdnIOkc09iCQJPyE1KebhiqS9oYDG8dL4ib4uRkC
	 yG9Ku+WAOdpb76d70Moqj4O/q9Fo009E2hRMkL6v1BVgXxjY4yh1IzEFfwHS0CeRfp
	 S8Zeit0X+zVAo/XqDfytYs7kED8Si2+AYgte3mH/bzBxzn1QMTYfVLWzI2pA44mVxI
	 j03i0Ub4e2DFse9iCUrB3MHZmUB06jwLGwuuOserzkaZA22/mE16oliitistdvul6a
	 4QIqBk43wCA5w==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4hfrjP1F1Dz4wCt; Wed, 09 Sep 2026 16:38:17 +1000 (AEST)
Date: Wed, 9 Sep 2026 16:38:18 +1000
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
Subject: Re: [PATCH v3 05/15] tests: treegen: Introduce emit_fdt_header_vers()
Message-ID: <aqD-0OoMyZNQ_UeE@gractus.seuss>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
 <20260826083146.304291-6-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="d83/6er6i6bw0E7Z"
Content-Disposition: inline
In-Reply-To: <20260826083146.304291-6-herve.codina@bootlin.com>

--d83/6er6i6bw0E7Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 10:31:36AM +0200, Herve Codina wrote:
11;rgb:1c1c/1c1c/1f1f> treegen is used to generate custom dtbs. It uses emi=
t_fdt_header()
> to generate the header part.
>=20
> The current definition of this function doesn't allow to set custom
> settings related to version fields.
>=20
> In order to easily generate some dtb with custom version values,
> introduce emit_fdt_header_vers().
>=20
> The modification doesn't introduce any functional changes.
>=20
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  tests/treegen.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>=20
> diff --git a/tests/treegen.c b/tests/treegen.c
> index 6891bfd6..28943d43 100644
> --- a/tests/treegen.c
> +++ b/tests/treegen.c
> @@ -105,7 +105,8 @@ static void fill_prop_name(struct buf *b, size_t strs=
, size_t prop, size_t strof
> =20
>  /* FDT structure helpers */
> =20
> -static size_t emit_fdt_header(struct buf *b)
> +static size_t emit_fdt_header_vers(struct buf *b, uint32_t version,
> +				   uint32_t last_comp_version)
>  {
>  	size_t off =3D emit_u32(b, FDT_MAGIC);
> =20
> @@ -113,14 +114,19 @@ static size_t emit_fdt_header(struct buf *b)
>  	emit_u32(b, 0);	/* off_dt_struct */
>  	emit_u32(b, 0);	/* off_dt_strings */
>  	emit_u32(b, 0);	/* off_mem_rsvmap */
> -	emit_u32(b, 0x11);	/* version */
> -	emit_u32(b, 0x10);	/* last_comp_version */
> +	emit_u32(b, version);	/* version */
> +	emit_u32(b, last_comp_version);	/* last_comp_version */
>  	emit_u32(b, 0);	/* boot_cpuid_phys */
>  	emit_u32(b, 0);	/* size_dt_strings */
>  	emit_u32(b, 0);	/* size_dt_struct */
>  	return off;
>  }
> =20
> +static size_t emit_fdt_header(struct buf *b)
> +{
> +	return emit_fdt_header_vers(b, 0x11, 0x10);
> +}
> +
>  static void finish_rsvmap(struct buf *b, size_t hdr, size_t rsvmap)
>  {
>  	struct fdt_header *fh =3D (struct fdt_header *)(b->data + hdr);
> --=20
> 2.55.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--d83/6er6i6bw0E7Z
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmqg/tAACgkQzQJF27ox
2Gc6qxAAoPZsp6xvSa6oM3sroDgBDVoMcRPaalhaTGQiB55rqwmCOqlgCkvlcrx5
R2VT5/P35iZUeqde0pzuyo5XWXU8BDDWZoBlf9TLy41+f+qwqh0aATpgxm/Q8ltW
vyyh0rp4qqNutSdXkp1x+hfd1LANrUF7IZu/bJ67n7GSXOde40V5hv1XCBijV89q
YWzyF40V68813SMBOmpTp55+r/KErORd5pPxpGIkzhIfcjg50npRB7hP+a4M5yN9
MDu+Pi3DdC3ra4MVkaskJXLZ/A5G/GufyNp+uhwBPHIvMiokyYuKtVecS7n3PxaJ
yd1+aujk86tGF2mcTPs+qnPLS7qQwOCySY2YMCmzsmlHsCXPV1vLeg3DNeY5eJTI
KjAeVffHCGvLML7DCjUpjy/dDEiEfoRGyF8I27gsY7A61zsF0VzozyIR7H8yiKto
EsX+dBcXVONwh/JixNwuVG5SpNIZDYBKBhMI5a6/4P92UajLE5Owju8QDUEALL9U
4wSKD8bV773N4CiwyqbWh1PX7POIp3egyE+zVp8f2DkV8/5FNQfZdO19D6RTfwWo
mOQzatkO5qLNkPjokXsvyDc67sr79fQ5YiQQQ1oFtR/HtTRQQHzHtOXTJ0dZtNAx
TWELkqg1xskSkTGQmR6v1yYaGKDQlx24Hyvd+49G4xUjWOdF2XQ=
=QTGD
-----END PGP SIGNATURE-----

--d83/6er6i6bw0E7Z--
