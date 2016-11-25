From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] libfdt: add helpers to read address and size from reg
Date: Fri, 25 Nov 2016 21:51:25 +1100
Message-ID: <20161125105125.GJ12287@umbus.fritz.box>
References: <1478710712-25010-1-git-send-email-b-fair@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="LG0Ll82vYr46+VA1"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1480071094;
        bh=4ZDsTw9dVeItuKI9mTl3P3xrxjE9PlabeBAmVxfMFvU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=n8k0vx1QiuHh9WRm3YFk0IDu7d+RR6uPrOy+zLSjqIW9aXSye3nw+1qRertddBL71
         cqpIidHOhG6SYw8PiBIkmXpfrptmIKOOPUeXQHWmhoItkgewzJAnBeYm6X8zgvaZnp
         OON+M5UBPVQ2+iM5vTYwdDSqMqoeNBIQi/JJLkjk=
Content-Disposition: inline
In-Reply-To: <1478710712-25010-1-git-send-email-b-fair-l0cyMroinI0@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Benjamin Fair <b-fair-l0cyMroinI0@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--LG0Ll82vYr46+VA1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 09, 2016 at 10:58:32AM -0600, Benjamin Fair wrote:
> This patch extends the capability of libfdt to parse the contents of devi=
ce
> trees in a similar manner to fdt_address_cells and fdt_size_cells.
>=20
> It adds a helper function which reads the address and size of a device fr=
om
> the reg property and performs basic sanity checks.
>=20
> It does not perform translation to a physical address using the ranges
> properties of parents, but this enhancement may be added as a separate
> function in the future.

I like the concept of a helper to read entries from reg, but there
some things about the execution of it I think need some more thought.

> Signed-off-by: Benjamin Fair <b-fair-l0cyMroinI0@public.gmane.org>
> ---
>=20
> The intent of this patch is similar to the commit "libfdt: Add helpers to=
 read
> #address-cells and #size-cells" [1].
>=20
> It is related to "libfdt: add address translation support" [2] but does n=
ot
> attempt to perform address translation and was written from scratch rathe=
r than
> reusing GPL code. If the issues with that patch are resolved, that
> functionality will complement what is added in this patch.
>=20
> [1] http://www.spinics.net/lists/devicetree-compiler/msg00113.html
> [2] http://www.spinics.net/lists/devicetree-compiler/msg00093.html
>=20
>  libfdt/fdt_addresses.c | 62 ++++++++++++++++++++++++++++++++++++++++++
>  libfdt/libfdt.h        | 29 ++++++++++++++++++++
>  libfdt/version.lds     |  1 +
>  tests/.gitignore       |  1 +
>  tests/Makefile.tests   |  2 +-
>  tests/addr_size.c      | 74 ++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  tests/addresses.dts    | 11 ++++++++
>  tests/run_tests.sh     |  1 +
>  8 files changed, 180 insertions(+), 1 deletion(-)
>  create mode 100644 tests/addr_size.c
>=20
> diff --git a/libfdt/fdt_addresses.c b/libfdt/fdt_addresses.c
> index eff4dbc..92cbed9 100644
> --- a/libfdt/fdt_addresses.c
> +++ b/libfdt/fdt_addresses.c
> @@ -55,6 +55,9 @@
> =20
>  #include "libfdt_internal.h"
> =20
> +#define BYTES_PER_CELL 4
> +#define BITS_PER_CELL 32

You shouldn't need these.  BYTES_PER_CELL =3D=3D sizeof(fdt32_t).

> +
>  int fdt_address_cells(const void *fdt, int nodeoffset)
>  {
>  	const fdt32_t *ac;
> @@ -94,3 +97,62 @@ int fdt_size_cells(const void *fdt, int nodeoffset)
> =20
>  	return val;
>  }
> +
> +static uint64_t _fdt_read_cells(const fdt32_t *cells, int n)

This is a reasonable helper, but the name is bad.  "read_cells"
suggests it can read some arbitrary number of cells, but in fact all
it can do is read a 32-bit int or a 64-bit int.  Plus everything is
made up of cells, but more specifically what you're doing here is
interpreting several cells as an integer in the usual encoding.

