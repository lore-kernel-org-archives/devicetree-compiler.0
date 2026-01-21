Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4E63D349E;
	Wed, 21 Jan 2026 04:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768970646; cv=none; b=dh/FZAb2+Awba3KDO0J/xyqU+O0H9+GYqQQV/X9rv0xpCYkgMKl0u1dV1EBjBu2c0gtFb5COyc6/LSQbRKlOIc3qSbwKj7IjgKAGZubK222FtJhp29iVJHi7wIKuSVz6nicV51rPN/baDBgFT08w+5F+pYUyAPGHc8vBtGF2I0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768970646; c=relaxed/simple;
	bh=qAii6QgdL7jNKvduUac6KHBcuSw94ItyGA9jGBwPO68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kHL1EZw2T6LNeO3I7bqSjl+bg8ASoouwDjXJYRkPe2TSqtJGACUVlnipQGyqXPliN+Ay5Rc3x+9FRD9Sgkh80zpM7lx2g/BUSExO46WPnsmVtElbla+vs8Z0TalAlIN9g1aEJtML2OV/0kf/RmGn07WRu6UrzdJouwas/6fBDVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=ZA2eF+Ny; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="ZA2eF+Ny"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202512; t=1768970636;
	bh=TBU1vLJlZkxvDPvJysewmpBzqtdpCRwm54Kioswt+Cg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZA2eF+NyeBpDNw9qrZ8XvxxWwNx9AOAqxIpTmvh91D1xtXdcY3uxIhcOrc+ba//3g
	 3WRDxpPHI4oWRmrQat3fDZjOIppaTXcAdHJx8H30lVh8e/5ROucMl109KjHx3hXUv0
	 yY9b7/e0dBFz7e7gw3d+NsqhThbfVL7X4tqbqLaNXPZrH9fa3ZgJT+hgk9h+uxVaIg
	 hDrCVayWSZKK+kaseXYb0hcJSDkmDf8ottKYFZr+SHQBqMzHJXCMcM4wZUYM+jgkwy
	 XC95yAsXymxYyLEVsSCmMp8vqogaDhms/iblWkZ6hGyShJMjo06PXgItdEMlQ/Na0E
	 kyVOM8ZukTJ+Q==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4dws646QkBz4wDL; Wed, 21 Jan 2026 15:43:56 +1100 (AEDT)
Date: Wed, 21 Jan 2026 13:35:34 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ayush Singh <ayush@beagleboard.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree-compiler@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree-spec@vger.kernel.org,
	Hui Pu <hui.pu@gehealthcare.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH 19/77] dtc: Introduce export symbols
Message-ID: <aXA7drNb-0lJXxMY@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
 <20260112142009.1006236-20-herve.codina@bootlin.com>
 <aWiAmjfMiKpC4sdp@zatzit>
 <20260116172735.757c1872@bootlin.com>
 <aW3GWZl8AmzsTEu0@zatzit>
 <20260119145120.724c419d@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WleWFhIMSXWjX9mx"
Content-Disposition: inline
In-Reply-To: <20260119145120.724c419d@bootlin.com>


--WleWFhIMSXWjX9mx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2026 at 02:51:20PM +0100, Herve Codina wrote:
> Hi David,
>=20
> On Mon, 19 Jan 2026 16:51:21 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Fri, Jan 16, 2026 at 05:27:35PM +0100, Herve Codina wrote:
> > > Hi David,
> > >=20
> > > On Thu, 15 Jan 2026 16:52:26 +1100
> > > David Gibson <david@gibson.dropbear.id.au> wrote:
> > >  =20
> > > > On Mon, Jan 12, 2026 at 03:19:09PM +0100, Herve Codina wrote: =20
> > > > > Export symbols allow to define a list of symbols exported at a gi=
ven
> > > > > node level. Those exported symbols can be used by an addon when t=
he
> > > > > addon is applied on the node exporting the symbols.   =20
> > > >=20
> > > > This seems to imply an addon always applies at a single node locati=
on.
> > > > I'm not sure that's a good design choice, since I don't see how it
> > > > covers the case of something that connects to several connectors. =
=20
> > >=20
> > > Apply the addon on a node that knows about those connectors. =20
> >=20
> > That seems limiting to me, because it requires the base tree to know
> > about all possible connector combinations, which I'm not sure is
> > feasible.  If I understood Geert(?)'s case properly, there are use
> > cases where a board might have, say, six "type foo" connectors, and an
> > addon board could connect to any two of those.  Of a board might have
> > 3 "type foo" and 3 "type bar" connectors and an addon board needs to
> > connect to (any) of each.  It seems much more natural to me that at
> > attach time you say
> > 	"addon foo 0 =3D> board foo 1, addon foo 1 =3D> board foo 5"
> > or	"addon foo 0 =3D> board foo 2, addon bar 0 =3D> board bar 1"
>=20
> Who can perform this mapping ?
>=20
> The user applying the addon if a tool is used such as fdtaddon for instan=
ce
> (even if this kind of mapping is not yet available in fdtaddon I proposed=
).
>=20
> Or a driver that knows about the board connectors.

