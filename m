Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CB73815E8;
	Sat, 26 Sep 2026 05:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790398829; cv=none; b=KAf02pKLsDNzdVtOExTeW8DcjxcGd8wJcGGBJ4F7vWHStsP5NIXZvT4yjlPCI6aWdVI+S+gST+CbEsclQdftcqC8CjInXn4dOHhuQuJxc4YKK/txcg4UjLgho8sFXReSxKN35Vu/lwNHCQNZJ+Iur0DJenE71ErCKA4/sZ9/Mwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790398829; c=relaxed/simple;
	bh=/jtgJgRXhAkk/SlLAZWZd8hMSjAEXNOtPCsSKHFwKbs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XSNVuRYiMe2yu1cmtAzCd4d4jdFy53GtYjNpl6tGRY9yDy68NW31XlCBPyTdjrysz1qmmZNQt31c5xy79haVUQIqIkjEg3gbGqmd6Q5S8LygHstsQ3XyUcr/vuiNYYJRArCzGk+1i+DsXSwy8WRqxoRkMqNGkZnifUaK/v1VBjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=t3k5w99m; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="t3k5w99m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202608; t=1790398790;
	bh=/P+6p234LtRAyYXgjZ+Y6deMvplpmyhu70fuAd+c/eE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t3k5w99mV57hX40GWXKcqTm/rL/sAG1AO+8mYbtHXEyuyYbKeaDKMM5ygnJbTVjYj
	 VNLseLWWinQ1ufmI/lNVx/BLjZAZTSZGuvJ9rO/lQVpjdM+vckWzDkKric0lz1JlhS
	 SnpTuczH3te/dP94UVlBqmX71D0DjDFN8AbiP47XVyqZR9rb9LUYZBWcsPFvMNE5bG
	 AGU1CuPB6vvITAkhjviuhJMEeam6PnWhMSqpRM8ngSYc/z3JDwcSiRgzB1wSTP+ii4
	 xAHQHMaJAHzfQtvu2RzNxJyBwV2IpNbENmOmIKQ/A82kaWkERHqsGxUpqEZzJjGYk2
	 anX6lg0m5aj1g==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4hsFjy0hZ1z4wD3; Sat, 26 Sep 2026 14:59:50 +1000 (AEST)
Date: Sat, 26 Sep 2026 11:49:48 +1000
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
Message-ID: <arckqmMyr0vSlLQG@gractus.seuss>
References: <aqS6HmkaVYbrePtN@gractus.seuss>
 <20260914121937.5b7fa2bb@bootlin.com>
 <aqonNkbVqW9tf6Bg@gractus.seuss>
 <20260917090450.770c107a@bootlin.com>
 <aqzA11pFzN_3_Nhf@gractus.seuss>
 <20260918101617.46b3477e@bootlin.com>
 <aq4N5zbuCVZ4e6-C@gractus.seuss>
 <20260922084154.576a42d0@bootlin.com>
 <arSdrp6WtJfdiAne@gractus.seuss>
 <20260925124831.75789c4d@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ol/Z17HehxiQTHnw"
Content-Disposition: inline
In-Reply-To: <20260925124831.75789c4d@bootlin.com>

--ol/Z17HehxiQTHnw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 12:48:31PM +0200, Herve Codina wrote:
> Hi David,
>=20
> On Thu, 24 Sep 2026 13:49:55 +1000
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Tue, Sep 22, 2026 at 08:41:54AM +0200, Herve Codina wrote:
> > > On Sat, 19 Sep 2026 14:22:09 +1000
> > > David Gibson <david@gibson.dropbear.id.au> wrote:
> > >  =20
> > > > On Fri, Sep 18, 2026 at 10:16:17AM +0200, Herve Codina wrote: =20
> > > > > Hi David,
> > > > >=20
> > > > > On Fri, 18 Sep 2026 14:41:11 +1000
> > > > > David Gibson <david@gibson.dropbear.id.au> wrote:
> > > > >    =20
> > > > > > On Thu, Sep 17, 2026 at 09:04:50AM +0200, Herve Codina wrote:  =
 =20
> > > > > > > Hi David,
> > > > > > >=20
> > > > > > > On Wed, 16 Sep 2026 15:21:15 +1000
> > > > > > > David Gibson <david@gibson.dropbear.id.au> wrote:
> > > > > > >      =20
> > > > > > > > On Mon, Sep 14, 2026 at 12:19:37PM +0200, Herve Codina wrot=
e:     =20
> > > > > > > > > Hi David,
> > > > > > > > >=20
> > > > > > > > > On Sat, 12 Sep 2026 12:34:24 +1000
> > > > > > > > > David Gibson <david@gibson.dropbear.id.au> wrote:
> > > > > > > > >=20
> > > > > > > > > ...
> > > > > > > > >        =20
> > > > > > > > > > > Do you mean that we should avoid the DATA_LEN_ENCODIN=
G and always have the
> > > > > > > > > > > 32-bit value right after the tag to give the size for=
 all "skippable" tags?         =20
