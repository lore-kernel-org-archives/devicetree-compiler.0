Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793607973;
	b=VbRUsZQaL72+WAnFfViwbVSg14O6DAy16w1yd4NCdVdaR1FIbtd/Q5olIUJs2+vLChJG
	 Bnqw79A0EGZzR9qXdDdx/QfYEVJKHQ+3+0+K5B1ivyWLL7CWEPvGEp1iHi0gA8CkyfE1o
	 vQqrut+KiUBuiD6wiggXKtQnBcvsLpt4W8C4mcV9lFWxSY6xTeWxS7izbsIM9Hl4UMBsD
	 LsXbiu7SRm1sORZFvPovOQ+S/V2PpoK8z1OZBQvB08gA/gNlpVUlxVS+AQJS84snOvxyv
	 QxQ4xKOZrWTFwFNgPdqzdGB8RbcVd4BBn02FQvdC1vy433EC9NbOuH4Yz9SrH8pDuYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793607973;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=LmbTeJEzBzXlcyzTHKFNAOeC+nK3QUSqReZt3QjpQ/E=;
	b=E/urw7NGn7/MErvYFlmnsJu89CZK5CLkPsBTCJM3XKgH3GtzyH4F85KLIwuHDIhLN3CD
	 K4jdhoYJaTuHslfPssFyUZ7jwxwICnor5pGztdcwV53lHcsfRl8cp6/sIcWwYjRL0mKCd
	 DSPa81OeTEyKiCywLHDpe8umBSbKQnQPVlEnJHh2HQG8joM1oPEVSAXTFDHR/lYN9yRwJ
	 MTNFjosicUcOTPPLY4cZcvx5cshM6LC86iXiXyWgBZWyQ7AvZtxePgT4Y8C8jap8MqHaZ
	 kiZM6MxSuAWjHg41zM2/o5eLmpwZ0cz2l4DU/cORI6IIwW1feYJqQDbL/yn/BLESLgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=sVpw3qvF;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FEB606A333;
	Mon,  2 Nov 2026 08:26:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97FEB606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=sVpw3qvF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793607969;
	bh=LmbTeJEzBzXlcyzTHKFNAOeC+nK3QUSqReZt3QjpQ/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sVpw3qvFs8W8j5iDWXkBbgd7Yni7/I3I0l8UUZO+CQwHMzM/k1lk+zigbqZQjwV41
	 v1MOLEgExHg7JTvdBZrgDopeO//fq0PEE4+PkVQy8VEatTJriDTJgaaIs4KV0356Sr
	 ihNcYIlAaRVh0NEWEe0ZerqAcPpgyKkEObLRCrr280Q3PVbmFgFoT8gTszUrkEuuuI
	 iAShe+XeyoT/GikRQVxryKk+632+Jwdi++zby/ikDVzxH3laKPX7pIEq/CqSSEjzan
	 grK1l6kXC/XfO5Zze74hCu6Q8/ZHGeMBKF+4JW2zfulEdP1PyL/jJe5v28F+zYCC3u
	 wno2GB77TpJPg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jJ4Xx3PHlz4w26; Mon, 02 Nov 2026 19:26:09 +1100 (AEDT)
Date: Mon, 2 Nov 2026 19:25:59 +1100
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
Subject: Re: [PATCH v3 15/15] Introduce v18 dtb version
Message-ID: <auhJAE7kQMk1iSZp@gractus.seuss>
References: <20260925152157.511dc65c@bootlin.com>
 <as3ZWBr3wRonkxXF@gractus.seuss>
 <20261013190347.4f1d9b9d@bootlin.com>
 <atGzdxETQZ9ovJFh@gractus.seuss>
 <20261019151121.26d99f30@bootlin.com>
 <atgi4rMsw5W6kKkS@gractus.seuss>
 <20261021155923.55e48904@bootlin.com>
 <20261030010228.34d9daca@bootlin.com>
 <auQFaTMTTMFZtia3@gractus.seuss>
 <20261030092717.2039a8b4@bootlin.com>
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
	protocol="application/pgp-signature"; boundary="wGNNPYpwVMLSmE1T"
Content-Disposition: inline
In-Reply-To: <20261030092717.2039a8b4@bootlin.com>

--wGNNPYpwVMLSmE1T
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 09:27:17AM +0100, Herve Codina wrote:
> Hi David,
>=20
> On Fri, 30 Oct 2026 13:48:25 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Fri, Oct 30, 2026 at 01:02:28AM +0100, Herve Codina wrote:
> > > Hi David,
> > >=20
> > > I know you are busy but if you could give me your opinion on this last
> > > message that would be greatly appreciated.
> > >=20
> > > I've started to prepare the next iteration of the series adding suppo=
rt for
> > > "structured" tags and their definition need to be stable to move forw=
ard.
> > >=20
> > > The question to answer to complete the definition of the "structured"=
 tag
> > > format is: Should SAFE_SKIP bit be re-introduced? =20
> >=20
> > Sorry, I lost track of this one amongst all the rest of the activity.
> >=20
> > > IMHO, it should.
> > >=20
> > > Best regards,
> > > Herv=E9
> > >=20
> > > On Wed, 21 Oct 2026 15:59:23 +0200
> > > Herve Codina <herve.codina@bootlin.com> wrote:
> > >  =20
> > > > Hi David,
> > > >=20
> > > > On Wed, 21 Oct 2026 13:26:49 +1100
> > > > David Gibson <david@gibson.dropbear.id.au> wrote:
> > > >  =20
> > > > >=20
> > > > > Correct.  Btw, I know I suggested "skippable tag" as a term, but =
given
> > > > > how that gets kind of misleading in the case of writes, I'm comin=
g to
> > > > > prefer the orignal "structured tag" term.   =20
> > > >=20
> > > > Ok, no problem to switch back to "structured tag". On my side also,=
 I prefer
