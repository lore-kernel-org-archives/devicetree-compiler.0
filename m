Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721E53B27DB;
	Wed,  9 Sep 2026 07:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788937346; cv=none; b=BJOVODovSj3gig90rDoA462ZmDyMYFn0AMuAS3il07unD2aj9nUvpx3YTZoa7ZmNWBCgZ6eetlaQ7u/3RNobGrXBSBhyCKWMLGXjQ/eH/6w4WXMxhyGVofl6a4Qqa0KAdS7vTBA9c+Z/pZUKsyWt0306JEL+St5vMBqx0K6Thd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788937346; c=relaxed/simple;
	bh=BPDWgjnO8zPPqqaSGWRZhqCzGwaTdoCgpPcw7uJvbSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L3sclC5PLyY95lRDakhAvFvhm1OXKYNl3RnwMcnI9TkDv+mPYn7KJ9hiUrKBjfmeVa/qq0mnws2SMPdKxNBPvGibNV4BQQBPNwvqocal00IrFhytYy0l8bNt7RGJbA5B/4M4SHHh8/2G5MC/7TNnbytLXaPqNMSLqRbsfJY2Ufw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=db/Z6G8b; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="db/Z6G8b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202608; t=1788937327;
	bh=8uMdpzBeDAxGsyfhJ0kdUSvzIE8STgr/5i0Idt1I/W0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=db/Z6G8bTasJul+7TXg/XEQWxRGoO47JvvvOqJO655cml11cqtod/DQ3nDrnAr8hr
	 Vd59NbZ7r//MwLcMp4yyrAHa0Rj95378l7lDSaAVnEy2ujXUhKzMFmPXIh6KoxX69E
	 Drcs2nKdnVkGUVC6xGUwsEeIb5WkUg8TIqy08TXsk5Wnlcy1F75aA5N+qEjNMruknr
	 Ah4oeefAtA+VyWmKi8udFof/IRGEe4NrQVhJuDIx4lo1s8EcZ8R/0Qnp+t5ssTD6j1
	 8JuY5OPADXt2FfIatBBG/q+Q2TInopdueUtjOzgxzAlWIYbX6ZPlTZ65dMt76tUUlI
	 o99thajKQ0tUg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4hfsDv47qmz4wKv; Wed, 09 Sep 2026 17:02:07 +1000 (AEST)
Date: Wed, 9 Sep 2026 17:02:09 +1000
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
Subject: Re: [PATCH v3 02/15] libfdt: Don't assume the root node is available
 at offset 0
Message-ID: <aqEEXIqrR8A1SPig@gractus.seuss>
References: <apOhk-NQusFgV5Sx@gractus.seuss>
 <20260831140119.1f14b420@bootlin.com>
 <apaBuQ8kn2bOzYcI@gractus.seuss>
 <20260901141826.49b1a1b7@bootlin.com>
 <apfKx_u3v3GBfzOz@gractus.seuss>
 <20260907184641.537cfa49@bootlin.com>
 <ap-t8qMg5VMwh-T9@gractus.seuss>
 <20260908100823.1f474894@bootlin.com>
 <aqD6LcbwtrZkk28m@gractus.seuss>
 <20260909085826.1f80a45b@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aaGRyrPPX6vTpRqa"
Content-Disposition: inline
In-Reply-To: <20260909085826.1f80a45b@bootlin.com>

