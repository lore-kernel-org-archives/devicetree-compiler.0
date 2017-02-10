From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v4 3/5] Mention pylibfdt in the documentation
Date: Fri, 10 Feb 2017 15:58:14 +1100
Message-ID: <20170210045814.GE25381@umbus>
References: <20170205201323.15411-1-sjg@chromium.org>
 <20170205201323.15411-4-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="sfyO1m2EN8ZOtJL6"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1486703135;
        bh=yib7aL6OCfNnneydh8pWjaX9pAoHxUMTOqt5CU5H5b0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=g4jDTFbKtvCeY35giPKjBz6LrgRilv/ZaTXTlHEHG4Sd9Ak7QWZm11XgvgfOrwma9
         Je9xKiXvUVRluz2xpaBs81UIc3eV1n6J3RIcBoHvxKsO0n7qjni03bY7hFmwbJmNOM
         T+4FtHaSH2WZcsfODzI9qBwA1V2836M9cx/JesJQ=
Content-Disposition: inline
In-Reply-To: <20170205201323.15411-4-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Bimmermann <b.bimmermann-LWAfsSFWpa4@public.gmane.org>, Ulrich Langenbach <ulrich.langenbach-srmvecZYGfHobmly5n/iKBvVK+yQ3ZXh@public.gmane.org>


--sfyO1m2EN8ZOtJL6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 05, 2017 at 01:13:21PM -0700, Simon Glass wrote:
> Add a note about pylibfdt in the README.
>=20
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>=20
> Changes in v4: None
> Changes in v3: None
> Changes in v2:
> - Add details on how to obtain full help and code coverage
>=20
>  README | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>=20
> diff --git a/README b/README
> index f92008f..7191d1b 100644
> --- a/README
> +++ b/README
> @@ -7,6 +7,39 @@ DTC and LIBFDT are maintained by:
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
> +    fdt =3D _ReadFdt('test_tree1.dtb')

This seems to be using the test wrapper _ReadFdt(0 rather than the fdt
class proper.

> +    node =3D fdt.path_offset('/test-node')
> +    prop =3D fdt.first_property_offset(node)
> +    print 'Property name: %s' % fdt.string(prop.nameoff)
> +    print 'Property data: %s' % fdt.data(prop.nameoff)

I think this is not quite up to date with the current version.

In addition, I think the example would be more informative if you
showed an interactive session, demonstrating how the offsets and
property values are encoded as Python ints and strings.


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
>  Mailing list
>  ------------
>  The following list is for discussion about dtc and libfdt implementation

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--sfyO1m2EN8ZOtJL6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYnUhmAAoJEGw4ysog2bOSVwUP/juPE/afX/9da/nseAYx5XjT
FBPL9j/kpalIGO3o/g1+guRJef6JCYLECpvsCFnWpw9qJRYoXrShH1l8e4ltUMgO
6T/fkBd9Rx3DQVyVCGv44tkBCV2CEw1+cSi6WtRu8j1QMBJ/Gj6ueZMB/9i8EFk4
XotkppyHcavDVtFihtCkA/3voGAJDzo4Cah+p3bDDGMgS1TmAracEup40OgTK2D4
XXrGn6CZCJs3L6pkNovmd6BhdxIzScRolkXq1e0ZH9PRJjVwH0NWYZ2as+p4ospi
jVKFXD+DhVSnk/U3AOdAn8FYPpZntJD1tU3yG7IGDt9SrR6/0JIcl2Wgq0x6TlvB
CRYKgaa2s513p1eEzjuj4Y/s8aPs2rnXwvE5RB1+6rz+eFEn0xlMBUoWvVI4dTEI
j2YyQoi7gERvngL+NFpABkv09+C5KyNyKqK2Zh0Kwqx0l4Dgk9ptQW/PFsLz+xox
QSj3D8EKxlP+t7KEeS4F7w+PatDa2B0VvoxiFSTpZ/+iLQw1++TWtdC26mfoG9j3
Y4Uhdmnm84mNUGl4sPmZgUvpT1tiA5MbDzvQyBewTLifLl1zBJI+RSOQ5HGhUo8s
6Am6rBUitM86tyZjb5e6MoQHORQGF4zi4iddzga6W/9lfDh58+kR0QlnGqAbGr+o
+KL/+BXPLgzGnDCJrgW6
=Vioh
-----END PGP SIGNATURE-----

--sfyO1m2EN8ZOtJL6--
