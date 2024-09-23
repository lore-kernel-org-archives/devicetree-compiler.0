Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6728479
	for <devicetree-compiler@vger.kernel.org>; Mon, 23 Sep 2024 09:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727084928; cv=none; b=fzQH/0OWVpfd9FBcpEhOBa8MMvJKq2WiKtLL4Yt+GOC9b7AYppS3C5ZBNjFy3TsIauHwsnovqBI0Eu5KfYxRLXIRDP1GNpj658rgqeBs6OMbNBVpT2Waj07xf/YfSG+pVANzoyON8bvo4Hk9B8lT12j+82VHm+iv87Dt0iaE7Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727084928; c=relaxed/simple;
	bh=L+7E7FCkVKnSqOzZzfCIr6m+2kiP/6FuWamdskIuf78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UWoZarQfkHk3kMitIBfoXDJZtaebRuJaMAIAY1plromdQq0WTklWCMC2rvIeeUOS2vzEa7OwLs6NRfJuw7UqQ5IFs67m4qVjXdEQFMsUgO0NSluBHFNiGleXYBAu+2oJnV9IfKxan+yBjxJjpcAV+CaC5hvMM5TXgvYmULcjxOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=XUmJOfiJ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="XUmJOfiJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202408; t=1727084916;
	bh=iklZH1HqKPGwfbawHXypDFTLFTbcMxSCPs/xx0hayTI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XUmJOfiJi99KQQPO4add1xh4K8znZnkZLBLHUfzqrsgnWw/Y3our/w31NTbeCJ4+u
	 LSWGxsjSI3e2Fk4bu5TXACEfGwYGnYwN3RjkXw+kND+4CvnbpPJmEyF+wScRlCXI9E
	 6zSBpW5bIyGJc1G3UdDox9nhAX9Jt40SzPxWJz7oKvOYu5PRWVEyzK28RH/22kNuQT
	 AmZQYXTD5l21Ylccy9Kp8EcRXWBqvrtWsD0tbNLpAwIroXgCAsGymyp+p88Guu4qIG
	 djuCSczHUPpvwezza2PcdsrzsZPpAe6W0Q7eDrJSi5EX69e8PF3ScbQEVjI0EGebKr
	 VYErONgShymEA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4XByqS2QrYz4wcr; Mon, 23 Sep 2024 19:48:36 +1000 (AEST)
Date: Mon, 23 Sep 2024 19:48:26 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Ayush Singh <ayush@beagleboard.org>, d-gole@ti.com,
	lorforlinux@beagleboard.org, jkridner@beagleboard.org,
	robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com,
	Andrew Davis <afd@ti.com>, Robert Nelson <robertcnelson@gmail.com>,
	devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH 1/2] libfdt: overlay: Allow resolving phandle symbols
Message-ID: <ZvE5atmdWXhGwLdQ@zatzit.fritz.box>
References: <Zt6Bog4Fqcb89ivO@zatzit.fritz.box>
 <3f062731-5819-4fb3-bf97-5748be63eb17@beagleboard.org>
 <ZuJiRfTWm8f8YfZ7@zatzit.fritz.box>
 <71d8be80-8dd0-470b-9881-414c13746eb1@beagleboard.org>
 <Zuo8yWrRPGcqnEwN@zatzit.fritz.box>
 <705b181e-2242-431f-bb6f-c00e178aa602@beagleboard.org>
 <ZvDjW7W1096FW8XL@zatzit.fritz.box>
 <CAMuHMdXG32pj=nO9iGTD69QSLY7p9BoASqnMi87LBmBuQg0GAA@mail.gmail.com>
 <ZvEpHCeKDi_8XGcz@zatzit.fritz.box>
 <CAMuHMdWsKQZw+pDZ7t3X3amCV6ms76v4o_FsdZ6-XJEDrv4Gvg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GsVK5T5pPTpT+td3"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWsKQZw+pDZ7t3X3amCV6ms76v4o_FsdZ6-XJEDrv4Gvg@mail.gmail.com>


--GsVK5T5pPTpT+td3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 23, 2024 at 11:12:02AM +0200, Geert Uytterhoeven wrote:
> Hi David,
>=20
> On Mon, Sep 23, 2024 at 10:41=E2=80=AFAM David Gibson
> <david@gibson.dropbear.id.au> wrote:
> > On Mon, Sep 23, 2024 at 10:22:03AM +0200, Geert Uytterhoeven wrote:
> > > On Mon, Sep 23, 2024 at 5:41=E2=80=AFAM David Gibson
> > > <david@gibson.dropbear.id.au> wrote:
> > > > So, essentially you're just adding new labels as aliases to existing
> > > > labels?
> > > >
> > > > Ok, I can see at least two ways of doing that which I think are a m=
ore
> > > > natural fit than allowing symbols to be phandles.
> > >
> > > [...]
> > >
> > > > # Method 2: /aliases
> > >
> > > Does the (Linux) DT overlay code support updating aliases?
> > > Last time I needed that (almost a decade ago), it did not.
> >
> > Huh.  I hadn't realised the kernel kept a separate cache of aliases
> > that wasn't updated.  Assuming that's still the case, that would
> > complicate matters a bit.
>=20
> Indeed.

Actually, in a sense this is just an aspect of a more general thing:
libfdt's is not the only relevant implementation of overlays.  If you
want to extend what overlays can do, you need to consider the kernel
implementation too.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--GsVK5T5pPTpT+td3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmbxOWYACgkQzQJF27ox
2GcOcBAAphUUptgqJc29JcFzAlJVWJm/lSI412rYHm+TkHX/7istm1G7wxmKTysn
YYoCnvZamXSPEWZtfxdvnrQ6/da94bwRwf6jCnrXnLhRHW570CCz7UXwrFgWsb/a
w4/CFR1jnilvFN/bVUtrfhmOuK13W7sPfiO9FZIqjcFQwFezypJwTAofexn8DyAi
E20UlM4lv4uaZEfLoI6ws/qJxEWEMJ+DR8MZJabNE9UI/smCHEawmrfn9432+AL8
BspAD3t7+xklhmmGLHzCEVHxsYLL7MAwxI+i0UmuEpAyxyFXwIDvtW2SmirG3GLh
mJdXdkxX+3FrKZppfHReLSH1MYBGs8Ch9iphk+WXsxxY2e2dykT2XcAat1Mj33AM
h8tylelHZi513HyZE7Rz9Q2biF1lx1JDRV20fyV+jCtDt7kQdInuVCnyaVT9aPsv
6S+wayVKXYD4AQVcapH8UTA3u7QOxioa1euKGmcQ5ky7yq/fFpKUOp70Lz7rcGm/
oHQB88T3LkOQbP8b5Jw9ZZe3Dfu8AEZqN6eR+f/GgMtDwlLRcCSctpGm9hUomFpZ
Q87kjPuYm4x+XeC/eOyW3f2rF3hnXLjJD5BRMyzVHkIGw2DMt+BDkpBs+oPdIsv/
Nfg3XAEVLgqsvJb1/oKmWGxj/SeNIr8nU/ngYVP/NLKYqMFbIhg=
=K9UK
-----END PGP SIGNATURE-----

--GsVK5T5pPTpT+td3--
