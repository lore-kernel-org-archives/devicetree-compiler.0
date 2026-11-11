Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794370603;
	b=Ku66RIOTfI2gloniFMVCL4tADVlJDAt7VZPxCT4o/8CgCg2RYspy81AUcWLUp/zF6u9z
	 W/t5EqiZdjjnzIXP3lYyC2yLZd7Hdar2eQwvx9WKZlI6dz0Wa0EO0jJq3mBN5lMsC5Jse
	 4+pvmD85QEjDdZuBfpQJIIX4vcnB192JCNPQqzLiW7U+aAx5XqPPDCNPyX1pEiZvK7O5O
	 ScGEVJUE5UNhH9Lu4ZMp3sxwLfknGvXH7w7CSPwJISyD+Pt7j3u1CZCKM/RbZOOryYcdC
	 YxchmETemo+H+PZPw37ysr/hTCwr/K20JL9KuR6eD+YFyzSjClSET6nE73jNyYVQ1Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794370603;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=29/3hj62YicK01getbyaxwhcOnmnhRtVYk0AEEhj6+c=;
	b=1GbQ4cNz57xBSOcCDYdFTp/jyI0n11+AyyvLU5mHNEgyQVUzBZaAArW1xkUcvqnDZ8Wl
	 mTJesx/2hFUsahIFrK/wTQPRKUBv7k88o0EORPRBudECRUvNc07OQftKo2twruZDuxRT+
	 1fnEqrq5NvB7sS7zkbbkEnVh70+oCbCTqIsym3Z0svS71INd04Z4W5DosNj+R0LEPLpSX
	 pf0S1Yn26Ek3/cuHbIH1XfYMFqXbIDLzuydbkzjIpy8en78i8mw92FXs+ruq+To+IX+5X
	 fn+Pch7Q9Pj8/omKwA6YimWpYhFHILF8g4mhKoxfu/uxWU4sU51LHDJA01Of61k1awg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=EPtZsRJN;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B239F60A2601
	for <devicetree-compiler@vger.kernel.org>; Wed, 11 Nov 2026 04:16:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B239F60A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=EPtZsRJN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1794370599;
	bh=29/3hj62YicK01getbyaxwhcOnmnhRtVYk0AEEhj6+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EPtZsRJNY1JWEoQfIL9gPM/uqtqpOeZaw03nfgYkHgFgMWZ9J3tDk0fYuivHIBn8f
	 TvWJkGErOiIFO4L+J818I8loR6+AgH6ykXN2jUQrfLreuczqyolk5yDUsJIluBFrJn
	 YN6xP8leyzJUAGwX81xj9xXwutosxdcJRZV7bo4ZoIdgMmTWJTMzC34fMz1AGu45ag
	 DCZe698sgo/igVFzGJzL+khk1NT67KGu+GNUbAf3234s47Zy9hsKrM5ppPmd1HDnMh
	 qus0ipkM2S+UkIdyx7DDgluljNT7RkarNwtQPwAyFTrZQFgGIuGIddaLf4BEow54zg
	 WlwLtNUE91KXw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jPVZv5XgCz4wTK; Wed, 11 Nov 2026 15:16:39 +1100 (AEDT)
Date: Wed, 11 Nov 2026 13:59:37 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Simon Glass <sjg@chromium.org>,
	Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Subject: Re: [PATCH 13/13] dtc: Merge the fragments of a dts file in main()
Message-ID: <avPaGBHzjhl23xSG@gractus.seuss>
References: <20261101163721.2458982-1-sjg@chromium.org>
 <20261101163721.2458982-14-sjg@chromium.org>
 <20261103180803.416e25c7@bootlin.com>
 <aurV_EO8OpYad26x@gractus.seuss>
 <20261104094055.2ca24664@bootlin.com>
 <aur_KYarRUgenElv@gractus.seuss>
 <20261104142318.5af52bff@bootlin.com>
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dMxJ6YK75iGifSdi"
Content-Disposition: inline
In-Reply-To: <20261104142318.5af52bff@bootlin.com>

