From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: fdtdump.c: Compile error with GCC 11
Date: Mon, 18 Jan 2021 17:50:36 +1100
Message-ID: <20210118065036.GL2089552@yekko.fritz.box>
References: <db5d86de-fa1b-9d44-1188-edb81578bc00@embedded-brains.de>
 <20210106035431.GB3209@yekko.fritz.box>
 <8822ec89-7782-7608-cae5-e62770e28771@embedded-brains.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="4e5ZDkbgLEOfWmLx"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1610952680;
        bh=H8TXOlY8sIKSA3yXjB88pvomEnBPdFWz9Fh+Xw4Cmgw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RnOjswH2gYUBytMW3v+DCW/4bJz/jMGC296EqMTe2DtgvwYBmutEHa04K82ZsTiVs
         0er576krin3SzSGBGuBgeOzR48xVssfqOzDhH03HzLFfo4LfiPBkcHzE8aIRYEA5HA
         EUCgix6c2yMsZXvzWGiGiOjAyHByKY1dKcT3rGo0=
Content-Disposition: inline
In-Reply-To: <8822ec89-7782-7608-cae5-e62770e28771-L1vi/lXTdtsBbLBgBO8hYIQuADTiUCJX@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Sebastian Huber <sebastian.huber-L1vi/lXTdtsBbLBgBO8hYIQuADTiUCJX@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--4e5ZDkbgLEOfWmLx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 15, 2021 at 06:22:19AM +0100, Sebastian Huber wrote:
> On 06/01/2021 04:54, David Gibson wrote:
>=20
> > Ah, I think I see what's going wrong here.  I don't have easy access
> > to gcc 11 to test with, so can you give this draft patch a test:
> Sorry for the delay. This patch fixes the dtc build problem with GCC 11.
> There were no other issues.

Thanks, fix applied.

>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--4e5ZDkbgLEOfWmLx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAFL7wACgkQbDjKyiDZ
s5I+txAAi+25hkYXcKcT2otxhIcD0B8uRMaLiXK/oi9PUN8pRHjViQcz4P5RDcnN
TmaqTkKMpg9xbIqEfBaveDPAO/zrJGMm8SEAvqLwMrzH/Q+QQGync8OEUcheowiP
ix6Iw1pzCeKchtwfvaQ7tGuJyq+I1KPrlgyLnd5xfJjMH15crWUqSBeDjxeJKx0P
XjgbAxXXeAxM6EeAB1hB+MYQR6V3qxKUWsffQTjw/9vLfm+UlfYWLht5o9UiY4Cw
NqdAeFhFJgA6TiMJsr7B4pmkG25IFeVpo07KFM/M0OKD6GofTxxwdnwqz5zIzJTQ
ANJTe09K44AaDWjQvbJLoHY72D+BwXm9Sj3JSP/7775A+FUqsksukSvJSJC/JOZF
AbJefQFfsnkWFpbXpkwYbBx6+PN5ZxZlk8s1fHdorc/mkJ/JixU/j4GqyFO4nF0L
xFM7cdwwpjwdhIT1c28RVyo4u9pDKzgEj7zKO7ez/M1Pdf+DLuFoehnPyJaJHNyX
ZduzAVFjZTS5WTXx3z74sr3W0QQt03c+jDQF7kmnrHENspYT6Eluxgf0nQs5t4rb
VvAMTyfOShqdGMzPx5CVYsji/R6UawLQiD58FgsRX++8DErXAsVe8VNXfCkRGZeZ
VpY1aVeOJt4kb2TJjX6Wul+OkMMur2ffW+tNT0xYMzW6hccBuO0=
=O/kI
-----END PGP SIGNATURE-----

--4e5ZDkbgLEOfWmLx--
