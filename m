Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18753CF051;
	Thu, 24 Sep 2026 04:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790225416; cv=none; b=bZEBObMppv97TDJHgd0HVV+9dGD2WgLdbPcq8krMw72tsS2CmNdRd4VJXjk0nkL/2+Uraj1qodjihJGMrHaluVMWIl1WCGGLV8DmLd13qZSPsOpv1NxMBr7JXxdBAqVEtXXL0y9WysC0J/3241N/PVAd0AxA383fPVV3GgKT614=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790225416; c=relaxed/simple;
	bh=43RMoj05xiKDXP5fYVrwU1nq5jfeUdtdfmfVfIcj7jI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cPOVkRzQuF6CCvXrVXC6keVQT6nyKw7nwwabR14VMlJqFrwWmgFwPVxwr9tgjsu4Tmln2JwAz//FC82g1/0K+to0DQfekAvogmlJERIUhQTdQ+Q2sJE6sKJoVPq0BSIH7Yk4LBmS6UrIJ2FZWBW94YRqgO/0GS4AZze8egOZ2vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=hve2mmx/; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="hve2mmx/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202608; t=1790225380;
	bh=7f2oetGAe71uHNcIaMbAfa2BIEJq6zVwewOu+CJ7lEw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hve2mmx/tUtDE6CIHnu4ZtTIyNjLxLtJ2zsakbrWmLuj085BGsmkje2vi/0cfFVLb
	 rtsHmK27Xz7u3X6zUn3bP/J7ry0bUr6dEyXHT4gU3wKNZFllkH/iNeAWlAoIvrrQmS
	 bzBTWcroEnWj4CbAp/P26xe3j+bsjAs5W3PUV02PSFejTsi/T2e0v7zhFunGhcX0Dg
	 7RuPnW7jBg3MZ5I2C2MX2W3g5hMoX0Kmpmz65oOnq5WyQvU0ra9dcdA3uIwiOmbqWh
	 3RJ+yWARbtZLeQMGYo311WHj4ER+gKnp5Vi58v69TEDvlMSofHa3jRuo5JY/zwaKiQ
	 6hPRMkhSA5NpQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4hr1b811nqz4wCp; Thu, 24 Sep 2026 14:49:40 +1000 (AEST)
Date: Thu, 24 Sep 2026 13:49:55 +1000
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
Message-ID: <arSdrp6WtJfdiAne@gractus.seuss>
References: <aqJ5OhJcv4k-ZAj8@gractus.seuss>
 <20260911091653.37b22b0f@bootlin.com>
 <aqS6HmkaVYbrePtN@gractus.seuss>
 <20260914121937.5b7fa2bb@bootlin.com>
 <aqonNkbVqW9tf6Bg@gractus.seuss>
 <20260917090450.770c107a@bootlin.com>
 <aqzA11pFzN_3_Nhf@gractus.seuss>
 <20260918101617.46b3477e@bootlin.com>
 <aq4N5zbuCVZ4e6-C@gractus.seuss>
 <20260922084154.576a42d0@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/u7gAoVU7G3ZXZ2N"
Content-Disposition: inline
In-Reply-To: <20260922084154.576a42d0@bootlin.com>

--/u7gAoVU7G3ZXZ2N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 08:41:54AM +0200, Herve Codina wrote:
> On Sat, 19 Sep 2026 14:22:09 +1000
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Fri, Sep 18, 2026 at 10:16:17AM +0200, Herve Codina wrote:
> > > Hi David,
> > >=20
> > > On Fri, 18 Sep 2026 14:41:11 +1000
> > > David Gibson <david@gibson.dropbear.id.au> wrote:
> > >  =20
> > > > On Thu, Sep 17, 2026 at 09:04:50AM +0200, Herve Codina wrote: =20
> > > > > Hi David,
> > > > >=20
> > > > > On Wed, 16 Sep 2026 15:21:15 +1000
> > > > > David Gibson <david@gibson.dropbear.id.au> wrote:
> > > > >    =20
> > > > > > On Mon, Sep 14, 2026 at 12:19:37PM +0200, Herve Codina wrote:  =
 =20
