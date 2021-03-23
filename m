From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/2] libfdt: Check that there is only one root node
Date: Tue, 23 Mar 2021 11:03:24 +1100
Message-ID: <YFkwTPHK1gaY7qVj@yekko.fritz.box>
References: <20210322231941.3202986-1-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vy9I4BKelVwBqsSC"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1616457837;
        bh=SJqu73kDfL7jB2JJvPazPEDQ8UbZQJAl7LxhbtNocXI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fXTc52m5LemevB6r5iQy+5MGR2Ifw5mP2WYsf4lSidR0WhryJf1+eNXVYyGbkBrfw
         lRokZCvtRTuNaWPoHZIYDAehS2C75ZfshmRJGnykNGJF+7fxvwWrpGPMB4mRnsaxn5
         18lr+2qKU6uGrs8xJpnFFef3O4IjU4ckOzO1bG6w=
Content-Disposition: inline
In-Reply-To: <20210322231941.3202986-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arie Haenel <arie.haenel-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Julien Lenoir <julien.lenoir-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>


--vy9I4BKelVwBqsSC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 23, 2021 at 12:19:40PM +1300, Simon Glass wrote:
> At present it is possible to have two root nodes and even access nodes
> in the 'second' root. Such trees should not be considered valid. This
> was discovered as part of a security investigation into U-Boot verified
> boot.
>=20
> Add a check for this to fdt_check_full().
>=20
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Reported-by: Arie Haenel <arie.haenel-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> Reported-by: Julien Lenoir <julien.lenoir-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> ---
>=20
>  libfdt/fdt_check.c   |  7 +++++++
>  tests/Makefile.tests |  4 +++-
>  tests/dumptrees.c    |  1 +
>  tests/run_tests.sh   |  2 +-
>  tests/testdata.h     |  1 +
>  tests/trees.S        | 19 +++++++++++++++++++
>  6 files changed, 32 insertions(+), 2 deletions(-)
>=20
> diff --git a/libfdt/fdt_check.c b/libfdt/fdt_check.c
> index 9ddfdbf..84870a5 100644
> --- a/libfdt/fdt_check.c
> +++ b/libfdt/fdt_check.c
> @@ -19,6 +19,7 @@ int fdt_check_full(const void *fdt, size_t bufsize)
>  	unsigned int depth =3D 0;
>  	const void *prop;
>  	const char *propname;
> +	bool expect_end =3D false;
> =20
>  	if (bufsize < FDT_V1_SIZE)
>  		return -FDT_ERR_TRUNCATED;
> @@ -41,6 +42,10 @@ int fdt_check_full(const void *fdt, size_t bufsize)
>  		if (nextoffset < 0)
>  			return nextoffset;
> =20
> +		/* If we see two root nodes, something is wrong */
> +		if (expect_end && tag !=3D FDT_END)
> +			return -FDT_ERR_BADLAYOUT;

This should be -FDT_ERR_BADSTRUCTURE (since it's an error in the
format of the structure block), but otherwise this patch LGTM.

