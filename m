Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794544050;
	b=FFKN5RSgl6D+/F+hG3IykwqOqVivNXG8NyebVLUC3zCxAMC+IPeLIjisRQ9+8y0gUTFl
	 1n9aHuBGwThmAg/mkW2D/5qFkBMYuK82BKRa6KxOHVUOmZRP0xjcv1XFKBCKSQkm6R+qM
	 5AqVyOtjE5urlAS7MHfq0R///Wf7RdWx0rozYnxfOCdxmfYLL434brkdyeRk0/ovjUkTt
	 bXGJQUKvDYARtn+fsjq6QhpiqH5Bl72ZJYd8NyI8Bzk+dNdrVSPCZln0snHK9xLExyOaU
	 DOYHYJJcrripWKTejxrse19dGatLYvewiNRog9YocXbuSAhA2hK4vM+Vi+eILRbVbhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794544050;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=ZmSmwz9kgLiaKzpFXCSuraPAZNWm+/QXjgIFXEyDTLc=;
	b=ly7WigjP0pvDkKsqIPIMrhBa6vgWjI8kSLEKGqBHPJn7Bl3w6dptatQT0YsIaMSERx5d
	 OTxVli+MIaN+wP/hTC3V59TpuELI4an3znIuzMBKa1KesDqZaU7Udmg2hmC9zInYRDmnJ
	 NVj6ucx/ne3Im7VWCrb8VDgX1aT3zlBfvIjuCL0vfON8jK2iBNtZc8FcrfEticRTsgBIk
	 fdOVYUB3FxGLyWzi6eDrP6Q+oKu2XfPHXdPB+4w0sRETKYbzCsp8Hc5CglgYAL3+jzBVy
	 5Bu5jvnFhh4N6ZcZPJ7RXoQRyDGCwWA63KIChmGQw+sCm1Z8KjzbgGCFUp6BxkaB/jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=vKqIdTPA;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88EFA606A323;
	Fri, 13 Nov 2026 04:27:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88EFA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=vKqIdTPA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1794544046;
	bh=ZmSmwz9kgLiaKzpFXCSuraPAZNWm+/QXjgIFXEyDTLc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vKqIdTPAOCT/m+KbN7CCWx7pAVnyGwGgM8jQ5xWUSeHoz7SH/8MVpA6nCUDPkAPLh
	 x++9Aast1tL3dyG6Ko/arbZGxCN1+OPlaASFJOwV/1KdH3YP4ZAZ3OpguMvoRWJ4gB
	 qe4uJ/BrHo6WkvxkQgSfATEzPHgO2Pd64Mehz/2vBzpJFYReTY8fsw3U51gmqLbKwb
	 Uvjx/9DpmWaAplzDWeG6wzpeOJBGJhSfoUrz4kLWwnVwA5+6ZcChtwMYMuUNryVE/9
	 +U35aEcQU/pNoCFwdexB6Q77N+S8WRdOKhvIjiQAeUFQe19VdiosZec3qlZP/XVUHL
	 maChS6o2PgvBA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jQkkQ50n4z4w9d; Fri, 13 Nov 2026 15:27:26 +1100 (AEDT)
Date: Fri, 13 Nov 2026 15:27:21 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	David Lechner <dlechner@baylibre.com>,
	Ayush Singh <ayush@beagleboard.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree-compiler@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree-spec@vger.kernel.org,
	Hui Pu <hui.pu@gehealthcare.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH v2 12/74] tests: metadata: Add external phandle
 reference tests
Message-ID: <avaRqCuQo_5jipoM@gractus.seuss>
References: <20260826094950.1088288-1-herve.codina@bootlin.com>
 <20260826094950.1088288-13-herve.codina@bootlin.com>
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
	protocol="application/pgp-signature"; boundary="kEcRGzrL5J9hS8Om"
Content-Disposition: inline
In-Reply-To: <20260826094950.1088288-13-herve.codina@bootlin.com>

--kEcRGzrL5J9hS8Om
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 11:48:41AM +0200, Herve Codina wrote:
> Add tests related to external phandle references used in
> properties (FDT_PROPDATA_PHANDLE_REF dtb tag).
>=20
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

As with other patches, these tests look valuable, but I'm not thrilled
with the text diffs.

