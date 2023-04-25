From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH] dtc: Add an option to generate __local_fixups__
Date: Tue, 25 Apr 2023 12:21:20 +0200
Message-ID: <20230425102120.5yprd2vv5vmvtmos@pengutronix.de>
References: <20230424161007.104212-1-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="hw52oci2lm5wkhvh"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20230424161007.104212-1-u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--hw52oci2lm5wkhvh
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 24, 2023 at 06:10:07PM +0200, Uwe Kleine-K=F6nig wrote:
> This happens implicitly for dts files with a /plugin/ tag.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
>  Documentation/manual.txt | 5 +++++
>  dtc.c                    | 8 +++++++-
>  2 files changed, 12 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/manual.txt b/Documentation/manual.txt
> index 15a7837d3cef..94dafb8ace6b 100644
> --- a/Documentation/manual.txt
> +++ b/Documentation/manual.txt
> @@ -126,6 +126,11 @@ Options:
>  	property for each label. The property's name is the label name and the
>  	value is the path of the labeled node.
> =20
> +    -L
> +	Generates a __local_fixups__ node at the root node. For each property
> +	that contains a phandle, the __local_fixups__ node contains a property
> +	(at path __local_fixups__/$a if $a is the path of the node). It's value

I noticed before sending that I need s/It's/Its/, but only did the
change in my working copy and failed to add it to the commit.

Feel free to fixup when applying this fix, otherwise I can also send a
v2.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--hw52oci2lm5wkhvh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmRHqZ8ACgkQj4D7WH0S
/k5jXQf/VzSKuJC1z6g50w2FVpuQ7alnf6YfUnS19n0DpBCFGkbV1kQ6GfO/bruM
tEeXVharIf7zgKIjkkvInNlXVWGsdTS7l24LthFkBGpR39PweiOrkn9ISuIw4WvP
WVuVHVQLTDiE+OD7vGbLdCurhyT+GRtm19EnZLtD5rSS43koBqvnqwd2TbvL+B+J
tIhSqYqqwZSl1d20DNIL1B6N7ZFXZlpfqTeugQ/1Yi1d/+KH9NNjEhyHciVlg4NA
IqCSkC+AMMjuijMj7GzpVTeoWnuXA/HDAooM8ZsB1zXl9eI9tCkgguUbps16q3Lz
u0j08IcIPw9plVslgVLHg+BPUQVOjg==
=PJr1
-----END PGP SIGNATURE-----

--hw52oci2lm5wkhvh--
