From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 0/4] Improve pylibfdt python packaging
Date: Fri, 12 Nov 2021 13:43:15 +1100
Message-ID: <YY3Uw3xLCd5dHqoP@yekko>
References: <20211111011135.2386773-1-robh@kernel.org>
 <YYyQ747Z6EeGIg0s@yekko>
 <CAL_JsqJ1gSzVH1OYU6kPCYDfg32j8whCKaOmo2VU8hsUFsJZuQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="mxra8q5M/lZ6a+kr"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1636685012;
        bh=G8LfFKUgOQtG9ZTt4SqL7dr3FYr3scP3LwX1Z354v9w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Lqiljyhn0pUlbE3AeSMdVS76IRzENpLtQPDyTzlvSYBtCxMJLTRT9Zotp4azsaj7y
         xxyZVvZ+MOSz/0BPy3wQ6ToBISg5EM9wvOnExmYSyGYoTuafOmEquUWslS0EzegsEb
         p1pfIt0ocB+UcyhcmZSqLyen0bN7JGYsS23vw1bw=
Content-Disposition: inline
In-Reply-To: <CAL_JsqJ1gSzVH1OYU6kPCYDfg32j8whCKaOmo2VU8hsUFsJZuQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Bruce Ashfield <bruce.ashfield-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>


--mxra8q5M/lZ6a+kr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 11, 2021 at 08:08:08AM -0600, Rob Herring wrote:
> On Wed, Nov 10, 2021 at 9:41 PM David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> >
> > On Wed, Nov 10, 2021 at 07:11:31PM -0600, Rob Herring wrote:
> > > I'm interested in getting pylibfdt into PyPI and ran into a few issues
> > > with pylibfdt using the python packaging tools. Primarily, pip didn't
> > > work nor did setup.py sdist and bdist_wheel subcommands. This series
> > > fixes those issues.
> > >
> > > I've left meson calling setup.py intact for now, but think it's the
> > > wrong way around. In fact, there's actually some efforts to make meson
> > > the backend for pip/setuptools. I made several attempts to completely
> > > eliminate putting files in the source tree without success. Also, I
> > > noticed a meson install builds pylibfdt twice (though make may too).
> > >
> > > I don't think I broke anything. Tests and installs both work with make
> > > and meson.
> >
> > Applied, it certainly looks better to me.
> >
> > However, I've just spotted another nasty problem.  I think it must
> > have started with moving to Fedora 35 on my laptop.  A bunch of the
> > Python tests now fail like this:
> >
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ERROR: testGetIntProperties (__main__.PyLibfdtBasicTests)
> > Test that we can access properties as integers
> > ----------------------------------------------------------------------
> > SystemError: PY_SSIZE_T_CLEAN macro must be defined for '#' formats
> >
> > The above exception was the direct cause of the following exception:
> >
> > Traceback (most recent call last):
> >   File "/home/dwg/src/dtc/tests/./pylibfdt_tests.py", line 378, in test=
GetIntProperties
> >     self.assertEqual(0xdeadbeef, self.get_prop("prop-hex32").as_uint32(=
))
> >   File "/home/dwg/src/dtc/tests/./pylibfdt_tests.py", line 374, in get_=
prop
> >     return self.fdt2.getprop(0, name)
> >   File "/home/dwg/src/dtc/tests/../pylibfdt/libfdt.py", line 451, in ge=
tprop
> >     pdata =3D check_err_null(fdt_getprop(self._fdt, nodeoffset, prop_na=
me),
> >   File "/home/dwg/src/dtc/tests/../pylibfdt/libfdt.py", line 1279, in f=
dt_getprop
> >     return _libfdt.fdt_getprop(fdt, nodeoffset, name)
> > SystemError: <built-in function fdt_getprop> returned a result with an =
exception set
> >
> > Any ideas?
>=20
> Python 3.10? Only guessing because I'm on 3.9. Otherwise, I have no clue.

It appears so; I've now merged Ross Burton's fix.

> I was going to look at making '.setup.py test' work as testing is
> intertwined with meson too. Most python CI testing runs against a
> matrix of python versions which would help here.
>=20
> > Also, Rob, did you have patches to finish the conversion of the
> > Makefiles to wrappers around meson?
>=20
> That was Marc-Andr=E9...

Oops, sorry, I got confused.

> > If so, I'm sorry I've lost track
> > of them.  Can you repost please?
>=20
> One of the issues you had with Travis CI. Are you still using Travis
> CI after their move? I found it easier to just move to GH workflows
> than move given I always seem to hit login token issues (maybe that's
> just group projects with multiple users).

It stopped working after the move, and I haven't looked into what
would be needed to make it go again.  I was actually thinking I'd move
over to GitLan - I'm more familiar with its CI stuff from qemu, and I
like what I've seen.  I haven't actually had a chance to do anything
on that front, though.

> > That README addition with meson
> > native building instructions would also be really good to have.
>=20
> I can look at that. It's gotten a bit more straight-forward with newer
> meson versions as you don't have to run ninja directly. So it is just:
>=20
> One-time init:
> meson <builddir>
>=20
> And then:
> meson compile|test|install -C <builddir>
>=20
> (I find specifying the builddir every time pretty annoying. Guess I
> need a wrapper script.)

Yeah, I tend to agree.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--mxra8q5M/lZ6a+kr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmGN1MEACgkQbDjKyiDZ
s5KIDw//XREIpMmxTVkLxI3iLrniQp6V2AzIMdTZFtysmAXUO3r0Gt6rjvDz8/nH
sBVuS3pkPGo5LGTNxqAPt0lU7UvZFxlWG2mWvnzcIuf3l11fGf9o8rl6RnNBVNA1
w3reIcfXPl5kLCT0MJFRYex2zmSNcNUlR0e3MdrIoknJPZVaqERBRpH3OHIS9bg/
q3rnssk/piQjsUevO4nMgRtoHOw3DKLBkNpfTJazqWTYcoGkV26cQqkiDccn2ACF
8P8AGcGfYFOY2EXzAkL7nd+DFFIoVDHb5JIgRGTNdAeidweI4hEHWqANOb0Eb3+V
WB3aD5XK+M4SNU7x8jjdawxTNyBReodc6xERPdBYK56km9WBf6X0ZjTHMerwjwrR
b9UvxcXmEapV/sOyJrQRWS4gblJ2gjVWc624KuLX+5T1Qnco7at6EPlXzPseuKYv
0TxNAFEOn0fY+VXAZiVLiR8s6r2JigVycXLYXNvuwT5R6MnaIXJcTlrWjqzdaQlQ
jzjOy+9HDLyA0zavZDEzu4Rdw8o8qSLx01UbH2UdZ1oLwtQvQOF3PGH93EUdSPQU
4oxwHZDOAgWzgygqHjCKDnpN25PC90FRN3w7Stk419NPEnQUcZHFw476frGbv2ua
pauA0K26iNUy0uLX7uoZUfdzR/cb6BwApSl1GnfS/lt/VgQg7K4=
=2RES
-----END PGP SIGNATURE-----

--mxra8q5M/lZ6a+kr--
