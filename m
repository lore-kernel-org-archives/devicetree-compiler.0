From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v3] dtc: Add an option to generate __local_fixups__ and
 __fixups__
Date: Sat, 27 May 2023 11:54:53 +1000
Message-ID: <ZHFi7X09bHW4Wts/@yekko>
References: <20230523080941.419330-1-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="k5K6gWBxXS58x1nz"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1685152504;
        bh=TJ+IPD9aHrxfElVBbLlnkxkoCzKonIfWznRPOvcvW9w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fQBJ8EnY7x396K7YyfG3uymrTNDmJB/FHsOd2fftQWYGmUfHnIwBECECDQAKN9Ahc
         o9B8hIkO3+I46J31XbZrO91VjL80cC69L+jPwyq0W8W+QZCDxTJqC24OcQ/gXFODIR
         zRrTNIVpUSiXiMPotf5u8Tp3ZmxMQBFj4D/D8kn4=
Content-Disposition: inline
In-Reply-To: <20230523080941.419330-1-u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, entwicklung-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org


--k5K6gWBxXS58x1nz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 23, 2023 at 10:09:41AM +0200, Uwe Kleine-K=F6nig wrote:
> This records detailed usage of labels in a dtb. This is needed in
> overlays (and enabled implicitly for these). For ordinary device trees
> it can be used to restore labels when compiling back to dts format.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

Applied, thanks.

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

--k5K6gWBxXS58x1nz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmRxYuMACgkQzQJF27ox
2Gc3WBAAldZZIsQapXIzfyrwqhxAqzvTrOJqImSVnL46xY8S8fc8EGumqfiZCaZw
NebEmRsBRNQbjfvoNwJhopilJcvPJqFGcuxj2YOcweKuofCO4lRr5gLqR317Iq/R
gpiuMnoj1IP8LtORY+EabuBZVHZjeYnnyeUBmfISf1oaoLbaXPL8Dv9bkBNrFWp4
j3f7t0DkSVvqSl+iLZ/lkDckvsifAr+DwYFL0ORXbTGrQ6N0Y0Sx6LOcgtmcaIP3
Hh073xiCCx5Czb9SSdpsqcZMilj2+E4x7bK2eypwrOoc+EGOhPGCUApg43PAzlKN
g/cw1eu/3+WVQKOjE6Gvv0XQt5fwRTm8Qr3ChVA4X0aSKBz0xBgSLZgoWYD4AIKK
WlC1Lc2VuLmY36Wi7UuWpZquikCgomutbmO85ZIEHtoiCnp2GpksKne6QfdgYzQG
z5YTH/9GVPYpptYEl+rZnK46R5Tcb8Z/g0ldbHjoZVebSt7TzVdgxPPjFkUVt2XJ
3b7CbXOiWGOq3ePC20TtwPH9lO9VzbrDh2NFoQBdgGV4uBSajjBwm0JlmNUYbf5F
sbrnA1qDw4tPoOCRLt33482ymIQ8OBecK3i8WytnXTssbKz1fRn571LnTGzikC3v
i88GAH5j2AdFYCM0EBHfS6CNqAiC06KRrzlK86b0GaWU2O7I0UM=
=o0Fs
-----END PGP SIGNATURE-----

--k5K6gWBxXS58x1nz--
