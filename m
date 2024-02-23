Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1B411CB3
	for <devicetree-compiler@vger.kernel.org>; Fri, 23 Feb 2024 08:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708676183; cv=none; b=g5kgAFnrtz6HnTxLKLd6ABgXZ0r/48tFVTbdNMzTqm0HqBMdDyjbjhO+x7iwHDI3n2YDdwHKOUkj6r6RCzxnj9hoYIVrEbFnLEni15LMi9sutt6Zv8XIJbNJiwn3ZtojWF1k6lm1j2GqOFHfBpUcVePuMO8c9c2Ra2DKIWxV8hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708676183; c=relaxed/simple;
	bh=AbUCPfEejED/rBDY9MnXYTdNHJ7lQz4MquExwzeJlk8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IKJGKU4rSsGImOpMTMLi1L/uiLhFSbIePPChMxpkfBkqa4PH7T3+Gp5SBzaU+zLfbNqDYq8UAl9ebkBT4UmJToNRIoengOmhjM6cfBo55P0/srg1QtPDkU4yC/1GDMUYjMicTYQQ4B9TS4H6rmdWMDXQivW/ncbsNT97dmCHfi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=Zbqa4Wbi; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="Zbqa4Wbi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202312; t=1708676176;
	bh=XMi9scpOpo1m7Kgkf+vwlNFpl6L10+1AY7grI33Qgdc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zbqa4WbiCBFWeCW0t55dIyw0Spyg3ClSdme0jYlDi3NXVSWOLQtpBQniCuIeYeu63
	 RwLVVWBoy0D9njA+vQ0vgsC0bZyY2GeSvBH8pTM88MjGv8b3y2M180ad17OEPnGZ9I
	 0Tjp532FizivEuSsJaC/IXMT+XpGyvZ7nTurmTpYpkzMJn5rqQnKFbe36Bhg1bSxzK
	 T4qFHvUjHUAoeMKb5H14NYfSizrZox9KIZJWQFG35yDojluh+np/XJ+hC3I7tzGhmS
	 5aaJHZPUBlj+OHIu6Wq0PQ7b1IBurAN3Yb5Irm5iRbKZ+7FsTI5I+v1oeINUCRmRmx
	 6+fRgl8NPTafQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4Th2sD5m3kz4wcl; Fri, 23 Feb 2024 19:16:16 +1100 (AEDT)
Date: Fri, 23 Feb 2024 19:15:40 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Yves-Alexis Perez <corsac@debian.org>,
	devicetree-compiler@vger.kernel.org, entwicklung@pengutronix.de
Subject: Re: [PATCH v2] libfdt: overlay: ensure that existing phandles are
 not overwritten
Message-ID: <ZdhULACva9hAAwy3@zatzit>
References: <20240216181919.1648843-2-u.kleine-koenig@pengutronix.de>
 <ZdbqaoTUfBmSlC98@zatzit>
 <oitc63fe3agrg2vwgml6x652uo4dqst3m6kbaiu4rs3sbqnco4@rylqo655o4m5>
 <ZdgiBAEvvr731H7c@zatzit>
 <sdlw3yyquseg2a6muznsll25x2z2thks4jyq3pjh5anliuctkz@ozehzhgk5b4x>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cJviFIU2sGgEuCEL"
Content-Disposition: inline
In-Reply-To: <sdlw3yyquseg2a6muznsll25x2z2thks4jyq3pjh5anliuctkz@ozehzhgk5b4x>


--cJviFIU2sGgEuCEL
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 23, 2024 at 08:53:37AM +0100, Uwe Kleine-K=F6nig wrote:
> On Fri, Feb 23, 2024 at 03:41:40PM +1100, David Gibson wrote:
> > On Thu, Feb 22, 2024 at 10:38:54AM +0100, Uwe Kleine-K=F6nig wrote:
> > > On Thu, Feb 22, 2024 at 05:32:10PM +1100, David Gibson wrote:
> > > > And here you can use fdt32_st() on (tree_val + poffset), avoiding
> > > > quite some complexity.
> > >=20
> > > There is some complexity because tree_val is a const char * (as this =
is
> > > what fdt_getprop() returns) and fdt32_st() obviously doens't take a
> > > const pointer.
> >=20
> > Ah, right.  You can use fdt_getprop_w() to get a writable pointer
> > instead.  If there was a way to have fdt_getprop() return a const
> > pointer only if the fdt pointer it was given was const, I'd do that.
>=20
> Look at how container_of_const() is defined in the kernel[1], this
> requires C11 though. See

Right.  Just like we avoid allocations to allow libfdt to be used in
constrained environments like bootloaders, we're also very
conservative with which compiler features we want to rely on.

> https://en.cppreference.com/w/c/language/generic for some docs.
>=20
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/include/linux/container_of.h?h=3Dv6.7#n32
> =20
> > > If you want to play around with that, the code is mostly a copy of
> > > overlay_update_local_node_references() which could benefit from your
> > > suggestions in the same way.
> >=20
> > That's quite plausible.
> >=20
> > > Can I lure you in improving overlay_update_local_node_references()? T=
hen
> >=20
> > Fair point..
> >=20
> > https://github.com/dgibson/dtc/commit/24f60011fd43683d8e3916435c4c726e9=
baac9c9
>=20
> I gave feedback on that one. Looks good.
>=20
> > > I could copy from the improved function for my patch. (Or maybe refac=
tor
> > > the function to take a function as parameter which is
> >=20
> > Eh... I'd prefer to avoid higher order functions in something this low
> > level.
>=20
> OK.

To elaborate here, I can also image certain platform + environment +
compiler combinations where indirect calls don't work properly in an
early boot environment.  They should, of course, but you'd be
astonished how many messed up things I've seen in firmwares.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--cJviFIU2sGgEuCEL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmXYVCEACgkQzQJF27ox
2GfZPw//W/HbHlXmICSxs6g/JDPMfrML5HVTF1NndZ2STjJPMEpWLacityMHYTw2
zOqYyBkd01sOW7sRPReT9blWbfJo+p4zGdFRmIPptNzZBwaSUZ2pfy2ee3Bt8gsv
R6QGAZ5udVMt5SF+r+EI13tR6wsX9lRaDJljGc8uEXiT5sr9uePOaU+hpaU1ORay
kLXxk9iFWeXlWACkQ6YqGvtSv5EThSbJMSFsf6f3zjzZSyeN85PKs9LwZ2VijIHb
vhJBD6EQ9ebF67L2TmXu7zxOS7eRCpeTFeeoM3N9QHNGTN98Vy6ft4WvlhYW0liZ
kSFjm2DvKlGelasiN6moBMSUu35GrN9ShtWHmcA6tsCep6NYRvCX47XWR6GlmYXM
x1C5yMtM++RpueIDWj7Tq11urninFUpJqdMSlpPd7tSzsnmuJVR1wJ1/ZznNc2my
woyH+Sqa311sMeolLrFWDkt5ptd6zvars+Vln5kRQqfjX7ikfVPZZ9Nf/MtjKLTW
FGmaXc8Hvw0sXgtvkCCWYkgECDOU8byctN0Aibzq/8PGQ++CRuF9LDZZ+ZMPstsa
4uTVt+qPubsTKtNlAnRX5jAPguCxZ3HZR0DvakrgwpRgZKeO50sLMKXOpeomheBX
uxOyJlQNzoeFR+x3Qtpgl08aDR3BGBfBJJ62MfVyf+lVw2anAMA=
=8qZ2
-----END PGP SIGNATURE-----

--cJviFIU2sGgEuCEL--
