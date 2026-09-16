Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589CC473C73;
	Wed, 16 Sep 2026 08:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789547021; cv=none; b=OEWpKbMo5G0uL+kG696Wu9a9cIFFUn6juOizDnmUqypq/odhKvATzwloR9Cmv3bAhGhoQCAsQScla0dpvrHQoIiH168yhWhNw8UIwxIeki1FpNZidBVpvbuaetCQRQV7eycY8X6/NApQKD2ig0AbeNuBbrBhO96YiUcS2l2zDNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789547021; c=relaxed/simple;
	bh=/Ef6xJ/oX5ziPvVzOADL4FglLe5X/TcDsZJ25iJOyfo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YUo3vlOekWnd9CGxjl7+PPOvtOklTFnT8qT4Gy3dW5UkgwyiapfxZlfDCBim4hjWSoC2E80fdzwUFzTLopxfUFKdCOrnZ5UPfpf2cPPYrkvZPql9oqAnN3ub0qXRjysWoKU45NCFhX0ERgW6kTPmR6Dpjeov52qCx9tElaPxb7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=vek7Yt0A; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="vek7Yt0A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202608; t=1789546982;
	bh=UisVH+zAA7Jkcdzds8fAYf6ZlF5YRN+sefWgI1lIMmc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vek7Yt0AhtYAt5p28dkvu9L4gkPBBUMqDEW6BZvnTUoyKPPJ3jQ6VszuTkDj+w3dQ
	 NNXcPq8jN8P5PU1Hx2UO8bhvS/1fQs9jADcMHgoWuaujcBRq/WN/8B3IT2zZKtemWM
	 7nCWFODRCcer/ptKNu0T/izdzlN5qqFO0LBQMM0OeqEFdis9oSS3/CRickJHUfQV1k
	 /KuvjHGLGShL8piDHG4ZNWKtYd0vsKpJepT+i4an4Hn+gqf2VR71Z1kHFUFuFVU5lq
	 +TDUDJ5PfPkVZoAV4TQXjN6LmZTiT6BxB94UwcJACpLiPotxJCa5y1dTJ3DqtgnLiG
	 iDTP4GvL2LXew==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4hlBj26vb1z4w9R; Wed, 16 Sep 2026 18:23:02 +1000 (AEST)
Date: Wed, 16 Sep 2026 15:21:15 +1000
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
Subject: Re: [PATCH v3 06/15] Introduce structured tag value definition
Message-ID: <aqonNkbVqW9tf6Bg@gractus.seuss>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
 <20260826083146.304291-7-herve.codina@bootlin.com>
 <aqI3KnnQnUytqkEc@gractus.seuss>
 <20260910094126.4bf4cae6@bootlin.com>
 <aqJ5OhJcv4k-ZAj8@gractus.seuss>
 <20260911091653.37b22b0f@bootlin.com>
 <aqS6HmkaVYbrePtN@gractus.seuss>
 <20260914121937.5b7fa2bb@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OXpIoQ8msCZFwtww"
Content-Disposition: inline
In-Reply-To: <20260914121937.5b7fa2bb@bootlin.com>

--OXpIoQ8msCZFwtww
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 12:19:37PM +0200, Herve Codina wrote:
> Hi David,
>=20
> On Sat, 12 Sep 2026 12:34:24 +1000
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> ...
>=20
> > > Do you mean that we should avoid the DATA_LEN_ENCODING and always hav=
e the
> > > 32-bit value right after the tag to give the size for all "skippable"=
 tags? =20
