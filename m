Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7258741C63;
	Thu, 15 Jan 2026 07:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768461081; cv=none; b=GdgzBMlswFbW6y5mL1El18cRksGP/z4QO3kr3gmDqpXvBYdfVK3IwsXgwthxhXp/FVafJxs8OYaQYg9nzbDLJQLtZqhLsmAeVASyN4p1k+hgiWLu9BakNuWzbgWjttfzrb2SKaVsZ4LdLiosunI9kB1y/tomcdpeMRwkHScaVcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768461081; c=relaxed/simple;
	bh=jtUsr9ZnriNdTqTRjyYPvlhrEAV76gi5JuPwtZrQVt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JkeksRrBnGq8IFdVW6JmVfBgVgFjqmz5ZQNBZUxKYJHXJwXyh6vrWMiRhkR4WCgKRo6rBZZ5BvGAB18PWyc1InTHSUSSz3JHmlvkWF3Kie912//8IRuuf1VPb8X2biiEtE2I808XDOM2R3HUGakmB8fzrexnNipyRQbHZ8DOG6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=r7iOJHzd; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="r7iOJHzd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202512; t=1768461077;
	bh=PpxIiAL1xkdlSfyvsInWR8vH4upI9+yWdhmkzjXUiLQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r7iOJHzdcbksfcGQLYVawg+DzIpiri7fFgjO6FPWaZ9gQ+HiqJY1zLmaGheIJ9baP
	 R9n8nOUeaaoe3jyggJHtwgEWFBB7ka1ygIhLPywWgAQDLmlST1rIcXCI+MPEWhnnE1
	 ZZrHOYZZG5PtJcajo+noFpb+x0U0MJfi5yw4Zrczf0FWxLj8lumI04QTCv8mO6xZXN
	 8yy+bI8LoYFfWY5fBRNidDsOcr5NQfRAScuO+HcWdgtmH/WjJ6LTuTjWSpBVEHARyT
	 ySOiHKc7PYY7X67dm/cSb+XFitPnFNziFDgbCqNrkUE96udRpqve0liolKoBdZ3vEi
	 rN6XjlYpuiATg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4dsDfs6X5Dz4wMF; Thu, 15 Jan 2026 18:11:17 +1100 (AEDT)
Date: Thu, 15 Jan 2026 18:11:10 +1100
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
Subject: Re: [RFC PATCH 00/77] Add support for dtb metadata and addon
 device-trees
Message-ID: <aWiTDl3RSs_tyqKz@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
 <aWgwEmKyPY_odaxw@zatzit>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cN30mdffDeCXEuxZ"
Content-Disposition: inline
In-Reply-To: <aWgwEmKyPY_odaxw@zatzit>


--cN30mdffDeCXEuxZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 15, 2026 at 11:08:51AM +1100, David Gibson wrote:
> On Mon, Jan 12, 2026 at 03:18:50PM +0100, Herve Codina wrote:
> > This big picture series adds support for dtb metadata and addon
> > device-trees.
>=20
> Oof.  So, I lobbied for (at least aspects of) this approach, I think
> it's a better idea than more ad-hoc extensions to overlays.
>=20
> Now I'm reaping what I sowed: reviewing 77 patches for dtc/libfdt is
> going to be a real challenge - I've been struggling to find time to
> review a 6 patch series for months.  Well, I guess we'll see what we
> can do.

Jsyk

In line with the above, the review I've done so far is, deliberately,
a shallow, first-pass approach.  I'm looking primarily at the commit
messages rather than code, and I'm focussing on generalities and
reviewability, rather than details.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--cN30mdffDeCXEuxZ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmlokw0ACgkQzQJF27ox
2GcECA//RrVwgnoXtXGtTIFdctxoHafJLy9HT1SkkJZX6G4CU48XF8qXZwyDKpTY
S1NsiW3mEywjq/UCABB5UAD9k16bUBA4obcmxF1nztkHqozPE0kasWmkjpYEdrXD
5JkduB9T1sSKYUBG+9lCcevGln62bcc2hJ8R13A5DXR8QFsHB8k7YJWzGNZeZ0jz
bX3pAUEgqfeFVJjpD9b/WgTjzaKVppHCKeBgrBz0ky0jfrBjYjInU1aMft7HwLQH
2t6A68058J4C1sDPZr2gZ997etH/oN1fmxHBedOE6jcM3hvaOe4TeJcxxmTOBc/z
uBzDRQ+T02KQfStyVEWGL2GFwRXTW6O9t4W7VYEEa2qAOmW4VK2gScFgiF6eAVws
sVrZFQ+U203QnbmVZ7U07cD5I/UESSxf1GoXPCG4TF95i/zE5MAMazdqRV6GcXfG
tyf6L5g5WyvaWfca1ORj6XUnxqupSl17VRSI1Gd4ByhCVwo301yGjhQ6Q2hf5dkq
rG9SpC3qCJwKAmzEXVRtl30ccw9SPE8HKNxA+jiEIB0E8BS40Vzr7BCjLAVlQTaK
z74jXs38eby9p8uhQuLfuNvzoiAZfMKZ2hjR00itlomnp09a8mNgrZfmIRRW4OAS
FHpoBHbvFGrmbfrHydA4bY6q7RZwdRDUvIptnAnCHHpubdBLlW8=
=8RBe
-----END PGP SIGNATURE-----

--cN30mdffDeCXEuxZ--
