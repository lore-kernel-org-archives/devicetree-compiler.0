Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793594165;
	b=S47Tnx5WOm7P4eHNlxvhFAK94wvUdA4iLN1VQLFBVi/T8AJ6oI83UKFH6Gfz6bki3VbD
	 TMIh6EKVGCaArv4mcBlCGIzSiEP+eAni3grA+co6mXTjAr7bL8uxsnJqqShNQXDnO4Xso
	 j71OpwXiiQVcZ9x7KdqEHYCoJsphCJh5AjjUpnJym1u3KTaioCP0AHXLVUWESaAr/Qr4q
	 qMfvsOMJcPFsAENmcoZlbA+ErDjWaelPvmZgnz0Vlacn9XvOeamKd/hopldeeoDLIOTNi
	 59FzsgcWelExhxPmSUaUStXA0lpmc9UEHLSrzpgaYZ0XOLwNhc/eN27A4/Np0sjHx1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793594165;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=Sg7TvK/2euWphOjc2oUTVlVEagJ3P4XkuOpyCgVN8NU=;
	b=N4rmqN0++a132RF4CnVuF2alWb97oKtKiz6mukE3jKqS2ZkoSloY5aLYpRc49zFm5Ptr
	 d4ntB5stB4WEUcF36ZTnaP2rBh90I9QqKIP15CbwX6Q9ZRF8eWg9kVfUcYIPm6wTh2HIu
	 0xKoCoP1EQKO7UnP5xgjXDNiOTL5noCHnVNIgUU46am+m4yZA77v/gdqvSZe2hPG+ZcBu
	 w2cwqPigUzLSlh/yu41Y4VcU+xf5Y9uzmiTLcB6iZVS2tAiPUN8i53vNKxUZydsVr49lA
	 0POqXkD42+WzWSTdfGiy5zMV7aVkmk3S6xFzXolrJLqLsJvjh7VLM7HWlYi9xYp8T7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=Bu9Jjonj;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06AA606A324;
	Mon,  2 Nov 2026 04:36:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A06AA606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=Bu9Jjonj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793594162;
	bh=Sg7TvK/2euWphOjc2oUTVlVEagJ3P4XkuOpyCgVN8NU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bu9Jjonjxq3OfBYbyHtSJQnNX6n3T0zJogHLpWqud1tx2s9HdyM0BAGk6c09xdzZK
	 nzBF8v2qFKwWXkA0uLllzf8l63sJcMJNJ2U4p3Fq7Dx4vV5KVE4yOIKyeJxvo/pgAB
	 qVgliLLs12FpFcM48NuN4sUdMN4JSt3VAga+cK+XEuDEI1s8kGEMdc9bV+XMURXAuY
	 5OCsbuTAP8cnyxRfCZvEqwQoDt6S2O6abtzrHKPOLmlCi278db4ZEQn9ibzAq81qnf
	 7SYyPgqD95RJ5iDmXXE6UYlDsZdFPmpvZ//Vqj5jrd9RRwqzr4mQJDtugOWvir1wSb
	 3dHBj78Dx0m7A==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jHzRQ2qRvz4w9g; Mon, 02 Nov 2026 15:36:02 +1100 (AEDT)
Date: Mon, 2 Nov 2026 15:35:51 +1100
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
Subject: Re: [PATCH v3 06/15] pylibfdt: Support copy.copy() and
 copy.deepcopy() on Property
Message-ID: <augTJlhOWSyCZ9E3@gractus.seuss>
References: <20261101220224.1436242-1-dianders@chromium.org>
 <20261101220224.1436242-7-dianders@chromium.org>
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
	protocol="application/pgp-signature"; boundary="TNS2xq6aYDPVi/hv"
Content-Disposition: inline
In-Reply-To: <20261101220224.1436242-7-dianders@chromium.org>

--TNS2xq6aYDPVi/hv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 01, 2026 at 02:01:13PM -0800, Douglas Anderson wrote:
> `libfdt.Property` subclasses `bytearray` and has a two-argument
> `__init__(self, name, value)` constructor. Because `bytearray`'s default
> copy/reduce protocol passes only the raw byte buffer to the constructor
> (and does not copy instance attributes), calling `copy.copy()` or
> `copy.deepcopy()` on a `Property` fails with `TypeError:
> Property.__init__() missing 1 required positional argument: 'value'`.
>=20
> Implement `__copy__()` and `__deepcopy__()` on `Property` so shallow and
> deep copies preserve both `name` and the byte contents, and add a unit
> test in `tests/pylibfdt_tests.py`.

