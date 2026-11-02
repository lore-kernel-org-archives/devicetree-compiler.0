Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793594078;
	b=JvITG+Udj+75OPErSRgS9CdFkvtV46l0iSzPUV1Snfs11hSH+DrawmuBVal8IodINal8
	 syaWZJ4zW//FD28P8fZmZsdXHLO5Nr9k/ncfzng85Sj+fuq0Y6mQsaTBEgupir8joy3cI
	 40t/0nI+Rc6ifZsdkv5pVzLQawGkkm29cpOEy9Ictpfo9DJebWSh4FMi4UMz325raqrDB
	 uUcHLQkCN5CQ/uB422V67HvNboRFo+tlKqF2Hn/NU8prCAqpki5THsPkUAZ5e0D5aNbaz
	 cTH9UjXG6aL8vCAJ1z2lcl5TfkMLXhH4ibRm16389K2QVUyhSy3WEIb/mVNK3l9LnXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793594078;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=VY5e+2jmlJBdDo2s2H13rYBqURDgGqj2HtzfzZAzCVM=;
	b=ERLwKnl5HoNgtFwusLaz58SGwCliRp6rB5Yr9rl9GA7IlBqePyn6nOrh2hAbH+/YFpWv
	 CJdwKvOt6q7rkx1KfM7sRniEk6ArhkbCyBGntONWx5rhj0ssm0ql9Osu1KGjy8VgB1ZeI
	 BG3Ajqy+yf0h4iYQYl6WTu5E/qXH/ijxsfaswn3fQAD4VSoKRT1EVLqWC/QaDybuDUDA7
	 jUA/aN2eN/SOPS775QTjEF9FVVqnpESzK4FPDy8SqVqA2SlnGVzLZbp090FpmaPmWphMs
	 iDMfZaSYcZG1qFOegXQ659fLELigu6abmgl7dUY8fvAQRZzLEi3k7PfNz7IaPDUWzcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=eQuf70vG;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE40606A326;
	Mon,  2 Nov 2026 04:34:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DE40606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=eQuf70vG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793594075;
	bh=VY5e+2jmlJBdDo2s2H13rYBqURDgGqj2HtzfzZAzCVM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eQuf70vGJy79KQDqoczkrIdan85NPOskd3pjotgAzcqYQk8KNPhe83ggevu+LRjQi
	 0k2S0xfUUj4IVTXv3NSPtk58ggs6TDCOcXcYbkKnz+WGNqI0WyOcDBD9yKkVuoThlY
	 09QcJOSaF7pMWfmn1RviLK8UtjI3JtI8DMRfiYnB2ONv09Ieza+/AEhSoRetTo9hNU
	 6ToWcXtGenbMquYZzH1wtt5bODdN3ASFyDRtSK2O9f3hwAU+vwp4/bTP9pRKUHsMZ0
	 50dJjEPA/QLgP558II9O+kbCWKpLzahF6Cte7zzdEWVnb7BmGzFpUK/vsEVpyVrmoJ
	 vTKcN6SLdKoKA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jHzPl3xVDz4w1Y; Mon, 02 Nov 2026 15:34:35 +1100 (AEDT)
Date: Mon, 2 Nov 2026 15:34:31 +1100
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
Subject: Re: [PATCH v3 05/15] pylibfdt: Add Fdt.set_boot_cpuid_phys()
Message-ID: <augS1kuEqWg1dwY9@gractus.seuss>
References: <20261101220224.1436242-1-dianders@chromium.org>
 <20261101220224.1436242-6-dianders@chromium.org>
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
	protocol="application/pgp-signature"; boundary="huBQBrPKeN5EmrMX"
Content-Disposition: inline
In-Reply-To: <20261101220224.1436242-6-dianders@chromium.org>

