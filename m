Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBBD212549;
	Thu, 15 Jan 2026 00:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768438282; cv=none; b=DhKtd5kjRX95RlHr2FpAaiaomjcjgs814w4NV7JPf96Xs7TaIFTwKJR659FPVeFLRS45YOeGYupQn3R/ILbgwGcdcFLKS/xVW9ZY84SrPPLIs1x6DZwUc+FB8NzYZqt9G1aRsRqcXAfDTamkF3BOoiSwn/4b29SWamvtGrExqQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768438282; c=relaxed/simple;
	bh=yLbR24Ea5/P8Fklj4jco7YlHtY/5DSDaTRSzYl07+JU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OqfdyR5JL3ZsAP8XIHTkaQUfohJm8YesnaTMqea9xwexQIWLleXrhLsWwoCgh2Hzze6NrkvJO5WYFA2RT6/C7Ils99xmgSoodmovMrsx61xh55PAr/KQuTMapulj5gNzCzh2R118iZXMZa4BqNRtVFjiO2BpY0GYmh6OrlIIj6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=O5hoeUhs; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="O5hoeUhs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202512; t=1768438265;
	bh=ANxdCvKCkJzprHY76xRK/X4wIiS6f8RVRiIUkcXDqPI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O5hoeUhsprXTZlKN38/O8b+nH6cYQ0EUtpTUAT65+aV7jYDXzCc+8FcKcPA1k1YDf
	 GZHw4SxZD373XPuN/t82SUL7GHJy4pHMHHIlY2YwL6qrUT7EP8Wmx6KXd7VofFP2fd
	 NQCQZ3g5T58IKPZbPUyWOYwiwY6sy6SPV8MD/xy138VN2QJbYff1NB1iqYD/e1vnd/
	 XpV4Wdv1vj6q8wBO7osH7N+0wGZ1739izFxPMrcmOk5Pi4KCFvIcPPtgMWBAj0iDFF
	 mUtJ1r0TMscX0SrGzwlE9UFXG67NBFPTwOGsl5zumsLTai3iRfYnvdVeIcWCZ7XSzp
	 h7pVXotuBRpNg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4ds4D96ZrYz4wM1; Thu, 15 Jan 2026 11:51:05 +1100 (AEDT)
Date: Thu, 15 Jan 2026 11:50:56 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ayush Singh <ayush@beagleboard.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree-compiler@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree-spec@vger.kernel.org,
	Hui Pu <hui.pu@gehealthcare.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH 10/77] tests: Add basic metadata tests
Message-ID: <aWg58Gfb1KnMvQoG@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
 <20260112142009.1006236-11-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VLVyao8YEEq7JtgW"
Content-Disposition: inline
In-Reply-To: <20260112142009.1006236-11-herve.codina@bootlin.com>


--VLVyao8YEEq7JtgW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 03:19:00PM +0100, Herve Codina wrote:
> This first test is related to local phandle references (FDT_REF_LOCAL
> dtb tag).
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

As a rule of tumb, I prefer tests to be introduced in the same patch
that introduces the feature tested.  Usually, I don't care that much,
but in a giant series like this, it would really help review (the
tests help to document the feature being added without switching
between patches).

