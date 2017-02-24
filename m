From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v7 2/5] Add tests for pylibfdt
Date: Fri, 24 Feb 2017 13:52:54 +1100
Message-ID: <20170224025254.GJ17615@umbus.fritz.box>
References: <20170222043340.17008-1-sjg@chromium.org>
 <20170222043340.17008-3-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="tKy6e3LXpfmanBFM"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1487904959;
        bh=E4y6/Y+/eWBglNTXyOVn4ZzGkhvVq0dkCJmlqlHG8VU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KPhQGCe03DZlktRZv/z0DYIsIZkmqOlElEPkBagfN+PCe9LAPzTDmsykv4DHMOVgN
         OHF37eRpG1NVYPhTkH/aEL6JiHzpsNtqRupTXs3zhim2XRpHKUmGp6/k7AtsSesJQW
         2o/QhJhV7q+fMqQLe74t8c2Nv84lOlTexr5mGQDk=
Content-Disposition: inline
In-Reply-To: <20170222043340.17008-3-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Bimmermann <b.bimmermann-LWAfsSFWpa4@public.gmane.org>, Ulrich Langenbach <ulrich.langenbach-srmvecZYGfHobmly5n/iKBvVK+yQ3ZXh@public.gmane.org>


--tKy6e3LXpfmanBFM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 21, 2017 at 09:33:37PM -0700, Simon Glass wrote:
> Add a set of tests to cover the functionality in pylibfdt.
>=20
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>=20
> Changes in v7:
> - Add a test for QUIET_ALL
>=20
> Changes in v6:
> - Adjust tests to avoid checking a hard-coded offset
> - Use 0 instead of self.fdt.path_offset('/')
> - Adjust the totalsize() test to compare against the file size
> - Adjust test result processing to avoid using awk
>=20
> Changes in v5:
> - Adjust tests to match new swig bindings
>=20
> Changes in v4:
> - Drop tests that are no-longer applicable
> - Add a get for getprop()
>=20
> Changes in v3:
> - Add some more tests
>=20
> Changes in v2:
> - Update tests for new pylibfdt
> - Add a few more tests to increase coverage
>=20
>  tests/pylibfdt_tests.py | 275 ++++++++++++++++++++++++++++++++++++++++++=
++++++
>  tests/run_tests.sh      |  16 ++-
>  2 files changed, 290 insertions(+), 1 deletion(-)
>  create mode 100644 tests/pylibfdt_tests.py
>=20
> diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
> new file mode 100644
> index 0000000..796684a
> --- /dev/null
> +++ b/tests/pylibfdt_tests.py
> @@ -0,0 +1,275 @@
> +# pylibfdt - Tests for Flat Device Tree manipulation in Python
> +# Copyright (C) 2017 Google, Inc.
> +# Written by Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> +#
> +# libfdt is dual licensed: you can use it either under the terms of
> +# the GPL, or the BSD license, at your option.
> +#
> +#  a) This library is free software; you can redistribute it and/or
> +#     modify it under the terms of the GNU General Public License as
> +#     published by the Free Software Foundation; either version 2 of the
> +#     License, or (at your option) any later version.
> +#
> +#     This library is distributed in the hope that it will be useful,
> +#     but WITHOUT ANY WARRANTY; without even the implied warranty of
> +#     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +#     GNU General Public License for more details.
> +#
> +#     You should have received a copy of the GNU General Public
> +#     License along with this library; if not, write to the Free
> +#     Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston,
> +#     MA 02110-1301 USA
> +#
> +# Alternatively,
> +#
> +#  b) Redistribution and use in source and binary forms, with or
> +#     without modification, are permitted provided that the following
> +#     conditions are met:
> +#
> +#     1. Redistributions of source code must retain the above
> +#        copyright notice, this list of conditions and the following
> +#        disclaimer.
> +#     2. Redistributions in binary form must reproduce the above
> +#        copyright notice, this list of conditions and the following
> +#        disclaimer in the documentation and/or other materials
> +#        provided with the distribution.
> +#
> +#     THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
> +#     CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,
> +#     INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
> +#     MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
> +#     DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
> +#     CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
> +#     SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
> +#     NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
> +#     LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
> +#     HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
> +#     CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
> +#     OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
> +#     EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> +#
> +
> +import sys
> +import unittest
> +
> +sys.path.append('../pylibfdt')
> +import libfdt
> +from libfdt import FdtException, QUIET_NOTFOUND, QUIET_ALL
> +
> +# Offsets of properties in the root node
> +ROOT_PROPS =3D (8, 32, 48, 68, 92, 108)

