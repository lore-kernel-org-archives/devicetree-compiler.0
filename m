Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793593757;
	b=DaVttS/P5vCo3QANmiu83DGHaQD7zaj0AvGrOKWqt5wVKqXdUBMZyb4P7wCa7cKEX5jX
	 NBN5VEyRR+EUSqSsXtrPB1XmUx/ZeN3b14SEAfKiUQnavrFGXeQiFnpvYzp4EhirvO4An
	 R9VPB9JiPAFAC+GTdFhs0vJvoyHqDfz0Yp1lonhXO8PFt7B49ChFbY+8kF4XbGWDdhIG2
	 DU4559lumJXMXhuPF93NXVLsfwvv203QjlwRqraokX3xYcm/mWmVbZDXlWs2EY3zaGF19
	 e517QTagvDDmEqttlso0qgqwxAXqOIPaGHD864/HzW9EP8CZDXlqnpHUlDk59+DFXDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793593757;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=VvIaen4c4S1OvjCkKBlpA5YHLuK53dkOlAhB00x7RGg=;
	b=Evl1J7h+3oigjJ6p7/v9lN3b7AuIcdIUel1YaGibw4YcyUTMn395EtWbdUbOWpHhcllL
	 C7ucu9j9NHG1ZCNPNV3Hc0vVdG8ANtPskILkaaxeAV1jdGLf6gD0y+1OhCKdFoeqDMjU6
	 A8xF87IwKuCgk+xJvl++ipAI/EaWAGzX3AoYHvczOrgA1bPAvFcxC60WUe3ILLpsnLuHb
	 QUmOjboyjHSYmf5bj65X/+3QpCDwvJM/cEWLkumpm58dU9FRRIcixTkoiUPRYHKUYtNOB
	 QtTPaiROX9+9K+bE4lCeDC0tvEIiFBpwWQuHCaOvacpFk8zJIOabbWeEyibKi/Ps5AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=F4qKAcjW;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E326606A324;
	Mon,  2 Nov 2026 04:29:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E326606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=F4qKAcjW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793593753;
	bh=VvIaen4c4S1OvjCkKBlpA5YHLuK53dkOlAhB00x7RGg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F4qKAcjWVD4kt+wSvblI5Yvq/abIDdDo3RWDo3fH7I6R5wqCVxmAX+pLl7/zBhbvJ
	 Rf8R1EeT5T9/NVFOcE5JkOB/z3HknHTlwAjfumFOkiKszm+BURzdBdoZASTpZdId/a
	 qwMrmqYSpqPXSgDtvJzRzZOLEyLnjmEZYf2DtYp5V/ia0kDP40Yo4V0DsKqyi2OIZC
	 WeihzZnBfJJ6eKFL/oDK0ARin1itzTvm74UCz90qUZKxhLQS4AZtas3huJooBIWgry
	 M0CRh0xGnL6WiPTBd5bfdWVbOOUHkIx6+wQBl3W82rBVd4ioiEeZTq7qLXuHPZfRSQ
	 jo2Ed+hjvWTLg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jHzHY6syKz4w26; Mon, 02 Nov 2026 15:29:13 +1100 (AEDT)
Date: Mon, 2 Nov 2026 15:29:10 +1100
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
Subject: Re: [PATCH v3 01/15] libfdt: overlay: Fix out-of-bounds write on bad
 fixup offset
Message-ID: <augRiw6Z9CKcwo_w@gractus.seuss>
References: <20261101220224.1436242-1-dianders@chromium.org>
 <20261101220224.1436242-2-dianders@chromium.org>
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
	protocol="application/pgp-signature"; boundary="5/a458dwjBHr16xH"
Content-Disposition: inline
In-Reply-To: <20261101220224.1436242-2-dianders@chromium.org>

--5/a458dwjBHr16xH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 01, 2026 at 02:01:08PM -0800, Douglas Anderson wrote:
> A malformed overlay with a negative or very large fixup offset in
> /__fixups__ (such as "/fragment@0:target:-4" or
> "/fragment@0:target:4294967292") can cause an out-of-bounds write during
> overlay application:
>=20
> 1. overlay_fixup_phandle() parses the offset with strtoul(), which
>    accepts negative numbers and values larger than UINT32_MAX, and
>    truncates the result into a 32-bit integer.
> 2. fdt_setprop_inplace_namelen_partial() checks bounds with
>    `(unsigned)proplen < (len + idx)`, where `len + idx` wraps around to
>    a small number when `idx` is near UINT32_MAX, bypassing the check and
>    passing the huge offset to memcpy().
>=20
> Tighten the fixup offset parsing in overlay_fixup_phandle(), fix the
> bounds check in fdt_setprop_inplace_namelen_partial() to avoid unsigned
> wrap-around, and add test cases covering both negative and overflowing
> offsets.
>=20
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

