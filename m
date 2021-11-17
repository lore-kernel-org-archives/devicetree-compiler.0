From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] libfdt: overlay: Add fdt_ prefix to overlay_get_target()
Date: Thu, 18 Nov 2021 10:44:00 +1100
Message-ID: <YZWTwFNy0ZPNcYbQ@yekko>
References: <1637019043-452179-1-git-send-email-fnu.vikram@xilinx.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="o+MIEupkDEErmB9e"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1637193952;
        bh=m4BjIY68pAfJFlZrtvr/Q4uDDpVAKWNQIL2vFq8cyVs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Glj8k0oN+0UxPoN87pWx7o7m5+uIvkq9G+le3IhWZ7hkP/yJ1ADMAur36RXVsSakA
         WcEGW2stOy+aahabbkvKvSxPI/kdbHTHbAYcFs0WndeYkHVrRH1QRoCatcx5GMuhcR
         RDCqVm2INj/FqRryi/qz3y2mE8TmZoutC7r+jxF0=
Content-Disposition: inline
In-Reply-To: <1637019043-452179-1-git-send-email-fnu.vikram-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Vikram Garhwal <fnu.vikram-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--o+MIEupkDEErmB9e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 15, 2021 at 03:30:43PM -0800, Vikram Garhwal wrote:
> Add fdt_ prefix to overlay_get_target() and remove static type.

The short description is burying the lede a bit, the key point is that
you're making this function public.

> This is done to get the target path for the overlay nodes which is very u=
seful
> in many cases. For example, Xen hypervisor needs it when applying overlays
> because Xen needs to do further processing of the overlay nodes, e.g. map=
ping of
> resources(IRQs and IOMMUs) to other VMs, creation of SMMU pagetables, etc.
>=20
> Signed-off-by: Vikram Garhwal <fnu.vikram-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>

The concept looks fine to me.  A few details to polish noted below:

