Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795747090;
	b=YbAfqS083c8tENOvSFn+tzLTym9oJVxTavwsSTs7/NNsybAO3IyxiYFH6mUiCvn1gQ32
	 URqE34vMyRL7n+XbgDeebUlC3p6SIBQkT+aQon1hTu3PtSvqvEVU9JCpE5/7PDZ/WR6zm
	 yBECeG4gHz80fc8frYLo21aQiokAoCsTFpldclv8T9z4Zasf/Sns/msEQyclbPRB5PIRB
	 o6y+ziX4zCbN2ABOlJOF8A9pjFsXV+k4eWvnqvN8SlKRKtNJOxcW6bSg+lZgnh/D+TDo7
	 dUk7fIETmwe6h6S4CSRqeQWFMSXR6dwZB1meUP0vlubY62luMaZT0iA6FgnDeX3priQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795747090;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=YX3+9B3waOFMQKo3fSXeQKsKIs/Fpl1Cy3EdOSSQrEg=;
	b=wbDChuLuELc1DnLkhwNVVvnjkyTg27nfPsJJ5K5W6QJwbPTHxyPUgsRAkAK3laF1Iyqj
	 id1BPqa/BpKwapO8l6taKwUZgUL1DCOUcou/qqv297jvfEQPZWzrYgABtlBKQAV8I4pGr
	 9hXA2Qz58cFMeFuSislq6IYJRgkhG4yLpzPbk9rLS+WxZKon7cb+QYRE4oc1U2qgn7emB
	 JBIzuvD4oDQ9JUfz/Dqj8CAAwcmZ/M569/YmNmUhAaqcfoZ4f/Gt7K5L9BRlBQwSz5RZB
	 pZttQ+2J9dVMKs+eCs1NR8UN3UOIeRxyf6Tq8P1HrfNq0uRwen4ioO7XESKWeHUFzAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=dFO+TxvL;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564A4606A323
	for <devicetree-compiler@vger.kernel.org>; Fri, 27 Nov 2026 02:38:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 564A4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=dFO+TxvL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1795747086;
	bh=YX3+9B3waOFMQKo3fSXeQKsKIs/Fpl1Cy3EdOSSQrEg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dFO+TxvLAP4GABjawAWMFK02cShQwYDFVk41N97qJSE48FirvsB3xmNPM+1E6YRzb
	 z4O4cyURMHuCddkIwiRomcDOAcWU87YmukJV///bwRun6A+k6mM+LQh2X2u1RugpGS
	 iAwJFvyJQpNz9+MNeFh1HkNepCJ9SfrDXJ2l9wM3P0RDP47fZoIY/CwK2L2idh7r7d
	 2yXcjNeiopnynfopvFrVkixZkfwiP/BDcLTRZ6rETGkwVhPIQ7W8C6egPeKjYrRAb+
	 cQxXVawN0EfxkYMRGS99Z1b5JIO9br5j2r+a2lvIOMgB/MX+8MtoBSsL7wtBWevtqV
	 /JaSxREfDHuPA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jbHdp1GkBz4y5g; Fri, 27 Nov 2026 13:38:06 +1100 (AEDT)
Date: Fri, 27 Nov 2026 13:30:48 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v4 01/10] tests: Check how the fragments of a dts file
 are merged
Message-ID: <awjrS4Vq1Otv0V5u@gractus.seuss>
References: <20261116235813.935070-1-sjg@chromium.org>
 <20261116235813.935070-2-sjg@chromium.org>
 <awYtBTUE2zhepJU2@gractus.seuss>
 <CAFLszTi0HPP0wXRaNB1ekcL5hK+ogp+xwz4=biHvuc8P=i5b9g@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="G+VBnvHeaoa3zvi8"
Content-Disposition: inline
In-Reply-To: <CAFLszTi0HPP0wXRaNB1ekcL5hK+ogp+xwz4=biHvuc8P=i5b9g@mail.gmail.com>

--G+VBnvHeaoa3zvi8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 10:40:07AM -0800, Simon Glass wrote:
> Hi David,
>=20
> On 2026-11-25T00:34:30, David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > > +/* A label outside the plugin cannot be used in a label-relative ref=
erence */
> > > +&{baselabel/node} {
> >
> > This seems redundant with merge-labelled-relative.dts, and arguably
> > with nmerge-first-ref-relative.dts as well.
>=20
> Actually let me be a bit more specific...
>=20
> At present the three go through different grammar actions (path
> reference, labelled reference and first reference),

Ah, ok, so it's about source coverage more than feature coverage.
That's reasonable but I think the comments need some updates for
clarity.

> which this series
> moves in separate patches, so each one checks its own patch. Once the
> series is in, the path and labelled cases both end up in merge_ref(),
> so I'll drop merge-path-relative.dts then.
>=20
> > > +/* This is an overlay fragment for the root node of the base tree */
> > > +&{/} {
> >
> > Might be worth commenting that this wasn't particularly intentional
> > and it's not clear if this difference is a good thing, although it's
> > certainly existing behaviour.
>=20
> Done in v5, in a new first patch.
>=20
> Regards,
> Simon
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--G+VBnvHeaoa3zvi8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmsI60sACgkQzQJF27ox
2Gep7g//VN7mjLGwCNZ+xqxTcVNw95Ltdot1KcRrCtZ7NLN0/DyU6TFZP2ErBK8E
E/hj2evi5yG6mmCA3hHy5MXB7Bx/qHtSH0BnOKSVFW6thB8TDpCADnn4eKW0WvO9
ban3pKdycGaSmyCpPk9Q63ctP2uJeRazSYuyEWPLGQUXZnO0tN5xOYQZf0g/PR3A
9Dh4wFKLlbmYjYOOGcO6Os4Rd80uKjO6rLBEABH8aQrYg95Cai0PYjN3OnFET3IW
PYcgTXafqxa1urgvgYv03pm526GzXiHRAcOJaqSXDcvDCCcGszI1md+FEuSNnqQw
9o87B+jmQ9K6z7PeRR8EyfKVK0xV8jlx5+dP+14mV4dfve26ueY3yfR15EEw1k0/
jLFxbeY6C7hpGaQXnqkIyF6d0mLvdilk19YKy3b2R528AjPzioWuKuQ9iOTuJ9fK
nUyHnSxBs5veNMZ5Q5dxQRlKe76p/adKm10OhggiaD8V2gfsW5TG1deuMQye/VaS
lV/bZp91HqqU67ghNUcZRnEu51eomWIbiS/VbqtgXioX6Tg64vRZWSvMUD9bl0Kz
ZaXCawaIw72p5yyJKNKdozOJHCtda3nV/O3OT/Oo5tZtlNz4lyLzIWgh5D2bQfAM
sA79n6kY47rZQ6uDtPHawmDoCxe7K36G5oS1KjEj7kGSzs4+Sw0=
=MFNj
-----END PGP SIGNATURE-----

--G+VBnvHeaoa3zvi8--
