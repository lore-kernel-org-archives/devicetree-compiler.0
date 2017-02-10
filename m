From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v4 2/5] Add tests for pylibfdt
Date: Fri, 10 Feb 2017 15:56:19 +1100
Message-ID: <20170210045619.GD25381@umbus>
References: <20170205201323.15411-1-sjg@chromium.org>
 <20170205201323.15411-3-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="d01dLTUuW90fS44H"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1486703134;
        bh=YCw0ze2sTkM0+h0LHutzpeeD9GV2mdVXGxXhwAZdrVc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EDNbCcWL/iYS8qaAW2rDP+bLV5VmPAdm4jdORtIVzoajObIXxsUA0kPdr06nwbMp8
         XccjoYR8vmOW98fSTPijSpKJV+Mxs0f8qa8aRVTnKNOeaYJQ5sQjJbcSjPyHDpIV0F
         X5vVrL/JLpsoGP+zUlyIvPM/vb/u59YVw8p7dL1o=
Content-Disposition: inline
In-Reply-To: <20170205201323.15411-3-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Bimmermann <b.bimmermann-LWAfsSFWpa4@public.gmane.org>, Ulrich Langenbach <ulrich.langenbach-srmvecZYGfHobmly5n/iKBvVK+yQ3ZXh@public.gmane.org>


--d01dLTUuW90fS44H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 05, 2017 at 01:13:20PM -0700, Simon Glass wrote:
> Add a set of tests to cover the functionality in pylibfdt.
>=20
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

I'd suggest as a base writing Python-equivalent tests for everything
in tree1_tests().

