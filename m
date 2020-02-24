From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v7 2/8] Add a way to control the level of checks in the
 code
Date: Mon, 24 Feb 2020 16:51:30 +1100
Message-ID: <20200224055130.GH1751@umbus.fritz.box>
References: <20200220214557.176528-1-sjg@chromium.org>
 <20200220214557.176528-3-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qoTlaiD+Y2fIM3Ll"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1582526632;
        bh=TMz2hn6EiXdKIhdBf8H9/yyyFNe9ccAl4MYXa/4P3HM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eF9ViK52REwKXcLqNr+mdP3s/npt4N99W1pEaNnwgkK6oy66SdZ4AChnuiyx9PpmQ
         1AdYR8OxDrswZVhc0fYynTUG4Ec3pI0WL7oYqiIpDSyMGLZtn3QCn6x47ZP/3xpxbJ
         MVmPKLp2gLZEOv5eqTOEbSb+8e+MikgVZziQlg2c=
Content-Disposition: inline
In-Reply-To: <20200220214557.176528-3-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--qoTlaiD+Y2fIM3Ll
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2020 at 02:45:51PM -0700, Simon Glass wrote:
> Add a new ASSUME_MASK option, which allows for some control over the
> checks used in libfdt. With all assumptions enabled, libfdt assumes that
> the input data and parameters are all correct and that internal errors
> cannot happen.

