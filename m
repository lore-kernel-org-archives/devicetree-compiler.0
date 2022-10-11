From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/2] libfdt: add fdt_get_property_by_offset_w helper
Date: Tue, 11 Oct 2022 12:52:48 +1100
Message-ID: <Y0TMcMher9fEfCYX@yekko>
References: <20221007191116.161426-1-tadeusz.struk@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="l7UpzuZGXgjrxR+d"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1665454199;
        bh=1ZcIw4nZVrGm7vWot4iVEqPLppkI7p2/s0vukTJy5xY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HlAi8UYVHZDHpzojubuosWKjk5/b7dvsB4JHNJkFIDVYqZ0PmbtjEXDAA5BfmZM6r
         gPK7iZG8r9ujqp9W7JIzWrYWzeaAFZj5MwSRo/GjVUvyriLgskHHHB0Z7X6cavy9+W
         PYsHdT/aMBSgZgfRB1evkrBJ1g10I9Lm1QG+DkZw=
Content-Disposition: inline
In-Reply-To: <20221007191116.161426-1-tadeusz.struk-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Tadeusz Struk <tadeusz.struk-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--l7UpzuZGXgjrxR+d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 07, 2022 at 12:11:15PM -0700, Tadeusz Struk wrote:
> Add a new fdt_get_property_by_offset_w helper function.
> It is a wrapper on the fdt_get_property_by_offset() cuntion
> that returns a writable pointer to a property at a given offset.
>=20
> Signed-off-by: Tadeusz Struk <tadeusz.struk-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Sorty for the delay.  There's one nit here:

> ---
>  libfdt/libfdt.h | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> index a7f432c..cddc2d6 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -660,6 +660,13 @@ int fdt_next_property_offset(const void *fdt, int of=
fset);
>  const struct fdt_property *fdt_get_property_by_offset(const void *fdt,
>  						      int offset,
>  						      int *lenp);
> +static inline struct fdt_property *fdt_get_property_by_offset_w(const vo=
id *fdt,

This should be void *fdt, not const void *fdt: the function shouldn't
let you get a writable pointer into the fdt if you didn't have a
writable pointer to the fdt to begin with.

> +								int offset,
> +								int *lenp)
> +{
> +	return (struct fdt_property *)(uintptr_t)
> +		fdt_get_property_by_offset(fdt, offset, lenp);
> +}
> =20
>  /**
>   * fdt_get_property_namelen - find a property based on substring

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--l7UpzuZGXgjrxR+d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmNEzGkACgkQgypY4gEw
YSKX9Q//VhPEfQ2i8D44QH8cK0D6+qVwcQbofHzez6X+L6TWuy6KApcZp/moEr93
Ifd/npQhLN9Fsr9Stc8ogxg0tqIdEIc3+t8DGc8C8hrgp0NzcmqnNXjRklUrSA0A
QUMURLp31jDDEjlFYr8QklF0/Grhp9cnDWcoRZxfRp7ME+qzP0Z1G0zVxhcMiHQP
ZpP5x+x5e5tzyKLtpUKNG3ODuISjxaGAfVNyC02TNSgmpJ9LXclHesCg0WEcXR4R
Yz8s1Dn/5kXrnMx12ABRB/zhYxt4jpEj1a6QmJk7xuImXmdcF8LO7ElqItvzQfch
7WJZBUUE76WOJOC3JBOYjTsKDRAH3oYqcSqHD4u/WZN/5QNT8qPtFMp5koVXnTve
WUjP7lOKuK3J3bUBlMMjDGsQF1b+2lEzQ1S2koHqhn+P9ZgnzpVkZ/EZ0vt1mUra
2qGpSZnK82+ot5t+ukDPV8VN9jOd9zM8Fc3G3gJkYRDow+CfPjNu3RcqqL9gknGk
f9DoL1ZEXhugdhNmMsM8ZH+OWztVSlawvkkTHJcAuUgaohGHxtEorWNC6Tad5D47
13sRAXtBrwiB5odorphc9RgA8JQvI7KwiuNlTGBUDPrV40njToNpodOvS9/r162o
UmE+NEV6DNelUKqNp1NdO+NPd0arA3G+l7gtsJlwjP66WjgmmEs=
=psIz
-----END PGP SIGNATURE-----

--l7UpzuZGXgjrxR+d--
