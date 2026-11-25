Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795588955;
	b=HahjbiarR+TDJ7uou+AFmMUgy8i+qQIsJYQ+80v3I+x9ijTca9gMW+tRsSwddF2QjoN6
	 7YPxdPnmgctqPhEQqy4CJhE6MNTFqJBToJyiJOBXKbvaowEKr7mFKXohA7mDgMHM5YIbC
	 12cyjs3sM49SWCkyFyjI6B/APOhuI9Q4j4/+eS3AqaYZT2Lk60ZvxN0x0Jqb4ZukZlnff
	 RtSm4rVP16HlpjfEtX1rI9QeB3GRb7g6OS6QLUeXaT7d9I97PMr0VXhb3tjSOWo/ULbbZ
	 4Thrpl1Pm+BIn1Y0IKj/xKpRgC3Mv+o9NyBF8xTDCGAUAmbxsVolTf0QVWSnz2ZTX9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795588955;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=rS0Ckvq0d9GHKauZjViYJUPo/jQv2P52j6L6evNG2g0=;
	b=i6xu87hL1P5448NvZ9ECfVNaD3Bd6N4uTaHY8TOpwfqlbvqO43dRW0YyBN5n6nkjah2c
	 YLmLY+7nF0Bq6aMt0Vyr5DDQkyp3K4BNm7OBoqbFxgV9s0T1+ifuRC0YFMeV/da0/ithF
	 UvOS2m/ZjP/S4DQXUoyuqmScg882WRIPhRKAswbS0dnxA2KLDutZYKQlIc+9d+oxd9T0w
	 yTppIMZlUNJzcQVu1yxvVBIL3H9zmnD9j2XGDfEY7FBIV4qUNinJBc68LwqrWVjrpTT2l
	 742Du8/DHmKHlJFHFuW5kZVzB9TYCdoV4b03oLkyeNg/XweQJlcQMDKhXjMvyoJpgJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b="q+tz/ByL";
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27653606A323
	for <devicetree-compiler@vger.kernel.org>; Wed, 25 Nov 2026 06:42:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27653606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=q+tz/ByL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1795588953;
	bh=rS0Ckvq0d9GHKauZjViYJUPo/jQv2P52j6L6evNG2g0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q+tz/ByLFrrwrqcq//d5FwV6qbwbpPDSvib2CUglPSb6NNkT5IFrLFJxQbIAsoF7d
	 1g0I7r2jonyieiTZzV0782Iy9u2z5QKomNRlL/LaBBY7CpzMgUL0dei6gmsxs/8TYd
	 T6GkCD6eOOsSQ8JAAzYaBecj1FrrFcU1a1JG90jwsd8YGVBzG4g7dkrmMPGzhIil3A
	 urk/WGBeUoPwaGuU1jw4fWPiq1lgdk/PDRCD+lrusn/Qguyh3r4wuSCkdXkri1yhI9
	 UtBtkRmKDRXlERtvmSg4W+fgdKmgMmLsHMeyxC0Y0sQ5wqHKYfxjLlMM67KuNTWK6W
	 SpqJWv0D0CxJQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jZ98n4yGGz4w1k; Wed, 25 Nov 2026 17:42:33 +1100 (AEDT)
Date: Wed, 25 Nov 2026 17:42:25 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v4 01/10] tests: Check how the fragments of a dts file
 are merged
Message-ID: <awaDRRjVq0O7yMDU@gractus.seuss>
References: <20261116235813.935070-1-sjg@chromium.org>
 <20261116235813.935070-2-sjg@chromium.org>
 <awYtBTUE2zhepJU2@gractus.seuss>
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
	protocol="application/pgp-signature"; boundary="u1CVUNvNEOVmpTQn"
Content-Disposition: inline
In-Reply-To: <awYtBTUE2zhepJU2@gractus.seuss>

--u1CVUNvNEOVmpTQn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 11:34:30AM +1100, David Gibson wrote:
> On Mon, Nov 16, 2026 at 04:57:55PM -0700, Simon Glass wrote:
> > When the parser merges the top-level fragments of a dts file, it can
> > report that a label or path is not found, or that a label-relative
> > reference is not supported in a plugin. Most of these errors are not
> > covered by any test, and the two tests which do reach them only check
> > that dtc fails, not the message or where it is reported. The merge
> > logic is about to move out of the grammar, so this needs better tests.
> >=20
> > Add a test file for each error which is not covered, and check the
> > message and its position for all of them, including the two existing
> > ones. Also check that merging carries on after an error, so that later
> > errors are reported too, that a labelled reference within a plugin adds
> > the label, that / { ... } and &{/} { ... } differ in a plugin, and that
> > a label in a plugin becomes an overlay fragment if it is not found,
> > since nothing covers these either.
> >=20
> > Assisted-by: Claude:claude-opus-5-5
> > Signed-off-by: Simon Glass <sjg@chromium.org>
>=20
> I've tentatively merged this (not in 'main' for now, but I plan to put
> it there if no additional problems appear), because I think it's
> useful enough.  There are a couple of warts that would be nice to
> address in a follow up.

Now merged to 'main'.


--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--u1CVUNvNEOVmpTQn
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmsGg0UACgkQzQJF27ox
2GfgRg/9EGQ65DNk5IqhOsUbnWwdFjrIslCIFm6pzzi88aZPPxKQCmy3OiosHV9H
XIKzAkg1mW/92NOAcM7Z9AVjDNY/Aa1tozxhd+3BTxodFtZQryAx7y+CXJfqlI5I
vg1GjrlY9iG/TBvnbeRrFPRUbT949WtVOaUnqwYkntG490bjfzlpWrd2Eyu2chGU
nPp86LLA+oF5HgMX2GUqyqmpm9p2YPY4iDF8l0SYOn5lv/TmDz+euE8MHypZDcji
RVbwq1FwfKrdzD2Bp23L3RPHHY+0wY07aJXpMzYFMBuN6Scndih9P59G69kvKGSG
4OW2hqOb9r46KHAgjskVTfKr4biGpeElue04wFkGSikOt0CTgbm7Qsk+Ubd8bzRv
THEW3KpKZ9JwK1foXLbZVNfeiT5avPFnMu8acAS/sXKkW40BR5he7mLkomtPmrQS
rVElEU8jhy0R+uonv8EawQq5zutFsvQhhY34L3fNDcLlb4GJh91rKyjkGz7B9GgV
BS1Jq1E2YtCV6ThVZOQodqnnfgooaQm0g9UqMeOv2TjzyexlM53lEYFrc2bDghWn
rkYMBYicLJgQApISzHkklkKwSoZ1J3h6LOui4xy1S2qYq+o09ppjKyaVNhuoUV+h
tkBQYAw9ryMDc+zJvqzprOnv3T1p56yb0yZtXzsxBkDrzra5vek=
=+SOt
-----END PGP SIGNATURE-----

--u1CVUNvNEOVmpTQn--
