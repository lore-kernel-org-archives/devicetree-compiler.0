From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 3/4] pylibfdt: add FdtRo.get_path()
Date: Tue, 28 Dec 2021 15:33:31 +1100
Message-ID: <YcqTmyrWb7Uw5LB2@yekko>
References: <20211225132558.167123-1-luca@z3ntu.xyz>
 <20211225132558.167123-4-luca@z3ntu.xyz>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="JcxaErKA0nbMlwQK"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1640678762;
        bh=jBxsuD7r7T/YdT6Eo7wbM0zkq5LCQtIQ02DKR0fN6k0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pr777eZdD4JVMuUO2qQ+XUouTM8/ijZWwwBq1ibK7hx3EQfdj3Chiabh1ohUe1uqd
         sFdB+2RIfxydCJTc9Ip572/k0kCYrqKtkrMqxLjqxAcJhNcJUMD/rCLTUbUeHILHWU
         CEYbPyuDNBbLtPqnBzgji7MCQCBoOw7hN5G+DrlI=
Content-Disposition: inline
In-Reply-To: <20211225132558.167123-4-luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--JcxaErKA0nbMlwQK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 25, 2021 at 02:25:57PM +0100, Luca Weiss wrote:
> Add a new Python method wrapping fdt_get_path() from the C API.
>=20
> Also add a test for the new method.
>=20
> Signed-off-by: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
> ---
>  pylibfdt/libfdt.i       | 21 +++++++++++++++++++++
>  tests/pylibfdt_tests.py | 12 ++++++++++++
>  2 files changed, 33 insertions(+)
>=20
> diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> index ac70762..5434d48 100644
> --- a/pylibfdt/libfdt.i
> +++ b/pylibfdt/libfdt.i
> @@ -443,6 +443,22 @@ class FdtRo(object):
>          """
>          return fdt_get_alias(self._fdt, name)
> =20
> +    def get_path(self, nodeoffset, size=3D128):

Having an explicit max buffer size here makes for a very un-Pythonic
interface.  The python interface really needs to re-allocate and retry
automatically until it gets the full result.

Whether you implement that in Python code or in the C wrapper is up to
you.

> +        """Get the full path of a node
> +
> +        Args:
> +            nodeoffset: Node offset to check
> +
> +        Returns:
> +            Full path to the node
> +
> +        Raises:
> +            FdtException if the path is longer than 'size' or other erro=
r occurs
> +        """
> +        ret, path =3D fdt_get_path(self._fdt, nodeoffset, size)
> +        check_err(ret)
> +        return path
> +
>      def parent_offset(self, nodeoffset, quiet=3D()):
>          """Get the offset of a node's parent
> =20
> @@ -1115,6 +1131,11 @@ typedef uint32_t fdt32_t;
>          }
>  }
> =20
> +%include "cstring.i"
> +
> +%cstring_output_maxsize(char *buf, int buflen);
> +int fdt_get_path(const void *fdt, int nodeoffset, char *buf, int buflen);
> +
>  /* We have both struct fdt_property and a function fdt_property() */
>  %warnfilter(302) fdt_property;
> =20
> diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
> index 5479363..bcd3daa 100644
> --- a/tests/pylibfdt_tests.py
> +++ b/tests/pylibfdt_tests.py
> @@ -348,6 +348,18 @@ class PyLibfdtBasicTests(unittest.TestCase):
>          self.assertEqual("/subnode@1/subsubnode", self.fdt3.get_alias('s=
s1'))
>          self.assertEqual("/subnode@1/subsubnode/subsubsubnode", self.fdt=
3.get_alias('sss1'))
> =20
> +    def testGetPath(self):
> +        """Test for the get_path() method"""
> +        node =3D self.fdt.path_offset('/subnode@1')
> +        node2 =3D self.fdt.path_offset('/subnode@1/subsubnode')
> +        self.assertEqual("/subnode@1", self.fdt.get_path(node))
> +        self.assertEqual("/subnode@1", self.fdt.get_path(node, 16))
> +        self.assertEqual("/subnode@1/subsubnode", self.fdt.get_path(node=
2))
> +
> +        with self.assertRaises(FdtException) as e:
> +            self.fdt.get_path(node2, 16)
> +        self.assertEqual(e.exception.err, -libfdt.NOSPACE)
> +
>      def testParentOffset(self):
>          """Test for the parent_offset() method"""
>          self.assertEqual(-libfdt.NOTFOUND,

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--JcxaErKA0nbMlwQK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmHKk5sACgkQbDjKyiDZ
s5It7A/+MBJj6+GTNSuE0jljC5qx3j6LAfjQO5Sz0eKThj/6pdTMrhVXKNaBFMsq
WsZu/PwSyyUaNjcuZZhG3oJ+AcZiEQViqTEv80ZocP3spUOdXZn9FS+D5zDBQFJf
CxWCPJ+M+HrXWBAWa3+U1PLojMfq/KT5YjgXbo6wsxXlBgCxTbD2Bukh4E/ZR0N8
FepumLMN2aNTbCMinYnf7Sgn4lzkQwCPZyzm3AeRE1t9hgDoxvJTxZ1oWHF1WEDY
krjSQVxBZ1B8A3wbJl5Ai6qGE+Qt4gXzBriWlDZ4pQIXsKuCDqj3PJHmlTwyk9w3
ZKnozBZC964jaFtleKeg3MyQjeE7jFwzITcst1H8J3rZB5ni+zl0QscWiqpqkXy9
eNpEVn+1wM5ewur+QSZ0RA813uoHaXbYKAtLXopICirIen/idtpSy7zRY7bGY2ZP
Bi7Sa6ZZjAHJy6pk+bxMNfM6dB2IGMsNDBOS5QIfQHoYD8HfRv8JxkI8eUPpTTOj
BiJnme09FeHtt7glg66Ak/z+N/UkgMhCwis1BEEDEcW9HO0aLtZP0Q4yOyJ/YR+J
ESNIxpHK0QriT7JjGI8NqfvtCGlpT8dmzc8JyXM90ZCH6KFbom28wLr/ZmA1pcSn
dP4kSK6pr+STrMHq1GUUblTYxXaxEeUT1J1VTpJLhAwpEtEQUFg=
=ooNN
-----END PGP SIGNATURE-----

--JcxaErKA0nbMlwQK--
