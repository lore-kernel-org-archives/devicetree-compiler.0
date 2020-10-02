From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v3 1/4] pylibfdt: allow build out of tree
Date: Fri, 2 Oct 2020 13:40:30 +1000
Message-ID: <20201002034030.GM1844@yekko.fritz.box>
References: <20200915192705.1716282-1-marcandre.lureau@redhat.com>
 <20200915192705.1716282-2-marcandre.lureau@redhat.com>
 <20200921062751.GB17169@yekko.fritz.box>
 <CAMxuvaxTsdcpnrED54ydCKTKbVGRnYOW3fiL5tfyNTsiUM+cyQ@mail.gmail.com>
 <20200928080038.GD501872@yekko.fritz.box>
 <CAMxuvaxx0+5n4YAj1OM_F0B-7wZkZnWZ7vQC6wfvAuCCvvti1w@mail.gmail.com>
 <20200929140036.GA8432@yekko.fritz.box>
 <CAMxuvawbCOsFupbSq09HyOsknGx2Sq9gM8vjbedZFUpkJGF24A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="UeXZ3FjlYZvuln/G"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1601615083;
        bh=2ADgDji2P6XGOQikCCCronavd3RthTwgQ63x6YU+Lyk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CnCTDx7rtCGMHUoqENVhTUMxjQaMN6v/++7nj9em7yGIsw4sgJJRdHJagZHtW6gPX
         iCIT57Y3njFFFdKIrb5j0HJBFjqzWdccL6BSiuk/aaE35pNfKtdnKQVh82RIq3GR+l
         FogSK+ENdXAMEDfo5csHTanz8WbqFvO9jW2lARk0=
Content-Disposition: inline
In-Reply-To: <CAMxuvawbCOsFupbSq09HyOsknGx2Sq9gM8vjbedZFUpkJGF24A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--UeXZ3FjlYZvuln/G
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2020 at 07:37:22PM +0400, Marc-Andr=E9 Lureau wrote:
> Hi
>=20
> On Tue, Sep 29, 2020 at 6:42 PM David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> >
> > On Tue, Sep 29, 2020 at 03:46:16PM +0400, Marc-Andr=E9 Lureau wrote:
> > > Hi
> > >
> > > On Mon, Sep 28, 2020 at 12:03 PM David Gibson
> > > <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > > >
> > > > On Mon, Sep 21, 2020 at 12:22:06PM +0400, Marc-Andr=E9 Lureau wrote:
> > > > > Hi
> > > > >
> > > > > On Mon, Sep 21, 2020 at 10:29 AM David Gibson
> > > > > <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > > > > >
> > > > > > On Tue, Sep 15, 2020 at 11:27:02PM +0400, marcandre.lureau@redh=
at.com wrote:
> > > > > > > From: Marc-Andr=E9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > > > > > >
> > > > > > > With meson, we have to support out-of-tree build. Fix path lo=
okup.
> > > > > > >
> > > > > > > Signed-off-by: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.c=
om>
> > > > > > > ---
> > > > > > >  pylibfdt/Makefile.pylibfdt |  2 +-
> > > > > > >  pylibfdt/setup.py          | 25 +++++++++++++++++--------
> > > > > > >  2 files changed, 18 insertions(+), 9 deletions(-)
> > > > > > >
> > > > > > > diff --git a/pylibfdt/Makefile.pylibfdt b/pylibfdt/Makefile.p=
ylibfdt
> > > > > > > index 6866a0b..32ae1c5 100644
> > > > > > > --- a/pylibfdt/Makefile.pylibfdt
> > > > > > > +++ b/pylibfdt/Makefile.pylibfdt
> > > > > > > @@ -10,7 +10,7 @@ PYLIBFDT_CLEANDIRS_L =3D build __pycache__
> > > > > > >  PYLIBFDT_CLEANDIRS =3D $(PYLIBFDT_CLEANDIRS_L:%=3D$(PYLIBFDT=
_dir)/%)
> > > > > > >
> > > > > > >  SETUP =3D $(PYLIBFDT_dir)/setup.py
> > > > > > > -SETUPFLAGS =3D
> > > > > > > +SETUPFLAGS =3D --top-builddir .
> > > > > > >
> > > > > > >  ifndef V
> > > > > > >  SETUPFLAGS +=3D --quiet
> > > > > > > diff --git a/pylibfdt/setup.py b/pylibfdt/setup.py
> > > > > > > index 53f2bef..f8ec924 100755
> > > > > > > --- a/pylibfdt/setup.py
> > > > > > > +++ b/pylibfdt/setup.py
> > > > > > > @@ -19,23 +19,31 @@ import sys
> > > > > > >  VERSION_PATTERN =3D '^#define DTC_VERSION "DTC ([^"]*)"$'
> > > > > > >
> > > > > > >
> > > > > > > +def get_top_builddir():
> > > > > > > +    assert '--top-builddir' in sys.argv
> > > > > >
> > > > > > I see you've added the option to the Makefile, but if this were
> > > > > > invoked manually, I'm not sure that you want to just die if the
> > > > > > --top-builddir option isn't included.
> > > > > >
> > > > > > Even if you do, I think you want a more meaningful error than an
> > > > > > assertion failure.
> > > > >
> > > > > The assertion is quite explicit:
> > > > >
> > > > > Traceback (most recent call last):
> > > > >   File "pylibfdt/setup.py", line 30, in <module>
> > > > >     top_builddir =3D get_top_builddir()
> > > > >   File "pylibfdt/setup.py", line 23, in get_top_builddir
> > > > >     assert '--top-builddir' in sys.argv
> > > > > AssertionError
> > > > >
> > > > > Having extra arguments to setuptools is tricky:
> > > > > https://stackoverflow.com/questions/677577/distutils-how-to-pass-=
a-user-defined-parameter-to-setup-py
> > > > >
> > > > > Since it's a programmer error, that you are not suppose to run in=
to
> > > > > because you'd use make or ninja, it seems enough to me.
> > > >
> > > > Hm.  Invoking this only via make or ninja would be normal for someo=
ne
> > > > building dtc as a unit.  But, I'm not so familiar with the Python
> > > > ecosystem, so I wonder if someone specifically looking at the Python
> > > > bindings would expect to be able to invoke setup.py directly.
> > >
> > > Maybe, so if the error message about missing '--top-builddir' is not
> > > explicit enough, I can try to make the error a bit more human
> > > friendly.
> > >
> > > But as you can see from the stackoverflow question, it's not uncommon
> > > to want to have extra arguments to setup.py, and there are various
> > > solutions offered for that.
> >
> > It's not the fact it's an extra argument that concerns me, only the
> > fact that it is a *required* extra argument.
>=20
> I can try to make it default to the current directory, but it will
> probably have to handle errors elsewhere then in more archaic ways.

