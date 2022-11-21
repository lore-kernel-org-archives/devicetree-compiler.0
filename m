From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: pylibfdt breakage
Date: Mon, 21 Nov 2022 14:29:35 +1100
Message-ID: <Y3rwnwjwjIFNqOVF@yekko>
References: <Y0+wvwJX9Cj3qj1q@yekko>
 <CAPnjgZ1SfQaBSmn-P6aGTNh0B1R2R4CbRXsRS9H4sF3VW4D=kQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="x7wNGX0w4jPlTzQc"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1669001508;
        bh=W++9ISER2D5RNM0ZN0V3AaW4ehqV4xZOr86UpnLv3jA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Yhhs0sof0WQepzCKc1NSe5ZXUOmyeEDyWctta9PXd9q9KCq5ztlsIMCv1+9dX4qlL
         eb/4HYoHKs07Aca3dQOtwuF021pGLD93Eq0+PcxMcyPdNMcyDkzustKjqP/+MvNNMR
         eKH+c0xgtB+faTbc0xWiopyMc87jFtLEZBhtv3wg=
Content-Disposition: inline
In-Reply-To: <CAPnjgZ1SfQaBSmn-P6aGTNh0B1R2R4CbRXsRS9H4sF3VW4D=kQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--x7wNGX0w4jPlTzQc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 29, 2022 at 07:44:04PM -0600, Simon Glass wrote:
>  Hi David,
>=20
> On Wed, 19 Oct 2022 at 02:09, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> =
wrote:
> >
> > Hi Simon,
> >
> > I probably should have contacted you sooner about this.  For some
> > time, I've been unable to compile and test the pylibfdt components on
> > my system (Fedora 36).  I get this error:
> >
> > $ make
> >         CHK version_gen.h
> > make[1]: Entering directory '/home/dwg/src/dtc'
> >         CHK version_gen.h
> >          PYMOD pylibfdt/_libfdt.so
> > /usr/lib/python3.10/site-packages/setuptools/installer.py:27: Setuptool=
sDeprecationWarning: setuptools.installer is deprecated. Requirements shoul=
d be satisfied by a PEP 517 installer.
> >   warnings.warn(
> > /home/dwg/src/dtc/.eggs/setuptools_scm-7.0.5-py3.10.egg/setuptools_scm/=
version.py:84: UserWarning: tag 'path-ref-fixup-staging' no version found
> >   warnings.warn(f"tag {tag!r} no version found")
> > Traceback (most recent call last):
> >   File "/home/dwg/src/dtc/./setup.py", line 50, in <module>
> >     setup(
> >   File "/usr/lib/python3.10/site-packages/setuptools/__init__.py", line=
 153, in setup
> >     return distutils.core.setup(**attrs)
> >   File "/usr/lib64/python3.10/distutils/core.py", line 108, in setup
> >     _setup_distribution =3D dist =3D klass(attrs)
> >   File "/usr/lib/python3.10/site-packages/setuptools/dist.py", line 459=
, in __init__
> >     _Distribution.__init__(
> >   File "/usr/lib64/python3.10/distutils/dist.py", line 292, in __init__
> >     self.finalize_options()
> >   File "/usr/lib/python3.10/site-packages/setuptools/dist.py", line 837=
, in finalize_options
> >     ep(self)
> >   File "/usr/lib/python3.10/site-packages/setuptools/dist.py", line 858=
, in _finalize_setup_keywords
> >     ep.load()(self, ep.name, value)
> >   File "/home/dwg/src/dtc/.eggs/setuptools_scm-7.0.5-py3.10.egg/setupto=
ols_scm/integration.py", line 90, in version_keyword
> >     _assign_version(dist, config)
> >   File "/home/dwg/src/dtc/.eggs/setuptools_scm-7.0.5-py3.10.egg/setupto=
ols_scm/integration.py", line 59, in _assign_version
> >     maybe_version =3D _get_version(config)
> >   File "/home/dwg/src/dtc/.eggs/setuptools_scm-7.0.5-py3.10.egg/setupto=
ols_scm/__init__.py", line 154, in _get_version
> >     parsed_version =3D _do_parse(config)
> >   File "/home/dwg/src/dtc/.eggs/setuptools_scm-7.0.5-py3.10.egg/setupto=
ols_scm/__init__.py", line 101, in _do_parse
> >     version =3D _version_from_entrypoints(config) or _version_from_entr=
ypoints(
> >   File "/home/dwg/src/dtc/.eggs/setuptools_scm-7.0.5-py3.10.egg/setupto=
ols_scm/_entrypoints.py", line 66, in _version_from_entrypoints
> >     version: ScmVersion | None =3D _call_entrypoint_fn(root, config, ep=
=2Eload())
> >   File "/home/dwg/src/dtc/.eggs/setuptools_scm-7.0.5-py3.10.egg/setupto=
ols_scm/_entrypoints.py", line 40, in _call_entrypoint_fn
> >     return fn(root, config=3Dconfig)
> >   File "/home/dwg/src/dtc/.eggs/setuptools_scm-7.0.5-py3.10.egg/setupto=
ols_scm/git.py", line 181, in parse
> >     return _git_parse_inner(
> >   File "/home/dwg/src/dtc/.eggs/setuptools_scm-7.0.5-py3.10.egg/setupto=
ols_scm/git.py", line 224, in _git_parse_inner
> >     return meta(
> >   File "/home/dwg/src/dtc/.eggs/setuptools_scm-7.0.5-py3.10.egg/setupto=
ols_scm/version.py", line 226, in meta
> >     parsed_version =3D _parse_tag(tag, preformatted, config)
> >   File "/home/dwg/src/dtc/.eggs/setuptools_scm-7.0.5-py3.10.egg/setupto=
ols_scm/version.py", line 203, in _parse_tag
> >     assert version is not None
> > AssertionError
> > make[1]: *** [pylibfdt/Makefile.pylibfdt:20: pylibfdt/_libfdt.so] Error=
 1
> > make[1]: Leaving directory '/home/dwg/src/dtc'
> > make: *** [Makefile:172: maybe_pylibfdt] Error 2
> >
> > Seems like the packaging stuff needs work, but it's not obvious to me
> > exactly what needs to be done.  Is this something you can address?
>=20
> I am not sure what is going on but perhaps we could drop
> setuptools_scm? I'm assuming it is for getting the version, but we
> have that in Makefile, so could perhaps parse it?

Well, you tell me.  I really don't know how setuptools work, nor do I
have the time to figure it out.

Or whatever has replaced setuptools that we're supposed to be using
instead according to that DeprecationWarning.

> I actually have the same version of setuptools_scm here
>=20
> python3-setuptools-scm (7.0.5-1)
>=20
> but I cannot see the error. I found this:
>=20
> https://github.com/pypa/setuptools_scm
>=20
> For me:
>=20
> sjg@sjg1:~/c/dtc$ pe
> 55778a0 (HEAD, us/master, us/main) libfdt: tests: add
> get_next_tag_invalid_prop_len
> 7359034 libfdt: prevent integer overflow in fdt_next_tag
> 035fb90 libfdt: add fdt_get_property_by_offset_w helper
> 98a0700 Makefile: fix infinite recursion by dropping non-existent `%.outp=
ut`
>=20
> $ python setup.py --version
> 1.6.2.dev63+g55778a0

Hrm.  I get an error similar to the one above just attempting to get
the --version like this.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--x7wNGX0w4jPlTzQc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmN68JgACgkQgypY4gEw
YSKKTxAAq2kTK8Iu5H3JHKJBeC/p6LpfAitM2ZIPVtCextk0hLqfJFgal4S1VpAF
nfmdG7uD1xFsaxJFOn2E1n+2k5utc0WNjo2EmpO6i9RGNjrW+qQadIwyetvL6ZmE
dokfOjVPTJtfAryvk1SQIbDPMJp9bBpGLKif+uUznJzBRkrpDFVXbMCiK9W0csjy
SMpJDews9h7dNcA6d93HrlmDa3AYp1yFT+ELch5ytgPXswzqcEf8XIUq6jE1/Blf
dCyCa6d/aJtx45y7T3ttT/7M3ClbDhLsDirAvVMyM4fX9xxGjK59TIsbGj98TbKB
e8sxSk+3ckC7L8tgsQzxA/3dWeoxNvCGiRuj3EfqrybRpGrfYEfgtJfeIm/xHaPn
dAyrNSdjoZXekZ2OldLCkBgZisZom35tURgVTEVCFNnMzK/3ULqvhPudA1usEUp5
pCqv/Q4H6Y6BdaIn8hIOJ8pL4x4IjuQMJzkyVbB23bPFgPQBqVcHqecsgE9nTyAc
go92SiZdFdERNc7B/5cE0qPCh94cAVtTZGXjTbBadQG4Kt5mV+/+MnvnvGg0IMv5
x7/F2EpiTfSAPFk+YEQS76kRb7FB46rbtszSGO4SlsenKFGIRClmrOpzmFFjzEAz
9vPTQFc40wmL/Np6sIzPEqaUcQfJjk7VIPBhLN51I9jeO3d82kU=
=bhbJ
-----END PGP SIGNATURE-----

--x7wNGX0w4jPlTzQc--
