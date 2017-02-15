From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v5 3/5] Mention pylibfdt in the documentation
Date: Wed, 15 Feb 2017 16:53:01 +1100
Message-ID: <20170215055301.GM12369@umbus.fritz.box>
References: <20170215035200.29934-1-sjg@chromium.org>
 <20170215035200.29934-4-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6CiRFyVmOOJ3DkBX"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1487138043;
        bh=A1AR424oknwZzvPDiIP+e8yy470KiDkMs0W68mCIFXs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oKGhDOhavF4SEReMDMl2LUiaNeWqWQxz878hEaT4n5FB9ElqgWKG616woV/IxCVR3
         AXWW4HwbuncYinesU3r3VMLDeOx9LrAmq6xgIyJPiteAzHA5ANs8SfNwCSspzTA5Tm
         5OeYQYvekF1p6ui6K2tuGRtm0juvijLbsk3v+ksI=
Content-Disposition: inline
In-Reply-To: <20170215035200.29934-4-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Bimmermann <b.bimmermann-LWAfsSFWpa4@public.gmane.org>, Ulrich Langenbach <ulrich.langenbach-srmvecZYGfHobmly5n/iKBvVK+yQ3ZXh@public.gmane.org>


--6CiRFyVmOOJ3DkBX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 14, 2017 at 08:51:58PM -0700, Simon Glass wrote:
> Add a note about pylibfdt in the README.
>=20
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>=20
> Changes in v5:
> - Use an interactive session to demonstrate pylibfdt
> - Mention that more work remains
>=20
> Changes in v4: None
> Changes in v3: None
> Changes in v2:
> - Add details on how to obtain full help and code coverage
>=20
>  README | 43 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>=20
> diff --git a/README b/README
> index f92008f..d4157ad 100644
> --- a/README
> +++ b/README
> @@ -7,6 +7,49 @@ DTC and LIBFDT are maintained by:
>  David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
>  Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
> =20
> +
> +Python library
> +--------------
> +
> +A Python library is also available. To build this you will need to insta=
ll
> +swig and Python development files. On Debian distributions:
> +
> +   sudo apt-get install swig python-dev
> +
> +The library provides an Fdt class which you can use like this:
> +
> +$ PYTHONPATH=3D../pylibfdt python
> +>>> import libfdt
> +>>> fdt =3D libfdt.Fdt(open('test_tree1.dtb').read())
> +>>> node =3D fdt.path_offset('/subnode@1')

I'd suggest adding some prints of the node values to show that they're
integers, rather than some exotic handle.

> +>>> prop_offset =3D fdt.first_property_offset(node)
> +>>> prop =3D fdt.get_property_by_offset(prop_offset)
> +>>> print '%s=3D%s' % (prop.name, prop.value)
> +compatible=3Dsubnode1

And maybe consider %r instead of %s for the values, to show the
included '\0' etc.

> +>>> node2 =3D fdt.path_offset('/')
> +>>> print fdt.getprop(node2, 'compatible')
> +test_tree1
> +
> +You will find tests in tests/pylibfdt_tests.py showing how to use each
> +method. Help is available using the Python help command, e.g.:
> +
> +    $ cd pylibfdt
> +    $ python -c "import libfdt; help(libfdt)"
> +
> +If you add new features, please check code coverage:
> +
> +    $ sudo apt-get install python-pip python-pytest
> +    $ sudo pip install coverage
> +    $ cd tests
> +    $ coverage run pylibfdt_tests.py
> +    $ coverage html
> +    # Open 'htmlcov/index.html' in your browser
> +
> +
> +More work remains to support all of libfdt, including access to numeric
> +values.
> +
> +
>  Mailing list
>  ------------
>  The following list is for discussion about dtc and libfdt implementation

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--6CiRFyVmOOJ3DkBX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYo+y9AAoJEGw4ysog2bOSsfIQANzTl19gHexfeQb/PknnXNNE
hAkMB6xBaEQSXf+BNMDnUre9w171aBCTI69oqP0oFreFeEwTAoSTq3RWcqUTmUSu
5iR3LFQFLQX3K6BxlSp9RQRbo+3coA8Q+OoIl+TLdAaSnvKBUVrllpKeqKrTIBqg
fzQk/fglle4xBA5AoB1tO3UM3EVNy6V4YO7/1bYrZeMZdmdhz9nwLsSvMAQLAV14
XjWhCNgVoOFYTIU1RUTA4rSarBdyrpQpXmzySUuMYfZMm4oeJ5SBNXca2Htl8X8v
1wG+E7gGKA+JDYhS6RlT6b/ejUItPLqud5rJLnIyDZwDGIyUcE/uKTrBC9/3tQ3c
SwKysVRyunxkLhRXoBYz6OHFU6QThFQ69MyjRBt2WnnlnX1ORvw4JFqgsZXM4NX8
t5mvhoBiUrCl5tIxXMH5xf9Ic8MoaiDPbsC8FU1Wi9yJUHSzeMo1iL51fFVdrvdg
GIajd7KFg37zHHRwgi44V3AJGBhT/q4O1BcctOLeQvJvzjIfHkpTnYrj/YVr3Xh6
XHclRe+w45zhwnpClzvxkX5ZHYqLBJB5FnXgYqFTDA6HL1tfkg6DD2CWrq+85H9e
xzY+t6L4feb7jCmWW2vh/uXRD2RcphW6y0nAFHWy4rzN7LRHfegHLkSOjInU27YF
TIe2bsylSKECFI6otynl
=t/+G
-----END PGP SIGNATURE-----

--6CiRFyVmOOJ3DkBX--