> > > > > > > Hi David,
> > > > > > >=20
> > > > > > > On Sat, 12 Sep 2026 12:34:24 +1000
> > > > > > > David Gibson <david@gibson.dropbear.id.au> wrote:
> > > > > > >=20
> > > > > > > ...
> > > > > > >      =20
> > > > > > > > > Do you mean that we should avoid the DATA_LEN_ENCODING an=
d always have the
> > > > > > > > > 32-bit value right after the tag to give the size for all=
 "skippable" tags?       =20
> > > > > > > >=20
> > > > > > > > Yes.
> > > > > > > >      =20
> > > > > > >=20
> > > > > > > I did a test using a dts file available in kernel sources. I =
used (arbitrary
> > > > > > > choice) juno.dts [0].
> > > > > > >=20
> > > > > > > Without any new tags, the size of the compiled dtb is 27067 b=
ytes.
> > > > > > >=20
> > > > > > > With new metadata tags identifying phandles in properties (FD=
T_PROPDATA_PHANDLE),
> > > > > > > the size of the dtb becomes 29027 bytes and so 29027 - 27067 =
=3D 1960 bytes for
> > > > > > > those FDT_PROPDATA_PHANDLE tags (+7.2%).
> > > > > > >=20
> > > > > > > The tags used are composed of:
> > > > > > > 32-bit: FDT_PROPDATA_PHANDLE value encoding 1 x 32-bit for da=
ta
> > > > > > > 32-bit: offset in the property where a phandle is present.
> > > > > > >=20
> > > > > > > Removing the '1 x 32-bit' information from the tag value and =
adding a 32-bit
> > > > > > > 'length' in all cases will lead 3 x 32-bit values for a FDT_P=
ROPDATA_PHANDLE
> > > > > > > tag (tag + length + offset) instead of the 2 x 32-bit (tag + =
offset).
> > > > > > >=20
> > > > > > > Back to juno.dts instead of 1960 bytes, the FDT_PROPDATA_PHAN=
DLE will need
> > > > > > > 1960 * 3 / 2 =3D 2640 bytes (+9.7%). This leads to around +2.=
5% of the whole
> > > > > > > dtb just to have the 32-bit for length. This +2.5% can be eas=
ily avoided.
> > > > > > >=20
> > > > > > > Also, I will not be surprised to see more tags in the future =
adding some more
> > > > > > > metadata information and so increasing dtb sizes.
> > > > > > >=20
> > > > > > > Quite often you have mentioned memory constraints system wher=
e libfdt should
> > > > > > > be as small as possible. On those system, the dtb itself is e=
mbedded in the
> > > > > > > binary close to libfdt. The size of dtb should be taken into =
account.     =20
> > > > > >=20
> > > > > > Yeah, those proportions are high enough that I think it's worth=
 it.
> > > > > >    =20
> > > > > > > If the SAFE_SKIP bit is removed, I even plan to use this now =
free bit in the
> > > > > > > length encoding part:
> > > > > > >   0b000: No data
> > > > > > >   0b001: 1 fdt32
> > > > > > >   0b010: 2 fdt32
> > > > > > >   ...
> > > > > > >   0b110: 6 fdt32
> > > > > > >   0b111: On additional fdt32 to encode the length of data.
> > > > > > >=20
> > > > > > > IHMO, length encoding bits in tag value definition should be =
kept and used
> > > > > > > for all tags where the length is fixed and can be encoded usi=
ng
> > > > > > > these bits.     =20
> > > > > >=20
> > > > > > Well, I'm convinced we want some sort of compact encoding of the
> > > > > > length, but I think we can do better than the current proposal.=
  It
> > > > > > seems implausible to me that we'll need 2^29 different metadata=
 tags,
