From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 2/4] pylibfdt: add Property.as_*int*_array()
Date: Tue, 28 Dec 2021 15:30:51 +1100
Message-ID: <YcqS++UZtf+tSumt@yekko>
References: <20211225132558.167123-1-luca@z3ntu.xyz>
 <20211225132558.167123-3-luca@z3ntu.xyz>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ZSy0nCNjt/0qKjd7"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1640678762;
        bh=qScvLTWzagNw7vcJ0Cxk971Sn0am99EYeLScffUyQjg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QhTPY/e64BHydVX4mHn7gcRp9VEBhZFvuaZzzLusMmoLgf44Aa7t5LZoQHzjqyCNf
         bGdj05kwqYbNZaaSxJsmxoxAN/gbkUC6NSooPEspchy8wkZqUmK5QiJBHIWowdwVGz
         6O+KdscQhQccYa8WrpZdp9hcltRTdKi9wmuHDp9c=
Content-Disposition: inline
In-Reply-To: <20211225132558.167123-3-luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--ZSy0nCNjt/0qKjd7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 25, 2021 at 02:25:56PM +0100, Luca Weiss wrote:
> Add new methods to handle decoding of int32, uint32, int64 and uint64
> arrays.
>=20
> Also add tests for the new methods.
>=20
> Signed-off-by: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>

Applied, thanks.

> ---
>  pylibfdt/libfdt.i       | 15 +++++++++++++++
>  tests/pylibfdt_tests.py | 11 +++++++++++
>  tests/test_props.dts    |  4 ++++
>  3 files changed, 30 insertions(+)
>=20
> diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> index c81b504..ac70762 100644
> --- a/pylibfdt/libfdt.i
> +++ b/pylibfdt/libfdt.i
> @@ -716,6 +716,21 @@ class Property(bytearray):
>      def as_int64(self):
>          return self.as_cell('q')
> =20
> +    def as_list(self, fmt):
> +        return list(map(lambda x: x[0], struct.iter_unpack('>' + fmt, se=
lf)))
> +
> +    def as_uint32_list(self):
> +        return self.as_list('L')
> +
> +    def as_int32_list(self):
> +        return self.as_list('l')
> +
> +    def as_uint64_list(self):
> +        return self.as_list('Q')
> +
> +    def as_int64_list(self):
> +        return self.as_list('q')
> +
>      def as_str(self):
>          """Unicode is supported by decoding from UTF-8"""
>          if self[-1] !=3D 0:
> diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
> index 7e3cc4c..5479363 100644
> --- a/tests/pylibfdt_tests.py
> +++ b/tests/pylibfdt_tests.py
> @@ -382,6 +382,17 @@ class PyLibfdtBasicTests(unittest.TestCase):
>                            self.get_prop("prop-uint64").as_uint64())
>          self.assertEqual(-2, self.get_prop("prop-int64").as_int64())
> =20
> +    def testGetIntListProperties(self):
> +        """Test that we can access properties as integer lists"""
> +        self.assertEqual([128, -16, -2],
> +                         self.get_prop("prop-int32-array").as_int32_list=
())
> +        self.assertEqual([0x1, 0x98765432, 0xdeadbeef],
> +                         self.get_prop("prop-uint32-array").as_uint32_li=
st())
> +        self.assertEqual([0x100000000, -2],
> +                         self.get_prop("prop-int64-array").as_int64_list=
())
> +        self.assertEqual([0x100000000, 0x1],
> +                         self.get_prop("prop-uint64-array").as_uint64_li=
st())
> +
>      def testGetStringlistProperties(self):
>          """Test that we can access properties as string list"""
>          node =3D self.fdt.path_offset('/subnode@1/subsubnode')
> diff --git a/tests/test_props.dts b/tests/test_props.dts
> index 7e59bd1..5089023 100644
> --- a/tests/test_props.dts
> +++ b/tests/test_props.dts
> @@ -8,4 +8,8 @@
>  	prop-hex64 =3D /bits/ 64 <0xdeadbeef01abcdef>;
>  	prop-uint64 =3D /bits/ 64 <9223372036854775807>;
>  	prop-int64 =3D /bits/ 64 <0xfffffffffffffffe>;
> +	prop-int32-array =3D <128>, <(-16)>, <0xfffffffe>;
> +	prop-uint32-array =3D <0x1>, <0x98765432>, <0xdeadbeef>;
> +	prop-int64-array =3D /bits/ 64 <0x100000000 0xfffffffffffffffe>;
> +	prop-uint64-array =3D /bits/ 64 <0x100000000 0x1>;
>  };

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ZSy0nCNjt/0qKjd7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmHKkvsACgkQbDjKyiDZ
s5JHixAAlN+4HhWOxoXJ38rf0cPdQzXFfsvAtmSeNHTzEda94RV8lzQ/EG1mnGp8
Pplq3py7hrFB3Rp9u9sp97uWc0jGsHaxFZnsYxN+250tHgC3rAth56YQKn4QrNYA
uiZJIxMAVlsBb/X6+YbbOV3yjAfACR1RNAoglb7nOtWloA/4c890JF/2j5LL0dqk
LJ/cRVQYfBj1rohW7YUCgLxYCK8QQrYexLtrbEHjnu/4dOstKaBozSvqlDhBhGhE
R6VNdVa1L0rTyr8g1mGU3UCJS1sSgceyPGQDOUdOUo8P0tfCxAtTNO0FVXZbf7kZ
+uReMyvj9CQvgKChStKffZcI8hYw9iwp1iesXgV5f5r1ZCYBtwBH3jPuYZuZQxv/
Nc5hn3FDdRhh5HxnhjPlcBN5E4L/gfbRwCnVixwIOzbpnmPmfBetORixM1fvBwv9
eh1nw2cHfa2OAyDEguj7kA54MKqePORT6xrq7phDvnvhgTJ/600MJ4Jk2HV8Xk1s
P1uSQ44/tQLiPQx5HH8eF0eTz6SwIfni/LaX5IbOCOTUrY4t586AFUeIfxO2uGvx
YfnEC4xz/IJj4/PqFlESpNb0aOTbBcy1WxKvNoh49J2YTjpLbKfyVAYCvmztBt8i
w16T7joCyVmFKsTNfxynZ2u4VjE+o4ZR+4HiqraQtR/8fO/9DuA=
=RNQJ
-----END PGP SIGNATURE-----

--ZSy0nCNjt/0qKjd7--
