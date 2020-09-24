From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 08/14] libfdt: fdt_create_with_flags(): Fix comparison
 warning
Date: Thu, 24 Sep 2020 14:34:47 +1000
Message-ID: <20200924043447.GN2298@yekko.fritz.box>
References: <20200921165303.9115-1-andre.przywara@arm.com>
 <20200921165303.9115-9-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="VnOTrGv5LmZxna7m"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1600922531;
        bh=vPhMy9LtsjRP2C56kO59YwKw8OzhiK5+k96Q+YjcXKU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VztZ+Sta+4XRwQHo2kUz7u/OmuIRbxtU8Rc6+PG+UN5L6dKj4YcX2NXMbybLL20y3
         D9nXkPqtzDE9I2ANr4rYTvyW39EqQXNwrDGpsd5501pP3zT66q53DOl9D24U0rGxYL
         lbSh1jI5xse2s6Yvx6hh6asjV5fnqpuX4Ghs8J1U=
Content-Disposition: inline
In-Reply-To: <20200921165303.9115-9-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>


--VnOTrGv5LmZxna7m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2020 at 05:52:57PM +0100, Andre Przywara wrote:
> With -Wsign-compare, compilers warn about a mismatching signedness
> in a comparison in fdt_create_with_flags().
>=20
> We have just established that bufsize is not negative, so a cast to an
> unsigned type is safe.
>=20
> Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>

This looks correct, but I think we might be able to do it a bit more
neatly by changing the type of hdrsize to signed instead.  It's a
small value, so we know that's a valid conversion, and that would let
your two tests be merged into one here.

> ---
>  libfdt/fdt_sw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/libfdt/fdt_sw.c b/libfdt/fdt_sw.c
> index d65e9c8..8a76adf 100644
> --- a/libfdt/fdt_sw.c
> +++ b/libfdt/fdt_sw.c
> @@ -112,7 +112,7 @@ int fdt_create_with_flags(void *buf, int bufsize, uin=
t32_t flags)
>  					 sizeof(struct fdt_reserve_entry));
>  	void *fdt =3D buf;
> =20
> -	if (bufsize < hdrsize)
> +	if (bufsize < 0 || (unsigned)bufsize < hdrsize)
>  		return -FDT_ERR_NOSPACE;
> =20
>  	if (flags & ~FDT_CREATE_FLAGS_ALL)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--VnOTrGv5LmZxna7m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl9sIeUACgkQbDjKyiDZ
s5Im6g//ekaH3hXAWnTdDLxCTyLg4qzZVY9G1katpfMBbxbryuakU7f7rLSV6S/B
tQp9gqkC+A/oPNZbeBskUlzEp5bf5J8isJ3sMyCYpxdEQUlYb6wq+UpppX/kzJm4
cShUUhyEY9Bqkbd/bv3OembhuH0zYGEUlk4KZn3iLn6Sx66wtcp95EF5gF+B/uvb
IuOO0R9gy16Ed2+vF9nhO5XziKDts34LWs3ZGkn2eWYwdkPWhUg3ts8Nb2BLQFnp
qshgfwXDwNANL0dqBg46Ga/MK0Kb4jTtBmfAUgjzUkdg10nyXxaHLqAAyuA4gbwv
qmUWHbmIWB2Ih2234uIncEpLqqk63R+6fDSTfAzsofzsS2JJHwSw48Y1Ladw/Xba
FQVK25uUY5b4nXpYm7NQdJ0aCks1WuqUvxKr/Oc8qc97gXgc9OXj3/l6uqdFySIc
Dd+vRP+dNQcnt+AdT8ID3F0pl67yOq0zgx47DwYnBMFWFhCSFwopN1L7/zO7owoM
V/EtJEaL+P6L6EpKZsnuf+kMDWN2RHg6dxdjJ7xL7uL278mDLgAOnkr7A369qI9G
X2kk8qgxuym51FIFnIwPcsOeOGDQSd+6M7aRpxQtWGCh38jCYdSN8wzmhIrnqXFa
CkzFFpWyQu+XkcdssWPAWWApq7eyh45dKyw+l5ZE6Y6oTD2u92M=
=zTfu
-----END PGP SIGNATURE-----

--VnOTrGv5LmZxna7m--
