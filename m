From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v3 1/4] pylibfdt: allow build out of tree
Date: Wed, 30 Sep 2020 00:00:36 +1000
Message-ID: <20200929140036.GA8432@yekko.fritz.box>
References: <20200915192705.1716282-1-marcandre.lureau@redhat.com>
 <20200915192705.1716282-2-marcandre.lureau@redhat.com>
 <20200921062751.GB17169@yekko.fritz.box>
 <CAMxuvaxTsdcpnrED54ydCKTKbVGRnYOW3fiL5tfyNTsiUM+cyQ@mail.gmail.com>
 <20200928080038.GD501872@yekko.fritz.box>
 <CAMxuvaxx0+5n4YAj1OM_F0B-7wZkZnWZ7vQC6wfvAuCCvvti1w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="M9NhX3UHpAaciwkO"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1601390527;
        bh=xaLhGjp0DtE5vA6JiBg9DopGC7qtpiUqxlprOSj6MHQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eIkMsCWh//MVxUbZHImmjO1En1E6qmrz/DMbAlzOJ7YA3LNjZiDkv0KTaFLMu/Bjl
         xN/whXJalSfYeRRh6vMY+LH0/ILAq/IwB5co4pS+Cs1Kz7s+g8AhHcfkGRt+MxCBEy
         sifvOpNNY++kwOdcm4aoW8pipMINDW10sIhDLMh8=
Content-Disposition: inline
In-Reply-To: <CAMxuvaxx0+5n4YAj1OM_F0B-7wZkZnWZ7vQC6wfvAuCCvvti1w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--M9NhX3UHpAaciwkO
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2020 at 03:46:16PM +0400, Marc-Andr=E9 Lureau wrote:
> Hi
>=20
> On Mon, Sep 28, 2020 at 12:03 PM David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> >
> > On Mon, Sep 21, 2020 at 12:22:06PM +0400, Marc-Andr=E9 Lureau wrote:
> > > Hi
> > >
> > > On Mon, Sep 21, 2020 at 10:29 AM David Gibson
> > > <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > > >
> > > > On Tue, Sep 15, 2020 at 11:27:02PM +0400, marcandre.lureau@redhat.c=
om wrote:
> > > > > From: Marc-Andr=E9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > > > >
> > > > > With meson, we have to support out-of-tree build. Fix path lookup.
> > > > >
> > > > > Signed-off-by: Marc-Andr=E9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > > > > ---
> > > > >  pylibfdt/Makefile.pylibfdt |  2 +-
> > > > >  pylibfdt/setup.py          | 25 +++++++++++++++++--------
> > > > >  2 files changed, 18 insertions(+), 9 deletions(-)
> > > > >
> > > > > diff --git a/pylibfdt/Makefile.pylibfdt b/pylibfdt/Makefile.pylib=
fdt
> > > > > index 6866a0b..32ae1c5 100644
> > > > > --- a/pylibfdt/Makefile.pylibfdt
> > > > > +++ b/pylibfdt/Makefile.pylibfdt
> > > > > @@ -10,7 +10,7 @@ PYLIBFDT_CLEANDIRS_L =3D build __pycache__
> > > > >  PYLIBFDT_CLEANDIRS =3D $(PYLIBFDT_CLEANDIRS_L:%=3D$(PYLIBFDT_dir=
)/%)
> > > > >
> > > > >  SETUP =3D $(PYLIBFDT_dir)/setup.py
> > > > > -SETUPFLAGS =3D
> > > > > +SETUPFLAGS =3D --top-builddir .
> > > > >
> > > > >  ifndef V
> > > > >  SETUPFLAGS +=3D --quiet
> > > > > diff --git a/pylibfdt/setup.py b/pylibfdt/setup.py
> > > > > index 53f2bef..f8ec924 100755
> > > > > --- a/pylibfdt/setup.py
> > > > > +++ b/pylibfdt/setup.py
> > > > > @@ -19,23 +19,31 @@ import sys
> > > > >  VERSION_PATTERN =3D '^#define DTC_VERSION "DTC ([^"]*)"$'
> > > > >
> > > > >
> > > > > +def get_top_builddir():
> > > > > +    assert '--top-builddir' in sys.argv
> > > >
> > > > I see you've added the option to the Makefile, but if this were
> > > > invoked manually, I'm not sure that you want to just die if the
> > > > --top-builddir option isn't included.
> > > >
> > > > Even if you do, I think you want a more meaningful error than an
> > > > assertion failure.
> > >
> > > The assertion is quite explicit:
> > >
> > > Traceback (most recent call last):
> > >   File "pylibfdt/setup.py", line 30, in <module>
> > >     top_builddir =3D get_top_builddir()
> > >   File "pylibfdt/setup.py", line 23, in get_top_builddir
> > >     assert '--top-builddir' in sys.argv
> > > AssertionError
> > >
> > > Having extra arguments to setuptools is tricky:
> > > https://stackoverflow.com/questions/677577/distutils-how-to-pass-a-us=
er-defined-parameter-to-setup-py
> > >
> > > Since it's a programmer error, that you are not suppose to run into
> > > because you'd use make or ninja, it seems enough to me.
> >
> > Hm.  Invoking this only via make or ninja would be normal for someone
> > building dtc as a unit.  But, I'm not so familiar with the Python
> > ecosystem, so I wonder if someone specifically looking at the Python
> > bindings would expect to be able to invoke setup.py directly.
>=20
> Maybe, so if the error message about missing '--top-builddir' is not
> explicit enough, I can try to make the error a bit more human
> friendly.
>=20
> But as you can see from the stackoverflow question, it's not uncommon
> to want to have extra arguments to setup.py, and there are various
> solutions offered for that.

It's not the fact it's an extra argument that concerns me, only the
fact that it is a *required* extra argument.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--M9NhX3UHpAaciwkO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl9zPgIACgkQbDjKyiDZ
s5J4hQ/42mvDiwFuGzftpC5j/4W4jru40O8C8XvEu2Iax/6Rlz5tTgufTQaeZv/G
Sm/SC7yb2ZIbpJfSvDtqhoKiTxoZLMRRFelnw8MI6cuiQpfNaF35o9mFe1bD7r8R
gmMV5F6XRV435F76wZZxbF90V5g0pCtT1yL9fYxAujEz/T+RKm9SoEMQSeYzxF56
0G0aYMn2k6ZtVOQwo4SPZpAb9BXL/zyh1ISUZ8P2LNGI9RFz7u8L45OBgMT+UNwU
eRHrEu0DqPGC376vWJ0/TI8yMUCaIgN/Ha8SsafaQsXYcmHyrdGIQ0sis5kxkXNF
Q+x9OiZD0qIAy9B50I3SSclsEnttpBGkFaQNAfw2ywF4Ud0LPvE3WJn/O8oLprpo
aL+B5KJ39wPAhhZqdjLhkun1fTGUdWpyc3Cds7JwZyA612K0GWYWw+KijYZJqr/T
MR9quP9JbBXT+hn8i3edzJ5MqiMJ8uKEfhvHLd5a59U4B+mU/qr4l1bAyQ/Dtjr7
bofnWQbZ/oBb/evSjHgr4iiSTdHChBtMJYMeSdiR20pSSCSVEYv3cqUEIWtF+uJm
RqW9azGVo81p67kkK2Ju9HOZe0WtrgNK3WK51aRN8AbxckQIBFCrq72L7RIVuEs4
DLeVDbyPrqIchV4YCv9jjVl4YorG7MKQgntd9CJKccGdjoarMg==
=e8ze
-----END PGP SIGNATURE-----

--M9NhX3UHpAaciwkO--
