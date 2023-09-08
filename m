From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] pylibfdt: Support boolean properties
Date: Fri, 8 Sep 2023 11:01:47 +1000
Message-ID: <ZPpye6Dm8q/T2tc5@zatzit>
References: <20230907144531.28735-1-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ZzDw0V0huN4BUAl/"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1694134913;
        bh=FKnbM2hqcCuyt9Uy1SmnAcF3xCrakq5PfFbjkFptgHE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mr5RWubvpDjf9SLKI9JaJW/EbZsD3D5zwP5xp1/mmvoRd61VyfRyXKPk2D3Wr8pDG
         Rzetr9fqcM8CwRN5NG86HmptXjy52atlJB5lXWnKxAB8i3Ov25UZvfDGQLQE6Kl47v
         KYYGqSnlsUNhuEpkFWFeTaIQ9fT+mbRtV4aMpiTw=
Content-Disposition: inline
In-Reply-To: <20230907144531.28735-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--ZzDw0V0huN4BUAl/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 07, 2023 at 08:45:30AM -0600, Simon Glass wrote:
> Boolean properties are unusual in that their presense or absence
> indicates the value of the property. This makes them a little painful to
> support using the existing getprop() support.
>=20
> Add new methods to deal with booleans specifically.
>=20
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>=20
>  Makefile                |  3 ++-
>  pylibfdt/libfdt.i       | 55 +++++++++++++++++++++++++++++++++++++++++
>  tests/pylibfdt_tests.py | 34 +++++++++++++++++++++++++
>  tests/test_props.dts    |  1 +
>  4 files changed, 92 insertions(+), 1 deletion(-)
>=20
> diff --git a/Makefile b/Makefile
> index 6ccee13..4a40993 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -24,8 +24,9 @@ CPPFLAGS =3D -I libfdt -I . -DFDT_ASSUME_MASK=3D$(ASSUM=
E_MASK)
>  WARNINGS =3D -Wall -Wpointer-arith -Wcast-qual -Wnested-externs -Wsign-c=
ompare \
>  	-Wstrict-prototypes -Wmissing-prototypes -Wredundant-decls -Wshadow \
>  	-Wsuggest-attribute=3Dformat -Wwrite-strings
> -CFLAGS =3D -g -Os $(SHAREDLIB_CFLAGS) -Werror $(WARNINGS) $(EXTRA_CFLAGS)
> +CFLAGS =3D -g -Os $(SHAREDLIB_CFLAGS) $(WARNINGS) $(EXTRA_CFLAGS)
> =20
> +# -Werror

Uh... this doesn't look right.  At the very least it's an unrelated change.

>  BISON =3D bison
>  LEX =3D flex
>  SWIG =3D swig
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

LGTM.

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

LGTM

>      def setprop_u32(self, nodeoffset, prop_name, val, quiet=3D()):
>          """Set the value of a property
> =20
> diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
> index 34c2764..6ef8f34 100644
> --- a/tests/pylibfdt_tests.py
> +++ b/tests/pylibfdt_tests.py
> @@ -496,6 +496,40 @@ class PyLibfdtBasicTests(unittest.TestCase):
>          self.assertEqual(TEST_STRING_3,
>                            self.fdt.getprop(node, prop).as_str())
> =20
> +    def testSetPropU32(self):
> +        """Test that we can update and create integer properties"""
> +        node =3D 0
> +        prop =3D 'prop-int'
> +        self.fdt.setprop_u32(node, prop, TEST_VALUE_1)
> +        self.assertEqual(struct.pack('>I', TEST_VALUE_1),
> +                          self.fdt.getprop(node, prop))
> +

This looks file, but doesn't really belong with this patch.

> +    def testSetPropBool(self):

Might be nice to separate a case testing just hasprop() on the
unmodified tree.

> +        """Test that we can update and create boolean properties"""
> +        node =3D 0
> +        prop =3D 'prop-bool'
> +
> +        # Check adding where there is no space
> +        self.assertFalse(self.fdt2.hasprop(node, 'missing'))
> +        self.assertEqual(
> +            -libfdt.NOSPACE,
> +            self.fdt2.setprop_bool(node, 'missing', True,
> +                                   quiet=3D(libfdt.NOSPACE,)))
> +        self.assertFalse(self.fdt2.hasprop(node, 'missing'))

I'm not sure that specifically checking the NOSPACE case is
particularly valuable.  If nothing else it seems like it should be in
a different test case, rather than front and centre in this one.

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

--ZzDw0V0huN4BUAl/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmT6cnMACgkQzQJF27ox
2GcMNQ//cEDJct9ORXuQIPavE08c7UT6FRwHxoz0ZTbSMEE4ykmGDv9W01d+69Is
rK+dAft4Fmi755ntFNq5gN8AamkAO4a9b1kreyl3LanO9hxCKH5TTLkPsqBhfbz4
MB3AzQhnQEr9bIxECNx/rN5TM/N6EjRZXZdRcMuv+JDNqf1K29g/O+YxkuDhhJJw
Z3Ha6+T8UOHBpwwNrqhR58Hqk5039yxwmhnf3knmomURcXZ7377ixKMSyM9WKqMi
L485kLjzrCohTUsHsScwzygx5+zucawP4BP2dnGRcIoi77OjDN0gcyaxamsvsLo5
hCqHYHMDWRQvUasUxJIPiSrdSDTWFw70KaPPNbt0C6O5n9t1cRbmuPiLm6FV2o9X
sspa1bCg/GZuYMK1ZKrmKOmW83FvSDLG295davyMmIw6eUwvFIQj66vCpxLeNuF+
GpRrDvkLE8nHarr4yWbJxzIdtdK7aq2HrEVBXjIFF8CybInHXjDZCDY1eXbN4szD
mlffyKDBO4z6EDny/cN07g7CxUReTvdtNunnpRxiSmS40j8GVbV9Qa/TKaGv8jcT
YJQ3buIwgwggg7+xGvIRdIgFXczWgZWbgnTYqBzon16+EoGUoOTEjOwsggOauXij
WHrBFBxyuY9fT/HwiMK19NV+5bjSFO3WZK0SbCG+f2EA6UhuRgk=
=JQoS
-----END PGP SIGNATURE-----

--ZzDw0V0huN4BUAl/--
