Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8B23C457D;
	Thu, 10 Sep 2026 09:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789033323; cv=none; b=O2itEMDAmOvEmTfR4emdLR7ZlRKQF5aY6UrsPn4EvcnFt9JCISDJ5zLm62asI+Y60SAf7QPCuJF7SA3Uadt8NkoVczFzHmGlw5zqCzb85lXQFRo6xn+v9bP+sq9UjxcdL681nF48csBFqGBG72MlwYGhQkY2aM0Zo/AMmxNcTx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789033323; c=relaxed/simple;
	bh=n83Py55lqP80/Z0fUdHjNeh7/fKkusDGD3TlwqkSwdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KVL9FGxHNPtuhpT1PqMhW4odlNbErMet8YI5msnMJ6nVOA9eP5ZmEN/ZP/oKtCMQC1QF00rwZ+F+h2JHcNQ+Yaq4GbzLEvhZEKHRud78YZgXVGF7lWN9f5sv2o6elA3gAcydBu3D4O+Kt7IFGVmhriqf/uz+ypz75usKNM2Y/b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=ssMLL76t; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="ssMLL76t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202608; t=1789033308;
	bh=SUAvuIvwBeHDeb1PJutVR0+2JQvyOzEFy3Xt0m2+aQ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ssMLL76ty/+6GpSGJqKfk8aFrVMsD7nYDzPWW1YnizTPCAB3z8sJxedCjnFQAADW1
	 5ei+g3OXzdcv4cKn08Ki/lyqCJ+Ydte/JHnLMGwvNp7pX22My+T3XwZvOEb17lTjRl
	 scL0d6zDJnPoFn32eqrt+ipHjFiH+dH4dnnzHCRcI4vTF7+GCzAL/p4wlrH1eCP573
	 RV7ZxDzm8iZuCqoOIoNd2jnn5OZo4v4mQbZZiiO/fme5R69nts7JDDANj3NuY6GQod
	 BDyfroaWCUD23uT5k1AiTg9o3VLO0x/LIWJWfC+W/gY3dwRki00/U43D0IgcRg7UBP
	 YKabqfXTwNWvg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4hgXkh3cGVz4wSx; Thu, 10 Sep 2026 19:41:48 +1000 (AEST)
Date: Thu, 10 Sep 2026 19:41:42 +1000
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
Message-ID: <aqJ7SC9s5z1FRML1@gractus.seuss>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
 <20260826083146.304291-7-herve.codina@bootlin.com>
 <aqJBOdFPJbDKHt_9@gractus.seuss>
 <20260910095823.1f5abc2b@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tqlQraIGnTE82gtp"
Content-Disposition: inline
In-Reply-To: <20260910095823.1f5abc2b@bootlin.com>

--tqlQraIGnTE82gtp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 09:58:23AM +0200, Herve Codina wrote:
> Hi david,
>=20
> On Thu, 10 Sep 2026 15:33:58 +1000
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Wed, Aug 26, 2026 at 10:31:37AM +0200, Herve Codina wrote:
> > [snip]
> > > +#define FDT_TAG_CAN_SKIP(tag_data, tag_id) \
> > > +		(FDT_TAG_STRUCTURED | FDT_TAG_SKIP_SAFE | tag_data | tag_id)
> > > +
> > > +/* Tests reserved tags */
> > > +#define FDT_TEST_NONE_CAN_SKIP		FDT_TAG_CAN_SKIP(FDT_TAG_DATA_NONE, =
0)
> > > +#define FDT_TEST_1CELL_CAN_SKIP		FDT_TAG_CAN_SKIP(FDT_TAG_DATA_1CELL=
, 0)
> > > +#define FDT_TEST_2CELLS_CAN_SKIP	FDT_TAG_CAN_SKIP(FDT_TAG_DATA_2CELL=
S, 0)
> > > +#define FDT_TEST_VARLEN_CAN_SKIP	FDT_TAG_CAN_SKIP(FDT_TAG_DATA_VARLE=
N, 0)
> > > +#define FDT_TEST_NONE_NO_SKIP		FDT_TAG_NO_SKIP(FDT_TAG_DATA_NONE, 0)=
 =20
> >=20
> > Sorry, missed until I saw the later treegen changes that this is
> > defining some specific tag values.
> >=20
> > Given that, "Tests reserved tags" needs to be expanded to better
> > explain what these tags are for - what should readers do upon
> > encountering them, when should writers use it ("never, unless you're a
> > test case" is acceptable).
>=20
> I would say, in both cases, consider them as "unknown" tags.
> And so:
> /*
>  * Tests reserved tags
>  *=20
>  * When those tags are encountered they should be considered as "unknown"
>  * tags and rules related to "unknown" tags must be followed.
>  *
>  * Readers should skip them or fail depending on the SKIP_SAFE flag. Writ=
ers
>  * should never use those tags. Their usage is only acceptable in test ca=
ses.
>  */
>=20
> >=20
> > It might be worth reserving a whole range of tag values for tests /
> > documentation / experimentation, rather than just a handful of
> > specific values.
> >=20
>=20
> Ok. The range reservation will added be in the comment.
>=20
> /*
>  * Tests reserved tags
>  *
>  * A TAG_ID range in "structured tags" is reserved to tests tags.
>  * This tests reserved range is from tag_id 0 to tag_id 0x100.
>  *
>  * When those tags are encountered they should be considered as "unknown"
>  * tags and rules related to "unknown" tags must be followed.
>  *
>  * Readers should skip them or fail depending on the SKIP_SAFE flag. Writ=
ers
>  * should never use those tags. Their usage is only acceptable in test ca=
ses.
>  */
>=20
> Is it ok?

I'd probably put the reserved range up high somewhere rather than
starting at 0.  Otherwise it looks good.


--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--tqlQraIGnTE82gtp
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmqie0gACgkQzQJF27ox
2GfAAA/+IJQIUFEtw7XTtb2ZRW75a/BaJvSC4nNNhMf+pPJ08gw2cvmUYURCVBYB
VElLv1UNLlSLzRL7KRMDfeqF40oo8qrDn2yjLaa34G3ZnQ/3DzJ3KnLZSkALLV6b
ENOxaiR3UEa54h+AoXS4N+aZx7jm+vDjkoaVvSv3eeJeCunLMXT3iqW+KYpZqaI1
9vbKcqEX0307M8/7DaTJU94LDmR2GbxfRrnZ7foq/SwqUC+hRgKY1HSNLZfKagmt
+Ke/FrpCxHtRPff0S7VS7idalThwWlqYfAAcpPbAGjOFEz8gwN1BM8Oowb5FwD8y
p5VJN7KKdT4VmTwQ/ycCh7TQX3jrTx7p/KKNrnWWEctHSVK6Kj/7+nraJc+bTR2C
u0fBIqauq1uedUb62ErfHX9Z4U/nOKDlgFuVqOcuXNn79xpaMvnz2YjrwIfVwh7K
g9PGSsSyEz8Qb+v8yYualApNK0thfNQmJn2pxV7uDrwgsFqmmm2cBHsZPNh5KCAz
jQdcxQGa++QLaiheqyj7mxGrG/DUn3pUd9KWeiaGGEsu4ZAbnYD4YTmHcoL18zPO
VZc90+tGrj9wGXkc5/shQZCGaFd4N23ylxrq2DzkC0C3V4EjMLDOXKDziEfb+eXP
SIdjgzLi5AKnyeMPEXN0WouK0wKKKGi/lxYS8Y94Sny2E9k9Vzo=
=cP1h
-----END PGP SIGNATURE-----

--tqlQraIGnTE82gtp--
