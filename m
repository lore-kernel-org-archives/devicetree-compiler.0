Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793773965;
	b=QlgUt2OrZNmCwAz/g90tkVBKEMVadhiAYyo+tNEJvjaPxTO1qyC9D7843Qhw5Zw4fHPv
	 /uQeWY1BMkjs6u9EK4F8MvGhLn9RRhifwgAiC5mN9fiF7NMaE5TNHIa1OfAeEvsvNXAk5
	 5kllKxsapD9GwxmKrSJrK1IQpLGlIcjaOeQZKU8MSw7WvMj9KmMQ/wonX76bzbK0gALaz
	 Yf5vF1emWcRJPxRmlRUT55sQ9N9AuGyUiAsn+tSUpmrP0zb8hX95ZfWtgM0uuCUiRno5K
	 4Ht4kvrC+o/k17DGoAoZdTo1PDJ5Qg4anN2Cc9vk3ISnVg/xoBnjTyUNH63I5S7SSrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793773965;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=0uLC0HaAr1QkFmkp2tREOWhNfVwNoMBFyxu7npKuUlI=;
	b=zAnfieD1EV4q0bKKWCW7nQ8Jf7DuKF8om5lMQSb7iqiNpdD7pH1nAcmkpAOf9EZqiyVV
	 4G5EtUQLm1xwaJhH6gC78nChtY22bQ9g5UOjEQo27I3S9n18EnrzMeUruRURi8/Sp7ppf
	 vMFU6dcmJJmAfrA7UgU4MWp6HE9cDSAUUen9gZXpZ+pM9xH06NioQaHgMeeH7Q0xMOALg
	 lohOE1XpfthmYQc9QNynOHqaR7CpIJzRi9TPzgyCL2r3+RyV21tEOPGP4UcwOeZXRewRX
	 jJ/S6Q4oDgmgCkiQbMBIgv+cR6gn8sIZcXz0RDUFq8PHVXB1t3T54kO1kznd8ZWViLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=HXgOnWcG;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C9B606A31B;
	Wed,  4 Nov 2026 06:32:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8C9B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=HXgOnWcG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793773962;
	bh=0uLC0HaAr1QkFmkp2tREOWhNfVwNoMBFyxu7npKuUlI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HXgOnWcGkvr9hGip5zyzLcO+zguxsBD6jrG+2sYoN5UCtCv8jOLMh8y6YjIJRspq6
	 9MXADVPmlbnPffNHiNxbYtFlO8WFyuZOoHOABu4slOZ6apfyaVXNx8s6G4T+zkuqBu
	 HfUWMS45hQ/yMAwv3qFnJmAM/6P/+oLxjj1YBcagyxxpSK0khWg1SkJtto5aUOFyPB
	 1n5X8CPVnJofglcSO3rrW7lzT1h5PlSsp+cS+ruyrO2g5wADT4BULzvODMHsjOB4Qu
	 NblXEh4EfdcSxWWbX7XSzqML6xJXhwz72hW0t53WfyURgqoStg3zzBuDux+O+LxIWD
	 o/iBF9urEa7gA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jKFx663J1z4w9g; Wed, 04 Nov 2026 17:32:42 +1100 (AEDT)
Date: Wed, 4 Nov 2026 17:29:32 +1100
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
Subject: Re: [PATCH v3 08/15] libfdt: overlay: Factor out fixup and fragment
 path parsing helpers
Message-ID: <aurQy1f21o1oTMrT@gractus.seuss>
References: <20261101220224.1436242-1-dianders@chromium.org>
 <20261101220224.1436242-9-dianders@chromium.org>
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
	protocol="application/pgp-signature"; boundary="coXX6PGQLopO7peK"
Content-Disposition: inline
In-Reply-To: <20261101220224.1436242-9-dianders@chromium.org>

--coXX6PGQLopO7peK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 01, 2026 at 02:01:15PM -0800, Douglas Anderson wrote:
61;8401;1c> In preparation for updating the base device tree's `/__local_fi=
xups__`
> node during `fdt_overlay_apply()`, factor out two helper functions in
> `libfdt/fdt_overlay.c`:
>=20
> - Factor out `overlay_parse_fixup_entry()` from
>   `overlay_fixup_phandle()` to parse `"path:name:offset"` entries in
>   `/__fixups__` properties.
> - Factor out `overlay_split_fragment_path()` from
>   `overlay_symbol_update()` to validate and split
>   `"/<fragment>/__overlay__[/<rel>]"` paths into the fragment name and
>   relative subnode path.
>=20
> This commit is pure code movement with no functional change.
>=20
> Reviewed-by: Simon Glass <sjg@chromium.org>
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Patches 8, 9 & 10 are good cleanups regardless of the rest of the
series, so, merged.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--coXX6PGQLopO7peK
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrq0MsACgkQzQJF27ox
2GfjbxAAqndQ2o3MCTlJGFgfgpsF9GWSD+adrjWWvFwqKPzkGy20HKmvwuGghih2
IkQ7r5le/kp51xS2eP3ZHlxSsd69zEMU8z50yv3nLugIwfWgxcoWla2td+D1tQWG
jj1KRu7kreUtvdsQmkybRX4dpNCm+ksL5nDhNIotKD6+Jd+3QmjVTvNq3PM/cJRZ
PReTIMxcnjO6EulbmOZkgsCbnQLpv7tzBmIw/z83TAFRgduCfAL9jVKb0U4nnV/z
RioEX456SenflWWqYsTxZiJVB4hrxwNtv/d5tqeF3OW9xgo7oZO87RonaB676wlf
IBU19pqt0x0XzldFzxCWLI26EvKQKwdiX67+r+QoaUm+Fbng9QB1B6V+gm0v53tb
nMya1ayRFXTRsjXQEwy+eRTdLURRQ+QUpeFJg6CU29yAbUNcL+WEtcbaoAQwuqro
FV44lcwwhmN86NchAMaqip/9rmGGy/26pui0CyRDGgTkvRaasUgE4x+hcLC4MVwI
rNUn8lu+hN7yAUnzkm/bMsWHGIYYZvaywnngIWOvUaBkgV+hS1aZF1EBT8OeCT6V
cg3sJx9FXAn56GcSfYoWerXf6YcYaZAlUXmBY8r1HOnV12MxDwBr4s05y8NJ1gdo
52fFr4rDod6cB4/GohARWX/7hu/giyPfLsHYf5vHF9q7vY+xeS0=
=zAtL
-----END PGP SIGNATURE-----

--coXX6PGQLopO7peK--
