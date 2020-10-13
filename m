From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 01/11] tests: Fix signedness comparisons warnings
Date: Tue, 13 Oct 2020 16:09:27 +1100
Message-ID: <20201013050927.GU71119@yekko.fritz.box>
References: <20201012161948.23994-1-andre.przywara@arm.com>
 <20201012161948.23994-2-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="QOa9dl9wYIBIim/b"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1602565786;
        bh=/MmfWNXLHbmhMZdVrhac09Tzfo9FOSsOVCsJa0MFU5g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=G9tu+8+yxS8DXF+Wu/cKIrf9weX7IFhliFknAy+3Cbkd5LWGIQZeVrd8yBe8LgcYh
         Yll9Upr1VveKXtUn1PbjQBuvTCzMLh3HgFxCsiFcr2DFx9OpQEE7ur0FAqpRduALvW
         4LBY81Taf6oD8muTG9WkP1PRVJ9gNZ9hEns4ZxkI=
Content-Disposition: inline
In-Reply-To: <20201012161948.23994-2-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--QOa9dl9wYIBIim/b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2020 at 05:19:38PM +0100, Andre Przywara wrote:
> With -Wsign-compare, compilers warn about a mismatching signedness in
> comparisons in various files in the tests/ directory.
>=20
> For about half of the cases we can simply change the signed variable to
> be of an unsigned type, because they will never need to store negative
> values (which is the best fix of the problem).
>=20
> In the remaining cases we can cast the signed variable to an unsigned
> type, provided we know for sure it is not negative.
> We see two different scenarios here:
> - We either just explicitly checked for this variable to be positive
>   (if (rc < 0) FAIL();), or
> - We rely on a function returning only positive values in the "length"
>   pointer if the function returned successfully: which we just checked.
>=20
> At two occassions we compare with a constant "-1" (even though the
> variable is unsigned), so we just change this to ~0U to create an
> unsigned comparison value.
>=20
> This fixes "make tests" (but not "make check" yet), when compiled
> with -Wsign-compare.
>=20
> Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>

Oof, this is a big one.

