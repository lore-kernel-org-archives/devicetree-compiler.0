Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D85231A21
	for <devicetree-compiler@vger.kernel.org>; Mon,  8 Dec 2025 06:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765176207; cv=none; b=pGEhrSqlqhLESgvk88uAIG7l2RuH6SltZKTYRyfHYuzp0yEPc9X8gIYAhuFb/DCgjg++I3vB9zlGZ6H3+bjaZz/7sbB2SYEuC0n7pOvR7NbfRtllal5DyWU1ica5NZHYunQ64aLpZl7mYbg7ldvXp2181H8nXNMf5f0zGvbLWgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765176207; c=relaxed/simple;
	bh=VFjdb53gxC+KG1Bx/GsUJr8IqnYZEhF8LrBC3qCzQD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VKC4AoHbSTFUBvGq/i6Lk9iUb9E/hpDaH3oaKS4+PIUA87l0yIOZ9FmCHqP908gWFwsbqdPiBAdh6qIEZYs5Esk/NTBd/NPuEzlNzUp+X9BnyC5mE1oWUdKHGHk8E8THCPdhCypsmdd6HVckij2wmtBKM7OI/M77gzM4xj5rTyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=trjX3FgV; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="trjX3FgV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202512; t=1765176201;
	bh=Q8W7F1z5qCUHPnVfDwd1iBERC6PHTeN75ZDn78tuQQY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=trjX3FgVopZaFlGy5phpJXjebLI3ZrgQ33/AOgSN2GS13Wt6RB/3vRTG47l8PuocD
	 kMFgbJy8Zqn/WtCklSpiqgT9uzwdpHyu96PQHI8la9VgRQnc8SQgqv4fjwOqf1buw1
	 X/CgfF9o9VT3XGD+Y0AJWSiFgzSU04i5+idC23WA5dsMd0UrQTYhJnSBRTiZqk1d9+
	 oheiJ0vEM8++7tTF9fsIOR0UyCie6+CuboB+els1/rh2x2BQgGCsK3fl69BPnA5JkU
	 QjmSfKoXvqztmxVVJiEifsgiNCdg3TkZtrC3xvhqqt2QqlyuiznLYtlcvn6/0tR9Er
	 /7r8NmMaUo4PA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4dPsr92wwmz4wD3; Mon, 08 Dec 2025 17:43:21 +1100 (AEDT)
Date: Mon, 8 Dec 2025 17:20:09 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH v2 0/6] Restore phandles from binary representations
Message-ID: <aTZuGaccu-WDN6Ny@zatzit>
References: <20250919092912.663304-8-u.kleine-koenig@baylibre.com>
 <khp2b262g5iyp27z5aancaaffbn7j3dqwja5mywftnwmmuzten@35jd5sodbho6>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="My/Y821m0FOYbe0i"
Content-Disposition: inline
In-Reply-To: <khp2b262g5iyp27z5aancaaffbn7j3dqwja5mywftnwmmuzten@35jd5sodbho6>


--My/Y821m0FOYbe0i
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 05, 2025 at 04:43:43PM +0100, Uwe Kleine-K=F6nig wrote:
> Hello David,
>=20
> On Fri, Sep 19, 2025 at 11:29:13AM +0200, Uwe Kleine-K=F6nig wrote:
> > the motivation is to improve the result when compiling from dtb to dts.
> > By restoring the labels and phandles the noise in the output of dtdiff
> > is considerably reduced in many cases.
> >=20
> > This is v2 of the series. (Implicit) v1 can be found at
> > https://lore.kernel.org/devicetree-compiler/cover.1755692822.git.u.klei=
ne-koenig@baylibre.com
> > . The only change is an added return statement in an error case that i
> > missed to add. Thanks to David who spotted that.
>=20
> I wonder if you have this series still on your radar.

Theoretically, yes.  Finding time to look as been.. challenging :(.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--My/Y821m0FOYbe0i
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmk2bgoACgkQzQJF27ox
2GcO8w/+I94jUAjiZuuV4mQEfp9j662w8GbMAIi3nLBv/8ywqfdjPFrQHx4yu1gM
mzypUMDfd/h5s3yTnBuon70XcFlcecNjM1NkkQ3/cXTeeDOcsmbpcQEx5jFBS2So
S+p/9dkperHAXsFYKjlBqsO1Y81VjPbZN5c/vW2CwH9nmvwLxV2IY23e/XxEhr82
e40+w/Ctq283My5n3FA1ir3OxXOqFxiC48W76H0+T4pj21Gfs7ZPV+OR+/3kouLg
B7y1hYdaIb8i3M+vemjsKWR2plqop3OXSRFvOk+Uy3XPZhRjGb0uirtVQcN6zwJ4
bwB0QnwtXN2T6hIIEhV+79DshwhnWdVvWqClSqJXBNp30TsouzGBtM/xVPUMOSzI
Xb1EOL2ztrLhdiSj5dA+ro/+16cDEsQkRfk0pyPNywYprmgfCFaa4lMba5Y/RH7Y
MzGawuwljygFBAX1uQSod8rkXFyFF7emWJbUG1Kqu5/RVUn4LR+tc6v/6J0HaNu3
1saHRlPkZPmLBQIVf1OGXidQtCB/N/cMsWB2IvGvdUbTze7CwaI12JvG9faj/W3C
vnGxoeer8NSTZ8Zw2H/gTwCGM/Y0GVtPj24CaZ28xWUhVg3+C2NFjqC3GYDDK34Q
AjmsJbS7AZIGTZmAbJI+cucc6+g+0ufiQs6GqCLq/vzEW8lWB18=
=FzFA
-----END PGP SIGNATURE-----

--My/Y821m0FOYbe0i--
