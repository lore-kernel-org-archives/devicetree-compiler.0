From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v4 6/6] libfdt: Allow exclusion of fdt_check_full()
Date: Tue, 28 Jan 2020 19:37:47 +1100
Message-ID: <20200128083747.GL42099@umbus.fritz.box>
References: <20191113015422.67210-1-sjg@chromium.org>
 <20191113015422.67210-7-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="1ppIqr1kl39GnwQx"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1580200675;
        bh=21sJHVb3ExPSg56H/17XAa6pwKq70XGo7QG1P+YM4Ic=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nXPlBjrtMfRvWcB+P7DWGwy9xs2wEQJMxA5JcW66RTIs+Mo0DzOx2Bq+Y1JGb7uBs
         ooWyv+YC8gdsvvpAe89z+V6kKT7ujcTmLr7R+ii2qe/371dxMAjMFXpaFthA5AZGX+
         fRA+8RJYmGRAmuPlHa7AQAFlT+/82kBBWWzFOZ3o=
Content-Disposition: inline
In-Reply-To: <20191113015422.67210-7-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--1ppIqr1kl39GnwQx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 12, 2019 at 06:54:22PM -0700, Simon Glass wrote:
> This function is used to perform a full check of the device tree. Allow
> it to be excluded if all assumptions are enabled.
>=20
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Reviewed-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

