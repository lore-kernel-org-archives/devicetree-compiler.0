Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793594036;
	b=S+0/sc6VNw4LV0e0vEzXBW/7y+u6GnceiSvJ6XNa92GzHZEcn1yMmQggtS0rr5DJUJKV
	 bmsBqskDH+70pLBSU4G32nG70jXSIYmgg+GNWoxi5etjZIwrwmEV9596WaQCrrrzuVL3S
	 FS2DW1ChU+vMLtHPpB8V6SCb0BVzekfLJE1nGC8ftwGEidPmm1EdvVRguS1mkHCp0wNQa
	 e9NEBC8iouvJMWpM0RBdGrgPWPDpPrkYKQJdLGMF9sgT+d+8K3LdLcpIwb0N3kROvDxEm
	 9zDvqGLq998+f91pFNQUKQMZrnDHjg7IEc0VCEURJ1bCGZ8mfFHWFdGADrdrpGB5alg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793594036;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=EbYJr7aQmED1bZX02I+Wqc1dcjZi3BEwTzksoNkwOi8=;
	b=CASN9hsGuDBmkSMRYDPd/zTvh6ZpZf8AeLsAwxeJFQ+pjc7IyyPcinKzBFHjMTIh2DD/
	 NcdrV+I8SxxHqECdvfRMuk9Jvo5Mm1X/pigmrg8Jo2TpHp/3/m+JDVBEv9XYybL4U7K8e
	 lAWgkKlZLTIc80zKf33liqqSsqu2sjQG+PC8DaRm3Hu8j19//NDyDcqhPOrauQ6qyaHoY
	 R682lRnwR9StzHGucsZuaba2EkP9/Sjbr2Vgyv9MccRDqdwGKv2ju7AQGX5pV6KdeKhm6
	 pc5ImNktUykQvOb4Zz7GxKlT/D0exArXdhNuoVKkP6ptjTXtbXK0CREQzYdusXBIgzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b="hr5+/Yoa";
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32913606A324;
	Mon,  2 Nov 2026 04:33:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32913606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=hr5+/Yoa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793594033;
	bh=EbYJr7aQmED1bZX02I+Wqc1dcjZi3BEwTzksoNkwOi8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hr5+/YoasLVs0zZGNtmAjkXqz1/EtwbWYFa5CKt/YQPktMBzk+nN0B8PzMjA6opXx
	 6diNjDopRbFjLMzHYZHOfxd5V2B8wjAEI2LrWTkCFdgg5mo0tQWSjmHoo0Mq3v88o2
	 2Z6Imtuz9DMOOPUTVaHh1xgSfhw/ljOVf/SAheTC6Xkvzy9eB7bZc35JnjKe1fGZwR
	 3OZv6mnAu17L7eWSTFtS62R3JdxbBieGYiFjB5/wGANxmolachuTMlZXdm9LhYIsZl
	 doc0gE1TVYH8Y8CCi2xK7JpHWhB6zuVmQX/v2w1lM3nvZ2iTwgeXRc7OcJuTDYPSMk
	 06gp2e7rJPsTg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jHzNx4hjtz4w9g; Mon, 02 Nov 2026 15:33:53 +1100 (AEDT)
Date: Mon, 2 Nov 2026 15:33:33 +1100
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
Subject: Re: [PATCH v3 04/15] pylibfdt: Handle empty properties in as_str()
 and as_stringlist()
Message-ID: <augSnIzaWsUqepc6@gractus.seuss>
References: <20261101220224.1436242-1-dianders@chromium.org>
 <20261101220224.1436242-5-dianders@chromium.org>
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
	protocol="application/pgp-signature"; boundary="yeNNl7mVhUnEPhE4"
Content-Disposition: inline
In-Reply-To: <20261101220224.1436242-5-dianders@chromium.org>