> ---
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
>  tests/run_tests.sh      |  19 +++-
>  2 files changed, 293 insertions(+), 1 deletion(-)
>  create mode 100644 tests/pylibfdt_tests.py
>=20
> diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
> new file mode 100644
> index 0000000..66eb45b
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
> +from libfdt import FdtException
> +
> +# Offsets of properties in the root node
> +ROOT_PROPS =3D (8, 32, 48, 68, 92, 108)
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
> +        poffset =3D self.fdt.first_property_offset_quiet(node)
> +        while poffset > 0:
> +            pdata =3D self.fdt.get_property_by_offset(poffset)
> +            prop_list.append(self.fdt.string(pdata.nameoff))
> +            poffset =3D self.fdt.next_property_offset_quiet(poffset)
> +        return prop_list
> +
> +    def testImport(self):
> +        """Check that we can import the library correctly"""
> +        self.assertEquals(type(libfdt), type(sys))
> +
> +    def testPathOffset(self):
> +        """Check that we can find the offset of a node"""
> +        self.assertEquals(self.fdt.path_offset('/'), 0)
> +        self.assertEquals(self.fdt.path_offset('/subnode@1'), 124)
> +        with self.assertRaisesRegexp(FdtException, get_err(libfdt.NOTFOU=
ND)):
> +            self.fdt.path_offset('/wibble')
> +        self.assertEquals(self.fdt.path_offset_quiet('/wibble'),
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
> +        self.assertEquals(self.fdt.next_property_offset_quiet(ROOT_PROPS=
[-1]),
> +                          -libfdt.NOTFOUND)
> +
> +    def testPropertyOffsetExceptions(self):
> +        """Check that exceptions are raised as expected"""
> +        with self.assertRaisesRegexp(FdtException, get_err(libfdt.NOTFOU=
ND)):
> +            self.fdt.next_property_offset(108)
> +        with self.assertRaisesRegexp(FdtException, get_err(libfdt.BADOFF=
SET)):
> +            self.fdt.next_property_offset(107)
> +        with self.assertRaisesRegexp(FdtException, get_err(libfdt.BADOFF=
SET)):
> +            self.fdt.first_property_offset_quiet(107)
> +        with self.assertRaisesRegexp(FdtException, get_err(libfdt.BADOFF=
SET)):
> +            self.fdt.next_property_offset_quiet(107)
> +
> +        node =3D self.fdt.path_offset('/subnode@1/ss1')
> +        self.assertEquals(self.fdt.first_property_offset_quiet(node),
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
> +    def testGetString(self):
> +        """Test that we can get a string from the string table"""
> +        node =3D self.fdt.path_offset('/subnode@2')
> +        poffset =3D self.fdt.first_property_offset(node)
> +        pdata =3D self.fdt.get_property_by_offset(poffset)
> +        self.assertEquals(self.fdt.string(pdata.nameoff), 'reg')
> +
> +    def testGetPropertyByOffset(self):
> +        """Check that we can read the name and contents of a property"""
> +        root =3D self.fdt.path_offset('/')
> +        poffset =3D self.fdt.first_property_offset(root)
> +        pdata =3D self.fdt.get_property_by_offset(poffset)
> +        self.assertEquals(libfdt.fdt32_to_cpu(pdata.tag), 3)
> +        self.assertEquals(libfdt.fdt32_to_cpu(pdata.len), 11)
> +        self.assertEquals(self.fdt.string(pdata.nameoff), 'compatible')
> +        self.assertEquals(libfdt.data(pdata), 'test_tree1\0')
> +
> +        with self.assertRaisesRegexp(FdtException, get_err(libfdt.BADOFF=
SET)):
> +            self.fdt.get_property_by_offset(-2)
> +
> +    def testGetPropertyByOffset(self):
> +        """Check that we can read the details of a property"""
> +        root =3D self.fdt.path_offset('/')
> +        poffset =3D self.fdt.first_property_offset(root)
> +        prop =3D self.fdt.get_property_by_offset(poffset)
> +        self.assertEquals(self.fdt.string(prop.nameoff), 'compatible')
> +        self.assertEquals(libfdt.data(prop), 'test_tree1\0')
> +
> +        with self.assertRaisesRegexp(FdtException, get_err(libfdt.BADOFF=
SET)):
> +            self.fdt.get_property_by_offset(-2)
> +
> +    def testGetProp(self):
> +        """Check that we can read the contents of a property by name"""
> +        root =3D self.fdt.path_offset('/')
> +        data =3D self.fdt.getprop(root, "compatible")
> +        self.assertEquals(data, 'test_tree1\0')
> +        self.assertEquals(None, self.fdt.getprop_quiet(root, 'missing'))
> +
> +        with self.assertRaisesRegexp(FdtException, get_err(libfdt.NOTFOU=
ND)):
> +            self.fdt.getprop(root, 'missing')
> +
> +        node =3D self.fdt.path_offset('/subnode@1/subsubnode')
> +        data =3D self.fdt.getprop(node, "compatible")
> +        self.assertEquals(data, 'subsubnode1\0subsubnode\0')
> +
> +    def testStrError(self):
> +        """Check that we can get an error string"""
> +        self.assertEquals(libfdt.strerror(-libfdt.NOTFOUND),
> +                          'FDT_ERR_NOTFOUND')
> +
> +    def testFirstNextSubnodeOffset(self):
> +        """Check that we can walk through subnodes"""
> +        node_list =3D []
> +        node =3D self.fdt.first_subnode_quiet(0)
> +        while node >=3D 0:
> +            node_list.append(self.fdt.get_name(node))
> +            node =3D self.fdt.next_subnode_quiet(node)
> +        self.assertEquals(node_list, ['subnode@1', 'subnode@2'])
> +
> +    def testFirstNextSubnodeOffsetExceptions(self):
> +        """Check except handling for first/next subnode functions"""
> +        node =3D self.fdt.path_offset_quiet('/subnode@1/subsubnode')
> +        self.assertEquals(self.fdt.first_subnode_quiet(node), -libfdt.NO=
TFOUND)
> +        with self.assertRaisesRegexp(FdtException, get_err(libfdt.NOTFOU=
ND)):
> +            self.fdt.first_subnode(node)
> +
> +        node =3D self.fdt.path_offset_quiet('/subnode@1/ss1')
> +        self.assertEquals(self.fdt.next_subnode_quiet(node), -libfdt.NOT=
FOUND)
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
> +        self.assertEquals(self.fdt.totalsize(), 693)
> +        self.assertEquals(self.fdt.off_dt_struct(), 88)
> +
> +    def testPack(self):
> +        """Test that we can pack the tree after deleting something"""
> +        self.assertEquals(self.fdt.totalsize(), 693)
> +        node =3D self.fdt.path_offset_quiet('/subnode@2')
> +        self.assertEquals(self.fdt.delprop(node, 'prop-int'), 0)
> +        self.assertEquals(self.fdt.totalsize(), 693)
> +        self.assertEquals(self.fdt.pack(), 0)
> +        self.assertEquals(self.fdt.totalsize(), 677)
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
> +if __name__ =3D=3D "__main__":
> +    unittest.main()
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index ed489db..144feb6 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -769,6 +769,20 @@ fdtdump_tests () {
>      run_fdtdump_test fdtdump.dts
>  }
> =20
> +pylibfdt_tests () {
> +    TMP=3D/tmp/tests.stderr.$$
> +    python pylibfdt_tests.py 2> ${TMP}
> +    result=3D$(head -1 ${TMP} | awk \
> +        '{ for (i =3D 1; i <=3D length($0); i++) { \
> +            result =3D substr($0,i,1); fail =3D fail + (result =3D=3D "F=
"); \
> +            ok =3D ok + (result =3D=3D ".")}; } END { print fail,  ok, f=
ail + ok}')
> +
> +    # Extract the test results and add them to our totals
> +    tot_fail=3D$((tot_fail + $(echo $result | cut -d" " -f 1)))
> +    tot_pass=3D$((tot_pass + $(echo $result | cut -d" " -f 2)))
> +    tot_tests=3D$((tot_tests + $(echo $result | cut -d" " -f 3)))
> +}
> +
>  while getopts "vt:me" ARG ; do
>      case $ARG in
>  	"v")
> @@ -787,7 +801,7 @@ while getopts "vt:me" ARG ; do
>  done
> =20
>  if [ -z "$TESTSETS" ]; then
> -    TESTSETS=3D"libfdt utilfdt dtc dtbs_equal fdtget fdtput fdtdump"
> +    TESTSETS=3D"libfdt utilfdt dtc dtbs_equal fdtget fdtput fdtdump pyli=
bfdt"
>  fi
> =20
>  # Make sure we don't have stale blobs lying around
> @@ -816,6 +830,9 @@ for set in $TESTSETS; do
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

--d01dLTUuW90fS44H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYnUfzAAoJEGw4ysog2bOSBSAP/1pCg2hvZAAPJLleENbn1ZeJ
OHuLB7B87O0j2FSp5goXWb+DCXNzALDSPmrA8PxaMRxRvuXU0PhCBg9u1ky+qbje
fqyz0ZY/bkpIIS3gy82G63JPMdghHzWOQSOrVi4iIJqnNAzCQ440I0dj9OD+OEYS
n9+1Q2+f5aFlmMVL+ymveSARL1X5taOZI0vuKecyFw3sIFuHBctsFwQ8ruA46A9M
RqVSbrFdhZgN97TFggey0Vroed4OWryLYi03N3WcwXm1rqRswbPtv3Za0hLu7fFv
8yrlxiZw5grlIEcHJm9KaFNMKTWQoHSl+Itmk0zduww8p5wf6adDKDpo0ptIPSS+
CZpBJIfCdkiKAC/lCg7+q+o+YfViI4lIyhKyukLGjFENRHatN+lselZRQH0jdPbv
Nj8uiJZC3ZdoH+Jv+9HZm7MSckg71wtKsBIqbUNEf/N3J0F3di0/ipWMKTzKsxWM
8m4nZvVPIGOxDlFWxS/HRC7cENConOZtWZ6L2bm/cra5ZTzDDEgsaEr1uGTRfado
fnRJENkIFeJ2WvGd8+uYrSPFFGo3IvUmtjLbc8xUPoSSUtt/zqM28zz9N8UZLIXl
3pFHIeZ3l37KpPbxPBXaiYFYyW1uirusyWLiZiXXu4sbFXs8+yJ4XloLoxxXpSQw
qGqAEzROWonVvMSAYASm
=htYa
-----END PGP SIGNATURE-----

--d01dLTUuW90fS44H--
