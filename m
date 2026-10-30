Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793337902;
	b=wZN6Mycicfk4WABqYM4PA/WuhXbkUGwcD0Y65Gk6DsT846BTtGM60UKH49ETqyZ0Nt1n
	 FHfSM8LKkxWNhPnCGSyga8l/Vu0CeoF93x7r0xf5RL9rxCT+QW5ua6XFVI58hOzK9S3zY
	 x19N4RXXA/heJZ9AQw/+Aj0zc/4AjXJ/5LL/oO1Bwgk6Wk41dKvvQqWCI7pMdfeVffFkg
	 Avjs3rbMFprkOiRG6N2gZy2eOYNuGfODFC7+t2FkWWLGjS/v/wtRVXnrgOmvlhTCHMrRx
	 rzlTwqdU9SOKyHtaCi8IE2hdz71KwMuUbKMz+wUzLISZMd1rVGokCy0JShbOgnOQPJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793337902;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=Y+jNvUqT/H5n1juAuB0AfjpcPWdhEJ9R+qy87YmFy1s=;
	b=wH7rtQvVWdnqNsO0hk3sAWMV0RAaPH4wkgYOKDvTKtlgU0+civPuPlksC8iNEKmNbPkS
	 oddrl8XL2PgQ5tWmyXuLibOCSTDDSTh9KOkXOY6PwUrvBXuI7YrlVVohMpeT6/JIWehgk
	 7nZdU+7IF6mygL41kWGZqDBxl1aVM1i+MAnjRv0kS6TqdH8I3DGLJoXaoiY/7ydAcWe+R
	 4HzndcOmYNuyltNg/QeMKQ32f1mWqJqNTNNNe6WFue/3JeXMvXskrx0p+nWEYUXle3mVA
	 8aWiWX8XVXv3CQAAWjWoztz22iOSISODmrUqXraacNNnrYHvYaDc+8mXW0d3jKNolgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=cA5IfQna;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6996606A31C;
	Fri, 30 Oct 2026 05:25:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6996606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=cA5IfQna
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793337898;
	bh=Y+jNvUqT/H5n1juAuB0AfjpcPWdhEJ9R+qy87YmFy1s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cA5IfQnaqG8AHxZocXLmBNkBVvvq2foXhRI6YPr6j1gjrGULpzez3ZxMMwHDy6wXN
	 k07OnmDJ+UhNnxOgRG3fCabfyXPoK9D4GDRe/L2pYMEm6wR7Uz4t9lmxTN1NhVLejs
	 pPc+BpV+hqvhtfOU4DMTHzlADqKAiJPrOxpdhQooYCSRJb/1D6Gi10OXxAjobzQ0pa
	 vUMD8Siu4sM118UdvzXbhIwZqWZbTe6BnqNYBTiSHw6z8fyElER0UGs+lr44hSBgyA
	 bB+Mb+lfUEJK+O8yRXbMRHDAvl7aoUdJUJ1MkaXrtFwVytAsS0KcdYdHOw5c8i1zlo
	 Ir9zNUjhhiJVg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jG8gG6D26z4vyt; Fri, 30 Oct 2026 16:24:58 +1100 (AEDT)
Date: Fri, 30 Oct 2026 16:24:52 +1100
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
Subject: Re: [RFC PATCH v2 10/74] tests: Add basic metadata tests
Message-ID: <auQqI8WEOVeDRZM_@gractus.seuss>
References: <20260826094950.1088288-1-herve.codina@bootlin.com>
 <20260826094950.1088288-11-herve.codina@bootlin.com>
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
	protocol="application/pgp-signature"; boundary="7bwo/JPeR6GxdaXs"
Content-Disposition: inline
In-Reply-To: <20260826094950.1088288-11-herve.codina@bootlin.com>

--7bwo/JPeR6GxdaXs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 11:48:39AM +0200, Herve Codina wrote:
> This first test is related to local phandle references used in
> properties (FDT_PROPDATA_PHANDLE dtb tag).
>=20
> The test pattern used is
>   - Generate a dts (xxx.dts.dts) from an input dts
>   - Check this generated dts against expected contents
>   - Generate a dtb (xxx.dtb) from the same input dts
>   - Check this generated dtb against expected contents
>   - Generate a dts (xxx.dtb.dts) from the generated dtb
>   - Check this generated dts against expected contents
>   - Generate a dtb (xxx.dtb.dts.dtb) from the generated dts
>   - Check this generated dtb, expect the same contents as for xxx.dtb
>=20
> Even if only one meta-data feature is currently tested in this tests
> introduction, use a loop in order to ease future addition consisting in
> adding new input dts as soon as new meta-data feature are supported.
>=20
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

As noted elsewhere, I'd prefer to see new helper tools for comparing
metadata in binary rather than using text comparisons.

