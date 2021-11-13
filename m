From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 0/4] Improve pylibfdt python packaging
Date: Sat, 13 Nov 2021 14:19:15 +1100
Message-ID: <YY8us0ZiIwHKdJqC@yekko>
References: <20211111011135.2386773-1-robh@kernel.org>
 <YYyQ747Z6EeGIg0s@yekko>
 <CAL_JsqJ1gSzVH1OYU6kPCYDfg32j8whCKaOmo2VU8hsUFsJZuQ@mail.gmail.com>
 <YY3Uw3xLCd5dHqoP@yekko>
 <CAL_JsqLuUMH16mow8bmYiPB60Cbci1cN_RhV3npYSqQzPhp97A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="oPkR+CeezpFDv5wr"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1636774605;
        bh=yV6+ocGmE1ZMO1q247hk2fA0LcR1VpZ4ClhMqIpQirs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HM/Xp/ZrmjJqvTQ7nlFNigQl3sQW9ufqMLlTAJ2y5IA99s5+o/W3WBvUuGIzLeTXj
         Wf2Rcl74ojNOlMd191Hk8LKyvwnwo9oqeWxdQK/n2EdLsszwwoh7yqIR4AYyq2Izil
         +q15ZNhaqWPKtqzZUHjP/dqk8tzFWYioEZ7ESvvo=
Content-Disposition: inline
In-Reply-To: <CAL_JsqLuUMH16mow8bmYiPB60Cbci1cN_RhV3npYSqQzPhp97A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Bruce Ashfield <bruce.ashfield-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>


--oPkR+CeezpFDv5wr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 11, 2021 at 10:01:55PM -0600, Rob Herring wrote:
> On Thu, Nov 11, 2021 at 8:43 PM David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> >
> > On Thu, Nov 11, 2021 at 08:08:08AM -0600, Rob Herring wrote:
> > > On Wed, Nov 10, 2021 at 9:41 PM David Gibson
> > > <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > > >
> > > > On Wed, Nov 10, 2021 at 07:11:31PM -0600, Rob Herring wrote:
> > > > > I'm interested in getting pylibfdt into PyPI and ran into a few i=
ssues
> > > > > with pylibfdt using the python packaging tools. Primarily, pip di=
dn't
> > > > > work nor did setup.py sdist and bdist_wheel subcommands. This ser=
ies
> > > > > fixes those issues.
> > > > >
> > > > > I've left meson calling setup.py intact for now, but think it's t=
he
> > > > > wrong way around. In fact, there's actually some efforts to make =
meson
> > > > > the backend for pip/setuptools. I made several attempts to comple=
tely
> > > > > eliminate putting files in the source tree without success. Also,=
 I
> > > > > noticed a meson install builds pylibfdt twice (though make may to=
o).
> > > > >
> > > > > I don't think I broke anything. Tests and installs both work with=
 make