> ---
>  ...etadata_propdata_phandle_ref.dtb.dts.expect | 18 ++++++++++++++++++
>  tests/metadata_propdata_phandle_ref.dtb.expect | 16 ++++++++++++++++
>  tests/metadata_propdata_phandle_ref.dts        | 11 +++++++++++
>  ...etadata_propdata_phandle_ref.dts.dts.expect | 18 ++++++++++++++++++
>  tests/run_tests.sh                             |  2 +-
>  5 files changed, 64 insertions(+), 1 deletion(-)
>  create mode 100644 tests/metadata_propdata_phandle_ref.dtb.dts.expect
>  create mode 100644 tests/metadata_propdata_phandle_ref.dtb.expect
>  create mode 100644 tests/metadata_propdata_phandle_ref.dts
>  create mode 100644 tests/metadata_propdata_phandle_ref.dts.dts.expect
>=20
> diff --git a/tests/metadata_propdata_phandle_ref.dtb.dts.expect b/tests/m=
etadata_propdata_phandle_ref.dtb.dts.expect
> new file mode 100644
> index 00000000..61ce943b
> --- /dev/null
> +++ b/tests/metadata_propdata_phandle_ref.dtb.dts.expect
> @@ -0,0 +1,18 @@
> +/dts-v1/;
> +/plugin/;
> +
> +/ {
> +
> +	fragment@0 {
> +		target =3D <&test>;
> +
> +		__overlay__ {
> +			ref =3D <&node_a>;
> +		};
> +	};
> +
> +	__fixups__ {
> +		test =3D "/fragment@0:target:0";
> +		node_a =3D "/fragment@0/__overlay__:ref:0";
> +	};
> +};
> diff --git a/tests/metadata_propdata_phandle_ref.dtb.expect b/tests/metad=
ata_propdata_phandle_ref.dtb.expect
> new file mode 100644
> index 00000000..f79f542d
> --- /dev/null
> +++ b/tests/metadata_propdata_phandle_ref.dtb.expect
> @@ -0,0 +1,16 @@
> +/dts-v1/;
> +
> +/ {
> +    fragment@0 {
> +        target =3D <0xffffffff>;
> +        // [FDT_PROPDATA_PHANDLE_REF] target[0], ref =3D test
> +        __overlay__ {
> +            ref =3D <0xffffffff>;
> +            // [FDT_PROPDATA_PHANDLE_REF] ref[0], ref =3D node_a
> +        };
> +    };
> +    __fixups__ {
> +        test =3D "/fragment@0:target:0";
> +        node_a =3D "/fragment@0/__overlay__:ref:0";
> +    };
> +};
> diff --git a/tests/metadata_propdata_phandle_ref.dts b/tests/metadata_pro=
pdata_phandle_ref.dts
> new file mode 100644
> index 00000000..b8aa6509
> --- /dev/null
> +++ b/tests/metadata_propdata_phandle_ref.dts
> @@ -0,0 +1,11 @@
> +// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
> +/*
> + * Copyright (C) 2026 Bootlin
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&test {
> +	ref =3D <&node_a>;
> +};
> diff --git a/tests/metadata_propdata_phandle_ref.dts.dts.expect b/tests/m=
etadata_propdata_phandle_ref.dts.dts.expect
> new file mode 100644
> index 00000000..61ce943b
> --- /dev/null
> +++ b/tests/metadata_propdata_phandle_ref.dts.dts.expect
> @@ -0,0 +1,18 @@
> +/dts-v1/;
> +/plugin/;
> +
> +/ {
> +
> +	fragment@0 {
> +		target =3D <&test>;
> +
> +		__overlay__ {
> +			ref =3D <&node_a>;
> +		};
> +	};
> +
> +	__fixups__ {
> +		test =3D "/fragment@0:target:0";
> +		node_a =3D "/fragment@0/__overlay__:ref:0";
> +	};
> +};
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index 8c27b463..f5ea02bf 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -1240,7 +1240,7 @@ fdtoverlay_tests() {
>  }
> =20
>  metadata_tests() {
> -	for dt in metadata_propdata_phandle_local; do
> +	for dt in metadata_propdata_phandle_local metadata_propdata_phandle_ref=
; do
>  		run_dtc_test -I dts -O dts -o $dt.dts.dts "$SRCDIR/$dt.dts"
>  		base_run_test check_diff $dt.dts.dts "$SRCDIR/$dt.dts.dts.expect"
>  		run_dtc_test -I dts -O dtb -o $dt.dtb "$SRCDIR/$dt.dts"
> --=20
> 2.55.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--kEcRGzrL5J9hS8Om
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmr2kagACgkQzQJF27ox
2GfKGRAArKWAARs49KCYTZZeloKJb2cO8yV0+HmnnUHc6Vn/MoFCrsNesZSi0kFv
j9eNHJPnEusJpgYwbJ0iSzkacg+Rl25og6myf/2Lwn4m7qYLpp+fpdgYW0SFJkuI
e8Fx2G8vHmWTszU4GfMb4CqHXOIdJsW9WYBh5GdbEgRrQl+uqHcd/XrvSuu77OHe
7KFtPLHbTpE8Nl6V6Iz+ORiUUhIyhRvGZou9oGjSjAXCg+OVFzwGQ7NRVkWxQ+sy
4f2mCLN0hXiQ8iUX0hs86FbdiOP67fsNJPwLV1257QawhIWBVxSpez+1jneLvOZw
q0TsI0LvdbS1EultQaR1Q0NWbdRTizVF22k0qLHYccTD8wcWTA3Yd+JB7Ryz1ZwQ
l2mmHnNStA5V5vJ/Vc3kfdlEKV6LY9R0JNjmcNqDxFhcGUeJgA80H7uhWy1RAYxY
YZk9wpzZyfhULeTMFlNXZ2uxkRuZh7VN2EuwuS+tgJuWJlSF1oL72d7i3ho33/xw
P9DwThfApwrmerTEHaEXO1tS8s6UKDqpRu5IncRgBKB1M3AjqrB1GV3luTgjnGIL
k+OkqhN70nxFkL/mezQyYr4Tbdp+zOJr+NOqjxdMsVXhNDkscWTv/mqSVFEg4hAk
alKBjUIIlckJQDdrUdOioYMPS1VhcQam75C3r+UsLuPB4N2vTA8=
=4SaZ
-----END PGP SIGNATURE-----

--kEcRGzrL5J9hS8Om--
