Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794888076;
	b=zuVB2KJS+aiN/qxqz33UryXcLPxlBHZ4NqdgiW9YgK2zEyom4tbTRxFERq/OazC10+u6
	 goVMnXCKe9dsXrlDD/8lW0CzeQJNTHvbtfFNxNfp4UzEgxM+ddJqANu56a/+TbS6Qe6QS
	 t0mQEAe+rZWyLiWMl5SNjFNd1mx1oMVvGtKtmj9tBQHP8ofs8txvq1F+qRSAull837oEE
	 rsPQJLVm0sFKgqOStQD2Z55B1HU4J6Q4BmwNKIWqkoJyahBMKDl54lC7F37choISHZWgN
	 S2dD5JKsNJ0AINnSgyZG9rD4yuU0cRUFtatW8/iAdEhTsh13VjK0h17ZBdnJeh9jJuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794888076;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=/6A8MZ+VEy2cx7JzeZShTroUqqKoj4R+X/thRFeMnNc=;
	b=weScmegINiYKVGCWjIOrSmcm9Z/dFLeFFxeDmJJpEkw2UQrHRq0MoCC8oVpjUCN7USlE
	 MzF2Go42y0imnCmqlO1TyMwQ1/axkmC9JV8tNFVjRUA0HTRcQVJ2Qvy1VFD6gTC4EbtIB
	 vO2wqRsqqjE9Jb0jyTwPb+6iCQkrmeczx9GEy6B0DjPtv/hrLBujOspycfW3qIJwz21ju
	 7ZNXYANu2UIOuyG16jgp3Bj2ArO5LYJ0RwSDq1kjRzEazbcKvMTfEMPdGzWpjTxdqTLop
	 A0gSA4QAaAUcrA4dudZHso+bsOQBwLDDCPOeHUmW5g2JBW5VPacsIsdVszMfzwyjSww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=mIrvRVrt;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BEA0606A31C;
	Tue, 17 Nov 2026 04:01:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BEA0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=mIrvRVrt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1794888074;
	bh=/6A8MZ+VEy2cx7JzeZShTroUqqKoj4R+X/thRFeMnNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mIrvRVrtok2jJ++oc3LXmNVYv6lGPKW3cOX4pqFssVaWrPaWoyLOvPervdU8M/piJ
	 jcscZkA8R7yDHPct15OqkKUSqZEs0v7yhv0itJ3b8gqjnpTpJHwmXJVbtHPSNLSygt
	 2V8Zz653/gjhGd4AY2W0Yhf4zTeJqeq78+GL8TCSfavEJoj1bFwZNWhJji8Gx3AyaR
	 XTLbU7xpoW2nrFXDdBXyS7U6fMolJ/VrO6EKXi1q3AHMSCV2dwBDSysGuCuP1e8HPi
	 yjUfJPWEqqzcrzrBNlCK9CKn2l9TISC3Pd0W4/Ys03O5OScdNcoprbMnHGMJ9WyFzA
	 7qjXxvZxbcZdQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jT9yL5qYkz4wT2; Tue, 17 Nov 2026 15:01:14 +1100 (AEDT)
Date: Tue, 17 Nov 2026 15:01:10 +1100
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
Message-ID: <avvRheLq5yGnHU50@gractus.seuss>
References: <20261116205320.1621386-1-dianders@chromium.org>
 <avvOmgFusDlAGLrw@gractus.seuss>
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
	protocol="application/pgp-signature"; boundary="uUn+pt05xsgizILC"
Content-Disposition: inline
In-Reply-To: <avvOmgFusDlAGLrw@gractus.seuss>

--uUn+pt05xsgizILC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 02:48:43PM +1100, David Gibson wrote:
> On Mon, Nov 16, 2026 at 12:52:57PM -0800, Douglas Anderson wrote:
> >=20
> > Devicetree overlays exist at both the source level (via `/include/` and
> > `.dtsi` files) and the binary level (where a compiled `.dtbo` overlay is
> > applied to a "base" `.dtb` at runtime to add or modify nodes).
>=20
> Patches 1..4 are all nice cleanups regardless of the rest of the
> series, so I've merged them.  Still looking at the remainder.

Sorry, meant to say 1..5.  I've now applied 8 as well.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--uUn+pt05xsgizILC
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmr70YUACgkQzQJF27ox
2Gd4Og//bymO9mG91o8yUC2bF+j5qSwLVjgNiOkwYj8Cm85JfnccAEmtnm8ILwul
HWPkIeHKm1TPLcIDBaJ9fQlm02xDF5xJEwLJqed4QIj6RP+cTL0o2wMCpbydofgA
XCttHQqJGSh1sM/FMgmhjPNNTzWdZRE6hhKckVl5YDsuq4b46/egKFWd5tGAAqrP
w+nzpCdR1+3XLvGRwQ0E3HvBdKAOqQp+AvoFOUmrGRlqPixNLfOwFQxrYNol8aCt
4jakCOD+ETLjX3DwJhgPlTulatzlfqYsUJohPZUBZ7eILinCE1V9CRP47yh//MqA
E46ufi1E7TGVdco+ufAWjjCgnI5NCeR0YGF0VjdCNUxCV+nhDtJCbBl7R/UYN23m
a8zhJ9Xaus2PknnZzve4iBCklFJKRWI4kLWKq13kmONNiDHxDp6ZR06XLbRoXbMP
ifEkQ1vGskgORGg+7sXx3INVWmB7N4YgfFvRFsUJkMikP/9xCRvE5KOKHz4If9RE
uQNZ6th2kANUhJTvTAXA+ET38dqF53XDo+YCnka0MBNQBmSXlqv6BfVl6RW5aAKl
0W/Bc14lQ1X3AwDGWSpVDrrDb1Kv2gxp8JLzD/Tmb8a1dWy5Fh4rjFCZ3G59Xmxu
PR0jdzG9is+Xr0lbH/fXsp53u5f/vIMPRJI8Ir/m3rQU3vlcUWE=
=b5M2
-----END PGP SIGNATURE-----

--uUn+pt05xsgizILC--