>=20
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  tests/meson.build                      |  3 +-
>  tests/metadata_reflocal.dtb.dts.expect | 23 ++++++++++
>  tests/metadata_reflocal.dtb.expect     | 20 +++++++++
>  tests/metadata_reflocal.dts            | 27 ++++++++++++
>  tests/metadata_reflocal.dts.dts.expect | 23 ++++++++++
>  tests/run_tests.sh                     | 58 +++++++++++++++++++++++++-
>  6 files changed, 152 insertions(+), 2 deletions(-)
>  create mode 100644 tests/metadata_reflocal.dtb.dts.expect
>  create mode 100644 tests/metadata_reflocal.dtb.expect
>  create mode 100644 tests/metadata_reflocal.dts
>  create mode 100644 tests/metadata_reflocal.dts.dts.expect
>=20
> diff --git a/tests/meson.build b/tests/meson.build
> index 37bfd47..e81a2e1 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -140,7 +140,8 @@ run_test_types =3D [
>    'fdtget',
>    'fdtput',
>    'fdtdump',
> -  'fdtoverlay'
> +  'fdtoverlay',
> +  'metadata'
>  ]
>  run_test_deps =3D [
>    dtc_tools, dumptrees_dtb, tests_exe
> diff --git a/tests/metadata_reflocal.dtb.dts.expect b/tests/metadata_refl=
ocal.dtb.dts.expect
> new file mode 100644
> index 0000000..076c17a
> --- /dev/null
> +++ b/tests/metadata_reflocal.dtb.dts.expect
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
> diff --git a/tests/metadata_reflocal.dtb.expect b/tests/metadata_reflocal=
=2Edtb.expect
> new file mode 100644
> index 0000000..33b3896
> --- /dev/null
> +++ b/tests/metadata_reflocal.dtb.expect
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
> +        // [FDT_REF_LOCAL] ref-subnode-a[0]
> +        ref-node-b =3D <0x00000123 0x00000456 0x00000002 0x00000789>;
> +        // [FDT_REF_LOCAL] ref-node-b[8]
> +    };
> +};
> diff --git a/tests/metadata_reflocal.dts b/tests/metadata_reflocal.dts
> new file mode 100644
> index 0000000..f04d24f
> --- /dev/null
> +++ b/tests/metadata_reflocal.dts
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
> diff --git a/tests/metadata_reflocal.dts.dts.expect b/tests/metadata_refl=
ocal.dts.dts.expect
> new file mode 100644
> index 0000000..b72b545
> --- /dev/null
> +++ b/tests/metadata_reflocal.dts.dts.expect
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
> index f07092b..7a8bdbc 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -1090,6 +1090,59 @@ fdtoverlay_tests() {
>      run_wrap_test test "$bd" =3D "$pd"
>  }
> =20
> +# $1: f1 file
> +# $2: f2 file
> +check_diff () {
> +    printf "diff $1 $2:	"
> +    local f1=3D"$1"
> +    local f2=3D"$2"
> +    (
> +        if diff $f1 $f2 >/dev/null; then
> +            PASS
> +        else
> +            if [ -z "$QUIET_TEST" ]; then
> +                echo "DIFF :-:"
> +                diff -u $f1 $f2
> +            fi
> +            FAIL "Results differ from expected"
> +        fi
> +    )
> +}
> +
> +# $1: dtb file
> +# $2: out file
> +wrap_fdtdump () {
> +    printf "wrap_fdtdump $1:	"
> +    local dtb=3D"$1"
> +    local out=3D"$2"
> +    (
> +        if $FDTDUMP ${dtb} 2>/dev/null >${out}; then
> +            PASS
> +        else
> +            FAIL
> +        fi
> +    )
> +}
> +
> +metadata_tests() {
> +	for dt in metadata_reflocal; do
> +		run_dtc_test -I dts -O dts -o $dt.dts.dts "$SRCDIR/$dt.dts"
> +		base_run_test check_diff $dt.dts.dts "$SRCDIR/$dt.dts.dts.expect"
> +		run_dtc_test -I dts -O dtb -o $dt.dtb "$SRCDIR/$dt.dts"
> +		base_run_test wrap_fdtdump $dt.dtb $dt.dtb.out
> +		# Remove unneeded comments
> +		sed -i '/^\/\/ /d' $dt.dtb.out
> +		base_run_test check_diff $dt.dtb.out "$SRCDIR/$dt.dtb.expect"
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
> @@ -1129,7 +1182,7 @@ while getopts "vt:me" ARG ; do
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
> @@ -1169,6 +1222,9 @@ for set in $TESTSETS; do
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
> 2.52.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--VLVyao8YEEq7JtgW
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmloOfAACgkQzQJF27ox
2Gf2OQ//ZTOjDLhZIQO0GaiTtOp272xTblJkW0aR9nd2oSCgI8etDPZN6tVoy/J3
vaYBMB3saelj0gdWwxNwo5u0srTcVWqsRDMnKSrQX6sfzx6EcriCLWxLbwzZ7ZMz
2n+j7kOxRmF+9rh8FP+VjpMQz2WE5qAQcnyjQlMNvlcfQFlUyyS37iDhTjvsytPm
3RQu0+S2Q2q2J76cFNrIj/fLckzfImikdbcQL4dbuz/i4HOHEtrpNavTfYwiVUWR
iPbasJrBDFAhOqbrr5Ffr2GyY0daHzkmNBKEUj0PC4gfGQzi0f6O27CxSUrNy9QJ
59xDyIzqeA/mnbIKR0PvRFjnVAmPVyoaeons/tP9u2T9Y5o8DHbbKMkiDoJ2MBHA
zcEe3xdgrXaxTYp9tLeys3XWgVzh1SoRemMEqmLCKCFHfX9Trge9vp68J4OwZS0n
mYVPbJdDVKtI1HzH9YdiZIebZpwndbqho3AJS90+Rm6A1LF+r75EQR08g4+Q1XuF
Y3nXsjZtGA5cYFhwkNY/19BejknpUPItU6v+gvgUiQh1rwMwAp2msvk5EdAlKvZq
87TRua7E0/m0chiAiQXuphX38JeC5QFPrLoGHKa6G/3cHah0/Lnu3EfGLASS4Oma
/nn3MLWImHAd4rte/g7I2KDxROhH43Ysfb+xkomn2OUaBqT8bkA=
=VrX/
-----END PGP SIGNATURE-----

--VLVyao8YEEq7JtgW--
