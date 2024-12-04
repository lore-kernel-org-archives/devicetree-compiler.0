Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0154617D2
	for <devicetree-compiler@vger.kernel.org>; Wed,  4 Dec 2024 00:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733272451; cv=none; b=WWASnhFqxyGuyMz1Zh9YJigoXXvI6Ux8F+Hl83pg3XnYtQh2Pgxctdmx/jz0zxz017iaMas02FLj7yMfWXqvJ82GBtiy1aEwis8vYJExHKQY89cdXtYQlKDqskYVDqicj6xGKIEipZBMyy+dErzVwoRx95czxPqGs0upVLommEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733272451; c=relaxed/simple;
	bh=rGF/wRnU/DQBzn12j7uWTHjLFZYiUlfAu28Y6a/nxSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h2TRD/6UvS5+oTVdBODRAu5h0CEJGnPGl1EtuR3OvG4C8+VSdBNgrHLCbQ+R3fvPzkysrJ098CmC6StLSLeHW9fYsASfMox0JydVCoj9NfNu8vo4NXeiFymU08p6E+oUi1rpaFEvNcHR0tqAfMTwHltYBNjRkBLYhihfnhvZ9WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=VdZoqLqs; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="VdZoqLqs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202410; t=1733272442;
	bh=wjwK7ASQM8RM52XnfmwdxK5n4MQYxIU9Jq2kMx7eFWo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VdZoqLqs4vvSPlEZgWOODs0+WDJL8oNlCVZnRLcXDUBWjQRerPmGObck9iRG6RcBU
	 ofKuVN6K24hPFON02kQscZx/vCG8XaMssX4PrBgSkNxT7AXX2lVXzCb7OfECyJdY7D
	 wsQvskGENL6TqFyG2+fpA/SqkWVsNyiHgVYrWbvQnT0mckg4OYtUDH1YK85iaULtN6
	 L+BOJGFUdkgDMy2EBFWmI02mW9yNymkC9hlP9QDKBqg4c7P//JKgFjRraFAjF34g78
	 11wQ3k/FpYMOd76MHZHnCnjU8C/hpixUDHgBTJhpq72Bn93Bc3uO5o+z3N8X0QdYId
	 KwefiQByzhUNg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4Y2z6L1Wzyz4xFb; Wed,  4 Dec 2024 11:34:02 +1100 (AEDT)
Date: Wed, 4 Dec 2024 11:22:19 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Ayush Singh <ayush@beagleboard.org>
Cc: d-gole@ti.com, lorforlinux@beagleboard.org, jkridner@beagleboard.org,
	robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com,
	Andrew Davis <afd@ti.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Robert Nelson <robertcnelson@gmail.com>,
	devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH 2/4] libfdt_internal: fdt_find_string_len_()
Message-ID: <Z0-gu8wQVGRtmjMM@zatzit>
References: <20241203-setprop-namelen-v1-0-d1ea333fbd6c@beagleboard.org>
 <20241203-setprop-namelen-v1-2-d1ea333fbd6c@beagleboard.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IGgjej4VxF3SGzmZ"
Content-Disposition: inline
In-Reply-To: <20241203-setprop-namelen-v1-2-d1ea333fbd6c@beagleboard.org>


--IGgjej4VxF3SGzmZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 04, 2024 at 12:00:00AM +0530, Ayush Singh wrote:
> Allow specifying string length to `fdt_find_string_`.
> fdt_find_string_() now internally uses this function.
>=20
> Signed-off-by: Ayush Singh <ayush@beagleboard.org>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  libfdt/fdt.c             |  8 ++++----
>  libfdt/libfdt_internal.h | 11 ++++++++++-
>  2 files changed, 14 insertions(+), 5 deletions(-)
>=20
> diff --git a/libfdt/fdt.c b/libfdt/fdt.c
> index 20c6415b9ced113d9fcce25b69007a6b0f9e68e7..95f644c31f9431eb597b6f683=
741ff9be375cebf 100644
> --- a/libfdt/fdt.c
> +++ b/libfdt/fdt.c
> @@ -312,14 +312,14 @@ int fdt_next_subnode(const void *fdt, int offset)
>  	return offset;
>  }
> =20
> -const char *fdt_find_string_(const char *strtab, int tabsize, const char=
 *s)
