From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2] fdtoverlay: Fix usage string to not mention "<type>"
Date: Sat, 18 Mar 2023 13:00:30 +1100
Message-ID: <ZBUbPlknjq8Wj0z8@yekko>
References: <20230315100819.13387-1-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2l4WsEPklm/RfTvx"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1679115774;
        bh=15kTjMG/aqj5XigN60NGMqGzddlO1CaZ30LuHr6Vl1I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RqvR3lyeH78Ra2rhn27vdeh9U4QaD5LlVCE4Mf08bK1voWSmgmZuZ70J94ivajXii
         3I72/ePASAT5welfUsNRypMvqEkSDHHsz0GiZ0AMB4MQp5242V/yzx/jWNqtZv2jmi
         pj1adaMe4cVBmH14ltLr9OrlG1fMQttiIWqUew9M=
Content-Disposition: inline
In-Reply-To: <20230315100819.13387-1-u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Jon Loeliger <loeliger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--2l4WsEPklm/RfTvx
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 15, 2023 at 11:08:19AM +0100, Uwe Kleine-K=F6nig wrote:
65;7003;1c> fdtoverlay doesn't have a -t option, so explaining the type for=
mats and
> modifier prefixes doesn't make much sense.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

Applied, thanks.

> ---
> Hello,
>=20
> (implicit) v1 was sent nearly a year ago. It wasn't picked up because it
> didn't have a Signed-off-by line for me. I didn't add it, because it
> wasn't formalized back then. This changed some time ago, so here is an
> otherwise unchanged v2.
>=20
> Best regards
> Uwe
>=20
>  fdtoverlay.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/fdtoverlay.c b/fdtoverlay.c
> index 5350af65679f..cac6b6576c28 100644
> --- a/fdtoverlay.c
> +++ b/fdtoverlay.c
> @@ -23,9 +23,7 @@
>  /* Usage related data. */
>  static const char usage_synopsis[] =3D
>  	"apply a number of overlays to a base blob\n"
> -	"	fdtoverlay <options> [<overlay.dtbo> [<overlay.dtbo>]]\n"
> -	"\n"
> -	USAGE_TYPE_MSG;
> +	"	fdtoverlay <options> [<overlay.dtbo> [<overlay.dtbo>]]";
>  static const char usage_short_opts[] =3D "i:o:v" USAGE_COMMON_SHORT_OPTS;
>  static struct option const usage_long_opts[] =3D {
>  	{"input",            required_argument, NULL, 'i'},

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--2l4WsEPklm/RfTvx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmQVGycACgkQzQJF27ox
2GcU9hAAq71b0D3kYM4dprGK5yXOyZJBEQM0kKlPY9j80KQpi4EwqSwJqm0BlQlV
JgGOLy8Hcn5woV6IaBTFShPa1BFT5kGDXqLO1FvI8B5iMiNc+hO2kiQVA8nQ+Wxv
3ckDtzTKjlXf6QXzvNv9y8jMoNHIjya8sZyCAmbdQ8FUXKLVim5O2mCQlovxltVj
yxU5zG0kWO9lYVFdx6DCZvrG83OWPEpUIg1j+v06E+7fxzEbJP/PWdjQfD8oQJU+
pJoyohOlINhzPwvRr23gcE0gAyBlM4Qm3HeWFJ/yQr5ezN5xLvCCpXDlIq6xzwVB
vbSNuwAVQYOM+3aljmAfzeOTGGCvgqdwtJ+kkrpjpYwEpyjIIVu2Juys56K0mrhe
2KfIRmejKh3Bn2w8G1yWaknI4FvqD9DmS8ZmIfv6r3dBphchKECMM6AJdcIDEmY3
P0SMyA6xWqfY/JHPn7qC2Hk4DZKz928TB5kjRPUDJKfcaygAZdlFpbV6ZDaZHoRd
BnpmvT40TXHus4BwTLL/D2UfblyguG0fQ841A+7b8AmKAkRxsUHUXqeiUAUyokPx
afRdvqz3tag7YuGeBlD+yyE9fgmJs170azUFgQ0kc8j2Enu90fcqXYryw8VlKjq5
Xw0Zkgijbay4KZDh53zucIgtNAxB/xpPHwNfwYGzeNva7aTypzg=
=CrTn
-----END PGP SIGNATURE-----

--2l4WsEPklm/RfTvx--
