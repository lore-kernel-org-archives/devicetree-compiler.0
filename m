Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5951547DA
	for <devicetree-compiler@vger.kernel.org>; Thu, 12 Sep 2024 03:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726112338; cv=none; b=J7hRk5sVrgNdMHvd9IN1+DvWp1GqsfRGWKApKbcUqvBI1BsOdg7VuM5AEHNS6Hn7/a9/pdnp7fYj5/iIV0e6EGr7d0WedrsSvpVm7D6oOuxXE+5/1H4GFe6S9Wa/ttEZRZiE8Wy/CQx1b0VIrtQMck3I3JHloA3VskU2GbpDeuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726112338; c=relaxed/simple;
	bh=bJkS6hqCGNxDFCCOmHmMGe18+M4lKO9ju2p8b1WAehQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FfZU+ZhdFhVhJaZscrqytNX+NaoEX5z6f1mmHaHliAyOcA3Yb/h1hdKn6h4gQ5lBt5NHAEH1XAszAv8fW9D4E6GZFSCll0wRDC/0lAL5p20mPTXnKkFZ+pTIWAodcLZcNLbNV/LX0wU3+mTJJupuhel/tSVGOWJE5dMFOov5bc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=AFc26tD9; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="AFc26tD9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202408; t=1726112331;
	bh=NJ8+N5vpo6vDXNPGXaCezwDdKSjou4s7Cma6H9Y45M0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AFc26tD9SMvbXE8YBeKxnuVwU7mheLiY34ktD3bmUG76Hs77muuPmZ5qk+rgkQS58
	 GOzuNHv/cey+NC2V3962YWOzK+uSGu5zGaaWAn+S34gZD3KACVATVRAWzJsAbWBro5
	 VKCJjFMx+pQDX7IU+dnQhrXvfglkqXmUw0PPJfkHt/kqb4xRjprkYdPEH1vjFGKfyq
	 8mGn4v4JsZbOAauhLgr+tz5v0xupnn8oHVioCaWHi9/qK8mTejMK6qTLsxjmCO94JW
	 bv6YSXEm9s0cP3icMzpJsPveND5m0WhDAItKWAV8wzvWEaaACkkeut8sVH9gT960dL
	 W2zuKUYooSZhg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4X437v1Pmtz4x0K; Thu, 12 Sep 2024 13:38:51 +1000 (AEST)
Date: Thu, 12 Sep 2024 13:38:45 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Ayush Singh <ayush@beagleboard.org>
Cc: d-gole@ti.com, lorforlinux@beagleboard.org, jkridner@beagleboard.org,
	robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com,
	Andrew Davis <afd@ti.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Robert Nelson <robertcnelson@gmail.com>,
	devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH 1/2] libfdt: overlay: Allow resolving phandle symbols
Message-ID: <ZuJiRfTWm8f8YfZ7@zatzit.fritz.box>
References: <20240902-symbol-phandle-v1-0-683efb2a944b@beagleboard.org>
 <20240902-symbol-phandle-v1-1-683efb2a944b@beagleboard.org>
 <Zt6Bog4Fqcb89ivO@zatzit.fritz.box>
 <3f062731-5819-4fb3-bf97-5748be63eb17@beagleboard.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Sf8E/vVNhwAsOttd"
Content-Disposition: inline
In-Reply-To: <3f062731-5819-4fb3-bf97-5748be63eb17@beagleboard.org>


--Sf8E/vVNhwAsOttd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 09, 2024 at 12:54:34PM +0530, Ayush Singh wrote:
> On 9/9/24 10:33, David Gibson wrote:
>=20
> > On Mon, Sep 02, 2024 at 05:47:55PM +0530, Ayush Singh wrote:
> > > Add ability to resolve symbols pointing to phandles instead of string=
s.
> > >=20
> > > Combining this with existing fixups infrastructure allows creating
> > > symbols in overlays that refer to undefined phandles. This is planned=
 to
> > > be used for addon board chaining [1].
> > I don't think this "autodetection" of whether the value is a phandle
> > or path is a good idea.  Yes, it's probably unlikely to get it wrong
> > in practice, but sloppy cases like this have a habit of coming back to
> > bite you later on.  If you want this, I think you need to design a new
> > way of encoding the new options.
>=20
> Would something like `__symbols_phandle__` work?

Preferable to the overloaded values in the original version, certainly.

> It should be fairly
> straightforward to do. I am not sure how old devicetree compilers will re=
act
> to it though?

Well, the devicetree compiler itself never actually looks at the
overlay encoding stuff.  The relevant thing is libfdt's overlay
application logic... and any other implementations of overlay handling
that are out there.

At which I should probably emphasize that changes to the overlay
format aren't really mine to approve or not.  It's more or less an
open standard, although not one with a particularly formal definition.
Of course, libfdt's implementation - and therefore I - do have a fair
bit of influence on what's considered the standard.

> I really do not think having a different syntax for phandle symbols would=
 be
> good since that would mean we will have 2 ways to represent phandles:
>=20
> 1. For __symbols__
>=20
> 2. For every other node.

I'm really not sure what you're getting at here.

> I also am not in the favor of doing something bespoke that does not play
> nice with the existing __fixups__ infra since that has already been
> thoroughly tested, and already creates __fixups__ for symbols.

Hmm.  Honestly, the (runtime) overlay format was pretty a hack that's
already trying to do rather more than it was really designed for.  I'm
a bit sceptical of any attempt to extend it further without
redesigning the whole thing with a bit more care and forethought.  I
believe Rob Herring has some thoughts along these lines too.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--Sf8E/vVNhwAsOttd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmbiYkQACgkQzQJF27ox
2GcC3BAAqFiXrptHmcQrdE7AynDit1yi8ohLKt6nRXx0wrYU3j+8qI/eGswEeivR
8fn0Qeq/LFLG1+7AX8YJns+k1wQ5UpBa8d+y/Q1XIb4mF2+iQeUYsyA0IyUk23YB
sGVjsQoRW45i3fIhiFotVKF/ZWz1VfTOAFOCASLYM0YMZ6xy5A7q9n8IReLBVC6K
rLuXT4OIGtUhpt4cL0laTJfwwFLkvem/HD8iN1O/UGVamH0vn87KI7739IbFP4W4
mlkkAxMO06LV14yG1ObnQRxrg26d2SkX2XspZWRhco9uu7gxfeKzznlaZZZmbsP7
GNu1Se46VvBQ/7QuKP8q06dCjrCW7kiWyJ0bJpV5tNBMicWfPP2OOlnfECLsWFln
Q9eCdYb3+9zTOWUdzGpwqFc9lQ22NBERvs+pXnkOmYoOEk99C88PdpfmJw5R3WGF
3vj5Ru9GrGVIZfh02CxeFzJon6KcOAMD4GJC6Y+O5RAlsdL8gdX2KrSyjD2SYdMY
RyKWdYldDFLXynxSN6scBlW873Xtg4XF9ZX94Puj42Vhi/lt5IbtrbQnWNrcpJIP
jBfn1LX37f3HGPk2vkTCtvAprk1z1OImaJz1/IS/ENqUlA/PygZXo5WPXAvS90MD
BN2isyXcsJjVIn4XnVRktGrHzSGbzwsEzXiQTmUailTLvgI++38=
=gMLZ
-----END PGP SIGNATURE-----

--Sf8E/vVNhwAsOttd--
