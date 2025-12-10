Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF89221545
	for <devicetree-compiler@vger.kernel.org>; Wed, 10 Dec 2025 06:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765349441; cv=none; b=CtTd7IeHzvpOyAfOqi9UNK6S3IQkWXHD5DFjBYgrsVcYPuVU/A8yYxFXfWKZb0fKSnn6U+E+vN2MYYI6kpc904rFHUq4WdyYvWDXZ5RCltocRB8CIrNMcWVmfKmPdC9dxlM2xF9u78nITu6sL8A0RWvubVRsbJRbNV9cELEhW+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765349441; c=relaxed/simple;
	bh=MKt6AVHiSDhxLCVOP4IkIaQ3PUBSXHye38dblyiyWHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pUSItEakWAViCQilwB0/RT3E7xHA+Rp9KRWq7FLm9Men2rjySmSE+LUbvbq28+gAMCug3BpItCtfuGkf1qkxEu63a4QVjZdmwh5nu+kSYBSffHTSO9ajf7Z3yIvPoyY+lbXRmEh7IKaviUoxqglcGiDMbEDq5ExHc/jPHO/UFLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=WMtt/bkJ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="WMtt/bkJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202512; t=1765349437;
	bh=N4UUQuYVvppuHDp7l3R0WgQHCXLmdpWf9JaJtdd0j3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WMtt/bkJkO/i+HAT85uUbEtlgYCEsg/23m2v6SWk6//3RG+8viQoLc1EjZq5d2290
	 YwyBg/y14lL2K4wZOW4pHq72WyecZ4ZLH9oh7jA5hN08u9W+cOXuMbDnq4KrL/hbVH
	 hy+GJ471cfn10x5UpZ+kNg+lcfHLaIb0GDNLS3aK0Nkh3ab2UbqEhkCzN5GMZ+Jhpj
	 IkKd0JhbDW32tnUfZ+93FSYnc7TfTjwv84qhIL4j9ooJH791WNIZr3F25hVHZZjk/C
	 TNwh+okoRmoX8hT4u8q/ZQ4zA9eGY2O61JmHM6ZfR9C2vlNl5or20l0JQMPIR6A57m
	 DCPdQNeGbPmfg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4dR5vd6Y14z4wM2; Wed, 10 Dec 2025 17:50:37 +1100 (AEDT)
Date: Wed, 10 Dec 2025 17:42:45 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Tom Rini <trini@konsulko.com>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH 1/3] libfdt: libfdt_internal.h correct final comment in
 ASSUME block
Message-ID: <aTkWZSbWyXnF2ukY@zatzit>
References: <20251210022002.3004223-1-trini@konsulko.com>
 <20251210022002.3004223-2-trini@konsulko.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eTd7FVG7fl9LF8RC"
Content-Disposition: inline
In-Reply-To: <20251210022002.3004223-2-trini@konsulko.com>


--eTd7FVG7fl9LF8RC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 09, 2025 at 03:50:51PM -0600, Tom Rini wrote:
> The value "ASSUME_SANE" was never used in the project here, only
> ASSUME_PERFECT was used. Update the comment to reflect the correct name.
>=20
> Fixes: 464962489dcc ("Add a way to control the level of checks in the cod=
e")
> Signed-off-by: Tom Rini <trini@konsulko.com>

Appplied, thanks.


> ---
>  libfdt/libfdt_internal.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/libfdt/libfdt_internal.h b/libfdt/libfdt_internal.h
> index b60b5456f596..9eb32394eb79 100644
> --- a/libfdt/libfdt_internal.h
> +++ b/libfdt/libfdt_internal.h
> @@ -92,7 +92,7 @@ static inline uint64_t fdt64_ld_(const fdt64_t *p)
>   * signature or hash check before using libfdt.
>   *
>   * For situations where security is not a concern it may be safe to enab=
le
> - * ASSUME_SANE.
> + * ASSUME_PERFECT.
>   */
>  enum {
>  	/*
> --=20
> 2.43.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--eTd7FVG7fl9LF8RC
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmk5FlYACgkQzQJF27ox
2Gcmiw//cSnM0AbrhQ1vpzU522ko7m0uo8DLPPYz8XV35tzroN7tDw+h+GbqaM0p
O3sIO17T6aI0wJo8tZMA0OwsDoe4P0ZUgZurHbAYntAnHi54UySKFOZvEWfUI94B
VrgDz2shQseSQOpHvTsyRrA316Dz3w8UOG9Dw+P2uKdh9OnhQKpZGXq0Nq7lz2MT
tGrhs4ziGLCvrjwNCTx8P8g5S6LgPvYG1bvH+VW5RXHY7B60UjJBxaixHmdt045A
sVj1ZrnfW328gvz9AR345WGtkGSJ9RWoV57OdC9h1TeEUJWGEZjZrhtBpF1GBDKJ
2Jm82Ui95VwdL/oKUSEBzwdYc2dPJ44OLwitJddQk46hvqIgNpgcAVL89ek9H5/o
bMqCXAtBPtsqC5Xt7LkyM6Xxs1CniYLqHwANg8/KkcEcz8RjK/egDEN8dqpMNOEd
odCv6hbNf6eX1hszPoZZ3DcMyJYGAO2FZmFFVcM1Ugkoiakz+FugzeyFSnwEghti
GEbRzUwUnoSqu9197ky542lc6VoWkGBVuM7N4GZwIQhdljwfrmW3243iClAOa3I7
TcnfN8YYKz4u7wfON2YhX93/+qic4BH3CFr9cLBNHxvawWISIZs7KJ/a6kRW+Jp+
k1WWcxSwvCAuDPCHP9P88At30NpMvRqMmjWockQtENJHhRpLKAM=
=0c58
-----END PGP SIGNATURE-----

--eTd7FVG7fl9LF8RC--
