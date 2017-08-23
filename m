From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 09/10] README: Add a note about test_tree1.dts
Date: Wed, 23 Aug 2017 10:36:56 +1000
Message-ID: <20170823003656.GF5379@umbus.fritz.box>
References: <20170819171803.195806-1-sjg@chromium.org>
 <20170819171803.195806-9-sjg@chromium.org>
 <20170821002557.GD12356@umbus.fritz.box>
 <CAPnjgZ05qhg5hLAtRGS89qEcrPyfYXtJSjQTzaR0y8z4YOUvQA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="pyE8wggRBhVBcj8z"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1503448626;
        bh=OsWgr4Jtqd9eZC7JnMSPLJ+259pde9rGrZrxNBq9Wz0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kJbF+KhmStcAU1pSR1Y8c8EpQ7LWXEEIIBty3zk2siu4Q06D0ODLSyEh1FNS3DO5S
         LXGYF6o1x8ljV3T43MEP3jInx8Dwpmq9uZ5MKbszvzheTaL1eKG13RxPpOK2OeBMtH
         96uL9QhsXBvXmb5092PnFogg+zpSFZCfzEqFkDmY=
Content-Disposition: inline
In-Reply-To: <CAPnjgZ05qhg5hLAtRGS89qEcrPyfYXtJSjQTzaR0y8z4YOUvQA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--pyE8wggRBhVBcj8z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 22, 2017 at 07:39:57AM -0600, Simon Glass wrote:
> Hi David,
>=20
> On 20 August 2017 at 18:25, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wr=
ote:
> > On Sat, Aug 19, 2017 at 11:18:02AM -0600, Simon Glass wrote:
> >> Add a little note in the README about something which confused me.
> >>
> >> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> >
> > I've applied patches 8 & 9.
>=20
> OK thanks. Will they appear at git.kernel.org at some point?

Oh, sorry.  I pushed it to my github tree to run the Travis tests,
then forgot to push it to kernel.org after.  Done now.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--pyE8wggRBhVBcj8z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlmczigACgkQbDjKyiDZ
s5JsMg//Qsdh/DSsKcv3QE4t+YiPt6zcdcmG4tan4wMDMcPtzgLUNHdbueutW7uJ
lrUI5DouV/sn8L5xyFH/98hayv4jV/8fXjxPArVIddd3It5bRdTU9Dh8sHqA3ukI
X1E+htW1iazlnhJQOy+PIMjQtk02qI/feBmuABLDmbSgqroWqK0wXu8E2NAMyPeJ
Eg97Swb15E9s0xezWK8qRMZgJHh/DjwCvWq/SZxLuKE1rTQ5eE1Lw33ZZWkCtWUw
NezqXyfiAjyiwFJu+VVXzGzbGihcTYdxsbUcqjqeu3ghXCDDmO1eNo2xw6BZMTFi
TNBdeQ8rsLSO9UyhRYPUNbEr+VPdqsCPYPWYma+vo4V/jrGzkqpHDyytTlXkc3iN
saOx5qzIOEhzL4S/8WnH/LA2wKk17ZkcIF5nptUEXJZfwPe3W+GvpLT1MQUQO2eO
nrDPviWGulMbb1m3qxr8kKYQRNFL5ztZnD6x5vstJF8DTT0+vXHBc0qmKalcTwmS
tfo31yMCgOzrYNaNDUz1upNmGeYC1Ek3XyDI8IzRoCuMuAZGZ0PvY2uW5UytHr41
xqd3/4beACh1ZDTCZoccf8o2BkHF7/VCgKiq7b+ix6RkXUzk9pIH0WrUhrr8xzch
E094q88b4Xq9THJpkYDbXmsq9zF/F/1R5icyJz17rgHS2fierL4=
=ztyD
-----END PGP SIGNATURE-----

--pyE8wggRBhVBcj8z--
