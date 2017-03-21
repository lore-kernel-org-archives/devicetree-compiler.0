From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v11 0/5] Introduce Python bindings for libfdt
Date: Tue, 21 Mar 2017 16:35:31 +1100
Message-ID: <20170321053531.GA19078@umbus.fritz.box>
References: <20170317221434.15390-1-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="n8g4imXOkfNTN/H1"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1490074788;
        bh=xpZ18Wk+9ZQSIv7nkAn3+DZ7pwiMrhx+7Ds9cKnZbDE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ifHN6IX6iP6wOKW8XezYtKOGa6hyVMpma0/wvjuDQbE9VpUo6zCbkvZIYEVUZT/mE
         JGOP/M07o8MoVnHORasxxLTCCIiVacvhLNnXMPqobDE3Q9AInIGw3t8ncNBxGfE4Zk
         +RsnNhNKvMsDYbR60zdTiDph6lEPeUnUhZBq+XLM=
Content-Disposition: inline
In-Reply-To: <20170317221434.15390-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Bimmermann <b.bimmermann-LWAfsSFWpa4@public.gmane.org>, Ulrich Langenbach <ulrich.langenbach-srmvecZYGfHobmly5n/iKBvVK+yQ3ZXh@public.gmane.org>


--n8g4imXOkfNTN/H1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 17, 2017 at 04:14:29PM -0600, Simon Glass wrote:
> At present libfdt consists of only a C implementation. Many scripts are
> written using Python so it useful to have Python bindings for libfdt.
> Apparently this has never been attempted before, or if so I cannot find a
> reference.
>=20
> This series starts the process of adding this support, with just a
> bare-bones set of methods.
>=20
> The v11 series provides binding that can be used like this:
>=20
>     fdt =3D libfdt.Fdt(open(fname).read())
>     node =3D fdt.path_offset('/subnode@1')
>     print fdt.get_prop(node, 'compatible')
>     subnode =3D fdt.first_subnode(node, quiet=3D[libfdt.NOTFOUND])
>     while subnode > 0:
>         print fdt.get_name(subnode)
>         subnode =3D fdt.next_subnode(subnode, quiet=3D[libfdt.NOTFOUND])
>=20
> This version includes a simple class for properties.

Applied to master.  I made a small change in the last patch, so that
the error message when the python packages aren't installed is less
scary looking.

