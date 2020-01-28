From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v4 4/6] libfdt: Add support for disabling rollback
 handling
Date: Tue, 28 Jan 2020 19:34:47 +1100
Message-ID: <20200128083447.GJ42099@umbus.fritz.box>
References: <20191113015422.67210-1-sjg@chromium.org>
 <20191113015422.67210-5-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="r4QXMf6/kyF/FvJJ"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1580200674;
        bh=PNSw6QzBwDFSzo6AG8o8+L4BCk4BOQN9tEffSNpc9wY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AI1VvWx+ju0E9eoFf58cT679JJmRskj++Cozm7yEFFY3qMYd3EXsQmC5gt+1a0o6h
         swlXWniDkWJ2j/+DhgDPJrCDj9E2OZA38t/optoHsMkAf73NEP8dflE3nCttaS/aUW
         6c8tShPFeTRSa1qUfo7KTo0lY3coD/bwVLjgI/y4=
Content-Disposition: inline
In-Reply-To: <20191113015422.67210-5-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--r4QXMf6/kyF/FvJJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 12, 2019 at 06:54:20PM -0700, Simon Glass wrote:
> Allow enabling FDT_ASSUME_NO_ROLLBACK to disable rolling back after a
> failed operation.
>=20
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Reviewed-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

> ---
>=20
> Changes in v4: None
> Changes in v3: None
> Changes in v2: None
>=20
>  libfdt/fdt_rw.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
>=20
> diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
> index 1dd9cf0..fe61e63 100644
> --- a/libfdt/fdt_rw.c
> +++ b/libfdt/fdt_rw.c
> @@ -116,6 +116,15 @@ static int fdt_splice_string_(void *fdt, int newlen)
>  	return 0;
>  }
> =20
> +/**
> + * fdt_find_add_string_() - Find or allocate a string
> + *
> + * @fdt: pointer to the device tree to check/adjust
> + * @s: string to find/add
> + * @allocated: Set to 0 if the string was found, 1 if not found and so
> + *	allocated. Ignored if can_assume(NO_ROLLBACK)
> + * @return offset of string in the string table (whether found or added)
> + */
>  static int fdt_find_add_string_(void *fdt, const char *s, int *allocated)
>  {
>  	char *strtab =3D (char *)fdt + fdt_off_dt_strings(fdt);
> @@ -124,7 +133,8 @@ static int fdt_find_add_string_(void *fdt, const char=
 *s, int *allocated)
>  	int len =3D strlen(s) + 1;
>  	int err;
> =20
> -	*allocated =3D 0;
> +	if (!can_assume(NO_ROLLBACK))
> +		*allocated =3D 0;
> =20
>  	p =3D fdt_find_string_(strtab, fdt_size_dt_strings(fdt), s);
>  	if (p)
> @@ -136,7 +146,8 @@ static int fdt_find_add_string_(void *fdt, const char=
 *s, int *allocated)
>  	if (err)
>  		return err;
> =20
> -	*allocated =3D 1;
> +	if (!can_assume(NO_ROLLBACK))
> +		*allocated =3D 1;
> =20
>  	memcpy(new, s, len);
>  	return (new - strtab);
> @@ -210,7 +221,8 @@ static int fdt_add_property_(void *fdt, int nodeoffse=
t, const char *name,
> =20
>  	err =3D fdt_splice_struct_(fdt, *prop, 0, proplen);
>  	if (err) {
> -		if (allocated)
> +		/* Delete the string if we failed to add it */
> +		if (!can_assume(NO_ROLLBACK) && allocated)
>  			fdt_del_last_string_(fdt, name);
>  		return err;
>  	}

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--r4QXMf6/kyF/FvJJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl4v8icACgkQbDjKyiDZ
s5LM7Q/+PP1e5o0YpC3xhRb3+XXrveE0zh4SO1Ffhi5pJNX80ty5Fm8s30VhmyFQ
T/d/HqJ7rLqQXpD6j7bkzTn9manbahnizNXAy2Gmvtw929WKVZt9unyBecZhX2e8
VFG5oYhCtBoLbvgPjqvyX3cTmBJ5b9jdR1GCCcCEWRnB/mhEw3zvgnvq4sye5ODZ
no5N/lSoXHJqCFKAvD1sUhu3vDFEz/wJkuYRwIpX0r93PGroJku12OdOsNKOpj1A
JhhJ1F5KUsu4K3J+ZWb6pAFZcLsCGK27FaZ59Hcm4U49+nxxWZafAHaQZgfaV1Ii
RLV13ccNSdHKZoxNOoJBfGZOypk3OtOpvAdxHpHZiewZY/OWO9RRzE6MNy4LNaDQ
0N++xun1kS4DwXNGactdqGDlOONfVPnWHFcS7XwSW4NbRzzFvxHPjLvR/NVjZyD7
adf0o930kg1G+vJ/XRlXc29HPHX5kPhFHXBwTErswa/WQMuhj1e3INQm+vDRT7UG
MJqZ9zpNEYWIuSukTMu1RbP/ukfqjKht2/3EXyKnn7ZchO1k8d5OAZ6n/evDdYjB
PHyRMyC2NQ/wsO4Rt1+OMMYJif/NpSSS6stzMnGDbu73KSQASHpFwTJxq81Zcl9E
WLZUShsrh0q68G77Dypmr+uql+gzwsHMtDCStiPq6O/h5HXcesw=
=9cbR
-----END PGP SIGNATURE-----

--r4QXMf6/kyF/FvJJ--
