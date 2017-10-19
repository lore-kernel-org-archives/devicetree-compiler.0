From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] checks: fix handling of unresolved phandles for dts
 plugins
Date: Thu, 19 Oct 2017 12:32:58 +1100
Message-ID: <20171019013258.GS2776@umbus.fritz.box>
References: <20171018212914.13703-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="SZSwH5G1FJ2Fz+jP"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1508378432;
        bh=VZnKIghXaB65TN7h0FHyTzibreCAJ2NFIOupSs+kzvI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=k3yuagcZM5ASItBtK05SboEfoPh2EGhVN6ycEpuqjm5Xlm6aUay53fOXfwpBouoKh
         9DvWs7pSM7jbjNEJqF1B7HE6BXelln4V7ksO3x15Ygr4oGC+vcmHH5+1LW3jCKOYPR
         foYkUvcRS0nhK11OSaVIy2Wl6NbgVYzXkqa40H4Y=
Content-Disposition: inline
In-Reply-To: <20171018212914.13703-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>


--SZSwH5G1FJ2Fz+jP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 18, 2017 at 04:29:14PM -0500, Rob Herring wrote:
> In dts plugins, it is valid to have unresolved phandle values. The
> check_property_phandle_args and check_interrupts_property checks failed to
> account for this resulting in spurious warnings or asserts, respectively.
> Fix this by bailing from the checks if we're checking a dts plugin as
> there is no way to further validate the properties.
>=20
> Fixes: ee3d26f6960b ("checks: add interrupts property check")
> Fixes: b3bbac02d5e3 ("checks: add phandle with arg property checks")
> Reported-by: Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Applied, thanks.  A testcase that prevents a regression here might be
a nice follow on.

> ---
>  checks.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/checks.c b/checks.c
> index 08a3a29edae3..e66138449886 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -988,6 +988,10 @@ static void check_property_phandle_args(struct check=
 *c,
>  		 * entries when each index position has a specific definition.
>  		 */
>  		if (phandle =3D=3D 0 || phandle =3D=3D -1) {
> +			/* Give up if this is an overlay with external references */
> +			if (dti->dtsflags & DTSF_PLUGIN)
> +				break;
> +
>  			cellsize =3D 0;
>  			continue;
>  		}
> @@ -1176,6 +1180,11 @@ static void check_interrupts_property(struct check=
 *c,
>  		prop =3D get_property(parent, "interrupt-parent");
>  		if (prop) {
>  			phandle =3D propval_cell(prop);
> +			/* Give up if this is an overlay with external references */
> +			if ((phandle =3D=3D 0 || phandle =3D=3D -1) &&
> +			    (dti->dtsflags & DTSF_PLUGIN))
> +					return;
> +
>  			irq_node =3D get_node_by_phandle(root, phandle);
>  			if (!irq_node) {
>  				FAIL(c, dti, "Bad interrupt-parent phandle for %s",

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--SZSwH5G1FJ2Fz+jP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlnoAMkACgkQbDjKyiDZ
s5IDPg/+O8kF3KkvsO/vqGH+m2njOR9UBcjp4ZdVGXR/brJOZomqEOfEC+9nPkg6
aa0N0TU8QgoYafL6+AwcFN/4JAN0yXxcI0AG9Lxgop3zEf0UQ51AS2Dpcm/GpJ4f
p6OU7OFEFuTR+WmSW/AsfZ7vlD13dj0ZDdZ+wPet6S9NH0Fvm7HucenMWrYdy1b0
Hcv+QUbRkYykJmnPyZh/yeXRQaiz5aQ/rFz3VbMjMoTqz2UTglN1UOhDKDi08RSM
HioIPwp3550b/Uu9pejodcsz1XAL4N0xo66H6A4EsxY/h4LS3k59qXcrhV5W9GwH
uEOUw6JpF3epOtv06vMegPsp+MXTBbDywky1kU9RffCP7IxDTYlxw6lXFgej4ciU
Slf8etd7GZohZyyEGONDuyLsDk2FVKhFWkz7IRtgKaT5YodrXwcgmP0a9/3kniVl
GHMWIu0ehGsj8OkOWS7XsT2+3nhLWZmuuiPsfP54FKV+OJkRn6uoFB+xeWAN3Fxu
cYVSG462iz7R8vjH1dskZIgUle2G/aBE9hAxMvNKM90r1z7W5TdpYA5uDYzmypu8
sAC6UBj7+05TcNpscHmZNydpHQsKWyfeLk1CBQ9ZEO2OYwht0icn7ROu2UsLFTW9
GWet31LIMvviXcTN1iOMD4LJDYvnTUyPWRcT+0TzW+NHEbaxgTw=
=7mgM
-----END PGP SIGNATURE-----

--SZSwH5G1FJ2Fz+jP--
