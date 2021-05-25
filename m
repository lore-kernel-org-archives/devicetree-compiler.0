From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] pylibfdt: Rework "avoid unused variable warning" lines
Date: Tue, 25 May 2021 13:27:18 +1000
Message-ID: <YKxuloEGeFdDZCUY@yekko>
References: <20210524154910.30523-1-trini@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="GsyIkE985D/oQ+Yu"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1621914511;
        bh=GUSTWbhcF8MT6dtoxPHHmVc+1DrShwPUBY50dw1pzhg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OZVJYhN6nesZQCg/t4ZdkTwHOk4aOcmOTjhH5JIkwjAKroZArr2eIwUB/ugv5pthN
         vJydJJhyrLYQL2AT7BdROUlFf3WY7Er91yQLbOIKjf20zb3zgXIsv/r94Ebpxp0i7J
         QSu9mC/tqDKBwz3BMG5OCIO+DUr0qKxquBXldi1k=
Content-Disposition: inline
In-Reply-To: <20210524154910.30523-1-trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Jon Loeliger <loeliger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>


--GsyIkE985D/oQ+Yu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 24, 2021 at 11:49:10AM -0400, Tom Rini wrote:
> Clang has -Wself-assign enabled by default under -Wall and so when
> building with -Werror we would get an error here.  Inspired by Linux
> kernel git commit a21151b9d81a ("tools/build: tweak unused value
> workaround") make use of the fact that both Clang and GCC support
> casting to `void` as the method to note that something is intentionally
> unused.
>=20
> Signed-off-by: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>

Applied, thanks.

> ---
>  pylibfdt/libfdt.i | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> index 3e09d3a7eedc..51ee8014d17c 100644
> --- a/pylibfdt/libfdt.i
> +++ b/pylibfdt/libfdt.i
> @@ -1009,7 +1009,7 @@ typedef uint32_t fdt32_t;
>  	}
>  	$1 =3D (void *)PyByteArray_AsString($input);
>          fdt =3D $1;
> -        fdt =3D fdt; /* avoid unused variable warning */
> +        (void)fdt; /* avoid unused variable warning */
>  }
> =20
>  /* Some functions do change the device tree, so use void * */
> @@ -1020,7 +1020,7 @@ typedef uint32_t fdt32_t;
>  	}
>  	$1 =3D PyByteArray_AsString($input);
>          fdt =3D $1;
> -        fdt =3D fdt; /* avoid unused variable warning */
> +        (void)fdt; /* avoid unused variable warning */
>  }
> =20
>  /* typemap used for fdt_get_property_by_offset() */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--GsyIkE985D/oQ+Yu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCsbpQACgkQbDjKyiDZ
s5LM0A//cNM6rAYeG82EUvQuGcxudzg7So3drcqEVTDTkWyb4YLkUzKFFU+pL8Ka
oF/NJVFNj2b/0/3g4mik0cAls95dhv586aC1V3kKDYqzNUNOE9dk8dbpg3ZoQYlb
nKqOtARyNZ8OWJxVU5AvgtSjiJaShiwLyKiCpyJbVRpYJcFTgJTh6BuZbA0XUZgy
OURhspqAQq9VQvpyA7WGs26ESI54T0hcjD/MYrkibiqdaj1khRc7lgSu3bYSxNiL
fnH7U2c0h2KRQXIGatfEG6gIyOUjuh+q9dAoXb2mzxC5EtBEk6STPsMfjvkyp5SY
wlYDL64yySFH170sKVHJ/ximauu19yvcQV8ZnxFhnvyDUOJ5ChH83o4drXwbNifz
fK9LlZjopwCWE2he6S2mWKpZVSrQFnJqfGCBzc5E7Qp1AiCQ7hrzey8gkNkIxEee
v340QKe7r+wDm6h/S3Ujg8wXprAsMFyOZFeuLknSZXxQK41YvXfRlWWrFbO/B6Ly
ov+7OFsqHQ/Jw42vTdgOoWOt6ELnmGvIcjA4Wn4O6/93/82zaHhokrH5VaWGLZTl
1RWGvhhoNAt50VWu0MHRSqcoS1I1IjsJXL16CsW8sZm4+M3DHZ4cWJ2OarCwxYCV
ZCyeVuHRUVzFqz37TBUmmcFR6brMUC2kpROZGOXldmnKMj+gIoI=
=9j5B
-----END PGP SIGNATURE-----

--GsyIkE985D/oQ+Yu--
