From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v3 1/4] pylibfdt: allow build out of tree
Date: Mon, 28 Sep 2020 18:00:38 +1000
Message-ID: <20200928080038.GD501872@yekko.fritz.box>
References: <20200915192705.1716282-1-marcandre.lureau@redhat.com>
 <20200915192705.1716282-2-marcandre.lureau@redhat.com>
 <20200921062751.GB17169@yekko.fritz.box>
 <CAMxuvaxTsdcpnrED54ydCKTKbVGRnYOW3fiL5tfyNTsiUM+cyQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="UfEAyuTBtIjiZzX6"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1601280185;
        bh=874FCBMK9pjSSp2BWR5Y1nkNxsL3L/ek46kJg6wTFRM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=c6Z6z2o/WTSZWV22EtkP40Gk7fqRLyOvk13mkgKkC3lbC76ysUZ//SK262DXswrZo
         U3+znLrjXwAQJPN5j7O3nuTB393NkoVjB05G0hcaJL9Q7d/vbvD4Ox3/eICT2kV46t
         K/MMJtl+74z3yOeRQvvZ4PXrQsE04Rz+byW1hWrU=
Content-Disposition: inline
In-Reply-To: <CAMxuvaxTsdcpnrED54ydCKTKbVGRnYOW3fiL5tfyNTsiUM+cyQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--UfEAyuTBtIjiZzX6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2020 at 12:22:06PM +0400, Marc-Andr=E9 Lureau wrote:
> Hi
>=20
> On Mon, Sep 21, 2020 at 10:29 AM David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> >
> > On Tue, Sep 15, 2020 at 11:27:02PM +0400, marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org w=
rote:
> > > From: Marc-Andr=E9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > >
> > > With meson, we have to support out-of-tree build. Fix path lookup.
> > >
> > > Signed-off-by: Marc-Andr=E9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > > ---
> > >  pylibfdt/Makefile.pylibfdt |  2 +-
> > >  pylibfdt/setup.py          | 25 +++++++++++++++++--------
> > >  2 files changed, 18 insertions(+), 9 deletions(-)
> > >
> > > diff --git a/pylibfdt/Makefile.pylibfdt b/pylibfdt/Makefile.pylibfdt
> > > index 6866a0b..32ae1c5 100644
> > > --- a/pylibfdt/Makefile.pylibfdt
> > > +++ b/pylibfdt/Makefile.pylibfdt
> > > @@ -10,7 +10,7 @@ PYLIBFDT_CLEANDIRS_L =3D build __pycache__
> > >  PYLIBFDT_CLEANDIRS =3D $(PYLIBFDT_CLEANDIRS_L:%=3D$(PYLIBFDT_dir)/%)
> > >
> > >  SETUP =3D $(PYLIBFDT_dir)/setup.py
> > > -SETUPFLAGS =3D
> > > +SETUPFLAGS =3D --top-builddir .
> > >
> > >  ifndef V
> > >  SETUPFLAGS +=3D --quiet
> > > diff --git a/pylibfdt/setup.py b/pylibfdt/setup.py
> > > index 53f2bef..f8ec924 100755
> > > --- a/pylibfdt/setup.py
> > > +++ b/pylibfdt/setup.py
> > > @@ -19,23 +19,31 @@ import sys
> > >  VERSION_PATTERN =3D '^#define DTC_VERSION "DTC ([^"]*)"$'
> > >
> > >
> > > +def get_top_builddir():
> > > +    assert '--top-builddir' in sys.argv
> >
> > I see you've added the option to the Makefile, but if this were
> > invoked manually, I'm not sure that you want to just die if the
> > --top-builddir option isn't included.
> >
> > Even if you do, I think you want a more meaningful error than an
> > assertion failure.
>=20
> The assertion is quite explicit:
>=20
> Traceback (most recent call last):
>   File "pylibfdt/setup.py", line 30, in <module>
>     top_builddir =3D get_top_builddir()
>   File "pylibfdt/setup.py", line 23, in get_top_builddir
>     assert '--top-builddir' in sys.argv
> AssertionError
>=20
> Having extra arguments to setuptools is tricky:
> https://stackoverflow.com/questions/677577/distutils-how-to-pass-a-user-d=
efined-parameter-to-setup-py
>=20
> Since it's a programmer error, that you are not suppose to run into
> because you'd use make or ninja, it seems enough to me.