>=20
> Changes in v11:
> - Show test output always
>=20
> Changes in v10:
> - Show test output when there are failures
>=20
> Changes in v9:
> - Drop PYLIBFDT_CLEANFILES
> - Add _libfdt.so to PYLIBFDT_cleanfiles
> - Support 'make clean' properly with pylibfdt
> - Move run_tests.sh updates to this patch
> - Only run the pylibfdt tests automatically if we can build pylibfdt
> - Update commit message to reflect swig/Python.h detection
> - Update Makefile shell command to support dash shell
>=20
> Changes in v8:
> - Fix up setup.py name and author
> - Move QUITE_ALL into a single assignment
> - Drop fdt32_to_cpu()
> - Adjust fdt_get_property_by_offset() to rely on the typemap more
> - Move pylibfdt_copy_value(() functionality into a typemap
> - Add an fdt parameter to the [const] void * typemaps
> - Create an output typemap for struct fdt_property *
> - Drop the arg4 TODO comment
> - Avoid using hard-coded offsets (ROOT_PROPS)
> - Use types.ModuleType instead of type(str)
> - Compare exception number instead of using a regex
> - Avoid using hard-coded size
> - Drop testEndian()
> - Move the changes to run_tests.sh to a later commit
> - Add comments to testPropertyOffsetExceptions()
> - Drop all the namelen functions from the Python bindings
> - Only build pylibfdt if we have swig and Python.h
>=20
> Changes in v7:
> - Add QUIET_ALL to silence all exceptions
> - Add a test for QUIET_ALL
>=20
> Changes in v6:
> - Use a tuple instead of list for the default quiet parameter
> - Use a tuple instead of list for QUIET_NOTFOUND
> - Use 'list' instead of 'tuple' for the comment in check_err_null()
> - Return a bytearray from getprop()
> - Adjust the Property constructor to accept the name and value
> - Use uint8_t for pylibfdt_copy_value
> - Adjust tests to avoid checking a hard-coded offset
> - Use 0 instead of self.fdt.path_offset('/')
> - Adjust the totalsize() test to compare against the file size
> - Adjust test result processing to avoid using awk
> - Update example to print the node value as an integer
> - Update example to print the bytestring as well as the string
>=20
> Changes in v5:
> - Use a 'quiet' parameter instead of quiet versions of functions
> - Add a Property object to hold a property's name and value
> - Drop the data() and string() functions which are not needed now
> - Rename pylibfdt_copy_data() tp pylibfdt_copy_value()
> - Change order of libfdt.h inclusion to avoid #ifdef around libfdt macros
> - Drop fdt_offset_ptr() and fdt_getprop_namelen() from the swig interface
> - Use $(SWIG) to call swig from the Makefile
> - Review function comments
> - Adjust tests to match new swig bindings
> - Use an interactive session to demonstrate pylibfdt
> - Mention that more work remains
> - Update commit message
> - Drop #ifdef around fdt_get_header() macros
> - Fix 'possible' typo
>=20
> Changes in v4:
> - Make the library less pythonic to avoid a shaky illusion
> - Drop classes for Node and Prop, along with associated methods
> - Include libfdt.h instead of repeating it
> - Add support for fdt_getprop()
> - Bring in all libfdt functions (but Python support is missing for many)
> - Add full comments for Python methods
> - Drop tests that are no-longer applicable
> - Add a get for getprop()
> - Add new patch to adjust libfdt.h to work with swig
>=20
> Changes in v3:
> - Make the library more pythonic
> - Add classes for Node and Prop along with methods
> - Add an exception class
> - Use Python to generate exeptions instead of SWIG
> - Add some more tests
>=20
> Changes in v2:
> - Add exceptions when functions return an error
> - Correct Python naming to following PEP8
> - Use a class to encapsulate the various methods
> - Include fdt.h instead of redefining struct fdt_property
> - Use bytearray to avoid the SWIG warning 454
> - Add comments
> - Update tests for new pylibfdt
> - Add a few more tests to increase coverage
> - Add details on how to obtain full help and code coverage
>=20
> Simon Glass (5):
>   Add an initial Python library for libfdt
>   Add tests for pylibfdt
>   Mention pylibfdt in the documentation
>   Adjust libfdt.h to work with swig
>   Build pylibfdt as part of the normal build process
>=20
>  Makefile                   |  35 +++-
>  README                     |  47 +++++
>  libfdt/libfdt.h            |  21 ++-
>  pylibfdt/.gitignore        |   3 +
>  pylibfdt/Makefile.pylibfdt |  17 ++
>  pylibfdt/libfdt.swig       | 433 +++++++++++++++++++++++++++++++++++++++=
++++++
>  pylibfdt/setup.py          |  34 ++++
>  tests/pylibfdt_tests.py    | 288 ++++++++++++++++++++++++++++++
>  tests/run_tests.sh         |  28 +++
>  9 files changed, 903 insertions(+), 3 deletions(-)
>  create mode 100644 pylibfdt/.gitignore
>  create mode 100644 pylibfdt/Makefile.pylibfdt
>  create mode 100644 pylibfdt/libfdt.swig
>  create mode 100644 pylibfdt/setup.py
>  create mode 100644 tests/pylibfdt_tests.py
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--n8g4imXOkfNTN/H1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJY0LujAAoJEGw4ysog2bOSW30P/1j5X0TsTdOh0dsSp3J9+zVG
VRLQWbVt0YipLwlJh8wAu374bpPwgr7pbQoXvewyraIKyNK5iO1tmHHtkaUvmf8k
rq5uPrDzR5aIosfmTdVqljLFfA2o+wFZyYfZuWKmpadpVjCcP/wsKhlfaka5KZ+4
oREjoZBztYdTJpKi8tohPPjPBLK/s3+hAZ1VBCGgIVXdgel3iF86DZbpMDWnDK6R
Fsz5a32rJ388UevZBpmXgl2KCmCb7Kri1jpc3p3mFCMfdOEuUyz1pBilve1k1qRd
/DmK0qSwySZPkQtyvgtQ1iXnpX57jJfjs/6r8chXVLRf2dBEFMnTXLc/ARo072zy
Tq6cWqWESwzcvNKXtIBAWahkkwWelYS3qKJn+tdAFcHkLiebragskhm1g+kfXkmz
R1EiG0zl5CJUT8fFtH3DS2R4BaIBS1HBHtd9/LzFkDKalPBwYgVP9Foogjh88Bi2
UpCdirVtv/rwZV/aw25CVtXRT2g/szLXPyRcyLOfU5C017PvrAwBKyBfGwCFi9i9
BSq9XCwLORxxGOR6FMFAXL8cWCI9Uc0Xo2FL47QjfnDpszObuPEqR3izmeSQwipc
9Tpza7Enlpql6e4FIHWN6Gd3af2/3o6kCexqf8AKT76lL6jx+Q3a57+d5i6/rSzL
jmOYGd67AVC2uUNepp2b
=glI4
-----END PGP SIGNATURE-----

--n8g4imXOkfNTN/H1--
