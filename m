Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96FF217659;
	Fri, 13 Feb 2026 06:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770963277; cv=none; b=J4evrE6m4f67R6uJdks+64BJRk/0rld/ofAsm7wgWN9gF9rtIOTjvq/1tlH+38++mmuEenJDCpRWl/A9xICklIXd7VPczmsPRnuF2vpqMVb3J6gDHFpef6ozj1ggm98F+8ro5SYBCxuoEvVhG+mctGanjQKT7KElE1FYtgZb3gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770963277; c=relaxed/simple;
	bh=qF6Oeuk8GOAaHa4pj4GTJTG9PfcX8pii0+KpBMI1sP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mCbQasXvgQUipGP3Gg16L80wk4BloNGqeBzpFRBF6mVe+93YoIaAw3plHK2fAqGj4009HGFCSTsXoXOIyL+sB8ZEjuUQlLb4YEj74krMgVJwh5XQjNVYf0D76v381+syjqdp9tkq/sINk1K8TCrs8H5z5G10l4VvWnRQ8Bm/XT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=BoPaxH6Q; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="BoPaxH6Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202602; t=1770963267;
	bh=MP91vNwHCLl6vWuiKmiSwgELEwuis9I+P92P6USxMSQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BoPaxH6Q2UpSmy+Hd787cyOgPyy1IIbqFzA8q5bKjYoF6DEI/c/G8q5XahE9ji/Ne
	 1VTfPyKzhqB29t1sDqRPpGw4frXwIRinmvEEt1BJ4Fn1AxO8nINGlQ3wCMvNEPj6aE
	 npx57iNvYtr1y+knct3cBblKEl1eMZknGWb/zSEpcVUx7LH04Xl54cGR51lg9RNvUn
	 lP5T2HfVZGQNA0KsxhdwUOJHRwe9RV+6qR8pJkLd/fcfzcF0GsmpdAVDzhE2MzP3TI
	 TNkczyihEqOym+ux4z2/WwoYW3KtA2SV9oMA8zxVaAd5my5wKfUF4GPj8Rv1gHW8mK
	 J3gyCOL1WmlSw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4fC21v5qkDz4wCZ; Fri, 13 Feb 2026 17:14:27 +1100 (AEDT)
Date: Fri, 13 Feb 2026 17:14:05 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ayush Singh <ayush@beagleboard.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree-compiler@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree-spec@vger.kernel.org,
	Hui Pu <hui.pu@gehealthcare.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH 01/15] dtc: Use a consistent type for basenamelen
Message-ID: <aY7BLVQEWLLYxWBi@zatzit>
References: <20260210173349.636766-1-herve.codina@bootlin.com>
 <20260210173349.636766-2-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hcXyh80QbaoBzcm6"
Content-Disposition: inline
In-Reply-To: <20260210173349.636766-2-herve.codina@bootlin.com>


--hcXyh80QbaoBzcm6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 10, 2026 at 06:33:29PM +0100, Herve Codina wrote:
> The basenamelen member in the node structure is set in all cases to
> a positive value, the length of the basename string. Also it is used as
> parameters on function expecting a size_t type.
>=20
> Further more an implicit cast of strspn() returned value from size_t to
> int is needed in checks.c to avoid a signed/unsigned compilation warning
> when this value is checked.
>=20
> This member has no reason to be a signed integer and its obvious type is
> size_t.
>=20
> Be consistent and fix its type.
>=20
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Applied, thanks.

Reviewing the rest of the series may still take a while.

> ---
>  checks.c | 2 +-
>  dtc.h    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/checks.c b/checks.c
> index 45d0213..946c142 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -324,7 +324,7 @@ ERROR(node_name_chars, check_node_name_chars, NODECHA=
RS);
>  static void check_node_name_chars_strict(struct check *c, struct dt_info=
 *dti,
>  					 struct node *node)
>  {
> -	int n =3D strspn(node->name, c->data);
> +	size_t n =3D strspn(node->name, c->data);
> =20
>  	if (n < node->basenamelen)
>  		FAIL(c, dti, node, "Character '%c' not recommended in node name",
> diff --git a/dtc.h b/dtc.h
> index 7231200..473552e 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -227,7 +227,7 @@ struct node {
>  	struct node *next_sibling;
> =20
>  	char *fullpath;
> -	int basenamelen;
> +	size_t basenamelen;
> =20
>  	cell_t phandle;
>  	int addr_cells, size_cells;
> --=20
> 2.52.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--hcXyh80QbaoBzcm6
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmmOwSAACgkQzQJF27ox
2Gcd1Q//Tvhcgfpf7L6SlfRq3qmgfQeIu7dWNpS2Z0XN/H9lYuklQ3IiP3nrMbBl
69bhbRGhTkPTcMsRdzIiMMAOtoyUwzgMJWG8LdgsLXrglgEuv8bWjjFiP/H4YT/8
yvVsKKRQCFuv6ji00hk7/AZMbtjV3Qh7JoyrkcgE1AtWb5mHdCy809i+ydaB6K+v
uVpoUEbFmoZ7Mk7XmYuuXXHp5oJyhxZ6R7ZX7JFRngE723XD1NN8jlvyng3TVwzy
rufa6Fq2w1WaXuoG/bMj3BmpIAJm5XWm/vHAALhMyMD0hcd9caqN+lD2fCBDJ+hw
V+uH3O7MZPYpR7xHpz3hZtr49ADB3j/31GRQYQfcjZMdUB2Aa9vcgW1vaJYWoif9
DYHW7+sgXFyZypMY21IDAxZyNhDg8hmTaDaVvzcWqh9Ppn0mxzt8nIIfvNnywMne
PRpr8gVxjLuAppGhrey1TzcyA1lwhWNdbYzjTYWZxX7Otz3ZnC10xJbgBYJ+P9s3
Vaf9SFbtzIKLs3i/hQD7oCRMMVZ+blXZMtwULKJjnbJHzo3BuIUcomiHCO7o9xOC
r1Jl1nJ6KVJp3RNMV5zk6IJFgWpXdAd3oT6ziPk66KZLDMQ3YEQlzkMYEkfts6O0
iLcEhcC9dnp6N3UnmzHDFl4bRgksKp4u7ohw6jmNvTz8fQHlJBY=
=fzz+
-----END PGP SIGNATURE-----

--hcXyh80QbaoBzcm6--
