Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A74345ED4;
	Sat, 19 Sep 2026 04:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789793211; cv=none; b=YaDcOYupX4fFNFIrOmvcRT4d6jm9KujC9MhnJpJS747d6mEsgJQ5YkIW6x2WLz3xGAnKEYwWkfEWScoryGPjn4mvNIcYChciLgoiczhkkaVQo6nI6quRxjYOllrMp+dNQ5764fqATwuErTNQvfKhAUW3zQz8cXQOhDG9uBSlDww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789793211; c=relaxed/simple;
	bh=W8SAPPdqw4YCsVvfIwyA/7OkYBwG12OYtiawoOVsYSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kqS3IGqBWWy+YToMXvSBge1qgrx2RUjtiqjj6+XXI9Bg+mfMcXFLucYY7Gk6Y4DhV662AyUNXI2b0qp7uSXcvWKoBWa9ypp2piGsr2uOraS6EcM7MsZ7HXbUdyFIkpqCyVyf0AgtlQVmcgMl35Ql2OQWWA7kPKvZgNw0IeWDByw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=Qyl7Qyk1; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="Qyl7Qyk1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202608; t=1789793181;
	bh=+5m4LCAHcYlMgj2HDZt+gXuNtnMkJokc6tCPC/OH1jk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qyl7Qyk1vPdluXvW75ggddpsOocU2pb3C9R/LwgwmH2dUKh3QXG7rRYm2Q5CgZMf0
	 qgUK0wzwI7IXicQpUXiTJwgvm4rCwtcMQBYquIUdoaSqxMz8zKXzbYk5eJu4P3wKph
	 2O/BG2DIcHIsWayAHq+knPeUpheuOGkFx75RIj7xzjh5eejXAbHFkxmoOKSMu21wKW
	 d3ipkAmLXHS5fvjfAvfzEbhq+8ee/uuJmv0mrM4h5x9qXJNEoZLdmVqYh3ycS9QCvx
	 VwLQ3EbUCgt9RA636VFN54wyFnaWZQZn4bBqe/XzNlxAltTvdhzRqH+TvMM9q752Lq
	 i3hM08m7kirFQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4hmxld2Hphz4wTN; Sat, 19 Sep 2026 14:46:21 +1000 (AEST)
Date: Sat, 19 Sep 2026 14:22:09 +1000
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
Message-ID: <aq4N5zbuCVZ4e6-C@gractus.seuss>
References: <aqI3KnnQnUytqkEc@gractus.seuss>
 <20260910094126.4bf4cae6@bootlin.com>
 <aqJ5OhJcv4k-ZAj8@gractus.seuss>
 <20260911091653.37b22b0f@bootlin.com>
 <aqS6HmkaVYbrePtN@gractus.seuss>
 <20260914121937.5b7fa2bb@bootlin.com>
 <aqonNkbVqW9tf6Bg@gractus.seuss>
 <20260917090450.770c107a@bootlin.com>
 <aqzA11pFzN_3_Nhf@gractus.seuss>
 <20260918101617.46b3477e@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uDe01GDI3ttlNJjJ"
Content-Disposition: inline
In-Reply-To: <20260918101617.46b3477e@bootlin.com>

