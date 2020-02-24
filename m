From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v7 3/8] libfdt: Add support for disabling dtb checks
Date: Mon, 24 Feb 2020 16:56:28 +1100
Message-ID: <20200224055628.GI1751@umbus.fritz.box>
References: <20200220214557.176528-1-sjg@chromium.org>
 <20200220214557.176528-4-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="smOfPzt+Qjm5bNGJ"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1582526632;
        bh=mFDgm/7uwkKNAi7RpXicoRzGmAshKO+YxiXwUMiX30A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iV8b/Lj7pXAyVZ5j8Aacjzsmj8IFLJe7jAE7JT7DfQHLVsnN+aUWQUSNvcesTx74Q
         z8VGq5U/9YyBuwitCwOgCUohWvhuudByRYnlabmR2lKZr/oLJF1L1BFkK24UzbIIv8
         A6VuBPZMHZklGHVS0tmIYeqfmFexbynFTOY5wvPY=
Content-Disposition: inline
In-Reply-To: <20200220214557.176528-4-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--smOfPzt+Qjm5bNGJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2020 at 02:45:52PM -0700, Simon Glass wrote:
> Support ASSUME_VALID_DTB to disable some sanity checks
>=20
> If we assume that the DTB itself is valid then we can skip some checks and
> save code space. Add various conditions to handle this.
>=20
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

A couple of things to fix in followup:
> diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> index a5c2797..4c26fbe 100644
> --- a/libfdt/fdt_ro.c
> +++ b/libfdt/fdt_ro.c
> @@ -388,7 +388,8 @@ static const struct fdt_property *fdt_get_property_na=
melen_(const void *fdt,
>  	     (offset =3D fdt_next_property_offset(fdt, offset))) {
>  		const struct fdt_property *prop;
> =20
> -		if (!(prop =3D fdt_get_property_by_offset_(fdt, offset, lenp))) {
> +		prop =3D fdt_get_property_by_offset_(fdt, offset, lenp);
> +		if (!can_assume(VALID_DTB) && !prop) {

Again, eliding checks that lead to FDT_ERR_INTERNAL could be split
out.  Basically if they ever trip, we already have a libfdt bug.

We could maybe gate them under #ifndef NDEBUG, since they are
effectively assert()s?

>  			offset =3D -FDT_ERR_INTERNAL;
>  			break;
>  		}
> diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
> index 8795947..707c00a 100644
> --- a/libfdt/fdt_rw.c
> +++ b/libfdt/fdt_rw.c
> @@ -24,6 +24,8 @@ static int fdt_blocks_misordered_(const void *fdt,
> =20
>  static int fdt_rw_probe_(void *fdt)
>  {
> +	if (can_assume(VALID_DTB))
> +		return 0;
>  	FDT_RO_PROBE(fdt);
> =20
>  	if (fdt_version(fdt) < 17)
> diff --git a/libfdt/fdt_sw.c b/libfdt/fdt_sw.c
> index 76bea22..352193c 100644
> --- a/libfdt/fdt_sw.c
> +++ b/libfdt/fdt_sw.c
> @@ -12,10 +12,13 @@
> =20
>  static int fdt_sw_probe_(void *fdt)
>  {
> -	if (fdt_magic(fdt) =3D=3D FDT_MAGIC)
> -		return -FDT_ERR_BADSTATE;
> -	else if (fdt_magic(fdt) !=3D FDT_SW_MAGIC)
> -		return -FDT_ERR_BADMAGIC;
> +	if (!can_assume(VALID_DTB)) {
> +		if (fdt_magic(fdt) =3D=3D FDT_MAGIC)
> +			return -FDT_ERR_BADSTATE;
> +		else if (fdt_magic(fdt) !=3D FDT_SW_MAGIC)
> +			return -FDT_ERR_BADMAGIC;
> +	}
> +
>  	return 0;
>  }
> =20
> @@ -38,7 +41,7 @@ static int fdt_sw_probe_memrsv_(void *fdt)
>  	if (err)
>  		return err;
> =20
> -	if (fdt_off_dt_strings(fdt) !=3D 0)
> +	if (!can_assume(VALID_DTB) && fdt_off_dt_strings(fdt) !=3D 0)
>  		return -FDT_ERR_BADSTATE;

Hrm.  I think checks leading to FDT_ERR_BADSTATE should be moved under
VALID_INPUT rather than VALID_DTB.  They're generally about using the
fdt_sw functions in the wrong order, so they're not really about the
initial dtb input we're working with.  In fact with the sw functions,
there *isn't* an initial dt, since they're about building one from
scratch.

They're about "input" in the sense that they're about how the library
is invoked during an indivudual "session".

>  	return 0;
>  }
> @@ -151,7 +154,8 @@ int fdt_resize(void *fdt, void *buf, int bufsize)
>  	headsize =3D fdt_off_dt_struct(fdt) + fdt_size_dt_struct(fdt);
>  	tailsize =3D fdt_size_dt_strings(fdt);
> =20
> -	if ((headsize + tailsize) > fdt_totalsize(fdt))
> +	if (!can_assume(VALID_DTB) &&
> +	    headsize + tailsize > fdt_totalsize(fdt))
>  		return -FDT_ERR_INTERNAL;
> =20
>  	if ((headsize + tailsize) > bufsize)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--smOfPzt+Qjm5bNGJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl5TZYwACgkQbDjKyiDZ
s5KQ1xAA4YlsfDQg75a/y8T+0Sv5I0lhN0jvZ+pykOI791f7hDlFUeyoAk7WfDgp
xaNgvWYCKAqb9d/JPkB+tCZraMAcdQqPDeKBIMC8GHmJz/Jy+hG/2N8MIrE4GIWP
20xU3wNqAdr+9rs2Tb53hj310z6+NR49rKk3A60HrnZtvA1qO0IceC3ZNbYqj/+H
N15j1bmd4SPJHcrGAZtb3+qauRS7nRrndBuXNXbxSYWMiZjbakF1Ode2nb9JhgZ4
vx5S00vfKwkYhvpGTfMeWDAyxSD+8+WTpHyrGFxNELMl+2Ygvut0MKLwML9IR2Xc
GCo/qDbH8eJ/8lZmJRao/vT8SXjctOhHdLifUqU9SDzR+8IkqRYr/qLLd6H3fzke
CPyYArWmmy+ICTaGFfRLSspeXijauXzeDx6VT90lR8XThh0utqKTzPUu+0H7kvTd
UJ7qLCTvN4NLhbsIU/MFxTOdvjWWI/oAxlJ5Y+PoaDQC5rv+uKnn+J2BRcJQAB8f
DyEHBSgRNQqn1MlXNy/KvcFRDgwOPKFN3djxAqJ/UQfa4y+vE0LJ/Qp36nBVXBRB
lw3sWiE1/BZKVqV+EmzpLxy2YGLpJ52qK/rc8r5HYrhx4WjwmKZiEHp3d6jA+1VV
u0l/M68+Y+US/eHeke8GJ5Gm0uzdkjRM7SXTO9kFlzfHfNuZy3k=
=Zxac
-----END PGP SIGNATURE-----

--smOfPzt+Qjm5bNGJ--
