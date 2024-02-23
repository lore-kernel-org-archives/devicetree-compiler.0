Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE1C13AF3
	for <devicetree-compiler@vger.kernel.org>; Fri, 23 Feb 2024 07:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708674832; cv=none; b=jq/4AXxtoBvHQ3H5xnmo54YYsGB0yys7e3whm+xfM07rOQZwT2dbLTzz9VkkTeNMLM4ZPHFeXIKALA7ZE8yWhtYRj5yyIRhnJhnZrNJNBxYCRc878UsjsEqd1fnBBA6Ho56KqCLvmS1u2l5TPTaH7VlGbex5m/vGepGeJ/Cg6kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708674832; c=relaxed/simple;
	bh=xr0Gv2iajeW8X4GqaxhqyG0ZjfARooKt/fWAshaJV9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jDWPfu9vstavU3OfhPR270L8vbspCOpawpxYeQIZt0Vd7huBrgt2K0s4Z+uYDCLN0S2k0mNd6lVYnZB1d14ALHcOokroQkVTEREUzznOhJBN/4SDYuFma1ZGy96Jtg0N6BSuG6U/w9bRGbLhYMoUwy6k7hNQLfDSNcjVR7JaF1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rdQNH-00033k-BO; Fri, 23 Feb 2024 08:53:39 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rdQNG-002Nkw-3L; Fri, 23 Feb 2024 08:53:38 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rdQNG-00A7RJ-02;
	Fri, 23 Feb 2024 08:53:38 +0100
Date: Fri, 23 Feb 2024 08:53:37 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Yves-Alexis Perez <corsac@debian.org>, 
	devicetree-compiler@vger.kernel.org, entwicklung@pengutronix.de
Subject: Re: [PATCH v2] libfdt: overlay: ensure that existing phandles are
 not overwritten
Message-ID: <sdlw3yyquseg2a6muznsll25x2z2thks4jyq3pjh5anliuctkz@ozehzhgk5b4x>
References: <20240216181919.1648843-2-u.kleine-koenig@pengutronix.de>
 <ZdbqaoTUfBmSlC98@zatzit>
 <oitc63fe3agrg2vwgml6x652uo4dqst3m6kbaiu4rs3sbqnco4@rylqo655o4m5>
 <ZdgiBAEvvr731H7c@zatzit>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ce3wqqgbxse3mirx"
Content-Disposition: inline
In-Reply-To: <ZdgiBAEvvr731H7c@zatzit>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree-compiler@vger.kernel.org


--ce3wqqgbxse3mirx
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 23, 2024 at 03:41:40PM +1100, David Gibson wrote:
> On Thu, Feb 22, 2024 at 10:38:54AM +0100, Uwe Kleine-K=F6nig wrote:
> > On Thu, Feb 22, 2024 at 05:32:10PM +1100, David Gibson wrote:
> > > And here you can use fdt32_st() on (tree_val + poffset), avoiding
> > > quite some complexity.
> >=20
> > There is some complexity because tree_val is a const char * (as this is
> > what fdt_getprop() returns) and fdt32_st() obviously doens't take a
> > const pointer.
>=20
> Ah, right.  You can use fdt_getprop_w() to get a writable pointer
> instead.  If there was a way to have fdt_getprop() return a const
> pointer only if the fdt pointer it was given was const, I'd do that.

Look at how container_of_const() is defined in the kernel[1], this
requires C11 though. See
https://en.cppreference.com/w/c/language/generic for some docs.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/include/linux/container_of.h?h=3Dv6.7#n32
=20
> > If you want to play around with that, the code is mostly a copy of
> > overlay_update_local_node_references() which could benefit from your
> > suggestions in the same way.
>=20
> That's quite plausible.
>=20
> > Can I lure you in improving overlay_update_local_node_references()? Then
>=20
> Fair point..
>=20
> https://github.com/dgibson/dtc/commit/24f60011fd43683d8e3916435c4c726e9ba=
ac9c9

I gave feedback on that one. Looks good.

> > I could copy from the improved function for my patch. (Or maybe refactor
> > the function to take a function as parameter which is
>=20
> Eh... I'd prefer to avoid higher order functions in something this low
> level.

OK.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ce3wqqgbxse3mirx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmXYTwEACgkQj4D7WH0S
/k4cywf+OeRfn2VmlXr3uP8T/FZC9Z0LX6RkQAfyVn1PYJLuBHwXX8gJ+nvceQ8a
sw2nfnmK7OEP+AjIjkO97ZtB9NNPSzNgeZOx1NXOlYasEdH18raeqDO9fIoZPGv8
TckERDtM18x8g6m4uICjUJhj8tc9B45ipHq+yQJYAdd593/j8Ld74A886Cr36NwU
5e2sSpyyB49watyzsGC9eAZ3F2OXjYzN/YzvKSR85vPhsCnHZGsXB3a156JKbpWE
ciRbMzQbA3pDqcs2ZKzqj8Wz6ItgceNRuyKEN9st6PllGJ8wcW2KjQ1A10pq9Fu0
yVswtpH7/UwNpz7BckSfAHu14FXCCQ==
=o8w+
-----END PGP SIGNATURE-----

--ce3wqqgbxse3mirx--