As with nodes, relying on exact property offsets in your test is
probably a mistake.

> +
> +def get_err(err_code):
> +    """Convert an error code into an error message
> +
> +    Args:
> +        err_code: Error code value (FDT_ERR_...)
> +
> +    Returns:
> +        String error code
> +    """
> +    return 'pylibfdt error %d: %s' % (-err_code, libfdt.fdt_strerror(-er=
r_code))
> +
> +def _ReadFdt(fname):
> +    """Read a device tree file into an Fdt object, ready for use
> +
> +    Args:
> +        fname: Filename to read from
> +
> +    Returns:
> +        Fdt bytearray suitable for passing to libfdt functions
> +    """
> +    return libfdt.Fdt(open(fname).read())
> +
> +class PyLibfdtTests(unittest.TestCase):
> +    """Test class for pylibfdt
> +
> +    Properties:
> +        fdt: Device tree file used for testing
> +    """
> +
> +    def setUp(self):
> +        """Read in the device tree we use for testing"""
> +        self.fdt =3D _ReadFdt('test_tree1.dtb')
> +
> +    def GetPropList(self, node_path):
> +        """Read a list of properties from a node
> +
> +        Args:
> +            node_path: Full path to node, e.g. '/subnode@1/subsubnode'
> +
> +        Returns:
> +            List of property names for that node, e.g. ['compatible', 'r=
eg']
> +        """
> +        prop_list =3D []
> +        node =3D self.fdt.path_offset(node_path)
> +        poffset =3D self.fdt.first_property_offset(node, QUIET_NOTFOUND)
> +        while poffset > 0:
> +            prop =3D self.fdt.get_property_by_offset(poffset)
> +            prop_list.append(prop.name)
> +            poffset =3D self.fdt.next_property_offset(poffset, QUIET_NOT=
FOUND)
> +        return prop_list
> +
> +    def testImport(self):
> +        """Check that we can import the library correctly"""
> +        self.assertEquals(type(libfdt), type(sys))

Using types.ModuleType might be a bit clearer than using type(sys).

> +
> +    def testBadFdt(self):
> +        """Check that a filename provided accidentally is not accepted"""
> +        with self.assertRaisesRegexp(FdtException, get_err(libfdt.BADMAG=
IC)):
> +            fdt =3D libfdt.Fdt('a string')
> +
> +    def testPathOffset(self):
> +        """Check that we can find the offset of a node"""
> +        self.assertEquals(self.fdt.path_offset('/'), 0)
> +        self.assertTrue(self.fdt.path_offset('/subnode@1') > 0)
> +        with self.assertRaisesRegexp(FdtException, get_err(libfdt.NOTFOU=
ND)):
> +            self.fdt.path_offset('/wibble')

Checking the error string by regexp seems a bit indirect.  Wouldn't it
be better to add new helper that checks explicitly for an FdtException
with the right fdt error code embedded in it?

