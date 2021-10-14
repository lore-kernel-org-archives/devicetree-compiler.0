From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 3/5] checks: Drop interrupt provider '#address-cells'
 check
Date: Thu, 14 Oct 2021 14:45:30 +1100
Message-ID: <YWen2uNBoJlCtAv0@yekko>
References: <20211011191245.1009682-1-robh@kernel.org>
 <20211011191245.1009682-3-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Fgc+Rq+mvu/6lW/K"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1634183456;
        bh=GT5SjvPxUisofMQ46rdMIhTO+6MVR69Nk4I+bXE3IoY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jhhh70kKQvaavSOMFUTTtWCCiOZi+FzepK8RFvEYE2NH+GIzVJpwllOjoGXMvGi4n
         z7/iNdcB9pbvd46/lw2i0/ubAeGdWocEF9AE+AdkfOirWCuU6iD2kq/u+DqrLu0yq+
         lyzt+c+eXkP3Cir8Ff3xVJWV5d1Jtu8cKZ5/iNyo=
Content-Disposition: inline
In-Reply-To: <20211011191245.1009682-3-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>


--Fgc+Rq+mvu/6lW/K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 11, 2021 at 02:12:43PM -0500, Rob Herring wrote:
> '#address-cells' is only needed when parsing 'interrupt-map' properties, =
so
> remove it from the common interrupt-provider test.
>=20
> Cc: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
> Reviewed-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Applied, thanks.

> ---
>  checks.c | 5 -----
>  1 file changed, 5 deletions(-)
>=20
> diff --git a/checks.c b/checks.c
> index a72ae4cc0be9..1a39bfd2cd94 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -1581,11 +1581,6 @@ static void check_interrupt_provider(struct check =
*c,
>  	if (!prop)
>  		FAIL(c, dti, node,
>  		     "Missing #interrupt-cells in interrupt provider");
> -
> -	prop =3D get_property(node, "#address-cells");
> -	if (!prop)
> -		FAIL(c, dti, node,
> -		     "Missing #address-cells in interrupt provider");
>  }
>  WARNING(interrupt_provider, check_interrupt_provider, NULL, &interrupts_=
extended_is_cell);
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Fgc+Rq+mvu/6lW/K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFnp9oACgkQbDjKyiDZ
s5LoURAAv4/kznKBVxMKSg6DOYTszUngZH5N8FWUf1UH5EzSUoHJ1945+Rzf82C9
KrYksHAAoAnnAz6AUqrwVm8E4kZgvIDXs8/HkFaEdkEGRRPHM7m9AQZlhev3Irmz
zzLFWumXCBj8JiBwXVMOFopG+2pBshDDl+5E+6nYEADq0c06Hhrjj9QEsKNjy/I3
6vWQFnHMm4moueXSrntFjTJ5Lfph0/LeTkbwBAUi4Jk35BQ0+dlMdR/KHNrfocXJ
NujvW+G+fLwBsA9MZ+T/E1B52QGMOpTO4+prIQl3sO4I4SeSHXs+HChMJ9+cNxOz
FBTw0u1xiFHAfG4JgZ74WSS/XN9mtoHdQFBLDw2WoOF8TsaxB6OPIKvweTna8Wai
Num4vwsm6/xcZXvbsemT0eb/rzkV9yPE4FifBJ/1uWtxFJLFLYtP3OZDn6WLbDsB
Fren/E5hxoQryYf+RRAkOxpr9bubvHzK+0lsTQ/rj0DZboz1kBmyIxjOFd37mha3
F7JidHL9WrZunTHUD9vWTZRm3R6rrdDEvwj2zMr/h9+AU9b2E0fH6+wGANofu8WL
IJCh/y1DsKnECz5uGS6h7DQLuAZ/CPh5XLJ8orxAWsRi+12vByx/7LrTAOyCmX0t
qgE61b3+xhOBVhr2LErGJCKc2P+0hbKq0IF78PDvrQmY1hFMIqU=
=nbwb
-----END PGP SIGNATURE-----

--Fgc+Rq+mvu/6lW/K--
