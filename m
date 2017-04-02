From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v3] Add a libfdt function to write a property placeholder
Date: Sun, 2 Apr 2017 16:05:06 +1000
Message-ID: <20170402060506.GB16790@umbus.fritz.box>
References: <20170401153141.1706-1-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="uQr8t48UFsdbeI+V"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1491114918;
        bh=9AKplWdcvfvkutdbNieXcSaWRHx2eXaKvoSCrbariPs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MPxPJEG5S5Gs+7WX1myWMZZCSjeGG+AXS9icgLxKeBguixQJ4AWs0CQl0rjE5cUIf
         wgfwnFjhYf/8FeZuF50O66c+p+mf6z0O3Fj83FbZnh4ACHSyrHpJHs532a6wOMNW1Q
         HorcCH2rUJVAurzAV3pXTejSs3kR6/zQK5CY54zA=
Content-Disposition: inline
In-Reply-To: <20170401153141.1706-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--uQr8t48UFsdbeI+V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 01, 2017 at 09:31:41AM -0600, Simon Glass wrote:
> The existing function to add a new property to a tree being built requires
> that the entire contents of the new property be passed in. For some
> applications it is more convenient to be able to add the property contents
> later, perhaps by reading from a file. This avoids double-buffering of the
> contents.
>=20
> Add a new function to support this and adjust the existing fdt_property()=
 to
> use it.
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Seems reasonable, applied.

> ---
>=20
> Changes in v3:
> - Rebase to master
>=20
> Changes in v2:
> - Add tests
> - Rename the function to fdt_property_placeholder()
>=20
>  libfdt/fdt_sw.c                    | 16 ++++++++++++++--
>  libfdt/libfdt.h                    | 16 ++++++++++++++++
>  tests/include7.dts                 |  1 +
>  tests/sw_tree1.c                   |  5 +++++
>  tests/test_tree1.dts               |  1 +
>  tests/test_tree1_label_noderef.dts |  1 +
>  tests/trees.S                      |  2 ++
>  7 files changed, 40 insertions(+), 2 deletions(-)
>=20
> diff --git a/libfdt/fdt_sw.c b/libfdt/fdt_sw.c
> index 6a80485..2bd15e7 100644
> --- a/libfdt/fdt_sw.c
> +++ b/libfdt/fdt_sw.c
> @@ -220,7 +220,7 @@ static int _fdt_find_add_string(void *fdt, const char=
 *s)
