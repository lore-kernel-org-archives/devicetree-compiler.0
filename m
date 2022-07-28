From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 4/4] Add description of Signed-off-by lines
Date: Thu, 28 Jul 2022 18:08:00 +0200
Message-ID: <20220728160800.xiexlk52grqxre3j@pengutronix.de>
References: <20220728075348.174412-1-david@gibson.dropbear.id.au>
 <20220728075348.174412-5-david@gibson.dropbear.id.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="tqqhu4vd3ji3ko53"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20220728075348.174412-5-david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, loeliger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org


--tqqhu4vd3ji3ko53
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 28, 2022 at 05:53:48PM +1000, David Gibson wrote:
> dtc and libfdt have been using Signed-off-by lines (as used in the Linux
> kernel) for some time, like a lot of open source projects.  However
> Uwe Kleine-K=F6nig pointed out we never really stated what they mean in o=
ur
> context.
>=20
> Add information on what the S-o-b line means in CONTRIBUTING.md - this is
> essentially a quote of the same information from the kernel documentation,
> with some tweaks to make sense in the new context.
>=20
> Suggested-by: Uwe Kleine-K=F6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

Looks good, thanks.

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

Will resend the patch that triggered that discussion with an S-o-b line
soon.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--tqqhu4vd3ji3ko53
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmLitF4ACgkQwfwUeK3K
7Ak38wf/YZxABsaebZouCj3an3tBjf8fh0qq5h2qeybX/+daVXCQUQxkiN3YkN8S
AGDH2zC8qUQ3EQBomHNMYPej6ctlzYZg0/EUKFcDlWIuJBhqPfswQzEGfs6bzMQN
QVSz5XawtngsuxpT9J2gMR4xFp4dqVHhTR9dw2R9a0co96E653zrE7uCvVTTohhm
csajaXE8QJo4Rf5JjR7cLiTD8ixHy42bUi0Qb5wncwEKvY/AQU3SSH6g9ZEm1hNq
RSEa4dLAdSbWPeSEUGAFBkr45YXaYJktf13/K7lyNBtk96k3hdLymNblHV+Br0cM
GjERe/DISAvBGUHLv+81q+8i3KcYuw==
=77dG
-----END PGP SIGNATURE-----

--tqqhu4vd3ji3ko53--