--dMxJ6YK75iGifSdi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 04, 2026 at 02:23:18PM +0100, Herve Codina wrote:
> Hi David,
>=20
> On Wed, 4 Nov 2026 20:47:45 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Wed, Nov 04, 2026 at 09:40:55AM +0100, Herve Codina wrote:
> > > Hi David,
> > >=20
> > > On Wed, 4 Nov 2026 17:51:41 +1100
> > > David Gibson <david@gibson.dropbear.id.au> wrote:
> > >  =20
> > > > On Tue, Nov 03, 2026 at 06:08:03PM +0100, Herve Codina wrote: =20
> > > > > On Sun,  1 Nov 2026 09:37:07 -0700
> > > > > Simon Glass <sjg@chromium.org> wrote:
> > > > >    =20
> > > > > > We would like to run checks on each fragment of a dts file befo=
re it is
> > > > > > merged, but that requires dt_from_source() to return the fragme=
nts
> > > > > > unmerged, so that main() can decide what to do with them. At pr=
esent
> > > > > > they are merged at the end of the parse.   =20
> > > > >=20
> > > > > Why running checks on each fragment instead of the dt where fragm=
ents are
> > > > > merged ?   =20
> > > >=20
> > > > This is part of the aim of the series.  Some checks make sense on an
> > > > individual fragment, others don't.  Allowing both kinds lets us
> > > > address several longstanding problems.
> > > >  =20
> > >=20
> > > To clarify this point, what kind of checks for individual fragment? =
=20
> >=20
> > As many as we can, eventually.  Anything that doesn't rely on whole
> > tree context is a candidate.  This means
> >   a) they'll be checked sensibly for dtbo output where we don't have
> >      all the information to perform checks that rely on the broader
> >      tree context
> >   b) they'll catch logically incorrect things, even if they're later
> >      overwritten by something
> >=20
> > Initially the most important ones to run before merge are the
> > structural ones like duplicate_*_names, node_name_not_empty,
> > node_name_format.  The duplicate ones in particular means we enable
> > consistent behaviour w.r.t. overwriting nodes between the first
> > fragment and later fragments in the file.
> >=20
> >=20
> > In fact, thinking about it, before the merge should eventually be the
> > default place to run tests.  So the question is more, which checks
> > should be deferred until after the merge (and therefore not be run at
> > all for dtbo output).  Obviously anything that needs to look up an
> > absolute path has to go after the merge.  Things that look up phanles
> > are a tricky intermediate case.  Potentially those can work before
> > merge, but only if they search for labels rather than actual phandles.
> >=20
> > > What kind of longstanding problems? =20
> >=20
> > The biggest one, that I'm hoping this series will address is the fact
> > that we don't have consistent behaviour if a node or property name is
> > repeated between the first fragment (it generates a check failure) and
> > later fragments (it silently overwrites).  But there have also been
> > various reports about false positives from checks when they run on
> > /plugin/ files, because the partial tree just doesn't have the
> > information needed to properly complete the check.  Having different
> > sets of checks before and after merge is the clearerst way I can see
> > to properly handle those false positives, while still checking as much
> > as we can for a dtbo.
> > =20
> > > Can you give me details about them?
> > >=20
> > > Maybe I've faced some of them in the support for addons implementatio=
n. =20
> >=20
> > That's possible, yes.  Or you might yet face them in addons.
> >=20
>=20
> Hum, I see. I think the problem is not before / after merge for checks but
> with / without orphans.

I don't realy see the distinction you're making.

For some of the things I have in mind, I really do want to check
things before merge, even if there won't be orphans in the end.
Specifically the duplicate name a valid name checks will be more
thorough checks of the source if performed before merge.

> In a dts, we can have:
> --- 8< ---
> / {
> 	node: node-a {>
 		prop1;
> 	};
> };
>=20
> &node {
> 	prop2;
> 	subnode: subnode {
> 		prop1;
> 	}
> };
>=20
> &node {
> 	prop3;
> }
>=20
> &subnode {
> 	prop2;
> };
> --- 8< --
>=20
> In the end no orphans are present. Everything is merged in the root node.
>=20
> In a dtso we can have:
> --- 8< ---
> &node {
> 	prop2;
> 	subnode: subnode {
> 		prop1;
> 	}
> };
>=20
> &node {
> 	prop3;
> }
>=20
> &subnode {
> 	prop2;
> };
> --- 8< ---
>=20
> In this case, everything is merged to the orphan node &node.
> This merged orphan node has to be checked.
>=20
> I make a distinction between merge and format conversion performed for or=
phan
> handling in dtso.

Yes, absolutely, I see the /fragment@XXX/__overlay__ encoding as a
separate and later step from the merge pass.

> For dtso, the orphan node &node will be converted (format conversion) to
> --- 8< ---
> / {
> 	fragment@0 {
> 		target =3D <&node>;
> 		__overlay__ {
> 			...
> 		};
> 	};
>=20
> 	__fixup__ {
> 		node =3D "/fragment@0:target:0";
> 	};
> };
> --- 8< ---
>=20
> Best regards,
> Herv=E9
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--dMxJ6YK75iGifSdi
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrz2hgACgkQzQJF27ox
2GfmQw/+KDyZ4Kv3lC2TbQjLss47g5uPJikSPPATRlMFr69kzrq68tc1AhbQZvcz
J73UX/lg1nWgB8IkRoA7aySgZBWSdgmRXHTDKjmeLM5olMaPjmBfv4ItxBZgNnbD
XsW+HOg2bVBXCdP7bGEwUz7NuLzfmomfcmvBMBMXdhT3KWxLsHNX6TJ9ao2srdiL
JJQbpB1d1RmQEganDyh3gbdjnKJL4VsfiK2Zf3hBZdFMU94Zq4ltpzKMHxAmxL1E
o7FkrPqDt30qxbi1th3GWyvTjGX3r/ghzCWA8oWr4C8TgCJfSvNZRQ88ykGNd2qz
gbFtiZl34GwxJJewlS0IZqv6rTcrPexYBx+3IqUkRgG+Z4JMeWYWzeqVtfpM0kcY
ZMo6iPMwJHD/95ETpLMyB9CoEwOn9AgdiM8I0PaIcKNOJ/8XpCHJoFhcj2kWvmml
Ph311kRznFf6KFTg/7bjY2S28a82l87hib715sfQQexA4C9Y7e9NJBUTvcxAVDHF
hl7O6M1eyXN4aAfQ2tqOwCAlCG0Wl/kpsmlnf9D3gBoSOC3vjslVhNpXYVP/TtNH
frSRYIojq9G9mw7s1FQw/HGGJtrZ031aUXU4IDAiDU2dYbjD/Y10m47Pm9imTDFp
BswI6tQtrNRaqPI3TazeAuJov18+HPzVf6QV32NaMYMM7RIohQ4=
=wcuR
-----END PGP SIGNATURE-----

--dMxJ6YK75iGifSdi--