> > > > > > > > > >=20
> > > > > > > > > > Yes.
> > > > > > > > > >        =20
> > > > > > > > >=20
> > > > > > > > > I did a test using a dts file available in kernel sources=
=2E I used (arbitrary
> > > > > > > > > choice) juno.dts [0].
> > > > > > > > >=20
> > > > > > > > > Without any new tags, the size of the compiled dtb is 270=
67 bytes.
> > > > > > > > >=20
> > > > > > > > > With new metadata tags identifying phandles in properties=
 (FDT_PROPDATA_PHANDLE),
> > > > > > > > > the size of the dtb becomes 29027 bytes and so 29027 - 27=
067 =3D 1960 bytes for
> > > > > > > > > those FDT_PROPDATA_PHANDLE tags (+7.2%).
> > > > > > > > >=20
> > > > > > > > > The tags used are composed of:
> > > > > > > > > 32-bit: FDT_PROPDATA_PHANDLE value encoding 1 x 32-bit fo=
r data
> > > > > > > > > 32-bit: offset in the property where a phandle is present.
> > > > > > > > >=20
> > > > > > > > > Removing the '1 x 32-bit' information from the tag value =
and adding a 32-bit
> > > > > > > > > 'length' in all cases will lead 3 x 32-bit values for a F=
DT_PROPDATA_PHANDLE
> > > > > > > > > tag (tag + length + offset) instead of the 2 x 32-bit (ta=
g + offset).
> > > > > > > > >=20
> > > > > > > > > Back to juno.dts instead of 1960 bytes, the FDT_PROPDATA_=
PHANDLE will need
> > > > > > > > > 1960 * 3 / 2 =3D 2640 bytes (+9.7%). This leads to around=
 +2.5% of the whole
> > > > > > > > > dtb just to have the 32-bit for length. This +2.5% can be=
 easily avoided.
> > > > > > > > >=20
> > > > > > > > > Also, I will not be surprised to see more tags in the fut=
ure adding some more
> > > > > > > > > metadata information and so increasing dtb sizes.
> > > > > > > > >=20
> > > > > > > > > Quite often you have mentioned memory constraints system =
where libfdt should
> > > > > > > > > be as small as possible. On those system, the dtb itself =
is embedded in the
> > > > > > > > > binary close to libfdt. The size of dtb should be taken i=
nto account.       =20
> > > > > > > >=20
> > > > > > > > Yeah, those proportions are high enough that I think it's w=
orth it.
> > > > > > > >      =20
> > > > > > > > > If the SAFE_SKIP bit is removed, I even plan to use this =
now free bit in the
> > > > > > > > > length encoding part:
> > > > > > > > >   0b000: No data
> > > > > > > > >   0b001: 1 fdt32
> > > > > > > > >   0b010: 2 fdt32
> > > > > > > > >   ...
> > > > > > > > >   0b110: 6 fdt32
> > > > > > > > >   0b111: On additional fdt32 to encode the length of data.
> > > > > > > > >=20
> > > > > > > > > IHMO, length encoding bits in tag value definition should=
 be kept and used
> > > > > > > > > for all tags where the length is fixed and can be encoded=
 using
> > > > > > > > > these bits.       =20
> > > > > > > >=20
> > > > > > > > Well, I'm convinced we want some sort of compact encoding o=
f the
> > > > > > > > length, but I think we can do better than the current propo=
sal.  It
> > > > > > > > seems implausible to me that we'll need 2^29 different meta=
data tags,
> > > > > > > > so I think we can spend some more of the tag bits on the le=
ngth.  How about:
> > > > > > > >=20
> > > > > > > >    0x80000000		structured tag bit
> > > > > > > >    0x7fff0000		tag type
> > > > > > > >    0x0000ffff		tag length
> > > > > > > >=20
> > > > > > > > So we have up to 2^15 (32k) different structured tags each =
with a
> > > > > > > > length of [0..65534] bytes (length=3D=3D65535 reserved for =
those that need
> > > > > > > > a full 32-bit length word).
> > > > > > > >=20
> > > > > > > > I believe that will avoid the extra length word for everyth=
ing you
> > > > > > > > have currently drafted.
> > > > > > > >      =20
> > > > > > >=20
> > > > > > > Yes, this will avoid the extra length field. The drawback is =
the that the
> > > > > > > tag value is no more a well fixed value. Each time we have to=
 check the tag
