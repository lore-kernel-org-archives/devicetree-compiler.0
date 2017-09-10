From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 1/2] pylibfdt: Add a method to access the device tree
 directly
Date: Sun, 10 Sep 2017 16:43:12 +1000
Message-ID: <20170910064312.GA17405@umbus.fritz.box>
References: <20170831104200.47974-1-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vtzGhvizbBRQ85DL"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1505025798;
        bh=m+iZ23S6UV05t/4MKj1vU8LNaLRaBTYPrHQz6a0W6+s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ek08VFzMM0cG5bZ9Yf2ZyBikamF3jVe8PjXXWCAS6wxHa+xefXQHUtFTVWrzPlR3G
         3bYpPfy+4Zln9RBhAQ74XxqefOwCT7XijmIXckyj4Ghm4nmnX8u0t7qkGYxcWez89t
         PLklVZ5z7hhM+LrRBWWlBkHzzwpP/Zij3VOuWYFo=
Content-Disposition: inline
In-Reply-To: <20170831104200.47974-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 31, 2017 at 04:41:59AM -0600, Simon Glass wrote:
> When calling libfdt functions which are not supported by the Fdt class it
> is necessary to get direct access to the device tree data. At present this
> requries using the internal _fdt member. Add a new method to provide
> public access to this.
>=20
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Sorry I've taken so long to look at this.

I don't think this actually has much value.  You're directly returning
_fdt, which is a mutable object.  Anything bad you can do to the
object by accessing _fdt directly you can do just as badly via this
method.

Which makes this an abstraction that doesn't abstract, and an
interface that doesn't actually protect anything, even notionally.

If you want things from outside to be able to access the raw blob, I
suggest you just remove the underscore and make .fdt an advertised,
accessible attribute of the object.



> ---
>=20
> Changes in v2:
> - Change from get_fdt() to as_bytearray()
>=20
>  pylibfdt/libfdt.i       | 11 +++++++++++
>  tests/pylibfdt_tests.py |  5 +++--
>  2 files changed, 14 insertions(+), 2 deletions(-)
>=20
> diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> index 415820d..f8e3a2c 100644
> --- a/pylibfdt/libfdt.i
> +++ b/pylibfdt/libfdt.i
> @@ -174,6 +174,17 @@ class Fdt:
>          self._fdt =3D bytearray(data)
>          check_err(fdt_check_header(self._fdt));
> =20
> +    def as_bytearray(self):
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
>      def subnode_offset(self, parentoffset, name, quiet=3D()):
>          """Get the offset of a named subnode
> =20
> diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
> index 95d911a..0ec0f38 100644
> --- a/tests/pylibfdt_tests.py
> +++ b/tests/pylibfdt_tests.py
> @@ -297,9 +297,10 @@ class PyLibfdtTests(unittest.TestCase):
> =20
>      def testIntegers(self):
>          """Check that integers can be passed and returned"""
> -        self.assertEquals(0, libfdt.fdt_get_phandle(self.fdt._fdt, 0))
> +        self.assertEquals(0, libfdt.fdt_get_phandle(self.fdt.as_bytearra=
y(), 0))
>          node2 =3D self.fdt.path_offset('/subnode@2')
> -        self.assertEquals(0x2000, libfdt.fdt_get_phandle(self.fdt._fdt, =
node2))
> +        self.assertEquals(
> +                0x2000, libfdt.fdt_get_phandle(self.fdt.as_bytearray(), =
node2))
> =20
>      def testGetPhandle(self):
>          """Test for the get_phandle() method"""

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--vtzGhvizbBRQ85DL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlm03v4ACgkQbDjKyiDZ
s5I0wxAA5SXjGTmPeNo1gyDxhNL6zdVtRTKdgYJfGhfR0YHR5aH9EzNhglO6J6vi
akNNkJ9HZHl/KsmGiQC1N9C/nSfE2EY/4b0PoxfV2oon0rN0XUyh0J828P1MDASn
LmT4PerVYJm2u8q1s1GXXShjF0JGs9JCBlPY7N9dmNEyl1xuBryInMqQhXzCBXLw
rzYfjYGh89HhVZeth7Gg+N3iuNh/Kb15XVTyaNgkWNyVI86DPx0j+bmi+pDH61Ov
1viOR/WF6drRWfe3pC9Sw6fHhsPuwhnWZGnf6A9lemXN5rNME890sX4GQRFuzIOE
uh71QVSWGnI8qIqi90SBIE7ierxbr/eIt2cygn5Pxctfp+79HK8Obhjl5ONtqb9f
d6RlP0+YshsqE5Jq50BI4VhNoc/cSRxwt4S3o7stBRfBcAcavHwBox9INxHvVrgH
TWXNxb/v4E+ivgEpYZowom6wzWHj+xPSkbhDZyBZOZDDcj9rHgzXj03A0WNhy3Ng
gsHkUBke433pa7LL4f7Dd968jLwbpvUA3CkwoBuDnAj1ii/5v7+B/BdWRe+/C0UK
7o2vfQ33WXvBBawEuYVHIOuhoeopKm+ubzsqrW+GfyQ+yHaueiz0KW/hFngks+XU
rvoGQBNBH1RiBeoTJclNbcFD0U2BFL+AwedVg3pbuUUPCWIqaWY=
=HEHV
-----END PGP SIGNATURE-----

--vtzGhvizbBRQ85DL--
