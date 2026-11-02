Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793594681;
	b=yWFFv8JMOzgXryaCsI7z6kaZlQ6O47vDO1bE6g5aml3fxp/3uqhYzECPW3lEnSFUP0Y4
	 p70fMz6LnF0i+gERfoq+HqYBuY1vSh1AIrp6UsXuS98pz+asgR+bNx/2oSRNTYaou+Flm
	 GpZQKxX7N3zHy9ZOyUAgWR6WMY/8xNMB1qBCr8VwIFJ+ZqyT/wYMCHl8GdEnDELg5AWQk
	 dv8lr6dRVvWrd9UNZvBUviFgMGORgzVlP/WcP9r/AjBvGVFlDt6FHRo8j8SZeDDbMaHZG
	 rDViFYRTBSVqMAQ0vkZVeHoG7bqgxVlgRsztTdt36I00exHHy6E3KoseX2izBu21T6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793594681;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=BkSoxcvd5hW9k8HoLioIf63ALC/MASIecs8uUE/f8DE=;
	b=lbpLPQSwZI3k6LVGWnAXLbRluu1YZinVD3N4CF3HagFG19CsIF/3tr5RYXa3/nTOe6DI
	 QEiV+7qLD9+/uxseBGV2bSBMnSbOWb5DUk40Bpd2lLE/7+4OfQMrrd+Td5lzsPyLPtfeH
	 zb7o6c8+146R4xmk3Tgynl00sRJO9mYpg0JngeBBuHYxeqnt7SYCzGIhPQDCArjlfHqfc
	 GIBFcsPkRVonLc5SYllzEudBHLWw3Biu6JJaT1fochBoXPbb7E9sS2PJPzGh5Qpm+S5Fs
	 jtkYoZNBcGzTKvYdzSSwK6rpGxJEjylfgfgDoMPv05JvIXG7xfQqtQAS5wG0d3ukuuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=E5azIqpp;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26981606A326;
	Mon,  2 Nov 2026 04:44:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26981606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=E5azIqpp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793594678;
	bh=BkSoxcvd5hW9k8HoLioIf63ALC/MASIecs8uUE/f8DE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E5azIqppUb2Azf2yigDBONMmX+BQvrkaSmu0wUNoB8g2LLiJMHSozpCCDAdmL8yEA
	 /8n4o5w5GRyhhwmntD+7aDohu05QYaWJUGOFlKslEWjCpz3MXLoUyxtxMzxEu11f0D
	 u392voT5lzszLZjS0NKcO4h87ijH4gImEgZpvpNbiXIX7FEVtKK6++LvK/Yt7Ystjl
	 Fh1cEX8qZomnYi6/K2P3gSAduAB9sv/hCm4UG0X8wmpiXHprPsxIPnrGZLw0qDS30e
	 lJNRd23l4qHwdAaH4v/Q96jT9/4Mk4zfIXwujv/Kh+7TtvEbnYKcRqa023Sff5UHXk
	 We3Sx77BvujrA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jHzdL4g1vz4w91; Mon, 02 Nov 2026 15:44:38 +1100 (AEDT)
Date: Mon, 2 Nov 2026 15:44:24 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Douglas Anderson <dianders@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Saravana Kannan <saravanak@kernel.org>, Devicetree@vger.kernel.org,
	Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	Brian Norris <briannorris@chromium.org>,
	linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Subject: Re: [PATCH v3 00/15] fdtfactor: Introduce fdtfactor to auto-factor
 overlays
Message-ID: <augVH22aW1uJK4JY@gractus.seuss>
References: <20261101220224.1436242-1-dianders@chromium.org>
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
	protocol="application/pgp-signature"; boundary="occbpdDnm96rYpxv"
Content-Disposition: inline
In-Reply-To: <20261101220224.1436242-1-dianders@chromium.org>

--occbpdDnm96rYpxv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 01, 2026 at 02:01:07PM -0800, Douglas Anderson wrote:
>=20
> Devicetree overlays exist at both the source level (via `/include/` and
> `.dtsi` files) and the binary level (where a compiled `.dtbo` overlay is
> applied to a "base" `.dtb` at runtime to add or modify nodes).
[...]

Patches 1..6 merged, still looking at the rest.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--occbpdDnm96rYpxv
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmroFR8ACgkQzQJF27ox
2Gevcg//UgTQO6M60HFSPi1TJZzZ0qv0yYsb/306GyNcwI0lQsoZ18eAdDIm5gfN
pDrXQsh3ean5nFlKzsFPotm2UtCZzYwzanKJ32Blkumtmr1Oa3/qoUIg8OL83BwH
pukwTDzwexg9WMvseI7VaQ1OEM25M5O9DMeQ5sS+eGHMN8DsqY4dfj9IH1ph1HLA
3O65e4DXxzW/+q3aQmONX1eoOMRrPuu1Kj/Hy3jeqFQmuVOiSbYqMqdGMesDduSI
j/Prx/d5cs/TtRn/BDCd0tTArFIaVJB3No7cwOimFi83tBXxu3N+6KaSwZGw+DXy
IR/QEomV4hYOilKOS35t8VzGbcgYBhG9Y+9GzVxy5r8no/inBHtuf9nDImks3tUi
6cAdju2NdDfQxYD9HZBPB5Vs6GVz9Y2gpYBwWkFymtBSeDwM1+ZNEQi5UjhvAQlo
DfiI3MeA5usn67iU2tfurzFl9lBBarH1h3Hl1EXU2cEMnMnI40Tj9AItNTpijYeS
9Ek3jw5ivJxs7rtc1cFUzmzFuakURtxUuhmqhXh/dKl0Uv/JnDRYOCsLlB+0Vjlp
IusOSR3yje4PrCfupaTVcxEOvykGLeJ1xD3rmOI2omyC9aq0jQPJW8JbH1zxN7LD
InY94EWouulbDuEzwPRjlo4Bj9xpmcl1AMMCBt4glpNth6xOHbo=
=91A6
-----END PGP SIGNATURE-----

--occbpdDnm96rYpxv--
