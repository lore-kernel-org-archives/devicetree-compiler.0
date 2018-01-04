From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] Improve compatibility with other platforms
Date: Thu, 4 Jan 2018 11:58:47 +1100
Message-ID: <20180104005847.GU24581@umbus.fritz.box>
References: <20180101041518.23806-1-kevans@FreeBSD.org>
 <20180103001300.GF24581@umbus.fritz.box>
 <CACNAnaEpF9sK6dNbPG4_f_tyrp3yq1nyG+SS40VUgBCkLqYJdw@mail.gmail.com>
 <20180103025856.GL24581@umbus.fritz.box>
 <CACNAnaFntyUbpiVVwFfiL_0EtX894Uidsdca3_jdBcNOVM4f0g@mail.gmail.com>
 <20180103035510.GO24581@umbus.fritz.box>
 <CAL_JsqK+ySbuCC27sSQ+VJg78n0m_QOTHQ90ur5pwahyBoU0Dw@mail.gmail.com>
 <20180104005500.GT24581@umbus.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="JT7Km6uNxtC1LbQY"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1515028296;
        bh=JYbBhsMICDyUvbwmsIq4wQ5tGB+exeqrrxyO3cGlsEE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cF1i+WBbl7yF27tXh9CopSqiyDFss/tqkKYMNWIlbKj8DyPkzoTLyto+bGXStq8cX
         wMwIkfhPG+RNzMzFNr7Ysp7tIep9GrkJfkSM8aAeHVttjESS5nL9aQWNOH8wIZ14tA
         IriAv+ul8opjTuQ2ANW/liw34iSyqHgYbhMJW1Y4=
Content-Disposition: inline
In-Reply-To: <20180104005500.GT24581-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--JT7Km6uNxtC1LbQY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 04, 2018 at 11:55:00AM +1100, David Gibson wrote:
> On Wed, Jan 03, 2018 at 10:51:23AM -0600, Rob Herring wrote:
> > On Tue, Jan 2, 2018 at 9:55 PM, David Gibson
> > <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > > On Tue, Jan 02, 2018 at 09:29:14PM -0600, Kyle Evans wrote:
> > >> On Tue, Jan 2, 2018 at 8:58 PM, David Gibson
> > >> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > >> > Fwiw, some years ago I did a bunch of work to get dtc to compile a=
nd
> > >> > pass the tests on FreeBSD.  Working out of the box on *BSD is
> > >> > something I'd like it to have.  Unfortunately, because I can't eas=
ily
> > >> > test on a BSD machine, the BSD support tends to bitrot rather rapi=
dly.
> > >>
> > >>
> > >> Happy to hear this. =3D) You're not too far off, fortunately.
> > >
> > > Good to hear.
> > >
> > >> This, the
> > >> alloca header situation, and an -ldl in tests/Makefile.tests are the
> > >> only obstacles to being able to do a simple "gmake && gmake check"
> > >> here. I've submitted patches for the first two, and as of r320872 [1]
> > >> we provide a libdl on -HEAD.
> > >
> > > Ok sounds good.  I had a look at the tests using -ldl and it looks
> > > like they couldn't easily be adapted to avoid it.  However, I'd be ok
> > > with logic to skip those tests if libdl isn't available, if you want
> > > to broaden support to older releases.
> > >
> > > At the moment dtc seems to be just teetering on the edge of being
> > > complex enough to need some sort of configuration system (whether it
> > > be hand-rolled scripts, autoconf or whatever).  So far I've been
> > > avoiding adding such a thing, because that introduces a bunch of
> > > problems of its own: hand rolled scripts are a pain to maintain,
> > > autoconf is ugly as sin, pretty much anything else is nonstandard and
> > > liable to introduce a bunch of extra dependencies.  But, I might have
> > > to bite the bullet at some point.
> >=20
> > What about meson? All the cool kids are using it now.
>=20
> Heh, hadn't heard of that one.  Too busy maintaining vital
> infrastructure to follow what the cool kids are doing.

Wait, no, I went to a talk about that once, and it did look pretty
nice.  Never had time or headspace to really do anything with it,
though.  Plus it would introduce Python as a build dep.  Not really a
problem for dtc per se, but given that libfdt is supposed to be
embeddable in weird limited firmware environments, I really want to
keep the build deps to a minimum.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--JT7Km6uNxtC1LbQY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlpNfEcACgkQbDjKyiDZ
s5JX4BAAsClz8xDQj/AGY3OMPTcONjcnpDITT4CtHuRNubNOU+txQRYDUciecMwJ
D8gB0IZxLtI/LjR287GkC5/6tGPMZO2TRV7WD4nfmaqjjsj4A6MUnZ9PuNwPWarq
oxhquZgCdfvMdA6FCZ7Qb8Pw0gNnkAhP8cDpB/cwCZyW6Fi4rq0/7M5mwkn84I4d
s6dMoe8p2saeQGuALDFLvq6jeGpTconbjQZnfDhsuqGv6AHUEjG0ydPabHJ+fsJM
Y+0deLXSZIv60mK/XeGtEafTEdYQ/jlhh6mRgG0T4AFjzIiuKiqnpul12nWBmnmE
iY/aOaubHZ/VRGx8YHTFLwrA7fp/nelPi/D0Nf4AxZxS8tyLb6ud9BvzjOehkIiZ
3CWp4wrKHHGjDVOIGNM8B3AdKle8p4oExZDLkstGAooCuPsAM+8tRSAGU7SPK84B
31whI4Sycehp+W5hI3taA2cN7uZaodTfnoyFu30cbsj2YmJ25N7UTyWL2OKAhNRn
QA4DejN7xQ28x3VoSSw21WUJf0eVSoiBGSKbW92v0yuCoZwP1f6fAJwr+XKLhPgc
yBzaaNDc0xBovKS867QrbVcSPMp/u/T4rTH+wRV50uZswYZESdSc3pHjvlxO3OzT
aUZqzi2jQX+HkHkb5VNQnjoiJEqnelpzkm74D6P6ZCAsOdIzdk0=
=C7NY
-----END PGP SIGNATURE-----

--JT7Km6uNxtC1LbQY--
