From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] fdtoverlay: Drop a a repeated article
Date: Fri, 28 Apr 2023 17:02:00 +1000
Message-ID: <ZEtvaEgFF124Ts/x@yekko>
References: <20230424152719.96223-1-uwe@kleine-koenig.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gwDNw8UivWMS1QRW"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1682665444;
        bh=yL86NP1ErlvxRSXfOgv/TlV5CgCEnAEpsyFSpUX5eQc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Z0VLU53j4a9FV1UE2mnX2XlmevNVG4srOCYKkbCwm7yiMOmlvnctEng+70BMxAC7D
         5H1ZmzqDnSc7G5jXdlGf+M0ELYqginH+LGsqvn2EtEUISZ/+S4JD5PhB8UIw7x1fAh
         BxQa3Ne7n6c+/it4HrgeXrdBAw6nz786gnGMa7Dk=
Content-Disposition: inline
In-Reply-To: <20230424152719.96223-1-uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--gwDNw8UivWMS1QRW
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 24, 2023 at 05:27:19PM +0200, Uwe Kleine-K=F6nig wrote:
> Signed-off-by: Uwe Kleine-K=F6nig <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>

Applied, thanks.

> ---
>  fdtoverlay.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/fdtoverlay.c b/fdtoverlay.c
> index cac6b6576c28..4eba0460f240 100644
> --- a/fdtoverlay.c
> +++ b/fdtoverlay.c
> @@ -48,7 +48,7 @@ static void *apply_one(char *base, const char *overlay,=
 size_t *buf_len,
>  	int ret;
> =20
>  	/*
> -	 * We take a copies first, because a a failed apply can trash
> +	 * We take a copies first, because a failed apply can trash
>  	 * both the base blob and the overlay
>  	 */
>  	tmpo =3D xmalloc(fdt_totalsize(overlay));

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--gwDNw8UivWMS1QRW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmRLb2AACgkQzQJF27ox
2GeGkw/+IcA15Rv6nQ+RBPb090iuKpTFoUcU8DHg2yZsYR9hKvbtOju4ZWlpOMZt
CLxjbbx1Wr/bDVaGPGeMrcw0MPsoxiHk++Klw6FIoo0/oRPtDzu480F5f8mMottt
qQ/2x14LCpFGU7Th+CZBfPXR5Uf0oYs3hkK20zsuch/HNzM6r6DLoxuiw8XkwjRX
zEiIKgd7e+HDoF4PaftLYgN9MdtfZpdV7k0x9jlNZ24E7JLJii4aFa5pXNbS/1R4
tLgWL1Arwe+11K53cgXmb6yok3ZTpUHHGuMS27NEzf78ySipM/PDJg9HubqIP8tc
hqBs6IhFo0H8h3PSN+Dvp47g3uhHAA2z7NKdED6zkub+4Fyw2UDxpU6ZFQ6PqGQK
Cg7gesHjaHgl9/CjKwSzp3uQoq1N8mDVM4zBEQKYVQiYEUO0xGDIQph6O9RBcCq6
6e2UZ7L/nb3Mdclb4dnMnu7oNkfGjy+qxDPHKEz1MMMTyLkO1kL4YFjO/t4kOCs7
YhIf/iTeM9MpT6a2bRM9/3qCKSIQC7ZjSIY5HFYY99BcBXfNdzrvgYqj40X9Dc9W
/CRIMsokCmz+Nl41Q8ddyAxcspo8NdP5dT7Tekjn1P/ipVqp23aPTRjE0ml+1OFk
KScCYaVJEa0rRFP3jEy5Prb0C53wlUTDhYKQX8bLws4avVM5B3I=
=zVJP
-----END PGP SIGNATURE-----

--gwDNw8UivWMS1QRW--
