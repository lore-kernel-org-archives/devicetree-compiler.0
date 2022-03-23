From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] fdtoverlay: Fix usage string to not mention "<type>"
Date: Wed, 23 Mar 2022 12:54:19 +1100
Message-ID: <Yjp9y6YdPbC/2QGs@yekko>
References: <20220322080859.230337-1-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7ZXv942z8Umr05zW"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1648000900;
        bh=hs458z3sAmp2L8Q2QZEGbfpeDWdyqlw8JvG52D7XoPg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pHG6/zC6Qa+tBVpjAaGtvw6IFziNTYYc0fF6AfMpLMKo758WKzRI6U/xrxX818CgA
         qXuc6Jy4iy46cMcoMD9zHzXOpOK83rgsYB5iPdDDhRqPjVT27COqrqGgTjxLwGjhRU
         OyFUGQSpfB0pKRPsIQa52t1kykQQPSglr2Qqrq0U=
Content-Disposition: inline
In-Reply-To: <20220322080859.230337-1-u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Jon Loeliger <loeliger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org


--7ZXv942z8Umr05zW
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 22, 2022 at 09:08:59AM +0100, Uwe Kleine-K=F6nig wrote:
> fdtoverlay doesn't have a -t option, so explaining the type formats and
> modifier prefixes doesn't make much sense.
> ---
> Hello,
>=20
> I was unsure if I'm supposed to add a signed-off-by line. It's not
> formalized in the git repo, so I assume it won't have any juristical
> semantic anyhow and I didn't add it.

It's true we've never formalized this, but I do generally prefer S-o-b
lines to be present.

The patch LGTM, so if you could resent with the signoff I'll apply.

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
>=20
> base-commit: c001fc01a43e7a06447c06ea3d50bd60641322b8

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--7ZXv942z8Umr05zW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmI6fcQACgkQgypY4gEw
YSKaww/+MxCOXop8s3HSfGqvzQ6ZCKikgzQfgvDpnUaPtBIaz+f4T9rt9dnmneTR
pXwrZ6i5VjqNvENsqQH3la2HmNxkT23Ta77VhKijq1CeLK8Ip6qA3qmY75SjJjc7
H4cZnPniPFh/TUNH8M6K3EIagEPvKDvQ9kUcdDbHMcroeNpDxUZi1lr3J1pAQOHW
FJ8/RzxiMkknJ4P03byQ4d3a2w6YUoLJ/iP/irOonQQaEf3CltCIlAktkoyQyBBZ
xMEKgpFOR5kp6za1OpEr3x5PQKoZPSnlT/cP5cTDzc0jNRJ44tPwR5OFtyNPQkFh
SHLdESf1/2wgUe9Qnnne5b183WuzAE62B4N//ofua3Q7Hql6G35/PwxtC0UbNkeL
FOWTrzbEwxbYVZ7dXiwYJvhNQNfw0wwtr3ObLzDqxHceF7mydOwompWm3+4GmnVp
Hc4YI7/4UmQaN8AFCOx/brCZXkO+UcVmk1IkUUyhIIbcPv46P9we/VREyBIPuXxc
Wa+bLyRSXqfM23qJBpr7hYcXXjOEWVR7E4PjGPvaLEELhV2IX7tlNUoGJYXcbnsg
NbCCsEFfFphV2/+8I8X3my4J22Tlrb9yUJBgR0ciruCjaBSLffQ1C+1aalsLJDAH
+DpYirusb5xI+c7b7trpP2ugmrtrFhUS9qpumJDKpYJnFvwSeNM=
=41Xb
-----END PGP SIGNATURE-----

--7ZXv942z8Umr05zW--
