Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792993087;
	b=AYf4UJob916hLvWfvFn7LqI2u5KYMkYajK4OwWlaTS2R4OBClXC2bwDjD5YwqqtBipU1
	 qi/Dmk+zWjnWNwgLPwcPczB0Ep6M+9gqHwryFBhhBDeT5e4nyy21Nrc7EnvRGUzuq/PjP
	 jBNdTc4BPm+tmzZRA+tFBU1p9uL2vyK7NaxWagqK3t6+dfexpHD6ECDaixYKJvXDBQsmx
	 J5kvcmbF/X3MGDRip2gP5m6US0UYWQqBAYGnorsW3RBigxHK84hXneTRMPox/Pg083AXI
	 v7me39toXsybCs5zQgp0EhGr3/KwNvwLnJ4g+he6uFClDqXQ+TcONNvtzJdbokeJGbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792993087;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=pF6JyW05dvKpGW6vLnjeFqgPcL4aSRRCApEbsDDUwNM=;
	b=Bck95CmWis2Fm6Cq4FB/YnrD4UX54AIKEitH2NrmHtT/BFILxqotqdoRryUX/xn6Vn1D
	 oNE4FI0aEAQDcWmqdJ4Ja9SQvW/cGeU7osR5Rzddmfv8TWN/JV8z1oR67iiak9A7wZ6GR
	 ihRZNe4iXjQ24wAX7U60K9Gkd9D3VsD5vDHEYVXyk3KejeVu5lhmPuugHdkkIFBqFQTUj
	 lXDFsVzp9e0hTbxfkvTjN0WPGEKbd1R4VPynP9XKVLB9Fw01ZwvByfE0BSf90wSzRNbiF
	 8K5nHLypikrmfnJVs5lW0ulfKxUVbH11RZulqmjru6uRRWzJQKLblKBbbCF+cMqE2rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=HyBaMg0y;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC104606D308
	for <devicetree-compiler@vger.kernel.org>; Mon, 26 Oct 2026 05:38:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC104606D308
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=HyBaMg0y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1792993084;
	bh=pF6JyW05dvKpGW6vLnjeFqgPcL4aSRRCApEbsDDUwNM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HyBaMg0yA4EKauVtFbsNqeddE4RlyahycrSibqR/yAxLjPFfPO/yB5nlOk/JmAmjy
	 kVPQwLXgDOAG84Bq6kIPoMZe/WXmTWU9UKrYpQI93Kw3k2qn8cDx2BMkf9TQzISQCf
	 110qI/w9vGODBzFYjUULtra1lWOQzSay5TAohQDot9KOq/lMTbowuk1r6p8d7+wwqf
	 WXgQ+JoSsapTJ/qkPIASv1kY3Bsue3ti4krssq5s5uVPf8Jqy2HqgXDn4vv66gO9Xj
	 GUhvMHppZKDych/vPkIvOB+wk19NZlyF2phvd/LM3Rwvu0bpgCLVqtrngFNx8vf82j
	 XNqojWxU5Ohnw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jCj8D0Wznz4wK3; Mon, 26 Oct 2026 16:38:04 +1100 (AEDT)
Date: Mon, 26 Oct 2026 16:37:58 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v2 0/2] libfdt: Find a node's parent in a single pass
Message-ID: <at7nLxhL40twIjCt@gractus.seuss>
References: <20261025085508.1622340-1-sjg@chromium.org>
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
	protocol="application/pgp-signature"; boundary="NPstNlmN1ohOnW2v"
Content-Disposition: inline
In-Reply-To: <20261025085508.1622340-1-sjg@chromium.org>

--NPstNlmN1ohOnW2v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 25, 2026 at 02:55:03AM -0600, Simon Glass wrote:
> Make fdt_parent_offset() walk the tree once rather than twice, and add
> a CI build which runs the tests with the single-pass code left out, so
> that the fallback is covered too.
>=20
> This matters in U-Boot, which looks up a node's parent before
> relocation, for example to find the cell sizes for a device's address,
> and may be reading the devicetree with the caches off at that point. On
> a Firefly-RK3399, with a 564-node devicetree, the 17 lookups made before
> relocation take about 7.1ms each, 121ms in all. With this change each
> takes about 4.3ms, for a total of 73ms.
>=20
> Changes in v2:
> - Explain in the cover letter where the cost of finding a parent matters
> - Only fall back when the node itself is deeper than the limit
> - Drop the comparison with FDT_ASSUME_MASK, which has a build option
> - Give the deep test tree several nodes at each level
> - Take the expected parent from the node's path in the deep test
> - Add new patch
>=20
> Simon Glass (2):
>   libfdt: Find a node's parent in a single pass
>   ci: Test with the single-pass parent lookup left out

I've noted a handful of remaining minor nits on the two patches, but
mostly LGTM.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--NPstNlmN1ohOnW2v
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmre5y8ACgkQzQJF27ox
2Gd/Hg/+IjiArgf85SjG3AsHBAahcBsQh8sUNkgwtgD6oYIDKnnSUdi+L63FDiaS
P99I43iA7ycjReugZ3hCWuTxb3MH0E6zop/8AdI2wUFj4rGdNevrX2epopbAQchg
xBwO7tclTr4afLTrXGgxHjVoaLOL69A8+Q+ALFt5RhtV/Vs7k0a0s+vPasNN/QAO
oIB6oKjm/1bRUFRAhoMJ2OUm6ApLXSH0DHfA5+uI7L8NKQAalrI5kwOQje/uke6q
6/Akr9pagaEjqD2Zx0hEk6V1B53PjmBHVdA7EW2MHV2IiioIvynQbPTg36n3R/0t
ae2qyGwybTQA6PxbDOSMWw9/Hd/BZeeO2pXz7EvmUEVayL92YXLH1MOmaOVX+J8j
ycA4tDtVRZJpKMfknE0BWryNwv8UUK/Vuu8WlLso6ZCX5oIY0N0kHLpkHqAHF7Jx
+lk8w0jkTG4n3RJ0uItchlv5yAsIDljOABNmB78MvEHDo0ZPS/xJ8lC4X2xev9Jz
TmG/VLi8ebc62k0/x/scvyz/Rvm+4twIPb2Tha2N/x7P9cEDT2oAEoAAvnyMcXXC
GNTuNeNhZErXLGUUuPyb7+let5MnUkhl506IiORdp/wy8UAKf1PU2I2A7GsafxU4
OHv8yyiKijjHvvlnOyE2gAZ6m0SFGLaI5qFOWlX50NjBaMcz4ZU=
=kKUB
-----END PGP SIGNATURE-----

--NPstNlmN1ohOnW2v--