> > > > > > so I think we can spend some more of the tag bits on the length=
=2E  How about:
> > > > > >=20
> > > > > >    0x80000000		structured tag bit
> > > > > >    0x7fff0000		tag type
> > > > > >    0x0000ffff		tag length
> > > > > >=20
> > > > > > So we have up to 2^15 (32k) different structured tags each with=
 a
> > > > > > length of [0..65534] bytes (length=3D=3D65535 reserved for thos=
e that need
> > > > > > a full 32-bit length word).
> > > > > >=20
> > > > > > I believe that will avoid the extra length word for everything =
you
> > > > > > have currently drafted.
> > > > > >    =20
> > > > >=20
> > > > > Yes, this will avoid the extra length field. The drawback is the =
that the
> > > > > tag value is no more a well fixed value. Each time we have to che=
ck the tag
> > > > > value we have to filter out the tag length.
> > > > >=20
> > > > > For instance:
> > > > > - FDT_PROPDATA_PHANDLE
> > > > >   fixed data size 4 bytes for offset
> > > > >   tag value: 0x80010004
> > > > >=20
> > > > > - FDT_PROPDATA_PHANDLE_REF
> > > > >   data: 4 bytes for offset + N bytes for a string
> > > > >   tag value 0x8002ssss with ssss for the size
> > > > >=20
> > > > > This will lead to code like this:
> > > > >   tag =3D fdt_next_tag();
> > > > >   if (tag =3D=3D FDT_PROPDATA_PHANDLE)
> > > > >     /* Do something */
> > > > >     =20
> > > > >   if (TAG_GET_ID(tag) =3D=3D FDT_PROPDATA_PHANDLE_REF)
> > > > >     /* Do something */   =20
> > > >=20
> > > > True.  But.. a similar problem kind of exists with the original
> > > > proposed encoding too: we *expect* a tag with fixed 4-byte contents=
 to
> > > > use the "1 cell" flags, but we need to consider the case of encoding
> > > > it as VARLEN with a length field of 4.  We could choose to make that
> > > > forbidden, but we'd still need to consider who's responsible for
> > > > enforcing that.
> > > >=20
> > > > Similarly, if a variable length metadata tag happens to have length=
 4
> > > > or 8 in a particular place, is it valid to encode it with the 1-cell
> > > > or 2-cell flag? =20
> > >=20
> > > My position was: if we expect a tag with "1-cell" flag, using varlen
> > > field encoding is considered as an other tag and so either an error
> > > or a skippable unknown tag. =20
> >=20
> > So essentially tags of different (fixed) length live in different
> > namespaces.  Ok, that makes good sense to me, but wasn't initially
> > obvious to me.  So, I think we need to spell this out a bit better.
> >=20
> > > The same apply for varlen defined tag. Even if the data is, let's
> > > say 8 bytes, the tag cannot be moved to a "2-cells" tag.
> > >=20
> > > The kind of data length encoding (1-cell, 2-cells, varlength) is done
> > > when the tag is defined and cannot be changed.
> > >=20
> > > Who is responsible for enforcing that ?
> > > I would say the documentation of the tag should clearly set the data
> > > encoding used for the tag and the documentation of the "skippable"
> > > format should say that data encoding is fixed for a given tag. It is
> > > set when the tag is defined and any changes at runtime should be
> > > considered as a different tag.
> > >=20
> > > Of course we can introduce dynamic length encoding to set the data le=
ngth
> > > encoding in the tag according to the exact data length found at runti=
me.
> > >  =20
> > > > As a variant on my proposal, I'd also be fine with dividing the
> > > > structed tags into several classes with bits indicating which is
> > > > which.  Either:
> > > >=20
> > > >  * "short" vs "long": "short" always has the length within the tag
> > > >    word (and so cannot exceed 64k, or however many bits we set asid=
e)
> > > >    whereas long always has a length word
> > > >  * "fixed" vs "variable", fixed length tag types always have the sa=
me
> > > >    length, so the length can be considered part of the tag.  Variab=
le
> > > >    would have a length word. =20
> > >=20
> > > Well, only strings, or more generally arrays, need a varlen. For those
> > > item, I would use the varlen word and so "long" in your definition.
> > >=20
> > > For all others where the sizeof(data) is well known when the tag is
> > > defined, I would use "fixed" and "long" only if sizeof(data) cannot
> > > be encoded by "fixed" (lengh > limit of dedicated bits). =20
> >=20
> > Right, now understanding your thoughts on the originally proposed
> > encoding, the "fixed" versus "variable" distinction makes more sense I
> > think.  I do see the advantage of never having a variable length
> > encoded within the tag word.
> >=20
> > > Without any additional bits for any category, all of these fit with t=
he
> > > following length encoding:
> > >   000...00: No data
> > >   000...01: 1 x 32-bit
> > >   111...10: N x 32-bit
> > >   111...11: varlen word =20
> >=20
> > Right, so revising my suggestions in light of a better understanding
> > of what you had in mind originally, it comes down to:
> >=20
> >  * I think adding more bits to the size field would be worthwhile to
> >    allow a wider variety of future fixed length metadata tags.
>=20
> Right, I have planned to add one more bit compared to the original propos=
al.
> This leads to 3 bits and so 0 to 6 32-bit data words (0b111 means varlen =
word).
>=20
> Do you think we should add one more bits?

