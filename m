From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/4] pylibfdt: add Property.as_stringlist()
Date: Fri, 21 Jan 2022 11:12:17 +1100
Message-ID: <Yen6YWtzzRqH/tqC@yekko>
References: <20211225132558.167123-1-luca@z3ntu.xyz>
 <CAL_JsqLvQdm1kqMED8G03LEsm+xgyY2A+F+FD8DYeAy5o+eiGg@mail.gmail.com>
 <YeaRlvVf19o4Qnzm@yekko>
 <12903489.O9o76ZdvQC@g550jk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="B2fgfmCmZdtioubi"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1642733713;
        bh=GZMis5x7TcsyDFb9gQmL0fAzIubRTo2MyenPykJJnfI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=clN0pDUxj2+asfUhgSMnqWpCnl//bkhRdfPNm9u/u32rp5G1ESIMj2KYIPVRmQkkE
         3Zc204uHZDo5ury64mprCHQm7ilxbQzhFUzq05Atkz4M6+dR9/Eq2Rd/fH17ydxT1P
         zzolIN4LcleO9ZGCfaAhsJT81gvi8pBoS/wQHIUU=
Content-Disposition: inline
In-Reply-To: <12903489.O9o76ZdvQC@g550jk>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--B2fgfmCmZdtioubi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 20, 2022 at 08:24:31PM +0100, Luca Weiss wrote:
> Hi,
>=20
> On Dienstag, 18. J=E4nner 2022 11:08:22 CET David Gibson wrote:
> > On Wed, Jan 05, 2022 at 04:48:31PM -0600, Rob Herring wrote:
> > > On Sat, Dec 25, 2021 at 7:26 AM Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org> wrote:
> > > > Add a new method for decoding a string list property, useful for e.=
g.
> > > > the "reg-names" property.
> > > >=20
> > > > Also add a test for the new method.
> > > >=20
> > > > Signed-off-by: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
> > > > ---
> > > >=20
> > > >  pylibfdt/libfdt.i       | 7 +++++++
> > > >  tests/pylibfdt_tests.py | 8 ++++++++
> > > >  2 files changed, 15 insertions(+)
> > > >=20
> > > > diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> > > > index 9ccc57b..c81b504 100644
> > > > --- a/pylibfdt/libfdt.i
> > > > +++ b/pylibfdt/libfdt.i
> > > >=20
> > > > @@ -724,6 +724,13 @@ class Property(bytearray):
> > > >              raise ValueError('Property contains embedded nul
> > > >              characters')
> > > >         =20
> > > >          return self[:-1].decode('utf-8')
> > > >=20
> > > > +    def as_stringlist(self):
> > > > +        """Unicode is supported by decoding from UTF-8"""
> > > > +        if self[-1] !=3D 0:
> > > > +            raise ValueError('Property lacks nul termination')
> > > > +        parts =3D self[:-1].split(b'\x00')
> > > > +        return list(map(lambda x: x.decode('utf-8'), parts))
> > >=20
> > > Doesn't this result in multiple decode() calls when a single one would
> > > work:
> > >=20
> > > return data[:-1].decode(encoding=3D'ascii').split('\0')
> >=20
> > Uh.. I guess?  I feel like the split-then-decode makes more logical
> > sense, since it's splitting a bytestring, then decoding the pieces as
> > utf-8 strings.  That makes sense to me given that raw properties are
> > bytestrings and can included multiple different datatypes and
> > encodings in general.
> >=20
> > In this specific case, decode-then-split would be fine as well, since
> > \u00000 works as a separator unambiguously, but it still seems
> > conceptually muddier to me.
>=20
> The reason I made it this way was mostly because I didn't know you could =
have=20
> null bytes present in str.decode, I just remember horrible UnicodeDecodeE=
rrors=20
> on invalid input from other projects.
> If wanted I can make a patch changing to just one str.decode call as yes,=
 it's=20
> surely more efficient than doing multiple. But it's also not like there w=
ill be=20
> 100 parts of this property that's being decoded in a performance critical=
=20
> application so I think it's also okay like that.

I agree, and I tend to prefer it the way it is, unless there's a
compelling reason to change.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--B2fgfmCmZdtioubi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmHp+koACgkQgypY4gEw
YSKMqhAAtetp2B04vLmPO9oHX6WBw+f9AnMmc4gzojQeIJS83qQp6Eo+d8WpcK56
M+YVedcNiR/NilAw+XeL+Ybn0ifFb/9MJlEbzj3P/c0efMQBDADXkziwq0aLYDQ+
QN3mYDbLz7xUl0aQV6DaU30U29swriYxkHBa6cGPbbbulcZ1p0vuN+yXYybglb2j
Nq7X25h2Hjtrlg5Sm1cA0FwAFMfwL5RW7tJFnEvO6sI/R6QyhVK6xPI1d/OrmgCK
Vj1pX9UyiVwpm2xqmT0OHnqhtkvKW64P5gZcS0U9b1Z0QhLHAGn4MB+eAqWzLa9H
kYN+pyJAWa7UDoe0nVTIhqlPOqJtUqRxYwqF+W2uAFNUUcPZbl4bojwsLy09Kmsb
sGH7e3rLsXzOBoMPBEVG/0/yzbKG7eDcwdmRGYBYI6fSEe5gekHFO2DSRxKj05hN
zPzv5oWCvFh1AN28T/MYE0si8TNafJQW6bRreB1kjnUt2Gs5nzJM/yfp/tNgeMTZ
SFMcgZ166vYarm4MH0vAhB5CTMFDF+uiPPTce1n7gKWLINi8OYV2Dx4g9HFhfiFR
hSlhHkQpcaJsnxUxS1fmwajfkKnmpavLAzmp4Ss+qdcCzFQC2ZEKR88sjtRN+Z/e
UZs8sSyWOr3MFCn8mFZ+7MULsvre0QLtfLx+r1tGIgPilLjxkoM=
=uJYo
-----END PGP SIGNATURE-----

--B2fgfmCmZdtioubi--
