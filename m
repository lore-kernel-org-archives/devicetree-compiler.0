From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/4] pylibfdt: add Property.as_stringlist()
Date: Tue, 18 Jan 2022 21:08:22 +1100
Message-ID: <YeaRlvVf19o4Qnzm@yekko>
References: <20211225132558.167123-1-luca@z3ntu.xyz>
 <20211225132558.167123-2-luca@z3ntu.xyz>
 <CAL_JsqLvQdm1kqMED8G03LEsm+xgyY2A+F+FD8DYeAy5o+eiGg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Ugxdt04eSIRd57/c"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1642500719;
        bh=aQBj5rlcQCDqcb0fA9ydKQaypaAxm7IXEKSah903KiY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=E+Gfy/57zW1CvzwxvzNlf2IlTzZAMOEFTr5wVYUHmAWbTRphTsP3UH66Jk2RO5L2D
         4G4x4QtEWWJkVXsNw6/Wj2BUyILiR5jvUv5lXIjn/0U9OqmIH5ra1bpsVOJ+H9a3Xw
         3MM2M23C9qvj0ayWSehka9J9FN/aNzzr1q5SwnLs=
Content-Disposition: inline
In-Reply-To: <CAL_JsqLvQdm1kqMED8G03LEsm+xgyY2A+F+FD8DYeAy5o+eiGg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--Ugxdt04eSIRd57/c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 05, 2022 at 04:48:31PM -0600, Rob Herring wrote:
> On Sat, Dec 25, 2021 at 7:26 AM Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org> wrote:
> >
> > Add a new method for decoding a string list property, useful for e.g.
> > the "reg-names" property.
> >
> > Also add a test for the new method.
> >
> > Signed-off-by: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
> > ---
> >  pylibfdt/libfdt.i       | 7 +++++++
> >  tests/pylibfdt_tests.py | 8 ++++++++
> >  2 files changed, 15 insertions(+)
> >
> > diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> > index 9ccc57b..c81b504 100644
> > --- a/pylibfdt/libfdt.i
> > +++ b/pylibfdt/libfdt.i
> > @@ -724,6 +724,13 @@ class Property(bytearray):
> >              raise ValueError('Property contains embedded nul character=
s')
> >          return self[:-1].decode('utf-8')
> >
> > +    def as_stringlist(self):
> > +        """Unicode is supported by decoding from UTF-8"""
> > +        if self[-1] !=3D 0:
> > +            raise ValueError('Property lacks nul termination')
> > +        parts =3D self[:-1].split(b'\x00')
> > +        return list(map(lambda x: x.decode('utf-8'), parts))
>=20
> Doesn't this result in multiple decode() calls when a single one would wo=
rk:
>=20
> return data[:-1].decode(encoding=3D'ascii').split('\0')

Uh.. I guess?  I feel like the split-then-decode makes more logical
sense, since it's splitting a bytestring, then decoding the pieces as
utf-8 strings.  That makes sense to me given that raw properties are
bytestrings and can included multiple different datatypes and
encodings in general.

In this specific case, decode-then-split would be fine as well, since
\u00000 works as a separator unambiguously, but it still seems
conceptually muddier to me.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Ugxdt04eSIRd57/c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmHmkY0ACgkQgypY4gEw
YSLzqw/9HkwdTFxgtkFJV4rBLohlrtfMMRa1szUpkHvt225PbBMfTanWoOvLYUQQ
213EmQfS2jglMLtmBL5xtIBxaV4p+mFbAl+3UIDtXSqUiSocqYCPIk3ryqytz2GF
WWpaDKSn81WYyCwcIHOrloLDfVlTWaNY7tKXx6+HrmUO3ZHqOxBdfKfdWVhJjjNn
jSMtGUaErtYK17YOOqSdKAA+Br6jAxwDBU6BN9c83gv8hdm5QoZ764lpCRqrgIhj
zlDRSv5KtuFXzu7F0PMtmzqesYnRk+monIapMcyn4p6TVjGZd8MZdQ5tic61ZjV3
f8uQPnB3+/dPqHkoaDS62nfca7LxHKghAvjWH4lk6tfTmSqj53YZnkiXxlPSSFxy
tYZ6Xad7PDJA5WYK+x3/oBwHm2SmvRZEUuRBBDplU/eVuSfH1dYDdDP2yrfEhPId
F35Xuko6558tyDbjNnmiuL9RlC4C5PwxdyGdHTYBtuM8J60Dd75er0N2SVTujhbc
HGsK6sOhOe/nkxyFPiaI34GIOwJn2tYpBIjaJm9OyeiS1dK7jXhdjyLp7rqRj5Nl
HnKqDM4LwxMYdNJvSwCOwZLBGs8xDycTYwRH5ShBtm9t9r5SCvY3GofqmWpVCqnt
qSVJrb7JxjRm47o6/1miwXd/yXLXibZtbdpu4muF2X+ofx0HUu4=
=RtEt
-----END PGP SIGNATURE-----

--Ugxdt04eSIRd57/c--