> > > > > and meson.
> > > >
> > > > Applied, it certainly looks better to me.
> > > >
> > > > However, I've just spotted another nasty problem.  I think it must
> > > > have started with moving to Fedora 35 on my laptop.  A bunch of the
> > > > Python tests now fail like this:
> > > >
> > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > ERROR: testGetIntProperties (__main__.PyLibfdtBasicTests)
> > > > Test that we can access properties as integers
> > > > -------------------------------------------------------------------=
---
> > > > SystemError: PY_SSIZE_T_CLEAN macro must be defined for '#' formats
> > > >
> > > > The above exception was the direct cause of the following exception:
> > > >
> > > > Traceback (most recent call last):
> > > >   File "/home/dwg/src/dtc/tests/./pylibfdt_tests.py", line 378, in =
testGetIntProperties
> > > >     self.assertEqual(0xdeadbeef, self.get_prop("prop-hex32").as_uin=
t32())
> > > >   File "/home/dwg/src/dtc/tests/./pylibfdt_tests.py", line 374, in =
get_prop
> > > >     return self.fdt2.getprop(0, name)
> > > >   File "/home/dwg/src/dtc/tests/../pylibfdt/libfdt.py", line 451, i=
n getprop
> > > >     pdata =3D check_err_null(fdt_getprop(self._fdt, nodeoffset, pro=
p_name),
> > > >   File "/home/dwg/src/dtc/tests/../pylibfdt/libfdt.py", line 1279, =
in fdt_getprop
> > > >     return _libfdt.fdt_getprop(fdt, nodeoffset, name)
> > > > SystemError: <built-in function fdt_getprop> returned a result with=
 an exception set
> > > >
> > > > Any ideas?
> > >
> > > Python 3.10? Only guessing because I'm on 3.9. Otherwise, I have no c=
lue.
> >
> > It appears so; I've now merged Ross Burton's fix.
> >
> > > I was going to look at making '.setup.py test' work as testing is
> > > intertwined with meson too. Most python CI testing runs against a
> > > matrix of python versions which would help here.
> > >
> > > > Also, Rob, did you have patches to finish the conversion of the
> > > > Makefiles to wrappers around meson?
> > >
> > > That was Marc-Andr=E9...
> >
> > Oops, sorry, I got confused.
> >
> > > > If so, I'm sorry I've lost track
> > > > of them.  Can you repost please?
> > >
> > > One of the issues you had with Travis CI. Are you still using Travis
> > > CI after their move? I found it easier to just move to GH workflows
> > > than move given I always seem to hit login token issues (maybe that's
> > > just group projects with multiple users).
> >
> > It stopped working after the move, and I haven't looked into what
> > would be needed to make it go again.  I was actually thinking I'd move
> > over to GitLan - I'm more familiar with its CI stuff from qemu, and I
> > like what I've seen.  I haven't actually had a chance to do anything
> > on that front, though.
>=20
> I'm assuming you mean GitLab. I'm using both. The DT spec and dtschema
> test/pkging are using workflows. Schema validation runs with the
> kernel tree are on GitLab (which actually run in docker on my
> machines).

Yes, I meant gitlab.

> GH workflows have recipes (written by random folks) to do various
> things like python version matrix testing or upload to pypi whereas
> GitLab is more 'here's a container'. dtc could go either way I think.

Ok, good to know.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--oPkR+CeezpFDv5wr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmGPLrMACgkQbDjKyiDZ
s5IH0Q//ehtPN8+fI8/UifJjQpkeVxMgD9W+xMjksDrMCBIfAkDuKYQWKEzlaeAd
k0y5k4RNPizeLgS7pnRENH+Jh7zjn7iWy1BZiMAutEvoTYQz9yY5qNJ5ocx2jMxz
8eXDCUx9QgLmqU0TqGME3CnhGLykGuPYhjSZFTnVxSS7NhcMbaANsd/Gdlz4K7od
wozThyXrGLpyf1BqqtwU/B0PyWp7xO/sKwR/wWuiAbf6bS6BFlnI48c5yLCpgA+i
DWAo+Bb20ANJB8K1bjuK8gjctrB5KJZCDLabY7uYcOEo4h78H9JDSBLQVEnQ7AMe
gCfLtBpgeP5b40GcBpOlDJH+gLZ8SNKADW9pxJbi4UU9fZDgrkPxx7ocIHvuBEeg
rqsyWASRb4VnvMTuuOQFNOCOs9d4TQL/gCl75tSWqSrtej2LW09DqW3OSaOXh9h+
SSidUGwidQxLRQlTBIZryiO/PlTJp1Q7dClukY+h54nLiJp841OzwzJO4MWs7PEs
6I+8AHjxzkSFgmPt7nu2ya1GREN7f+rh+Bm13wnouTSPlFaDZ+savoztBi2kMTDo
dGnBs/ttJhFh2GgIZQHEhsXn63tctxiMybw7u3J9gE6RrpIxd7kAy3V8Q3LYTJWd
okDjN+H9G10/h0LcfLbVpT1EvXm4u7fLGSdCeeF8DblvXb3ya24=
=Ihio
-----END PGP SIGNATURE-----

--oPkR+CeezpFDv5wr--
