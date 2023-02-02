From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] pylibfdt: add size_hint parameter for get_path
Date: Thu, 2 Feb 2023 17:38:05 +1100
Message-ID: <Y9taTeDc9Nro2F43@yekko>
References: <20230201181112.1644842-1-luca@z3ntu.xyz>
 <CAPnjgZ1hHkTuAiUwxPuTeWTeJX1Sju2tnZz-pCyBY0BeW6cYhg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6DIiqKIyKdBKT1fe"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1675320630;
        bh=KXQVwbFwXW9PZKcI+NvQuW/TYPgYkbrSu8LT3zzIHEA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fmGeJtFYAaidYmjmCNURYlT8aAQgjiwEArSZq4Yq4rD0owi0wOu23kgB+Vk01nwd7
         Q3RpyFvfJWBsTIUyZTIVkvDhgivOy1tgNrP9A7GwKksCPVAdhJk9iVhO3wGlJpkaSh
         mnYW+xCgXXCJ9djDdC5LaLirCEkplAIpu+ogAwRw=
Content-Disposition: inline
In-Reply-To: <CAPnjgZ1hHkTuAiUwxPuTeWTeJX1Sju2tnZz-pCyBY0BeW6cYhg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--6DIiqKIyKdBKT1fe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 01, 2023 at 01:20:51PM -0700, Simon Glass wrote:
> Hi Luca,
>=20
> On Wed, 1 Feb 2023 at 11:16, Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org> wrote:
> >
> > This also enables us to test the -NOSPACE condition by adding a test
> > setting size_hint=3D1 so this path is taken.
> > ---
> > Follow-up from "pylibfdt: add FdtRo.get_path()" from April 2022
> >
> >  pylibfdt/libfdt.i       | 8 ++++----
> >  tests/pylibfdt_tests.py | 1 +
> >  2 files changed, 5 insertions(+), 4 deletions(-)
> >
>=20
> Can you add a motivation for this? Why are the paths so long?

I'm also curious about that.

> Reviewed-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Code looks sane, so

Reviewed-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

Unfortunately, I have no way to test this until
https://github.com/dgibson/dtc/issues/78 is fixed.

Also, I'll need a Signed-off-by line in order to apply this change
(see CONTRIBUTING.md for details).

>=20
>=20
> > diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> > index f9f7e7e..0c80c54 100644
> > --- a/pylibfdt/libfdt.i
> > +++ b/pylibfdt/libfdt.i
> > @@ -443,11 +443,12 @@ class FdtRo(object):
> >          """
> >          return fdt_get_alias(self._fdt, name)
> >
> > -    def get_path(self, nodeoffset, quiet=3D()):
> > +    def get_path(self, nodeoffset, size_hint=3D1024, quiet=3D()):
> >          """Get the full path of a node
> >
> >          Args:
> >              nodeoffset: Node offset to check
> > +            size_hint: Hint for size of returned string
> >
> >          Returns:
> >              Full path to the node
> > @@ -455,11 +456,10 @@ class FdtRo(object):
> >          Raises:
> >              FdtException if an error occurs
> >          """
> > -        size =3D 1024
> >          while True:
> > -            ret, path =3D fdt_get_path(self._fdt, nodeoffset, size)
> > +            ret, path =3D fdt_get_path(self._fdt, nodeoffset, size_hin=
t)
> >              if ret =3D=3D -NOSPACE:
> > -                size =3D size * 2
> > +                size_hint *=3D 2
> >                  continue
> >              err =3D check_err(ret, quiet)
> >              if err:
> > diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
> > index 68d6aaa..34c2764 100644
> > --- a/tests/pylibfdt_tests.py
> > +++ b/tests/pylibfdt_tests.py
> > @@ -354,6 +354,7 @@ class PyLibfdtBasicTests(unittest.TestCase):
> >          node2 =3D self.fdt.path_offset('/subnode@1/subsubnode')
> >          self.assertEqual("/subnode@1", self.fdt.get_path(node))
> >          self.assertEqual("/subnode@1/subsubnode", self.fdt.get_path(no=
de2))
> > +        self.assertEqual("/subnode@1/subsubnode", self.fdt.get_path(no=
de2, size_hint=3D1))
> >
> >          with self.assertRaises(FdtException) as e:
> >              self.fdt.get_path(-1)
> >
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--6DIiqKIyKdBKT1fe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmPbWjsACgkQgypY4gEw
YSJoKw//aTN48IeLH51AqG6S7dBw/tENbin0Y8+3XErsOjXcGdoSnSAXZLaOM4ih
q/ZHrA2rEJrFsd0OZxf+riSwBnYw2GRkcxxXr3f2aq4BfvSuHZ5rsJ3o5CheEVI6
HO4qZf11FaWgJ8+hOUNt8PrRqbGvttpctbusOLcM4AqChVOZF0FaOZu6Pa1AWWoZ
1tERQ93lHQhbeqthicsC2W/ivAAa/OI7h7P7w2eML2dUCnkYgmbT6E1/WreNfev3
QBWCwu0YsPJZ+bvwwN9cIctTJbyGD9wS5gfBb60md/1JEYxZIztEUdciMNBQI9Nz
sfoTbgdu0g/+ZY4qy5WPTnHNgGMWuT9EKCAmqDvgb27LK1W5+CGefcMd+GheDsAo
4f8+msOiRikRqs64XgBmiLBvMNu6nX8U/71dVwYT4ilrzQYQFPlVZC4UduAUBPpF
3ilFS2qeHNUDneTmoM815W+CyF8Wom+uvu2MgzQ13x5rhhVlhpeljAWEMKylGv+D
VbqyXMaLuTIdH8nuM5fdS2n1GUGw1dIGpgf3pBCjtQPyVmZUSf+WajjUdVvB2IoE
wi9Gn8nn/77oM00qJlSVeHd5rCX5VirCx/fjJMj1e2LfZmkIA1PaTRBnq/29DDPq
pYTWMGbppeThaDjTahdkHizujqgRWtXBGucZOHyiiaP49gPfcRI=
=b4Ot
-----END PGP SIGNATURE-----

--6DIiqKIyKdBKT1fe--