I don't think we particularly need them for the tag type, so yes, I
think that would be worthwhile.

> >  * Originally I was thinking that having a length in bytes rather than
> >    just a length in 32-bit words would be worth it.  But thinking
> >    further, there's probably no benefit.  The length rounded up to
> >    32-bit words is all we need for skipping over it when unknown.
> >    Even if we want a fixed length tag with, say, 3 bytes of data, we
> >    can pad that out to a 1-word tag with a reserved byte.
>=20
> The varlen word could be kept in bytes.

The varlen word _must_ be kept in bytes.

> > Ok, so more length bits and better documentation of the fixed
> > vs. variable distinction are the only remaming suggestions.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--/u7gAoVU7G3ZXZ2N
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmq0ndwACgkQzQJF27ox
2Gefig//SJSuaWh8Aq8xRZo1lKaEMMP5kF/Lnc7orn71+MdBW6GlzJyaAX9JewSh
BEEbuYc/9nfWlxeE+4nY7ie1FPnVNKfbyE7AW2sCkUMcEKTNN2b8i8YVU/M1Foiz
agWo1VXZ1vMJ4DAuPGowM4CHWcRIqZWRwmExdDjXsUEqR27oBCbTNkVnVVTCCWll
Cvda+5qkS+PICOEUSFKJi5nYUmdgvR2ZtCURQy81rEW3fnNMOeij1byJFYGdojqp
Q5Fb+4k5SCpPgcVR1/PuJjYDDOcsPzD0aweozOb+15v8+DkohycIlF1On4Fz83d3
k/c+jk84SAiF1avSiB5p8oX/YhlqIyVMw1JOjejUMySu+h/bgec78I3Qz7qipafz
6s6jJihdW0gnXZLmBHw7V885tIDTBUzgJXQ7zjVn9dB98K0mxdhh1bT89dpBRz+E
fyWONuvsz7pKQA1j0s6xs9zTmQYT1k0sb4QSqIneaiMIHORuJZNqVLzX8s9P9BJR
YX2/22l5Xnflwk+x0VdTNU25bqn/UY4OeGO0fe23cFi8rFt76FIccrtU5jedurja
ZZ0Ae5yC4hTHRQrMMJwOMViqe5QtSlAU2d0QVg6CKw9qL9A0zscgPBrNwoSxZFUi
W3RBqlpZdw2N1bv+h2iKgn44UsZ1tpROUkir79mSvEFszMHHsJE=
=VzK1
-----END PGP SIGNATURE-----

--/u7gAoVU7G3ZXZ2N--
