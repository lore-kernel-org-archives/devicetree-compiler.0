From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 4/4] pylibfdt: add FdtRo.getprop_or_none()
Date: Tue, 28 Dec 2021 16:20:11 +1100
Message-ID: <YcqeixTH76IRkjrn@yekko>
References: <20211225132558.167123-1-luca@z3ntu.xyz>
 <20211225132558.167123-5-luca@z3ntu.xyz>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="TJL1QoO+Q1yXoxeZ"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1640678762;
        bh=bkQx2TASxHysAAfJhJ5w7wfpTDU+/pdydfn2fIES4K0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MXQiu2gz6jMR2iG5sIN0BaQRkcmjGvAj3W9Jn/gqW6IE98S62eL9B2eUuIwNDHqOi
         ETduWLGrMGlw1k6xsQqbG1dXCQ1UFbDeP5F4vKQg5tyvrieB3KQb8Uib7qKfefs8mX
         WZCM4zdQqR+tlME7pClBqXCVNQoqPU3pgveI4JWk=
Content-Disposition: inline
In-Reply-To: <20211225132558.167123-5-luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--TJL1QoO+Q1yXoxeZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 25, 2021 at 02:25:58PM +0100, Luca Weiss wrote:
> Add a new method that doesn't throw an exception when a property isn't
> found but returns None instead.
>=20
> Also add a test for the new method.
>=20
> Signed-off-by: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>

I'd need a stronger rationale to apply this.  It's not really doing
anything that the existing getprop method can't, just presenting it in
a slightly different form.

> ---
>  pylibfdt/libfdt.i       | 10 ++++++++++
>  tests/pylibfdt_tests.py |  2 ++
>  2 files changed, 12 insertions(+)
>=20
> diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> index 5434d48..2c2fa5c 100644
> --- a/pylibfdt/libfdt.i
> +++ b/pylibfdt/libfdt.i
> @@ -419,6 +419,16 @@ class FdtRo(object):
>              return pdata
>          return Property(prop_name, bytearray(pdata[0]))
> =20
> +    def getprop_or_none(self, nodeoffset, prop_name):
> +        """Get a property from a node, or None if it is not found
> +
> +        See getprop() for the arguments.
> +        """
> +        prop =3D self.getprop(nodeoffset, prop_name, [FDT_ERR_NOTFOUND])
> +        if prop =3D=3D -FDT_ERR_NOTFOUND:
> +            return None
> +        return prop
> +
>      def get_phandle(self, nodeoffset):
>          """Get the phandle of a node
> =20
> diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
> index bcd3daa..152e925 100644
> --- a/tests/pylibfdt_tests.py
> +++ b/tests/pylibfdt_tests.py
> @@ -219,6 +219,8 @@ class PyLibfdtBasicTests(unittest.TestCase):
>              self.fdt.getprop(root, 'missing')
>          self.assertEqual(e.exception.err, -libfdt.NOTFOUND)
> =20
> +        self.assertIsNone(self.fdt.getprop_or_none(root, 'missing'))
> +
>          node =3D self.fdt.path_offset('/subnode@1/subsubnode')
>          value =3D self.fdt.getprop(node, "compatible")
>          self.assertEqual(value, b'subsubnode1\0subsubnode\0')

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--TJL1QoO+Q1yXoxeZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmHKnoMACgkQbDjKyiDZ
s5J3Xw/+NF0BGWxFFtF9b8Jlc8jBr6bFbaLlTS49wDw2Cb2AfFfc95xW0hF/43x+
GVsCPKuw5GxBw/JAFGVTzfE//budrlUDt0G4hDCHHQ7d7qaS8viL5stQh0GpclgN
+i7ocrhXUPXx3ePbNhCoIRZbHZmSdDtiNVk8jAU7uXisDEMdlksH0y9sH4g0llsj
o+7TPmPFWuSl6PmQqHDXrM2wc1lbzDN/LBxFpgqPY5nqpLF6V7JkeaVg4+nTZzir
mMYBFj2bDmTn+zxV073jRJQ4//8yWu6XtLhHPZGllqoKjv8iAX4eAeybLr4Fgz19
RwWtf+NZq3h9aYdzjPMspHt8MzpNqL0Vm7IQyNHh6kE8fBj6utFBEps+f5BYp0KN
zLsyzKzYsSv7WHpL3hjum63bL+ZXHEfpweI+P+TPZAmJU14gHLQ0h9um6tDh8p+0
potdOFGG3wgW8QE9w+tthbCDsaLfRCGNo4oR8l9rgW9NYcVVBDSyGCtr+B2yy5xo
fN/e3u87fLgH3+HJZiFtZM9u1v1ZfC1l6cP2jkr3GZMBuba1gJHVMTzxQDUBnYe/
eMxbT5SCVToQtUDa0XFDTDrYDEbINVrYo2JkcIyBEm8fvzAjCh/btcvlPzPIt4E8
Hpc1RD4NyWX8G6oVMLtbaSysKl+4m7ferHd+dlv69eAFA0IMKNk=
=kHXp
-----END PGP SIGNATURE-----

--TJL1QoO+Q1yXoxeZ--