> ---
>=20
> Changes in v4: None
> Changes in v3:
> - Fix 'santiy' typo
> - Instead of excluding fdt_check_full() put it in its own file
> - Rearrange code in terms of checks instead of files changed, to aid revi=
ew
> - Replace 'unsigned' with 'unsigned int'
> - Update commit message a little
>=20
> Changes in v2:
> - Add a comment to fdt_find_add_string_()
> - Correct inverted version checks in a few cases
> - Drop optimised code path in fdt_nodename_eq_()
> - Update to use new check functions
> - Use fdt_chk_base() in fdt_blocks_misordered_()
>=20
>  libfdt/Makefile.libfdt |  2 +-
>  libfdt/fdt_check.c     | 74 ++++++++++++++++++++++++++++++++++++++++++
>  libfdt/fdt_ro.c        | 63 -----------------------------------
>  3 files changed, 75 insertions(+), 64 deletions(-)
>  create mode 100644 libfdt/fdt_check.c
>=20
> diff --git a/libfdt/Makefile.libfdt b/libfdt/Makefile.libfdt
> index e546397..b6d8fc0 100644
> --- a/libfdt/Makefile.libfdt
> +++ b/libfdt/Makefile.libfdt
> @@ -8,7 +8,7 @@ LIBFDT_soname =3D libfdt.$(SHAREDLIB_EXT).1
>  LIBFDT_INCLUDES =3D fdt.h libfdt.h libfdt_env.h
>  LIBFDT_VERSION =3D version.lds
>  LIBFDT_SRCS =3D fdt.c fdt_ro.c fdt_wip.c fdt_sw.c fdt_rw.c fdt_strerror.=
c fdt_empty_tree.c \
> -	fdt_addresses.c fdt_overlay.c
> +	fdt_addresses.c fdt_overlay.c fdt_check.c
>  LIBFDT_OBJS =3D $(LIBFDT_SRCS:%.c=3D%.o)
>  LIBFDT_LIB =3D libfdt-$(DTC_VERSION).$(SHAREDLIB_EXT)
> =20
> diff --git a/libfdt/fdt_check.c b/libfdt/fdt_check.c
> new file mode 100644
> index 0000000..7f6a96c
> --- /dev/null
> +++ b/libfdt/fdt_check.c
> @@ -0,0 +1,74 @@
> +// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
> +/*
> + * libfdt - Flat Device Tree manipulation
> + * Copyright (C) 2006 David Gibson, IBM Corporation.
> + */
> +#include "libfdt_env.h"
> +
> +#include <fdt.h>
> +#include <libfdt.h>
> +
> +#include "libfdt_internal.h"
> +
> +int fdt_check_full(const void *fdt, size_t bufsize)
> +{
> +	int err;
> +	int num_memrsv;
> +	int offset, nextoffset =3D 0;
> +	uint32_t tag;
> +	unsigned int depth =3D 0;
> +	const void *prop;
> +	const char *propname;
> +
> +	if (bufsize < FDT_V1_SIZE)
> +		return -FDT_ERR_TRUNCATED;
> +	err =3D fdt_check_header(fdt);
> +	if (err !=3D 0)
> +		return err;
> +	if (bufsize < fdt_totalsize(fdt))
> +		return -FDT_ERR_TRUNCATED;
> +
> +	num_memrsv =3D fdt_num_mem_rsv(fdt);
> +	if (num_memrsv < 0)
> +		return num_memrsv;
> +
> +	while (1) {
> +		offset =3D nextoffset;
> +		tag =3D fdt_next_tag(fdt, offset, &nextoffset);
> +
> +		if (nextoffset < 0)
> +			return nextoffset;
> +
> +		switch (tag) {
> +		case FDT_NOP:
> +			break;
> +
> +		case FDT_END:
> +			if (depth !=3D 0)
> +				return -FDT_ERR_BADSTRUCTURE;
> +			return 0;
> +
> +		case FDT_BEGIN_NODE:
> +			depth++;
> +			if (depth > INT_MAX)
> +				return -FDT_ERR_BADSTRUCTURE;
> +			break;
> +
> +		case FDT_END_NODE:
> +			if (depth =3D=3D 0)
> +				return -FDT_ERR_BADSTRUCTURE;
> +			depth--;
> +			break;
> +
> +		case FDT_PROP:
> +			prop =3D fdt_getprop_by_offset(fdt, offset, &propname,
> +						     &err);
> +			if (!prop)
> +				return err;
> +			break;
> +
> +		default:
> +			return -FDT_ERR_INTERNAL;
> +		}
> +	}
> +}
> diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> index 13b63c3..cbb30c8 100644
> --- a/libfdt/fdt_ro.c
> +++ b/libfdt/fdt_ro.c
> @@ -856,66 +856,3 @@ int fdt_node_offset_by_compatible(const void *fdt, i=
nt startoffset,
> =20
>  	return offset; /* error from fdt_next_node() */
>  }
> -
> -int fdt_check_full(const void *fdt, size_t bufsize)
> -{
> -	int err;
> -	int num_memrsv;
> -	int offset, nextoffset =3D 0;
> -	uint32_t tag;
> -	unsigned depth =3D 0;
> -	const void *prop;
> -	const char *propname;
> -
> -	if (bufsize < FDT_V1_SIZE)
> -		return -FDT_ERR_TRUNCATED;
> -	err =3D fdt_check_header(fdt);
> -	if (err !=3D 0)
> -		return err;
> -	if (bufsize < fdt_totalsize(fdt))
> -		return -FDT_ERR_TRUNCATED;
> -
> -	num_memrsv =3D fdt_num_mem_rsv(fdt);
> -	if (num_memrsv < 0)
> -		return num_memrsv;
> -
> -	while (1) {
> -		offset =3D nextoffset;
> -		tag =3D fdt_next_tag(fdt, offset, &nextoffset);
> -
> -		if (nextoffset < 0)
> -			return nextoffset;
> -
> -		switch (tag) {
> -		case FDT_NOP:
> -			break;
> -
> -		case FDT_END:
> -			if (depth !=3D 0)
> -				return -FDT_ERR_BADSTRUCTURE;
> -			return 0;
> -
> -		case FDT_BEGIN_NODE:
> -			depth++;
> -			if (depth > INT_MAX)
> -				return -FDT_ERR_BADSTRUCTURE;
> -			break;
> -
> -		case FDT_END_NODE:
> -			if (depth =3D=3D 0)
> -				return -FDT_ERR_BADSTRUCTURE;
> -			depth--;
> -			break;
> -
> -		case FDT_PROP:
> -			prop =3D fdt_getprop_by_offset(fdt, offset, &propname,
> -						     &err);
> -			if (!prop)
> -				return err;
> -			break;
> -
> -		default:
> -			return -FDT_ERR_INTERNAL;
> -		}
> -	}
> -}

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--1ppIqr1kl39GnwQx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl4v8tsACgkQbDjKyiDZ
s5JfVhAAw3V7Gw0wVhiZ3g2OEFX1AHiJ3AIa6Z/9PoKPANhNu+xK+bDzyirplzki
mftIGSiDnQzAklpANAO/S7PQ6VrJrqOrJ1rBq/fcORwjIkRuJsnyqh0IIlrd7T4o
GU7/4uk6kIvS6GymXdnC2c/I8xgc7iJE/W0TPi/4UHomsB87HMGAG5SZJmsNDAEc
Yfi2o5cAvdXrgXfmLMxGKQ0j6GkMDq5fMbxtCTY1NBps5yF189bsD9nmqSdXONla
tpGp2IZcgpAAnbKYhy4YltvSEvIgwRCANhMJbpOA2GXJW37fGrlKMQrbwHzjIwW2
34qoox0F8UUh/4CvnsuvrbI3s9Ly/FpmCVrS0KGV05sM+Sh9se9y6xK/sBd50w+a
mwNwoNhZh11GoV77YAFh7NG+MHGO1KfSjVsE6jy0LvxZiahOtyS29ErznVRQhnWr
ZXzFbAdn6T0ivsds7dPoWDINPo4lrpysXaO7y2ui3VPjc+Hf16lEG9Wy1eAh4SA+
0pvDi7J0lS8OKzTSPgTQlJ00f2jeN1t1/MPyrEUA0PwOUqM8HvzNnm9taLMNlGPK
1NrSBYLuYhO6D8sxdQCtGHr+5yRnsHdjrFXxuJd+6dMMQQSx180uGNzwAIcnTakI
sZvbYWzXFZzAAFNsdScUI9kdGrjwC/n8BFDhBMCEqnLgPZtvsxQ=
=QCFN
-----END PGP SIGNATURE-----

--1ppIqr1kl39GnwQx--