> ---
>  libfdt/fdt_overlay.c | 23 ++++-------------------
>  libfdt/libfdt.h      | 19 +++++++++++++++++++
>  libfdt/version.lds   |  1 +
>  3 files changed, 24 insertions(+), 19 deletions(-)
>=20
> diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
> index d217e79..e141053 100644
> --- a/libfdt/fdt_overlay.c
> +++ b/libfdt/fdt_overlay.c
> @@ -40,22 +40,7 @@ static uint32_t overlay_get_target_phandle(const void =
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
> +int fdt_overlay_get_target(const void *fdt, const void *fdto,
>  			      int fragment, char const **pathp)

"overlay_get_target" was fine as an internal name.  When published, I
think "fdt_overlay_target_offset" would better fit the naming
conventions for the rest of the interface.

Similarly, I'd like the @fragment parameter renamed @fragment_offset.

[The insistent use of explicit "offset" throughout the interface is
 deliberate - it's an attempt to constantly remind users that these
 quantities are explicit offsets in the blob, which can be invalidated
 by other changes, rather than some sort of safe, stable handle on a
 node]

>  {
>  	uint32_t phandle;
> @@ -636,7 +621,7 @@ static int overlay_merge(void *fdt, void *fdto)
>  		if (overlay < 0)
>  			return overlay;
> =20
> -		target =3D overlay_get_target(fdt, fdto, fragment, NULL);
> +		target =3D fdt_overlay_get_target(fdt, fdto, fragment, NULL);
>  		if (target < 0)
>  			return target;
> =20
> @@ -779,7 +764,7 @@ static int overlay_symbol_update(void *fdt, void *fdt=
o)
>  			return -FDT_ERR_BADOVERLAY;
> =20
>  		/* get the target of the fragment */
> -		ret =3D overlay_get_target(fdt, fdto, fragment, &target_path);
> +		ret =3D fdt_overlay_get_target(fdt, fdto, fragment, &target_path);
>  		if (ret < 0)
>  			return ret;
>  		target =3D ret;
> @@ -801,7 +786,7 @@ static int overlay_symbol_update(void *fdt, void *fdt=
o)
> =20
>  		if (!target_path) {
>  			/* again in case setprop_placeholder changed it */
> -			ret =3D overlay_get_target(fdt, fdto, fragment, &target_path);
> +			ret =3D fdt_overlay_get_target(fdt, fdto, fragment, &target_path);
>  			if (ret < 0)
>  				return ret;
>  			target =3D ret;
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> index 7f117e8..5d42533 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -2116,6 +2116,25 @@ int fdt_del_node(void *fdt, int nodeoffset);
>   */
>  int fdt_overlay_apply(void *fdt, void *fdto);
> =20
> +/**
> + * fdt_overlay_get_target - retrieves the offset of a fragment's target
> + * @fdt: Base device tree blob
> + * @fdto: Device tree overlay blob
> + * @fragment: node offset of the fragment in the overlay
> + * @pathp: pointer which receives the path of the target (or NULL)
> + *
> + * fdt_overlay_get_target() retrieves the target offset in the base
> + * device tree of a fragment, no matter how the actual targeting is
> + * done (through a phandle or a path)
> + *
> + * returns:
> + *      the targeted node offset in the base device tree
> + *      Negative error code on error
> + */
> +
> +int fdt_overlay_get_target(const void *fdt, const void *fdto, int fragme=
nt,
> +                           char const **pathp);
> +
>  /**********************************************************************/
>  /* Debugging / informational functions                                */
>  /**********************************************************************/
> diff --git a/libfdt/version.lds b/libfdt/version.lds
> index 7ab85f1..9e0daa1 100644
> --- a/libfdt/version.lds
> +++ b/libfdt/version.lds
> @@ -77,6 +77,7 @@ LIBFDT_1.2 {
>  		fdt_appendprop_addrrange;
>  		fdt_setprop_inplace_namelen_partial;
>  		fdt_create_with_flags;
> +		fdt_overlay_get_target;
>  	local:
>  		*;
>  };

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--o+MIEupkDEErmB9e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmGVk70ACgkQbDjKyiDZ
s5LDyhAAmIwatMy5xO1vmoO3mIKjz8JQTD90VbrQliILLFHuM0wJyoq4s9WUP0Oz
H6aH/QK07XRERWumZtmHGN9wAF3xLL7lpIJXBb8RO/Ds0AWFxyNWjayZ2sugDKp1
9ziVG3GpzzXexosyzDvlfbXW9QgqPEm7VbvtLWTaveKLH1N8vrBWevR8LAI2f1co
HHi/f1/LuLzIoYd+4tO8umypCRzYTMfQASyrFKD4kUKDkd/LP1vhel/ljk72r684
2FC24Rpbkp4KY+wivu7JKvn0Loscab2KHZ78lMPY1wX1VWHV8zJIwN9wb3Z4v6Ee
b3dN+QMgfRYNZQxoPQAqO3qEkH9uJGweXpVR1z+jPRgzNCUoNvLu3IB8RfRRvnjc
WsfrAMnf5j8aFSiGlF6IZA/WHT7cCdWu6PkmLtaVKzwKI/Q2swt8Jl+q86ukmmyY
5dTCDps8UBPGbCBup1SnWKYxZZpDjbKZvUco6Tt0QlQ+bxxhRgKGiKgwQZ/qftYt
kzZNdgFKP8yCIs6KAT77XUuCg2TSq6gXdxRt01CixqET/soyVlyGDKnFFGgfNLSe
Ba6YvQgTn+nubAhgo+b9D3GiSOTEbIVoyDMhr/oSCosqIwu0H0ZvkaS7UAk3RE39
DkUwhpFbIRG6w8nHq5U0MOOUfp8KYY2Qhe0UFKScQx2VDQnXhts=
=dEws
-----END PGP SIGNATURE-----

--o+MIEupkDEErmB9e--
