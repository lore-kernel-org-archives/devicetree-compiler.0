From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 2/2] libfdt: Check that the root-node name is empty
Date: Tue, 23 Mar 2021 11:57:46 +1100
Message-ID: <YFk9Cvw8zrvFCUca@yekko.fritz.box>
References: <20210323000926.3210733-1-sjg@chromium.org>
 <20210323000926.3210733-2-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ixg5sSvRJCmhsikm"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1616461075;
        bh=PvvU2HPeJH/DUiJCJJ3K06NS4YUvGLONFI/AfdMaIP4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=akTi8AGuaFPAeggo8qFK9NSOouRFD42bmHYABkao97JYBZBxW3Fxu+eMNM4/ygEUM
         q+LbHg2qRSZqEaYscNyZD20KT02MvybUux4CNGNM4Y/1phABgBix3fJFiV+gfgQUM9
         lU1NOfmr0v/DUcMfnswlTtMcJrD/zfnwqt13cRAk=
Content-Disposition: inline
In-Reply-To: <20210323000926.3210733-2-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arie Haenel <arie.haenel-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Julien Lenoir <julien.lenoir-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>


--ixg5sSvRJCmhsikm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 23, 2021 at 01:09:26PM +1300, Simon Glass wrote:
> The root node is supposed to have an empty name, but at present this is
> not checked. The behaviour of such a tree is not well defined. Most
> software rightly assumes that the root node is at offset 0 and does not
> check the name. This oddity was discovered as part of a security
> investigation into U-Boot verified boot.
>=20
> Add a check for this to fdt_check_full().
>=20
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Reported-by: Arie Haenel <arie.haenel-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> Reported-by: Julien Lenoir <julien.lenoir-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>

Looks like this is missing the run_tests.sh update to actually invoke
the test you've written.

> ---
>=20
> Changes in v2:
> - Use FDT_ERR_BADSTRUCTURE instead of FDT_ERR_BADLAYOUT
>=20
>  libfdt/fdt_check.c   | 10 ++++++++++
>  tests/Makefile.tests |  2 +-
>  tests/dumptrees.c    |  3 ++-
>  tests/testdata.h     |  1 +
>  tests/trees.S        | 15 +++++++++++++++
>  5 files changed, 29 insertions(+), 2 deletions(-)
>=20
> diff --git a/libfdt/fdt_check.c b/libfdt/fdt_check.c
> index 13595a2..fa410a8 100644
> --- a/libfdt/fdt_check.c
> +++ b/libfdt/fdt_check.c
> @@ -59,6 +59,16 @@ int fdt_check_full(const void *fdt, size_t bufsize)
>  			depth++;
>  			if (depth > INT_MAX)
>  				return -FDT_ERR_BADSTRUCTURE;
> +
> +			/* The root node must have an empty name */
> +			if (depth =3D=3D 1) {
> +				const char *name;
> +				int len;
> +
> +				name =3D fdt_get_name(fdt, offset, &len);
> +				if (*name || len)
> +					return -FDT_ERR_BADSTRUCTURE;
> +			}
>  			break;
> =20
>  		case FDT_END_NODE:
> diff --git a/tests/Makefile.tests b/tests/Makefile.tests
> index fe5cae8..2b47627 100644
> --- a/tests/Makefile.tests
> +++ b/tests/Makefile.tests
> @@ -33,7 +33,7 @@ LIB_TESTS_L =3D get_mem_rsv \
>  LIB_TESTS =3D $(LIB_TESTS_L:%=3D$(TESTS_PREFIX)%)
> =20
>  LIBTREE_TESTS_L =3D truncated_property truncated_string truncated_memrsv=
 \
> -	two_roots
> +	two_roots named_root
> =20
>  LIBTREE_TESTS =3D $(LIBTREE_TESTS_L:%=3D$(TESTS_PREFIX)%)
> =20
> diff --git a/tests/dumptrees.c b/tests/dumptrees.c
> index 02ca092..f1e0ea9 100644
> --- a/tests/dumptrees.c
> +++ b/tests/dumptrees.c
> @@ -24,7 +24,8 @@ static struct {
>  	TREE(ovf_size_strings),
>  	TREE(truncated_property), TREE(truncated_string),
>  	TREE(truncated_memrsv),
> -	TREE(two_roots)
> +	TREE(two_roots),
> +	TREE(named_root)
>  };
> =20
>  #define NUM_TREES	(sizeof(trees) / sizeof(trees[0]))
> diff --git a/tests/testdata.h b/tests/testdata.h
> index d03f352..4f9e3ba 100644
> --- a/tests/testdata.h
> +++ b/tests/testdata.h
> @@ -56,4 +56,5 @@ extern struct fdt_header ovf_size_strings;
>  extern struct fdt_header truncated_string;
>  extern struct fdt_header truncated_memrsv;
>  extern struct fdt_header two_roots;
> +extern struct fdt_header named_root;
>  #endif /* ! __ASSEMBLY */
> diff --git a/tests/trees.S b/tests/trees.S
> index e2380b7..95d599d 100644
> --- a/tests/trees.S
> +++ b/tests/trees.S
> @@ -298,3 +298,18 @@ two_roots_strings_end:
> =20
>  two_roots_end:
> =20
> +
> +        /* root node with a non-empty name */
> +        TREE_HDR(named_root)
> +	EMPTY_RSVMAP(named_root)
> +
> +named_root_struct:
> +	BEGIN_NODE("fake")
> +	END_NODE
> +	FDTLONG(FDT_END)
> +named_root_struct_end:
> +
> +named_root_strings:
> +named_root_strings_end:
> +
> +named_root_end:

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ixg5sSvRJCmhsikm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBZPQoACgkQbDjKyiDZ
s5Kswg//bT9flb7p8eT7Kd2CdpxAPpqSOaCSCv0WbQfeF4gPHvhiHxa2GkR+KMbA
d4ybojtm/+cjRELWzPgT1Stn3RrnsmWZOCtxFaAT3ch3lULcrqrwG5UOpGwL58We
AD5Dt7EY8+JzxC2ZjQajnUGrIb9AGmJ4Z32N/8Qpoqv5MLk4Ut+mKhb6eT5bc2Jz
Mc+J/Dcf7bpXQrQFHobWmiSOMlqqCfda4uQ5584klyppJkog92LLLx6f9PHWVDIm
pVX54KK3+IH+hKqD3fqlLaLXfR1siLWjqCjK+GipoA/f2775X/oYUktBcY8NJdhy
6twQIcEgyBSK8ZKQU9LYlJV62pDGskZ/0L0+f8wJBHDQLRTxahk6aGuWwYpmSVSa
JwNjW0zt+c/qPg45G592KuVc8UrpjPVy6nf5RMkAjZq07OJJnJXRDR3bSKQQKmAZ
Vz2g77Ocz9/QtpRfDeoyml+ZQ2BY2WWzgB7OpmDfKk2YmF2eD2i1iM9C/hECCV1Q
sLv4+Np1IMv1luJUD9d7KENGXYUIIavDBFRmAVyNoKMGllOS/SopI1Vnt2NBuOXZ
xhwxoQY5i35bls9h9G2PDdTwFTzTynR8v4k2WGDn4EQq1/XqWqg5t35YLiX+6Qdy
PVjVxpkwhGw/zvjTWcnWTRyuHMz1GROnnq54LINA358wxJQnjSE=
=ESCz
-----END PGP SIGNATURE-----

--ixg5sSvRJCmhsikm--
