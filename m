From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v4 2/6] Add a way to control the level of checks in the
 code
Date: Tue, 28 Jan 2020 19:28:19 +1100
Message-ID: <20200128082819.GH42099@umbus.fritz.box>
References: <20191113015422.67210-1-sjg@chromium.org>
 <20191113015422.67210-3-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="/i8j2F0k9BYX4qLc"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1580200674;
        bh=/VceRxglPT/Es6ZHqN0w93ZjFDiJe32c+ZRPphB/7DY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZaoZ8I+Z1HygXc/eQ0S7E9pD9m81KjQr3kpTcA5wwsYq4yfhzg0kbxuRvze5lykRd
         fGhCw4/dZhNOh8eehRCW7JPuvxk0px6bAxBQTwb9Iv70fdbinsSfUITyg1XJk+dBvD
         g8O+03YSM9w1MgmZDTV6SSd1tIvm6b6tie9jfPSc=
Content-Disposition: inline
In-Reply-To: <20191113015422.67210-3-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--/i8j2F0k9BYX4qLc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 12, 2019 at 06:54:18PM -0700, Simon Glass wrote:
> Add a new ASSUME_MASK option, which allows for some control over the
> checks used in libfdt. With all assumptions enabled, libfdt assumes that
> the input data and parameters are all correct and that internal errors
> cannot happen.
>=20
> By default no assumptions are made and all checks are enabled.
>=20
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>=20
> Changes in v4:
> - Add a can_assume() macros and squash the inline functions into one
> - Drop unnecessary FDT_ prefix
> - Fix 'Incosistencies' typo
> - Merge the 'friendly' and 'sane' checks into one
> - Update and expand comments
>=20
> Changes in v3:
> - Expand the comments about each check option
> - Invert the checks to be called assumptions
> - Move header-version code to fdt.c
> - Move the comments on check options to the enum
> - Use hex for CHK_MASK
>=20
> Changes in v2:
> - Add an fdt_ prefix to avoid namespace conflicts
> - Use symbolic names for _check functions and drop leading underscores
>=20
>  Makefile                 |  6 ++-
>  libfdt/libfdt_internal.h | 88 ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 93 insertions(+), 1 deletion(-)
>=20
> diff --git a/Makefile b/Makefile
> index 4d88157..bdeaf93 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -16,7 +16,11 @@ EXTRAVERSION =3D
>  LOCAL_VERSION =3D
>  CONFIG_LOCALVERSION =3D
> =20
> -CPPFLAGS =3D -I libfdt -I .
> +# Control the assumptions made (e.g. risking security issues) in the cod=
e.
> +# See libfdt_internal.h for details
> +ASSUME_MASK ?=3D 0
> +
> +CPPFLAGS =3D -I libfdt -I . -DFDT_ASSUME_MASK=3D$(ASSUME_MASK)
>  WARNINGS =3D -Wall -Wpointer-arith -Wcast-qual -Wnested-externs \
>  	-Wstrict-prototypes -Wmissing-prototypes -Wredundant-decls -Wshadow
>  CFLAGS =3D -g -Os $(SHAREDLIB_CFLAGS) -Werror $(WARNINGS) $(EXTRA_CFLAGS)
> diff --git a/libfdt/libfdt_internal.h b/libfdt/libfdt_internal.h
> index 058c735..198480c 100644
> --- a/libfdt/libfdt_internal.h
> +++ b/libfdt/libfdt_internal.h
> @@ -48,4 +48,92 @@ static inline struct fdt_reserve_entry *fdt_mem_rsv_w_=
(void *fdt, int n)
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
> +	 * tree may cause undefined behaviour or crashes.