> +const char *fdt_find_string_len_(const char *strtab, int tabsize, const =
char *s,
> +				 int slen)
>  {
> -	int len =3D strlen(s) + 1;
> -	const char *last =3D strtab + tabsize - len;
> +	const char *last =3D strtab + tabsize - (slen + 1);
>  	const char *p;
> =20
>  	for (p =3D strtab; p <=3D last; p++)
> -		if (memcmp(p, s, len) =3D=3D 0)
> +		if (memcmp(p, s, slen) =3D=3D 0 && p[slen] =3D=3D '\0')
>  			return p;
>  	return NULL;
>  }
> diff --git a/libfdt/libfdt_internal.h b/libfdt/libfdt_internal.h
> index 16bda1906a7b335519b9f748d1be6110de551e79..1fd35f364e9af15df19ae5b8b=
7231584804e96a4 100644
> --- a/libfdt/libfdt_internal.h
> +++ b/libfdt/libfdt_internal.h
> @@ -6,6 +6,7 @@
>   * Copyright (C) 2006 David Gibson, IBM Corporation.
>   */
>  #include <fdt.h>
> +#include <string.h>
> =20
>  #define FDT_ALIGN(x, a)		(((x) + (a) - 1) & ~((a) - 1))
>  #define FDT_TAGALIGN(x)		(FDT_ALIGN((x), FDT_TAGSIZE))
> @@ -20,7 +21,15 @@ int32_t fdt_ro_probe_(const void *fdt);
> =20
>  int fdt_check_node_offset_(const void *fdt, int offset);
>  int fdt_check_prop_offset_(const void *fdt, int offset);
> -const char *fdt_find_string_(const char *strtab, int tabsize, const char=
 *s);
> +
> +const char *fdt_find_string_len_(const char *strtab, int tabsize, const =
char *s,
> +				 int s_len);
> +static inline const char *fdt_find_string_(const char *strtab, int tabsi=
ze,
> +					   const char *s)
> +{
> +	return fdt_find_string_len_(strtab, tabsize, s, strlen(s));
> +}
> +
>  int fdt_node_end_offset_(void *fdt, int nodeoffset);
> =20
>  static inline const void *fdt_offset_ptr_(const void *fdt, int offset)
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--IGgjej4VxF3SGzmZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmdPoLsACgkQzQJF27ox
2GcAng//Tvwrzg23vfybKZ5/HmAHkzFMRCKamGG/FXM38poTjqqRtLsAGzB9VC7D
+ihxycZ2HX7A/WjHlIkzRk08sTu+0//ru0dTKPtyhk0b5WIRzpGlsPG6UhkkQgOg
0QqjlTDgPRmVp3UGSCC0RFQv/U4R4GET2qrfH/QCukihXuQR11yYW6AfLeoo8R6t
pzRadUy3YXltIFAzhqjX/4+VuUNvATyS3emdZO7O2gEi1QrNPP0EZCLIDYxD8dVM
s0O7bUqtxu7DgBb8jC3IrXSt8GJ7VylJq1fBg48sFdugeSVkVC4uV2CL6oFLoK/J
pyTNTB6hBiI/IFVffy0HBLB9ehaL59JawBaJttpIi63Ri6YMKB+7ZwkdOsZbNTA4
CaAx8qk6i/bu9/Vg8R7K1tIqsIuIqhttBfQEsNvPRJMoXaqnx7leZSb3jN0PJJ8L
43lC2KKi5AGCZPzksb5qoERHDPxKiZYyLNPnekVuRHwgwENTn89q+KULC/0Mk4FM
r5OjxpvXkPb92LLojO7ed7dcYuyY6BNfXLWgAXsY1sn3mM9v0zK75j34NUGwq1Hl
u7YtYH2yFTFKRCtR/t03Hs5Dk08geQmxcigO81vfbwrH90259mh8amzUmUt2XDxH
wvcf2A3aw/Ybz1BXlAPRXsNlTdMor/t9i9EWreSYm2av40UNaaE=
=AphS
-----END PGP SIGNATURE-----

--IGgjej4VxF3SGzmZ--
