From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v3 2/4] pylibfdt: fix build lib location
Date: Fri, 25 Sep 2020 20:16:47 +1000
Message-ID: <20200925101647.GB2298@yekko.fritz.box>
References: <20200915192705.1716282-1-marcandre.lureau@redhat.com>
 <20200915192705.1716282-3-marcandre.lureau@redhat.com>
 <20200921063325.GC17169@yekko.fritz.box>
 <CAMxuvaxfb0gj285VfrozQp9KJT2XcN7yqyJWFE42tRZM9e1hig@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wDIVdgWPGyZzZswh"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1601030440;
        bh=yd2WnBIoFsBoMitD/1J1pxdKPG4vj6Kgbeleh+3s8Y8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=k4tefCNA5tiJS+Mz5fRQJs7hxdgmfV5A6UIwDDSsRfZ/tfQQCRW+WyXaFonxmdAAs
         dtBzNBuESKNg/fxi+eFZe4f8FnezIr8bmL1m53njVajzduiDVoadAs8vDME+kxayxz
         vIRgPkwFliEM0WGPm0Hh/CLoYWxuRmc3sqk71sBQ=
Content-Disposition: inline
In-Reply-To: <CAMxuvaxfb0gj285VfrozQp9KJT2XcN7yqyJWFE42tRZM9e1hig-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--wDIVdgWPGyZzZswh
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2020 at 12:09:16PM +0400, Marc-Andr=E9 Lureau wrote:
> Hi
>=20
> On Mon, Sep 21, 2020 at 10:46 AM David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> >
> > On Tue, Sep 15, 2020 at 11:27:03PM +0400, marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org w=
rote:
> > > From: Marc-Andr=E9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > >
> > > setup.py build_ext is run from top_srcdir with Makefile.
> > >
> > > ../pylibfdt will produce output files in parent directory.
> >
> > Uh.. can you elaborate a bit on what exactly ends up where, and why
> > the new behaviour you're setting up is better.
>=20
>=20
>  ~/src/dtc $  make
> ...
> ~/src/dtc $  ls ../pylibfdt
> _libfdt.cpython-38-x86_64-linux-gnu.so
>=20
>=20
> It "escapes" the source directory

Sorry, still not clear to me.  Is that the old behaviour or the new?
How does it differ from the other one?

> > > Note that setup.py install will rebuild it with the default 'build'
> > > directory. There doesn't seem to be a way to override that.
> > That rings a bell.  ISTR it being a real PITA.
>=20
> It's a minor inconvenience imho. You just end up with an extra build/
> directory during install.
>=20
> > >
> > > Signed-off-by: Marc-Andr=E9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> >
> > > ---
> > >  pylibfdt/Makefile.pylibfdt | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/pylibfdt/Makefile.pylibfdt b/pylibfdt/Makefile.pylibfdt
> > > index 32ae1c5..1b5f236 100644
> > > --- a/pylibfdt/Makefile.pylibfdt
> > > +++ b/pylibfdt/Makefile.pylibfdt
> > > @@ -18,7 +18,7 @@ endif
> > >
> > >  $(PYMODULE): $(PYLIBFDT_srcs) $(LIBFDT_archive) $(SETUP) $(VERSION_F=
ILE)
> > >       @$(VECHO) PYMOD $@
> > > -     $(PYTHON) $(SETUP) $(SETUPFLAGS) build_ext --build-lib=3D../$(P=
YLIBFDT_dir)
> > > +     $(PYTHON) $(SETUP) $(SETUPFLAGS) build_ext --build-lib=3D$(PYLI=
BFDT_dir)
> > >
> > >  install_pylibfdt: $(PYMODULE)
> > >       @$(VECHO) INSTALL-PYLIB
> >
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--wDIVdgWPGyZzZswh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl9tw40ACgkQbDjKyiDZ
s5JxBw//TJlxkIuUXDjr7/hDwBtVqdZF5Wcl9Iam/xyWGfwiLFDPK1OEH1EtWb0d
+Y1KeIGkPVddea+VbNk3Vip3xRy7vUuSJol/L9n/XitG8Oufrgptt2Mu0VhfSjqL
YPjMm+PqH5dZwrNMJVzrOVtZhzdbjwBj9CzP+x0HZP62DYulyMNJ9m2l/6Im5rDa
ydMRcQLiPifX5PBtEb3Ajpg9pjt132bdcBCJG9keVhPW8MSnt4dfCFG8vv1ylpIT
dFwHoEd/Pqm7U1cjY+4YPN2n9ZKlFWfM8K16hvgvI7J2tK3uwrpDF6q17m3RB9vN
OUh28L2dUV2j5FZpRo7q4ayNZXHX0vXpJDUSCZtSs0m7DScfTuVb1sIESEotrims
Gs+2CycgN08ymPfZEwJYF3IQlyJESzT4XXKCLpgMV9txGX66CfA52hgJl6xiGKOb
6tXA7bipocnBp/2twLiXUm+DmTA2Yz5djNdoznsqXr+5AS+aRsO2JEqYf3NIsJWo
AO3duQNKMXd9rA+zCu6dCjj7/VZSX6Jvwumwokw4ZAe8yCjLRajIbaKYh5uT64GK
sj+ruOYMhKk40S7304+niEjPZqUjiCcw/PCOQCsyal6ToYyVPCkzlZVi7taPJQCc
d3Xyd8wTfdJEAKOv7klbsdni7YxkgqG86H5NGctoUxoBNrH8MGQ=
=59YA
-----END PGP SIGNATURE-----

--wDIVdgWPGyZzZswh--