Likewise for errors in parameters, yes?

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
> +	 * It also assumes libfdt functions are called with valid parameters,
> +	 * i.e. not trigger FDT_ERR_BADOFFSET or offsets that are out of bounds.
> +	 * It disables any extensive checking of parameters and the device
> +	 * tree, making various assumptions about correctness. Normal device
> +	 * trees produced by libfdt and the compiler should be handled safely.
> +	 * Malicious device trees and complete garbage may cause libfdt to
> +	 * behave badly or crash.
> +	 *
> +	 * These checks will be sufficient if you have a valid device tree with
> +	 * no internal inconsistencies and call libfdt with correct parameters.
> +	 * With this assumption, libfdt will generally not return
> +	 * -FDT_ERR_INTERNAL, -FDT_ERR_BADLAYOUT, etc.
> +	 */
> +	ASSUME_SANE		=3D 1 << 0,

How tricky would it be to split this into ASSUME_VALID_DTB and
ASSUME_VALID_PARAMETERS?  I don't know useful those are on their own,
but it seems to me it might be easier to define the effect of this if
split that way.

> +
> +	/*
> +	 * This disables checks for device-tree version and removes all code
> +	 * which handles older versions.
> +	 *
> +	 * Only enable this if you know you have a device tree with the latest
> +	 * version.
> +	 */
> +	ASSUME_LATEST		=3D 1 << 1,
> +
> +	/*
> +	 * This assume that it is OK for a failed additional to the device tree
> +	 * due to lack of space or some other problem can skip any rollback
> +	 * steps (such as dropping the property name from the string table).
> +	 * This is safe to enable in most circumstances, even though it may
> +	 * leave the tree in a sub-optimal state.
> +	 */
> +	ASSUME_NO_ROLLBACK	=3D 1 << 2,
> +};
> +
> +/**
> + * _can_assume() - check if a particular assumption is enabled

Don't use a leading _ please, that's reserved for system libraries.
I've moved to trailing _ for that reason.

> + *
> + * @mask: Mask to check (ASSUME_...)
> + * @return true if that assumption is enabled, else false
> + */
> +static inline bool _can_assume(int mask)
> +{
> +	return FDT_ASSUME_MASK & mask;
> +}
> +
> +/** helper macros for checking assumptions */
> +#define can_assume(_assume)	_can_assume(ASSUME_ ## _assume)
> +
>  #endif /* LIBFDT_INTERNAL_H */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--/i8j2F0k9BYX4qLc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl4v8KMACgkQbDjKyiDZ
s5LKPQ/9GiPMhCLhPLrzjYs5Wv9ScUezheSXrE8lmYfiQkbh5MPV00a5wvJsUhSz
t9uc+/va1OtnIVE+2TrH4f4bDuloW8cPSH4nsYtnVdWgWcX5/B7KUwOltPdsSTvF
vNYczZah+BiPR6ui0j+ZPZs4ds6qMrWxUBE83EZkfuwwOopmcxefn0J+W8dACa5M
SYqvtLizYenie3kJ+GThMmQd+RChM/bUH/Js4NgeP3xy9deJrLWsQ7xY3xL5F3+F
UWCqq/VY/wdXVquxTCdXESa6vO0XUlWqkQ9JaZKFetT7fpG+dWmAKNWq0t/R6kYo
tuN9bFrxP0Kix1XQgP8ZcMKKgf4bJPcKZ1ezXfeSFo++L6uJ+Dx2ZandMbBetKkF
tfcjeaEDyaTgk78RnotNYX/o0r7JK/M6Eee82N1vl7nR4UA62cZJn9gTLy0ElBr7
cbTKn4vg0Gp/o0bZ1igFcjng+u3BiPYQx2JUy9U2jc0OLqRtxy5BB6IZHG2Bib8/
r0HjYcC/J0UGxZRw/97CGIhZ9t2tNMEtvmS0r+Qa+BKtar1fH80vWxk13581O1Kw
yKAWfQzzX98v6cJCYd4N1xa77ZcbgJif3lcYcZIB0cwR0J5Dj4t9m3Fo1+GQ50z/
0uZUSBsHko3G6ciHy8bOIi11AwIQNDtqMyxWTEM8aGZLqk9uEdg=
=PJnS
-----END PGP SIGNATURE-----

--/i8j2F0k9BYX4qLc--