> +
>  		switch (tag) {
>  		case FDT_NOP:
>  			break;
> @@ -60,6 +65,8 @@ int fdt_check_full(const void *fdt, size_t bufsize)
>  			if (depth =3D=3D 0)
>  				return -FDT_ERR_BADSTRUCTURE;
>  			depth--;
> +			if (depth =3D=3D 0)
> +				expect_end =3D true;
>  			break;
> =20
>  		case FDT_PROP:
> diff --git a/tests/Makefile.tests b/tests/Makefile.tests
> index cb66c9f..fe5cae8 100644
> --- a/tests/Makefile.tests
> +++ b/tests/Makefile.tests
> @@ -32,7 +32,9 @@ LIB_TESTS_L =3D get_mem_rsv \
>  	fs_tree1
>  LIB_TESTS =3D $(LIB_TESTS_L:%=3D$(TESTS_PREFIX)%)
> =20
> -LIBTREE_TESTS_L =3D truncated_property truncated_string truncated_memrsv
> +LIBTREE_TESTS_L =3D truncated_property truncated_string truncated_memrsv=
 \
> +	two_roots
> +
>  LIBTREE_TESTS =3D $(LIBTREE_TESTS_L:%=3D$(TESTS_PREFIX)%)
> =20
>  DL_LIB_TESTS_L =3D asm_tree_dump value-labels
> diff --git a/tests/dumptrees.c b/tests/dumptrees.c
> index aecb326..02ca092 100644
> --- a/tests/dumptrees.c
> +++ b/tests/dumptrees.c
> @@ -24,6 +24,7 @@ static struct {
>  	TREE(ovf_size_strings),
>  	TREE(truncated_property), TREE(truncated_string),
>  	TREE(truncated_memrsv),
> +	TREE(two_roots)
>  };
> =20
>  #define NUM_TREES	(sizeof(trees) / sizeof(trees[0]))
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index 4b8dada..82543fc 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -518,7 +518,7 @@ libfdt_tests () {
>  	run_test check_full $good
>      done
>      for bad in truncated_property.dtb truncated_string.dtb \
> -				      truncated_memrsv.dtb; do
> +		truncated_memrsv.dtb two_roots.dtb; do
>  	run_test check_full -n $bad
>      done
>  }
> diff --git a/tests/testdata.h b/tests/testdata.h
> index 0d08efb..d03f352 100644
> --- a/tests/testdata.h
> +++ b/tests/testdata.h
> @@ -55,4 +55,5 @@ extern struct fdt_header bad_prop_char;
>  extern struct fdt_header ovf_size_strings;
>  extern struct fdt_header truncated_string;
>  extern struct fdt_header truncated_memrsv;
> +extern struct fdt_header two_roots;
>  #endif /* ! __ASSEMBLY */
> diff --git a/tests/trees.S b/tests/trees.S
> index efab287..e2380b7 100644
> --- a/tests/trees.S
> +++ b/tests/trees.S
> @@ -279,3 +279,22 @@ truncated_memrsv_rsvmap:
>  truncated_memrsv_rsvmap_end:
> =20
>  truncated_memrsv_end:
> +
> +
> +        /* two root nodes */
> +        TREE_HDR(two_roots)
> +	EMPTY_RSVMAP(two_roots)
> +
> +two_roots_struct:
> +	BEGIN_NODE("")
> +	END_NODE
> +	BEGIN_NODE("")
> +	END_NODE
> +	FDTLONG(FDT_END)
> +two_roots_struct_end:
> +
> +two_roots_strings:
> +two_roots_strings_end:
> +
> +two_roots_end:
> +

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--vy9I4BKelVwBqsSC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBZMEwACgkQbDjKyiDZ
s5LGYhAAqXXIJKzwGZ7inzulOuOGf+ZmUfNjPPjH7l3u/Gnr8rfMmWQA1y2RJjeT
IirOf1P2LU5qjb2GZESll6yWkaEpRaHTFkjlGNuzPHPZTIZ+HMoBuBKWIMmk+wQZ
vsL7io39VR4UU2h2mfgQnhzSpG6WkBnpsMXFci/mwvL+7IDs1Avtw02b+U+gRXGv
mbNNmUqQ27QupRi6mxKAgW+7gj7m1mDjcE1hGflCSwhNYGeC2yUNsS8U4GOY3Be5
ULwO3EFHmB/lA1QA5AYYnXVcpnEvo8AB8UIgUWLUAWFgMbySxlB5C1nbMCol3ywM
PrlWM0e1noTbkhNt0sTvKxEq7BoGN8Q/xtjVpem3oPIjjTjklh4rTnZCjqPfmWoW
XngIDGJnHROauhJgt3oXfl7TSYmKSeAM3rywBCAqC/4Jtc2jlQsTpDLeE+SyUPEW
JdSivh+EtPBEI6yUxgMbVzFIDTPUe06Yx02eCSnqApZPx15GHp01/Ziy6Ud6SCYH
MRZNWG5KBYrAKh8VIFd6O81s4z5tio+3cQRjwMo5fRCK5fohDxxM6ixF070VMWRU
gr1iQMbMs8dVqQXQgrswJletAi+J+PBqdxMphUX5JMN2x9r2WzzjBegPh8Ns/3E0
BrdCCfdKZ+QVk+obzh3H0Ha6MbGVc3IxnhDf/1ezzS/be5PEsAE=
=gM2S
-----END PGP SIGNATURE-----

--vy9I4BKelVwBqsSC--