Have a look, please.  If it proves really hard, I'll reconsider.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--UeXZ3FjlYZvuln/G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl92oS4ACgkQbDjKyiDZ
s5LsBxAAqrsuHZagfpuyuPTgsfHrJlbM+G6bEOO5FXxtXQOPiJF6z8jC/buAzQqu
YJ8fQar1Rb4Mm0xObL3AdK5N44WkB9chdnlVkCxFCtQJLfwitLVPcxlXL3b1Tt4E
f4qcOvSaLWHGXmvortg8Faz885g8e15LxAu+lpka3ZfoD+ORgq9I879bgKtYuAZy
7X2Ik4sC7KhtT4Ta379h+t0Tlb3T9YbAiRo8EgSmP7+lasTvMiQX8cT2whapF7i+
MVCx33UBkErzakmBATy2zJKvxZ5xkr9D7zyFRLq1G3+K/ZA5wrJtyqb9C1mK6Tio
NMTiSthJINlOsfgmJwQBN9FIkJshtbtKWAxfw/TkbxpPbWMUKBDsMjngp4rl9mo7
rLm9mdz2ciI3fxFEp1xKm79+V/bL6JZyFDYbnxuuat2naRGh5LSI/5Rl5+bSBgOp
BklmyT9VkwMcnlZNqPyZQlpw8eoL2fmMYAvN97nZNm7/RgtXXJNErn/zak+NCJi9
P/BsFUSan0DbwhIy1QX56ZQTDEW5NPXoY9eeIO4pAAZiy4q6ZjYO92Wfru8XdNsZ
fbyUNEqmy84jvIfO1E4ZdvhTDh9cuwl1c/X7Y+4EkdCSk2jVNiSbH9gLh+QRL9uQ
0FXbonx1h04pDU+NtUBH21HfgvV/hPql1EjIGpycwrmYGpqd4rM=
=d+fm
-----END PGP SIGNATURE-----

--UeXZ3FjlYZvuln/G--
