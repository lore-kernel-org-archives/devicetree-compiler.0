From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v4 1/4] pylibfdt: fix build-lib location
Date: Sat, 10 Oct 2020 17:10:41 +1100
Message-ID: <20201010061041.GL1025389@yekko.fritz.box>
References: <20201006082712.241224-1-marcandre.lureau@redhat.com>
 <20201006082712.241224-2-marcandre.lureau@redhat.com>
 <20201009010052.GF1025389@yekko.fritz.box>
 <CAMxuvazSLvvO-OwwjDxuw8PY88nP0y5rpf7+O71jGXUPhGDsrg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="YIleam+9adpUeYf+"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1602311609;
        bh=w8U4cPzvAd8n/09tyts+DJCrCmTIR8oRYCovPRYE/ac=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OWzMkh9FL/QtEDGFin5M5fo6bGAew34E3V0HTcHMeDK5QGl968KL5dicOmVe0IHMC
         CiZEDcFDwAXdPY/jleTB4bhA9ZH/3HxTJW57wB6q2wm0BEwD4LMkb3tYtNfjjYUM19
         A9yl/N0DynCUqwfZiSOIV4ww7AjL5CPmqjLEPoSI=
Content-Disposition: inline
In-Reply-To: <CAMxuvazSLvvO-OwwjDxuw8PY88nP0y5rpf7+O71jGXUPhGDsrg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--YIleam+9adpUeYf+
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 09, 2020 at 11:18:36AM +0400, Marc-Andr=E9 Lureau wrote:
> Hi
>=20
> On Fri, Oct 9, 2020 at 5:01 AM David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>=
 wrote:
> >
> > On Tue, Oct 06, 2020 at 12:27:09PM +0400, marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org w=
rote:
> > > From: Marc-Andr=E9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > >
> > > setup.py build_ext is run from top_srcdir with the Makefile
> > > build-system, due to Makefile.pylibfdt inclusion in top_srcdir/Makefi=
le.
> > >
> > > --build-lib=3D../pylibfdt will produce output files in the parent
> > > directory of the current directory. Ex:
> > >
> > > ~/src/dtc$ make && ls ../pylibfdt
> > > _libfdt.cpython-38-x86_64-linux-gnu.so
> >
> > So... this doesn't happen for me
> >
> > $ git rev-parse HEAD
> > cbca977ea121d7483b0c2351b17dca08a21cb1ca
> > $ make
> > [...]
> > $ ls ../pylibfdt
> > ls: cannot access '../pylibfdt': No such file or directory
> > $ ls pylibfdt/
> > build/  _libfdt.cpython-38-x86_64-linux-gnu.so*  libfdt.i  libfdt.py  l=
ibfdt_wrap.c  Makefile.pylibfdt  pylibfdt/  setup.py*
> >
> > If I apply your patch, then the module ends up in
> > $topdir/pylibfdt/pylibfdt instead, and make check no longer runs the
> > python tests.
> >
> > So.. why it's behaving incorrectly for you but not me, I don't know :/
>=20
> This is interesting, I upgraded to f33 and I no longer have the
> issue. No idea.

Oh dear, that's worrying.  It suggests it depends on the version of
setuptools installed, and I have no idea what we'd need to do to
ensure consistent behaviour given that.

>=20
> >
> > > Fix it by changing the build-lib directory to $(cwd)/pylibfdt instead.
> > >
> > > (note that setup.py install will rebuild it with the default 'build'
> > > directory, there doesn't seem to be a way to override that)
> > >
> > > Fixes: 1e4a0928f3b3b827824222572e551a60935607e3 ("pylibfdt: Don't have
> > > setup.py depend on where it's invoked from")
> > > Signed-off-by: Marc-Andr=E9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > > ---
> > >  pylibfdt/Makefile.pylibfdt | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/pylibfdt/Makefile.pylibfdt b/pylibfdt/Makefile.pylibfdt
> > > index 6866a0b..0c07224 100644
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

--YIleam+9adpUeYf+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+BUGEACgkQbDjKyiDZ
s5L/yw//Rnf82NB3tBGfO2G9VNrV2oGXMSQFn80jQcKdADFeOhnwRFUe8HMBQ5hB
FDNXNXZj9/360mFOmngvqqqAiQOEgQbQksnnvstKwTvOunBzKWJ49bMvJ6TblyhD
LcyoGOk6QfSgg83F1QD3oMDaNfPmsapOoJfJBQm4RRYUEOZz4+loYaj1wnaoA6TQ
kzSKkCg0Apb8pQ5oCfiAUMLAXAf1r7HnlvNZf68ePmvx72nMzgu7DufTZz8h0giY
vPJi/HXFj8WrmlhUUc3sNKMeZCsN+sLFCcYQVBO6k8wFl77lvZjtkodLi7ceXjgy
fBV20MleUSrC0BczLC+LwoJbQoH8LySdHkoG/vZOrUzBGc9Cj9Lk3QZMB+V6buP7
GN+NTwbhm21kRpNZtFNXILCoGAxJGXrBztaFkAPK2xbNr84yP59wLWdGc3AZlJmR
2c6YQfe7Z4egWD/HVe7dblqRxw5BYrIhZcvGSJFWLE/7gyYXpRZMOqUKPd3Icrea
mGYOUrUt3lTzjrNB0txBjRUMjHxuHr8TDfLaDnAOeByZMh4Q/HORaY0BaAjtMU8x
1V1pv3Xbye1nJ+Cr9lSEzzzTqYgdIIcwNDi76rnE7dc2PFaAxv2NC2Df6LXnHz7W
27qoCskYq3MzegS9VgPTnitOxgtXbCf4kd1wRrY2AsXdEAICrzc=
=2Fxj
-----END PGP SIGNATURE-----

--YIleam+9adpUeYf+--
