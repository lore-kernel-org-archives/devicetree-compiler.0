From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] write_propval_string: Use a list of strings instead of
 "\0" in a string
Date: Fri, 28 Apr 2023 15:48:21 +1000
Message-ID: <ZEteJWKnCEpdjVa1@yekko>
References: <20230426182405.572729-1-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="WJ1oaF28boaEzsmD"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1682664657;
        bh=NYKjvHrgvQEJXEVVIifFcHGhV0l+4hosb/55aRAmJ68=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YP7OjAZtWwZGx9VWtb7FmYdP58Llyy+viJPM7aRNfa8SbGO77kVJqN8cYOT8CcKWC
         sm1pHVLAPbuhuicuObh/w2mpQsskL5a6Xwp/AoYD2+Iq7A4RHfTJCK7MKLoSsHfFvV
         S982hiz79OAr6V10N4y1rNAFaVVeQYJXlaNsIn5s=
Content-Disposition: inline
In-Reply-To: <20230426182405.572729-1-u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--WJ1oaF28boaEzsmD
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 26, 2023 at 08:24:05PM +0200, Uwe Kleine-K=F6nig wrote:
> A string that contains '\0' can be written as a list of strings e.g.
>=20
> 	clock-names =3D "di0_pll\0di1_pll\0di0_sel\0di1_sel\0di2_sel\0di3_sel\0d=
i0\0di1";
>=20
> is equivalent to
>=20
> 	clock-names =3D "di0_pll", "di1_pll", "di0_sel", "di1_sel", "di2_sel", "=
di3_sel", "di0", "di1";
>=20
> The latter is easier to read, to use this format instead.

I agree, however this breaks the type-preservation.dts test, so that
will need to be corrected to match.

>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
>  treesource.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/treesource.c b/treesource.c
> index 33fedee82d58..de30188189fb 100644
> --- a/treesource.c
> +++ b/treesource.c
> @@ -87,7 +87,7 @@ static void write_propval_string(FILE *f, const char *s=
, size_t len)
>  			fprintf(f, "\\\"");
>  			break;
>  		case '\0':
> -			fprintf(f, "\\0");
> +			fprintf(f, "\", \"");
>  			break;
>  		default:
>  			if (isprint((unsigned char)c))

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--WJ1oaF28boaEzsmD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmRLXecACgkQzQJF27ox
2GenXA/7BzfbJQlkDPSQ+ALCKj9TKwwfiP68BS2jTGS+Qd31xbWeZKob6vdzHkVv
Hb6labD+k0RBEWzS33SQ8lRbf47qZksLcztgWZNQotmh1NeNSAUrHrtf2Jd3TXbo
0UhnrjO929VuxXWQvK+SvWKL+Nr8DstVk+P5wLxMwpF6GnZi8IhzMXjo3p2RvWv3
UtWqNG2rykKmZNnJVULf7K4GHrJtTYiaWw75yh3mZYOcYTVrXPdr1amfx+Eqyme9
TENwq71gUTz/T8b5Kd2wlMZUHD/1OjDOcFkRiF+SEyUyNSpCzfNtLPHoe0VvJkJh
/cQDuvbEFOK2ofRtXHLGqqmx72krMcj/4rnjfT/tmV7058Li8x54MJzUbkB5GiJt
PZTBeSD6L7B6Gp/l76Vc+rZoBadUmtxZax4gac6G+qZX6UYYU5D9mAV30VCU1CTu
cGgoN/Bl4BlCAS/WWPQ6e0VWI4xEMSkdHdG60ASArBsN4SdQaViQgVxuGoLbQ+9v
aZipP96ZZ7OpMs8eCoHL3aJRgU5BEzZXvDhaNFvnAtIb3IWBfOYuPaM2fbEmPdvZ
5WYc1pEWQZNM/vmH8EnzRjhhIfbg2DVZ8lWYyujpXYe+86enCqnI2aNtpREfsR9s
k+IBCjlKXyfPthq1/jr9Wo/MQ+x+cUXSNRz75P09emeDnvj7mY0=
=RzR5
-----END PGP SIGNATURE-----

--WJ1oaF28boaEzsmD--
