From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 3/8] fdtget: Fix signedness comparisons warnings
Date: Tue, 15 Jun 2021 12:44:58 +1000
Message-ID: <YMgUKtrYpxG8jADT@yekko>
References: <20210611171040.25524-1-andre.przywara@arm.com>
 <20210611171040.25524-4-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jDBhPeuoEA2UbuW9"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1623729378;
        bh=d+wSLofKlOe41I4lbE3J4/x6yvrFAmVcnpAe3r98diw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=n9OjpLnmCKkLWv5u25aC/n6qW8/4S7Ioz/+C55oS6j+eFWQgHhmzvmEFAwouklf8s
         h3oXLID9mgKbMb/RmlMlyfFUWZ1sdgBWW2Xf1DDY6YH/1PtS4gT9pTM3w5YmKF+USz
         02/FCbc70gjIyuZLb3c4iNQLjgv8oe+nBeo4Da9M=
Content-Disposition: inline
In-Reply-To: <20210611171040.25524-4-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>


--jDBhPeuoEA2UbuW9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 11, 2021 at 06:10:35PM +0100, Andre Przywara wrote:
> With -Wsign-compare, compilers warn about a mismatching signedness in
> the different legs of the conditional operator, in fdtget.c.
>=20
> In the questionable expression, we are constructing a 16-bit value out of
> two unsigned 8-bit values, however are relying on the compiler's
> automatic expansion of the uint8_t to a larger type, to survive the left
> shift. This larger type happens to be an "int", so this part of the
> expression becomes signed.
>=20
> Fix this by explicitly blowing up the uint8_t to a larger *unsigned* type,
> before doing the left shift. And while we are at it, convert the hardly
> readable conditional operator usage into a sane switch/case expression.
>=20
> This fixes "make fdtget", when compiled with -Wsign-compare.
>=20
> Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>

Hmm... this code is pretty confusing.  I can't actually see any path
where size will be set to something other than 4, 1 or -1.

The change looks correct, despite that.  Though I wonder if we should
add an fdt16_ld() helper for this case.

> ---
>  fdtget.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/fdtget.c b/fdtget.c
> index 777582e..1f6eb73 100644
> --- a/fdtget.c
> +++ b/fdtget.c
> @@ -62,8 +62,14 @@ static int show_cell_list(struct display_info *disp, c=
onst char *data, int len,
>  	for (i =3D 0; i < len; i +=3D size, p +=3D size) {
>  		if (i)
>  			printf(" ");
> -		value =3D size =3D=3D 4 ? fdt32_ld((const fdt32_t *)p) :
> -			size =3D=3D 2 ? (*p << 8) | p[1] : *p;
> +		switch (size) {
> +		case 4: value =3D fdt32_ld((const fdt32_t *)p); break;
> +		case 2: value =3D ((unsigned)(*p) << 8) | p[1]; break;
> +		case 1:
> +		default:
> +			value =3D *p;
> +			break;
> +		}
>  		printf(fmt, value);
>  	}
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--jDBhPeuoEA2UbuW9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDIFCoACgkQbDjKyiDZ
s5LOMw//ZIoNoGDlGvDUqqvhutI88TXM5JnTpN4jQBLMRSo79/R3EWFBEZta8GQO
9I24K7rT8WunFImkHxw02riXrchTI2oBdJ23mk2zks+yovCyqrnm5/x6+91x5H05
+J9Wewe2bArtLnnP2gR2MPZD4DTzTBtK5Eqp57g2EDTn3ibudEkNBJE1Oso610Re
rS9KiCOt6f1Z6x/kIPxWhLBShhceQA04IbZimZpF3D/2guFQwfIFW52SMbk5dt66
g709/2iOtwcY8WgrZx0qLBh8JXLv7T6yYNHub65c25+g+aPPqPXp1dfGyRvRqptu
G1W+5nw8MBaV13GGQiLqn1FdyiGiyi3F5+dXxYru1EyMpjcdY/RJPOF6uHtahX1h
wBBd8Rbzfd5d50cezFXprjqdPXheR8mfpaFMztWyeVPl28plVIm8rNJsv6tfpdsp
jtgS2Kiu2r17JqCA1Z0CSNKRw6JZTV3dAiU4tmsVnQOxQ/4RUwNILJ5P5uAw/vNl
yv78Lhd0KApPsMh81HSJWqdkE6Cy0SFfIOQ1sxpM5nvzXvJSrJAKqgYF9rDv4yp7
Kf/xZUXUAmyxwoeZCi6OCAjPjzA7cwCX/PfjfRCZzk3+Az8TgsmSZuzDr8L7AjAd
2YIDOS8E3ZqdawjUxA6VLqtEJLvcmtYGdPLBmaHC9GEyooGGjvI=
=6pmS
-----END PGP SIGNATURE-----

--jDBhPeuoEA2UbuW9--
