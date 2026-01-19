Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB650218592;
	Mon, 19 Jan 2026 05:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768801901; cv=none; b=Grfde3jo6Hd7d9IE6rbv2PwRFG8hctHr+4QujYRrfKHFGoEGEipR4t0WHRlERV8qMip57DA5vkCE/Eyt8YTXA5B8+bswI4vnW23iXz7fY6nmVT8oCJ6z0OAnJY498SIJZrtxusKirHA4jwF/ZAso8DuCU4nqaD5VLym8KeCsbvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768801901; c=relaxed/simple;
	bh=5OENN1RFmjsD91uo2mIOZnWeknKiyFvLp226WXqRRjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TUb0lEaEvXK26mUOOXP9TA3TBQlJ9PXQnIsSd0h2VeiS+q6V5/muwfVPTyxxaF/ygEiTfF31K3v3sysLVL1dJf5wcZr99tfJQxRriMoOWpHe7G5z/ZrDN469QgYhJ2NXi79GKRFDS6K+I2LlvG2XML3JAQ2SnOEpcMeDoYodmh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=PvKQam7L; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="PvKQam7L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202512; t=1768801898;
	bh=pSAhOoOa7V6KiKam3BAJOWjtd263iikNVq0pApR10pk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PvKQam7LVhMIHlssAzlxgwvfz91ToNc4CZkEwsnMCocuXV+iYzWWI+bT563Ys3QFh
	 QrsssjJ2i7oBfhDYKBCALvz5ha63qkKwsg1QC69pXxoiCbqg9b0VObdoj+VHfykyuV
	 ZVRaJbsjeKfQE6CBYuXTMUP+/sSbw33ze/yMiXDqwyjx+cNMVLoH9xPQIp3nOLROmq
	 t7gagavT9TsFjc1c5KzsO55CUfNiQLb0onJyDoLJ+yKjNx/z3asLyyaUFItukskip9
	 VFyxZjEooxOCvrak5z/2ziNsOaZNFa9lFQRh8Vv4m/QLCR5NuZNxcbIckT8th9ZURE
	 FpGyw7w2FAHVQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4dvfj61GmRz4wC3; Mon, 19 Jan 2026 16:51:38 +1100 (AEDT)
Date: Mon, 19 Jan 2026 16:51:21 +1100
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
Message-ID: <aW3GWZl8AmzsTEu0@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
 <20260112142009.1006236-20-herve.codina@bootlin.com>
 <aWiAmjfMiKpC4sdp@zatzit>
 <20260116172735.757c1872@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tTGR4CRRVo/9gRO5"
Content-Disposition: inline
In-Reply-To: <20260116172735.757c1872@bootlin.com>


--tTGR4CRRVo/9gRO5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 16, 2026 at 05:27:35PM +0100, Herve Codina wrote:
> Hi David,
>=20
> On Thu, 15 Jan 2026 16:52:26 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Mon, Jan 12, 2026 at 03:19:09PM +0100, Herve Codina wrote:
> > > Export symbols allow to define a list of symbols exported at a given
> > > node level. Those exported symbols can be used by an addon when the
> > > addon is applied on the node exporting the symbols. =20
> >=20
> > This seems to imply an addon always applies at a single node location.
> > I'm not sure that's a good design choice, since I don't see how it
> > covers the case of something that connects to several connectors.
>=20
> Apply the addon on a node that knows about those connectors.

That seems limiting to me, because it requires the base tree to know
about all possible connector combinations, which I'm not sure is
feasible.  If I understood Geert(?)'s case properly, there are use
cases where a board might have, say, six "type foo" connectors, and an
addon board could connect to any two of those.  Of a board might have
3 "type foo" and 3 "type bar" connectors and an addon board needs to
connect to (any) of each.  It seems much more natural to me that at
attach time you say
	"addon foo 0 =3D> board foo 1, addon foo 1 =3D> board foo 5"
or	"addon foo 0 =3D> board foo 2, addon bar 0 =3D> board bar 1"

Rather than the board itself having to anticipate all combinations.

> > > In order to perform
> > > its symbol resolution. Any unresolved phandle value will be resolved
> > > using those exported symbols.
> > >=20
> > > The feature is similar to __symbols__ involved with overlay but while
> > > all symbols are visible with __symbols__, only specific symbols
> > > (exported symbols) are visible with export symbols. =20
> >=20
> > This paragraph doesn't make sense to me.  What's a "symbol" if it's
> > not something in __symbols__ or export symbols?
>=20
> An imported symbols ?
>=20
> /import/ foo "blabla";
>=20
> from the addon point of view where this /import/ is present, 'foo' is a
> symbol.

I guess, but existing plugin stuff doesn't really have imported
symbols, so the example doesn't really illuminate the difference from
the status quo.

> > > Also an exported symbol has a specific name and this name has to
> > > used for symbol resolution. Having this specific name allows to:
> > >=20
> > >   - Have several nodes providing the same exported symbols
> > >     name but each of them pointing to different nodes. =20
> >=20
> > That's not a property of having a specific name, that's a property of
> > being local to a node.
>=20
> Yes, exactly. I will reword.
>=20
> Best regards,
> Herv=E9
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--tTGR4CRRVo/9gRO5
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmltxlgACgkQzQJF27ox
2GcHVA//RocgnbFaeLa/0uj7k+L+DU6kFhVse9BwrqNcnny2da/GhLnogcoM1Y4g
vF4obx/65Gd9DpJVFvK4IdLv6Qk2ZXZh5XWSrYKalpzDRTUuMZ372qxugcJufLg9
2K6UUb6lzxic0WAK0lYbPaHCQP7BuurR6tnXtqHFrLIb5QIdthOAoveZJofzDR4I
idRLGSxX/6GP1z2PmE2pvEQ1Z3IlFjVKJuFkmux0NVji+87HsTN5a5lKf7Igmxsc
pQGdA83tjTVNliBd3RwPc+dT3099Udh7GiBCjR9p/l7iz86Nf1XDFU29B+o34trd
QnDVQcvpM/DD7vtyuG1vCBQMLGzyDcIS+xA0YcVGRoHaOL7QP4OQfwLgAKxrIdzf
eXvUYem0J8yP43HYQJV9YydV3vJ1wrchXRb+Yj6dYSDpQAIHCg68b8gT4xxTyatz
pXaiMAkup6rNWlNdO3jhDlS/3lKf5AK0K1Dy9ld9pZ9wdI9QKMGMMChzxRbFbCHE
/jpqpPjQFN12exEw5qrUPYBBBgBSBuK1L/jV42Yx0XJq62Rf6D5QdAdMudMcK93Q
bV5Ko3nPYA8O4xoK03Ka+k7e1yQvWk+cdE/8Z1A1yspMAzhkjEAkSqzUZXD1udHa
VpMPraBQ/QU8vAU50YClY4agMvsdlTzZLkJKiRfWYdR21VsQZdU=
=yYcK
-----END PGP SIGNATURE-----

--tTGR4CRRVo/9gRO5--
