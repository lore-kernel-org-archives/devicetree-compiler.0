Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794887351;
	b=e3owymF/ble2Cke4nf0nCfUOlmk2057hc7Ow43qEAaLu3ZlbK2Ue1gjMbpkH94w95b59
	 ICSpudQdFX497t6MUsXeuQGi08S/lU0iWL6lfsDJrV7paSdj6T3sXXkvsUpIF+nk7B77g
	 AVncg8IE9Xmd/sZwGtMYnc1ogrDtebJiDIUQOpRi9O0i54RAvDw6IUz74Lqn73HVykrEr
	 ivLLrIzatgWm0kEzHIy3ELjPZUkai3IyfXPCLi6+AO5ybIVW5fs1Lxcmu/3TvQ4r3/Dfg
	 25aDhF//fdxkJU5isyHlhhy4lEmtTegejN7oDgz2D+DmVnB+CeUQ5Jx9HGAG44R8gnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794887351;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=kz9eQ61Ajq43uxmlFTJjwTmcAGgP+PmpRb4bS50Xo0k=;
	b=dnuvXyb3i18sa1gB+hniT4Ut3MI5nlIkTmp7ZoYVUYpQSxcuruI48Ojx24XXcKSFzDh1
	 FW+E+BzQ3+80Y52rQK3l8p9PqwQ7fsHjHIP9ilg0sB9ERGYdOF29qyuG26VQWeEHqC4+m
	 rm10k739isqrbivL+MKNob1Lt4LLxbr8k4+f16rRnMfT6Zo8svOI8ooGAhp5KrnB8ku3D
	 5BIO21WOlrheV4sPCeqoIaV8ACaXMi8gCQsYCA+8oxgxgoO8pbNhjjn1cesW5EF2A6rYq
	 HRJaCxYTiOsu04wxiUg5PbiIvgIXfzl8TufT9OzoQPfn6RcVoYJNYAI15MuT6aX8D+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=dBDwfsaC;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7750606A323;
	Tue, 17 Nov 2026 03:49:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7750606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=dBDwfsaC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1794887347;
	bh=kz9eQ61Ajq43uxmlFTJjwTmcAGgP+PmpRb4bS50Xo0k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dBDwfsaCPvpMXrlQRxkZGdSpNft02CmLvrosxD6kyii1kvb3C/glBHzWY90XQdbCw
	 TzEs+cc5scanTabCQfbZ1nR4j6740CAN57h1h5/K158JFqfekORlk/v4IEHGaf2NXK
	 rjTAy5IvTemngIVNWNQsl9+bMlNwdYR12hB2+1KcZzyddiiah7EGFwlZjJy5FHIKSY
	 q5cbFnXkm8nsXEBmc7fbpFCjyixoRrIcgb/nX99RaB3yVbji2o/+OZe7VYGmfyK4m9
	 WE9vo4GY084109BEHBUp9gGFsfzrlbAOF8AWLxYHEN+CFgXAmx7bACnRYk4d7ofgXT
	 pFCj8cUzCqmGQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jT9hM4jJYz4wSq; Tue, 17 Nov 2026 14:49:07 +1100 (AEDT)
Date: Tue, 17 Nov 2026 14:47:29 +1100
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
Subject: Re: [PATCH v4 06/14] pylibfdt: Speed up FdtRo.properties() with a C
 helper
Message-ID: <avvOUIIn9t00XqY_@gractus.seuss>
References: <20261116205320.1621386-1-dianders@chromium.org>
 <20261116205320.1621386-7-dianders@chromium.org>
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
	protocol="application/pgp-signature"; boundary="fn2kyC0KazwbIRxa"
Content-Disposition: inline
In-Reply-To: <20261116205320.1621386-7-dianders@chromium.org>

--fn2kyC0KazwbIRxa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 12:53:03PM -0800, Douglas Anderson wrote:
> Iterating over a node's properties via `FdtRo.properties()` currently
> crosses the Python/SWIG boundary `1 + 2 * num_props` times per node
> (`first_property_offset()`, `get_property_by_offset()`, and
> `next_property_offset()`, along with their Python `check_err()` and
> `check_err_null()` wrappers). When walking every property across large
> device trees from Python, those per-property SWIG round-trips dominate
> runtime.
>=20
> Add a C helper `fdt_node_properties_stub()` in `pylibfdt/libfdt.i`
> backing `FdtRo.properties()` so all `Property` objects for a node are
> collected in a single C call per node, interning property name strings
> via `PyUnicode_InternFromString()`. Also add an invalid-offset exception
> check to `testPropertiesIterator` in `tests/pylibfdt_tests.py`.
>=20
> On one stress test (walking all ~573k nodes and ~2.06M properties across
> 438 arm64 Qualcomm DTBs) this reduced `FdtRo.properties()` time by
> ~1.8x.
>=20
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Hm, optimizing pylibfdt has never been a focus, on the general
assumption that if speed is really important to you, you shouldn't be
using Python.  I'm happy enough with patch 4, because it's a speed win
with a very small and simple change.  This optimization is a much
larger chunk of code, so I'm not so convinced this is worth the source
complexity we pay for it.

That's not an outright rejection, but I'd need convincing this is
worth it.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--fn2kyC0KazwbIRxa
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmr7zlAACgkQzQJF27ox
2Gf+Kg/+LJCwJBC6cG4MVgEbPtcl8NpOc43ohCmSJXfubmq0lxg72NF6kL3jsR2T
I9WZfGWNhSCYAV54mFO2prRGyAQp7FGm2bZ3XqZm+BBdx1TWuR1izX+LCMxqQCOd
ozXyu8CmRzyocLUujjrHv2PEE+cmm+6cQYlJDTuACPdVoIcF0Cp50VGyNB7Xi+0v
cime+4o0Tx4ekNNUhJDV27d/vWomoXHTlzULYUO+YWDTgDVb89go8yLPa0oOhM/T
VmI3ExWjhK5ixnhG6pyw59VLiI/gKz3hBC0ywRUYCKENsCeyafeeiSP6G4K02Cuj
xRXM7cdCX+vuzNDb2SMbosbaNJ+EP7sRnXeadEUlSA/AzMWYsjCuwKRDWvZNlCPl
rmtYo7qDS/ctPnEfk1ykJHJacE4aRRszAFA98ImKc9TQp1o9Jz52QD3pv5Dijjsj
m/O661i4th4dWs9mFDsk28M0HYmXDnaudYaBx1S+T6Z3u7bh25ttYi2yqLSX694u
UD61YkyF5mD5SMi+4UDZQhK8AqFOT5IPkyEFuZUP93WRtYZbcWSF+DqGfFdWuBxr
GLmCY/4o/TIg2ew4YKgH2XTTJ87ZonmTUvGpNFUYbyyC496vG3Lm8urZ4epAIMwo
zCPvBR7M4qWxjtU//o3C56o7LuImLFxRECxFMM8uhuiuR4iMvHc=
=j/gM
-----END PGP SIGNATURE-----

--fn2kyC0KazwbIRxa--
