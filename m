From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v7 3/5] Mention pylibfdt in the documentation
Date: Fri, 24 Feb 2017 13:53:55 +1100
Message-ID: <20170224025355.GK17615@umbus.fritz.box>
References: <20170222043340.17008-1-sjg@chromium.org>
 <20170222043340.17008-4-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="8kI7hWEHMS8Z+7/0"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1487904959;
        bh=GjWuhOmsyvdsogrN2WbpEr8gLQiOIAQ2VCoPXUNVlh0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BLyZwsgWF626Usxb82NtSVLaIA7i4RsfId8uiEI8wnDLtZla9D7ajvRvARUzhj/oD
         0pAJHTPEWjEc/U1RVx8q2vkmNiFXI8Z6tUI8AAI8hsLopSZq/lfjojB7uqmzI7UUBY
         MGNs94XVYTqzSwMcifeA+mVR2VLyjckA6uZEMrTg=
Content-Disposition: inline
In-Reply-To: <20170222043340.17008-4-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Bimmermann <b.bimmermann-LWAfsSFWpa4@public.gmane.org>, Ulrich Langenbach <ulrich.langenbach-srmvecZYGfHobmly5n/iKBvVK+yQ3ZXh@public.gmane.org>


--8kI7hWEHMS8Z+7/0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 21, 2017 at 09:33:38PM -0700, Simon Glass wrote:
> Add a note about pylibfdt in the README.
>=20
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Reviewed-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

> ---
>=20
> Changes in v7: None
> Changes in v6:
> - Update example to print the node value as an integer
> - Update example to print the bytestring as well as the string
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
>  README | 47 +++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>=20
> diff --git a/README b/README
> index f92008f..96d8486 100644
> --- a/README
> +++ b/README
> @@ -7,6 +7,53 @@ DTC and LIBFDT are maintained by:
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
> +>>> print node
> +124
> +>>> prop_offset =3D fdt.first_property_offset(node)
> +>>> prop =3D fdt.get_property_by_offset(prop_offset)
> +>>> print '%s=3D%r' % (prop.name, prop.value)
> +compatible=3Dbytearray(b'subnode1\x00')
> +>>> print '%s=3D%s' % (prop.name, prop.value)
> +compatible=3Dsubnode1
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

--8kI7hWEHMS8Z+7/0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYr6BDAAoJEGw4ysog2bOS6RgP/RNT0dBMmZi0THJPjynYVtSj
E/ts86orU1AwBaKWxcHnR4CyeLRZs7CKFFDMYhddMk0lutRbzqSuN3YggszL6z5B
JJyzE5dTjN1N5FIUv/L9LU7r3FxAW53qOBCKEEmPdsILP+YqhEK3QP0ohRjM6r+A
iP6G8ZwWWB338RI6L9WSYcITHrYHtECwLvvAJMnJ4SaBBtpIiY8PN0gjNK/SYhZc
3gNZxk/wL47Eal9r5Mmpc2oggSQpX2HDLJy0gRyhXCiIvSLUP5P4IEj96YvnRaPh
Z78s1UBA+Dc65LdP1G1iRLKZpAyxlGRuJM9JSMLvvX6IQ2uIKOqXnbUC8m4c2kgM
GvzeZKzzdEuZ6QRLoor6d3lg6AvA3LzGE5kFkqaWwdx6oMnrvAMBzcdLbcyz9iWY
CSbazd60DPuiWGnGd2yOgqJkHOPbWFJGvOxa7KCaGZKTVPaKaGkRDEKNbazMgJJP
i7xGIUbgmealZBzqcO3xbB5iDnAcf8SKLow8BDfwNKy2Pcs6Lz4lLAIxKoxXi0o3
ObjMSecb+ELMJMuSRROUfLw66kJ9hWuuD/573hN06iwl6hSS6UNDs73nfLcs6Gdg
xHKGT/qr/qzMSj7AVk1TUyA+EZ02VUH5nGq2ryCiI4MEmvPx5Ng0Ufz0rpzJQsrD
6tpWDnxFN/9ibjHx+ytx
=zUWx
-----END PGP SIGNATURE-----

--8kI7hWEHMS8Z+7/0--
