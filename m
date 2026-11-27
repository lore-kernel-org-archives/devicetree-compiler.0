Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795747094;
	b=2ZJv0EH4qbDqf30NTTfsxncwbkuODtFnK2dXkHnejTpECFVp56ujr4d6USFIm6aMevk3
	 JPz5+/sVNu8JGN4F2BNmkvwTLxEkdeK+Dm6rnHrf3BJ15GcdVX77jE+DZ6IWYpJZG8ZeZ
	 kLm/eykR3ZMlFKni2HYc2xRZJRWVt3pLoZpDdvdY9utdC/ZOk2Fk3JaLO+0SWChlUJRIh
	 jdQr4TmAwg3JjG0+j1cZmRk8/NvaLzkDg3ONm7/PSMa2s7uFFqPh9VE8U2H8HzGhOOFHJ
	 G7QIv2QMJmtqFdk1zOpDnCXGi85rhwSiSgo+g+g+3KfuqfNEL7hKnluCbCjBvfxMH8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795747094;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=OE+kx1DRdVhFyZftT/J17q1eAKnfRVS7HAaxJaOmzkM=;
	b=Lc1nmHeagItWUGKHGG2znVMSpi6WiRiSNjTNnn6AiBQpNJOpLBY7iLXE28YaVjLuQRsp
	 8pZl/tNVQqeJBPkIOmzY7sjQivMu0gGtUB8XLadwD4NpMCtWYjveKM+Pk7hX8HDgiS/l5
	 9zQt/kL6OyZHpzQA2Q+ApOsPi3bZykGrZ69D1JRFVL5nQIJjcf/gFqgIzZ/6fHDRLfXNx
	 E95vDKQ3nh4nizk+2PrViTDDYdiIUM1aXEqFns0pVtZsYuicj588Femz+WhR5PC6jOdq7
	 5UoNZNUChyiK7nnh488VcuECFT3onJGjP9tqaDe5Rh6k560/lh3UjIatPT24ya5iMQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562FE606A31C
	for <devicetree-compiler@vger.kernel.org>; Fri, 27 Nov 2026 02:38:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 562FE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1795747086;
	bh=OE+kx1DRdVhFyZftT/J17q1eAKnfRVS7HAaxJaOmzkM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hONrsu8AMuDLdH+mKnyEAkINPQqVRBcy+x0vpy4AzgA9UM6cZUfLmKUfV73VbUoKc
	 1TZ7rwDb660Kh+68o1o93CzK4BGKWxTAEwK2FzkXsE3Pw+pevHBHIhMFSFuY1FM/B+
	 A/znMfl+Jf8B8y8EzT7YyMer16a5j0EVJ4ClQyrX+UWtDkbAmywFlnb8Mln84Hhuo2
	 tIgoUpP7U5kxM6bv21OlSbM/LShzXvBWoJ+KNo6kAyCqGkPYIt+X2chTLbC5BY1mBH
	 EyLBlBa4Eo7/RCE+POpZhgHL4FbKcEeQ7krYrq2pS7ghZENS/aLJPK7BkE4Y8t7qk8
	 VtRwrbDGXlGng==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jbHdp1Bztz4whs; Fri, 27 Nov 2026 13:38:06 +1100 (AEDT)
Date: Fri, 27 Nov 2026 13:29:23 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Simon Glass <sjg@chromium.org>,
	Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Subject: Re: [PATCH v4 02/10] dtc: Add a struct for the top-level fragments
 of a dts file
Message-ID: <awjq9pu5MKwQYlk4@gractus.seuss>
References: <20261116235813.935070-1-sjg@chromium.org>
 <20261116235813.935070-3-sjg@chromium.org>
 <awYvRAeiVSO9f0ls@gractus.seuss>
 <CAFLszTjALSPc+oJ7uVYaqZoPxUKJ0ggKSB2LU_QhyohSVaSyLw@mail.gmail.com>
 <20261126213615.030c2366@bootlin.com>
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
	protocol="application/pgp-signature"; boundary="np8D8oiMOrOdjgbt"
Content-Disposition: inline
In-Reply-To: <20261126213615.030c2366@bootlin.com>

--np8D8oiMOrOdjgbt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 09:36:15PM +0100, Herve Codina wrote:
> Hi Simon, David,
>=20
> On Thu, 26 Nov 2026 10:34:24 -0800
> Simon Glass <sjg@chromium.org> wrote:
>=20
> > Hi David,
> >=20
> > On 2026-11-25T00:44:05, David Gibson <david@gibson.dropbear.id.au> wrot=
e:
> >=20
> > > After consideration of our previous discussions, I'm leaning towards
> > > using the term "source layer" for these top level components (thanks
> > > for the "layer" suggestion).  It's more verbose than I'd like, but I
> > > think disambiguating from dtb level "fragments" is worth it. =20
> >=20
> > OK, done in v5, through the series. The struct is struct source_layer,
> > but to keep the lines short the helpers just say 'layer':
> > build_layer_ref(), free_layer(), LAYER_NODE and so on. Let me know if
> > you would prefer source_layer throughout. 'Overlay fragment' and
> > fragment@N are unchanged.
> >=20
>=20
> Maybe late but "snippet" instead of "source_layer" or "layer" comes in my
> mind.
>=20
> Could this "snippet" make sense?

Eh.  "snippet"s not a bad idea, but I prefer "source layer" even
though it's longer.

1) To me "snippet" suggests something small, but the layers can be an
   entire dt
2) "layer" at leasts hints at the correct merge semantics: later
   layers "cover" (overwrite) earlier layers.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--np8D8oiMOrOdjgbt
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmsI6vYACgkQzQJF27ox
2Ge5QA//SZ+gDFO4xa5rmnlSKuhdKjg5G+kL6GGmzUuQlmhvP4R7ThDyMv+9RZTg
IsI2BC2wDsCjVWvOfpYG77fDn2XEO1lxc8Lyawa9g1iiaZ67L3Kfac+hD8A4Jwji
YwWHiyvOOXXY2UsnJycqDIMhSJoJxofUVFoxqJDzuyDe//2LJ4fc7LoAiUwKxU3N
AszLAOCT+qO3OdtXBWGstziRXX+qjIHXkCphUfpvgFtivn1paycnNFIPf/ettYyz
8vd8SVsPobkF2p2l2bqP5udIjBQxpsB8rEf1VAmBY0eLoKSmT9HceMPRPyE0pV7H
zUge47+kYN1zVSrP2eh3V+LzmtMdKizgFoehVDUO2By2pgDAvcXJtjrXni8DaMlj
S4SfEOoPor/K0i+Td652n/p3jboyeuDTsXGhUFEr/CpOjucSfBwX0Umb1ciKlm8/
emwUZTljrZNu7KDaQjSqIFHGACaEtvkpSAw054d4XUd0ZQ6l8Ejzde2F7obg802h
OomtvTfyENa3fyFEQDiyQ1OYKisi3e6HAlx0+DtWcFpWcaSJvErroW/5aHZSXmOS
c94M7WdyDwug+jWy3iEZ3C8O6yOGtsyCdClFAH0nYQ0WXYio8+pLA4EikcgrwRK3
v8OhtlS8sHwjawkYwJNqR40ODV0Wz+Ox4Eq/X5g7ZF/5ThfApIQ=
=cqN6
-----END PGP SIGNATURE-----

--np8D8oiMOrOdjgbt--
