From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/4] pylibfdt: add Property.as_stringlist()
Date: Tue, 28 Dec 2021 15:29:54 +1100
Message-ID: <YcqSwihcCWQ1zrXt@yekko>
References: <20211225132558.167123-1-luca@z3ntu.xyz>
 <20211225132558.167123-2-luca@z3ntu.xyz>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fIDzWHDs70ft7gXY"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1640678762;
        bh=GcznlK6tqxz3ZlxPI4jzqOLt0JwNWhxQIoQSX6Ox81I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=c6JNqDH3gxbzeSrH/W7F3hKGDNZBjEvBieYM82jNvCaDD3xsJzZBY6beuy1i54P31
         r5Ar5Je1huQ/El/PoRBfo6A95pwFmuef8/qfjnA2W4zVy2zBvqvQMmZ3xjWJHN5C5H
         oZphj08c/hH6DKA7m+0z7X/JrhaEuOmKVbmKCagA=
Content-Disposition: inline
In-Reply-To: <20211225132558.167123-2-luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--fIDzWHDs70ft7gXY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 25, 2021 at 02:25:55PM +0100, Luca Weiss wrote:
> Add a new method for decoding a string list property, useful for e.g.
> the "reg-names" property.
>=20
> Also add a test for the new method.
>=20
> Signed-off-by: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>

Applied, thanks.

> ---
>  pylibfdt/libfdt.i       | 7 +++++++
>  tests/pylibfdt_tests.py | 8 ++++++++
>  2 files changed, 15 insertions(+)
>=20
> diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> index 9ccc57b..c81b504 100644
> --- a/pylibfdt/libfdt.i
> +++ b/pylibfdt/libfdt.i
> @@ -724,6 +724,13 @@ class Property(bytearray):
>              raise ValueError('Property contains embedded nul characters')
>          return self[:-1].decode('utf-8')
> =20
> +    def as_stringlist(self):
> +        """Unicode is supported by decoding from UTF-8"""
> +        if self[-1] !=3D 0:
> +            raise ValueError('Property lacks nul termination')
> +        parts =3D self[:-1].split(b'\x00')
> +        return list(map(lambda x: x.decode('utf-8'), parts))
> +
> =20
>  class FdtSw(FdtRo):
>      """Software interface to create a device tree from scratch
> diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
> index 64b5bd1..7e3cc4c 100644
> --- a/tests/pylibfdt_tests.py
> +++ b/tests/pylibfdt_tests.py
> @@ -382,6 +382,14 @@ class PyLibfdtBasicTests(unittest.TestCase):
>                            self.get_prop("prop-uint64").as_uint64())
>          self.assertEqual(-2, self.get_prop("prop-int64").as_int64())
> =20
> +    def testGetStringlistProperties(self):
> +        """Test that we can access properties as string list"""
> +        node =3D self.fdt.path_offset('/subnode@1/subsubnode')
> +        self.assertEqual(["subsubnode1", "subsubnode"],
> +                         self.fdt.getprop(node, "compatible").as_stringl=
ist())
> +        self.assertEqual(["this is a placeholder string", "string2"],
> +                         self.fdt.getprop(node, "placeholder").as_string=
list())
> +
>      def testReserveMap(self):
>          """Test that we can access the memory reserve map"""
>          self.assertEqual(2, self.fdt.num_mem_rsv())

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--fIDzWHDs70ft7gXY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmHKksAACgkQbDjKyiDZ
s5LaEw//TE96zl1IvIgAAvhajVGeuINVnw+4eU5AkV68x82WjffX+E7oZNyuAnfb
KYbDt/9S9q1jJ4IevLtm+qoN0RnU6OouLjKFeWPCZzQJyyqf4gR4KKJixHVMNexK
gFPL39+dwhoQ1gcZtqC9K9tN5SndQqrRM4L51ALf6KiHE5oKs1O/jLGmFPSUb3WF
B3ir2omRk2Immrgf/mKp7pbTP6OZ8ttfY/mDKc6rU6V/KgQgNsZWp2rwpnrGOtmI
I1Xdn3Ep/vyGAwcl/Tewu2g9g266042D8bKpp9oY1wFzypMVobJT/0Yvu7pJLBul
8cAXKaFaMVP4htMh7b+1pXMxEOfpS1li/SOGdpzyAu61aZXLqWrpO/Dx4xwcd2Ik
yg8w4iZ4qaLOnbF47883LVvZptZfssb1pfK9wYw7IEeGN4qBC62ze37ypRSkPvFo
u+P0xa4XGalHRWdUXgy42DrXZO9lQMG4AzryWL8+471mKH+iNCBTQWD6D1eq4y9Q
E6tSix6xRjxJ71Bm97ITSJHOi6Y+vEVNGMYxVUecYbVEe5CUKdNFgMaoC7REnoq7
XJt2w5P4h9/nmLy07NyoxkD02M8B+FCVg/ywtRdXMZ2qCw1D2VaOAr3kWXAbm7hx
8GXFjEc1/rvVQLDL0qG98QdciQL2Ssq2uNzNjEpmPAt5RA5vi50=
=QJXo
-----END PGP SIGNATURE-----

--fIDzWHDs70ft7gXY--