Some details to fix as a followup:
> diff --git a/libfdt/libfdt_internal.h b/libfdt/libfdt_internal.h
> index 058c735..e9913cd 100644
> --- a/libfdt/libfdt_internal.h
> +++ b/libfdt/libfdt_internal.h
> @@ -48,4 +48,108 @@ static inline struct fdt_reserve_entry *fdt_mem_rsv_w=
_(void *fdt, int n)
> =20
>  #define FDT_SW_MAGIC		(~FDT_MAGIC)
> =20
> +/**********************************************************************/
> +/* Checking controls                                                  */
> +/**********************************************************************/
> +
> +#ifndef FDT_ASSUME_MASK
> +#define FDT_ASSUME_MASK 0
> +#endif
> +
> +/*
> + * Defines assumptions which can be enabled. Each of these can be enabled
> + * individually. For maximum saftey, don't enable any assumptions!

Typo: s/saftey/safety/

> + *
> + * For minimal code size and no safety, use ASSUME_PERFECT at your own r=
isk.
> + * You should have another method of validating the device tree, such as=
 a
> + * signature or hash check before using libfdt.
> + *
> + * For situations where security is not a concern it may be safe to enab=
le
> + * ASSUME_SANE.
> + */
> +enum {
> +	/*
> +	 * This does essentially no checks. Only the latest device-tree
> +	 * version is correctly handled. Inconsistencies or errors in the device
> +	 * tree may cause undefined behaviour or crashes. Invalid parameters
> +	 * passed to libfdt may do the same.
> +	 *
> +	 * If an error occurs when modifying the tree it may leave the tree in
> +	 * an intermediate (but valid) state. As an example, adding a property
> +	 * where there is insufficient space may result in the property name
> +	 * being added to the string table even though the property itself is
> +	 * not added to the struct section.
> +	 *
> +	 * Only use this if you have a fully validated device tree with
> +	 * the latest supported version and wish to minimise code size.
> +	 */
> +	ASSUME_PERFECT		=3D 0xff,
> +
> +	/*
> +	 * This assumes that the device tree is sane. i.e. header metadata
> +	 * and basic hierarchy are correct.
> +	 *
> +	 * With this assumption enabled, normal device trees produced by libfdt
> +	 * and the compiler should be handled safely. Malicious device trees and
> +	 * complete garbage may cause libfdt to behave badly or crash.

Might be worth noting that a truncated load could be enough to break
things here, which could happen in plenty of ways that aren't really
"malicious".

> +	 *
> +	 * Note: Only checks that relate exclusively to the device tree itself
> +	 * (not the parameters passed to libfdt) are disabled by this
> +	 * assumption. This includes checking headers, tags and the like.
> +	 */
> +	ASSUME_VALID_DTB	=3D 1 << 0,
> +
> +	/*
> +	 * This builds on ASSUME_VALID_DTB and further assumes that libfdt
> +	 * functions are called with valid parameters, i.e. not trigger
> +	 * FDT_ERR_BADOFFSET or offsets that are out of bounds. It disables any
> +	 * extensive checking of parameters and the device tree, making various
> +	 * assumptions about correctness.
> +	 *
> +	 * It doesn't make sense to enable this assumption unless
> +	 * ASSUME_VALID_DTB is also enabled.
> +	 */
> +	ASSUME_VALID_INPUT	=3D 1 << 1,
> +
> +	/*
> +	 * This disables checks for device-tree version and removes all code
> +	 * which handles older versions.
> +	 *
> +	 * Only enable this if you know you have a device tree with the latest
> +	 * version.
> +	 */
> +	ASSUME_LATEST		=3D 1 << 2,
> +
> +	/*
> +	 * This assume that it is OK for a failed additional to the device tree

s/additional/additions/

> +	 * due to lack of space or some other problem can skip any rollback
> +	 * steps (such as dropping the property name from the string table).
> +	 * This is safe to enable in most circumstances, even though it may
> +	 * leave the tree in a sub-optimal state.
> +	 */
> +	ASSUME_NO_ROLLBACK	=3D 1 << 3,
> +
> +	/*
> +	 * This assumes that the device tree components appear in the correct
> +	 * order. As such it disables a check in fdt_open_into() and removes the

Please reword.  Since the spec doesn't specify, no orders are
"incorrect", just less convenient.

> +	 * ability to fix the problem there. This is safe if you know that the
> +	 * device tree is correctly ordered. See fdt_blocks_misordered_().
> +	 */
> +	ASSUME_LIBFDT_ORDER	=3D 1 << 4,
> +};
> +
> +/**
> + * can_assume_() - check if a particular assumption is enabled
> + *
> + * @mask: Mask to check (ASSUME_...)
> + * @return true if that assumption is enabled, else false
> + */
> +static inline bool can_assume_(int mask)
> +{
> +	return FDT_ASSUME_MASK & mask;
> +}
> +
> +/** helper macros for checking assumptions */
> +#define can_assume(_assume)	can_assume_(ASSUME_ ## _assume)
> +
>  #endif /* LIBFDT_INTERNAL_H */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--qoTlaiD+Y2fIM3Ll
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl5TZGIACgkQbDjKyiDZ
s5IPbBAAuUFHF7mB6j6TptmeI+BR1UN4AL/SI/y6NqsYMQZ7mwAt2Yn9xexBVjd+
q/bGyszquqh+gwTDy5Prk2x8KdfgEil/wGwsUgtYt6aks6bOyT8oavF+pLiF+j6s
FR4kBhMewusSiEolov1AnLOav4Ljm+bvONJh+Lb5npzrxDkjVb0oUOC3QQt0tNJS
S5KYA1nAkvk9+uZCqoIX0QZXreIXI/j/BnCayI+L5HcfPRGquVhhlnf1SDlh5+wa
2RsTzXDMMxdxZmdDIChP7uETTWmUd1gdDYOXimsGuoD1UWCQpak6QaQlIesOjbvl
pBCcOVKCH0EgSA6EfG4nrJAurT2Li7UinMk/B9YQQZwgf8uDPwuBBq2NWIUdVojo
E6S3pc4CvsIfc83XxyvSuAxbbxwJXDC8gRwMiP1zEnAO9LYc7R2tamJ2jA+PyZ6m
gv224dtU6oiauWJ6gzlsOqPhoIif8DOqcJVyywAmD1H5BEIuEeVMRUIixRUuv/ZG
DR8pkC0JfYso29+KH8l/3OeIV1fEg3QsZpRPe6/XhTnbQk2daBcjtrnbJ9iX9O5c
KuZoeTFMIF93TlSdcutkiI0R9ZmFFGG4DkS54ZICpN7sxeqcMcc2aKdmmq5C6oZ/
9iBLAad7slQKkghm0hLTS6d6jBgR9xkMIQ3ZC8vXGQhu0WNKnpY=
=zSAB
-----END PGP SIGNATURE-----

--qoTlaiD+Y2fIM3Ll--