Oh, good catch.

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

>=20
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>=20
> Changes in v3:
> - New patch in v3 to support copying Property instances in DeviceTree
>   (Simon Glass)
>=20
>  pylibfdt/libfdt.i       | 6 ++++++
>  tests/pylibfdt_tests.py | 6 ++++++
>  2 files changed, 12 insertions(+)
>=20
> diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> index 51db9535bd39..fa5f499ed96d 100644
> --- a/pylibfdt/libfdt.i
> +++ b/pylibfdt/libfdt.i
> @@ -908,6 +908,12 @@ class Property(bytearray):
>          bytearray.__init__(self, value)
>          self.name =3D name
> =20
> +    def __copy__(self):
> +        return type(self)(self.name, self)
> +
> +    def __deepcopy__(self, memo):
> +        return type(self)(self.name, self)
> +
>      def as_cell(self, fmt):
>          return struct.unpack('>' + fmt, self)[0]
> =20
> diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
> index 18730965bd02..ae46b29a8f5c 100644
> --- a/tests/pylibfdt_tests.py
> +++ b/tests/pylibfdt_tests.py
> @@ -4,6 +4,7 @@
>  # Written by Simon Glass <sjg@chromium.org>
>  #
> =20
> +import copy
>  import struct
>  import sys
>  import types
> @@ -192,6 +193,11 @@ class PyLibfdtBasicTests(unittest.TestCase):
>          prop =3D self.fdt.get_property_by_offset(poffset)
>          self.assertEqual(prop.name, 'compatible')
>          self.assertEqual(prop, b'test_tree1\0')
> +        for copied in (copy.copy(prop), copy.deepcopy(prop)):
> +            self.assertIsInstance(copied, libfdt.Property)
> +            self.assertIsNot(copied, prop)
> +            self.assertEqual(copied.name, 'compatible')
> +            self.assertEqual(copied, b'test_tree1\0')
> =20
>          with self.assertRaises(FdtException) as e:
>              self.fdt.get_property_by_offset(-2)
> --=20
> 2.56.0.317.g454f8302e1-goog
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--TNS2xq6aYDPVi/hv
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmroEycACgkQzQJF27ox
2GeRKg/8Dc7XjGcQ1nmIcKzMCjCnJpk/qOTid4sOkiNbHf6vtQTmKKILbaILQm7o
yVGq1YMPLpZjQw4kgAeiTGp6Z8sXv3ADrv2SYDzddkUswFaOZBFm+U095dRz/OAq
AkscS50hIfBQrchXRz1kF5VWWq63ZD5eCGGBIVei80NQLqkHIpSJJyaIZlzLtutt
ZgmeRb3VZbk+dvWe5wUywWeDmhcBVKJVjfjXQsWKTwNWMOo8s8aEj/f3Kl8VIkaq
8avjq5olUd97flTWezxp3u55E9A7WA5AGYDiXnPcKy/iVhb7dPPLLqvGLq/8h6VK
e/aArAuL2ziK4mUjS3rhgt66cTcymV6ZsOui6s4P29xMsopUCyvHbsS0eiBCQ5rz
QafqqcIBIt4s9fOA6e4ia+O75Vxg+JhnqO7WMWrSF2dCN6im59Q8bXbp5xSLpAG7
DI97SaQ8P+5tjOXs+w2X7zVd59c3VOqLwfFicbIWRu40pXXnOczQIrqZhML1eLDO
5QUT571AnciimFYVt9AnDMbSjilk6Un+uQXCEZmRjldwaG0VQvpZe5RDTa7k7326
2O/FRI6WVeaG5Q4uy3O8aIfTejeAPGr/mLMXLz940b/ABVxt37wpGmuowueF/Ly6
tGGzBFjLpLhyqBtp4lIa4pgKCY6ZSM+KZOwvMbbHi7pS9uGhbD8=
=9+5v
-----END PGP SIGNATURE-----

--TNS2xq6aYDPVi/hv--
