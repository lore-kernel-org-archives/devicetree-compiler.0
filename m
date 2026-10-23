Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792731868;
	b=nRHOTxMi1iiLfvHwqRhV0XMdemdz2VMjrKvINYE9zQyQ0sPUMojZFq5vIRkgQFHscQt/
	 /3CE5I5mGdipWx2Wk0TXAqjUprIzjqvT7E/Y39Lpgxy16PmMnVHMEhyiGvg+CV4rdqNmA
	 5Gpod/VYvB7W4PgjQziq/KS1Dt28DSHE/SZZbxfFup0tyAdVd+9mVBRvnnn4U7mP+Tqz9
	 dj+WAqCja95F5GnDvEOTihbYMIVexSMRySIL+uH51hdV9uABz6OsxP1/zaXavygkT+S+i
	 1V2Ypun18wDnAS8OVqKdXum0NhVV+Jc5RiW/xg3+FtoCIg2UyWi0QyAt1eX6Hifqgsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792731868;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=8hyZJOrCB01npQa5yPgLeIJtvL+NAF3s+CjJjLmYsoI=;
	b=ZTc1K9RpyPxys7BNdZPWeG2czGK/69sr5aoW0VT2ROzv4y3vDjjSU1N+OZTh0bSevuct
	 0zwD8rC1WAuwerkuKQu6I0sr88HbwMqtlXnwaCsnb8H6NXtw9bgRhA4p0gUIV7kqzELxd
	 YoRsR3jLXNeH4vAdjcn7xTG0Zom0Wcs9UKykj4hy/UwigbRV3a8/pBZxRA13l4ElK3Oiz
	 qU59nwXgKRCKsgBCI/jD30ffKCjWKPFiUnrtnGxyEOrERoWGcZq4erkOc/4kfdb57Vw7K
	 cputRSZchj5sYfUESi322DoZtRFiSNzkSSfxv3/JZ4FNP6Pmar7HtpBVeEBG0rbfUPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=FWRmlkTg;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9946F606A319;
	Fri, 23 Oct 2026 05:04:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9946F606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=FWRmlkTg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1792731862;
	bh=8hyZJOrCB01npQa5yPgLeIJtvL+NAF3s+CjJjLmYsoI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FWRmlkTgku3XlJc+2YupV/fFlNu9GQBracEfNgYHB2BYjJhavrU335/MfBYWEaENp
	 yxTXpZKyjEYSFJIkd25/WRmsDKt3J0kUyeC9VLVpelEZuFGPlCgR+8ivVW86HQk41n
	 3WdOSKi+Ocx8hVI8wNI9ruIUek7Nqb7xj+NACLrFqPzCuFLDN8jtOAnsk2n1fMchcc
	 2yYZtW51/eihcZVfg3p80Q4GOsQGxH3uj8ID6nIYSKQzpWWgnEBbjCBgSCxcYmiSiI
	 dnmq+qO29Ps6sairKm3fR2tV/hxDwdIMibgVGRplTne9kVMEMyhOjib313EyrmMzek
	 +Y42pmPrVrTOg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4j9rXk3S7Pz4w9g; Fri, 23 Oct 2026 16:04:22 +1100 (AEDT)
Date: Fri, 23 Oct 2026 15:51:39 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Douglas Anderson <dianders@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>, linux-kernel@vger.kernel.org,
	Devicetree@vger.kernel.org, Brian Norris <briannorris@chromium.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Julius Werner <jwerner@chromium.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>
Subject: Re: [PATCH 1/4] tests: Fix Python test environment setup in
 meson.build
Message-ID: <atrnx0D4-fdimxcv@gractus.seuss>
References: <20261015182221.2931742-1-dianders@chromium.org>
 <20261015182221.2931742-2-dianders@chromium.org>
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
	protocol="application/pgp-signature"; boundary="8NsImvEAj0rX3wH3"
Content-Disposition: inline
In-Reply-To: <20261015182221.2931742-2-dianders@chromium.org>

--8NsImvEAj0rX3wH3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 11:21:34AM -0700, Douglas Anderson wrote:
> Commit ecb21febfdd3 ("meson: port python bindings to build natively via
> meson and meson-python") moved the generated `libfdt.py` and `_libfdt`
> extension module into `<build_root>/pylibfdt`, leaving
> `<source_root>/pylibfdt` with only the source files.
>=20
> `tests/meson.build` was still setting `PYTHONPATH` to
> `meson.project_source_root() / 'pylibfdt'`, which only went unnoticed
> because `tests/pylibfdt_tests.py` manually inserts `../pylibfdt` into
> `sys.path`. It also checked `if not py.found()` instead of
> `if not pylibfdt_enabled` when setting `NO_PYTHON`.
>=20
> Update `tests/meson.build` to check `pylibfdt_enabled` and set
> `PYTHONPATH` to `meson.project_build_root() / 'pylibfdt'` so Python
> tools invoked by `run_tests.sh` can import `libfdt` directly.
>=20
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

This looks like a good fix, independent of the rest of the series: I
already applied it.

> ---
>=20
>  tests/meson.build | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/meson.build b/tests/meson.build
> index c6ac2d7f8ec4..c25500606059 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -114,12 +114,12 @@ endforeach
>  run_tests =3D find_program('run_tests.sh')
> =20
>  env =3D []
> -if not py.found()
> +if not pylibfdt_enabled
>    env +=3D 'NO_PYTHON=3D1'
>  else
>    env +=3D [
>      'PYTHON=3D' + py.full_path(),
> -    'PYTHONPATH=3D' + meson.project_source_root() / 'pylibfdt',
> +    'PYTHONPATH=3D' + meson.project_build_root() / 'pylibfdt',
>      'NO_PYTHON=3D0',
>    ]
>  endif
> --=20
> 2.56.0.176.g3575e65682-goog
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--8NsImvEAj0rX3wH3
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmra59UACgkQzQJF27ox
2GeHZQ//VifbcwgT3ZocqVMSg1cR/Vb2bID0K8kTmhxvI7e+lMUaCOORm+5CPsjq
p6fHbUgKm+3uTTlzYJzQS+j+38vND75fWkfZch6BU74E66YUye0HNhYf8uMQdes/
/54LxGy0OulqqTqLJdi1ShdYC9UqmPBvaTgDGu4hmo1CfgFqomILpb56ByTuiGb9
fyGCP5xpxYDm4FXd3VsfmEJRrIuii8XnyBMwEqEBG20/11Mq4hAOWqlcQrEQnPCk
+V8kTduhOzFUBcVcw/tls1UNVs9O09vU2dFxPCNcEKk/kTRGChvii0SUBzNBWa+P
Mhp1NBQySM8rEcwYGrHdr7aGpOSoP5zk53yux6x2U/Egz8wPJqL2FMvmODH9p2/F
oUvriCb1hLE/Qr3APQ9uzR+8Ad6iUJlcxYtZFt2znL1T2+SMQfA5+LnXxyxmvmSs
97Dc56wTnbh6Dr19JvhbaSSWDeEZz8AqsuIUu3Hkv3N6f65EUr3ZNe+wTG27kMD7
mhaahToTie1fbv3R1DVTdZUyWKcQPUkxMyzR/QE0TFJswEBfKDViLpFI3WYKzFsZ
TSuqz4xhqYEfhkreTPlxtrk5J/3pbSZE9EAFij6t+oEpC3IGUW8rdY6evTmOWhE9
j6yW4qq7SzzUtUCk5CBwpx/FdBu092F8yNKn8r78cIncCCjD3/A=
=9foE
-----END PGP SIGNATURE-----

--8NsImvEAj0rX3wH3--
