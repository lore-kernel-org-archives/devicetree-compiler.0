From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: pylibfdt breakage
Date: Wed, 19 Oct 2022 19:09:35 +1100
Message-ID: <Y0+wvwJX9Cj3qj1q@yekko>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="N29SqtV8/LhqKctj"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1666166983;
        bh=wh660ZhmBD7YXEHxsjH2CFKhhkJ4KIo7oEmJt6Ln46Y=;
        h=Date:From:To:Cc:Subject:From;
        b=UbzQ1qpBtPxwGI9usrTDVbmFEyCWb8i/TjnxUyz0wSZXqZYbB3DmFhKVNUPz/plyP
         RFUcPsNXo6lQoRgt5qtS6EDqxS9c0KIsUqCrHhuw4TNmdaV7+WaB5UBMYawWDc5GqX
         wAh7E9kdlnbUwLKPrJ3NEvgFs05phcPnvxP1uPqo=
Content-Disposition: inline
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--N29SqtV8/LhqKctj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Simon,

I probably should have contacted you sooner about this.  For some
time, I've been unable to compile and test the pylibfdt components on
my system (Fedora 36).  I get this error:

$ make
	CHK version_gen.h
make[1]: Entering directory '/home/dwg/src/dtc'
	CHK version_gen.h
	 PYMOD pylibfdt/_libfdt.so
/usr/lib/python3.10/site-packages/setuptools/installer.py:27: SetuptoolsDep=
recationWarning: setuptools.installer is deprecated. Requirements should be=
 satisfied by a PEP 517 installer.
  warnings.warn(
/home/dwg/src/dtc/.eggs/setuptools_scm-7.0.5-py3.10.egg/setuptools_scm/vers=
ion.py:84: UserWarning: tag 'path-ref-fixup-staging' no version found
  warnings.warn(f"tag {tag!r} no version found")
Traceback (most recent call last):
  File "/home/dwg/src/dtc/./setup.py", line 50, in <module>
    setup(
  File "/usr/lib/python3.10/site-packages/setuptools/__init__.py", line 153=
, in setup
    return distutils.core.setup(**attrs)
  File "/usr/lib64/python3.10/distutils/core.py", line 108, in setup
    _setup_distribution =3D dist =3D klass(attrs)
  File "/usr/lib/python3.10/site-packages/setuptools/dist.py", line 459, in=
 __init__
    _Distribution.__init__(
  File "/usr/lib64/python3.10/distutils/dist.py", line 292, in __init__
    self.finalize_options()
  File "/usr/lib/python3.10/site-packages/setuptools/dist.py", line 837, in=
 finalize_options
    ep(self)
  File "/usr/lib/python3.10/site-packages/setuptools/dist.py", line 858, in=
 _finalize_setup_keywords
    ep.load()(self, ep.name, value)
  File "/home/dwg/src/dtc/.eggs/setuptools_scm-7.0.5-py3.10.egg/setuptools_=
scm/integration.py", line 90, in version_keyword
    _assign_version(dist, config)
  File "/home/dwg/src/dtc/.eggs/setuptools_scm-7.0.5-py3.10.egg/setuptools_=
scm/integration.py", line 59, in _assign_version
    maybe_version =3D _get_version(config)
  File "/home/dwg/src/dtc/.eggs/setuptools_scm-7.0.5-py3.10.egg/setuptools_=
scm/__init__.py", line 154, in _get_version
    parsed_version =3D _do_parse(config)
  File "/home/dwg/src/dtc/.eggs/setuptools_scm-7.0.5-py3.10.egg/setuptools_=
scm/__init__.py", line 101, in _do_parse
    version =3D _version_from_entrypoints(config) or _version_from_entrypoi=
nts(
  File "/home/dwg/src/dtc/.eggs/setuptools_scm-7.0.5-py3.10.egg/setuptools_=
scm/_entrypoints.py", line 66, in _version_from_entrypoints
    version: ScmVersion | None =3D _call_entrypoint_fn(root, config, ep.loa=
d())
  File "/home/dwg/src/dtc/.eggs/setuptools_scm-7.0.5-py3.10.egg/setuptools_=
scm/_entrypoints.py", line 40, in _call_entrypoint_fn
    return fn(root, config=3Dconfig)
  File "/home/dwg/src/dtc/.eggs/setuptools_scm-7.0.5-py3.10.egg/setuptools_=
scm/git.py", line 181, in parse
    return _git_parse_inner(
  File "/home/dwg/src/dtc/.eggs/setuptools_scm-7.0.5-py3.10.egg/setuptools_=
scm/git.py", line 224, in _git_parse_inner
    return meta(
  File "/home/dwg/src/dtc/.eggs/setuptools_scm-7.0.5-py3.10.egg/setuptools_=
scm/version.py", line 226, in meta
    parsed_version =3D _parse_tag(tag, preformatted, config)
  File "/home/dwg/src/dtc/.eggs/setuptools_scm-7.0.5-py3.10.egg/setuptools_=
scm/version.py", line 203, in _parse_tag
    assert version is not None
AssertionError
make[1]: *** [pylibfdt/Makefile.pylibfdt:20: pylibfdt/_libfdt.so] Error 1
make[1]: Leaving directory '/home/dwg/src/dtc'
make: *** [Makefile:172: maybe_pylibfdt] Error 2

Seems like the packaging stuff needs work, but it's not obvious to me
exactly what needs to be done.  Is this something you can address?


--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--N29SqtV8/LhqKctj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmNPsKcACgkQgypY4gEw
YSItdRAAh5RGEEBiyC5778xLQeSApZDYuryC21iNNJuz64T/DcRvE+PF5F0fFIvM
JTL0I74RNSlzYiIXsjwZ6tDen4b+Tql7XQ/hhXaerHZ2fSABNSmXQ00uhnQ+5/dj
lqWLgZVV/1C+/9cLDQZmz6kxtiDaX4SS8YuVeN+mNBtX4JsfBbZeoriNa3amG+6c
Cwk48c08//aKPZLxjBRCAUgyLTCSAzWG47OKypZj/5S3LTrvxrBdgzUKomET36lY
HzS0LLhUkiPVc3YA2eyoXdRtO2U7I2rZ/s9jYClAcMMxxr6to4NwYaHMDmNWOj/b
QxUJXqDOiWJdcaXcCD7mylDKZcb51P08mlU/d42W+RnY9OpybJbeGEGe+lrqrfNu
s2Smy+6en41/i4bmrtqTAV0TW52l3KVhtPZniGSg5jiX20zCPsZrN9lG4U/eRGYO
BLZU2Ki/bAOcLmplGStBMW+C+h8W77ORvnlCVlPtq5/To/ZhGqthXi2auOmORGNQ
WMFk4VP575JNNdLWIJrcAh7lxtedg4HeKDOO5GLE5k6WW9Z+3H6DRsC1MgGBElMl
dTJE7bcYqwoVdKv4MadgtU05+S9UhnWQ50X4D9IEbu4akxve+WGbMZsTnKfneaJ6
ZXB3lsFgMkUbZkAmt2+G8rs24q69mOJWbGtLIv+PvwkhDzihui0=
=FzJ0
-----END PGP SIGNATURE-----

--N29SqtV8/LhqKctj--
