Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795587184;
	b=5mlMxc8PGHpm9QqsASigcc0Z6a9t8iMkgB3PY/q3LEkhOHERAA/WsVJ7ec9dkPHMue04
	 SxaiTBRBi/u74+q0WtKOK/75kfYWqyY1IRCULknX2CGYScYZ9Qy7E01BncU3DY1shN5ba
	 QyCqnWjX4yJ9QNd5YkPMefICIjvTYqM+jPRE7OXd+4nlgzT9dAE3HMUBeS2rccwFYgu8m
	 ni1UK5eA8kHmXq650R8N3irtTgB1tp7NozzEvrM8RYwqdKYjxo4lZQBvLKdz+4hrlbfpM
	 q1s/b3Qnt6zlYpzv+8pKWKNImTDRQoQ4KBWd2sptu7al81u06t6eu17pVxOYf+hzalQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795587184;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=kemOARbvDBW91iiCxW8zCDrCZzo/5/h182COI45fdCs=;
	b=G5gP1xA69k5ZTlfbcT2uryndSMTCdqF1LxfRaTJA0X529/LG4Tbn2/N4BaQURtvoAvpP
	 lpXCDC0hyeVJEhvyKxD6eXl/IKbMmqddJnJkDaBppi9PHIlO9AHwogXnZRJ6WGQ+s6DqA
	 oHCqLjy0Vs6qmlg+wPqG3STQE4DKZ6qab4GGJqDGZ98vWTzIR5KXQkpcIt3G/eSIjM3a6
	 gxaTOS7Xnfg1AWRAbeWqCPNVsO6DWCIRC+mvWFfbRcbOWYCTNw7mZODHUYZ9Ca2ItEO1d
	 EUfCUwXJqvp/X/pxLmy8Ri7kgOwiDiIGnkjzDn7IUHDxiQapU7Luli6+JA+ZyB+5Utw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=ZEWFOrs5;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6235A606A31E
	for <devicetree-compiler@vger.kernel.org>; Wed, 25 Nov 2026 06:13:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6235A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=ZEWFOrs5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1795587174;
	bh=kemOARbvDBW91iiCxW8zCDrCZzo/5/h182COI45fdCs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZEWFOrs5VfkSZBCX4JzwXchxipv49TIUBNYHcYy8E0DxAJykA+qQNgGuluc78n3JJ
	 C6Rqy+qK62ejb1MsrVyAK4EWzc3vGEu92ETGjgqayuV2IjyvYYRzRazRmQfTYUD+9T
	 vgPTnja+hBtNDq8bAl0nOzovwHMnma/h34MP70i/lk+XDsgmMfiFDDSYkxlYHroqwv
	 CrxJfxCq4haJwN0Vz+uymzq9sIUOAc7W/f01cyl26cDy2tANLIKEi5g1ThYyZ8zXsb
	 dcoa0S7K1M1osnOYYc7dCgD2Z1C5Dio8wNfvuuFoFrdMAbaL62opvE6HbVmESR5+4h
	 bIIeZzEFCAOCg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jZ8VZ0qcfz4wMC; Wed, 25 Nov 2026 17:12:54 +1100 (AEDT)
Date: Wed, 25 Nov 2026 17:12:37 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v4 06/10] dtc: Move label-reference handling out of the
 grammar
Message-ID: <awZ8TcOCgarB8dBG@gractus.seuss>
References: <20261116235813.935070-1-sjg@chromium.org>
 <20261116235813.935070-7-sjg@chromium.org>
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
	protocol="application/pgp-signature"; boundary="BqWZIzR/AkTCNlRo"
Content-Disposition: inline
In-Reply-To: <20261116235813.935070-7-sjg@chromium.org>

--BqWZIzR/AkTCNlRo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 04:58:00PM -0700, Simon Glass wrote:
> The grammar action for a top-level &label { ... } holds its merge logic,
> including making an overlay fragment in a plugin when the label is not
> found.
>=20
> Move it into a new merge_ref(), passing it a struct fragment for the
> reference and node.
>=20
> The output does not change.
>=20
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

Still, excepting the name change suggested elsewhere.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--BqWZIzR/AkTCNlRo
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmsGfE0ACgkQzQJF27ox
2GeJcBAAlr641OIj1KEHSYO4DOR8FRzLtZh2MIdyCRTT6Y+6FKDkKYjegSMtH508
o04ThTMGGktDq305rlCvEq1OwHt6GEh+Mnn+jpD6gDlCDxV2lbrGEDzBGTPR4+I5
ieGM0LCbp1271ZDY1COO6MTHYFLsPMjirm0Ic4Ya883JPRL6+OlZGfoupJ1dff9l
ca2E0pC+ab46awlf6EXqNhIrRrAJmqt4aDWcXqzpgFy7IsQq4/YvRnhGANTbUAci
fMhrpVX261zO0I/jxCRfe+uqpR1ZUqmclhzFNLA3cjWxsaPpfHCKgd6/q+shjrNO
1melEUEHhoeN2fJKJKL+f3ubA25qDfxfO3EwMK3q6fLaC+bMuHTw3lME6d1wr0tc
UFMvlTKClrFsytNSPEy/fs1iNoL19OoJYXK5y5Zi594ohJMk81NE3/qA45us8qXd
Xwh+fKXTqsF400f8bghLDzTObC7DaFfUqAvWBzd39fsqHDaoQsuPKSj/zhqsa8yI
JoL9c2lxwfKL0AEtkl9TUtOAMeKTSEAUHLckOQK9w4Jk6pMln1lmWyN8/yPN+/iI
7V34B2Uf7RMDPmb47mXSvBMe47qUEfOstNG/9EdsOIJoPQZzoC436l/h8yeyNm91
rADUKA+EWO2z++/SO2pfMk4buUlZSy89F1AL1P9yiBKsDS8u62w=
=+X9w
-----END PGP SIGNATURE-----

--BqWZIzR/AkTCNlRo--
