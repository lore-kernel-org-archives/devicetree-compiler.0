Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793330209;
	b=AN3b+J6rwrYynubSs8fHDicLYcaNXHGtdSHIN8wBKTrpJ0wPUQVxS2Z6WV2BRTK/z2IE
	 xfPhnwGTXogUOnFLivnVnpxqiJGe2n7DJ8DWEzednIMq5AKzknbV9AHtuLtyJnpX1R9K1
	 flM2h0nFs12VqNm6eNVcSkwisk6GoMqPZAmPrPSkMBqSzJxDG5iTdeMtTMimWLRf31O6f
	 XXUxPxMM4FZgPOa9IxGINpo74W1lokFjknUrX1xSfK0GYgphL3Ie7M88N94HPvU/Wn8mk
	 xLZFPViG8pZFRZ7j+geEuXvPWINWJPIx4uIQpuM7LswMLyWRSTQzQzKaQkfJU01fF2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793330209;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=8e3knBK1lTv/Bw81d+8RK4RlcY6UHy+wUKbnn7aoSSE=;
	b=VaQWwgKvCaTiWz3nVrf6VsUiaZbkt1U6IMy0x4XZVEtKzQnrWpg0xWWCObbDLG0D16EL
	 DZ2yE1d34/v47+0QEkC093BWyrF5/hv0SegYcc37TYh9uHKiOx9Hctx638NAB9OJb9WQ3
	 bHQxBsNZWlVG/PBD2VTZ7yLFJxlPMNUgMp+7AkWNKAa3sSSvZpLkLmbMXrTXUH/Te8LCz
	 CswbWmsebHd0eLqmD5u5VhSNsVYqulWxLqW/xZi57vOHs3iFcK1p0n6QWfp/vIEVtPRiH
	 Moyk6cdUx36ryxz+qXC4acXougrZ3BFUxcp4z2xkAowZ2dHDhwcbLpkJV8EROgRZq0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64944606A31A;
	Fri, 30 Oct 2026 03:16:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64944606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793330194;
	bh=8e3knBK1lTv/Bw81d+8RK4RlcY6UHy+wUKbnn7aoSSE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uUX6NkEeMLs3YJCJz+5v4xKLCYWPx7SQOMQB8UJaM/vMLpT/OUZLp4THYoA3nt1ua
	 aujaO8ZVZSqRZCqVScIf1IjE7lZS04I78/Oxw9s4XZxgQZOMiomPmq17Cn6DvegeIp
	 JyHmMwHU9M6kmbBROuhe4lQAQwNE7DtRg4co2g1CWPpiOHVrQguiAOPcxnuRQDT3ic
	 tieQsEgrXs0KjNKkZ5PbBw3YRcTUwuykIF35FBy7ocWqTInTFMm0DEZpt1xVegx7qH
	 g7joHO8DwY7vomji8qHXwqatEbIA9Uok4WayX633chxxm7U330AWsTUKnqBB7D24Xo
	 t7qpdXSTnScHA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jG5q62zZXz4x4h; Fri, 30 Oct 2026 14:16:34 +1100 (AEDT)
Date: Fri, 30 Oct 2026 13:48:25 +1100
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
Message-ID: <auQFaTMTTMFZtia3@gractus.seuss>
References: <20260826083146.304291-16-herve.codina@bootlin.com>
 <arDMhoNNXcPi81sR@gractus.seuss>
 <20260925152157.511dc65c@bootlin.com>
 <as3ZWBr3wRonkxXF@gractus.seuss>
 <20261013190347.4f1d9b9d@bootlin.com>
 <atGzdxETQZ9ovJFh@gractus.seuss>
 <20261019151121.26d99f30@bootlin.com>
 <atgi4rMsw5W6kKkS@gractus.seuss>
 <20261021155923.55e48904@bootlin.com>
 <20261030010228.34d9daca@bootlin.com>
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
	protocol="application/pgp-signature"; boundary="+L6ExSd4RUogmYO8"
Content-Disposition: inline
In-Reply-To: <20261030010228.34d9daca@bootlin.com>

--+L6ExSd4RUogmYO8
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 01:02:28AM +0100, Herve Codina wrote:
> Hi David,
>=20
> I know you are busy but if you could give me your opinion on this last
> message that would be greatly appreciated.
>=20
> I've started to prepare the next iteration of the series adding support f=
or
> "structured" tags and their definition need to be stable to move forward.
>=20
> The question to answer to complete the definition of the "structured" tag
> format is: Should SAFE_SKIP bit be re-introduced?

Sorry, I lost track of this one amongst all the rest of the activity.