>  	return offset;
>  }
> =20
> -int fdt_property(void *fdt, const char *name, const void *val, int len)
> +int fdt_property_placeholder(void *fdt, const char *name, int len, void =
**valp)
>  {
>  	struct fdt_property *prop;
>  	int nameoff;
> @@ -238,7 +238,19 @@ int fdt_property(void *fdt, const char *name, const =
void *val, int len)
>  	prop->tag =3D cpu_to_fdt32(FDT_PROP);
>  	prop->nameoff =3D cpu_to_fdt32(nameoff);
>  	prop->len =3D cpu_to_fdt32(len);
> -	memcpy(prop->data, val, len);
> +	*valp =3D prop->data;
> +	return 0;
> +}
> +
> +int fdt_property(void *fdt, const char *name, const void *val, int len)
> +{
> +	void *ptr;
> +	int ret;
> +
> +	ret =3D fdt_property_placeholder(fdt, name, len, &ptr);
> +	if (ret)
> +		return ret;
> +	memcpy(ptr, val, len);
>  	return 0;
>  }
> =20
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> index 2c9ddb4..a248b1b 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -1314,6 +1314,22 @@ static inline int fdt_property_cell(void *fdt, con=
st char *name, uint32_t val)
>  {
>  	return fdt_property_u32(fdt, name, val);
>  }
> +
> +/**
> + * fdt_property_placeholder - add a new property and return a ptr to its=
 value
> + *
> + * @fdt: pointer to the device tree blob
> + * @name: name of property to add
> + * @len: length of property value in bytes
> + * @valp: returns a pointer to where where the value should be placed
> + *
> + * returns:
> + *	0, on success
> + *	-FDT_ERR_BADMAGIC,
> + *	-FDT_ERR_NOSPACE, standard meanings
> + */
> +int fdt_property_placeholder(void *fdt, const char *name, int len, void =
**valp);
> +
>  #define fdt_property_string(fdt, name, str) \
>  	fdt_property(fdt, name, str, strlen(str)+1)
>  int fdt_end_node(void *fdt);
> diff --git a/tests/include7.dts b/tests/include7.dts
> index 2f6eb89..ab2c948 100644
> --- a/tests/include7.dts
> +++ b/tests/include7.dts
> @@ -5,6 +5,7 @@
> =20
>  		subsubnode {
>  			compatible =3D "subsubnode1", "subsubnode";
> +			placeholder =3D "this is a placeholder string", "string2";
>  			prop-int =3D <0xdeadbeef>;
>  		};
> =20
> diff --git a/tests/sw_tree1.c b/tests/sw_tree1.c
> index 4887dc3..6a338fc 100644
> --- a/tests/sw_tree1.c
> +++ b/tests/sw_tree1.c
> @@ -85,6 +85,9 @@ int main(int argc, char *argv[])
>  	size_t size;
>  	int err;
>  	bool created =3D false;
> +	void *place;
> +	const char place_str[] =3D "this is a placeholder string\0string2";
> +	int place_len =3D sizeof(place_str);
> =20
>  	test_init(argc, argv);
> =20
> @@ -135,6 +138,8 @@ int main(int argc, char *argv[])
>  	CHECK(fdt_begin_node(fdt, "subsubnode"));
>  	CHECK(fdt_property(fdt, "compatible", "subsubnode1\0subsubnode",
>  			   23));
> +	CHECK(fdt_property_placeholder(fdt, "placeholder", place_len, &place));
> +	memcpy(place, place_str, place_len);
>  	CHECK(fdt_property_cell(fdt, "prop-int", TEST_VALUE_1));
>  	CHECK(fdt_end_node(fdt));
>  	CHECK(fdt_begin_node(fdt, "ss1"));
> diff --git a/tests/test_tree1.dts b/tests/test_tree1.dts
> index 67ecfd0..77ea325 100644
> --- a/tests/test_tree1.dts
> +++ b/tests/test_tree1.dts
> @@ -18,6 +18,7 @@
> =20
>  		subsubnode {
>  			compatible =3D "subsubnode1", "subsubnode";
> +			placeholder =3D "this is a placeholder string", "string2";
>  			prop-int =3D <0xdeadbeef>;
>  		};
> =20
> diff --git a/tests/test_tree1_label_noderef.dts b/tests/test_tree1_label_=
noderef.dts
> index b2b194c..cfe5946 100644
> --- a/tests/test_tree1_label_noderef.dts
> +++ b/tests/test_tree1_label_noderef.dts
> @@ -18,6 +18,7 @@
> =20
>  		subsubnode {
>  			compatible =3D "subsubnode1", "subsubnode";
> +			placeholder =3D "this is a placeholder string", "string2";
>  			prop-int =3D <0xdeadbeef>;
>  		};
> =20
> diff --git a/tests/trees.S b/tests/trees.S
> index 3d24aa2..9854d1d 100644
> --- a/tests/trees.S
> +++ b/tests/trees.S
> @@ -102,6 +102,7 @@ test_tree1_struct:
> =20
>  	BEGIN_NODE("subsubnode")
>  	PROP_STR(test_tree1, compatible, "subsubnode1\0subsubnode")
> +	PROP_STR(test_tree1, placeholder, "this is a placeholder string\0string=
2")
>  	PROP_INT(test_tree1, prop_int, TEST_VALUE_1)
>  	END_NODE
> =20
> @@ -141,6 +142,7 @@ test_tree1_strings:
>  	STRING(test_tree1, linux_phandle, "linux,phandle")
>  	STRING(test_tree1, phandle, "phandle")
>  	STRING(test_tree1, reg, "reg")
> +	STRING(test_tree1, placeholder, "placeholder")
>  	STRING(test_tree1, address_cells, "#address-cells")
>  	STRING(test_tree1, size_cells, "#size-cells")
>  test_tree1_strings_end:

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--uQr8t48UFsdbeI+V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJY4JSQAAoJEGw4ysog2bOSQtoP/A/c0NcdDTAFCxQEhE5rvnvf
9lhWK4J5WtlY8OAYFeSJohsld79/0gqkzhlkAibRZ9pH7n6e2cZs3Zl93/SjpC4B
uIeb4JZq9CcwgIB8Pq0uMvpvNK7rO9g76JTe6t8LYDESb3mqiWF8/VTwCvCHd/7D
/97avPUbOnLyrNWwyF4Kkzabi7nrZvpshAb79qAhq2B2i6WqRGxgikImMgLqGIC4
KJ5E3W+nvvLQmP1DIvLUGOHKXw7oPWz8duVT8hiz6qiK9d44rm5p7nO6LcApQ5pN
OtcJ0iAdFkjE0lFNdMAof1I8JY2GSPIeIWwntLOD4fpEV3FZtGYNiDTkN4ahTlFT
GWJ22EiLv4b1AqdeeNP54Ah7vtAkBTSVJQZlPTayaDoQHmqmSi/KBoRv/IUNs8hR
o6Cw/89JkBV3AXgdYRRRYAJtqLb0UjANSU580KRNfgXV9F8INXrHf/0TA/u14IEd
xCdq+SqjsHTD39IOVzNySD7vhBjh1+CNQF/DapeCRp4qI5R3gHfqfe35p+lz56u0
YnTHCRmUa1rECAMhj6jjH2J+IsisjLWaNlCMCrafuVs7qt/Gm0bhS66nv731m3F4
LVbmMzgWFMedR26L0Ok4p/MWl8DqjNCCak1hSVX7xKFdlUB+lhu2N29+tBiH9gf0
MbxgPBEp2doUPoK9T/UO
=0Ocj
-----END PGP SIGNATURE-----

--uQr8t48UFsdbeI+V--
