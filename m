Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E365A281341;
	Thu, 29 Jan 2026 02:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769652048; cv=none; b=u9NVeg+HwENfyrAP9K10/vr765M+mbw+gCvwo/dE7TniOPpQPCDvegvrnkiIApk+YP/mGioDnfYtLA7lTD3dJ2mXF5dgnA46ZnajFw5kcLun/7Y8e3FnzSuKDbkvzlsUQ272bwteIEF6XpxdIBi70pLPUDCPWtw3lN94zx7FmsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769652048; c=relaxed/simple;
	bh=iokf/kpYrln8umkiUdlduCtexCVC1XLaGFAKLvBQaN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qasUdnJH4qA57ce8ZUIqC5fs531T0mwOFC4XovEZmSTCrtJ4xb/YoZ/DDMHcxfOr0ovokMlsUuJFgQiCl0DrERcs/ocCbe+2a5Dg2jdFL8dSthlqXiCf/D6Py3nHaX3ygMwMOO9OCKEIg3aj2FCZDXhNu52JA4qgY7IwvrZUTZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=rJDJSAis; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="rJDJSAis"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202512; t=1769652032;
	bh=IirDHt68D8UkDPDrXRmna4EOGz3A/+wd6rzpR4Ujdq4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rJDJSAisrtQmZ98B0SopY+5BJbaN038q31BBN7jDAngEHZKMqW7QCr1WgWKK48JKA
	 xPExcVjv4Z/s3LZJnDzk1tRovF6SyOVhCTwT4m/J8ue6KRbfJzfWNBWiK1sIfxpAnr
	 WdQFvCbGVhBD8V/iW+v6NU7Gf17fr8QIfbcKcTPE0ScPUdMYMenzB9WUrlmGn9EPcq
	 V/0Ji9k+4MIzv0Xoojazh1bqD8I7xJYrofQpQCTa6WT2xEgBVJe8f9sqOFf3TOC9gj
	 nGXCNCMpB+hk5hP5Y1zw6zzmvUUguMXWKWRqNsr+ekzFIt6V89heBCA521bNO925bB
	 2JKcDMvomj5rw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4f1j5r2F27z4wB8; Thu, 29 Jan 2026 13:00:32 +1100 (AEDT)
Date: Thu, 29 Jan 2026 12:38:06 +1100
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
Subject: Re: [RFC PATCH 40/77] dtc: Introduce dti_get_node_by_path()
Message-ID: <aXq5_uaKjksnQOJj@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
 <20260112142009.1006236-41-herve.codina@bootlin.com>
 <aWiNgZZ02-4jRc5l@zatzit>
 <20260119165244.4dc11e18@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bg6ardM+KEoZVqAq"
Content-Disposition: inline
In-Reply-To: <20260119165244.4dc11e18@bootlin.com>


--bg6ardM+KEoZVqAq
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2026 at 04:52:44PM +0100, Herve Codina wrote:
> Hi David,
>=20
> On Thu, 15 Jan 2026 17:47:29 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Mon, Jan 12, 2026 at 03:19:30PM +0100, Herve Codina wrote:
> > > The future introduction of orphan nodes for addons device-tree will l=
ead
> > > to more than one tree in the addons data. Those trees will be:
> > >   - the classical root tree starting at the root node
> > >   - trees related to orphan nodes =20
> >=20
> > This doesn't make sense to me.  The new function still just takes a
> > single path, nothing to specify which tree that path is looked up in.
> >=20
> > You can probably guarantee that labels and phandles are unique across
> > all the trees.  Not paths, though.
> >=20
>=20
> Paths can be unique across all trees. The tree needs to be indicated in t=
he
> path. Starting by '/' is the root tree.

Oh, ok.  That wasn't clear from this patch, and I must have missed it
in my cursory look at the later patches.  I had the mistaken
impression this just looked for the same path in each orphan tree.

> For orphans, I proposed "$<orphan_name>/<path>" in patch 64 introducing
> references by path for orphan nodes and so, for orphan trees.
>=20
> Best regards,
> Herv=E9
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--bg6ardM+KEoZVqAq
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAml6uf4ACgkQzQJF27ox
2GdgfRAAgqHPbdnC3QUMdnCQFgdzFOFaWowEb5CMPH/lvD1EuQPFxgUFxj7IBBTU
q5L1q1bZDe48okac66WpzNQX3lBQTkumvMolqAXF6YHFhC8S00NdNIl08Jxgqfet
anuu3sNpRNi1PFGTGFMQzV9FX8jdawG/zfdK4D/y8O8YJXLWLrMYW0WSNuJnPJc6
IJfup4lE+UN6WF/4SKddHcRKup5ChuSvdgjRJZqm38hwZZJRYtXZwVs4N11Wk+/i
h4dpt6Q2JKQIHXlUYXe6MZWRr/wILXohDWz09M1sOE09/QpZR3Mxbfvo0bNXBcVT
Pf1LxHNpHrjii/jCQUYV8q3Eh4nKl65Ue4uzIRhTfeT9vXkKVaDsQQPzgkccZAQl
px690smmvJEWGQqP7cR3P+bQi28RNSw2lOdLKaE2qrpadg7psKT3mEtGvSO7wUVA
UUhBRdVKQjN52ox7QWHyQjT1kklIEbywx6QHuVt2vebXO8TWlkU6BSE4FIN9cH8T
yS3/CKNMddps6jKDtqE61RKifptVws1GfliS0oiBaAKgqe2JANKtTxIWtyo7S6xe
Sa6RbSrnk9t5c5AW++FjUmkhO3xC3OXD+EbNaN1gDOKGqYe6n8Muxoy9goMX967F
h9qcVqkcgykPahKAWq5fFWgmtQvxNGLaO+uLKUszO77Gd0ARvw8=
=cXHW
-----END PGP SIGNATURE-----

--bg6ardM+KEoZVqAq--
