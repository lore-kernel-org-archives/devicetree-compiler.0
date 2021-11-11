From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 0/4] Improve pylibfdt python packaging
Date: Thu, 11 Nov 2021 14:41:35 +1100
Message-ID: <YYyQ747Z6EeGIg0s@yekko>
References: <20211111011135.2386773-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Xzfh3geBddanhTnw"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1636602101;
        bh=FaMkEQ7+tyjDH3H8uY4pXtSoGOdym/B3DizOvkChEVw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GoBB7W+XTX8L7+6NXtmWrf8AOOBYDT2jV/6WwGLEnlJHQsfYKKRDhRKTRC6jErMw/
         +nb+0/gxLLYVLNWxCGwuAqt/LDyd1boYOoSVey2PPSqtQACvfVouKjG9YW/atFpGvn
         DG0zjzVGstujxtpH3du4bE3+sJpU4zWL0VVc7DJA=
Content-Disposition: inline
In-Reply-To: <20211111011135.2386773-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Bruce Ashfield <bruce.ashfield-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>


--Xzfh3geBddanhTnw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 10, 2021 at 07:11:31PM -0600, Rob Herring wrote:
> I'm interested in getting pylibfdt into PyPI and ran into a few issues
> with pylibfdt using the python packaging tools. Primarily, pip didn't
> work nor did setup.py sdist and bdist_wheel subcommands. This series
> fixes those issues.
>=20
> I've left meson calling setup.py intact for now, but think it's the
> wrong way around. In fact, there's actually some efforts to make meson
> the backend for pip/setuptools. I made several attempts to completely
> eliminate putting files in the source tree without success. Also, I
> noticed a meson install builds pylibfdt twice (though make may too).
>=20
> I don't think I broke anything. Tests and installs both work with make
> and meson.

Applied, it certainly looks better to me.

However, I've just spotted another nasty problem.  I think it must
have started with moving to Fedora 35 on my laptop.  A bunch of the
Python tests now fail like this:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
ERROR: testGetIntProperties (__main__.PyLibfdtBasicTests)
Test that we can access properties as integers
----------------------------------------------------------------------
SystemError: PY_SSIZE_T_CLEAN macro must be defined for '#' formats

The above exception was the direct cause of the following exception:

Traceback (most recent call last):
  File "/home/dwg/src/dtc/tests/./pylibfdt_tests.py", line 378, in testGetI=
ntProperties
    self.assertEqual(0xdeadbeef, self.get_prop("prop-hex32").as_uint32())
  File "/home/dwg/src/dtc/tests/./pylibfdt_tests.py", line 374, in get_prop
    return self.fdt2.getprop(0, name)
  File "/home/dwg/src/dtc/tests/../pylibfdt/libfdt.py", line 451, in getprop
    pdata =3D check_err_null(fdt_getprop(self._fdt, nodeoffset, prop_name),
  File "/home/dwg/src/dtc/tests/../pylibfdt/libfdt.py", line 1279, in fdt_g=
etprop
    return _libfdt.fdt_getprop(fdt, nodeoffset, name)
SystemError: <built-in function fdt_getprop> returned a result with an exce=
ption set

Any ideas?

Also, Rob, did you have patches to finish the conversion of the
Makefiles to wrappers around meson?  If so, I'm sorry I've lost track
of them.  Can you repost please?  That README addition with meson
native building instructions would also be really good to have.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Xzfh3geBddanhTnw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmGMkO0ACgkQbDjKyiDZ
s5Ik5RAAyleAIyGUGdKuCW+gsg0jEjPDrbC1cW+qFI9ruqVxgjrS1JXimxnaCNw7
40+4o4ElleaL0sgSX6kQB+nZpmFNmLKHRuH3wWWp+Pd1lIdjFGI7KvwyptJYjQ4r
psETJiiX26aWGKCp5EJnC66J/BjF1OICZE1VNeJLcSbejOF2U5ArStcmCZPObXl2
A0hs79MNxISDb6pmTIzyzDIR/MkDjOMg+nOEKOoRFUsnEeV5pMhjI8QQ+NQVrlEX
2qRm/ba2F1haFUqRb88MNlB/j9VBqqw0fU6gim3/lpcPfoQQ9qCMO649x8dpyE3+
GKUKjdNXF3Aq3ij2Gl4tkQ12AR1aeRct0/c7mB4vJZviQznGfQ4s9moDsRnv7JXP
q9o2VvOFqWsKpZ+BiRUznpFHmzjm83pjQwQs7VMxjRM8hBICdxkEKWX73PPVxIQp
iZxiSEF7QflEajdwdtI8YcF2Ql1SMbSNCkHEpRyfLis9gg6YZIg3YcGXOlx7r/H3
Lyh5KJYbvGzOV4cEshodLN/fG28F6LzKJoFJSREn+8FKW5vo6RtTP0OrqQfDg3BX
XYUPXGBXwXEWREvz2kuoxOPYp8TUGb6u/5R0P4Mps4iLtAf5H6MwCFxPE6O9ZAft
IzMbBiyjtTya+eQ9DSEjsjCq3ZSk6gUXjTXCjMBDl0nKtPwSbWI=
=gfB3
-----END PGP SIGNATURE-----

--Xzfh3geBddanhTnw--
