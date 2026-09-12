Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88EB1E1024;
	Sat, 12 Sep 2026 02:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789180520; cv=none; b=QJT18E47jZ/xkde9AqYgf17sb+whZwrBr9ZavZ8YP7GejjeYmNMKt6QFhWx7mSnn3zSn0cwBaWb3yXt1HXy+azEvosuUd1GRWsYyQrEF8wJ5/zkBstE9LW6btcBUOrrx2HPu8zmm2hd/XS9jymWeleW0as+PgCWujhLiYlhh0HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789180520; c=relaxed/simple;
	bh=kli51mY42llgRM2ea1jRTbiQeSUI3ygxqv08t3NGLno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=najp01qBFbVZphvi1uRxHcOSpiDxbqA4TLzPKDKj2XGlZQzkEAn7AOmzRn+WckMzSlF6tGy/FZbjhdL1BllYNYXcSnqNcvB/shWtBDQxSwTKndXODtNpuyTWoMrJo/4t701mWI7M5kXZ7kZa2zHI82y2w4XvUelKJsLbyHsN6RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=N9I3W4Xr; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="N9I3W4Xr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202608; t=1789180502;
	bh=75eLKzUoXHUo23hp1ogYyFEL74lRyx+dZ0Dk9pYcYwU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N9I3W4XrLxLN924gQxa16ghQbtv8pv6thZi4EWYpc4BTViW45Dsh91pJ3BYiY5KX3
	 i/6SmUZzXhR7m7iAATjC9dUL47frOzLSiHvGDApfsbSUMPPqBt3PclnVfDIVN9ftja
	 MnTiUVrB16BP2cpOlUdvRiHpwM8nWUtW8AM+o3VwFiWaSaXi/QcXkrGPxHnuTdpYKA
	 Gci5M//Dt7FYjXN1oi+5ghCtiVmm6XxI2y/MKPrJTFVfy6R1mDOX8nji8m0SdcufRa
	 snb21b/G0Zn/qNBZxVwsPDRl6cuRGqYMWSKvhAxyLKDLYa5ykWDIffga3cjRxC/1q9
	 7u/tm8N8eVNEg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4hhb9L4yK6z4wc3; Sat, 12 Sep 2026 12:35:02 +1000 (AEST)
Date: Sat, 12 Sep 2026 12:35:10 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	David Lechner <dlechner@baylibre.com>,
	Ayush Singh <ayush@beagleboard.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree-compiler@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree-spec@vger.kernel.org,
	Hui Pu <hui.pu@gehealthcare.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 06/15] Introduce structured tag value definition
Message-ID: <aqS6XbyzTmVIv4vr@gractus.seuss>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
 <20260826083146.304291-7-herve.codina@bootlin.com>
 <aqJBOdFPJbDKHt_9@gractus.seuss>
 <20260910095823.1f5abc2b@bootlin.com>
 <aqJ7SC9s5z1FRML1@gractus.seuss>
 <20260911095339.14833b5d@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/68aDUztSCrXWstL"
Content-Disposition: inline
In-Reply-To: <20260911095339.14833b5d@bootlin.com>

--/68aDUztSCrXWstL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 09:53:39AM +0200, Herve Codina wrote:
> Hi David,
>=20
> On Thu, 10 Sep 2026 19:41:42 +1000
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> ...
> > > > > +/* Tests reserved tags */
> > > > > +#define FDT_TEST_NONE_CAN_SKIP		FDT_TAG_CAN_SKIP(FDT_TAG_DATA_NO=
NE, 0)
> > > > > +#define FDT_TEST_1CELL_CAN_SKIP		FDT_TAG_CAN_SKIP(FDT_TAG_DATA_1=
CELL, 0)
> > > > > +#define FDT_TEST_2CELLS_CAN_SKIP	FDT_TAG_CAN_SKIP(FDT_TAG_DATA_2=
CELLS, 0)
> > > > > +#define FDT_TEST_VARLEN_CAN_SKIP	FDT_TAG_CAN_SKIP(FDT_TAG_DATA_V=
ARLEN, 0)
> > > > > +#define FDT_TEST_NONE_NO_SKIP		FDT_TAG_NO_SKIP(FDT_TAG_DATA_NONE=
, 0)   =20
> > > >=20
> ...
>=20
> > >=20
> > > /*
> > >  * Tests reserved tags
> > >  *
> > >  * A TAG_ID range in "structured tags" is reserved to tests tags.
> > >  * This tests reserved range is from tag_id 0 to tag_id 0x100.
> > >  *
> > >  * When those tags are encountered they should be considered as "unkn=
own"
> > >  * tags and rules related to "unknown" tags must be followed.
> > >  *
> > >  * Readers should skip them or fail depending on the SKIP_SAFE flag. =
Writers
> > >  * should never use those tags. Their usage is only acceptable in tes=
t cases.
> > >  */
> > >=20
> > > Is it ok? =20
> >=20
> > I'd probably put the reserved range up high somewhere rather than
> > starting at 0.  Otherwise it looks good.
> >=20
> >=20
>=20
> Ok I will move the reserved range at an higher area and probable the
> highest possible area.

Sounds good.

> Will choose also the highest possible value for FDT_TEST_NONE_NO_SKIP
> Indeed, this one is a non-skippable tag and so should use "old style"
> tag.

With non-skippable new-style tags no longer being a thing, do you even
need this tag and test?

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--/68aDUztSCrXWstL
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmqkul0ACgkQzQJF27ox
2GcdiRAApPuc2S4VpeCwqTnM3M5Ee9HnCE8dgU28FCGTNz1cRLx07H28NlTioItP
dT9JDlmqJFWPRr9Q0kCTjipTkExvv73M11Y4fkozK8z+7Mm6ekiph1pytAAqP/fA
Cicje/csqalR8oLScux4axiAXN9qho3o/xaPlJ3qc/0AHV4YrMrQKFspDSKflSy8
Bqx3MP2aGYqNiR8U5V9Ryg3PSHV3IPNvd9nFjZz8ATsWsleX9g6NdzmwYeSdAEpX
tisfsaDWfRZzsWKTOE52nxAg716w4/znj5R07xixPy5cWKCrXkSd2jB3PFiC54Hv
7kEXSZuEznIXjMqUY3iMjaWHyqWaAVMYOgm0ROHHPcgtlJDKJYVHRLKjeTvEjzjV
eT3f3Jsiu87W1K2K8zv2wfCqs8/En/aBkUMHdoxHA4w7pKMp3P1L+euzf38sVOw1
BUoSvOZTqtb+f/ga+QFbBrYyd0OlXzuIcWZHMQO5cMe1vIjlCrBi9vkI0ql4hXIP
gYlWISj85h5d3yRi++tPh5ucydkdmK2EbyAsUo9zXaSkJLuqDIqdguRghEDYae8C
jGsvvdqpbD0pUO7BIJdHrUbtmnuqJfazngPuMu9GONHm6sNW3uZccPqURnWxt+as
WxuOoVxzvoDgk8fFfj+szM4Q+d301NJJbqrJdCPNfuvr7ipjPOM=
=DyNS
-----END PGP SIGNATURE-----

--/68aDUztSCrXWstL--
