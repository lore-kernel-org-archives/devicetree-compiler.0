From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v3 0/3] Add a couple of string-related functions
Date: Thu, 1 Oct 2015 22:17:57 +1000
Message-ID: <20151001121757.GA29949@voom.redhat.com>
References: <1443517748-27819-1-git-send-email-thierry.reding@gmail.com>
 <20150930033132.GD13035@voom.fritz.box>
 <20151001081043.GC3070@ulmo>
 <20151001082342.GD3070@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="envbJBWh7q8WU6mo"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151001082342.GD3070@ulmo>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--envbJBWh7q8WU6mo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 01, 2015 at 10:23:42AM +0200, Thierry Reding wrote:
> On Thu, Oct 01, 2015 at 10:10:43AM +0200, Thierry Reding wrote:
> > On Wed, Sep 30, 2015 at 01:31:32PM +1000, David Gibson wrote:
> > > On Tue, Sep 29, 2015 at 11:09:05AM +0200, Thierry Reding wrote:
> > > > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > >=20
> > > > These three patches add a couple of string functions that have prov=
en
> > > > useful in U-Boot's copy of libfdt, so they are likely to be useful =
for
> > > > other users as well.
> > > >=20
> > > > Patch 1 adds a function to count the number of strings in a propert=
y's
> > > > value. This also adds a new DTS sample along with a small test prog=
ram
> > > > to validate the implemented functions.
> > > >=20
> > > > Patch 2 adds a function to retrieve the index of a given string in =
any
> > > > given property's value. This adds code to the test program introduc=
ed in
> > > > the previous patch to exercise the new functionality.
> > > >=20
> > > > Patch 3 adds a function to retrieve a string by index from a proper=
ty's
> > > > value. This extends the test program introduced in patch 1 to valid=
ate
> > > > the new functionality.
> > >=20
> > > Thanks, I've applied this.
> > >=20
> > > I did end up making a couple of small changes.
> > >=20
> > > First, I forgot to say earlier that I also wanted to change the
> > > testcase name to stringlist* for clarity.
> >=20
> > Okay, makes sense.
> >=20
> > > Second, Travis CI picked up some -Wshadow warnings: in a bunch of
> > > places you were using 'index' as a variable name, which shadows the
> > > libc index(3) function.  I'm not sure why that didn't show up on a
> > > local "make check", but in any case I've changed thos to 'idx' to fix
> > > it.
> >=20
> > As far as I can tell that's because index(3) is declared in strings.h on
> > my system (the file ships with the GNU libc 2.22) and that header file
> > isn't included from anywhere. Perhaps your system differs from that?

No, it doesn't show up on my own system, just on the Travis CI system
(which is really useful, btw).  See

https://travis-ci.org/dgibson/dtc/builds/82862264=20

> > Actually there's also a prototype for index(3) in string.h on my system
> > but it is guarded with an #ifdef __USE_MISC, and upon closer inspection
> > that does get set, so the index(3) symbol should be available. No idea
> > why I don't get a warning, though, -Wshadow is definitely getting passed
> > to the compiler.
>=20
> Ah, some further digging shows that this behaviour was changed in GCC
> 4.8 (search for -Wshadow):

Ah, that'd do it.  Travis is apparently using gcc 4.6.  I have 5.1.1
on my own machine.

> and the link in that note links to a note from Linus Torvalds here:
>=20
> 	https://lkml.org/lkml/2006/11/28/239
>=20
> which I find quite amusing because the reason for the change in GCC 4.8
> was exactly the same example of using a local variable named index while
> including string.h.
>=20
> I suspect that you're using some version of GCC older than 4.8, which
> would explain why you saw the warning and I didn't (I use 5.2.0).
>=20
> Thierry



--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--envbJBWh7q8WU6mo
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWDSR0AAoJEGw4ysog2bOSTe0P/jRhTcMl9frCHxo+q2DT3KWc
epaAtCRTaAeHTB8MW1HpmavfybQP1n0ZFwP4Uo8bCRA5FYob+GUJp5PPX0HBL82R
5hwDSwtqjmBYNdLzFInmFG2Hp3Q40qMN23kFcLVGGmAQynuRVBM4BKtKPl1LvNNh
ZHBEX8pgN0lxVDqtRVK6e7I85rc0dbdA5Jx1F2Zm6To1f0zbmX8lF8reScNCEPHX
j7cOUK4cHPIFIjwPRdxkL8HxBmw4God2F6undOzKkmijYDVvKPd9UJD0eNC0bmnn
hfBEwvMh8m1OsDwK6up6S8U+lTOGV5K2+Q7DZI41jbYiTFRDj0nr6OPu4VJp38qP
6X30fK6cuByR+Lag7k7DczsuYOH1bbeeMZDmbIAiQCbYMklP1H6h5ICJHx88XvzI
t4UvAKhdRYWnY/kMOUtZZJjRYGh26pVKZdEEIXhXq23RZvbh5P95ftV3E+qGUje4
/wWtlSKVYoRraBSHfkOzd+QC5/m3VcCkqNx0+/H2dCH6DGpSK6XT/71uOXikFCwg
cDr5S/zMPYyYChDVgVsctg7m8tzYUo+P8C3akZaExRinE+GNnL3mtHdtc7CD6kxy
A4+8iArB/i5Pfud6CJomYgNaO1BN3u4fFPOJ2dEBoe3hS/DuXXW9ezHgkDyAMHLB
U78mRnq866rZdWY+zrnm
=KKGU
-----END PGP SIGNATURE-----

--envbJBWh7q8WU6mo--
