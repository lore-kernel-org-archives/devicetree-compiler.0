Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9BC1442FD;
	Fri,  5 Jul 2024 12:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720181026; cv=none; b=MRmi5YJH30qih8aKvCqFf6C9dTDO4c8CNudntreAX66om+ZLCxx+r1IhckWB5LTnD5AOhnclZgVih1MXUU/a2U9XaQtWaPVCCwvhVjyQigaSjcVSmGN9t5LAoHteCtArhSUTq0/gBRnk9pf8z7MviZ1vqrQrq78MFdC2VznBzkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720181026; c=relaxed/simple;
	bh=1qZPiby6dNfdzg4EvnsRz5A/DJxs+m25+lZXsLNft/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WO1apFCTsqaeEBXjnIQMf5wmkKIZPJs3PyIA8E45w5dMXaGi6/ghghavtxkJL9oDO9OkcwSFScJoIe5KwpJMScG2NlCafQropoNHKWLDBo+moZcp/k6+kbEyDKGnZ6FBDk4ZZCEBueQiYDl1HS+pjaIK5ugdczZnDoShwTUWfrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=fail (0-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=btrP+pxi reason="key not found in DNS"; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="btrP+pxi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202312; t=1720181014;
	bh=X4DAVOP6HMBX8wqyYlWDCDEKSJWq/wH+OjuosJpepIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=btrP+pxiXGrc7dHO071FFPCV5+QxRNUZ5x0T6KL79ZKYfHv9uioAB1MSps5SsvPsO
	 +eoi3oga+jopPXCfK8HbpJdAqLybj724XrWyUYsaAtf+bRFj9AmmIdBLoslLOW79jX
	 oQu89LqsEgznY9YuNLbEA+T/D3Wj4OO3q+9OHrxNCR/Y9wUsTsDGuud4p6RQqBmr2M
	 w/tUZPGNpzEdxxVgCGxNHcvATfcaTsgJkZO4Hi3Y3TYkME7Z6eRDmFOOG3IsVcdvL/
	 eoBQbC9pswmyJh9LgGyTxnDTIf1kiUnD+UXw2Jiam4CqY9LK2A8d9ORAZC2JOxWXHq
	 nkHnYsgvHRYTg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4WFsc640Z1z4wbp; Fri,  5 Jul 2024 22:03:34 +1000 (AEST)
Date: Fri, 5 Jul 2024 21:49:17 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Rob Herring <robh@kernel.org>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree-compiler@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Saravana Kannan <saravanak@google.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH] libfdt: overlay: Fix phandle overwrite check for new
 subtrees
Message-ID: <ZofdvXLWunF4opJB@zatzit>
References: <20240626075551.2493048-2-u.kleine-koenig@baylibre.com>
 <bxyscvary2ozzvdnszl3rtfqy3oo5bxnpn6avvaexhtnd47tck@qa44v5zxqhps>
 <CAL_JsqKj4w92Ym7KTmQo3D+iNszB5u6-kceMCrNCztM0LJaQkA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="K13xU9sxMcB2LoGZ"
Content-Disposition: inline
In-Reply-To: <CAL_JsqKj4w92Ym7KTmQo3D+iNszB5u6-kceMCrNCztM0LJaQkA@mail.gmail.com>


--K13xU9sxMcB2LoGZ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 03, 2024 at 11:06:32AM -0600, Rob Herring wrote:
> On Tue, Jul 2, 2024 at 7:44=E2=80=AFAM Uwe Kleine-K=C3=B6nig
> <u.kleine-koenig@baylibre.com> wrote:
> >
> > Hello David,
> >
> > On Wed, Jun 26, 2024 at 09:55:52AM +0200, Uwe Kleine-K=C3=B6nig wrote:
> > > If the overlay's target is only created in a previous fragment, it
> > > doesn't exist in the unmodified base device tree. For the phandle
> > > overwrite check this can be ignored because in this case the base tree
> > > doesn't contain a phandle that could be overwritten.
> > >
> > > Adapt the corresponding check to not error out if that happens but ju=
st
> > > continue with the next fragment.
> > >
> > > This is currently triggered by
> > > arch/arm64/boot/dts/renesas/salvator-panel-aa104xd12.dtso in the kern=
el
> > > repository which creates /panel in its first fragment and modifies it=
 in
> > > its second.
> > >
> > > Reported-by: Rob Herring <robh@kernel.org>
> > > Link: https://lore.kernel.org/all/CAL_JsqL9MPycDjqQfPNAuGfC6EMrdzUivr=
+fuOS7YgU3biGd4A@mail.gmail.com/
> > > Fixes: 1fad065080e6 ("libfdt: overlay: ensure that existing phandles =
are not overwritten")
> > > Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
> >
> > I wonder about this patch's state. Does David wait for feedback by Rob
> > as he reported the issue? Does Rob expect Geert to comment as
> > salvator-panel-aa104xd12.dtso is in his maintainer area? Are the
> > responsible people just busy; or is this fix already hidden in their
> > backlog?
>=20
> I think it's just waiting on David.

Sorry, yes.  I'm always finding it hard to find time for dtc/libfdt
maintenance stuff, and I've been particularly busy lately.  I did
catch up on a bunch of trivial dtc/libfdt patches lately, but this
one's a bit more complex so I didn't get to it yet.

> The patch looks good to me, but I haven't tested it nor am I that
> familiar with this particular code.
>=20
> Rob
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--K13xU9sxMcB2LoGZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmaH3bEACgkQzQJF27ox
2GcSQQ/+K0QkGD8v3kH9FElvULiZW7BThvJfwng1aYW88Co1pup/qr/BcGOALKO4
krPOirBuSmnSBzxMR8Au3RCmnm1D+UrKjKUFnw2/nodDoCRZvOCV7bZuClW0jf01
CqrhhkoHs3ezOT8Je3ve7vUqIheOwwq65tZWFebnL7NxFNRPKGhtQefGpLaW85+p
ouF/Su80oyPks3Gcp6vjzxoLu5Ofb91V9tOeSyRHeVtrsBl6TyRaIMbmY2GQnztl
MXEy5eUq+MeGjhCV8wk5siI9SXyIR85keVbZDrPHB4esBxrQaVPhOuJsmfxOndEO
S1lyG4f4xNgIVHJvloorvYugHCn7RBiUTCcCQMBiGFYDIW1AI65aXXaJKRz58T5t
G7/gHKww+Smays3YzPL5C/sXUGRtgH2nmiOJbvUXr3PuY5FrUD/wQUrUXVFtMcdw
wo6uGxhLiT48PTTnowcIu8XSllvGPtmL2tkOA3eqiaU2eZWE+G5DEGFkFObmcEam
5G6UZJ1Oo5gaOxVVPHbWutcQAdzEvppSWXujwXa6IxppgcVasyE7aevHGEEqu+8f
LcQLHtpv1FCwirXLYn/0btTHIm+G8bHTptHznZzWZkaguo270PHjBmHCsPiVHmk8
73U1O8swusZwxiXJkNaZYpY/pcwx9Vzdf4A60o5aWFcjqGuivR0=
=C1+P
-----END PGP SIGNATURE-----

--K13xU9sxMcB2LoGZ--
