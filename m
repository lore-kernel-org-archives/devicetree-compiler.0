From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] Improve compatibility with other platforms
Date: Thu, 4 Jan 2018 11:55:00 +1100
Message-ID: <20180104005500.GT24581@umbus.fritz.box>
References: <20180101041518.23806-1-kevans@FreeBSD.org>
 <20180103001300.GF24581@umbus.fritz.box>
 <CACNAnaEpF9sK6dNbPG4_f_tyrp3yq1nyG+SS40VUgBCkLqYJdw@mail.gmail.com>
 <20180103025856.GL24581@umbus.fritz.box>
 <CACNAnaFntyUbpiVVwFfiL_0EtX894Uidsdca3_jdBcNOVM4f0g@mail.gmail.com>
 <20180103035510.GO24581@umbus.fritz.box>
 <CAL_JsqK+ySbuCC27sSQ+VJg78n0m_QOTHQ90ur5pwahyBoU0Dw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6k8oSBQUGGHRSAt9"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1515028296;
        bh=iEdOupfJtgkdkUnmNrjjwbmIr+ZA2Ot1LF0qrm6KoSs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dsd3LrKSH5CioG7yYQpy+HDHY6MzUg4z86s58uB1xu0+N/kmdrUUvNVpfDigOOYso
         Ivaxb4aIC620vmy+/gPzvgsA89qzIlhNWdii/DVFn4kds7RhnMdwwNdsp/lOrhv7oD
         uVmpTpxbJLEmmBTqlyXQvKOZYzI4ZeRvevS/zb1I=
Content-Disposition: inline
In-Reply-To: <CAL_JsqK+ySbuCC27sSQ+VJg78n0m_QOTHQ90ur5pwahyBoU0Dw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--6k8oSBQUGGHRSAt9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 03, 2018 at 10:51:23AM -0600, Rob Herring wrote:
> On Tue, Jan 2, 2018 at 9:55 PM, David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > On Tue, Jan 02, 2018 at 09:29:14PM -0600, Kyle Evans wrote:
> >> On Tue, Jan 2, 2018 at 8:58 PM, David Gibson
> >> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> >> > Fwiw, some years ago I did a bunch of work to get dtc to compile and
> >> > pass the tests on FreeBSD.  Working out of the box on *BSD is
> >> > something I'd like it to have.  Unfortunately, because I can't easily
> >> > test on a BSD machine, the BSD support tends to bitrot rather rapidl=
y.
> >>
> >>
> >> Happy to hear this. =3D) You're not too far off, fortunately.
> >
> > Good to hear.
> >
> >> This, the
> >> alloca header situation, and an -ldl in tests/Makefile.tests are the
> >> only obstacles to being able to do a simple "gmake && gmake check"
> >> here. I've submitted patches for the first two, and as of r320872 [1]
> >> we provide a libdl on -HEAD.
> >
> > Ok sounds good.  I had a look at the tests using -ldl and it looks
> > like they couldn't easily be adapted to avoid it.  However, I'd be ok
> > with logic to skip those tests if libdl isn't available, if you want
> > to broaden support to older releases.
> >
> > At the moment dtc seems to be just teetering on the edge of being
> > complex enough to need some sort of configuration system (whether it
> > be hand-rolled scripts, autoconf or whatever).  So far I've been
> > avoiding adding such a thing, because that introduces a bunch of
> > problems of its own: hand rolled scripts are a pain to maintain,
> > autoconf is ugly as sin, pretty much anything else is nonstandard and
> > liable to introduce a bunch of extra dependencies.  But, I might have
> > to bite the bullet at some point.
>=20
> What about meson? All the cool kids are using it now.

Heh, hadn't heard of that one.  Too busy maintaining vital
infrastructure to follow what the cool kids are doing.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--6k8oSBQUGGHRSAt9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlpNe2QACgkQbDjKyiDZ
s5Lw7w/9EaEwvYcAn8wYH0ZfqrJeT22sN9vQHRu/pI2sWslV8Xuv40o4NagNPgGn
oN/7XmR9I3xV+Yvg0SvwPR67IzmJyRZYIQ6HqxtGBjjk3n/kb/hqFE/A1vdCcie+
Os+NMi920HYn/a+ugD66WycGMymv9Yt15YhhgkukQCRA5pskhg2Z+1G7sxJVughG
FNf3D9C9PApaBAC6lJtYxKhpbl9Fq91fJAXu5D5SuX9bOWWV6mBBrfNPHGM1muwr
O/jwcQydDN1QJsxBFa9NspxJ6ZbrE6Rg28ZbfK/rGqA7Q1t39yUPOC7mbd5ixUEr
PbrfS2GmcXR1Z3is7kqiijKgQO8dJh3QZo6QIInDmM7LHVSUxdSOvkZOkSN+cE1j
7/BqFqCmE9StgrJsEPlduoVgdRDMg0VnQk8BkQeP+s0mQkvjB1Q1KenAcfjd4su2
mWE7yZ2VX8ZTKoxWtbeNY5juYr3XUeRFhrbWyiPoAL/Y9+uVR1hffOc1l4c06dJE
/cCXdxR31l9+pZ2HTsYKyv1M0CAfkVDzYDpDLbZaYPhGJGAvrGXeREPAtt58S+IJ
zRzSldnUr/p2M91Dc16Yko4kgSPfu6vwIx6xrPSZ6vpCa5V8BWqymqdGGsQN07hy
CJNem9WYHrqqFhormHRC1tiGQwYIJhrTqsKCMfkGlR0CxB+cV7Y=
=o26l
-----END PGP SIGNATURE-----

--6k8oSBQUGGHRSAt9--
