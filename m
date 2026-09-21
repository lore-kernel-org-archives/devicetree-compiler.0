Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE8135E94F;
	Mon, 21 Sep 2026 06:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789970855; cv=none; b=HovL1MjnsK/OUx6hmQna5LPxwTqCcnQWMLZ4eOj5WOa1rs6bxBEUtwXokkx1uC1wvg5JY7U1TuxeicAgmQOs/1TbJ5sYY+tleDlwoUJZ1UMDetR9Mcd5vrlfvWC08rxY5gAh2uhur9/Cm/cjgjXjTCQLQ4jWYln2pNixLxVqPDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789970855; c=relaxed/simple;
	bh=VpMZj+gBa5E/QYYaOtVEnBwlPoE1I/ZaOFeOc878D6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=emqZRti3nkUJ04/ovPzgYCP1tPSu0Hzm/ec2mRxr7eIOX5fFszgeG+LZQHkMPnevy6lW7qgvD/6DY7Dp14Db8Kyh2Zfgnd2fMGxjl7SZAVXWqATA8Wa3ePza6cbU2D/le1ilUZ9ETeDoRQobPdZqIy2BKs/BSAYIQSdVojYgVa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=IYzDc9I+; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="IYzDc9I+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202608; t=1789970829;
	bh=NGaYneEEZ8hB+aNZIk0X9ML6W5Jk6uq58HJucZuWBCs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IYzDc9I+4x8cYXLKR9QmQoBQVo1M6/L9wGdynVzkfEkk9dpxplGLtdlFbAxdRP811
	 15XLD7ekCbl+k86wEMy82xMcusJLGaQEhJ8N04qpyJ7UzI0YagA1RgqLNXn44gVcLm
	 KM3rC978jTRkTfKoibsHmaVLiu2nqtbJCdDOGpJ4VWp9ktkI5tBPsYFj6sXQeh+fhl
	 ZPkB6yVExWJJTohQsdsW29VgkQKtL/o6XYxyS/mX1GzU+8jCZSToaBtvNKRgF0lulk
	 F+UfHPuNl++tZHNdMOpif7QGFn5QaIEJIJlRrwtrlduNqcweYeeslRGtSNu35bncsC
	 bDT32GVgLCLCQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4hpCRx0vnLz4wLh; Mon, 21 Sep 2026 16:07:09 +1000 (AEST)
Date: Mon, 21 Sep 2026 16:07:21 +1000
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
Subject: Re: [PATCH v3 12/15] libfdt: Introduce fdt_getprop_offset_namelen()
Message-ID: <arDJmHPwgvwwmITG@gractus.seuss>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
 <20260826083146.304291-13-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HWDDMgSxOdVsznFF"
Content-Disposition: inline
In-Reply-To: <20260826083146.304291-13-herve.codina@bootlin.com>

--HWDDMgSxOdVsznFF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 10:31:43AM +0200, Herve Codina wrote:
> Future operations, such as handling unknown tags on dtb modifications,
> need to get an offset to a property based on the node offset and the
> property name.
>=20
> Several function exists to get a property based on the node offset
> and the property name but none of them allows to get the property
> offset.
>=20
> Fill the lack and introduce fdt_getprop_offset_namelen() and its
> simple variant fdt_getprop_offset().
>=20
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

This seems redundant with fdt_ptr_offset_(), which can trivially get
this information when combined with fdt_get_property().

> ---
>  libfdt/fdt_ro.c          | 13 +++++++++++++
>  libfdt/libfdt_internal.h |  8 ++++++++
>  2 files changed, 21 insertions(+)
>=20
> diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> index 856c62f1..50c0a8bc 100644
> --- a/libfdt/fdt_ro.c
> +++ b/libfdt/fdt_ro.c
> @@ -536,6 +536,19 @@ const void *fdt_getprop(const void *fdt, int nodeoff=
set,
>  	return fdt_getprop_namelen(fdt, nodeoffset, name, strlen(name), lenp);
>  }
> =20
> +int fdt_getprop_offset_namelen(const void *fdt, int nodeoffset,
> +			       const char *name, int namelen)
> +{
> +	const struct fdt_property *prop;
> +	int lenp, offset;
> +
> +	prop =3D fdt_get_property_namelen_(fdt, nodeoffset, name, namelen,
> +					 &lenp, &offset);
> +	if (!prop)
> +		return lenp;
> +	return offset;
> +}
> +
>  uint32_t fdt_get_phandle(const void *fdt, int nodeoffset)
>  {
>  	const fdt32_t *php;
> diff --git a/libfdt/libfdt_internal.h b/libfdt/libfdt_internal.h
> index 3c83d9a7..e3923629 100644
> --- a/libfdt/libfdt_internal.h
> +++ b/libfdt/libfdt_internal.h
> @@ -26,6 +26,14 @@ uint32_t fdt_next_tag_(const void *fdt, int startoffse=
t, int *nextoffset,
>  int fdt_check_node_offset_(const void *fdt, int offset);
>  int fdt_check_prop_offset_(const void *fdt, int offset);
> =20
> +int fdt_getprop_offset_namelen(const void *fdt, int nodeoffset,
> +			       const char *name, int namelen);
> +static inline int fdt_getprop_offset(const void *fdt, int nodeoffset,
> +				     const char *name)
> +{
> +	return fdt_getprop_offset_namelen(fdt, nodeoffset, name, strlen(name));
> +}
> +
>  const char *fdt_find_string_len_(const char *strtab, int tabsize, const =
char *s,
>  				 int s_len);
>  static inline const char *fdt_find_string_(const char *strtab, int tabsi=
ze,
> --=20
> 2.55.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--HWDDMgSxOdVsznFF
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmqwyZgACgkQzQJF27ox
2GdURg/+O6atCd8oELcF0xwucMUlaltwoEx8K3T6qYf4zPMHPERvUdPKyvviC7Ol
rn+t5/O2ef3Jc7512EHFGakNiB9vHwOsRelrFfaed/AI3+EphkJv+Fwvc80Mz4hK
MZlrZL2jeK1d0dq03N0OmrIFDXsEu+B2yqzpxnS5jo9insqg5vK3gwEfJ45zBne9
wqgk77MmIbGuao1b0mM3SJfM9V2IOoEeL5NasWOZLs0zoXhNjrCX5BpHaScjYahf
zXkfXrvii+l7hSk1TKYr5tjKp6IGjYuq80Gl/qaQhU4HbLQRvDPLYL5QEFYVJIDf
J9mNo+27dF/PwdhcHAoVmXqv7yf0Ba8f9kxtIiVJY6irHCQnQ4/MczL24ooGCfoH
QQVMeylMl6oOGh8xmyUUTcLjIj5pTFE0MHa7He/2FsAvZQAUff098HBVPXIFt8za
ZX+rvgixH550HAe6+KIWsdpm//dO313oKQ8mQTt7FcTnrXFs32JlaHBgMYcf2zsR
ZbJkp/3/jxb7ETwAFfU2tf5aZbl32IBNz8YcQxp9lWDS1FQtKOgc4c9t0HxlGZpI
O8/upvMO0ydt57d6UIIsr+wuCa9sX01/pAUjTd+IpIQtp8BB0CL2hCzNK8ASMH5+
v7V2bF3PJxYv+uPipI5S1oXpCZMTWJBqtpiWie3pJWW3EIe2YMU=
=c9pe
-----END PGP SIGNATURE-----

--HWDDMgSxOdVsznFF--
