From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2] pylibfdt: Support boolean properties
Date: Fri, 15 Sep 2023 16:04:58 +1000
Message-ID: <ZQP0CprnQXN+uqg+@zatzit>
References: <20230912182716.248253-1-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="YtzDF35Q2mGhDpxu"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1694759203;
        bh=2V23LIIidRmCihx+lwEZYEe4+IEl7dPRP1TzR/GutpE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=njvNBH4P+ZSWUMuW6p15EnmZP7IVqpHkY8dsLCYqZDYe2XE57UpAoxYpURbdAxRSg
         67heQjroGA1j6A75Yz2wYHMC4xSrksf58/6PxCHB4SfsIoIdURJb/xCGOCiQ8hM+0A
         3lYvlUgwKdFyBWsvARPSSyNb+PIF8KW2yYM1u/Dk=
Content-Disposition: inline
In-Reply-To: <20230912182716.248253-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--YtzDF35Q2mGhDpxu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 12, 2023 at 12:27:13PM -0600, Simon Glass wrote:
> Boolean properties are unusual in that their presense or absence
> indicates the value of the property. This makes them a little painful to
> support using the existing getprop() support.
>=20
> Add new methods to deal with booleans specifically.
>=20
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Merged, thanks.

> ---
>=20
> Changes in v2:
> - Drop debug-related Makefile change
> - Drop duplicate setprop_u32() test
> - Add a separate test for hasprop()
> - Drop checking of no-space since testSetProp() already has that
>=20
>  pylibfdt/libfdt.i       | 55 +++++++++++++++++++++++++++++++++++++++++
>  tests/pylibfdt_tests.py | 33 +++++++++++++++++++++++++
>  tests/test_props.dts    |  1 +
>  3 files changed, 89 insertions(+)
>=20
> diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> index 2361e22..0b50983 100644
> --- a/pylibfdt/libfdt.i
> +++ b/pylibfdt/libfdt.i
> @@ -419,6 +419,35 @@ class FdtRo(object):
>              return pdata
>          return Property(prop_name, bytearray(pdata[0]))
> =20
> +    def hasprop(self, nodeoffset, prop_name, quiet=3D()):
> +        """Check if a node has a property
> +
> +        This can be used to check boolean properties
> +
> +        Args:
> +            nodeoffset: Node offset containing property to check
> +            prop_name: Name of property to check
> +            quiet: Errors to ignore (empty to raise on all errors). Note=
 that
> +                NOTFOUND is added internally by this function so need no=
t be
> +                provided
> +
> +        Returns:
> +            True if the property exists in the node, else False. If an e=
rror
> +                other than -NOTFOUND is returned by fdt_getprop() then t=
he error
> +                is return (-ve integer)
> +
> +        Raises:
> +            FdtError if any error occurs other than NOTFOUND (e.g. the
> +                nodeoffset is invalid)
> +        """
> +        pdata =3D check_err_null(fdt_getprop(self._fdt, nodeoffset, prop=
_name),
> +                               quiet + (NOTFOUND,))
> +        if isinstance(pdata, (int)):
> +            if pdata =3D=3D -NOTFOUND:
> +                return False
> +            return pdata
> +        return True
> +
>      def get_phandle(self, nodeoffset):
>          """Get the phandle of a node
> =20
> @@ -605,6 +634,32 @@ class Fdt(FdtRo):
>          return check_err(fdt_setprop(self._fdt, nodeoffset, prop_name, v=
al,
>                                       len(val)), quiet)
> =20
> +    def setprop_bool(self, nodeoffset, prop_name, val, quiet=3D()):
> +        """Set the boolean value of a property
> +
> +        Either:
> +            adds the property if not already present; or
> +            deletes the property if present
> +
> +        Args:
> +            nodeoffset: Node offset containing the property to create/de=
lete
> +            prop_name: Name of property
> +            val: Boolean value to write (i.e. True or False)
> +            quiet: Errors to ignore (empty to raise on all errors)
> +
> +        Returns:
> +            Error code, or 0 if OK
> +
> +        Raises:
> +            FdtException if no parent found or other error occurs
> +        """
> +        exists =3D self.hasprop(nodeoffset, prop_name, quiet)
> +        if val !=3D exists:
> +            if val:
> +                return self.setprop(nodeoffset, prop_name, b'', quiet=3D=
quiet)
> +            else:
> +                return self.delprop(nodeoffset, prop_name, quiet=3Dquiet)
> +
>      def setprop_u32(self, nodeoffset, prop_name, val, quiet=3D()):
>          """Set the value of a property
> =20
> diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
> index 34c2764..a4f73ed 100644
> --- a/tests/pylibfdt_tests.py
> +++ b/tests/pylibfdt_tests.py
> @@ -496,6 +496,39 @@ class PyLibfdtBasicTests(unittest.TestCase):
>          self.assertEqual(TEST_STRING_3,
>                            self.fdt.getprop(node, prop).as_str())
> =20
> +    def testHasProp(self):
> +        """Test that we can check if a node has a property"""
> +        node =3D 0
> +        self.assertFalse(self.fdt2.hasprop(node, 'missing'))
> +        self.assertTrue(self.fdt2.hasprop(node, 'prop-bool'))
> +
> +        # Test a property with a non-empty value
> +        self.assertTrue(self.fdt2.hasprop(node, 'prop-uint64'))
> +
> +    def testSetPropBool(self):
> +        """Test that we can update and create boolean properties"""
> +        node =3D 0
> +        prop =3D 'prop-bool'
> +
> +        # Make some space and then try setting a new boolean property
> +        self.fdt.resize(self.fdt.totalsize() + 50)
> +        self.fdt.hasprop(node, 'missing')
> +        self.fdt.setprop_bool(node, 'missing', True)
> +        self.assertTrue(self.fdt.hasprop(node, 'missing'))
> +
> +        # Trying toggling an existing boolean property. Do each operatio=
n twice
> +        # to make sure that the behaviour is correct when setting the pr=
operty
> +        # to the same value.
> +        self.assertTrue(self.fdt2.hasprop(node, prop))
> +        self.fdt2.setprop_bool(node, prop, False)
> +        self.assertFalse(self.fdt2.hasprop(node, prop))
> +        self.fdt2.setprop_bool(node, prop, False)
> +        self.assertFalse(self.fdt2.hasprop(node, prop))
> +        self.fdt2.setprop_bool(node, prop, True)
> +        self.assertTrue(self.fdt2.hasprop(node, prop))
> +        self.fdt2.setprop_bool(node, prop, True)
> +        self.assertTrue(self.fdt2.hasprop(node, prop))
> +
>      def testSetName(self):
>          """Test that we can update a node name"""
>          node =3D self.fdt.path_offset('/subnode@1')
> diff --git a/tests/test_props.dts b/tests/test_props.dts
> index 5089023..09be197 100644
> --- a/tests/test_props.dts
> +++ b/tests/test_props.dts
> @@ -12,4 +12,5 @@
>  	prop-uint32-array =3D <0x1>, <0x98765432>, <0xdeadbeef>;
>  	prop-int64-array =3D /bits/ 64 <0x100000000 0xfffffffffffffffe>;
>  	prop-uint64-array =3D /bits/ 64 <0x100000000 0x1>;
> +	prop-bool;
>  };

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--YtzDF35Q2mGhDpxu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmUD9AMACgkQzQJF27ox
2GceKw/9ELHciEDNPjPCZoOGaiuUVVjx1kBAfAt5O0gxhwYzWJQFM5LtGkDivI5I
etaapQcneSChycQ8tuTys1E7ht4vlG2GlDeA2bEeQOmr07esgwOYSqfP8DZ/T8te
WHA5aGiwi9xpJw6gcJtdnB33zIGlrkQjeMsAwfzXVMqwEkHU/85nQ5QBJbmocD7A
XnEQ6jbyIQOHKUqGuTjTVs2xNNMnLhd83D/KGYVq6OzhPgQhd94RlqlSmHtW1tz3
KjVHrLY/JpBfd3ZWZcsMqwuWkcU5Iq1E6Zh9AN5H4wB/DQTgj1v4KRAuCvR4HZVn
hS90ci64dFjka0g+Lz17NawC6XbgpPmaFIAnF1mY0eqOSBhUR4bdeJSnWPQaUEUy
+kbZ+wy9MOx372wjhaPNexe3FQPcVL8QdHPbSuiLaUERRQmsh4L5mo4TBllNMKxS
ITf0sM0I94DtpeeSd6/mAjAIyNuR6pH7AgYBeTtLtkOW5TwARbfRNhvyRyhT9KaQ
0UW2m3NdiQeEZubq9u/2/ChJ0zu9g4PA7vgo64PKLbhoPjkeCRqxG8USSMjYd+/C
hWi9Drb++iN/lpBwZtNo7cZrWSzVNQt/dydF8dseNV26oln46nNMmBunfw9I+o/3
ZetE3t3A/qAZhhmBqVUTnKNMAJ1c4Ib/68BXt7e6cPin+m5nARI=
=4VII
-----END PGP SIGNATURE-----

--YtzDF35Q2mGhDpxu--