> >=20
> > Yes.
> >=20
>=20
> I did a test using a dts file available in kernel sources. I used (arbitr=
ary
> choice) juno.dts [0].
>=20
> Without any new tags, the size of the compiled dtb is 27067 bytes.
>=20
> With new metadata tags identifying phandles in properties (FDT_PROPDATA_P=
HANDLE),
> the size of the dtb becomes 29027 bytes and so 29027 - 27067 =3D 1960 byt=
es for
> those FDT_PROPDATA_PHANDLE tags (+7.2%).
>=20
> The tags used are composed of:
> 32-bit: FDT_PROPDATA_PHANDLE value encoding 1 x 32-bit for data
> 32-bit: offset in the property where a phandle is present.
>=20
> Removing the '1 x 32-bit' information from the tag value and adding a 32-=
bit
> 'length' in all cases will lead 3 x 32-bit values for a FDT_PROPDATA_PHAN=
DLE
> tag (tag + length + offset) instead of the 2 x 32-bit (tag + offset).
>=20
> Back to juno.dts instead of 1960 bytes, the FDT_PROPDATA_PHANDLE will need
> 1960 * 3 / 2 =3D 2640 bytes (+9.7%). This leads to around +2.5% of the wh=
ole
> dtb just to have the 32-bit for length. This +2.5% can be easily avoided.
>=20
> Also, I will not be surprised to see more tags in the future adding some =
more
> metadata information and so increasing dtb sizes.
>=20
> Quite often you have mentioned memory constraints system where libfdt sho=
uld
> be as small as possible. On those system, the dtb itself is embedded in t=
he
> binary close to libfdt. The size of dtb should be taken into account.

Yeah, those proportions are high enough that I think it's worth it.

> If the SAFE_SKIP bit is removed, I even plan to use this now free bit in =
the
> length encoding part:
>   0b000: No data
>   0b001: 1 fdt32
>   0b010: 2 fdt32
>   ...
>   0b110: 6 fdt32
>   0b111: On additional fdt32 to encode the length of data.
>=20
> IHMO, length encoding bits in tag value definition should be kept and used
> for all tags where the length is fixed and can be encoded using
> these bits.

Well, I'm convinced we want some sort of compact encoding of the
length, but I think we can do better than the current proposal.  It
seems implausible to me that we'll need 2^29 different metadata tags,
so I think we can spend some more of the tag bits on the length.  How about:

   0x80000000		structured tag bit
   0x7fff0000		tag type
   0x0000ffff		tag length

So we have up to 2^15 (32k) different structured tags each with a
length of [0..65534] bytes (length=3D=3D65535 reserved for those that need
a full 32-bit length word).

I believe that will avoid the extra length word for everything you
have currently drafted.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--OXpIoQ8msCZFwtww
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmqqJzYACgkQzQJF27ox
2Gedow/+PaKFeN38xKkeFSgxRHAuRdGV3THxlRq1m7Ax33zAL8H3uyVgWZ8BKEZT
9fLR8z2sgh+ecfRE5RXykJjmYrdvGmzNN/CpSBHZYXo8JV3hTJoPpi/pNfZ2smJW
eLKYjKNRLXEpOnQfslXzc72dLNdToQyOjyQnwG9wVe3dprXV2SxfPS8zk17hzNZS
K5BweIrxQ4VQVOagDWV/L5K5I13sybB/H1T97oilDMdsCgXTEIwHQvigsqQqFL0J
WEWmbkaEqzRPnDTk6DzrJbe8uo5/bTma90rD5SH9gWzzHTjBmRC1OzMo7ERcI6tu
XcBMx0BWlkOAokZbkxF4WFY93vDsgmNll0Rhw0hCM29NXoQqBCs0Vix1+GvTTLFS
bX593x1siQ3l47UGUboowLR92K9NtEWj5qWN84C5hWXdU7AGiYnmwphDkpbzZIVP
m3lBUKlbdI0OgiHP5XnS0YYSSNmgxuGIILPq6+tbyBbJwmzYKvjwwdKcGXVb8JuL
iPMRcact/lLS1xKDFG8fZt0KVADUQP+KfUKFTi4THXo34ADNfzsI9gzRm+QE8evz
S/vAFS8s1bIVunhwV7ECxW6gCdcvXSmtRCon82+3HhGb7QSftUH7BGs/jTos2muu
H7MBARXfodJoWAuwRqk8VB6igawZRQo53Mv92TqIng74NukWo4g=
=hkgL
-----END PGP SIGNATURE-----

--OXpIoQ8msCZFwtww--