> > > > this term.
> > > >=20
> > > > Now I think that the bit indicating if a structured tag can be skip=
 or not
> > > > should be kept. I know the we can use "old" tag format when a tag c=
annot be
> > > > skipped but I thing that using structured tags for those tags can l=
ead to some
> > > > benefit. For instance, in fdt_tag_next() we can benefit of the data=
 size
> > > > encoded for structured tags for all king of structured tags (skippa=
ble and not
> > > > skippable) and retrieve the next tag without the need for parsing d=
ata related
> > > > to a tag. When tag has a string as data, without the length we have=
 to scan the
> > > > string to find its end. Of course we can add the length if the tag =
definition
> > > > but this is automatically implied if we use a structured tag.
> > > >=20
> > > > So for structured tag, I can propose:
> > > > - bit 31: 1 to identify a structured tag
> > > > - bit 30: SAFE_SKIP bit (1 if we can skip, O otherwise)
> > > > - bit 29..24: Data lendth encoding
> > > >    0b000000: No data
> > > >    0b000001: 1 32bit word of data
> > > >    ...
> > > >    0b111110: 63 x 32bit words data
> > > >    0b111111: varlen encoding (1 32bit word added after the tag to e=
ncode the
> > > >            data length in bytes.
> > > > - bit 23..0: Tag id
> > > >
> > > > Without the SAFE_SKIP bit, all structured tags must be skippable. I=
MHO, we
> > > > could regret this limitation in the future.
> > > >=20
> > > > The cost of the SAFE_SKIP bit is not a lot. When we check to see if=
 an
> > > > unkwown tag can be skipped, we are going to move from
> > > >   if (tag & 1<31)
> > > > to
> > > >   if ((tag & (1<31 | 1<<30)) =3D=3D (1<31 | 1<<30))
> > > >=20
> > > > IHMO, this is acceptable.
> > > >=20
> > > > Of course, if the SAFE_SKIP bit is re-introduced, I will also re-ad=
d the test
> > > > checking that unknown structured tag that cannot be skipped leads
> > > > to an error. =20
> >=20
> > So, I'm not entirely convinced either way.  However, I have a
> > semi-related thought that might sidestep the question for the time
> > being.
> >=20
> > I think it would be a good idea to leave some bits reserved, in case
> > there's some more structured information we want to put in later.  One
> > candidate might be "invalidated-when-X-happens" type bits which we
> > considered when discussing the versioning.  I think we can spare the
> > bits, since both tag and especially id fields are pretty generous at
> > the moment (23 bits when our entire current existing tagset fits in 4
> > bits with a bunch of spare room).
>=20
> Yes, I agree.
>=20
> > For reserved bits to be safe to use later we must insist and enforce
> > that they be 0 for now.  That means setting any reserved bit
> > effectively makes it a non-skippable tag for the time being.  Or to
> > put it another way, that means we can amongst other things add an
> > (inverted) SAFE_SKIP bit in future if we discover we want it.
> >=20
>=20
> Yes indeed.
>=20
> The structured tag definition becomes:
>  - bit 31: 1 to identify a structured tag
>  - bit 30..24: Reserved (7 bits)
>                Those bits are reserved for future use. They must be clear=
ed (0 value).
>                If any of these bits is set, an error should be reported.
>  - bit 23..18: Data length encoding (6 bits)
>      0b000000: No data
>      0b000001: 1 32bit word of data
>      ...
>      0b111110: 62 x 32bit words data
>      0b111111: varlen encoding (1 32bit word added after the tag to encod=
e the
>                data length in bytes).
>  - bit 17..0: Tag id
>=20
> Is this mapping ok on your side?

Sounds good, thanks.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--wGNNPYpwVMLSmE1T
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmroSQAACgkQzQJF27ox
2GdUfg/+J0RDKs/bqrklL0Tgzf61BXzcBgD2wOhOhviA51paXbMPNqUhWfJnkWGO
CoE5tsMTN/90JIxKRKIawT5SvbmhUpz6nrOJJiQ/Pjy8UI0bM8UYoyzQ4gs+i2qw
oyb5k/HEMFuWUY0z339jO3lcdTowIn1VpiZRnttUdQn0QrgfwFQn4gW6FWQMb5+N
SEaLYBBrrT8sCaNx9TEs+zHVarsnufqpjG1zxytaCpaf7cvpnhxPFMGnw6nxHmzf
3Xzj742rRUSwttuvpBLZYDyCKJ1cg1xzBqH1wayA8yIVNKFge2zwNlLEXLVCsRV7
sY+q697P1zF1jwRVqqaAxcW33QX6jGWM6Stfj53WzinQsqd/ckOxgPs1I7M0Fei6
Nc0sxx408DXQA0hT04uRxG3n/cBNrn7yL2ZL1SSb/YnXt6MDM0q8REC9jLGV35TP
kl0nRptw89/z+PMbuojapv59Jy1x5KgQ359Tlf4KcyaM/kNgkshV+I1xPuEzG4bU
IsM06KB3Y42TuX4zW9Zde1MDODU1bWWiVpNaYdoASKJ+EV9eN/4KD6ryUFkcr7G8
e/Vh7QEmvXPi0MqT5DBkK0Mdi+xg6P2H6de6yMGpuoEpdqi01bqhrl/8teFUis1f
RFR1KElGoRU+eeNAX2dzGRdI30YkMlozrRL4i7i1KA3aH9iQ2JY=
=YCLM
-----END PGP SIGNATURE-----

--wGNNPYpwVMLSmE1T--