--uDe01GDI3ttlNJjJ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 10:16:17AM +0200, Herve Codina wrote:
> Hi David,
>=20
> On Fri, 18 Sep 2026 14:41:11 +1000
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Thu, Sep 17, 2026 at 09:04:50AM +0200, Herve Codina wrote:
> > > Hi David,
> > >=20
> > > On Wed, 16 Sep 2026 15:21:15 +1000
> > > David Gibson <david@gibson.dropbear.id.au> wrote:
> > >  =20
> > > > On Mon, Sep 14, 2026 at 12:19:37PM +0200, Herve Codina wrote: =20
> > > > > Hi David,
> > > > >=20
> > > > > On Sat, 12 Sep 2026 12:34:24 +1000
> > > > > David Gibson <david@gibson.dropbear.id.au> wrote:
> > > > >=20
> > > > > ...
> > > > >    =20
> > > > > > > Do you mean that we should avoid the DATA_LEN_ENCODING and al=
ways have the
> > > > > > > 32-bit value right after the tag to give the size for all "sk=
ippable" tags?     =20
> > > > > >=20
> > > > > > Yes.
> > > > > >    =20
> > > > >=20
> > > > > I did a test using a dts file available in kernel sources. I used=
 (arbitrary
> > > > > choice) juno.dts [0].
> > > > >=20
> > > > > Without any new tags, the size of the compiled dtb is 27067 bytes.
> > > > >=20
> > > > > With new metadata tags identifying phandles in properties (FDT_PR=
OPDATA_PHANDLE),
> > > > > the size of the dtb becomes 29027 bytes and so 29027 - 27067 =3D =
1960 bytes for
> > > > > those FDT_PROPDATA_PHANDLE tags (+7.2%).
> > > > >=20
> > > > > The tags used are composed of:
> > > > > 32-bit: FDT_PROPDATA_PHANDLE value encoding 1 x 32-bit for data
> > > > > 32-bit: offset in the property where a phandle is present.
> > > > >=20
> > > > > Removing the '1 x 32-bit' information from the tag value and addi=
ng a 32-bit
> > > > > 'length' in all cases will lead 3 x 32-bit values for a FDT_PROPD=
ATA_PHANDLE
> > > > > tag (tag + length + offset) instead of the 2 x 32-bit (tag + offs=
et).
> > > > >=20
> > > > > Back to juno.dts instead of 1960 bytes, the FDT_PROPDATA_PHANDLE =
will need
> > > > > 1960 * 3 / 2 =3D 2640 bytes (+9.7%). This leads to around +2.5% o=
f the whole
> > > > > dtb just to have the 32-bit for length. This +2.5% can be easily =
avoided.
> > > > >=20
> > > > > Also, I will not be surprised to see more tags in the future addi=
ng some more
> > > > > metadata information and so increasing dtb sizes.
> > > > >=20
> > > > > Quite often you have mentioned memory constraints system where li=
bfdt should
> > > > > be as small as possible. On those system, the dtb itself is embed=
ded in the
> > > > > binary close to libfdt. The size of dtb should be taken into acco=
unt.   =20
> > > >=20
> > > > Yeah, those proportions are high enough that I think it's worth it.
> > > >  =20
> > > > > If the SAFE_SKIP bit is removed, I even plan to use this now free=
 bit in the
> > > > > length encoding part:
> > > > >   0b000: No data
> > > > >   0b001: 1 fdt32
> > > > >   0b010: 2 fdt32
> > > > >   ...
> > > > >   0b110: 6 fdt32
> > > > >   0b111: On additional fdt32 to encode the length of data.
> > > > >=20
> > > > > IHMO, length encoding bits in tag value definition should be kept=
 and used
> > > > > for all tags where the length is fixed and can be encoded using
> > > > > these bits.   =20
> > > >=20
> > > > Well, I'm convinced we want some sort of compact encoding of the
> > > > length, but I think we can do better than the current proposal.  It
> > > > seems implausible to me that we'll need 2^29 different metadata tag=
s,
> > > > so I think we can spend some more of the tag bits on the length.  H=
ow about:
> > > >=20
> > > >    0x80000000		structured tag bit
> > > >    0x7fff0000		tag type
> > > >    0x0000ffff		tag length
> > > >=20
> > > > So we have up to 2^15 (32k) different structured tags each with a
> > > > length of [0..65534] bytes (length=3D=3D65535 reserved for those th=
at need
> > > > a full 32-bit length word).
> > > >=20
> > > > I believe that will avoid the extra length word for everything you
> > > > have currently drafted.
> > > >  =20
> > >=20
> > > Yes, this will avoid the extra length field. The drawback is the that=
 the
