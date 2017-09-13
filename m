From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 2/2] pylibfdt: Allow reading integer values from
 properties
Date: Wed, 13 Sep 2017 22:42:45 +1000
Message-ID: <20170913124245.GC3972@umbus.fritz.box>
References: <20170831104200.47974-1-sjg@chromium.org>
 <20170831104200.47974-2-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="S1BNGpv0yoYahz37"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1505307122;
        bh=xfpo0naNThYTqEs/Wlv8VFNgP8JfFmTbw6Cu3EbMsgs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PaDqHV2BA2zQtG6OSfu0HBxpYHbqITJi6OjXdKerwszDuXQ6iJZ3jHDyOHgZXfsfZ
         DsQ2Wlcxgq1vqG42jX9NhHJzZTSjSTXNE/Euxk5HJawY82JvS+ohlSjNoIJO+yXBUm
         lt3MajOfuFdLtxaJOPeeK8uaXri0dIK8K9ZCU4l8=
Content-Disposition: inline
In-Reply-To: <20170831104200.47974-2-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--S1BNGpv0yoYahz37
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 31, 2017 at 04:42:00AM -0600, Simon Glass wrote:
> Extend the Properties class with some functions to read a single integer
> property. Add a new getprop_obj() function to return a Property object
> instead of the raw data.
>=20
> This suggested approach can be extended to handle other types, as well as
> arrays.
>=20
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Sorry again I've taken so long to respond.

This way of doing it really seems awkward to me.  You're introducing a
clunky variant getter just to wrap the bytearray in an object,
essentially just to get conversion methods.

It seems to be simpler to just have as_cell() and whatnot as plain
functions that go straight from bytestring/bytearray to an int or
whatever.


Longer term, I did have an idea that might resolve the
propery-as-object or property-as-bytestring conundrum a bit more
satisfactorily.  But, I'm not entirely sure how you'd go about
implementing it with swig in the picture: it should be possible in
(modern) Python to make a Property object that's a sub-class of the
(byte)string type.  That way it can be used directly as though it were
a bytestring, but you can also add properties to do extra stuff.