> +        self.assertEquals(self.fdt.path_offset('/wibble', QUIET_NOTFOUND=
),
> +                          -libfdt.NOTFOUND)
> +
> +    def testPropertyOffset(self):
> +        """Walk through all the properties in the root node"""
> +        self.assertEquals(self.fdt.first_property_offset(0), ROOT_PROPS[=
0])
> +        for pos in range(len(ROOT_PROPS) - 1):
> +            self.assertEquals(self.fdt.next_property_offset(ROOT_PROPS[p=
os]),
> +                              ROOT_PROPS[pos + 1])
> +        self.assertEquals(self.fdt.next_property_offset(ROOT_PROPS[-1],
> +                                                        QUIET_NOTFOUND),
> +                          -libfdt.NOTFOUND)
> +
> +    def testPropertyOffsetExceptions(self):
> +        """Check that exceptions are raised as expected"""
> +        with self.assertRaisesRegexp(FdtException, get_err(libfdt.BADOFF=
SET)):
> +            self.fdt.next_property_offset(107)
> +        with self.assertRaisesRegexp(FdtException, get_err(libfdt.BADOFF=
SET)):
> +            self.fdt.first_property_offset(107, QUIET_NOTFOUND)
> +        with self.assertRaisesRegexp(FdtException, get_err(libfdt.BADOFF=
SET)):
> +            self.fdt.next_property_offset(107, QUIET_NOTFOUND)

Isn't this a dupe of the previous statement?  This also looks like a
case where using QUIET_ALL could make it neater.

> +
> +        node =3D self.fdt.path_offset('/subnode@1/ss1')
> +        self.assertEquals(self.fdt.first_property_offset(node, QUIET_NOT=
FOUND),
> +                          -libfdt.NOTFOUND)
> +        with self.assertRaisesRegexp(FdtException, get_err(libfdt.NOTFOU=
ND)):
> +            self.fdt.first_property_offset(node)
> +
> +    def testGetName(self):
> +        """Check that we can get the name of a node"""
> +        self.assertEquals(self.fdt.get_name(0), '')
> +        node =3D self.fdt.path_offset('/subnode@1/subsubnode')
> +        self.assertEquals(self.fdt.get_name(node), 'subsubnode')
> +
> +        with self.assertRaisesRegexp(FdtException, get_err(libfdt.BADOFF=
SET)):
> +            self.fdt.get_name(-2)
> +
> +    def testGetPropertyByOffset(self):
> +        """Check that we can read the name and contents of a property"""
> +        root =3D 0
> +        poffset =3D self.fdt.first_property_offset(root)
> +        prop =3D self.fdt.get_property_by_offset(poffset)
> +        self.assertEquals(prop.name, 'compatible')
> +        self.assertEquals(prop.value, 'test_tree1\0')
> +
> +        with self.assertRaisesRegexp(FdtException, get_err(libfdt.BADOFF=
SET)):
> +            self.fdt.get_property_by_offset(-2)
> +        self.assertEquals(
> +                -libfdt.BADOFFSET,
> +                self.fdt.get_property_by_offset(-2, [libfdt.BADOFFSET]))
> +
> +    def testGetProp(self):
> +        """Check that we can read the contents of a property by name"""
> +        root =3D self.fdt.path_offset('/')
> +        value =3D self.fdt.getprop(root, "compatible")
> +        self.assertEquals(value, 'test_tree1\0')
> +        self.assertEquals(-libfdt.NOTFOUND, self.fdt.getprop(root, 'miss=
ing',
> +                                                             QUIET_NOTFO=
UND))
> +
> +        with self.assertRaisesRegexp(FdtException, get_err(libfdt.NOTFOU=
ND)):
> +            self.fdt.getprop(root, 'missing')
> +
> +        node =3D self.fdt.path_offset('/subnode@1/subsubnode')
> +        value =3D self.fdt.getprop(node, "compatible")
> +        self.assertEquals(value, 'subsubnode1\0subsubnode\0')
> +
> +    def testStrError(self):
> +        """Check that we can get an error string"""
> +        self.assertEquals(libfdt.strerror(-libfdt.NOTFOUND),
> +                          'FDT_ERR_NOTFOUND')
> +
> +    def testFirstNextSubnodeOffset(self):
> +        """Check that we can walk through subnodes"""
> +        node_list =3D []
> +        node =3D self.fdt.first_subnode(0, QUIET_NOTFOUND)
> +        while node >=3D 0:
> +            node_list.append(self.fdt.get_name(node))
> +            node =3D self.fdt.next_subnode(node, QUIET_NOTFOUND)
> +        self.assertEquals(node_list, ['subnode@1', 'subnode@2'])
> +
> +    def testFirstNextSubnodeOffsetExceptions(self):
> +        """Check except handling for first/next subnode functions"""
> +        node =3D self.fdt.path_offset('/subnode@1/subsubnode', QUIET_NOT=
FOUND)
> +        self.assertEquals(self.fdt.first_subnode(node, QUIET_NOTFOUND),
> +                          -libfdt.NOTFOUND)
> +        with self.assertRaisesRegexp(FdtException, get_err(libfdt.NOTFOU=
ND)):
> +            self.fdt.first_subnode(node)
> +
> +        node =3D self.fdt.path_offset('/subnode@1/ss1', QUIET_NOTFOUND)
> +        self.assertEquals(self.fdt.next_subnode(node, QUIET_NOTFOUND),
> +                          -libfdt.NOTFOUND)
> +        with self.assertRaisesRegexp(FdtException, get_err(libfdt.NOTFOU=
ND)):
> +            self.fdt.next_subnode(node)
> +
> +    def testDeleteProperty(self):
> +        """Test that we can delete a property"""
> +        node_name =3D '/subnode@1'
> +        self.assertEquals(self.GetPropList(node_name),
> +                          ['compatible', 'reg', 'prop-int'])
> +        node =3D self.fdt.path_offset('/%s' % node_name)
> +        self.assertEquals(self.fdt.delprop(node, 'reg'), 0)
> +        self.assertEquals(self.GetPropList(node_name),
> +                          ['compatible', 'prop-int'])
> +
> +    def testHeader(self):
> +        """Test that we can access the header values"""
> +        self.assertEquals(self.fdt.totalsize(), len(self.fdt._fdt))
> +        self.assertEquals(self.fdt.off_dt_struct(), 88)
> +
> +    def testPack(self):
> +        """Test that we can pack the tree after deleting something"""
> +        self.assertEquals(self.fdt.totalsize(), 693)
> +        node =3D self.fdt.path_offset('/subnode@2', QUIET_NOTFOUND)
> +        self.assertEquals(self.fdt.delprop(node, 'prop-int'), 0)
> +        self.assertEquals(self.fdt.totalsize(), 693)
> +        self.assertEquals(self.fdt.pack(), 0)
> +        self.assertEquals(self.fdt.totalsize(), 677)