> ---
>  tests/meson.build                             |  1 +
>  ...data_propdata_phandle_local.dtb.dts.expect | 23 ++++++++++++++++
>  ...metadata_propdata_phandle_local.dtb.expect | 20 ++++++++++++++
>  tests/metadata_propdata_phandle_local.dts     | 27 +++++++++++++++++++
>  ...data_propdata_phandle_local.dts.dts.expect | 23 ++++++++++++++++
>  tests/run_tests.sh                            | 25 ++++++++++++++++-
>  6 files changed, 118 insertions(+), 1 deletion(-)
>  create mode 100644 tests/metadata_propdata_phandle_local.dtb.dts.expect
>  create mode 100644 tests/metadata_propdata_phandle_local.dtb.expect
>  create mode 100644 tests/metadata_propdata_phandle_local.dts
>  create mode 100644 tests/metadata_propdata_phandle_local.dts.dts.expect
>=20
> diff --git a/tests/meson.build b/tests/meson.build
> index fcc73982..ec24f0af 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -143,6 +143,7 @@ run_test_types =3D [
>    'fdtput',
>    'fdtdump',
>    'fdtoverlay',
> +  'metadata',
>  ]
>  run_test_deps =3D [
>    dtc_tools, treegen_dtb, tests_exe,
> diff --git a/tests/metadata_propdata_phandle_local.dtb.dts.expect b/tests=
/metadata_propdata_phandle_local.dtb.dts.expect
> new file mode 100644
> index 00000000..076c17ae
> --- /dev/null
> +++ b/tests/metadata_propdata_phandle_local.dtb.dts.expect
> @@ -0,0 +1,23 @@
> +/dts-v1/;
> +
> +/ {
> +
> +	node-a {
> +
> +		subnode-a {
> +			phandle =3D <0x01>;
> +		};
> +	};
> +
> +	node-b {
> +		phandle =3D <0x02>;
> +	};
> +
> +	node-c {
> +	};
> +
> +	node-d {
> +		ref-subnode-a =3D <&{/node-a/subnode-a}>;
> +		ref-node-b =3D <0x123 0x456 &{/node-b} 0x789>;
> +	};
> +};
> diff --git a/tests/metadata_propdata_phandle_local.dtb.expect b/tests/met=
adata_propdata_phandle_local.dtb.expect
> new file mode 100644
> index 00000000..c923d2e2
> --- /dev/null
> +++ b/tests/metadata_propdata_phandle_local.dtb.expect
> @@ -0,0 +1,20 @@
> +/dts-v1/;
> +
> +/ {
> +    node-a {
> +        subnode-a {
> +            phandle =3D <0x00000001>;
> +        };
> +    };
> +    node-b {
> +        phandle =3D <0x00000002>;
> +    };
> +    node-c {
> +    };
> +    node-d {
> +        ref-subnode-a =3D <0x00000001>;
> +        // [FDT_PROPDATA_PHANDLE] ref-subnode-a[0]
> +        ref-node-b =3D <0x00000123 0x00000456 0x00000002 0x00000789>;
> +        // [FDT_PROPDATA_PHANDLE] ref-node-b[8]
> +    };
> +};
> diff --git a/tests/metadata_propdata_phandle_local.dts b/tests/metadata_p=
ropdata_phandle_local.dts
> new file mode 100644
> index 00000000..f04d24f9
> --- /dev/null
> +++ b/tests/metadata_propdata_phandle_local.dts
> @@ -0,0 +1,27 @@
> +// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
> +/*
> + * Copyright (C) 2026 Bootlin
> + */
> +
> +/dts-v1/;
> +
> +/ {
> +	node-a {
> +		subnode_a: subnode-a {
> +		};
> +	};
> +
> +	node_b: node-b {
> +	};
> +
> +	node-c {
> +	};
> +
> +	node_d: node-d {
> +		ref-subnode-a =3D <&subnode_a>;
> +	};
> +};
> +
> +&node_d {
> +	ref-node-b =3D <0x123 0x456 &node_b 0x789>;
> +};
> diff --git a/tests/metadata_propdata_phandle_local.dts.dts.expect b/tests=
/metadata_propdata_phandle_local.dts.dts.expect
> new file mode 100644
> index 00000000..b72b545f
> --- /dev/null
> +++ b/tests/metadata_propdata_phandle_local.dts.dts.expect
> @@ -0,0 +1,23 @@
> +/dts-v1/;
> +
> +/ {
> +
> +	node-a {
> +
> +		subnode_a: subnode-a {
> +			phandle =3D <0x01>;
> +		};
> +	};
> +
> +	node_b: node-b {
> +		phandle =3D <0x02>;
> +	};
> +
> +	node-c {
> +	};
> +
> +	node_d: node-d {
> +		ref-subnode-a =3D <&subnode_a>;
> +		ref-node-b =3D <0x123 0x456 &node_b 0x789>;
> +	};
> +};
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index 42b74e05..8c27b463 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -1239,6 +1239,26 @@ fdtoverlay_tests() {
>      run_wrap_test test "$bd" =3D "$pd"
>  }
> =20
> +metadata_tests() {
> +	for dt in metadata_propdata_phandle_local; do
> +		run_dtc_test -I dts -O dts -o $dt.dts.dts "$SRCDIR/$dt.dts"
> +		base_run_test check_diff $dt.dts.dts "$SRCDIR/$dt.dts.dts.expect"
> +		run_dtc_test -I dts -O dtb -o $dt.dtb "$SRCDIR/$dt.dts"
> +		base_run_test wrap_fdtdump $dt.dtb $dt.dtb.out
> +		# Remove unneeded comments
> +		sed -i '/^\/\/ /d' $dt.dtb.out
> +		base_run_test check_diff $dt.dtb.out "$SRCDIR/$dt.dtb.expect"
> +		run_test check_full $dt.dtb
> +		run_dtc_test -I dtb -O dts -o $dt.dtb.dts $dt.dtb
> +		base_run_test check_diff $dt.dtb.dts "$SRCDIR/$dt.dtb.dts.expect"
> +		run_dtc_test -I dts -O dtb -o $dt.dtb.dts.dtb $dt.dtb.dts
> +		base_run_test wrap_fdtdump $dt.dtb.dts.dtb $dt.dtb.dts.dtb.out
> +		# Remove unneeded comments
> +		sed -i '/^\/\/ /d' $dt.dtb.dts.dtb.out
> +		base_run_test check_diff $dt.dtb.dts.dtb.out "$SRCDIR/$dt.dtb.expect"
> +	done
> +}
> +
>  pylibfdt_tests () {
>      run_dtc_test -I dts -O dtb -o test_props.dtb "$SRCDIR/test_props.dts"
>      TMP=3D/tmp/tests.stderr.$$
> @@ -1278,7 +1298,7 @@ while getopts "vt:me" ARG ; do
>  done
> =20
>  if [ -z "$TESTSETS" ]; then
> -    TESTSETS=3D"libfdt utilfdt dtc dtbs_equal fdtget fdtput fdtdump fdto=
verlay"
> +    TESTSETS=3D"libfdt utilfdt dtc dtbs_equal fdtget fdtput fdtdump fdto=
verlay metadata"
> =20
>      # Test pylibfdt if the libfdt Python module is available.
>      if ! $no_python; then
> @@ -1318,6 +1338,9 @@ for set in $TESTSETS; do
>          "fdtoverlay")
>  	    fdtoverlay_tests
>  	    ;;
> +	"metadata")
> +	    metadata_tests
> +	    ;;
>      esac
>  done
> =20
> --=20
> 2.55.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--7bwo/JPeR6GxdaXs
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrkKiQACgkQzQJF27ox
2Gcv3Q/+LwiBBBz2Q6L4KxjSDMG97cMm6jhuzh1ov3hMltcubnVz68wkVNw8nVr0
Im/FeU9ARNtZkCCz5o9Nj49n+iHH6/lz9KMvselXaK2Vc9PEOv6wqh4VD7dXx8yU
L1E/BUqG1WdLMbt0gce1myRnVSEBQSTlqE9m7hBxT4f1mja25yZ9VDwTnNN9OoRw
NjEqZepwT79di0Ww14Hf12m3tTwxsxZ89IjfINW229LdnXKt2sSNYNGyyOwt/N9V
eXUDSMD0e2uOgnzdUGSfVZyUEdnHqUkjx1AFJFtnZblRgWB3OavTQEcMMEhaSX9A
CTFWSkCaNnOUEDa21Pd8OLUTtO4+/7b+JtLv1bLaAUauVTzZGzwXiCrYBaLry2GH
oIk/YQKinLxVGY9fez3OC1bJkqNL1VgzheYKCyMbWD9BAGHpb3Z+sz4co/sgy4xs
IdGM9Wj61mCzgYvHu5O/7HvxurwJsWuDDAunsNBrCrVw7rLiCGCTMwb0bCNx1yaJ
Vq33XqFvBuAB9Y8/AXer+fg8omHrgGGrexfsPQB3ZD6jrx3zbxwxi1ooditGtTQg
KWmu0ys0IYhBh1gNl4iUyDr+jfDOjJji5GhfV2W/19FP7KbtU2CS7+ksKmWxEiCT
AqbekJIo8dxvo1RP7t+v8F9SkT/d5s4V5q/6a646DcjfE+Oq5Sg=
=+fVR
-----END PGP SIGNATURE-----

--7bwo/JPeR6GxdaXs--