> > > tag value is no more a well fixed value. Each time we have to check t=
he tag
> > > value we have to filter out the tag length.
> > >=20
> > > For instance:
> > > - FDT_PROPDATA_PHANDLE
> > >   fixed data size 4 bytes for offset
> > >   tag value: 0x80010004
> > >=20
> > > - FDT_PROPDATA_PHANDLE_REF
> > >   data: 4 bytes for offset + N bytes for a string
> > >   tag value 0x8002ssss with ssss for the size
> > >=20
> > > This will lead to code like this:
> > >   tag =3D fdt_next_tag();
> > >   if (tag =3D=3D FDT_PROPDATA_PHANDLE)
> > >     /* Do something */
> > >     =20
> > >   if (TAG_GET_ID(tag) =3D=3D FDT_PROPDATA_PHANDLE_REF)
> > >     /* Do something */ =20
> >=20
> > True.  But.. a similar problem kind of exists with the original
> > proposed encoding too: we *expect* a tag with fixed 4-byte contents to
> > use the "1 cell" flags, but we need to consider the case of encoding
> > it as VARLEN with a length field of 4.  We could choose to make that
> > forbidden, but we'd still need to consider who's responsible for
> > enforcing that.
> >=20
> > Similarly, if a variable length metadata tag happens to have length 4
> > or 8 in a particular place, is it valid to encode it with the 1-cell
> > or 2-cell flag?
>=20
> My position was: if we expect a tag with "1-cell" flag, using varlen
> field encoding is considered as an other tag and so either an error
> or a skippable unknown tag.

So essentially tags of different (fixed) length live in different
namespaces.  Ok, that makes good sense to me, but wasn't initially
obvious to me.  So, I think we need to spell this out a bit better.

> The same apply for varlen defined tag. Even if the data is, let's
> say 8 bytes, the tag cannot be moved to a "2-cells" tag.
>=20
> The kind of data length encoding (1-cell, 2-cells, varlength) is done
> when the tag is defined and cannot be changed.
>=20
> Who is responsible for enforcing that ?
> I would say the documentation of the tag should clearly set the data
> encoding used for the tag and the documentation of the "skippable"
> format should say that data encoding is fixed for a given tag. It is
> set when the tag is defined and any changes at runtime should be
> considered as a different tag.
>=20
> Of course we can introduce dynamic length encoding to set the data length
> encoding in the tag according to the exact data length found at runtime.
>=20
> > As a variant on my proposal, I'd also be fine with dividing the
> > structed tags into several classes with bits indicating which is
> > which.  Either:
> >=20
> >  * "short" vs "long": "short" always has the length within the tag
> >    word (and so cannot exceed 64k, or however many bits we set aside)
> >    whereas long always has a length word
> >  * "fixed" vs "variable", fixed length tag types always have the same
> >    length, so the length can be considered part of the tag.  Variable
> >    would have a length word.
>=20
> Well, only strings, or more generally arrays, need a varlen. For those
> item, I would use the varlen word and so "long" in your definition.
>=20
> For all others where the sizeof(data) is well known when the tag is
> defined, I would use "fixed" and "long" only if sizeof(data) cannot
> be encoded by "fixed" (lengh > limit of dedicated bits).

Right, now understanding your thoughts on the originally proposed
encoding, the "fixed" versus "variable" distinction makes more sense I
think.  I do see the advantage of never having a variable length
encoded within the tag word.

> Without any additional bits for any category, all of these fit with the
> following length encoding:
>   000...00: No data
>   000...01: 1 x 32-bit
>   111...10: N x 32-bit
>   111...11: varlen word

