From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] libfdt: Don't mask fdt_get_name() returned error
Date: Sat, 30 Jul 2022 13:52:47 +1000
Message-ID: <YuSrD4FbB4EfJUCM@yekko>
References: <20220729130019.804288-1-ptosi@google.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="1UG4GqUuCjkqGffQ"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1659155696;
        bh=ihSTUliYFEf6xrDnH7Un6dOrcFq5aSmFe13ccIFkBrw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CsypltPRRPosRMIOzj5A0u2VqCHnKWWfbjyloW70vMS5JkJ4/10GsDpQpDR6eoLmU
         M9aK1Y4SpGXLx8i16yRhj6kvRHiKNjdAYdXlRIcyNxaAzLSHTjYQqs7i9XI+/aMQm/
         yVZ6ScnJVF0gjKeLHJaMmMZNqsKyVD73Kl/Ux6Ts=
Content-Disposition: inline
In-Reply-To: <20220729130019.804288-1-ptosi-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: =?iso-8859-1?Q?Pierre-Cl=E9ment?= Tosi <ptosi-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike McTernan <mikemcternan-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>


--1UG4GqUuCjkqGffQ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 29, 2022 at 02:00:19PM +0100, Pierre-Cl=E9ment Tosi wrote:
> Return the error code from fdt_get_name() (contained in len when the
> result is NULL) instead of masking it with FDT_ERR_BADSTRUCTURE.
>=20
> Fixes: fda71da26e7f ("libfdt: Handle failed get_name() on BEGIN_NODE")
> Reported-by: Mike McTernan <mikemcternan-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Pierre-Cl=E9ment Tosi <ptosi-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>

Applied, thanks.

> ---
>  libfdt/fdt_check.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/libfdt/fdt_check.c b/libfdt/fdt_check.c
> index 71390ee..a21ebbc 100644
> --- a/libfdt/fdt_check.c
> +++ b/libfdt/fdt_check.c
> @@ -66,7 +66,10 @@ int fdt_check_full(const void *fdt, size_t bufsize)
>  				int len;
> =20
>  				name =3D fdt_get_name(fdt, offset, &len);
> -				if (!name || *name || len)
> +				if (!name)
> +					return len;
> +
> +				if (*name || len)
>  					return -FDT_ERR_BADSTRUCTURE;
>  			}
>  			break;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--1UG4GqUuCjkqGffQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmLkqwkACgkQgypY4gEw
YSJuPhAApmgW/T6eboWGzmG5iOeBOBZq43cG4bi3RP6yeo/3Bcuqxkp1zMBDTAy1
0rwBCoWkNhevZRD9ihfcJH6lNbBoUAIkTk9kvgiE7XJsKycWe4mdFAe/4HXCTedh
SHi9COQO9T1RCMzkHCOxAnWxpoV2NH4n0u6zSvPoWrwOK3JAwtdNccvH6mQRh/1c
dgJLU8uwlxaaorCTKQTRJ9RlcAdXcDd01Ig8lXbRnxpZaHDEnKh8Zqlt1P3FhMdZ
vPKQfY1Po1tJYI8w4r0AOwavuh1VuGNQJTcOPFA9VvtvFqFxU7qjH5nDdfKIMddT
3cF5L2eI1nxXhjNdoHRyYt0RCmvPIEIX1X++UhS6FR5I6Mqf96lFRvVgt7YGefC2
DmA/exv6bPI1q3akOonXhPJImywAK/HcxerG4H6fZGnqj0OnC01qA9hhu4qSPr5l
q5p369LeEhFGrEmtIXGjc2eHyny3Fj61blPdqIszsqS7IlKr7BraVDCxQrG4dGkQ
LfSk5hSo8iT+5YA+e/zaQd/Lc/TXDZLHeKq7BfPHwTAMu3H7bSDR3jtxQPdXpFnn
ltId87UIM9Wyp+8HNu4W4XHkW8ynFaMJtRVJgjd39Vy33zXZRq67zeeeX9BNV7kb
6PAjdtrwm86CDgss4I+oGbHiUJRxtGvmwFDMPup3Zf4llklhFRc=
=0eSG
-----END PGP SIGNATURE-----

--1UG4GqUuCjkqGffQ--