> IMHO, it should.
>=20
> Best regards,
> Herv=E9
>=20
> On Wed, 21 Oct 2026 15:59:23 +0200
> Herve Codina <herve.codina@bootlin.com> wrote:
>=20
> > Hi David,
> >=20
> > On Wed, 21 Oct 2026 13:26:49 +1100
> > David Gibson <david@gibson.dropbear.id.au> wrote:
> >=20
> > >=20
> > > Correct.  Btw, I know I suggested "skippable tag" as a term, but given
> > > how that gets kind of misleading in the case of writes, I'm coming to
> > > prefer the orignal "structured tag" term. =20
> >=20
> > Ok, no problem to switch back to "structured tag". On my side also, I p=
refer
> > this term.
> >=20
> > Now I think that the bit indicating if a structured tag can be skip or =
not
> > should be kept. I know the we can use "old" tag format when a tag canno=
t be
> > skipped but I thing that using structured tags for those tags can lead =
to some
> > benefit. For instance, in fdt_tag_next() we can benefit of the data size
> > encoded for structured tags for all king of structured tags (skippable =
and not
> > skippable) and retrieve the next tag without the need for parsing data =
related
> > to a tag. When tag has a string as data, without the length we have to =
scan the
> > string to find its end. Of course we can add the length if the tag defi=
nition
> > but this is automatically implied if we use a structured tag.
> >=20
> > So for structured tag, I can propose:
> > - bit 31: 1 to identify a structured tag
> > - bit 30: SAFE_SKIP bit (1 if we can skip, O otherwise)
> > - bit 29..24: Data lendth encoding
> >    0b000000: No data
> >    0b000001: 1 32bit word of data
> >    ...
> >    0b111110: 63 x 32bit words data
> >    0b111111: varlen encoding (1 32bit word added after the tag to encod=
e the
> >            data length in bytes.
> > - bit 23..0: Tag id
> >
> > Without the SAFE_SKIP bit, all structured tags must be skippable. IMHO,=
 we
> > could regret this limitation in the future.
> >=20
> > The cost of the SAFE_SKIP bit is not a lot. When we check to see if an
> > unkwown tag can be skipped, we are going to move from
> >   if (tag & 1<31)
> > to
> >   if ((tag & (1<31 | 1<<30)) =3D=3D (1<31 | 1<<30))
> >=20
> > IHMO, this is acceptable.
> >=20
> > Of course, if the SAFE_SKIP bit is re-introduced, I will also re-add th=
e test
> > checking that unknown structured tag that cannot be skipped leads
> > to an error.

So, I'm not entirely convinced either way.  However, I have a
semi-related thought that might sidestep the question for the time
being.

I think it would be a good idea to leave some bits reserved, in case
there's some more structured information we want to put in later.  One
candidate might be "invalidated-when-X-happens" type bits which we
considered when discussing the versioning.  I think we can spare the
bits, since both tag and especially id fields are pretty generous at
the moment (23 bits when our entire current existing tagset fits in 4
bits with a bunch of spare room).

For reserved bits to be safe to use later we must insist and enforce
that they be 0 for now.  That means setting any reserved bit
effectively makes it a non-skippable tag for the time being.  Or to
put it another way, that means we can amongst other things add an
(inverted) SAFE_SKIP bit in future if we discover we want it.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--+L6ExSd4RUogmYO8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrkBWkACgkQzQJF27ox
2GdpZQ//RMTrBRIjdiqNUnQ5C3aTzAs0dse2m00eZoCKI3fJ545In2eww6iK5Bon
X1G6h7YdYghy6HMOwHDXVqdrwtl2tCdgtBFb7cLzu/c89XUBH/+UiTP1MhnLHG4T
6zykRb5Eou2quSUTDvbza+jD0xelk4QD/6MQt/iE9N2kic2IHQu371iPIJXA0am4
Ng3lrGND6rWKFMi0rFP0K2XiLZYOb5xqSL5cAloOHeW82Itpj548U5fTvdSWetQy
Ac6oHqD8rdb1z+uywOOEVtSxSIcsPiNN8sV/InCpUKfIotvKjm6pBVhY3yzCpKQn
JqNRtWRTKJTtxgdMQj42Y70yzVq2bEUKTR3nXKXyvw57UpcM4i/UmwTVkINq0zNv
btSHV72eRiZFqAkfO9D1pxhcpWdJmPVRQ1zw/uiONkFdkRXbUXWc64GZMw9yLBhm
xiXJfFGJVokTkHC/qOWgbgKRGrNx+ix/cg2yI55ROqdCiPGq+fVTeWipgpJOzQSV
oSjFa20THhg3byDetaxs8HsAZgzc6tIip3wPSw2D7JE6BCCzgphcF00DghIbU8qY
/pxhKZTmE3+BXraxTfR8P1dx0KUYa3czb0XOPARfrTXcGvE1KEMFmEIn8hDCtxCz
aWENR3ZE/8gd7HtAYQEMtsX6Y2fEhspbyTCuVW8afofIxoB9/GY=
=LjmP
-----END PGP SIGNATURE-----

--+L6ExSd4RUogmYO8--