Right, so revising my suggestions in light of a better understanding
of what you had in mind originally, it comes down to:

 * I think adding more bits to the size field would be worthwhile to
   allow a wider variety of future fixed length metadata tags.

 * Originally I was thinking that having a length in bytes rather than
   just a length in 32-bit words would be worth it.  But thinking
   further, there's probably no benefit.  The length rounded up to
   32-bit words is all we need for skipping over it when unknown.
   Even if we want a fixed length tag with, say, 3 bytes of data, we
   can pad that out to a 1-word tag with a reserved byte.

Ok, so more length bits and better documentation of the fixed
vs. variable distinction are the only remaming suggestions.

> > Not sure if that makes things any easier, but they might, and I'd be
> > fine with either option (or some combination).  In any of these cases
> > we do need to spell out what the requirements are: for dtb writers,
> > for dtb readers and for whoever defines a new tag.
> >=20
> > > Further more, in the code you will both a mix of both construction:
> > >   while (tag =3D=3D FDT_NOP || tag =3D=3D FDT_BEGIN_NODE ||
> > >          TAG_GET_ID(tag) =3D=3D FDT_BEGIN_NODE_REF);
> > > =20
> > > with #define TAG_GET_ID(tag) ((tag) & 0xffff0000)
> > >=20
> > > Also when we write dtbs either in libfdt or dtc, tags value
> > > have to be built with the length when needed.
> > > #define TAG_VALUE(tag_id, length) (((tag_id) & 0xffff0000) || \
> > >                                    ((length) & 0x0000ffff))
> > >=20
> > > I am totally fine with that but we need to have it in mind. =20
> >=20
> > Right, that's not a deal breaker for me - especially since I think
> > we'll need some similar stuff even with the original proposal.
> >=20
> > > Of course, I can encode FDT_PROPDATA_PHANDLE_REF with 0x8002ffff + le=
ngth
> > > field but we lose all the benefits
> > >=20
> > > Ready to see TAG_GET_ID(tag) and TAG_VALUE(tag_id, length) when neede=
d in
> > > the code? =20
> >=20
> > I think so, though that could change depending on what it ends up
> > looking like in practice.
> >=20
>=20
> Best regards,
> Herv=E9
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--uDe01GDI3ttlNJjJ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmquDecACgkQzQJF27ox
2Gc9Gw/+Kaw5IQukwQudU1tdZ2Il606I5lf7bwpZ9+f6GQN1I0ExhYzc63nWF6KU
Rr6lDUIep+t6rhO4j5V43+qvXsRtkxKhbshwT+Jcg3Wno6QcT6jBq6WlV7CdkwWQ
4zsA51MCrcvUQiaqL2BUCbfig7OML2RI2fng5v0NtAAaJf/tK+Mmo7+Il4/wIftV
5npuW9orJUJ1rz0vksIVcHLmMFsXUUGcaqUFNsZVuEZ/4mgHietQD7dUipDqfksi
nRStt7OocLMQowxLOBsUVeYWn1SKnsvTCiR12qMDC6nc3HTkIVz1P048z0o22tX4
GA5RC18Xs+vy0T8fu7QZOhV4iFYWDFZA5MiODyKaJ2NvaFNaZg+kO6r3jMmxsfex
lBZbd90Wt79iYytNwSFiZAOYlGm4nccwD3cQk8ZmOEOvOS6uqge9MClWSV5fFCgM
3oFIXnYtGLx4x2LtLYrKga484KqQf7LZOr4UCEBM2DzX5MPjiljWdSy6sI7zmS5j
p9hX374UMie3iGk7Wd74kJY0oN769n2RgDW2zXytc2p+Zhgt9a+D5JbxLJjpuPjx
UzbykDbSEivvo3a04ZXg83EqjurbgecBNON2EKiE40dCXoTllAWuEwKP+eIrqIuq
S9zW3ALTqqsSk4bVcMQmpX6fxqkjtFG5e7MOe9Le1C1rLQadQN8=
=WoIK
-----END PGP SIGNATURE-----

--uDe01GDI3ttlNJjJ--
