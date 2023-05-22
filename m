From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2] dtc: Add an option to generate __local_fixups__ and
 __fixups__
Date: Mon, 22 May 2023 19:06:16 +1000
Message-ID: <ZGswiPv/CAl/Z4EH@yekko>
References: <20230522081629.385489-1-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ryl9qdi6zppKKQjx"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1684747774;
        bh=DxqiWR3lBfZXaHl0OA0x7VpcjMAk+cFFcgaJmZ8Gq+0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=St5U130CX0nRieZetxseCaoz49QvWeYObBgVeBijPk1mBdG+1r2Ysl9KKGs2fkF2P
         vgXFc67urw77Syh1OblnnC2GkWUBIVP1pPJuWY3mZnJZD/LwU6tGvpl3w/aDl9l8Wd
         huuXaOz30hsbnZ5zcUPGjv6Q3BUD+CeynIEMds2M=
Content-Disposition: inline
In-Reply-To: <20230522081629.385489-1-u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, entwicklung-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org


--ryl9qdi6zppKKQjx
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 22, 2023 at 10:16:29AM +0200, Uwe Kleine-K=F6nig wrote:
> This happens implicitly for dts files with a /plugin/ tag.

Remind me what the use case for this is?

>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
>  Documentation/manual.txt | 14 ++++++++++++++
>  dtc.c                    |  8 +++++++-
>  2 files changed, 21 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/manual.txt b/Documentation/manual.txt
> index 15a7837d3cef..598c6e694c55 100644
> --- a/Documentation/manual.txt
> +++ b/Documentation/manual.txt
> @@ -126,6 +126,20 @@ Options:
>  	property for each label. The property's name is the label name and the
>  	value is the path of the labeled node.
> =20
> +    -L
> +	Possibly generates a __local_fixups__ and a __fixups__ node at the root=
 node.
> +	For each property that contains a phandle reference using a locally
> +	defined phandle, the __local_fixups__ node contains a property (at path
> +	/__local_fixups__/$a if $a is the path of the node). Its value is a list
> +	of offsets that are phandle values. If there are no such properties, no
> +	__local_fixups__ node is generated.
> +	For each undefined label used in at least one reference, the __fixups__
> +	node contains a property. Its name is the label name, its value is a
> +	list of locations where the label is used in a reference in the format
> +	"path:property:offset". If there is no undefined label, no __fixups__
> +	nodes is generated.
> +	Enabled by default for compiling overlays (i.e. dts files with a
> +	/plugin/ tag).
> =20
>      -A
>  	Generate automatically aliases for all node labels. This is similar to
> diff --git a/dtc.c b/dtc.c
> index bc786c543b7e..d2e4e2b55b5c 100644
> --- a/dtc.c
> +++ b/dtc.c
> @@ -47,7 +47,7 @@ static void fill_fullpaths(struct node *tree, const cha=
r *prefix)
> =20
>  /* Usage related data. */
>  static const char usage_synopsis[] =3D "dtc [options] <input file>";
> -static const char usage_short_opts[] =3D "qI:O:o:V:d:R:S:p:a:fb:i:H:sW:E=
:@AThv";
> +static const char usage_short_opts[] =3D "qI:O:o:V:d:R:S:p:a:fb:i:H:sW:E=
:@LAThv";
>  static struct option const usage_long_opts[] =3D {
>  	{"quiet",            no_argument, NULL, 'q'},
>  	{"in-format",         a_argument, NULL, 'I'},
> @@ -67,6 +67,7 @@ static struct option const usage_long_opts[] =3D {
>  	{"warning",           a_argument, NULL, 'W'},
>  	{"error",             a_argument, NULL, 'E'},
>  	{"symbols",	     no_argument, NULL, '@'},
> +	{"local-fixups",     no_argument, NULL, 'L'},
>  	{"auto-alias",       no_argument, NULL, 'A'},
>  	{"annotate",         no_argument, NULL, 'T'},
>  	{"help",             no_argument, NULL, 'h'},
> @@ -252,6 +253,11 @@ int main(int argc, char *argv[])
>  		case '@':
>  			generate_symbols =3D 1;
>  			break;
> +
> +		case 'L':
> +			generate_fixups =3D 1;
> +			break;
> +
>  		case 'A':
>  			auto_label_aliases =3D 1;
>  			break;
>=20
> base-commit: 3b02a94b486f998aa22d898b427820a805d0904f

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ryl9qdi6zppKKQjx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmRrMIEACgkQzQJF27ox
2GdnyRAAkKQlJO4ZE3xEADBWzXnW7IrVJ8a5SCOd/AU9Hk3VC661CHxohYSBTzlt
TQykYH6vv1hH27W4jfiurpkLqk/lZWO6mFjmaS3heyhtB9G+wm0KdTTXouHA3uIr
nQEPoKbKfEsXpZtabP+87bAjy7TSxxyzrc6XBr7KSqHOvG9UFiapmt0GGR2uKmk6
sOYiOPlNBIcOdNam5974ourGrhHuvG2m0VMOTiGNztljdk7ATznWPlmFx23v0JVd
zYZU0ztnorVC97UAfAjoE6IrEBKlRus1ZsXD0HpQQ6OhSJZ1C5TiFiAKl8X+oOKS
lVWgLiJCKB+G6wyNp2/b9l8MpsOO4lWBCTFtXh7cAomTR+xKtJe1vW6t74J4+Ulf
mCJop7DukEqs2Kba043OlfvzFunNOVXG/HDBBNd3wruZ6MSanOC13JqDhxYN6ww5
oN++TWIPl8fDHHSpleHWK/QSv0B/oRIq9bWvMsLvGcKuQ7MPinSSrZ1E/MsHiIY3
GOSdayMTYihTIm+uc15/T7c5I0JEMk56eWdN0Wlm8wkm240zhl42NUOP/jV76t33
8NGgY1ZJKXHjPRg3zC+SVjmyakYPqjwapcVF2IYWg5wx/lu8u1HXX/Td7senOko/
ojLfmIphcMzPEuLAMQHWuGG6SJGoTO+Tk3RRhO2urthBP1U6aYY=
=5Wkd
-----END PGP SIGNATURE-----

--ryl9qdi6zppKKQjx--