> +{
> +	int i;
> +	uint64_t res;
> +
> +	/* TODO: Support values larger than 2 cells */

I don't really see any way you could support >2 cells without
completely changing the interface.

> +	if (n > 2)
> +		return -FDT_ERR_BADNCELLS;
> +
> +	res =3D 0;
> +	for (i =3D 0; i < n; i++) {
> +		res <<=3D BITS_PER_CELL;
> +		res |=3D fdt32_to_cpu(cells[i]);
> +	}
> +
> +	return res;
> +}
> +
> +int fdt_simple_addr_size(const void *fdt, int nodeoffset, int idx,
> +			 uintptr_t *addr, size_t *size)
> +{
> +	int parent;
> +	int ac, sc, reg_stride;
> +	int res;
> +	const fdt32_t *reg;
> +
> +	reg =3D fdt_getprop(fdt, nodeoffset, "reg", &res);
> +	if (res < 0)
> +		return res;
> +
> +	parent =3D fdt_parent_offset(fdt, nodeoffset);
> +	if (parent < 0)
> +		return res;

So, fdt_parent_offset() is very expensive, I wouldn't recommend it in
a function that's likely to be called a lot like this.  Instead I'd
suggest a function which takes the parent offset as a parameter, and
optionally a wrapper that uses fdt_parent_offset().

> +
> +	ac =3D fdt_address_cells(fdt, parent);
> +	if (ac < 0)
> +		return ac;
> +
> +	sc =3D fdt_size_cells(fdt, parent);
> +	if (sc < 0)
> +		return sc;
> +
> +	reg_stride =3D ac + sc;
> +	/*
> +	 * res is the number of bytes read and must be an even multiple of the
> +	 * sum of ac and sc.
> +	 */
> +	if ((res % (reg_stride * BYTES_PER_CELL)) !=3D 0)
> +		return -FDT_ERR_BADVALUE;
> +
> +	if (addr)
> +		*addr =3D (uintptr_t) _fdt_read_cells(&reg[reg_stride * idx], ac);

I don't think uintptr_t makes sense here.  The addresses in the device
tree are in whatever bus they're in, and there are a whole stack of
reasons that could be unrelated to the pointer size of environment
libfdt is running in:
    - The device may be on a subordinate bus whose addresses need
      to be translated
    - Even at the top-level, the reg properties represent
      *physical* addresses, which may not be the same as virtual
      addresses  in code running on the system
    - libfdt may be running on a completely different system from the
      one the device tree in question is aimed at (bootloaders are
      only one use case for libfdt).

> +	if (size)
> +		*size =3D (size_t) _fdt_read_cells(&reg[ac + reg_stride * idx],
> +						 sc);

Likewise size_t isn't necessarily right here, although I suspect it's
less likely to break in practice.

> +	return 0;
> +}

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--LG0Ll82vYr46+VA1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYOBetAAoJEGw4ysog2bOS8dYP/3fw647WRtUb+20PYDfgPjJ0
rIZg1c1ZAB89dW+MzU3M+UF82Entd/y8MBLr5i3MN/C4AqG9vlSf4jhi6u7jb1ua
NVqBVBujRh++zQZ4lJ8aK4DM2Pq8aNx4ukrch5WukIgE7nqF2FjCbmUSCv3b0ZLc
pqBcph7BMoPTCjfrbyAAFGlzWrS8DjucRKI/EKoUGB+HKpSyORql/eE0hijiF6fv
5DZUoNgDTfTqx15DKCg/hIqiHkphpgNn9IU+UK17qWXXnLp+Gi8Eq8dznTo3H84x
khUT1OVuD6VXKmwdO0BxBJcVJAVvYjqFjgMr0qYl867mIQHVMuBACHazE/h3T5UD
TYhxaXK0U+JlIE8GL29spOqVQ2YY2puSOjLcYdPHsmoxTCl42TR4CX7VJQ4m6qjY
y3hEg3h93zCwO68OoMuJKYTfAJMBwMfvS3NyIvh1Ptd9idxtZnDZoA1mDBOVJch/
jUe27/ZdkqtMqlU8ELb27oV62bsxoamBM3dcuDonvrCSoDCf8qAF/p6JaD6w+QFg
srk9rQCxFjLe5xtQcuWeiMrXpQaQx9rADusbv16qO56NXNpM1BeqsUVL9V/1Liwo
zmtZ5rS947UycrUv4VyhnEPqK/irg+T29QJLcloZIWQzoghF71l9xADW1A69ZJSG
BYiafKGlFJpQduvH3YSP
=p25r
-----END PGP SIGNATURE-----

--LG0Ll82vYr46+VA1--
