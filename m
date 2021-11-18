From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 1/1] libfdt: overlay: make overlay_get_target() public
Date: Thu, 18 Nov 2021 16:26:29 +1100
Message-ID: <YZXkBbk1mp5QZOao@yekko>
References: <1637204036-382159-1-git-send-email-fnu.vikram@xilinx.com>
 <1637204036-382159-2-git-send-email-fnu.vikram@xilinx.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="D+Ut2YhWDvdR7gqK"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1637214999;
        bh=xMDkZVzVnNz/6cFftff7W2fYJXQfBZuBoCmeDu0pSrA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TK7ezm9eJvS9/7diURVA1Hu/kEbyoiL1J71WAl3v/AL2eUUjMWdbmWDNEPoS4O3Zs
         DWxZq5lPp9XnwEOrd1l2iJZ1iKIYDNtTFQPZxcJtWTaNnUUhCxsl4BccCnRnvztCJZ
         dT3HVvYN7huNsQufGE5f3Cqp0DIg2rSlNy1KLaS8=
Content-Disposition: inline
In-Reply-To: <1637204036-382159-2-git-send-email-fnu.vikram-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Vikram Garhwal <fnu.vikram-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--D+Ut2YhWDvdR7gqK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 17, 2021 at 06:53:56PM -0800, Vikram Garhwal wrote:
> This is done to get the target path for the overlay nodes which is very u=
seful
> in many cases. For example, Xen hypervisor needs it when applying overlays
> because Xen needs to do further processing of the overlay nodes, e.g. map=
ping of
> resources(IRQs and IOMMUs) to other VMs, creation of SMMU pagetables, etc.
>=20
> Signed-off-by: Vikram Garhwal <fnu.vikram-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>

Applied, thanks.

If you can follow up with some testcases for the newly-public
function, that would be most appreciated.

> ---
>  libfdt/fdt_overlay.c | 29 +++++++----------------------
>  libfdt/libfdt.h      | 18 ++++++++++++++++++
>  libfdt/version.lds   |  1 +
>  3 files changed, 26 insertions(+), 22 deletions(-)
>=20
> diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
> index d217e79..5c0c398 100644
> --- a/libfdt/fdt_overlay.c
> +++ b/libfdt/fdt_overlay.c
> @@ -40,37 +40,22 @@ static uint32_t overlay_get_target_phandle(const void=
 *fdto, int fragment)