> ---
>  tests/dumptrees.c           | 2 +-
>  tests/fs_tree1.c            | 2 +-
>  tests/get_name.c            | 2 +-
>  tests/integer-expressions.c | 2 +-
>  tests/nopulate.c            | 3 ++-
>  tests/overlay.c             | 2 +-
>  tests/phandle_format.c      | 2 +-
>  tests/property_iterate.c    | 2 +-
>  tests/references.c          | 2 +-
>  tests/set_name.c            | 4 ++--
>  tests/subnode_iterate.c     | 2 +-
>  tests/tests.h               | 2 +-
>  tests/testutils.c           | 6 +++---
>  13 files changed, 17 insertions(+), 16 deletions(-)
>=20
> diff --git a/tests/dumptrees.c b/tests/dumptrees.c
> index aecb326..49ef525 100644
> --- a/tests/dumptrees.c
> +++ b/tests/dumptrees.c
> @@ -30,7 +30,7 @@ static struct {
> =20
>  int main(int argc, char *argv[])
>  {
> -	int i;
> +	unsigned int i;
> =20
>  	if (argc !=3D 2) {
>  	    fprintf(stderr, "Missing output directory argument\n");
> diff --git a/tests/fs_tree1.c b/tests/fs_tree1.c
> index dff3880..978f6a3 100644
> --- a/tests/fs_tree1.c
> +++ b/tests/fs_tree1.c
> @@ -54,7 +54,7 @@ static void mkfile(const char *name, void *data, size_t=
 len)
>  	rc =3D write(fd, data, len);
>  	if (rc < 0)
>  		FAIL("write(\"%s\"): %s", name, strerror(errno));
> -	if (rc !=3D len)
> +	if ((unsigned)rc !=3D len)
>  		FAIL("write(\"%s\"): short write", name);
>  =09
>  	rc =3D close(fd);
> diff --git a/tests/get_name.c b/tests/get_name.c
> index 5a35103..7b757ec 100644
> --- a/tests/get_name.c
> +++ b/tests/get_name.c
> @@ -39,7 +39,7 @@ static void check_name(void *fdt, const char *path)
>  		FAIL("fdt_get_name(%s) returned \"%s\" instead of \"%s\"",
>  		     path, getname, checkname);
> =20
> -	if (len !=3D strlen(getname))
> +	if ((unsigned)len !=3D strlen(getname))
>  		FAIL("fdt_get_name(%s) returned length %d instead of %zd",
>  		     path, len, strlen(getname));

So, here you're relying on fdt_get_name() returning NULL in all the
cases where it would return a negative len.  But.. this is test code,
so we should actually verify that, rather than just assume it, and
fail the test if len is negative here.

> diff --git a/tests/integer-expressions.c b/tests/integer-expressions.c
> index 6f33d81..2f164d9 100644
> --- a/tests/integer-expressions.c
> +++ b/tests/integer-expressions.c
> @@ -59,7 +59,7 @@ int main(int argc, char *argv[])
>  	void *fdt;
>  	const fdt32_t *res;
>  	int reslen;
> -	int i;
> +	unsigned int i;
> =20
>  	test_init(argc, argv);
> =20
> diff --git a/tests/nopulate.c b/tests/nopulate.c
> index 2ae1753..e06a0b3 100644
> --- a/tests/nopulate.c
> +++ b/tests/nopulate.c
> @@ -43,7 +43,8 @@ static int nopulate_struct(char *buf, const char *fdt)
>  int main(int argc, char *argv[])
>  {
>  	char *fdt, *fdt2, *buf;
> -	int newsize, struct_start, struct_end_old, struct_end_new, delta;
> +	int newsize, struct_end_old, struct_end_new, delta;
> +	unsigned int struct_start;
>  	const char *inname;
>  	char outname[PATH_MAX];
> =20
> diff --git a/tests/overlay.c b/tests/overlay.c
> index 91afa72..c96f6f2 100644
> --- a/tests/overlay.c
> +++ b/tests/overlay.c
> @@ -35,7 +35,7 @@ static int fdt_getprop_u32_by_poffset(void *fdt, const =
char *path,
>  		return node_off;
> =20
>  	val =3D fdt_getprop(fdt, node_off, name, &len);
> -	if (!val || (len < (sizeof(uint32_t) * (poffset + 1))))
> +	if (!val || ((unsigned)len < (sizeof(uint32_t) * (poffset + 1))))


Likewise here, we should extend the test to explicitly verify than len
>=3D 0 in the !!val case.

>  		return -FDT_ERR_NOTFOUND;
> =20
>  	*out =3D fdt32_to_cpu(*(val + poffset));
> diff --git a/tests/phandle_format.c b/tests/phandle_format.c
> index d00618f..0febb32 100644
> --- a/tests/phandle_format.c
> +++ b/tests/phandle_format.c
> @@ -45,7 +45,7 @@ int main(int argc, char *argv[])
>  		FAIL("fdt_path_offset(/node4): %s", fdt_strerror(n4));
> =20
>  	h4 =3D fdt_get_phandle(fdt, n4);
> -	if ((h4 =3D=3D 0) || (h4 =3D=3D -1))
> +	if ((h4 =3D=3D 0) || (h4 =3D=3D ~0U))

I'm wondering if we should actually add an exported (inline) function
to libfdt to do this test, since things like this are changed in a
couple of places through this series.

>  		FAIL("/node4 has bad phandle 0x%x\n", h4);
> =20
>  	if (phandle_format & PHANDLE_LEGACY)
> diff --git a/tests/property_iterate.c b/tests/property_iterate.c
> index 9a67f49..0b6af9b 100644
> --- a/tests/property_iterate.c
> +++ b/tests/property_iterate.c
> @@ -23,7 +23,7 @@ static void test_node(void *fdt, int parent_offset)
>  	uint32_t properties;
>  	const fdt32_t *prop;
>  	int offset, property;
> -	int count;
> +	unsigned int count;
>  	int len;
> =20
>  	/*
> diff --git a/tests/references.c b/tests/references.c
> index d18e722..cb1daaa 100644
> --- a/tests/references.c
> +++ b/tests/references.c
> @@ -106,7 +106,7 @@ int main(int argc, char *argv[])
>  	if ((h4 =3D=3D 0x2000) || (h4 =3D=3D 0x1) || (h4 =3D=3D 0))
>  		FAIL("/node4 has bad phandle, 0x%x", h4);
> =20
> -	if ((h5 =3D=3D 0) || (h5 =3D=3D -1))
> +	if ((h5 =3D=3D 0) || (h5 =3D=3D ~0U))
>  		FAIL("/node5 has bad phandle, 0x%x", h5);
>  	if ((h5 =3D=3D h4) || (h5 =3D=3D h2) || (h5 =3D=3D h1))
>  		FAIL("/node5 has duplicate phandle, 0x%x", h5);
> diff --git a/tests/set_name.c b/tests/set_name.c
> index a62cb58..cd2b9aa 100644
> --- a/tests/set_name.c
> +++ b/tests/set_name.c
> @@ -39,7 +39,7 @@ static void check_set_name(void *fdt, const char *path,=
 const char *newname)
>  		FAIL("fdt_get_name(%s) returned \"%s\" instead of \"%s\"",
>  		     path, getname, oldname);
> =20
> -	if (len !=3D strlen(getname))
> +	if ((unsigned)len !=3D strlen(getname))
>  		FAIL("fdt_get_name(%s) returned length %d instead of %zd",
>  		     path, len, strlen(getname));
> =20
> @@ -56,7 +56,7 @@ static void check_set_name(void *fdt, const char *path,=
 const char *newname)
>  		FAIL("fdt_get_name(%s) returned \"%s\" instead of \"%s\"",
>  		     path, getname, newname);
> =20
> -	if (len !=3D strlen(getname))
> +	if ((unsigned)len !=3D strlen(getname))

Again, add explicit negative check.

>  		FAIL("fdt_get_name(%s) returned length %d instead of %zd",
>  		     path, len, strlen(getname));
>  }
> diff --git a/tests/subnode_iterate.c b/tests/subnode_iterate.c
> index 2dc9b2d..2553a51 100644
> --- a/tests/subnode_iterate.c
> +++ b/tests/subnode_iterate.c
> @@ -23,7 +23,7 @@ static void test_node(void *fdt, int parent_offset)
>  	uint32_t subnodes;
>  	const fdt32_t *prop;
>  	int offset;
> -	int count;
> +	unsigned int count;
>  	int len;
> =20
>  	/* This property indicates the number of subnodes to expect */
> diff --git a/tests/tests.h b/tests/tests.h
> index 1017366..bf8f23c 100644
> --- a/tests/tests.h
> +++ b/tests/tests.h
> @@ -83,7 +83,7 @@ void cleanup(void);
>  void check_mem_rsv(void *fdt, int n, uint64_t addr, uint64_t size);
> =20
>  void check_property(void *fdt, int nodeoffset, const char *name,
> -		    int len, const void *val);
> +		    unsigned int len, const void *val);
>  #define check_property_cell(fdt, nodeoffset, name, val) \
>  	({ \
>  		fdt32_t x =3D cpu_to_fdt32(val);			      \
> diff --git a/tests/testutils.c b/tests/testutils.c
> index 5e494c5..ff215fc 100644
> --- a/tests/testutils.c
> +++ b/tests/testutils.c
> @@ -88,7 +88,7 @@ void check_mem_rsv(void *fdt, int n, uint64_t addr, uin=
t64_t size)
>  }
> =20
>  void check_property(void *fdt, int nodeoffset, const char *name,
> -		    int len, const void *val)
> +		    unsigned int len, const void *val)
>  {
>  	const struct fdt_property *prop;
>  	int retlen, namelen;
> @@ -112,13 +112,13 @@ void check_property(void *fdt, int nodeoffset, cons=
t char *name,
>  	propname =3D fdt_get_string(fdt, nameoff, &namelen);
>  	if (!propname)
>  		FAIL("Couldn't get property name: %s", fdt_strerror(namelen));
> -	if (namelen !=3D strlen(propname))
> +	if ((unsigned)namelen !=3D strlen(propname))


And here.
>  		FAIL("Incorrect prop name length: %d instead of %zd",
>  		     namelen, strlen(propname));
>  	if (!streq(propname, name))
>  		FAIL("Property name mismatch \"%s\" instead of \"%s\"",
>  		     propname, name);
> -	if (proplen !=3D retlen)
> +	if (proplen !=3D (unsigned)retlen)

And here.

>  		FAIL("Length retrieved for \"%s\" by fdt_get_property()"
>  		     " differs from stored length (%d !=3D %d)",
>  		     name, retlen, proplen);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--QOa9dl9wYIBIim/b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+FNocACgkQbDjKyiDZ
s5LnYxAA5avPKAeCb/i8ihh5JIwX5BcfAwMP+2dmtdPWuXmHJNVO/qVAJowqmeOW
9/zYYykYk5pXHItx54jF0IvcbqDFAVNBMtJgcto18RELu9EwRQX3NxdIvFeBNUjv
CVBgxhG6koJNDfZRoBZrBsiF4tbq3WeRM8xT3e10L0/s1peMlNNxDPsw96i70yiJ
uD9sXpblbI/XjLFTeMq+fNEOGahtLMteWy2YWxzinNCPrll+VUBdcbkZQsfc4HkI
GsY4rloRkF6y0kxe8YM8AkQ3u6F7E9+VTWbGLbazBI88DL+IlYFXIPkvwLi4zknS
GBICO8f4BiN8oyHvbZ8QQB2p5noA9TXJoV48gSALVMCC3YUfkmHrrDXOXCKhlOif
6psZiiwxleB9vWyJhLOx05ghB1BDJ7wSylrMlZt/JTU+sXSWPLWJC1eQrRBCzR5E
Tjcv22c/h+b5+3r3oaIurzEyb+D+QPwed9Faj7Aek23FcwKI/YoSEMOWsWDG9r/a
LGUCPG2QFyAkb6GyPccW55tDrfgZpVnnhXwR1Cb2VBwxvA0A/NckwIcs0VDMDsCC
uycqR+vJIRqe9Ou6y6/pONrOmHh453GUZJ9CXwBrctRe16q564Nb7daSUiBCCC/H
TbmK0mBOhlJvV1lSHjJt0CNp7ZL2/+YiREw0g1yS7PDwFlZFY3A=
=p2ko
-----END PGP SIGNATURE-----

--QOa9dl9wYIBIim/b--