> > > > > > > value we have to filter out the tag length.
> > > > > > >=20
> > > > > > > For instance:
> > > > > > > - FDT_PROPDATA_PHANDLE
> > > > > > >   fixed data size 4 bytes for offset
> > > > > > >   tag value: 0x80010004
> > > > > > >=20
> > > > > > > - FDT_PROPDATA_PHANDLE_REF
> > > > > > >   data: 4 bytes for offset + N bytes for a string
> > > > > > >   tag value 0x8002ssss with ssss for the size
> > > > > > >=20
> > > > > > > This will lead to code like this:
> > > > > > >   tag =3D fdt_next_tag();
> > > > > > >   if (tag =3D=3D FDT_PROPDATA_PHANDLE)
> > > > > > >     /* Do something */
> > > > > > >     =20
> > > > > > >   if (TAG_GET_ID(tag) =3D=3D FDT_PROPDATA_PHANDLE_REF)
> > > > > > >     /* Do something */     =20
> > > > > >=20
> > > > > > True.  But.. a similar problem kind of exists with the original
> > > > > > proposed encoding too: we *expect* a tag with fixed 4-byte cont=
ents to
> > > > > > use the "1 cell" flags, but we need to consider the case of enc=
oding
> > > > > > it as VARLEN with a length field of 4.  We could choose to make=
 that
> > > > > > forbidden, but we'd still need to consider who's responsible for
> > > > > > enforcing that.
> > > > > >=20
> > > > > > Similarly, if a variable length metadata tag happens to have le=
ngth 4
> > > > > > or 8 in a particular place, is it valid to encode it with the 1=
-cell
> > > > > > or 2-cell flag?   =20
> > > > >=20
> > > > > My position was: if we expect a tag with "1-cell" flag, using var=
len
> > > > > field encoding is considered as an other tag and so either an err=
or
> > > > > or a skippable unknown tag.   =20
> > > >=20
> > > > So essentially tags of different (fixed) length live in different
> > > > namespaces.  Ok, that makes good sense to me, but wasn't initially
> > > > obvious to me.  So, I think we need to spell this out a bit better.
> > > >  =20
> > > > > The same apply for varlen defined tag. Even if the data is, let's
> > > > > say 8 bytes, the tag cannot be moved to a "2-cells" tag.
> > > > >=20
> > > > > The kind of data length encoding (1-cell, 2-cells, varlength) is =
done
> > > > > when the tag is defined and cannot be changed.
> > > > >=20
> > > > > Who is responsible for enforcing that ?
> > > > > I would say the documentation of the tag should clearly set the d=
ata
> > > > > encoding used for the tag and the documentation of the "skippable"
> > > > > format should say that data encoding is fixed for a given tag. It=
 is
> > > > > set when the tag is defined and any changes at runtime should be
> > > > > considered as a different tag.
> > > > >=20
> > > > > Of course we can introduce dynamic length encoding to set the dat=
a length
> > > > > encoding in the tag according to the exact data length found at r=
untime.
> > > > >    =20
> > > > > > As a variant on my proposal, I'd also be fine with dividing the
> > > > > > structed tags into several classes with bits indicating which is
> > > > > > which.  Either:
> > > > > >=20
> > > > > >  * "short" vs "long": "short" always has the length within the =
tag
> > > > > >    word (and so cannot exceed 64k, or however many bits we set =
aside)
> > > > > >    whereas long always has a length word
> > > > > >  * "fixed" vs "variable", fixed length tag types always have th=
e same
> > > > > >    length, so the length can be considered part of the tag.  Va=
riable
> > > > > >    would have a length word.   =20
> > > > >=20
> > > > > Well, only strings, or more generally arrays, need a varlen. For =
those
> > > > > item, I would use the varlen word and so "long" in your definitio=
n.
> > > > >=20
> > > > > For all others where the sizeof(data) is well known when the tag =
is
> > > > > defined, I would use "fixed" and "long" only if sizeof(data) cann=
ot
> > > > > be encoded by "fixed" (lengh > limit of dedicated bits).   =20
> > > >=20
> > > > Right, now understanding your thoughts on the originally proposed
> > > > encoding, the "fixed" versus "variable" distinction makes more sens=
e I
> > > > think.  I do see the advantage of never having a variable length
> > > > encoded within the tag word.
> > > >  =20
> > > > > Without any additional bits for any category, all of these fit wi=
th the
> > > > > following length encoding:
> > > > >   000...00: No data
> > > > >   000...01: 1 x 32-bit
> > > > >   111...10: N x 32-bit
> > > > >   111...11: varlen word   =20
> > > >=20
> > > > Right, so revising my suggestions in light of a better understanding
> > > > of what you had in mind originally, it comes down to:
> > > >=20
> > > >  * I think adding more bits to the size field would be worthwhile to
> > > >    allow a wider variety of future fixed length metadata tags. =20
> > >=20
> > > Right, I have planned to add one more bit compared to the original pr=
oposal.
> > > This leads to 3 bits and so 0 to 6 32-bit data words (0b111 means var=
len word).
> > >=20
> > > Do you think we should add one more bits? =20
> >=20
> > I don't think we particularly need them for the tag type, so yes, I
> > think that would be worthwhile.
> >=20
> > > >  * Originally I was thinking that having a length in bytes rather t=
han
> > > >    just a length in 32-bit words would be worth it.  But thinking
> > > >    further, there's probably no benefit.  The length rounded up to
> > > >    32-bit words is all we need for skipping over it when unknown.
> > > >    Even if we want a fixed length tag with, say, 3 bytes of data, we
> > > >    can pad that out to a 1-word tag with a reserved byte. =20
> > >=20
> > > The varlen word could be kept in bytes. =20
> >=20
> > The varlen word _must_ be kept in bytes.
> >=20
> > > > Ok, so more length bits and better documentation of the fixed
> > > > vs. variable distinction are the only remaming suggestions. =20
> >=20
>=20
> So the name "structured" tag will be replace my "skippable" tag. I don't
> want to use "metadata" because we don't know if future tags will be only
> metadata tags or something else that shouldn't be qualified by "metadata".
>=20
> Skippable tag format:
>   - bit 31: set to 1
>       Indentify a skippable tag.
>   - bits 30..24: Data length encoding
>       Encode the length of data attached to the tag.
>       0b0000000: No data
>       0b0000001: 1 32-bit word
>       0b0000010: 2 x 32-bits words
>       0b0000011: 3 x 32-bits words
>       ...
>       0b1111101: 125 x 32-bits words
>       0b1111110: 126 x 32-bits words
>       0b1111111: varlen encoding. The length of data is encode by an 32-b=
it
>                  word available right after the tag. This word gives the
>                  length of data in bytes.
>=20
>   - bits 23..0: Tag identifier
>=20
> The full tag value are used to identify a tag. Two skippable tags with the
> same tag identifier field but with different data lengh encoding should be
> considered as two different tags.
>=20
> The exact tag value is completely known when the new tag is defined and i=
ts
> data length encoding must not be determine at runtime when the exact leng=
th
> of data is known.
>=20
> Any tags where the length of the data is not known when the tag is defined
> (i.e. sizeof(data) cannot be determined when the tag is defined) must use=
 the
