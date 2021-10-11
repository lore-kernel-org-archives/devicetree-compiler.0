From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 3/3] checks: Ensure '#interrupt-cells' only exists in
 interrupt providers
Date: Mon, 11 Oct 2021 15:58:31 +1100
Message-ID: <YWPEdyyMqckAi/ze@yekko>
References: <20210928212335.2061125-1-robh@kernel.org>
 <20210928212335.2061125-3-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="RbkOA37m1lh/gNsa"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1633928318;
        bh=l1G8JIJsaQY6QdR/H59xD8vYYZ4HAP1QJb3nP5aweuQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Kdoq65Yacn8cp5j4sO9448HUPHKFBUXeZcMF+IlCpgQhwrdkGqO/JgpnMoUssSTvT
         AiMLBFd4Ol4BNrv/EyeJkJ5HO1kl86QBygEYv0XTjb2MJgqFQc0O48cItF6UFRMGsZ
         N4T++57lw/d7bn2z2XWkygwpOReerEXtNELCXsm4=
Content-Disposition: inline
In-Reply-To: <20210928212335.2061125-3-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>


--RbkOA37m1lh/gNsa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 28, 2021 at 04:23:35PM -0500, Rob Herring wrote:
> The interrupt provider check currently checks if an interrupt provider
> has #interrupt-cells, but not whether #interrupt-cells is present
> outside of interrupt-providers. Rework the check to cover the latter
> case.
>=20
> Cc: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Reviewed-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>


> ---
>  checks.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>=20
> diff --git a/checks.c b/checks.c
> index 2efa36377e80..7f769e92ef71 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -1573,14 +1573,20 @@ static void check_interrupt_provider(struct check=
 *c,
>  				     struct node *node)
>  {
>  	struct property *prop;
> +	bool irq_provider =3D node_is_interrupt_provider(node);
> =20
> -	if (!node_is_interrupt_provider(node))
> +	prop =3D get_property(node, "#interrupt-cells");
> +	if (irq_provider && !prop) {
> +		FAIL(c, dti, node,
> +		     "Missing '#interrupt-cells' in interrupt-controller");
>  		return;
> +	}
> =20
> -	prop =3D get_property(node, "#interrupt-cells");
> -	if (!prop)
> +	if (!irq_provider && prop) {
>  		FAIL(c, dti, node,
> -		     "Missing #interrupt-cells in interrupt provider");
> +		     "'#interrupt-cells' found, but node is not an interrupt provider"=
);
> +		return;
> +	}
>  }
>  WARNING(interrupt_provider, check_interrupt_provider, NULL);
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--RbkOA37m1lh/gNsa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFjxHYACgkQbDjKyiDZ
s5LkZg/9EwW94A6fY3SNBpJl8UUtvm5usQIK5Tnm9L0FJGtgTyu2cxqI2dVqzwf6
Z9C61PUQCDXHSY30Fxx3LwHIFQrcScQOS3/AQXCHflArtL6ciqux0YBAANa92t0C
iPj+avgI14IoR0Y19uAqyA2zol8NT0MFJLldfi/7LKuwyCqgfplz40VqBwXVzTSB
MCR68Mx84C5e3U/W8CUK7o0LgjgZAPlPhz1bx12+w3QXi8+oNNSReugxKM3p+ESY
ESWGcc/nf0Z355BDag4Rhfxw1k2/y7gjPgZYS3uD3WI9RiIRobKUy1AC1aZ0RCiC
un6r0i5fP4bAxhVcN5rKNma9J6e/zrslrrMDSZfyIZ2HPAhYeFKWNi4vem7CX2w4
1iHfVtpQDl0mGJeHZdA6IpB1vVop0tkLZ9hGJFRoXWkTHV0vgLVdiZQ2j6+CjQFf
xX7bJHFj+SULIL4l6cfjrBGT7f1xbJbw5Lz1kZtii4tgzliMqrRceHLLULVomKaE
XTjMvaCErzIEtGFX4J7PjEhiFUIrUM0pdMOPq5cbMpNPpfbTxxAPgYCVQxLlC/qi
yhxCMauXFPwen0EVNc9dVx4r3/CCOpMlz2N3zrvDj43lB1cmEewvoiFeFp5OYix1
FJwdP8ZsueLzXs6TC6kSHbhQnMjJYuz9Py3dUBs6d7mKkV90ROk=
=cx0U
-----END PGP SIGNATURE-----

--RbkOA37m1lh/gNsa--
