From: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
Subject: Re: [PATCH 1/4] pylibfdt: add Property.as_stringlist()
Date: Thu, 20 Jan 2022 20:24:31 +0100
Message-ID: <12903489.O9o76ZdvQC@g550jk>
References: <20211225132558.167123-1-luca@z3ntu.xyz> <CAL_JsqLvQdm1kqMED8G03LEsm+xgyY2A+F+FD8DYeAy5o+eiGg@mail.gmail.com> <YeaRlvVf19o4Qnzm@yekko>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1642706671; bh=vRkcR8FiSNSjNeU6mUQcD6y2MM6eHRfcI/W3vcYwDGs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=EZZSWoLcYOmQUKqcCoxSR0QX3wduhKudqxmSL48ksfS0ZzGxWJ0nJ14vjEDTw2Bi6
         CJBdt1/bRFDGgm4ItBRdHJkx6Go8dqbzWPtJtR1PUsV7BecoR/kRDE1x34nYklfl7z
         GYtqtyhE5X3TIuYo6MieGibQsMLW4G4SC1xFbwkc=
In-Reply-To: <YeaRlvVf19o4Qnzm@yekko>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Hi,

On Dienstag, 18. J=E4nner 2022 11:08:22 CET David Gibson wrote:
> On Wed, Jan 05, 2022 at 04:48:31PM -0600, Rob Herring wrote:
> > On Sat, Dec 25, 2021 at 7:26 AM Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org> wrote:
> > > Add a new method for decoding a string list property, useful for e.g.
> > > the "reg-names" property.
> > >=20
> > > Also add a test for the new method.
> > >=20
> > > Signed-off-by: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
> > > ---
> > >=20
> > >  pylibfdt/libfdt.i       | 7 +++++++
> > >  tests/pylibfdt_tests.py | 8 ++++++++
> > >  2 files changed, 15 insertions(+)
> > >=20
> > > diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> > > index 9ccc57b..c81b504 100644
> > > --- a/pylibfdt/libfdt.i
> > > +++ b/pylibfdt/libfdt.i
> > >=20
> > > @@ -724,6 +724,13 @@ class Property(bytearray):
> > >              raise ValueError('Property contains embedded nul
> > >              characters')
> > >         =20
> > >          return self[:-1].decode('utf-8')
> > >=20
> > > +    def as_stringlist(self):
> > > +        """Unicode is supported by decoding from UTF-8"""
> > > +        if self[-1] !=3D 0:
> > > +            raise ValueError('Property lacks nul termination')
> > > +        parts =3D self[:-1].split(b'\x00')
> > > +        return list(map(lambda x: x.decode('utf-8'), parts))
> >=20
> > Doesn't this result in multiple decode() calls when a single one would
> > work:
> >=20
> > return data[:-1].decode(encoding=3D'ascii').split('\0')
>=20
> Uh.. I guess?  I feel like the split-then-decode makes more logical
> sense, since it's splitting a bytestring, then decoding the pieces as
> utf-8 strings.  That makes sense to me given that raw properties are
> bytestrings and can included multiple different datatypes and
> encodings in general.
>=20
> In this specific case, decode-then-split would be fine as well, since
> \u00000 works as a separator unambiguously, but it still seems
> conceptually muddier to me.

The reason I made it this way was mostly because I didn't know you could ha=
ve=20
null bytes present in str.decode, I just remember horrible UnicodeDecodeErr=
ors=20
on invalid input from other projects.
If wanted I can make a patch changing to just one str.decode call as yes, i=
t's=20
surely more efficient than doing multiple. But it's also not like there wil=
l be=20
100 parts of this property that's being decoded in a performance critical=20
application so I think it's also okay like that.

Let me know what you think.
Regards
Luca