> varlen encoding value (0b1111111). Tags with strings or arrays where the =
number
> of items in the array can vary should use the varlen encoding.
>=20
> Also for tags where the length of data is greater than 126 x 32-bits words
> (maximum value without using varlen encoding), the varlen encoding must b=
e used
> even if the length of data is known when the tag is defined.
>=20
> Tags reserved for tests purpose:
>   Any tags with the tag identifier set to 0xffffff are reserved for test
>   purpose. When a parser find this kind of tag, it must ignore the tag (s=
kip
>   it). A generator must never use this kind of tags, except, of course, if
>   the generator is used to generate a dtb for test purpose.
>=20
>=20
> What is you opinion about this description?
> Do you agree on the description? If so I will implement it on next iterat=
ion.

Sounds good, thanks for the revisions.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--ol/Z17HehxiQTHnw
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmq3JKoACgkQzQJF27ox
2GcWJQ/+KsRx+VoHwomzWiIJcKO7l7LncFZ8sOm7+PKf+m4q4EMkDmJBanKffaBW
qNtU36i291GmPR93WneAyAylmUFrPYo4TbKuPTbp/4U2b7u+vJ1wpn2t+O1A2Llb
H28u1y5TCcTyPjBwDdjt0iOVrJ30Teb7WgvvB9pEv/iH4BE1F4tS1M8MZoxLl57G
HuWmCPRkBgJ6V923/P1zJez3yg6ff26XFTQ/PtdTtIUkCtxxsL8mnrKTalRgLCL6
pfxaez0BAnbh7WW1/GbRbXOcn9UH97J9C4dTAmJqp6lmBcxyCChN/8IFFt+Z9jcn
ryMGFnR/mtez3oB5QHvynN9FeIckJnkbLncukeHX4hW/sGsDDDKy5uEZS2xwnC6U
lEcDbuLFqy32y+Mo1mnvqXHMUdUdVEb+hd8fEDFKG+3ymj6947LHYocphklFD49u
RMg3lMDIq31DhF43L82GTqpi6WV+C5yNnqmcBOz0ZfL1fRdFdpsubgeOSsfjrOar
K4MAkfcAIAdsYCH7b2agpbxeGN2C/SNg649nFL4rYldtgGHJ6wcflAcSzxsLk5Xw
xQjhAL9ry+QCXquIqTjUKXPm22ngNBAoqhjxR9klPw3dn6ohhD7KGQI8YLbLQZKd
MDgnDnLch+Gvk65NJ3EoUR2xSb0mpnILS9IPk10ZkAAQeWP872g=
=klca
-----END PGP SIGNATURE-----

--ol/Z17HehxiQTHnw--
