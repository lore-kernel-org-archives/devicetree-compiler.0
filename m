Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794888048;
	b=hp34U7JSvoD+QlbEFAszgaE7E5RjIhUfdtvD85GY6Q7Zy4eN3Zxj/TrX75VPbBFX0dfX
	 E9LeAwQOgTmqzrs894+USlGcPtpCKMctKhGI/cwzeGRP6JkXtxld+XyfiRgdwVzR0M/NU
	 5emZzH4i8lx10b+Z3X+pQKNM/UzZL0Q2Kea6YhuP+B+NRI0ZKV+zq3dnh5NfMhOBBCCx2
	 Uyk6tqbGWFNyjixHRkfhSyIQa/g6jeYD+VcFluKpygF1UTqz7D4tdhF45G1slsgAnTdXx
	 4NrBnIOAnsX1CbRfLJnEyBjUuZ5XQtqD8ob05C0REfY5/4mAbUU9nFpLZaLBRenejfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794888048;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=nch5behXXAoQGEBsA2Q8BdXIFkZHgLBWF8ZJ/y/s5/w=;
	b=uuZIAl6lqZHrFwQStvTkPvcVNUhfP5NHrNReyqB1ftarOXQ4R+EdZktDI2Lg1l5dQ7C4
	 G9HhJNLCdipW+J+yTS4eMsXQeADta1RM1cEjBdwol6QtX5gZV3N4ckou1MLiHUcsQ2HZR
	 I8mRFUn5hBpyiXDJ2MJTRl36eI8JMT24DK53m04ZhWn2OO2ifXuS/XQIogEI56Z22Ocjd
	 ODHkNckQKi8tO/iq+GVQs7bp4FfOWcSnmmWhZhUykHIMCM1Bo7i8xDZZlY33MgUzgREY7
	 QoADTeBsV/v2LeGtfnfIB2uo9WzTP2GgjliCkXidYwdFgUovaiMorwDb+291vFZ5A5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b="i/MM1djq";
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0EAC606A31C;
	Tue, 17 Nov 2026 04:00:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0EAC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=i/MM1djq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1794888045;
	bh=nch5behXXAoQGEBsA2Q8BdXIFkZHgLBWF8ZJ/y/s5/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i/MM1djqiztgRar1CVJUlGk3V0wOd+lZbDoONdrVfCgQBl6AKtsSyv5BEyjGabkVf
	 842tDz+Bddi2TjssUUIc+PAVUn3CQM9vh5leaZlfjJ06TmBNPn2PLsaeVlVaCtSjpU
	 7g8MupoVD1VUfaPZh0Ju3cErhtCgDdnzYXJcobqfrMKf5/MN+dKU/3e97i0lrIcFZl
	 GaRcf+X+bJV5QP2idBvvc7iPR71v3VikIA5gWHXFk3WhGHv9DdnoZdaBDw/Y/vIuGQ
	 xilrfKiwK/uHFLTo/gH6MT4FpfjrBHh/ePhMKWUJaP4ZYZIwvGH0d55JHfJNgae3tP
	 0hVs8nvWsJEvw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jT9xn1xn7z4wT2; Tue, 17 Nov 2026 15:00:45 +1100 (AEDT)
Date: Tue, 17 Nov 2026 15:00:36 +1100
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
Subject: Re: [PATCH v4 08/14] libfdt: Speed up fdt_find_string_len_() with
 memchr()
Message-ID: <avvRY-nTstFbvTpF@gractus.seuss>
References: <20261116205320.1621386-1-dianders@chromium.org>
 <20261116205320.1621386-9-dianders@chromium.org>
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
	protocol="application/pgp-signature"; boundary="y2Lfunv7MMkdVJQ0"
Content-Disposition: inline
In-Reply-To: <20261116205320.1621386-9-dianders@chromium.org>

--y2Lfunv7MMkdVJQ0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 12:53:05PM -0800, Douglas Anderson wrote:
> `fdt_find_string_len_()` currently calls `memcmp()` at every byte offset
> across the string table (`for (p =3D strtab; p <=3D last; p++)`). When
> building or modifying trees with large string tables (such as DTBs and
> overlays with hundreds of `/__symbols__` or `/__fixups__` labels via
> `fdt_sw` or `fdt_rw`), scanning multi-kilobyte string tables byte by
> byte dominates serialization time.
>=20
> Advance `p` between candidate first-byte matches using `memchr()` (with
> an explicit `slen =3D=3D 0` check for empty property names and a `tabsize=
 <
> slen + 1` bounds check before computing `last`), preserving identical
> suffix-sharing behavior.
>=20
> On one stress test (running the fdtfactor tool across 438 arm64 Qualcomm
> DTBs) this reduced `fdt_property()` time by ~5.6x.

What we really want is memmem(), which would presumably have a similar
optimization (and likely more) built in.  However, we avoid that to
make this easier to environments which lack it.

Complexity isn't too great, so this looks reasonable to me

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--y2Lfunv7MMkdVJQ0
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmr70WQACgkQzQJF27ox
2GdXGg//VAN2c/+tVxA+i134JdE1rkg86AFIXLIG+rVHy/wnvU56Q5VCXGlwRLwE
EZ9Ic9BYZU7wZCiHM1ILDmf6Icz58PG6XBeT7zkJwUKYJzbVL7fDXznPQ7p60FD5
Ush3w2y12kXvnPp3XVyu7YKo9Um3ycz3q4VNZ9FehJI1e3/wk/CtSnf7ET2/GnwZ
PHoeH4wu1wkT1CN84WUVlbRTXD+xQcK9S8p8lblTWXtO+J5iQUpgf95+7J+AyIYF
3825McL+hrqMiugnNqsysz0SiZH5beTjDeAveEnD0Y70NzM7MU2zcDrYNHxw1jVV
nlBON2MJx1O9qNE/k7gYXKbqbYkBCkmfZiSBgAVs3OYIZnuaFYdsia5BiiP/CfIy
POTHRa3DbEXNPa4QIF1XRaS6QZfVpkkCcMm+FCGe1ayk2HiM8m0s6pLmsJkMPU16
lvUmOiwP+IS4ngOLvt635yH/8RT+AEsCOvBuIqGB9tz6ATuLFDXxPnqFXArIBFbn
9w0UaUzCk7myLfFzT/usc8A8K5v85+2qjDEG0ddA0UI5PMuU5h0AlZwY71xPQsDr
T+t/8IMB+fZjh4rZ4UDcCmwicPXtSz22+O4enEHQWiHQzCjCsZNv0wB5ozdPKgbF
bx3KLLXdZlhoGCVls9hcMEvuuuerAhCuZjwMbSEFNvdEPc1gcq4=
=yvwf
-----END PGP SIGNATURE-----

--y2Lfunv7MMkdVJQ0--