Hm.  Invoking this only via make or ninja would be normal for someone
building dtc as a unit.  But, I'm not so familiar with the Python
ecosystem, so I wonder if someone specifically looking at the Python
bindings would expect to be able to invoke setup.py directly.

> But if you
> insist, I can update to print a more friendly message somehow.
> >
> > > +    index =3D sys.argv.index('--top-builddir')
> > > +    sys.argv.pop(index)
> > > +    return sys.argv.pop(index)
> > > +
> > > +
> > > +srcdir =3D os.path.dirname(os.path.abspath(sys.argv[0]))
> > > +top_builddir =3D get_top_builddir()
> > > +
> > > +
> > >  def get_version():
> > > -    version_file =3D "../version_gen.h"
> > > +    version_file =3D os.path.join(top_builddir, 'version_gen.h')
> > >      f =3D open(version_file, 'rt')
> > >      m =3D re.match(VERSION_PATTERN, f.readline())
> > >      return m.group(1)
> > >
> > >
> > > -setupdir =3D os.path.dirname(os.path.abspath(sys.argv[0]))
> > > -os.chdir(setupdir)
> > > -
> > >  libfdt_module =3D Extension(
> > >      '_libfdt',
> > > -    sources=3D['libfdt.i'],
> > > -    include_dirs=3D['../libfdt'],
> > > +    sources=3D[os.path.join(srcdir, 'libfdt.i')],
> > > +    include_dirs=3D[os.path.join(srcdir, '../libfdt')],
> > >      libraries=3D['fdt'],
> > > -    library_dirs=3D['../libfdt'],
> > > -    swig_opts=3D['-I../libfdt'],
> > > +    library_dirs=3D[os.path.join(top_builddir, 'libfdt')],
> > > +    swig_opts=3D['-I' + os.path.join(srcdir, '../libfdt')],
> > >  )
> > >
> > >  setup(
> > > @@ -44,5 +52,6 @@ setup(
> > >      author=3D'Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>',
> > >      description=3D'Python binding for libfdt',
> > >      ext_modules=3D[libfdt_module],
> > > +    package_dir=3D{'': srcdir},
> > >      py_modules=3D['libfdt'],
> > >  )
> >
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--UfEAyuTBtIjiZzX6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl9xmCQACgkQbDjKyiDZ
s5KsuxAAkLkZbf8oKMcBV/xYlcLA3+VRwQNEFClWYNTI6KVNgarOiB0q6FkAPpUw
FslofrQbNuhlju9t+KdNUwvGxNyWRInou79hJ/KnS7xpJSszdq0nUkbCnNrLpqds
6JyJyp4iWvrDXbqMxHmYUBc3yI9ByVj7FREji1M/dFsUC5XfTPvPeerqzqPV5DYC
II0egTjEhwUv5M19RNy9tH/2r9FVgRUBHdpOYecgH/tprZGKSchIzVhPiWk8zqLE
KOOR3s2K4/BPskHilW3BxHDENWnqdBMGcN6xklI0wPYn+ZJkW8wviCal8CjezEd+
oA3v5PDb5xWSkzQDrpMEiLKjb2oYcz59GZsN4odV4LDsBCtUYIo9CmtRbTSRyvUC
JXseUFsp0COXGMT4oAdocio52I6uy9DauHVLvZ4TBuJmmpUCk2ozBHxM1FySLFei
PoEp2GE2zgkV6SHbstWV7rkArAB5+iJGVIKBM0W//G5rsqz6t/QJB86Q22KpK2fA
odCVMeCRCR9SuvUdDJzebU0/fHeqeWghEmWxZBuk7ToIW87Wdt3ujMjcKCx/xsru
67GcKpUJrytH1nuf3CMX66FTJQUFAxP1S0sy+vONK9k7QLMaHCggfk51Um26Vqm+
KzMB9D1MOfyoMYs4ejkdGPin30fp6es/dAl1R8WXpeT7gDVQpJ8=
=tty0
-----END PGP SIGNATURE-----

--UfEAyuTBtIjiZzX6--