--huBQBrPKeN5EmrMX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 01, 2026 at 02:01:12PM -0800, Douglas Anderson wrote:
> `FdtRo` exposes `boot_cpuid_phys()` to read the physical boot CPU ID
> from the FDT header, and SWIG already wraps the underlying C function
> `fdt_set_boot_cpuid_phys()`, but `class Fdt` lacked a corresponding
> `set_boot_cpuid_phys()` method.
>=20
> Add `Fdt.set_boot_cpuid_phys()` and test it in
> `tests/pylibfdt_tests.py`.
>=20
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>=20
> Changes in v3:
> - New patch adding Fdt.set_boot_cpuid_phys() to pylibfdt (Simon Glass)
>=20
>  pylibfdt/libfdt.i       | 8 ++++++++
>  tests/pylibfdt_tests.py | 3 +++
>  2 files changed, 11 insertions(+)
>=20
> diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> index eb14312986ea..51db9535bd39 100644
> --- a/pylibfdt/libfdt.i
> +++ b/pylibfdt/libfdt.i
> @@ -684,6 +684,14 @@ class Fdt(FdtRo):
>          del self._fdt[self.totalsize():]
>          return err
> =20
> +    def set_boot_cpuid_phys(self, boot_cpuid_phys):
> +        """Set the physical boot CPU ID
> +
> +        Args:
> +            boot_cpuid_phys: Physical boot CPU ID
> +        """
> +        fdt_set_boot_cpuid_phys(self._fdt, boot_cpuid_phys)
> +
>      def add_mem_rsv(self, addr, size, quiet=3D()):
>          """Add a memory reserve-map record
> =20
> diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
> index 20741d8f2df0..18730965bd02 100644
> --- a/tests/pylibfdt_tests.py
> +++ b/tests/pylibfdt_tests.py
> @@ -300,6 +300,9 @@ class PyLibfdtBasicTests(unittest.TestCase):
>          self.assertEqual(self.fdt.version(), 17)
>          self.assertEqual(self.fdt.last_comp_version(), 16)
>          self.assertEqual(self.fdt.boot_cpuid_phys(), 0)
> +        self.fdt.set_boot_cpuid_phys(0x42)
> +        self.assertEqual(self.fdt.boot_cpuid_phys(), 0x42)
> +        self.fdt.set_boot_cpuid_phys(0)
>          self.assertEqual(self.fdt.size_dt_strings(), 105)
>          self.assertEqual(self.fdt.size_dt_struct(), 564)
> =20
> --=20
> 2.56.0.317.g454f8302e1-goog
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--huBQBrPKeN5EmrMX
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmroEtcACgkQzQJF27ox
2Gf0Rg//aQAmz373b8KHLtWRff/MuTBg8wHOdmOTPHTuf0ug7dJ8uy3vjJIZyKa/
I01UE64Q/MoP2LMpJGMiBw9EIkqSecxgM0Vs9nfu7If/LEKzCqv5y15zZDFbM29A
aoortuOiupkgN9dJemcieF9wnT/3MbFmWm7AbmeeY9y5p2zIuBduDtlDga+j3xwK
VbW4nZgaacDwi57ESpyrXpsF7ELPvk1+RfyfQ+eOKHieaZ6ep+PV2x5a44flje8d
Uo7E3QCD8H09Ik8TPSqGNye4fNQ6rbDzT+DJMfb55drrPf1OCJswhxA86o1TSfZU
aczFXclboj4zb1VLuhovE8ILjzuppiuRtQUmCgQVNvIDzOIpU93t5/dvXPQG4WQt
pd9HDtqTr0Zz8iYKaREUglKP/RwVYRHnOo3OGOE9l5Oec426e/aq8uP/9y9FtGiP
tGCuac07QkQtzSA90zk6oDwq3DERJ4gCQHQRUcGpZoglVWAoI+L//w3myeUku7a/
NXHpOW5xJPrM5+d6ewps6NR2C9gTFZ9b+bk/Il5SepUHDO54m+sU3e8/UW06luFA
CQpo4upoPZZEHSbsEnYGBbs1Ky6KpSfTouidQNILZXUigtJHcbvztIKoPU0Fnt7x
NFMor23BumkhgU5QijHzbNuuLEwyxRbL08kWo7+qSt3967qmn5w=
=sV+8
-----END PGP SIGNATURE-----

--huBQBrPKeN5EmrMX--
