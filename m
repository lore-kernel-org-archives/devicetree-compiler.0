From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 03/11] fdtdump: Fix signedness comparisons warnings
Date: Tue, 13 Oct 2020 15:51:34 +1100
Message-ID: <20201013045134.GM71119@yekko.fritz.box>
References: <20201012161948.23994-1-andre.przywara@arm.com>
 <20201012161948.23994-4-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="oYAXToTM8kn9Ra/9"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1602565778;
        bh=8fKvjFNS2fuPhf/4ictYtFZeF8Qu6UboGWYSB1OFaTI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Grd+uZjylpKteUVawhV685ZKHFXS3VBMImFKeRJJF9jhqwClbmorKoXNMLIu1y4RY
         GzxWvLiBo9BM58fqIOyELD0+pMv7//p1f5nAX/1XfomqvO7qUKtAro1dAFDOC6v2OB
         WjlyVctjwfv0l+DkZXhJxbACCxytns2PwnVLCjW4=
Content-Disposition: inline
In-Reply-To: <20201012161948.23994-4-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--oYAXToTM8kn9Ra/9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2020 at 05:19:40PM +0100, Andre Przywara wrote:
65;6003;1c> With -Wsign-compare, compilers warn about a mismatching signedn=
ess in
> comparisons in fdtdump.c.
>=20
> The "len" parameter to valid_header() refers to a memory size, not a
> file offset, so the (unsigned) size_t is better fit, and fixes the
> warning nicely.
>=20
> In the main function we compare the difference between two pointers,
> which produces a signed ptrdiff_t type. However the while loop above the
> comparison makes sure that "p" always points before "endp" (by virtue of
> the limit in the memchr() call). This means "endp - p" is never
> negative, so we can safely cast this expression to an unsigned type.
>=20
> This fixes "make fdtdump", when compiled with -Wsign-compare.
>=20
> Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
> ---
>  fdtdump.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/fdtdump.c b/fdtdump.c
> index 9613bef..ec67f99 100644
> --- a/fdtdump.c
> +++ b/fdtdump.c
> @@ -18,7 +18,7 @@
>  #include "util.h"
> =20
>  #define FDT_MAGIC_SIZE	4
> -#define MAX_VERSION 17
> +#define MAX_VERSION 17U
> =20
>  #define ALIGN(x, a)	(((x) + ((a) - 1)) & ~((a) - 1))
>  #define PALIGN(p, a)	((void *)(ALIGN((unsigned long)(p), (a))))
> @@ -163,7 +163,7 @@ static const char * const usage_opts_help[] =3D {
>  	USAGE_COMMON_OPTS_HELP
>  };
> =20
> -static bool valid_header(char *p, off_t len)
> +static bool valid_header(char *p, size_t len)
>  {
>  	if (len < sizeof(struct fdt_header) ||
>  	    fdt_magic(p) !=3D FDT_MAGIC ||
> @@ -235,7 +235,7 @@ int main(int argc, char *argv[])
>  			}
>  			++p;
>  		}
> -		if (!p || endp - p < sizeof(struct fdt_header))
> +		if (!p || (unsigned)(endp - p) < sizeof(struct fdt_header))

I think (size_t) would be more appropriate here, since it will match
the other size of the comparison, though it's very unlikely to cause a
problem in practice.

>  			die("%s: could not locate fdt magic\n", file);
>  		printf("%s: found fdt at offset %#tx\n", file, p - buf);
>  		buf =3D p;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--oYAXToTM8kn9Ra/9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+FMlYACgkQbDjKyiDZ
s5IW1w//QBrGxocaZIa9kjHrBFKGCSaMwkunn9TRkrRYFgIxvQ6kM1H9a6Vx1yGa
T5v4ULdYSmqJ8QEzoujNkEf09kkLOuzWAh9tLvMDbiDJ6hNUzCQJYt14X88Nbi8E
NMFi+7g7/KiclCG3JXzps2P/3YnIOQZI3BWIXhIFHDUHTZ9IP2BFp7/+HjDUTDk7
9rKpHubDIIm4c4XHBizShwcd1Td8NGlMe4dq/V8Xswb3Ov4bSBUWKL3p7cGUqrR9
8vax3pbHsu1QHir0KoQ79SsqHkMQHb17m3Vh2msykOmGvnR9atP888akB7RLTWmN
XqLBZbhWtoV5Tlm8EDuiQXmQGpwdOlPK5L8XPyE5E63TUkL6K5arUlWFw9HXK5s+
uAIh8E+uxeRqBiBIQa1ucHML2kq0PW3yXINrmibTpv3HswbwaHzj068i/ncXj2RX
2nyybswe3qmSfmJnvCt+eurfD3EnPuhz4whhgX7pVePK+GrDuQICjKzRsJgiG9V7
bUiuIn2yLcCzJvZMqTXkkQswOWy3el1UlTG7JxRp4xGWxZJiEnEoR2dS7mSXKOvH
pfWAHnu9z74L9S8RFLH3nvV18r7am1JbyS8O6fNrPuVhQe0Xn0NfaTiypRTNSk4l
Vl4atlaouy5Esjicq/qCRCHIEGnOFJhegBQ90wAc1Cd++OeYh0A=
=UuAk
-----END PGP SIGNATURE-----

--oYAXToTM8kn9Ra/9--
