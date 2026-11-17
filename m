Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794887351;
	b=H+/lf1xfhSRKhofKS3MHDNw/COvaLtYTMPSs/GlMMgfOc4gHmRpmjJZ94Yc2TfLV+yaf
	 s9+LL6tmAQYMwWki3ACLpKy3sZgOJ9ljl0iGLB4je4cElxcbU4ZIyltsvWfGM3YIdlh0n
	 IyGDgpNe+b752p4m5sHiPYpuWSmQHqDA/uDEinznK89JBUR0M7SyrA8qddQkbSCA9VQTa
	 zswgBdZETmbt7WAspQ3hL2aAVNA/iahVv0dgbzBPhvHPAQ2MBG9+3hW3FrLlWXhlcFam0
	 kjjd3fSwI9o/UH8I0hbgq0R030hx9fvtKrojCvH4t1AWC3zZ/zWjy/oH6fCtN0eCQ7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794887351;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=UUfQmcJmeina73n+agSEMEO5RkiRbU9Vd01jnzLh+SE=;
	b=AlJaRm21KlEfxauHQYwcDmc4uVJvungj9hjzRBjfH9QbpQbHkTDWBbnyigN9+NAHfLoP
	 yTSLBUZTqQhzPLJn5smdGEazta7JJ/a7bbTLRPQ1aqcWVdKwFX9270OKpicJEvoXAggx4
	 7c4nCXZJKJDl01kqr/9ez2AvAu4Fbjq2e6mIsGEkZRBLlm5JjLUi4jC5RXEYAv8fCN78G
	 qSKruc3dRKJtuOELk5P6z5t7V3rRVOm5s9LeegHudWYQVW3KetUwWcLlxceoCR0Cou4HE
	 KJsnvtL3Aj8VwxZdWajCcxaotpYYcUeHwyNOt/7g/LmYG+aU93EBsQkPyEeWoSdJVEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=SUlA+37c;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A772F606A31C;
	Tue, 17 Nov 2026 03:49:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A772F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=SUlA+37c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1794887347;
	bh=UUfQmcJmeina73n+agSEMEO5RkiRbU9Vd01jnzLh+SE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SUlA+37ckvNlv/+2S2BBq0R7kMGBWHSuD5NotZRuPwHwMttxhbzGXAnIJkJ6OmAwG
	 ITsOsYUXkaDyT5H/S/Ce7Ii7+Ed8uSqhzaPW+kg2cqmaoFu6aGk+6tyF3Qr1LSaRrl
	 +X9GK+9YOawLJlvU2B/+mvUdXtW94vFeLMlRnfnbqcpy+RW7G6Z4RWLbRD6dfyiNfX
	 WjiC1SSoV5uhF9IOi9EJw8f1OE0quJEiaX8eRPQX4HMOWS4S5cZi9HH/VQP/VL2COK
	 VA54C6yODT5q6iqgDPUnI2/N62xEFMEaHzXCklMrCGUKLjUQn+VlixwcT0JkmwYx27
	 SN913eZI+XtZw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jT9hM4nMxz4wLn; Tue, 17 Nov 2026 14:49:07 +1100 (AEDT)
Date: Tue, 17 Nov 2026 14:48:43 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Douglas Anderson <dianders@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, Devicetree@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Saravana Kannan <saravanak@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Simon Glass <sjg@chromium.org>, linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Julius Werner <jwerner@chromium.org>
Subject: Re: [PATCH v4 00/14] fdtfactor: Introduce fdtfactor to auto-factor
 overlays
Message-ID: <avvOmgFusDlAGLrw@gractus.seuss>
References: <20261116205320.1621386-1-dianders@chromium.org>
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
	protocol="application/pgp-signature"; boundary="AGlCOYzL1NTzOHS+"
Content-Disposition: inline
In-Reply-To: <20261116205320.1621386-1-dianders@chromium.org>

--AGlCOYzL1NTzOHS+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 12:52:57PM -0800, Douglas Anderson wrote:
>=20
> Devicetree overlays exist at both the source level (via `/include/` and
> `.dtsi` files) and the binary level (where a compiled `.dtbo` overlay is
> applied to a "base" `.dtb` at runtime to add or modify nodes).

Patches 1..4 are all nice cleanups regardless of the rest of the
series, so I've merged them.  Still looking at the remainder.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--AGlCOYzL1NTzOHS+
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmr7zpoACgkQzQJF27ox
2GeU0w/7B3YEv89zRZuKiPTHtC4y1cxgIyoJaelpCqSrDQ+2kx/JYDGUb/TXm3Hl
mnxqIig26zshY9e46yBgFhAWSZlhEHO70+gegbwCT8Wqd//rYzitfyx3dJjaz6IG
5OhQbCeZtenHwncyVcdKuVsi4pE/OM87nvPN/qLJwRtiQ6ChywTFTptzh/Vfc2BW
9PmW/K4T3b09oQhgEFApEUNrFJcgNzNBIumvHV5zFF+2MwVD82ICG5oCMpDJocMD
cR7gZUDRWG0T5lrF0zjmcT28JzcDD9zfvxtdcsfaRNUurruylT5KqUA1Qf69xKkm
kTcO6Zims5RnTyJcibWIAAIjbFicJORaGxif6LhAwDI2B0bjzwiElbWQVv5MMZY+
dGkErNn+Wf/mmbm1IBNp37kN5WdymUsLF3awsR5YplXPmZ5acZ2IxOkQCn1vD1xM
lowWOw/s+h7mUv2DQ0x/mEKvk0Pvel//1tN/s3usFUzgcs9VTRx9YIrSxc76DgYF
Ol+TbJEomNXZp2nhe+1qsrzEWiB3CvY1YqtyyJgUlO1SotM7B0Ix+bE6gwPYhMqB
WVvR+77obhl2+CfGJx5tN/CZXLZ4Wa/KGs2kPIeCtdNQobHMlRDKURnc4mxeRFzX
wnHBzq5f88Umy+PnWvmsP5BxtuEqAFvrQ68AbURJlro7L9ktbkk=
=/Fww
-----END PGP SIGNATURE-----

--AGlCOYzL1NTzOHS+--
