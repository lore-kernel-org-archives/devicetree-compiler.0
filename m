Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794370779;
	b=1050wd9k3KU+RxJJL2wyVjFLPMgByCpU36aiPcauZKfNMCRkYNtkKVGOfqpLioopbza9
	 4xJ8FSFChzHXHSNLzcdQ7efp9T1veu1sjBeBFbTxKo++CqfAwO/1bfYs4gdCOqyJaa4kH
	 rrO9XIzqArFiC1XjNzsDee/xDNiualFHZNA1PPpNYuAQWsEuzdGnWYYl09AHPDITW2SYD
	 +h64Oq3UDhYO36Hj7hSLo0Qe9nq9rAe84YGC0yPRm7ZOJigEzr1PAnPm0Crss/4Xhm/hE
	 1OotcdKf789pks73DGWHtBzaGGnBqa4mT0Lnd3sFyNCWm0oKVbCEL4myv6WVRqHGEPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794370779;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=TI3IHO/M82WXfjUeKiU5Lf475TIvg36C3rBRJtlPeZw=;
	b=SJD3kZFT2zjWnEwfTtimodiMh7+0n6LplCkZKRZo4tk8MPiVtmt8iW3IhnfMRlVFuAAj
	 RgD/AT9ChsD47NU7v2UXcLDtId2E9YE7OkwYxwGHcMvseKGhe27V1zcZZEP3xPLDpOcEO
	 6MJBbT/uNr9tdP1n3WbTHthN7xHrWJyZFav67Q+VPo1yBTlOYj8PuWDgb/yKcSfNI8dnQ
	 +00FyvRPIHg/wstHIjdffCSLe+C7SIW63ia5eLEFM2tX9lNZ2FvrdtSR1/T4E6OTu0ADe
	 atYtuvlwkW0MfUUvn7/i4TJmioy+FD614Kv9HQHQMQ3QAFCSH5nH0tIqy0hfg7053rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=TaQq4trl;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3536B606A33D;
	Wed, 11 Nov 2026 04:19:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3536B606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=TaQq4trl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1794370776;
	bh=TI3IHO/M82WXfjUeKiU5Lf475TIvg36C3rBRJtlPeZw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TaQq4trlxHlwcpE0HwirUy1QLR/3aJ+Zk4OvUVgHIFdEbh+gIyqy5fOqLfYIcAOit
	 2e2mS0942BLKnlAGYDvABipkRXABN1eyQNZSPe4mUr8+vTu5kFpv45MTi09jjledgA
	 u9yW8DY3auNGUWG95uZbQnFUVBEx8/OpJZlCljKCsRNEQF9Mf/xIWh3pzn20L6qsvj
	 wD8Z+AT30AKzd3X46e2882pEB0Ehz5MBgs6Jz+vCa3orH95xhaVNS6L8NzJ8sg9edn
	 b92tg3LQ497ei06j4JZbrlHoDs/S1R2/yBas/GCsiTA9gglSaX9nYmgunJlAA/axoE
	 p/rX20hzFYS1Q==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jPVfJ57TFz4wDm; Wed, 11 Nov 2026 15:19:36 +1100 (AEDT)
Date: Wed, 11 Nov 2026 15:19:31 +1100
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
Subject: Re: [PATCH v3 13/15] fdtfactor: Add -S/--strip-local-fixups option
Message-ID: <avPs0lxHJQ3Tud8H@gractus.seuss>
References: <20261101220224.1436242-1-dianders@chromium.org>
 <20261101220224.1436242-14-dianders@chromium.org>
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
	protocol="application/pgp-signature"; boundary="bjB6qsUtsKUtE8xm"
Content-Disposition: inline
In-Reply-To: <20261101220224.1436242-14-dianders@chromium.org>

--bjB6qsUtsKUtE8xm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 01, 2026 at 02:01:20PM -0800, Douglas Anderson wrote:
> By default, `fdtfactor` preserves `/__local_fixups__` on `base.dtb` so
> that when `fdt_overlay_apply()` merges a `.dtbo` overlay, the
> reconstructed device tree retains full `/__local_fixups__` information
> (for instance, if an OS kernel wants to know which property cells
> contain phandles at runtime).
>=20
> When `-L` was passed to `dtc` solely to help `fdtfactor` locate phandle
> cells at build time and `/__local_fixups__` is not needed at runtime,
> retaining `/__local_fixups__` in `base.dtb` wastes space.
>=20
> Add `-S` / `--strip-local-fixups` to omit `/__local_fixups__` from
> `base.dtb` (and therefore from the merged device trees produced by
> `fdt_overlay_apply()`). On a set of 47 Qualcomm SC7180 Trogdor
> Chromebook board DTBs, `fdtfactor` without `-S` reduces total
> uncompressed size from 7.69 MB to 932 KB (88.2% savings), while
> `fdtfactor -S` reduces it to 634 KB (91.8% savings, saving an additional
> 298 KB by omitting `/__local_fixups__` from `base.dtb`).
>=20
> Add a test case in `tests/run_tests.sh` verifying that `fdtfactor -S`
> followed by `fdtoverlay` reproduces DTBs compiled with `-@` (without
> `-L`) via `dtbs_equal_unordered`.
>=20
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--bjB6qsUtsKUtE8xm
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrz7NIACgkQzQJF27ox
2GeLJg/9HjuW3mPLbSJVTTcdqzKBheLAsRo7LeqpzCMUmLJcVtcKEwyvddC7UBzf
WH2B0GMIaRrMEYukFr8RiAH/j9gnvHoIxi3ExGuyPdaGVbRZjL9BSIf23j7Hg5sj
rsJuWWJRTYCA05Uz4FO/WVJE7vNn71mtyRuj8i+QOV9dAWiFJLFNW4BG694Ics27
9yqZJ+F3vatecyKPByKZTDUEbFMcJREdHhLIoIgXIzIUYJ2yYSpF5+obYGVlXI+X
aVZ8KZkxnhJJlyconP6+8ZTR9jR9yZnOvCQLCd1YOSTZuQlN0kEGuIPYNrssIXHv
vtQTnBK2NcYaNNU7g14S4QtJJCFdZmuAhxokYG+A3/VtLy9AYXhZ9yVkVLFXbC/j
gmA1GfbvW0m/Iy5XXXDeOEoaDWru+1/r9OOyuuXGPXaPpyGNAL++70pcWygkk+va
vaFCPicEoF0ZRqHlztAJcn7TbgdSaoCaaex3wx3taNTH83kUiYz06J5fUlHYw0O1
PtW7K65ihZfjPZ6icQ/yjSqWhUlM5mnrdXg9x7rVzpVXqaDuNYxd43jjitMK/l10
aSDYyKc8xXXhkc5fGQlORrOju4IT3Dy0kdJWYKtOcfywIo2/bt5QGyZ4u3GZcoWp
AEDraAg47eSnO8c4Lx9KsOEp/NIk0yq2eBUsmmy6suw088rpvRw=
=7pDU
-----END PGP SIGNATURE-----

--bjB6qsUtsKUtE8xm--
