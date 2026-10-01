Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9027536BCDE
	for <devicetree-compiler@vger.kernel.org>; Thu,  1 Oct 2026 01:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790818354; cv=none; b=EXyIYkSGxlX2rEwAp5Jc2NPQiGXCvLhvfSmPxGWjYPcU6AwyNgcxP3cQRAj+iLVBbVGuLm9z1cTEI+CarrSHS5xL5IUZn4owLH0cB4dcyd7Q1sBDLI/AnFYLyWQuqndH/JiOpI77H97kR4/74JS+6SdH80TM0ttOo/UUYJXqVz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790818354; c=relaxed/simple;
	bh=53zamRl58HSKptzXlYEYGOBazE1ZJswfWsSnMvfnzMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OGAM7/mHbc8NLogt1kPFZ5+TiduBYwG/p2eRSCJtMAUSPZ6zV3HnrYlp3v04pBeYivVpgGknbJyfPnqac/sumzQCMHXT/zZGyZcWnJvEX+3Zj895/8+mahffvh38mPndtemNo7V1QdoYywyQUQ0WUOio4mA/H3e33Z4Uqd9SaF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=Qn4+6q2L; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="Qn4+6q2L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202608; t=1790818309;
	bh=cPEydsvOPJTDGfm4vwcqrqUsDbA5a7wVh1nILYCrMFo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qn4+6q2LHqQ+TJSQnk6NhnTCqSydRV7XaLr0PpoPmBwc3ykb7Cpw5II/sz6DkofvA
	 R8ZTYMCqHwQYapQn/lPiauB+ynDcuA+/s4R44ecBvyw24ytjfeITvD3JPN4D0Aaqy5
	 2JrdgNAJvNyuRhEsKyE4Tk/t+XOxo1fcSfFqR/zVQibulBH/5+rEjSeaJhcfj1oF6s
	 oGV+522DyDblyfGqzzU3H27vyGJvfxxyGBOeukz3JPMSQL4F3oCvC/yMDHMYpF8oFR
	 ZZ5Y2xTzK2PZGC3Vz9hZZvQpNq4ohH8c6wKI5JdrlHCblEmMYDy9KRblJ7nwn20g2K
	 8+kGMl4Lp1lYQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4hwDsd2Q7Wz4w1l; Thu, 01 Oct 2026 11:31:49 +1000 (AEST)
Date: Thu, 1 Oct 2026 11:31:45 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH] checks: Warn about overlapping reserved-memory ranges
Message-ID: <ar239v8S_M4ng8Ko@gractus.seuss>
References: <20260923-check-reserved-overlap-v1-1-eef819889dae@oss.qualcomm.com>
 <20260925190300.7e3c1620@bootlin.com>
 <arzaAE-rwQUNKtpK@gractus.seuss>
 <20260930134522.35dcd951@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+FJrj5hcjGBrtLRS"
Content-Disposition: inline
In-Reply-To: <20260930134522.35dcd951@bootlin.com>

--+FJrj5hcjGBrtLRS
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 01:45:22PM +0200, Herve Codina wrote:
> Hi,
>=20
> On Wed, 30 Sep 2026 19:44:42 +1000
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> ...
>=20
> > >=20
> > > Weird to have '[' and ')'. =20
> >=20
> > [x..y) is a standard notation in maths (it means x is included in the
> > range, but y is not).  But that doesn't mean it's generally known.
> >=20
>=20
> I was surprised by the notation and I've looked deeper about it.
>=20
> Two different math notations exist for an interval notation [0]. The one
> you mention (with square brackets and parenthesis) but also the one I know
> about (square brackets only).
>=20
> Knowing now about both notation, having "[x, y)" is not weird anymore. It
> matches the "[x, y[" syntax I know about.

Oh, interesting. I hadn't encountered the "[x, y[" form.  I wonder if
that's (loosely) an Anglosphere/Francosphere thing (the [x, y[ form
coming from Bourbaki).


> [0] https://en.wikipedia.org/wiki/Interval_(mathematics)#Including_or_exc=
luding_endpoints
>=20
> Herv=E9
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--+FJrj5hcjGBrtLRS
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmq9t/YACgkQzQJF27ox
2GdJnQ//cN+kI+UlDr4b5F5om6RqA3A82ka6v5ByYeVptwWJb50PVW4k+2mZAf4h
cIA+fI/oEPgmb2fTCDnIlnlkODdUim4piBF8m7XR3IxtG2hur0QfBbIK9MfL4zQu
rsBrCKJ7qNmP8+RXl3WDsi+rtUyqy+cviE2DG0USdg4/ppsMq8iGU9UutIMswZB3
GojfmxfIMykO/rdg30Zsk3ADbr4G1OEZH4X5bkJpBV79MabaiItB/hxhJRCF8HIH
QAdegyzyFG35QbywROonnH4utdRNhDHtufQ69ECbWYeTCX0KTKWgfgsL2plhf+Dd
s9Q693H6iZQJyFmmznD2nJdlPDwExMJcci3uKdHzNlIdzNe0hkONEof5oqg5ig8a
3IjKDjSix/x40edISV8QZyckwtGkep0MjbdHsYxaGKZzFCe8LcjqkcRrIfCwhu/b
ttdUa22Kls4JUMgvZzTvtpLAqZjMxoyXyuFNl9jTwkCix2NWQ6xXZgi/4rFNQ76E
mUaGZorjiRX6d9N5k1Zhq/5FntBDqI2QQcaL3IoxwcEGHcX+4IPvBwcmMwB4y1tU
g5cQHZffHsHH84ohtwUrVL/DMQbznKK5XuEiQqj7dhldy8fl8DmShnPR3mlObrhQ
E6MUewyJ/J9V735LCA5IeLXppiuJPEcORFKaejMArPJQzN6yXzw=
=GNeS
-----END PGP SIGNATURE-----

--+FJrj5hcjGBrtLRS--
