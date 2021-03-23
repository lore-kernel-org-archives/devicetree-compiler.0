From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v3 2/2] libfdt: Check that the root-node name is empty
Date: Tue, 23 Mar 2021 12:13:33 +1100
Message-ID: <YFlAvRrZlDsCanVM@yekko.fritz.box>
References: <20210323010410.3222701-2-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="5s2xFoGy6ZE9ECW2"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1616465616;
        bh=F4yb7ePAMi4kugkgKHv5Fj8EB9nOJTq1vlVaTvUJexQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WHFomkIuD90L20c9buoU1nD2kFnKNlXmTVSLH9W1e6GG6hm8RXeACIixb31B1YKZr
         rdbMRTuDhjoLnAwo7HtxUOoFLqZN3wwTqVCQrpgNj0MZ2iqCF4+NheLGWoKn76N+Gg
         sKXO6gQsQ7LVKIeGDfxTTiJPa8tOlteZunAAWjgI=
Content-Disposition: inline
In-Reply-To: <20210323010410.3222701-2-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arie Haenel <arie.haenel-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Julien Lenoir <julien.lenoir-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>


--5s2xFoGy6ZE9ECW2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 23, 2021 at 02:04:10PM +1300, Simon Glass wrote:
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

Applied, thanks.

> ---
>=20
> Changes in v3:
> - Add to run_tests.sh also
>=20
> Changes in v2:
> - Use FDT_ERR_BADSTRUCTURE instead of FDT_ERR_BADLAYOUT
>=20
>  libfdt/fdt_check.c   | 10 ++++++++++
>  tests/Makefile.tests |  2 +-
>  tests/dumptrees.c    |  3 ++-
>  tests/run_tests.sh   |  2 +-
>  tests/testdata.h     |  1 +
>  tests/trees.S        | 15 +++++++++++++++
>  6 files changed, 30 insertions(+), 3 deletions(-)
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
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index 82543fc..5c2b1e8 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -518,7 +518,7 @@ libfdt_tests () {
>  	run_test check_full $good
>      done
>      for bad in truncated_property.dtb truncated_string.dtb \
> -		truncated_memrsv.dtb two_roots.dtb; do
> +		truncated_memrsv.dtb two_roots.dtb named_root.dtb; do
>  	run_test check_full -n $bad
>      done
>  }
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

--5s2xFoGy6ZE9ECW2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBZQL0ACgkQbDjKyiDZ
s5JEKg//T7qC3DWy7ugauyPaUQrwdWbc58ASb8pdDEVZlaUb7b9pVpso3xvqIT/k
l8SaerzRzVmRdsyZye968oYQEWJWgz1daiyVf12SrWkNG3QJOnR33bi0K/g0OhJ9
/hmadZ4lTOrzYGkri+tf4v+GKMxktYkeLZgzKVHMaf/mzu3E34gW2DcmbEhSkYI1
m9qgHKaGasLUhGbxvN6D2+X9SzkfP5XEhjdZ1Y/2Ev0sro2kEwSFpjg4edNxm9kV
zZEcHhiGh2HR5k2x0+geQ32zWQOCQR2pn1nhlR7mjde6GMf5H6FeeBYbOt7cO1/F
0QUVlxJ3JkHlCvutxII15knyiNpLnumEkBraOYzEA3bBeKE87MwJTSizHn/M1+t2
NVpLiwqmSC8EUXdc1Pyaq2rwBPYBNnNOtLgVMc2AkUim/lY67sqrzdI64ripcUwR
jMBA6BX+Q4cWxH7sUa089wwW49fJh7l0qlKosCxHvytWoZX06KeCZ5MB2w+FvOMl
0NQaqSPdWF3O6kiHqdyIamUhvx8rhxNMIW2AOJwmxl9xDnrQ/dzQWCjeAIQ+Rwfb
d6imeeClU868/BjPdz3lcGlU9WftvSGNZkDj8NH8eFOVJt1NCiY2JhJwe71FWDQ+
mx6lbtE0p5dAYUUSaJIFgtBMOIGQNCqgWHxxJHIOmDwPBu+c5b8=
=x4bP
-----END PGP SIGNATURE-----

--5s2xFoGy6ZE9ECW2--
