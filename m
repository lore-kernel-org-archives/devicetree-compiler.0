From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 2/8] fdtdump: Fix signedness comparisons warnings
Date: Tue, 15 Jun 2021 12:36:08 +1000
Message-ID: <YMgSGH7I2wpB3RJH@yekko>
References: <20210611171040.25524-1-andre.przywara@arm.com>
 <20210611171040.25524-3-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="9sOZ9E1h/3KQCsVE"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1623729378;
        bh=Eah3MTKlvJHNOA9AUG6OBKGcK9hj42Ze5nDD1M8nWpw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WVNX+UWR4gdh7G6o9F8Zhod7pwqL4yXV8unVg/PV025a0rERFyd98S02LcHX/N1Uz
         wYfvtSUFLMOyrbGqVl+7ZXES2UrcC8/HgNOXgQ1EKdvfRu+Tnrdn9W+1zwXepp41dF
         JQEGuDztW0odF05M4fJlklOjSgu7qh5PTN+5tCKc=
Content-Disposition: inline
In-Reply-To: <20210611171040.25524-3-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>


--9sOZ9E1h/3KQCsVE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 11, 2021 at 06:10:34PM +0100, Andre Przywara wrote:
> With -Wsign-compare, compilers warn about a mismatching signedness in
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

Applied, thanks.

> ---
>  fdtdump.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/fdtdump.c b/fdtdump.c
> index d9fb374..bdc0f94 100644
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
> +		if (!p || (size_t)(endp - p) < sizeof(struct fdt_header))
>  			die("%s: could not locate fdt magic\n", file);
>  		printf("%s: found fdt at offset %#tx\n", file, p - buf);
>  		buf =3D p;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--9sOZ9E1h/3KQCsVE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDIEhgACgkQbDjKyiDZ
s5JNnhAAucnpTA++heczoBG3RngMDNSGevsHFMPWaDrBeaDsyVHWyeL9UUuPf6sp
95xjZg2UgFP3BZ/iQlY1qen1qgJgK9esHXWorDhR84Eqlk/W+SWcceE8YXnv/Ios
8VbPSF0/zvOsdHZYgIR/5GErMEfUkQxPFr59JDFE4KziMNovK5Y3i96P2A/DAMbx
mLC7cp3yKrbM2JK2wKDm6sOu0/XM8Iw+MZz11f7Het8YqT6yVT3zb5zB7M+QH+fm
H6ZYNL/QezZcbeBcvMsoDBbYNeB2HKuGqwV5EJpEQ0SWP6Brm2dFedAY8PRCCLgV
JnaSUGIWrpNSXqtuCjHaLZ5zr5Td4GecBF7VukEN9HgFrpUj2h9Ka2vUiVBnSF8I
Du5BRvBSbv2jz+yYtnWNjWX4tokT29QDTSVWB1teFyZqjaXt9OpMfojAIJgYaVFu
PqasAGPUpn6bb3aGKPLjEEgIXgAlkIlTszIcLxHP7WVGD6nG840eLp5MzMoWYnpO
70o84OxhV/iADHi9cAQOHATKyKLCQ8XaK+tgscXYdx2SPSLRSg8H9dBFRixz3h36
C+svbLIJMiSi6ogPeHFPOLiwUIQIDNVYdJ1Ft6XbjWe/lLGFfNsZKkR4bRouBN1V
LFzutrQwSF18BTEfo3Us3PngBz91RiPsiAi+VLr2lzpjZbfRwK8=
=EkFL
-----END PGP SIGNATURE-----

--9sOZ9E1h/3KQCsVE--
