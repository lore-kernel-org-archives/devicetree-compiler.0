From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 2/6] libfdt: fdt_move(): Fix comparison warnings
Date: Fri, 2 Oct 2020 10:28:48 +1000
Message-ID: <20201002002848.GC1844@yekko.fritz.box>
References: <20201001164630.4980-1-andre.przywara@arm.com>
 <20201001164630.4980-3-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="w7PDEPdKQumQfZlR"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1601602062;
        bh=0Zi35cKyDJDffy+KcuunalsTZoHGGsXn5pJAx/0JC0g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bx0QdZUPu+b29lpl6PK1QWyvT9Z04Rxg2zxP9ALsAdxIOtqMmee96qTx3RE+xYJni
         j5kmqAl/Qo/F6GrasYdXNhKkr/B4PuIyu7wOFGW3OKy/nk7TSHbtIKYMRP+Q0/aoR3
         eFDVBxeTN5Zqbhjh4HbKEaRg/1mr2DjeoM2R6AZY=
Content-Disposition: inline
In-Reply-To: <20201001164630.4980-3-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>


--w7PDEPdKQumQfZlR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 01, 2020 at 05:46:26PM +0100, Andre Przywara wrote:
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

Applied, thanks.

> ---
>  libfdt/fdt.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/libfdt/fdt.c b/libfdt/fdt.c
> index 04e1e06..6cf2fa0 100644
> --- a/libfdt/fdt.c
> +++ b/libfdt/fdt.c
> @@ -314,9 +314,12 @@ const char *fdt_find_string_(const char *strtab, int=
 tabsize, const char *s)
> =20
>  int fdt_move(const void *fdt, void *buf, int bufsize)
>  {
> +	if (!can_assume(VALID_INPUT) && bufsize < 0)
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

--w7PDEPdKQumQfZlR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl92dEAACgkQbDjKyiDZ
s5J0oxAAyy5e9Y2/dDU9C8uL15a+r8FfBAhiG2FFsuAOARrXOuyNADcivG7j13CG
WzOVa1aZKaThVchz4rVz5DDo+8n2+zvi4m5sL6n79R23olM19lXAWPVcbao3aqWh
XmxOyc+JR7Z72kfdAi2Z5DJ93XOxw+sTXSVIUcCcL1wqUsyhtD4CTCzFOuYLna5h
wtYXHFWKURRizsnaRzF777JLUqoxVXujI8dKxM7R/RFL5NNWzSge5RjTX1Tj1Ovu
aeASG+o1A9/8V8ivht/W8mnPsSI/BOG8Gza8FmQ2UpWnt11btsH5korxqG7zwzV4
EsELiJauPaKvu85NqFQp9GP3OUJ91yD/md56C9lCjjNz7tmRNviqCiQFUI/15wQc
Md+94PokbF4uC1f04Qt9/o0JaSrntrmU5x55868k1NDRkjhucfSn2hpdvgLJRnnK
A11cKXy+elhoNsYXittkgrZBkcYl/cLVRHK2dC+L2J60UhDbBDa+pZfoqUPI0CzX
Txo8SKfqzQeXCWMwCIVXGPbjhj5lzByj75lCAvf3WDMDsI9fIcFNcADxDnVOCHDe
olglq0/1p74LhbY325qpEn6KTt1Rh6g+0/mA/vqUvkf6+yRL2tTbckvytgChh6VX
aJ7TZJEYvHmBOVVwJZ2QSFbPaTWqI/M88BwqtELmt9TABtP0j24=
=TDAa
-----END PGP SIGNATURE-----

--w7PDEPdKQumQfZlR--
