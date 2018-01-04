From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] Improve compatibility with other platforms
Date: Thu, 4 Jan 2018 11:54:07 +1100
Message-ID: <20180104005407.GS24581@umbus.fritz.box>
References: <20180101041518.23806-1-kevans@FreeBSD.org>
 <20180103001300.GF24581@umbus.fritz.box>
 <CACNAnaEpF9sK6dNbPG4_f_tyrp3yq1nyG+SS40VUgBCkLqYJdw@mail.gmail.com>
 <20180103025856.GL24581@umbus.fritz.box>
 <CACNAnaFntyUbpiVVwFfiL_0EtX894Uidsdca3_jdBcNOVM4f0g@mail.gmail.com>
 <20180103035510.GO24581@umbus.fritz.box>
 <CACNAnaGwpwRO27d2trLBqZjtiZYP1HBP=ck6GJ2N8VrTNehnFw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="hEarWVD7htqb1VxP"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1515028296;
        bh=hv3ymV10cbCxlNPhLRiRbc9mTD3HKs6rq7f/UFJxkqo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=W6hcniicdzFUkyZ7NyDMTOzlO/tXMF+DkAxP0czNrxcUi8WLM5/fuHHA6x74LShdw
         qIf19n7nh5pcR6ToofgQ/hSuYlxqRQf+kk9pc9HaiHkU8cOwxmZPE7blbY4QDZIKwU
         le9W+wVMmxGU60dyCvEqzFcSjbKJ1HqI4BLgsuAo=
Content-Disposition: inline
In-Reply-To: <CACNAnaGwpwRO27d2trLBqZjtiZYP1HBP=ck6GJ2N8VrTNehnFw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--hEarWVD7htqb1VxP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 03, 2018 at 08:03:27AM -0600, Kyle Evans wrote:
> [Resending with a proper mail client, because my initial response
> didn't go to the lists]
>=20
> On Tue, Jan 2, 2018 at 9:55 PM, David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > Ok sounds good.  I had a look at the tests using -ldl and it looks
> > like they couldn't easily be adapted to avoid it.  However, I'd be ok
> > with logic to skip those tests if libdl isn't available, if you want
> > to broaden support to older releases.
>=20
> The hard part is that libdl doesn't need to be available. With FreeBSD
> (and generally, all BSDs if I understood right), the symbols expected
> of libdl are available in libc.
>=20
> If I have my terminology right, our libdl is in fact just a filter on
> libc to isolate these symbols/functions for all of the software that
> expected libdl. We'd spent enough time patching out -ldl that it
> seemed a good idea, but these binaries *do* compile without it.

Ah, right.

I that case, I think the approach to take is to make a new LIBDL make
variable with the "-ldl" in it, so that it can be overridden on *BSD
to be empty.

>=20
> > At the moment dtc seems to be just teetering on the edge of being
> > complex enough to need some sort of configuration system (whether it
> > be hand-rolled scripts, autoconf or whatever).  So far I've been
> > avoiding adding such a thing, because that introduces a bunch of
> > problems of its own: hand rolled scripts are a pain to maintain,
> > autoconf is ugly as sin, pretty much anything else is nonstandard and
> > liable to introduce a bunch of extra dependencies.  But, I might have
> > to bite the bullet at some point.
>=20
> Ugh, build systems. =3DP

I know, right.

> > Great.  MacOS support is interesting in particular, because unlike
> > FreeBSD, I can set up a Travis build to test it there, which means I'm
> > much more likely to catch regressions.  In fact, looks like I have a
> > stale branch here that added an OSX build to the travis.yml - I think
> > some of the errors you've found and didn't have time to debug them
> > (debugging when your only host is indirect through Travis is pretty
> > painful).
>=20
> It'd be interesting to see those results as of recent. Their userland
> should be similar enough in the ways you care about for the results to
> likely be relevant to us, I would think.

I rebased and tried it again:
    https://travis-ci.org/dgibson/dtc/jobs/324587391

Looks like we're getting problems with the interesting way I (ab)use
the assembler to produce a test blob.  I've hit a number of problems
with that over time, so I'd really like to replace it with something
else.  Unfortunately, I haven't yet thought of a replacement that
wouldn't be a pain in the arse.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--hEarWVD7htqb1VxP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlpNey8ACgkQbDjKyiDZ
s5IClA/9FJrUz/hQP8lqDnUSD267oYkkyr56ghDYFY60zfERL+3XKptSKmlcts2p
AvoeMeaR3VgZm10o6yQV+1qu1QhANchuqFz0rJLiNBKnyzkvR5uiLbUxRNyxSjmz
LKCdUY7jH9/ZEhIS7G7yDI2LzytyJhY3JK+ODy2urltbdtB2dgjTgT8HB6u50zrp
hKQBijFJk5MgLGS1Ib8fS6+rtYDbcOxyyM+/Qm+FCy5mEu1sY+oE26IWCmFHOboO
qmdbt1gFR/aL/zD8NWh/+17cU5ctWnzLZdOyJchmJLg3q52AKoi/JWaT5cAtB6f4
BsNsqgX7DYgGNE79YibvGOscEfvvQFs7UB5n3NzSmHiaV+NSK+VSGpum2x5R5Wkn
S0uxdBglosc3jGMPLFXpaWgbO8qiMmRmw3RIkjHSP2BmTxQ2HIoBX+DEm+idbrv6
xyZdxhM4kZHhhBYcAAgS4CBblFJag7C2FrcF64kYunyr+d2VOpQXAzzvIe/sBRsI
KPhGxz+2Zts3Y065uD547p3YRumK/4q1JxpU1nw8wak4GZrnbvnPGPq+yhxYHmK0
RhvkhmCvtnTQk+n0hReVlDk+7eolJA3GXYqxWkK12ymqiaJBDQRcz21ILElBdhoz
cWTKeOVNBi+/93HQuZO+dsO2gUFigtHU3vxj76VziLE0mVjyjLk=
=/mh6
-----END PGP SIGNATURE-----

--hEarWVD7htqb1VxP--