--aaGRyrPPX6vTpRqa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2026 at 08:58:26AM +0200, Herve Codina wrote:
> Hi David,
>=20
> On Wed, 9 Sep 2026 16:18:22 +1000
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> ...
>=20
> > >=20
> > > Having a fdt_root_offset() stop at either FDT_BEGIN_NODE_REF or FDT_B=
EGIN_NODE
> > > is "fdt_first_node_offset()". =20
> >=20
> > > Let me introduce the internal fdt_first_node_offset_()
> > > - fdt_root_offset()
> > >   It calls fdt_first_node_offset_() and check that this node is a
> > >   FDT_BEGIN_NODE node.
> > >=20
> > > - fdt_check_node_offset_()
> > >   if the offset =3D=3D 0, it updates the value with the offset return=
ed by
> > >   fdt_first_node_offset_() =20
> >=20
> > Right, that's exactly what I'd suggest.
> >=20
> > A possible tweak would be to have fdt_check_node_offset_() only apply
> > special case 0 handling if the _actual_ offset 0 doesn't look like a
> > valid node offset.  Not sure if that will make things messier or
> > cleaner.
> >=20
> > > And so, a node offset 0 doesn't means the root node but the first node
> > > in the dtb (root or orphan). I am totally fine with this definition. =
=20
> >=20
> > Right.  If you don't want that behaviour for addon dtbs, then I think
> > the way to go would be to explicitly avoid all special case handling
> > of 0 if the header flags an addon.  Handling addons requires new code,
> > so we don't have to maintain backwards compatibliity for things that
> > used 0 assuming it meant root node.
> >=20
> > > At some point, maybe users of the API (when addon are involved) will =
have to
> > > take care of that and perform something like:
> > >   root =3D fdt_root_offset();
> > >   fdt_get_property(fdt, root, "prop", NULL);
> > >=20
> > > Or
> > >   fdt_for_each_orphan(orphan, fdt) {
> > >      fdt_get_property(fdt, orphan, "prop", NULL);
> > >      ...
> > >   }
> > >=20
> > > Here also, I am totally fine with that an I already use this kind of =
sequence
> > > in libfdt/fdt_addon.c to apply an addon on a base dtb.
> > >=20
> > > I will introduce fdt_first_node_offset_() but let me know if you pref=
er
> > > having fdt_first_node_offset_() introduced right now in this "structu=
re
> > > tags" series or later in the addon series. =20
> >=20
> > Either is fine; do whichever results in less code churn.
> >=20
>=20
> Ok, I will do that.
>=20
> Do you want to have an early version of that or having it in the
> next iteration of the series is fine on you side ?

Early is good.  Smaller series are easier to review, and getting them
fully sorted and merged also makes things easier.

> Of course, before sending a new iteration of the series, I am
> waiting for your feedback on the "structured tags" part. This part
> is not going to be impacted by the "offset 0 vs real root offset" we
> have discussed here and so what is available in this current series
> is still valid.

Right, the root offset stuff stands on its own, so it can sensibly be
split off.  Splitting series in such a way that they don't have enough
context to understand the wouldn't be helpful, of course.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--aaGRyrPPX6vTpRqa
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmqhBG0ACgkQzQJF27ox
2GdAhxAAmUTRK+7unAY3mlQ0Und+Vaw2czThNx//HwDrom0KCpw5N+wemduAbX4S
OxzX1Ieg0sgDledagPlvmemweqPVmonzKQ4SDTM7p1DbrtFzLEbypecR2TMbW90f
GdfRxbA8g9U7A/GyIY7bzRkm8BJWzMSmmu8ommajL4uxqzkRhfHQHCBMoNtImdc6
y1rHxv8OcaCnbtOz7360gFtVCaH1SY5cOBWyh0fAqwUCJxgccrsitxgknfGCcVpP
5rQJavcSh3CqpFtwxkj3yBd8H6qMjhDZkF2M5hGIbAkxX+T6yBrbXNW0SvJq2I0Q
UoLRZtceZ7cm9XvqnsnC3nLbPlY02zB87STE27qNhFA7g7wW/KvWxlH7QnyUFir7
hpi0TEtQYm9XaucGcGKxHDOI3p/b/sHIcHyEVtqYLaz0uj9RzdImq6XWSVUbfg2l
UiMdF2uW9FcWJKp2BRVQeNhG4W7olBTDpqLe/KhSrP+BjYRgH29XhD06SodsXqTB
L5UQiwykLLn0xxm5jHgl8H0QCjn7xQ6zZ4jyImyaPltAfRbOd8tA+UqqLaEOYG4Z
1Dg/R+fcZMy3pSTuQb9CqdW3X1xjgkpJ6hEZ6CWJcd9lW6v6TyC+BFkmko4qHEZ5
mabKGP7/tpn2wlGnAUq4NBbUlX1DQLusBKD4/lJuCwxctTZ5qt0=
=WzsM
-----END PGP SIGNATURE-----

--aaGRyrPPX6vTpRqa--