--yeNNl7mVhUnEPhE4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 01, 2026 at 02:01:11PM -0800, Douglas Anderson wrote:
> Currently, calling `Property.as_str()` or `Property.as_stringlist()` on
> an empty `Property` (`b''`) raises `IndexError: bytearray index out of
> range` when indexing `self[-1]`.
>=20
> Update `Property.as_str()` to raise `ValueError('Property lacks nul
> termination')` on an empty property, and update
> `Property.as_stringlist()` to return `[]` on an empty property. Add unit
> tests in `tests/pylibfdt_tests.py`.
>=20
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>=20
> Changes in v3:
> - Split Property.as_str() and Property.as_stringlist() empty-property
>   handling into a standalone patch and add direct Property unit tests
>   (Simon Glass, David Gibson)
>=20
>  pylibfdt/libfdt.i       | 4 +++-
>  tests/pylibfdt_tests.py | 7 +++++++
>  2 files changed, 10 insertions(+), 1 deletion(-)
>=20
> diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> index 5c8859b37df3..eb14312986ea 100644
> --- a/pylibfdt/libfdt.i
> +++ b/pylibfdt/libfdt.i
> @@ -932,7 +932,7 @@ class Property(bytearray):
> =20
>      def as_str(self):
>          """Unicode is supported by decoding from UTF-8"""
> -        if self[-1] !=3D 0:
> +        if not self or self[-1] !=3D 0:
>              raise ValueError('Property lacks nul termination')
>          if 0 in self[:-1]:
>              raise ValueError('Property contains embedded nul characters')
> @@ -940,6 +940,8 @@ class Property(bytearray):
> =20
>      def as_stringlist(self):
>          """Unicode is supported by decoding from UTF-8"""
> +        if not self:
> +            return []
>          if self[-1] !=3D 0:
>              raise ValueError('Property lacks nul termination')
>          parts =3D self[:-1].split(b'\x00')
> diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
> index 93408745c575..20741d8f2df0 100644
> --- a/tests/pylibfdt_tests.py
> +++ b/tests/pylibfdt_tests.py
> @@ -423,6 +423,10 @@ class PyLibfdtBasicTests(unittest.TestCase):
>                           self.fdt.getprop(node, "compatible").as_stringl=
ist())
>          self.assertEqual(["this is a placeholder string", "string2"],
>                           self.fdt.getprop(node, "placeholder").as_string=
list())
> +        self.assertEqual([], libfdt.Property('empty', b'').as_stringlist=
())
> +        with self.assertRaises(ValueError) as e:
> +            libfdt.Property('bad', b'no-nul').as_stringlist()
> +        self.assertIn('lacks nul termination', str(e.exception))
> =20
>      def testReserveMap(self):
>          """Test that we can access the memory reserve map"""
> @@ -523,6 +527,9 @@ class PyLibfdtBasicTests(unittest.TestCase):
>          with self.assertRaises(ValueError) as e:
>              self.fdt.getprop(node, 'prop-int').as_str()
>          self.assertIn('lacks nul termination', str(e.exception))
> +        with self.assertRaises(ValueError) as e:
> +            libfdt.Property('empty', b'').as_str()
> +        self.assertIn('lacks nul termination', str(e.exception))
> =20
>          node2 =3D self.fdt.path_offset('/subnode@1/subsubnode')
>          with self.assertRaises(ValueError) as e:
> --=20
> 2.56.0.317.g454f8302e1-goog
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--yeNNl7mVhUnEPhE4
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmroEpwACgkQzQJF27ox
2Geb+xAAhiiAR1ltk3Ep9NuWIseBFwOIaFCAQZawClIZSXm5Vlb3vY8HIF+LGh1W
+RHimzzOWCpPj1NRfWu7mL+GBuB49PRoGtJ3k0yXiPoZwNXHGYQLXGkYV/QvLK37
fN7OZfJRcv13zEXCliSiieCTGC1G3yOlnNgaBwjct5MseyMgRrc8k7bw4QxWkD/b
kq5cDvjf3ptdSlS9tzazeEsDS7nWI1B77Q2DMuchDPWUMYJc6ECX81CCWf0OKa2q
fclrs2uYw49MdAMO7CH1uQ4U79Fcew2sm/ogTs0mKMR970Ma9IPqLcL301xBk1tE
BTryc5OTLcR7HjSpD6HtKkj1KdCvmyNPiXpf5kZo5LVoR081DFTOlOUNZJTOIurr
Y1UG4XM66WDoZm0K6wxVtgAlp1SRC0ByqsxkUBLpyJQezs3Hio7xV1xHmNrrIfWA
Esm5Uc78rKmAsDEYt9TA35odm+M6zihuG24FSxbneKvrLtoraagV9tGo+XNeDLQ0
RY/+cHJEpB2S3UbKouviS3VdfELGOsHhJRMELP7FogJg9CcdPjzLua7jaU0Bexqx
NqHvi8aVVBK8brqA074ZMLFpRKcbJY5L71cmsE8gNleY1P91nTTDsCmBqzAcfxco
t8sLYrbEaA1neIKnkSwyuGniACb5Gk/2hTUQR4ckmJns3pjpfZ4=
=iLCK
-----END PGP SIGNATURE-----

--yeNNl7mVhUnEPhE4--