[Which raises a minor detail, most of the functions which return
bytearray()s now should probably be returning strings - there doesn't
seem to be a reason to return a mutable object]
> ---
>=20
> Changes in v2: None
>=20
>  pylibfdt/libfdt.i       | 35 +++++++++++++++++++++++++++++++++++
>  tests/pylibfdt_tests.py | 12 ++++++++++++
>  tests/run_tests.sh      |  1 +
>  tests/test_props.dts    | 11 +++++++++++
>  4 files changed, 59 insertions(+)
>  create mode 100644 tests/test_props.dts
>=20
> diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> index f8e3a2c..4d60f90 100644
> --- a/pylibfdt/libfdt.i
> +++ b/pylibfdt/libfdt.i
> @@ -376,6 +376,26 @@ class Fdt:
>              return pdata
>          return bytearray(pdata[0])
> =20
> +    def getprop_obj(self, nodeoffset, prop_name, quiet=3D()):
> +        """Get a property from a node as a Property object
> +
> +        Args:
> +            nodeoffset: Node offset containing property to get
> +            prop_name: Name of property to get
> +            quiet: Errors to ignore (empty to raise on all errors)
> +
> +        Returns:
> +            Property object, or None if not found
> +
> +        Raises:
> +            FdtError if any error occurs (e.g. the property is not found)
> +        """
> +        pdata =3D check_err_null(fdt_getprop(self._fdt, nodeoffset, prop=
_name),
> +                               quiet)
> +        if isinstance(pdata, (int)):
> +            return None
> +        return Property(prop_name, bytearray(pdata[0]))
> +
>      def get_phandle(self, nodeoffset):
>          """Get the phandle of a node
> =20
> @@ -432,6 +452,21 @@ class Property:
>      def __init__(self, name, value):
>          self.name =3D name
>          self.value =3D value
> +
> +    def to_cell(self, fmt):
> +        return struct.unpack('>' + fmt, self.value)[0]
> +
> +    def to_uint32(self):
> +        return self.to_cell('L')
> +
> +    def to_int32(self):
> +        return self.to_cell('l')
> +
> +    def to_uint64(self):
> +        return self.to_cell('Q')
> +
> +    def to_int64(self):
> +        return self.to_cell('q')
>  %}
> =20
>  %rename(fdt_property) fdt_property_func;
> diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
> index 0ec0f38..fc5210b 100644
> --- a/tests/pylibfdt_tests.py
> +++ b/tests/pylibfdt_tests.py
> @@ -89,6 +89,7 @@ class PyLibfdtTests(unittest.TestCase):
>      def setUp(self):
>          """Read in the device tree we use for testing"""
>          self.fdt =3D _ReadFdt('test_tree1.dtb')
> +        self.fdt2 =3D _ReadFdt('test_props.dtb')
> =20
>      def GetPropList(self, node_path):
>          """Read a list of properties from a node
> @@ -330,6 +331,17 @@ class PyLibfdtTests(unittest.TestCase):
>          node2 =3D self.fdt.path_offset('/subnode@2/subsubnode@0')
>          self.assertEquals(node2, self.fdt.node_offset_by_phandle(0x2001))
> =20
> +    def get_prop(self, name):
> +        return self.fdt2.getprop_obj(0, name)
> +
> +    def testGetIntProperties(self):
> +        """Test that we can access properties as integers"""
> +        self.assertEquals(0xdeadbeef, self.get_prop("prop-hex32").to_uin=
t32())
> +        self.assertEquals(123, self.get_prop("prop-uint32").to_uint32())
> +        self.assertEquals(-2, self.get_prop("prop-int32").to_int32())
> +        self.assertEquals(9223372036854775807,
> +                          self.get_prop("prop-uint64").to_uint64())
> +        self.assertEquals(-2, self.get_prop("prop-int64").to_int64())
> =20
>  if __name__ =3D=3D "__main__":
>      unittest.main()
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index fa7b2f7..441e773 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -809,6 +809,7 @@ fdtoverlay_tests() {
>  }
> =20
>  pylibfdt_tests () {
> +    run_dtc_test -I dts -O dtb -o test_props.dtb test_props.dts
>      TMP=3D/tmp/tests.stderr.$$
>      python pylibfdt_tests.py -v 2> $TMP
> =20
> diff --git a/tests/test_props.dts b/tests/test_props.dts
> new file mode 100644
> index 0000000..7e59bd1
> --- /dev/null
> +++ b/tests/test_props.dts
> @@ -0,0 +1,11 @@
> +/dts-v1/;
> +
> +/ {
> +	compatible =3D "test_props";
> +	prop-hex32 =3D <0xdeadbeef>;
> +	prop-uint32 =3D <123>;
> +	prop-int32 =3D <0xfffffffe>;
> +	prop-hex64 =3D /bits/ 64 <0xdeadbeef01abcdef>;
> +	prop-uint64 =3D /bits/ 64 <9223372036854775807>;
> +	prop-int64 =3D /bits/ 64 <0xfffffffffffffffe>;
> +};

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--S1BNGpv0yoYahz37
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlm5J8EACgkQbDjKyiDZ
s5KbxQ//aDxHFE7+NmdwVq5BafmQWM8FukBtqonuv34K4SxMIkYTyYDJkE1b/04C
tKDr6bArBxWOtaCzY+CXJfCn9GZ92tEZMzcvOgKx2JdmNysmfWJ5n3R8IgOUkjcs
U8eeclSfa92DVQk/yIENnqnQ4UNm/rthUizmRhL7NJIKaDErpMeLBhyyZmkO7YxD
s6xtBCu5bWHtdzeuA2q3miTn1MOIUqamimM/z1BdrTnX7Hlv6/KMAAlcAKPqFuSl
Qs+w45LBq2NuJGDnUlJ+4r7HdEWCiRKoDOX2EX7vygNFV9LA2aBUsJdhyTqltx+s
pG6vz/0qE0pA7And0kWws09FAnVsjQMF5PKE2iPs/rEzDT7A8YrRHAl4gN/SrYEx
GwFRnTwLyiw12SCYQAYOnx+peNtVD+dtlWs/+dfTrzjbGF7gWoqQCrDMvL2PC/Ae
jwMqX/a5wHJufRSlqgJBcPYo2JVJPAEn96k8ga5yNhSWz5WqsNHRvHo6qX5Bwa1L
vaHTzysOCUQ9M5q842SUQVkcGAcdFGBZJY1NsiPCusslHi/6MvIuBbWIvjzxZMqm
xc0QjhMvhOLeA8GonRALr5Ge3pOtkXDobsjXLIy8N43eG1Z+BKIdAEqaBDnjj4gh
cNlN1MVwXA4H1zkXWw30B6shBgEBnhMiM46/rv7mQVwVmprlqgk=
=0B3o
-----END PGP SIGNATURE-----

--S1BNGpv0yoYahz37--
