From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 4/4] pylibfdt: add FdtRo.getprop_or_none()
Date: Tue, 25 Jan 2022 15:50:29 +1100
Message-ID: <Ye+BlawkG7LK6ZkF@yekko>
References: <20211225132558.167123-1-luca@z3ntu.xyz>
 <20211225132558.167123-5-luca@z3ntu.xyz>
 <CAPnjgZ3wun92Q1vMSEem9CH6A8MWNbKZNaepf4j4Ttmf-GNPtQ@mail.gmail.com>
 <5532817.DvuYhMxLoT@g550jk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gm7ecM1LGFpYQM0l"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1643086269;
        bh=oyka5BU0I18gW3dPFv9ep/UFJZxj/9Bn+eTf+UMl/80=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Rf7iYtFNlEnjyJ61n1MTmJvGrNkbTEpVXXCgFr8AcKkvtoNrqeuklprce/TMi24qI
         rwvIOUewyqIqGj6UENHPxUpR8YsJ2jLPwXK2bdRRif4LFXklhHorCtDRiD8xMTV/r9
         DoKIhv2jupe9K8vtAXATtk3KGbzEWU5lN4OU5o4k=
Content-Disposition: inline
In-Reply-To: <5532817.DvuYhMxLoT@g550jk>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--gm7ecM1LGFpYQM0l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 22, 2022 at 11:36:01AM +0100, Luca Weiss wrote:
> Hi Simon,
>=20
> On Dienstag, 28. Dezember 2021 09:34:57 CET Simon Glass wrote:
> > Hi Luca,
> >=20
> > On Sat, 25 Dec 2021 at 06:26, Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org> wrote:
> > > Add a new method that doesn't throw an exception when a property isn't
> > > found but returns None instead.
> > >=20
> > > Also add a test for the new method.
> >=20
> > You can use
> >=20
> > getprop(node, prop, quiet=3DQUIET_NOTFOUND)
> >=20
>=20
> This returns -1 when not found which I found quite un-pythonic (not that=
=20
> pylibfdt is currently super pythonic ;) ).
> Having None returned if not found is much nicer to use and much more clea=
r to=20
> use
>=20
>     if foobar is None:
>=20
>  instead of having to use
>=20
>     if foobar =3D=3D -QUIET_NOTFOUND:
>=20
>=20
> Are there any changes I can do for you to reconsider your position on thi=
s=20
> patch?

So, you're absolutely right that the current interface is
non-pythonic.  The question is simply whether that ugliness is enough
to outweight the complexity of introducing an extra interface.

>=20
> Regards
> Luca
>=20
> > > Signed-off-by: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
> > > ---
> > >=20
> > >  pylibfdt/libfdt.i       | 10 ++++++++++
> > >  tests/pylibfdt_tests.py |  2 ++
> > >  2 files changed, 12 insertions(+)
> >=20
> > Regards,
> > Simon
>=20
>=20
>=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--gm7ecM1LGFpYQM0l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmHvgY0ACgkQgypY4gEw
YSJWPhAAkt9Jb6++xJpD5hHEFk4cES7WQqouptCbwWY8YUAVmU/QYltMYVy/Fcaz
X+3hECIh+lRJHpqauTuSL+nqhCP8NyxN5nkUFuaahf1ZDIo18nd2S6Op7Cxbkmw4
5a3bCnRX9WyWDpip1N3fxOjbIkI6xMSA3Bg38pwbqvpK9DQhawwWOFR1UNdV3GfE
VPZiuO42HOOT8yEQ0UgtXdJ0xmdF2I4OehyBJL1XXDGMkt0bTZ1EGgXGFq3ddloz
rEeGpEI2JBEBubtl/twVFhnaRsNzOb4YfxbdMBa3doOZxORUxWz0i9Iuyj5JJ1f3
BRz0bfmuM0pLMxRgNR/iVT+mXSJ2dL4DgCsiV3GDniluN5Kg91F0PxEFf2G4Bsow
a2RU7QliUI6OOi3mtilgWcau0PYvWgU4VW9yPT4aP6DNu0FOEzKQ2MlGjZFBb4hx
Gd7Za4mfZGnP2COLcsCGOY/vZiYfBNVASBKZBJFgz2f6Ck+JwkH0DeFvH/pRktkz
KRuDAl3P5N7Vyv7+vf9XsR1RBB7mTpJ2aRn0sa2ARl1DStG788QF9ZVZb8mwz8kG
omjPVG5OL6Q/ej+CFD5ww4Ob4uRtdzsNf2vNyIFxqI2tbvnehEWJQSZNTcu63wUj
lpZYszOOUwtRd/MAnKf4zlX+2G5u0DYXkx70sJzgWkIQyoz+uc4=
=RSuV
-----END PGP SIGNATURE-----

--gm7ecM1LGFpYQM0l--