Thanks for this - this bug has been reported by a couple of people,
and I hadn't gotten around to making my own fix.

> ---
>=20
> Changes in v3:
> - Split the fixup offset overflow fix and fdt_wip.c bounds check out of
>   "libfdt: overlay: Prepare fixup and fragment path helpers for reuse"
>   into a standalone bugfix patch with dedicated tests (Simon Glass)
> - Add a comment explaining why an initial ASCII digit check is needed
>   before strtoul() (David Gibson)
>=20
>  libfdt/fdt_overlay.c                       | 34 +++++++++++++++++-----
>  libfdt/fdt_wip.c                           |  7 ++++-
>  tests/overlay_bad_fixup_negative_index.dts |  9 ++++++
>  tests/overlay_bad_fixup_overflow_index.dts |  9 ++++++
>  tests/run_tests.sh                         |  2 ++
>  tests/setprop_inplace.c                    |  8 +++++
>  6 files changed, 60 insertions(+), 9 deletions(-)
>  create mode 100644 tests/overlay_bad_fixup_negative_index.dts
>  create mode 100644 tests/overlay_bad_fixup_overflow_index.dts
>=20
> diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
> index 51a3859620a4..c6dc4774cff3 100644
> --- a/libfdt/fdt_overlay.c
> +++ b/libfdt/fdt_overlay.c
> @@ -330,10 +330,10 @@ static int overlay_update_local_references(void *fd=
to, uint32_t delta)
>  static int overlay_fixup_one_phandle(void *fdto, int symbols_off,
>  				     const char *path, uint32_t path_len,
>  				     const char *name, uint32_t name_len,
> -				     int poffset, uint32_t phandle)
> +				     uint32_t poffset, uint32_t phandle)
>  {
>  	fdt32_t phandle_prop;
> -	int fixup_off;
> +	int fixup_off, ret;
> =20
>  	if (symbols_off < 0)
>  		return symbols_off;
> @@ -345,10 +345,20 @@ static int overlay_fixup_one_phandle(void *fdto, in=
t symbols_off,
>  		return fixup_off;
> =20
>  	phandle_prop =3D cpu_to_fdt32(phandle);
> -	return fdt_setprop_inplace_namelen_partial(fdto, fixup_off,
> -						   name, name_len, poffset,
> -						   &phandle_prop,
> -						   sizeof(phandle_prop));
> +	ret =3D fdt_setprop_inplace_namelen_partial(fdto, fixup_off,
> +						  name, name_len, poffset,
> +						  &phandle_prop,
> +						  sizeof(phandle_prop));
> +	/*
> +	 * fdt_setprop_inplace_namelen_partial() only returns -FDT_ERR_NOSPACE
> +	 * when poffset + sizeof(phandle_prop) exceeds the existing property's
> +	 * length in the overlay, which means the overlay is malformed (not
> +	 * that the base DTB buffer ran out of space).
> +	 */
> +	if (ret =3D=3D -FDT_ERR_NOSPACE)
> +		return -FDT_ERR_BADOVERLAY;
> +
> +	return ret;
>  }
> =20
>  /**
> @@ -409,7 +419,8 @@ static int overlay_fixup_phandle(void *fdt, void *fdt=
o, int symbols_off,
>  		uint32_t fixup_len;
>  		const char *sep;
>  		char *endptr;
> -		int poffset, ret;
> +		unsigned long poffset;
> +		int ret;
> =20
>  		fixup_end =3D memchr(value, '\0', len);
>  		if (!fixup_end)
> @@ -438,8 +449,15 @@ static int overlay_fixup_phandle(void *fdt, void *fd=
to, int symbols_off,
>  		if (!name_len)
>  			return -FDT_ERR_BADOVERLAY;
> =20
> +		/*
> +		 * Require an initial ASCII digit because strtoul() accepts
> +		 * leading whitespace and '+'/'-' signs (wrapping negative
> +		 * values to unsigned long).
> +		 */
> +		if ((*(sep + 1) < '0') || (*(sep + 1) > '9'))
> +			return -FDT_ERR_BADOVERLAY;
>  		poffset =3D strtoul(sep + 1, &endptr, 10);
> -		if ((*endptr !=3D '\0') || (endptr <=3D (sep + 1)))
> +		if ((*endptr !=3D '\0') || (poffset > UINT32_MAX))
>  			return -FDT_ERR_BADOVERLAY;
> =20
>  		ret =3D overlay_fixup_one_phandle(fdto, symbols_off,
> diff --git a/libfdt/fdt_wip.c b/libfdt/fdt_wip.c
> index c2d7566a67dc..dd163d91498c 100644
> --- a/libfdt/fdt_wip.c
> +++ b/libfdt/fdt_wip.c
> @@ -23,7 +23,12 @@ int fdt_setprop_inplace_namelen_partial(void *fdt, int=
 nodeoffset,
>  	if (!propval)
>  		return proplen;
> =20
> -	if ((unsigned)proplen < (len + idx))
> +	/*
> +	 * Check that idx + len fits within proplen using subtraction rather
> +	 * than addition so that a large idx (or negative len) cannot wrap
> +	 * around 32-bit unsigned arithmetic.
> +	 */
> +	if (idx > (unsigned)proplen || (unsigned)len > (unsigned)proplen - idx)
>  		return -FDT_ERR_NOSPACE;
> =20
>  	memcpy((char *)propval + idx, val, len);
> diff --git a/tests/overlay_bad_fixup_negative_index.dts b/tests/overlay_b=
ad_fixup_negative_index.dts
> new file mode 100644
> index 000000000000..02ccee905e85
> --- /dev/null
> +++ b/tests/overlay_bad_fixup_negative_index.dts
> @@ -0,0 +1,9 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +/include/ "overlay_bad_fixup_base.dtsi"
> +
> +/ {
> +	__fixups__ {
> +		test =3D "/fragment@0:target:-4";
> +	};
> +};
> diff --git a/tests/overlay_bad_fixup_overflow_index.dts b/tests/overlay_b=
ad_fixup_overflow_index.dts
> new file mode 100644
> index 000000000000..d7d05267d7b3
> --- /dev/null
> +++ b/tests/overlay_bad_fixup_overflow_index.dts
> @@ -0,0 +1,9 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +/include/ "overlay_bad_fixup_base.dtsi"
> +
> +/ {
> +	__fixups__ {
> +		test =3D "/fragment@0:target:4294967292";
> +	};
> +};
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index 5bc7817dd12a..0d815e307909 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -274,6 +274,8 @@ BAD_FIXUP_TREES=3D"bad_index \
>  		empty \
>  		empty_index \
>  		index_trailing \
> +		negative_index \
> +		overflow_index \
>  		path_empty_prop \
>  		path_only \
>  		path_only_sep \
> diff --git a/tests/setprop_inplace.c b/tests/setprop_inplace.c
> index 61a0da16fce8..48182169fbf6 100644
> --- a/tests/setprop_inplace.c
> +++ b/tests/setprop_inplace.c
> @@ -80,5 +80,13 @@ int main(int argc, char *argv[])
>  	check_getprop(fdt, 0, "compatible", strlen(TEST_STRING_4_RESULT) + 1,
>  		      TEST_STRING_4_RESULT);
> =20
> +	err =3D fdt_setprop_inplace_namelen_partial(fdt, 0, "compatible",
> +						  strlen("compatible"),
> +						  0xfffffffcU,
> +						  TEST_STRING_4_PARTIAL, 4);
> +	if (err !=3D -FDT_ERR_NOSPACE)
> +		FAIL("fdt_setprop_inplace_namelen_partial() with wrapping idx returned=
 %d instead of -FDT_ERR_NOSPACE\n",
> +		     err);
> +
>  	PASS();
>  }
> --=20
> 2.56.0.317.g454f8302e1-goog
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--5/a458dwjBHr16xH
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmroEYsACgkQzQJF27ox
2Gc6/w//dbNrEKRBLdUR6jeYOFUC6Mbqn2AAljnyioTxxZxKCSyQdTXlNdJcbeZi
b3fIKX8RQgFe3TI/N3OoD4jEmAcW30s+D/sMGmVriZ4uTpLKDvTGoNTRz7+dK2Qr
9TTjMxH0/BsTmIuUZlHvyvnJDRQaERHmtG1fe0o2gEN7p3tvoa4VejQAF9Er+eHT
63p9s8wpWLE8BOQKquG4xs+RI0IsuehzOKeeWynL+skbCz0UcjAJV1Yys3ouRll4
r8obMrwpZYF+J1hwWQ1zHujJ4h/jlyRaYyuLZ1nyp46dUwDWyHPoyij7ri4NKp6Q
u9rtBygZvut+B9WAnPIyEc/z1DjVuXX4wm9wSg6nYzdMD7DpmS8v6N/DyXd/UtnM
BsSIUyAxOKfROEiPIGu77BQGGO3M7mzBPbJa1suh4TqzIhACuR/5iE6fyWdhMv/g
2lh46vZf0D7kZMoMv/teIBQjhjC5rK8B4VM0b3GYRCTLSm/8hhBmH40ADanTheoE
LOWGsiUtz/+H2FQooWqVxpTt3gB5GWzhh3KVNOqf1FndHllgAS+YAbg8SMxR2Tts
sF3LEy10elGtmj2Glor+dB3pbiEvsVCc+Q+MgRbzKeCfKqQtPvktmipqNaIt1RDp
2eMJQtlKFsYmjZ9SJ/sWQseoe5GjwcMfSJ3m03XJgbbTZL5NPZY=
=5OsC
-----END PGP SIGNATURE-----

--5/a458dwjBHr16xH--