Either or.  From the point of view of the design, I'm thinking of this
being specified by the "client" - that is by whatever is initiating
the application of the addon.  That could come directly from user
input, but in cases where the connectors are sufficiently probable,
something automated could also supply the information.

> This driver will apply the addon dtb and provide custom mapping between
> symbols expected by the addon (/import/) and symbols provided by the boar=
d.
>=20
> >=20
> > Rather than the board itself having to anticipate all combinations.
> >=20
> > > > > In order to perform
> > > > > its symbol resolution. Any unresolved phandle value will be resol=
ved
> > > > > using those exported symbols.
> > > > >=20
> > > > > The feature is similar to __symbols__ involved with overlay but w=
hile
> > > > > all symbols are visible with __symbols__, only specific symbols
> > > > > (exported symbols) are visible with export symbols.   =20
> > > >=20
> > > > This paragraph doesn't make sense to me.  What's a "symbol" if it's
> > > > not something in __symbols__ or export symbols? =20
> > >=20
> > > An imported symbols ?
> > >=20
> > > /import/ foo "blabla";
> > >=20
> > > from the addon point of view where this /import/ is present, 'foo' is=
 a
> > > symbol. =20
> >=20
> > I guess, but existing plugin stuff doesn't really have imported
> > symbols, so the example doesn't really illuminate the difference from
> > the status quo.
>=20
> A plugin need to know about all possible symbols available on the board
> is applied too. This is the purpose of __symbols__. This just means that =
for
> plugin all possible symbols are imported and symbol translation is not po=
ssible.
>=20
> A plugin is designed for a specific base board. It needs to know about ea=
ch
> busses and how they are wired.
>=20
> I mean a plugin references i2c5, the i2c controller number 5, and i2c5 ne=
eds
> to be present in __symbols__.
>=20
> The target property in __overlay__ identify the target node. Here also, t=
his
> is dependent on the board the plugin is applied to.
>=20
> Addons depend only on the node, describing the connector, they are applied
> to. They do not depend on the full specific board where this connector is
> available.
>=20
> Two different boards can have the same connector available and a given bo=
ard
> can have two connectors of the same family the addon can be connected to.

Ok, I think I see what you're getting at.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--WleWFhIMSXWjX9mx
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmlwO2gACgkQzQJF27ox
2GdOOQ/+ILSnO3ZrAJSJMxf5lqEnxa5NuX+W4JC56ID9CZZX4/L6YQ6fB/wHDijh
EJ7R8xizkJdTZNgjIoERa/mH3AYJpMVBHvcL4FtNV1srJV2XpIZ4XluEVsGr21As
tO/7joHwBokZyH2n2ZBMX+H29VPgvCtWyVLgwwVDHShW8vipvqKrMbTIyQlq6EoI
Ij/zQQa4hoSNaOa7RbIwl7EjwciYdQN6+V9eYs/GC0T2OGIjqx2ya5a/aOCPSAzW
C5ow31/UaxyHs1oPxdocuwIDmfC46JmMzCb1HB03lQmFp0zpXv1+2XeyJVX0E1Qd
ys6p6By19JlvXcQEvwiU+7nTHDHuJwJ9Xtb3VN47OhcD+m8Dpkh96RQwYGyr4/Ck
34sH3NJ/LoIN6aTn9/le313ZAvqDJCuDpjIrz4Dzy+0heCoptbLXhUVdyI2+9MWk
25BXeWGtVKRiSGh1wrYI8N9rc+wF92Pn2gHixfkaUrrn7UOWPzJgyTIVFelGxoKs
d7NULSXOVKhSG2yPvKvhbfO5bjC5QplutwflMaiI0EMDcBh31yaE7K+P29IWAHg4
DUaOu/AtB1fZGgNRHkke63SP/qEWU7aZA0THa9e6D7odEbtkWd6UV4VYQLW0JuxF
jOik99na7Qcn2zMnGpsEwleSeIWpBHV9ccPezO3EnJc4SFiCSb0=
=U0iQ
-----END PGP SIGNATURE-----

--WleWFhIMSXWjX9mx--