Like exact offsets, exact sizes are probably a mistake here - a new
fdt version which adds a header field would break this, for example.
I think just checking the new size is less than the old should be
sufficient.

> +
> +    def testBadPropertyOffset(self):
> +        """Test that bad property offsets are detected"""
> +        with self.assertRaisesRegexp(FdtException, get_err(libfdt.BADOFF=
SET)):
> +            self.fdt.get_property_by_offset(13)
> +        with self.assertRaisesRegexp(FdtException, get_err(libfdt.BADOFF=
SET)):
> +            self.fdt.first_property_offset(3)
> +        with self.assertRaisesRegexp(FdtException, get_err(libfdt.BADOFF=
SET)):
> +            self.fdt.next_property_offset(3)
> +
> +    def testBadPathOffset(self):
> +        """Test that bad path names are detected"""
> +        with self.assertRaisesRegexp(FdtException, get_err(libfdt.BADPAT=
H)):
> +            self.fdt.path_offset('not-present')
> +
> +    def testEndian(self):
> +        """Check that we can convert from FDT (big endian) to native end=
ian"""
> +        self.assertEquals(libfdt.fdt32_to_cpu(0x10000000), 0x10)
> +
> +    def testQuietAll(self):
> +        """Check that exceptions can be masked by QUIET_ALL"""
> +        self.assertEquals(-libfdt.NOTFOUND,
> +                          self.fdt.path_offset('/missing', QUIET_ALL))
> +        self.assertEquals(-libfdt.BADOFFSET,
> +                          self.fdt.get_property_by_offset(13, QUIET_ALL))
> +        self.assertEquals(-libfdt.BADPATH,
> +                          self.fdt.path_offset('missing', QUIET_ALL))
> +
> +
> +if __name__ =3D=3D "__main__":
> +    unittest.main()
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index ed489db..76d20d8 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -769,6 +769,17 @@ fdtdump_tests () {
>      run_fdtdump_test fdtdump.dts
>  }
> =20
> +pylibfdt_tests () {
> +    TMP=3D/tmp/tests.stderr.$$
> +    python pylibfdt_tests.py 2> ${TMP}
> +    result=3D$(head -1 ${TMP})
> +
> +    # Extract the test results and add them to our totals
> +    tot_fail=3D$((tot_fail + $(echo $result | tr -d '\n.' | wc -c)))
> +    tot_pass=3D$((tot_pass + $(echo $result | tr -d '\nF' | wc -c)))
> +    tot_tests=3D$((tot_tests + $(echo $result | tr -d '\n' | wc -c)))
> +}
> +
>  while getopts "vt:me" ARG ; do
>      case $ARG in
>  	"v")
> @@ -787,7 +798,7 @@ while getopts "vt:me" ARG ; do
>  done
> =20
>  if [ -z "$TESTSETS" ]; then
> -    TESTSETS=3D"libfdt utilfdt dtc dtbs_equal fdtget fdtput fdtdump"
> +    TESTSETS=3D"libfdt utilfdt dtc dtbs_equal fdtget fdtput fdtdump pyli=
bfdt"
>  fi
> =20
>  # Make sure we don't have stale blobs lying around
> @@ -816,6 +827,9 @@ for set in $TESTSETS; do
>  	"fdtdump")
>  	    fdtdump_tests
>  	    ;;
> +	"pylibfdt")
> +	    pylibfdt_tests
> +	    ;;
>      esac
>  done
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--tKy6e3LXpfmanBFM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYr6AFAAoJEGw4ysog2bOSkGAQAICVOF1HKJq+NqbUS1L5xlKS
0/cJWP9ljfjPRyOhpx9hCvfLiNFSn76Zj8hF+cE9HZg4/PddZpepsCapwxDDgA8s
Y1Sp0cGT4Nk2HDBUhU6qxDKfk2Je8vnGYGznUpnuBMQxgTe3ISPo32BgsAsSCKsf
4nafMX5lDXvikltqXGXlPMH5GROB7abbMpRDD5+IEN47nzJXAc6se57gtd4ysqRu
wZ1bLg6031r0dssfzL2YBGt0yxtZI2SAoM7+MYk8pc1J1j5/K8uk8VUXa8OT2UY/
QT4LwXZrAM4q+5O5o0KMrZqU2dG7it37rS4iFgnFjBzyZYTjmmrIi3Sk1r3iXvYX
ShL9SVDjflQ7QLqpC7WCexGfxvVNUmerQTGakY12jtHzvY7hfR2+h9cwaNY+Lo4o
63eqiXgLnBGl/ubgVFGzvgtJNdBe8jb8qWDl0YNGY/CeQ6lfIlLDI47sIogDUn3g
fePFcDZwGFteEf7ELevwxNLFKD26RXGA0WI5jOyPWQzT+Xnxjdi96uIWRW7ZgFWu
LPiKCm5zqzhc2moBEo4Mi+4Flx5gtaO+HcSmsyg+6Gs9ORSRUSd/RFhMWyL+U+wM
onkx6PKLiFXL464UQELxOaFU1QlGcIrjqf7DzcSVHoWQFvnLG/Yyk7Vns+hHF3YR
S7BK/xj10Esoe++7rYkd
=k+FW
-----END PGP SIGNATURE-----

--tKy6e3LXpfmanBFM--
