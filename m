From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 05/14] libfdt: fdt_move(): Fix comparison warnings
Date: Thu, 24 Sep 2020 11:03:44 +1000
Message-ID: <20200924010344.GK2298@yekko.fritz.box>
References: <20200921165303.9115-1-andre.przywara@arm.com>
 <20200921165303.9115-6-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ibq+fG+Ci5ONsaof"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1600911797;
        bh=PGu6AZnyRUWbkg6DiIkJVTXnJz1SZqBu/zlVOHdbCDU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=U6OGL1T1eSlUdZGijWRYGU1yHcNmjW96j3LAXuE5AsbvBbh97UNNMjb5J74QTTIzJ
         HbHVN2cWNEj9sA+lZqK3PtSaowBXjCkZK8BKzvIxbn4lQtoPqVnimclmNXHR1eWM4R
         mCZ/i4XVOzS9WmaSNLBO+ksiuZnntQJHc3F30pPA=
Content-Disposition: inline
In-Reply-To: <20200921165303.9115-6-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>


--ibq+fG+Ci5ONsaof
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2020 at 05:52:54PM +0100, Andre Przywara wrote:
> With -Wsign-compare, compilers warn about a mismatching signedness
> in comparisons in fdt_move().
>=20
> This stems from "bufsize" being passed in as a signed integer, even
> though we would expect a buffer size to be positive.
>=20
> Short of changing the prototype, check that bufsize is not negative, and
> cast it to an unsigned type in the comparison.
>=20
> Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>

Logic looks good, but the libfdt-in-tiny-bootloaders people would
probably appreciate a !can_assume(VALID_INPUT) test to elide the check
on bufsize.

> ---
>  libfdt/fdt.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/libfdt/fdt.c b/libfdt/fdt.c
> index 04e1e06..43aaada 100644
> --- a/libfdt/fdt.c
> +++ b/libfdt/fdt.c
> @@ -314,9 +314,12 @@ const char *fdt_find_string_(const char *strtab, int=
 tabsize, const char *s)
> =20
>  int fdt_move(const void *fdt, void *buf, int bufsize)
>  {
> +	if (bufsize < 0)
> +		return -FDT_ERR_NOSPACE;
> +
>  	FDT_RO_PROBE(fdt);
> =20
> -	if (fdt_totalsize(fdt) > bufsize)
> +	if (fdt_totalsize(fdt) > (unsigned int)bufsize)
>  		return -FDT_ERR_NOSPACE;
> =20
>  	memmove(buf, fdt, fdt_totalsize(fdt));

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ibq+fG+Ci5ONsaof
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl9r8HAACgkQbDjKyiDZ
s5KV4w/8C/zSRJftrxqk7hDlPXwBHRO1KS8ZWRbuPl2jPluMIXujppRYsXl0/ppA
To6/IOmHchC2iU9XRPWVGwZsBQkQRYIXDgCWy4QP0tACur74wkSkZRH6pD3DwtO4
R16/di2sKtUVxMlYO+fezu8kUPATE+rTDFcwSBsCThuDv1F0mAET0Qp40WOtl3Hb
J1+zaSsOrUQIG/h48dVZlMqAqIrTzHXziYarzlSSI6DHiLoZzGiaECW8aoKTX/yQ
ca0H541u+rzvy/JTJmbxy5Uwt7jC++WIHXhjAh0Ix+l7BnB1Dd0HpusGIIZyd4eH
pQWCPNFsY22Z9jPNjCjGkaasNqsA0c9flyUB+nUAtfOt6Yxt42oX+G7SBuEbo/On
IHgi+Vj361zUoZQv9x8kD9v9fVjFKhfmvOODCuiOvxU5TAIAud55j/fW8UJuaP67
B9orU/9YvNsn5chs0aYu6aWf/3auFWi3JjbZF4PQdMunLQtnmwlv6QwDrbRslzR0
Htnru7XF3YVx0HrwYnGpErzcauNvKUZw601yAt92yMOM7uC5AH+GXWcX5cAbY5rI
tahzsVuFXvNIvrNWCius/200U2nMT9la+wPDciIMML/iG1luXSpEby3Y6m8W6rMS
ouRZRaRGcoUMLdcArkFjeLxwECiRh+/uOyRBmuFyXgvIDpfvuHc=
=jFFu
-----END PGP SIGNATURE-----

--ibq+fG+Ci5ONsaof--