>  	return fdt32_to_cpu(*val);
>  }
> =20
> -/**
> - * overlay_get_target - retrieves the offset of a fragment's target
> - * @fdt: Base device tree blob
> - * @fdto: Device tree overlay blob
> - * @fragment: node offset of the fragment in the overlay
> - * @pathp: pointer which receives the path of the target (or NULL)
> - *
> - * overlay_get_target() retrieves the target offset in the base
> - * device tree of a fragment, no matter how the actual targeting is
> - * done (through a phandle or a path)
> - *
> - * returns:
> - *      the targeted node offset in the base device tree
> - *      Negative error code on error
> - */
> -static int overlay_get_target(const void *fdt, const void *fdto,
> -			      int fragment, char const **pathp)
> +int fdt_overlay_target_offset(const void *fdt, const void *fdto,
> +			      int fragment_offset, char const **pathp)
>  {
>  	uint32_t phandle;
>  	const char *path =3D NULL;
>  	int path_len =3D 0, ret;
> =20
>  	/* Try first to do a phandle based lookup */
> -	phandle =3D overlay_get_target_phandle(fdto, fragment);
> +	phandle =3D overlay_get_target_phandle(fdto, fragment_offset);
>  	if (phandle =3D=3D (uint32_t)-1)
>  		return -FDT_ERR_BADPHANDLE;
> =20
>  	/* no phandle, try path */
>  	if (!phandle) {
>  		/* And then a path based lookup */
> -		path =3D fdt_getprop(fdto, fragment, "target-path", &path_len);
> +		path =3D fdt_getprop(fdto, fragment_offset, "target-path", &path_len);
>  		if (path)
>  			ret =3D fdt_path_offset(fdt, path);
>  		else
> @@ -636,7 +621,7 @@ static int overlay_merge(void *fdt, void *fdto)
>  		if (overlay < 0)
>  			return overlay;
> =20
> -		target =3D overlay_get_target(fdt, fdto, fragment, NULL);
> +		target =3D fdt_overlay_target_offset(fdt, fdto, fragment, NULL);
>  		if (target < 0)
>  			return target;
> =20
> @@ -779,7 +764,7 @@ static int overlay_symbol_update(void *fdt, void *fdt=
o)
>  			return -FDT_ERR_BADOVERLAY;
> =20
>  		/* get the target of the fragment */
> -		ret =3D overlay_get_target(fdt, fdto, fragment, &target_path);
> +		ret =3D fdt_overlay_target_offset(fdt, fdto, fragment, &target_path);
>  		if (ret < 0)
>  			return ret;
>  		target =3D ret;
> @@ -801,7 +786,7 @@ static int overlay_symbol_update(void *fdt, void *fdt=
o)
> =20
>  		if (!target_path) {
>  			/* again in case setprop_placeholder changed it */
> -			ret =3D overlay_get_target(fdt, fdto, fragment, &target_path);
> +			ret =3D fdt_overlay_target_offset(fdt, fdto, fragment, &target_path);
>  			if (ret < 0)
>  				return ret;
>  			target =3D ret;
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> index 7f117e8..a7f432c 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -2116,6 +2116,24 @@ int fdt_del_node(void *fdt, int nodeoffset);
>   */
>  int fdt_overlay_apply(void *fdt, void *fdto);
> =20
> +/**
> + * fdt_overlay_target_offset - retrieves the offset of a fragment's targ=
et
> + * @fdt: Base device tree blob
> + * @fdto: Device tree overlay blob
> + * @fragment_offset: node offset of the fragment in the overlay
> + * @pathp: pointer which receives the path of the target (or NULL)
> + *
> + * fdt_overlay_target_offset() retrieves the target offset in the base
> + * device tree of a fragment, no matter how the actual targeting is
> + * done (through a phandle or a path)
> + *
> + * returns:
> + *      the targeted node offset in the base device tree
> + *      Negative error code on error
> + */
> +int fdt_overlay_target_offset(const void *fdt, const void *fdto,
> +			      int fragment_offset, char const **pathp);
> +
>  /**********************************************************************/
>  /* Debugging / informational functions                                */
>  /**********************************************************************/
> diff --git a/libfdt/version.lds b/libfdt/version.lds
> index 7ab85f1..cbce5d4 100644
> --- a/libfdt/version.lds
> +++ b/libfdt/version.lds
> @@ -77,6 +77,7 @@ LIBFDT_1.2 {
>  		fdt_appendprop_addrrange;
>  		fdt_setprop_inplace_namelen_partial;
>  		fdt_create_with_flags;
> +		fdt_overlay_target_offset;
>  	local:
>  		*;
>  };

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--D+Ut2YhWDvdR7gqK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmGV5AUACgkQbDjKyiDZ
s5KDdRAAhSJxNJZOR6mBg3qQ+dqgI7xdrahywga0ZpHG+i7/bjSBo61AnrQmPaKr
LMACgEUXKo3q0yGkovQEoZE3TDQR0AGwFkxw6/s4gD/w97M/ZyiybnincJUFZR7R
AOMdRwrngPi5Kd7K11exyWcv9vleo4ZvNlwoq74aOW2lXVS9F+RP1ZcXX6YhQ1Fh
dxgDbuBxqFUHvXa0NFSQ5zYm1pWiQnyNVTsaN9qDjMjPq2Lhv6Efukn0a+V4h3jZ
gs1LkL8NMYTFPZ6JuBJW8MqN+eBeGbFVj7MdH4KugTWDR6S+eNoK7p9EE/Alu71I
clhrqmCH3C5vMFGInRSKZ4rQQiAmVEUneu9drYZJResghOcdYow1gBUpVl5njpyu
+hfGLDQLZmz5f+cEsu1FBSDKGQq8avasTZ3S9zQ1+8ILBuMS92g2o19HXixYoZ8V
BmtHp6kVNxQuV9ne6uNetrseaz41CWz01uu17utUiYZQUuaVcN5BrHnvtiMvMvu2
8Rf/Q28gB0ZaysSJ+Kj7+6IWMDyQpYIMDNqlETeHC3kOyfU7495NazEqqldHGmHz
HjW+GAvFlUl+Jtia/Jp6sJaByqahdko5qpZ1VoNX2Smzed33U9i1J+3CYGalg6Ce
ZjXQ5fcsArxcBfi2obZN3Ho6xl2rhCLUY3vKotEtA4ClEFQE3Lg=
=xv06
-----END PGP SIGNATURE-----

--D+Ut2YhWDvdR7gqK--
