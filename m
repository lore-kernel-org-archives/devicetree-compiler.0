Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82382237A4F
	for <devicetree-compiler@vger.kernel.org>; Tue, 19 Aug 2025 10:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755598185; cv=none; b=Wk8BbhwjfF9IgbjkYusfDoOan/qWqM/S5bwVcx+duZG10THmpC5odvoT4X3gZ8Cp1+dy6D6iRefRq9y5Rofffn8N6MA6HcJgMITCccY8ur1iYfbCaPISIEglfhSWFbQJnBd14y12BCbEstUg0Y27I5jfTtn5mb/9fIlAbS/tADg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755598185; c=relaxed/simple;
	bh=jYHfAp+ejmq8iaQfegIGHNCBkGiwfpgWfbutVKfQiKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pu37VeNH3ToMsX+Vx5tN1KN+mfJc5HnwiHmOmZF4pdns9YecbR+HuUT6mwbbBI4sUP33Z+HRxr8WCBzgc7qWR93Z8I2kTL7T917iN0pLmTk6/DJz4nVujvF29lzzbktzSstnX4q0PiNsbVdltmIfGgIxLUyG1n5bZj2X5XKscLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=X3y3z8ZA; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="X3y3z8ZA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202508; t=1755598179;
	bh=JPcNvCjjG88iVg5g4P/DmA5pc7kxxgIp00Y+w59L9hE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X3y3z8ZAj7OE8XhQxK8ODnuAsnTxd+lA9nFTJHGXU4Vp4O4Lwwk9+diZzxBFP0g5E
	 0vri/g/Z32YCCJuHi/ezzAX7jHkv4X+VcVBROLniKcbCG/2//VKz3tHFrUQvOU6a7c
	 Q1eSknc/dArFtVGxneFkQNLIimDgqf0HhX3KwHzb6Pp3kaFBqF4aJBOi7sN9uUPSoo
	 eabMtsB9RtX/BBV71wE+fcuo0NP2RbnhamkqA9A1jhxLpkgZqSwCt2Acq2AERQdRhI
	 F+dBFy7zJ8JTgkcqK4QLdk9YjR72SZTRvwU13Bx4e+kOyYGKD1YF4/XlYLfEH3AThO
	 8fwP83DIhvQZA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4c5lgR3KwMz4wcg; Tue, 19 Aug 2025 20:09:39 +1000 (AEST)
Date: Tue, 19 Aug 2025 16:17:43 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH v3 1/2] livetree: Simplify append_to_property()
Message-ID: <aKQXB5PuW-vt9zKJ@zatzit>
References: <cover.1755512759.git.u.kleine-koenig@baylibre.com>
 <eef88e559f5b9818c4c2311fa8a75ab6fd4508d5.1755512759.git.u.kleine-koenig@baylibre.com>
 <f3nskwqmfkf5i47qbnt4bfh4bfl4c4mt6lygay5cfethpzddj7@6c5bmfnd7g67>
 <aKO2b1OK3eE8-yVo@zatzit>
 <vfuiklzwdz5jpyr4mrozbqx6eauoz42mhdwcriri26g3hfj6yi@4etztt5te4ug>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XwFB1aWzIRZ/2I04"
Content-Disposition: inline
In-Reply-To: <vfuiklzwdz5jpyr4mrozbqx6eauoz42mhdwcriri26g3hfj6yi@4etztt5te4ug>


--XwFB1aWzIRZ/2I04
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 19, 2025 at 07:35:39AM +0200, Uwe Kleine-K=F6nig wrote:
> Hey David,
>=20
> On Tue, Aug 19, 2025 at 09:25:35AM +1000, David Gibson wrote:
> > On Mon, Aug 18, 2025 at 12:38:57PM +0200, Uwe Kleine-K=F6nig wrote:
> > > Hello,
> > >=20
> > > On Mon, Aug 18, 2025 at 12:35:45PM +0200, Uwe Kleine-K=F6nig wrote:
> > > > The two if branches are quite similar. Build the property first (in=
 case
> > > > it doesn't exist) and then the common parts can be done outside the=
 if
> > > > block.
> > >=20
> > > Argh, I failed to add my s-o-b line here. Maybe b4 picks it up when I
> > > write:
> > >=20
> > > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
> >=20
> > Heh, thanks for adding this after.  I'll take it from here and paste
> > it in.
>=20
> Does that mean you're not using b4, or that b4 doesn't pick it up?

I'm not using b4 - never had enough impetus to figure it out.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--XwFB1aWzIRZ/2I04
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmikFwYACgkQzQJF27ox
2GcE8Q/+OPyRVMpXRSXQtaCBhLic4b4ueKuROzJmLSOPWjRJDgu/l5DhnWx+WMgi
d9lxE9jzRlXcB4c4PVhtJ2rI8GwA+bZEPai0btL5P9FrEKXkHxcp6OGzQlLG3c8I
lEhcCV2iQkigM0jQYZaweziLr4IuxuriQclCbTB6nPJ+Iacbx41rC+7gSrVRM2sY
eKyUVdTPJaSiZUC5Sjg0PgbryIIFCwAUJG75atC/enVb2RcT4xMIfwuOHdOaxLfo
onkRFDIBktlYnsxtj7mIhABlxMgEoSQMcpD7EsmOycUHoisvxBc2PBgftMWqekZN
/TRz7q27fUCsOj5TfO5iIU8pwBZ470xYCCQYourSJbC3K/bE0Zei64CSCRZIgCvj
NQZelf/tVNo6xITmNKK6rGq0tTwnz3ywqfwrJ5eKa93bGTDqaV3uFLRWDFRWALSA
Z7L/F/04tKuem7gyYCI8dXx+t/0wn/2bNp2u7/99hrFu+m4Kq8VmkwMQ8CGWPZQ/
qS7pK1QGgaxSqxkHx3bQeW733DBgxBtSSE+TQB/fwwAY+uHtLpNF/xmoE8liHKQ4
O6/3bVXL3o5zQbiJw+BIBQDqElU2K16njlGHf6MSIjVmxskkkgX1PbBrET0bh3bs
C8B65paa4BVuzPVG+eUiEde3vzCzFQQehkpZOz0P2oI3whjjlEs=
=GsY1
-----END PGP SIGNATURE-----

--XwFB1aWzIRZ/2I04--
