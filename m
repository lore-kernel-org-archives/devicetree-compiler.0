From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] Improve compatibility with other platforms
Date: Wed, 3 Jan 2018 13:58:56 +1100
Message-ID: <20180103025856.GL24581@umbus.fritz.box>
References: <20180101041518.23806-1-kevans@FreeBSD.org>
 <20180103001300.GF24581@umbus.fritz.box>
 <CACNAnaEpF9sK6dNbPG4_f_tyrp3yq1nyG+SS40VUgBCkLqYJdw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Swj79WlilW4BQYVz"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1514949189;
        bh=NjDEFk6rxdWEVw6jFs2a+4t8XpGIdDAzJok5A5xL9/Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ugd9LHUXjQ86iq71GHCPucpLPmZNnY3zWRi98TUo4dyOV26mH3kZ/2W1SyzM7Js3+
         u8WzQxab8CotS3rtt9yU75OhIBZl2ut8KL45moA5hg9MCdZb6D3nBFvBznnaZcq4hL
         AYrWTMtzxiZTB3QP/PYt/GpVKK2qGIjbO2ndot5w=
Content-Disposition: inline
In-Reply-To: <CACNAnaEpF9sK6dNbPG4_f_tyrp3yq1nyG+SS40VUgBCkLqYJdw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--Swj79WlilW4BQYVz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 02, 2018 at 08:37:16PM -0600, Kyle Evans wrote:
> On Tue, Jan 2, 2018 at 6:13 PM, David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > On Sun, Dec 31, 2017 at 10:15:18PM -0600, kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org wrote:
> >> This doesn't make things work out of the box necessarily, but it gets =
us a step
> >> closer.
> >>
> >>  - alloca(3) on FreeBSD and OpenBSD, at least, is provided as part of
> >> <stdlib.h>. I make the change here for FreeBSD only, though, as I cann=
ot test it
> >> on OpenBSD.
> >
> > TBH, rather than dicking around with #ifdefs and headers, I'd rather
> > use use malloc() instead of alloca().
>=20
> Alrighty- I'll prepare a patch for this, knowing that's a direction
> you're comfortable heading in.
>=20
> >>  - stat -c %s's equivalent on FreeBSD is stat -f %Uz; these differ eno=
ugh, allow
> >> STATSZ in the environment to specify local replacement for a stat that=
 outputs
> >> size in bytes of an argument.
> >
> > Can you split this change out into a separate patch, please.
>=20
> Will do.

Fwiw, some years ago I did a bunch of work to get dtc to compile and
pass the tests on FreeBSD.  Working out of the box on *BSD is
something I'd like it to have.  Unfortunately, because I can't easily
test on a BSD machine, the BSD support tends to bitrot rather rapidly.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Swj79WlilW4BQYVz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlpMRu4ACgkQbDjKyiDZ
s5J6WBAA4yGd3tSu8bks4zcFdWOfxhG8iehV0BmKr5R0/jWjK3BoVNHidJfyXVwg
tf2Dce6CYb2ewyeKteTif/2cFqj16nUVIDNB+uMyPr+64Xqcq/pnJx1ZW/E9r9i7
Ha13MvMpJU97pxHBz7he1iSUfYOLa5KYrJLtmaLh6IDLzI9UsmBoaKIZJr0NT2am
7iK2+uAf+1vL7MzoI3zWxPFAzq/DXgelF44gNH2XhRvG2PUsilaUNA0R++zcoAai
82EL69+/pYtkfbhVrOwjTi62yZaPsFC2nHS+c0HVJUHiLeboNlbLLafqEEwyW9/m
NXbDHgBi+t8KYRZY9vsc6+4YEiHYERsGr8MCFUZc2XINczI6QzVZ2ciN1ljX4tGF
vczfPRaBV18Rqof9mthWn1KUPLThc+QcfGoWrIsjiVqmb0W2cR0p0vffaqj4z8eC
EaUHnKxwpPyyTjjiXAexwPq3cHfovPBWl/2M0UqEleLXQQfaaTzLEvBZ98gneM8J
U/73ZZ7N9CzVGdOXXoOA7lg8kjhIn4SICMeC43w/CoFkIp1reK7YFXP8HyVW/s+o
2WQydm3UFWq3f3SsC42wzomxWBIu2EKtkQFBtr5OG1ipgnQwhrCHPsl+MJrQ5jUw
g7xDsMRVzGAeeUhxwyrD4FUpxmSBSpbq3yktReDo8r+LqJBC4Js=
=PU73
-----END PGP SIGNATURE-----

--Swj79WlilW4BQYVz--
