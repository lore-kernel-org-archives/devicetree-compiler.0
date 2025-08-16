Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688C61C84A1
	for <devicetree-compiler@vger.kernel.org>; Sat, 16 Aug 2025 04:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755320091; cv=none; b=Eic5kASXTeBFwySggtcnNcKigP8XbwCXsfx1z8i+I5SEG1XI3uuMYOidzcAC0V5WWscg2IaWF74OakMQeBYqgTOnrkNxEAZYvouCN6ALHf3hrxi3uAMIbpRCWfE1kILipCEc/r1PvnZHIMg7GY64sWKraSD6/TG7YNyjM/g3nq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755320091; c=relaxed/simple;
	bh=QaMKKU8kqrefGqozmdDrbsOpIl9FQ8go+h0RJQkL8sA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gp6iPm9ZX1xmn9EzCMkP3MJ/lbYzbYUvurCoBEHa6ksXA56grfh5ps0U8hlDMEAjfxstSvQi/s44076wfaIZK7UdSY24wsVETxZceQ8o6nijdhd54smv40OJ1Kbi1yJVfqWN6flecwAKWNTP18m91fBBLkI+IKseZlBSjFOghBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=aS382B8u; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="aS382B8u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202508; t=1755320081;
	bh=KXtsIP7fvWzo2eMOA+38QS0j+4kJgcnBhGQwxI+sYzo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aS382B8utFa8W3M41Gdkpt3UbdruSMJHie2OjmtTvt/7l09Y8xHc+e1m2c4Qp8k0g
	 hEv9NmGTCtQrZ3Cc6z17sbc5jullMXK0zVSKH+G82uK29f99vdOxIBEWmKU4KtnLvH
	 Beqv6IYIELgbLlnPDTO6Wur+MtkC3OmO3qVgxl3m5U0XTbfnqZ7WHeSXAk0mL2ZLCd
	 yQj2q5Ipf+7eUz3Vqugdyeb8UVrs5U5EAfQl4yCoorPivLiqHGugdmfxfT2SRiBOP8
	 mwXLCoISt6IFCBLtei4KpZpZ8v25cah2ZPHpKgTIK2qQB/ScPhxDQ2sJVMSc2jLN/3
	 +av9r+rvmpvdg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4c3mqP0f2Gz4xfH; Sat, 16 Aug 2025 14:54:41 +1000 (AEST)
Date: Sat, 16 Aug 2025 14:46:55 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH v2 1/2] livetree: Simplify append_to_property()
Message-ID: <aKANP68-2mO_RmZu@zatzit>
References: <cover.1755264521.git.u.kleine-koenig@baylibre.com>
 <eef88e559f5b9818c4c2311fa8a75ab6fd4508d5.1755264521.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eP1M/PyRndiSm2W7"
Content-Disposition: inline
In-Reply-To: <eef88e559f5b9818c4c2311fa8a75ab6fd4508d5.1755264521.git.u.kleine-koenig@baylibre.com>


--eP1M/PyRndiSm2W7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 15, 2025 at 03:34:53PM +0200, Uwe Kleine-K=F6nig wrote:
> The two if branches are quite similar. Build the property first (in case
> it doesn't exist) and then the common parts can be done outside the if
> block.

The patch looks good, but I'll need a Signed-off-by line.

> ---
>  livetree.c | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)
>=20
> diff --git a/livetree.c b/livetree.c
> index d51d05830b18..6127d604d528 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -340,20 +340,16 @@ void append_to_property(struct node *node,
>  			char *name, const void *data, int len,
>  			enum markertype type)
>  {
> -	struct data d;
>  	struct property *p;
> =20
>  	p =3D get_property(node, name);
> -	if (p) {
> -		d =3D data_add_marker(p->val, type, name);
> -		d =3D data_append_data(d, data, len);
> -		p->val =3D d;
> -	} else {
> -		d =3D data_add_marker(empty_data, type, name);
> -		d =3D data_append_data(d, data, len);
> -		p =3D build_property(name, d, NULL);
> +	if (!p) {
> +		p =3D build_property(name, empty_data, NULL);
>  		add_property(node, p);
>  	}
> +
> +	p->val =3D data_add_marker(p->val, type, name);
> +	p->val =3D data_append_data(p->val, data, len);
>  }
> =20
>  struct reserve_info *build_reserve_entry(uint64_t address, uint64_t size)

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--eP1M/PyRndiSm2W7
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmigDTQACgkQzQJF27ox
2GeDpg//UEAWXkYyd6lIQOJ5x0n5judgeIy54ZT+xbWsaMhcf/ps/8toQiM5f9Vn
R8ZlN3D2SOBLlYgB/fVVDgnQfs6fis1Kp5RgCuuwi0KMstVJuo0wLNUcwUCOXYo3
mcjl7HikdCrVJEdGHuLNmYUeiaT6j2FqCrI/Jba8Pah7TVZwKrvCAmg1KEJNWLbx
Nua7PAbW6+i4QX3+iSeWPNj4Ln9Jem2lNUuz7l2HMDC+SZpLKNeGjVwgD8SlUn5w
wKZnd/yi6QJIchAdGicGJ18NVg5B9L5Pb3zR6pw0OFiqL23NwMiFNlKd0+QyPA5e
resdPzN3sE7gNm/lgKa+dwknsaGWWGXh+wF75/Sdp9pNe9SmU5uzVrKQexzAj2+s
ULInLSSbNeG0QxNQnAlpyOQd17gF68+Pf9af4pym+payK8t52Ixmnb4wAIPpYwBR
p+sqsqRQ6LB2TzsPGQddefKEIV/dHEoixnNsSUFqA2d2BW1Gr2ZhMQwTtO9zUOIi
/F7N4iYwPJ9lM4V0wXe3waHzddvxJIAITOkNG4MEA30E4kafpwKwkiOjH9nzR/F2
UEwHNRbybyfqdmTtYOjrJ97yCo79xVk2Q2FP5zvz93/YbYgEh7qvNGumhAiyoe42
bK+IHT0Nri1cBX9vTCV1vR7+46aKPN8yxG71x86kLKOKt/9uXYQ=
=Q5gq
-----END PGP SIGNATURE-----

--eP1M/PyRndiSm2W7--
