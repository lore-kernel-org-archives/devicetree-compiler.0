From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v3 0/3] dtc: checks for phandle with arg properties
Date: Fri, 22 Sep 2017 21:24:46 +1000
Message-ID: <20170922112446.GS4998@umbus.fritz.box>
References: <20170901185303.24770-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="i7PFf0A+xzvFOD9h"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1506079825;
        bh=Nb8gtHHxQBL9YZNevE2k1JaNDfglWPFWCda5GJndmcA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Lc1m35iyU6J0FBGwQUSFBi3yRU0lPaUU9f/BLnw9iYYg6ml8DnCV7SaeYqMLs3HnD
         gyUFRpcMPlzl4AD+cCewpc9D/ly5lDkY9agTU0bFfkrdbjZ3zpE/XGOZeIuna/xBhJ
         bGBzdHQm9mFBQRR9YbUrOakSq8r44MsqHyXqWaDc=
Content-Disposition: inline
In-Reply-To: <20170901185303.24770-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--i7PFf0A+xzvFOD9h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 01, 2017 at 01:53:00PM -0500, Rob Herring wrote:
> David,
>=20
> Here's a new version of checks for phandle with arg style properties. This
> checks interrupt and gpio bindings and other common bindings which follow=
=20
> the same phandle plus args pattern.
>=20
> This generates ~200 warnings building the ARM dts files in the
> kernel.

Sorry for the delay.  Applied to master, thanks.

>=20
> Rob
>=20
> Rob Herring (3):
>   checks: add phandle with arg property checks
>   checks: add gpio binding properties check
>   checks: add interrupts property check
>=20
>  checks.c                      | 280 ++++++++++++++++++++++++++++++++++++=
++++++
>  dtc.h                         |   1 +
>  livetree.c                    |   6 +
>  tests/bad-gpio.dts            |  13 ++
>  tests/bad-interrupt-cells.dts |  12 ++
>  tests/bad-phandle-cells.dts   |  11 ++
>  tests/run_tests.sh            |   4 +
>  7 files changed, 327 insertions(+)
>  create mode 100644 tests/bad-gpio.dts
>  create mode 100644 tests/bad-interrupt-cells.dts
>  create mode 100644 tests/bad-phandle-cells.dts
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--i7PFf0A+xzvFOD9h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlnE8v4ACgkQbDjKyiDZ
s5IAVBAAz+aiESWYyeqN1mnQKDxoMIc55iChplBnrmdNNB76xpFagtjFfSkUbccO
EUPMMtVLryyEBGb96mpTaAkP3hlKAvxioY2nzHL+CzDvabFRGyKpTeO4pGF+9tUr
5T1NsHvfaUrIEUmB8Nr+I08RQbeQRDNg/0FyBCZiR0hDhg6DQCdfqu4zZ+qDDxF2
HZRAz7c2lL4hCwLbjYukRAgOWB1obI32zdUB29JSCiioyQouuqA1zOrYoq01FLRy
yc1QK10uK5zbhjWgBcri1erzrWqCUw/aCqcExVOXMOp/1AYNVuXRS6nugV/5q31O
WU+prlIWSTRWi3IKGJljcmypn+RvQlXNuhn2mqj/rsmOQGTTTvkRNaVlVF0C5zpa
K08kMJq/AyE1MCaZoWjSUuWH8JRAI3SuEzSMCzNqfJ/EAmzFgADkQgnS1DgbQOI0
Pe7Z34EU7AEq5zsEbVsInTgVZ4dkEnYzNbYUL88nX20igj/SZQpJyTiEzy1dcgJd
9kTal26IuT+zZ8YN2juWLxJ6nvHWiWpdbFmI9fFXx3bZJeAToMLQxLFMnPpnLdAq
LlTpWCZWK4dy25tbCdvzNxkCbC7iAGjwmH7Mcwi9laMmXayditqGWIWXBCql2BvK
7LNyx23rzz5rF04agbscf/l+70hYXGcEIk+pj2/bltTbMRVamLM=
=fQcd
-----END PGP SIGNATURE-----

--i7PFf0A+xzvFOD9h--
