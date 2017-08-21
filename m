From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 07/10] pylibfdt: Add a method to access the device tree
 directly
Date: Mon, 21 Aug 2017 10:17:14 +1000
Message-ID: <20170821001714.GC12356@umbus.fritz.box>
References: <20170819171803.195806-1-sjg@chromium.org>
 <20170819171803.195806-7-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="WfZ7S8PLGjBY9Voh"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1503279685;
        bh=Le4bgJb/zjxwbQQxFKeuW86Uiix4AR0P/qHVtCTtDBA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=b8gNMYavsebdOgZUgraK95nAJHfT/w2T7jlUDPnU+tHEDxROfu+7ew4J4vlaBrxQH
         YmVTY+sqgENLv8lKfSsx+U11SxWsTVWbbHJqcuFCUHcz/ax2MR7OL/mKQk1wIKoCou
         zIlKs0pdcOvaCKMaWmPpVt4Mm0gFCpXBQxPXpUts=
Content-Disposition: inline
In-Reply-To: <20170819171803.195806-7-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, hg-K0bRW+63XPQe6aEkudXLsA@public.gmane.org
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--WfZ7S8PLGjBY9Voh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 19, 2017 at 11:18:00AM -0600, Simon Glass wrote:
> When calling libfdt functions which are not supported by the Fdt class it
> is necessary to get direct access to the device tree data. At present this
> requries using the internal _fdt member. Add a new method to provide
> public access to this.
>=20
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

I've applied patches 1-6 already.

This looks fine, except I'm dubious about the name.  "get_fdt" from an
fdt object seems a bit.. tautological?  How about "as_bytestring"?

> ---
>=20
>  pylibfdt/libfdt.i       | 11 +++++++++++
>  tests/pylibfdt_tests.py |  5 +++--
>  2 files changed, 14 insertions(+), 2 deletions(-)
>=20
> diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> index d492d58..1f6809e 100644
> --- a/pylibfdt/libfdt.i
> +++ b/pylibfdt/libfdt.i
> @@ -174,6 +174,17 @@ class Fdt:
>          self._fdt =3D bytearray(data)
>          check_err(fdt_check_header(self._fdt));
> =20
> +    def get_fdt(self):
> +        """Get the device tree contents as a bytearray
> +
> +        This can be passed directly to libfdt functions that access a
> +        const void * for the device tree.
> +
> +        Returns:
> +            bytearray containing the device tree
> +        """
> +        return self._fdt
> +
>      def path_offset(self, path, quiet=3D()):
>          """Get the offset for a given path
> =20
> diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
> index 8028c1a..a775d37 100644
> --- a/tests/pylibfdt_tests.py
> +++ b/tests/pylibfdt_tests.py
> @@ -285,9 +285,10 @@ class PyLibfdtTests(unittest.TestCase):
> =20
>      def testIntegers(self):
>          """Check that integers can be passed and returned"""
> -        self.assertEquals(0, libfdt.fdt_get_phandle(self.fdt._fdt, 0))
> +        self.assertEquals(0, libfdt.fdt_get_phandle(self.fdt.get_fdt(), =
0))
>          node2 =3D self.fdt.path_offset('/subnode@2')
> -        self.assertEquals(0x2000, libfdt.fdt_get_phandle(self.fdt._fdt, =
node2))
> +        self.assertEquals(0x2000,
> +                          libfdt.fdt_get_phandle(self.fdt.get_fdt(), nod=
e2))
> =20
>      def testGetPhandle(self):
>          """Test for the get_phandle() method"""

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--WfZ7S8PLGjBY9Voh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlmaJocACgkQbDjKyiDZ
s5JxvxAAlL0TStK5UDbXAPsqR2DlpzSTAJQnT+Yb+y1C9ZCZ5zsgCGaA/4ifquW8
c9uze3JH9zchUbYrTj+QNQkyLRFlT060UY8vndFPeSjf9aSKbpF0LxRJLCZRKv/t
G61E1ReTzhN4Oz1L7N4RHgXFpNe5+QheR2LAXdjwaUQX+7xHKgY+SKn5TpGrxp8E
j2xFgx8IGqXrZ2WglLPrmkF21z6QIfg0YCJ/6fM01j+l0WWryhpwbNAB2jRO3YPL
Lxk5RjybuSJC2SmmAbuKKWamspZL/iG8kpyKffnYE5Xx0HxW8DM9z3o8/g3D53fy
faz3tnqkGn8nZ4t7ByMpYvdkbwiCW+hW0aBZAPG+dGyu9V837xnfewHj7spUeBho
1xyY/Fod39PIgS8wj3CHrRISveQ7+qEb+gjl8rJ9EksVTB67IJuBvMjoc6kLbgAW
FkHL8KZG0Qv2ZTQjM+DQm1xAQpBScA2GSbUCpYosAH3igsinitvx6DEUpeqMQoin
NtP2pf719cc743zoyWC3oIslT98rsC1wab5bIfwciiJkFMCXuNHinwSjJNpdYwQS
2KRvSmHGviCetXzigAL5tpmOLAUChOnvUJLf69i1CO0p0+lhc6aBu9OKYfv+qY9g
bEf4uJdi+KBNFO3bvdZlZk/U8Y008dvvd61PKyUYKhf2hu0+Gyc=
=jOjQ
-----END PGP SIGNATURE-----

--WfZ7S8PLGjBY9Voh--
