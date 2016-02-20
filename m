From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] libfdt: simplify fdt_node_check_compatible()
Date: Sat, 20 Feb 2016 11:29:31 +1100
Message-ID: <20160220002931.GC15224@voom.fritz.box>
References: <1455255912-26241-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="exKAuxcSaZxx4B14"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1455929529;
	bh=bSOLhvgZ1oknd2j/4pBvWHGFtrx/NTBqZgBjxhnEf1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j5kw/qWElXU1kU0K9GjwnzIxBSGdE2Kli+8BNpnNYZkQyMe8+ma3FHIXrEtiegYEX
	 Ulw4FA7ijb8BB9mYv8rSK45bbBEFRoA/VfXlPAmCWxf9DtKopH2UkDZfVkPB77FWNe
	 +s2g8nTugfK+khfkrVzQ1sLYzUHTk99/Zm11NL74=
Content-Disposition: inline
In-Reply-To: <1455255912-26241-1-git-send-email-yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--exKAuxcSaZxx4B14
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 12, 2016 at 02:45:12PM +0900, Masahiro Yamada wrote:
> Because fdt_stringlist_contains() returns 1 or 0,
> fdt_node_check_compatible() can just return the inverted value.
>=20
> Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>

Applied, thanks.

> ---
>=20
>  libfdt/fdt_ro.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> index e5b3136..50cce86 100644
> --- a/libfdt/fdt_ro.c
> +++ b/libfdt/fdt_ro.c
> @@ -647,10 +647,8 @@ int fdt_node_check_compatible(const void *fdt, int n=
odeoffset,
>  	prop =3D fdt_getprop(fdt, nodeoffset, "compatible", &len);
>  	if (!prop)
>  		return len;
> -	if (fdt_stringlist_contains(prop, len, compatible))
> -		return 0;
> -	else
> -		return 1;
> +
> +	return !fdt_stringlist_contains(prop, len, compatible);
>  }
> =20
>  int fdt_node_offset_by_compatible(const void *fdt, int startoffset,

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--exKAuxcSaZxx4B14
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWx7NrAAoJEGw4ysog2bOSocIP/i/NVfPoGya50kL9n8AviHAv
hNaB6L1AoKKtnxmBbMd1P319PObw6YsI1Q3K5M22pDLK9Cc8xVVAxT0zKTKBTch8
LFC+uvEX80rqEIoiN/6lp5BLLKK0i6nVJgU+kibbZata3BoX7/bcHBxTa8ceBGZq
nvpufT848dcVF6Yn2ypPVn6k8IFGxp7hJ6WZwFUaxSZNVYuOuE2XySg83L8mrU/2
obNH7jIF//5YeCihfBMfKpSpm0jSpZChdc9HDyIdXAJ+bRD0WnNla9CcKyIfkx9p
2u+EvRnY7su5dooHMmz95C3hlA6tlYCnMZvyTS5TZYVK6ebcHkdEPsCEidlDRbZm
hXTlPvgOxIT2YEA++7qVn2jwNy9fjoIV+XLzqZLTcon2ZhGoy+qrfKg+/mRsWTcP
LNsbq84xH7oCddlIcwB9ba1j67fzTSEFhHWu+ezqe3GTVDngdT+dsf10+jt7fmEX
+rlrXxondqtUZatJDEUZgPr9SJgLI/L/WBCsTJTMZlzfrn/V1+yBdUw808sHoyGh
cbB9rE2EOI4yOHRmamRk2+Q0xrGR5zPKGTLrLHTAWS4J3A7Wml/olqj8jaExnfKf
YqhuAm6hO7uOg6Ay6lmFeMK6GVvfLK1faYz8ZTXipqXFETrlOqoGMGfKNhS9Z0g/
bZz8Wk9oNTQ5p57pOk35
=Ul3j
-----END PGP SIGNATURE-----

--exKAuxcSaZxx4B14--
