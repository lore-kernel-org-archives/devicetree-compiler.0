From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] Improve compatibility with other platforms
Date: Wed, 3 Jan 2018 14:55:10 +1100
Message-ID: <20180103035510.GO24581@umbus.fritz.box>
References: <20180101041518.23806-1-kevans@FreeBSD.org>
 <20180103001300.GF24581@umbus.fritz.box>
 <CACNAnaEpF9sK6dNbPG4_f_tyrp3yq1nyG+SS40VUgBCkLqYJdw@mail.gmail.com>
 <20180103025856.GL24581@umbus.fritz.box>
 <CACNAnaFntyUbpiVVwFfiL_0EtX894Uidsdca3_jdBcNOVM4f0g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="BuBclajtnfx5hylj"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1514953470;
        bh=tOayyWEVLHgUhJNG0juUFgsLNEzGl1CmORvnzTIhjqI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Llp+15nyENKDtMIaHlXlSjLahGupq4QaEKed0hiqbzB25Y9TtO5V98PjFr6c+xqRP
         oI0uttvTaR3sFdo8zSh/se//e7GNFD8q+FHdUXpl24xRTTJC0v8RCmNOW10zo0VI2l
         JPCVa+3qEB0tFOk6v4ES9iVGY4OdslSJb4nbG4I4=
Content-Disposition: inline
In-Reply-To: <CACNAnaFntyUbpiVVwFfiL_0EtX894Uidsdca3_jdBcNOVM4f0g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--BuBclajtnfx5hylj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 02, 2018 at 09:29:14PM -0600, Kyle Evans wrote:
> On Tue, Jan 2, 2018 at 8:58 PM, David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > Fwiw, some years ago I did a bunch of work to get dtc to compile and
> > pass the tests on FreeBSD.  Working out of the box on *BSD is
> > something I'd like it to have.  Unfortunately, because I can't easily
> > test on a BSD machine, the BSD support tends to bitrot rather rapidly.
>=20
>=20
> Happy to hear this. =3D) You're not too far off, fortunately.

Good to hear.

> This, the
> alloca header situation, and an -ldl in tests/Makefile.tests are the
> only obstacles to being able to do a simple "gmake && gmake check"
> here. I've submitted patches for the first two, and as of r320872 [1]
> we provide a libdl on -HEAD.

Ok sounds good.  I had a look at the tests using -ldl and it looks
like they couldn't easily be adapted to avoid it.  However, I'd be ok
with logic to skip those tests if libdl isn't available, if you want
to broaden support to older releases.

At the moment dtc seems to be just teetering on the edge of being
complex enough to need some sort of configuration system (whether it
be hand-rolled scripts, autoconf or whatever).  So far I've been
avoiding adding such a thing, because that introduces a bunch of
problems of its own: hand rolled scripts are a pain to maintain,
autoconf is ugly as sin, pretty much anything else is nonstandard and
liable to introduce a bunch of extra dependencies.  But, I might have
to bite the bullet at some point.

> I will likely submit a patch in the near future to use `stat -f %Uz`
> automatically if stat --version exits with a non-zero exit code or
> indicates that it's GNU stat(1). This should cover the *BSDs, to
> include MacOS.

Great.  MacOS support is interesting in particular, because unlike
FreeBSD, I can set up a Travis build to test it there, which means I'm
much more likely to catch regressions.  In fact, looks like I have a
stale branch here that added an OSX build to the travis.yml - I think
some of the errors you've found and didn't have time to debug them
(debugging when your only host is indirect through Travis is pretty
painful).

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--BuBclajtnfx5hylj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlpMVBwACgkQbDjKyiDZ
s5J3Rg//cxEVTbj6hN1A70WVq+A3Qpabw+tQTBwUQgaPKs0/GvtcCr9e5ykda5Hp
os/DQeCtLC4ptSFvRS4G6I8thxAMsVqmI3QPOOezc4cpGKjkTsCaTFvbXh+RciH4
TWuBC0QfvSZy9tvDmMwqhoP/iTl5BBbCOQ/qAu0Gu8wp2ytgnR/+c7Z2X4N1Rtx8
qeoQu282wtW8c1hx61hCTtqf9reWznaEPRraX96qCcMJ9s/pNGd/m4RIrBie6ixC
xfFDXNzwf75xz5khmh80+mETs2XiPpKER/WN9laMeogJr9QyPp11nwXFacZ23JUo
t3W8sqsQIBfaYjHeXSqWDa26kXjOFsC82sAC/4kTsIwovPYErzjrdCkz/XlEg8fd
vHHBkE22+k1VaNYVjC9PdmWV4MLALcWWc7NgCvgj4nwRPWv1vh1eYCRfunHScFt8
HqDqO8bhY2/fL6Mx9rQIbk+XsfrZGpq6q0u7q38fg9W572o6G5X8DVm00AUk4Fn1
x0Wi3n4arY36B7TLhWdI2JQWRkHfD4xH2KIFnYImpaVkturuzDgbwstfwIENW+/k
HSATdBQCh/HOBrqU7g+Er8R1Jm/sdNB6ApAzVtryO7V+2284QihdHTLiBvCP7hrd
d/iEWkvjI7JcBrBf6qR2jvGInjPUxHx8LH5Co6LQ6pBochxEUVM=
=9eiy
-----END PGP SIGNATURE-----

--BuBclajtnfx5hylj--
