Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793582438;
	b=EFYgLC8IloxAtnn6cMgX+uY9PCX1Vd5bRMq7iGEN/SzOHfWVTJkUMfLOJv+FW3X1Mnhb
	 Sn9gtq7V+pxsnw61fi+wjAowpKebQpmtN+RlGFfBNuVa8V1Vb9M9mCObYDPXxa7cyBlqg
	 kHNCS15YBPfmnHKln0wJwfLuHGJKHo1w4RyUn0azGdFtb6IFUFj6d+Hf0Tck6LDk7XW6G
	 v6c5D40auQIU7T9b+KhdESJu4yHuNx1mzn0l4poteuwK59nX/km+yM0dXfPKnvoB0N619
	 PPcLwQ1LFO1BodlmvyWEUjCcLdfnfzw8g8ntiYBa3j8JE0Wxc+T+SGzsEzQ5wnYjAig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793582438;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=aOV/ImS9PMr/a9sRfB66165re9EykYltY1Pf4ux7CHw=;
	b=PiHA+bY4WfVvOlBaVLuhFKnZzwW9lU0mirneykMUYHy5XnIENjVNGJnRKLD/ceuTDThN
	 VV/mESP9ED09KzEzIMouJX7VqnLLBdJwH2Yk1abzez7j1LhW6m8nKBdt/dkR6lA1nLWus
	 1KV9DMoxhFnm6LFDDgSWVh38c87nGLLK7G8MeEPbJvwFBm9J4Onqhzb6x4Bxnnlvzko0E
	 S02Dw4H5BrADKKllRyimcDVFPv5FYlPtC03qSIXr8U2RGOeS2fM4Jz78db2DumxgWmOfT
	 MPWWq3YQZgGYeL1Pm5+T17tyRVkoEFhM7WhQEUPw1lLmJtU8i8kmnKomq6IQL7W9nWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=AJ2SUqdB;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B112606A324
	for <devicetree-compiler@vger.kernel.org>; Mon,  2 Nov 2026 01:20:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B112606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=AJ2SUqdB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793582432;
	bh=aOV/ImS9PMr/a9sRfB66165re9EykYltY1Pf4ux7CHw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AJ2SUqdBYoKvBEXPr13twalaRNYcn3VC8qnBjfuMFHPhILLF2CXwhz7f9C4b3OM09
	 uLRRd07zEb1NPqU5eLvYXDaJwZfRu+HLY6ZQuuBARI67wnIWiYj94IIVMP2uVR6Gp4
	 e4FjcGx/ud2jPZhYr/oe2/8UzrcwWjThGzOxEoZKXLsJZ6BrpNPOkWVCJws533IJRQ
	 LnbO/OAN7lNjC2dKtSb7wQQcptqpaPuw+kSSBv2lF9w4uoVgckqeN2TFTcSwDoBcWp
	 nQe8snEzelXslFouQkVc6Ymj8+zjrjprGCyML320EwRHNqlHVFzmtCR8+rah3pDkCo
	 diBtULvh7yTUg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jHv5r6xx4z4wCM; Mon, 02 Nov 2026 12:20:32 +1100 (AEDT)
Date: Mon, 2 Nov 2026 12:10:28 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH] tests: Allow dtc-fatal.sh to check the error message
Message-ID: <aufi88ZmC2cW8f3J@gractus.seuss>
References: <20261101170842.2802301-1-sjg@chromium.org>
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
	protocol="application/pgp-signature"; boundary="0AgufY4oYWzkcGJR"
Content-Disposition: inline
In-Reply-To: <20261101170842.2802301-1-sjg@chromium.org>

--0AgufY4oYWzkcGJR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 01, 2026 at 10:08:33AM -0700, Simon Glass wrote:
> dtc-fatal.sh only checks that dtc exits with status 1, so a test which
> expects a particular error passes just as well if dtc fails for some
> other reason, such as a mistake in the test's dts file.
>=20
> Add a -m option which also checks that dtc's output contains a given
> message, and use it in each test which runs dtc-fatal.sh. Unlike
> run_wrap_error_msg_test, this runs dtc under valgrind when that is
> enabled.
>=20
> Suggested-by: David Gibson <david@gibson.dropbear.id.au>
> Link: https://lore.kernel.org/devicetree-compiler/20261029093115.3647778-=
2-sjg@chromium.org/
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
> The new tests in 'dtc: Merge the fragments of a dts file after parsing'
> use run_wrap_error_msg_test. Whichever series is applied second can
> switch them to dtc-fatal.sh -m
>=20
>  tests/dtc-fatal.sh | 18 +++++++++++++++++-
>  tests/run_tests.sh | 16 +++++++++++-----
>  2 files changed, 28 insertions(+), 6 deletions(-)
>=20
> diff --git a/tests/dtc-fatal.sh b/tests/dtc-fatal.sh
> index 08a4d29..2fa96ef 100755
> --- a/tests/dtc-fatal.sh
> +++ b/tests/dtc-fatal.sh
> @@ -1,9 +1,21 @@
>  #! /bin/sh
> =20
> +# Usage: dtc-fatal.sh [-m <message>] <dtc args>
> +# Check that dtc fails, and with -m that its output contains <message>
> +
>  SRCDIR=3D`dirname "$0"`
>  . "$SRCDIR/testutils.sh"
> =20
> -verbose_run $VALGRIND "$DTC" -o/dev/null "$@"
> +if [ "$1" =3D "-m" ]; then
> +    msg=3D"$2"
> +    shift 2
> +fi
> +
> +LOG=3Dtmp.log.$$
> +rm -f $LOG
> +trap "rm -f $LOG" 0
> +
> +verbose_run_log "$LOG" $VALGRIND "$DTC" -o/dev/null "$@"
>  ret=3D"$?"
> =20
>  if [ "$ret" -gt 127 ]; then
> @@ -12,4 +24,8 @@ elif [ "$ret" !=3D "1" ]; then
>      FAIL "dtc returned incorrect status $ret instead of 1"
>  fi
> =20
> +if [ -n "$msg" ] && ! grep -qF -- "$msg" "$LOG"; then
> +    FAIL "Expected message '$msg'"
> +fi
> +
>  PASS
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index 5bc7817..33a714f 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -319,7 +319,9 @@ libfdt_overlay_tests () {
>  	run_dtc_test -I dts -O dtb -o $tree.test.dtb "$SRCDIR/$tree.dts"
>  	run_test overlay_bad_fixup overlay_base_manual_symbols.test.dtb $tree.t=
est.dtb
>      done
> -    run_sh_test "$SRCDIR/dtc-fatal.sh" -I dts -O dtb -o /dev/null "$SRCD=
IR/fixup-ref-to-path.dts"
> +    run_sh_test "$SRCDIR/dtc-fatal.sh" \
> +	-m "Can't generate fixup for reference to path" \
> +	-I dts -O dtb -o /dev/null "$SRCDIR/fixup-ref-to-path.dts"
>  }
> =20
>  # Tests to exercise dtc's overlay generation support
> @@ -764,7 +766,8 @@ dtc_tests () {
>      check_tests "$SRCDIR/minusone-phandle.dts" explicit_phandles
>      run_sh_test "$SRCDIR/dtc-checkfails.sh" phandle_references -- -I dts=
 -O dtb "$SRCDIR/nonexist-node-ref.dts"
>      run_sh_test "$SRCDIR/dtc-checkfails.sh" phandle_references -- -I dts=
 -O dtb "$SRCDIR/nonexist-label-ref.dts"
> -    run_sh_test "$SRCDIR/dtc-fatal.sh" -I dts -O dtb "$SRCDIR/nonexist-n=
ode-ref2.dts"
> +    run_sh_test "$SRCDIR/dtc-fatal.sh" -m "Label or path nosuchnode not =
found" \
> +	-I dts -O dtb "$SRCDIR/nonexist-node-ref2.dts"
>      check_tests "$SRCDIR/bad-name-property.dts" name_properties
> =20
>      check_tests "$SRCDIR/bad-ncells.dts" address_cells_is_cell size_cell=
s_is_cell interrupts_extended_is_cell
> @@ -847,9 +850,12 @@ dtc_tests () {
>      run_test integer-expressions integer-expressions.test.dtb
> =20
>      # Check for graceful failure in some error conditions
> -    run_sh_test "$SRCDIR/dtc-fatal.sh" -I dts -O dtb nosuchfile.dts
> -    run_sh_test "$SRCDIR/dtc-fatal.sh" -I dtb -O dtb nosuchfile.dtb
> -    run_sh_test "$SRCDIR/dtc-fatal.sh" -I fs -O dtb nosuchfile
> +    run_sh_test "$SRCDIR/dtc-fatal.sh" -m 'open "nosuchfile.dts"' \
> +	-I dts -O dtb nosuchfile.dts
> +    run_sh_test "$SRCDIR/dtc-fatal.sh" -m 'open "nosuchfile.dtb"' \
> +	-I dtb -O dtb nosuchfile.dtb
> +    run_sh_test "$SRCDIR/dtc-fatal.sh" -m 'opendir() "nosuchfile"' \
> +	-I fs -O dtb nosuchfile
> =20
>      # Dependencies
>      run_dtc_test -I dts -O dtb -o dependencies.test.dtb -d dependencies.=
test.d "$SRCDIR/dependencies.dts"
> ---
> base-commit: c22868416b8db8354ce5db29d3494dda688a2ae3
> branch: dtc-fatal-msg
>=20
> --=20
> 2.43.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--0AgufY4oYWzkcGJR
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIyBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrn4vMACgkQzQJF27ox
2GdUXw/1GClQdWZASUyYVwPpchj6+jwuHNdpDqAnMDzoHxQe1WfdIy8XYfFObhTB
gJYYMhH08ZRU9rqHmfPD3nH6SMIOxaFrfEUf/QnYQnMVcaeKO/ENy/cYxSUuhA4I
FJSEtxir/BhP5Ou1K921U/KmHMSz3o8XmnqjwS54b0bevyLdFrTX48ttlPiZZGzH
SDnQVCOeKcq3+WYQEtFBcitdXhivgXs428GkpZX0XJtlsOP9Upk7/sW8PgoTbJlh
v5nUyqHtAWOX8K++o0bchcZNikSE0tx2mIMs9Eo2EPeisxKChnUAxMQnMU3zjZ6v
xOxAn6U1yH8vaOzG7BXloDrPRe561tmhcikiiDDbgCh3ysO2Q/5ZtINVvjuZu6x1
pb914hBcCsIK/miB6F1a28MtaTwtnvpWKLNOEwWYz6wBWE0D+pmluD6yWhrJgUci
FIFYNxHf5iEXgKKsi20HIm/auAyX7OF49gbARTJOQxkBpCZ6pm2MAhX9OdaSsvkb
xOlchUSpjI0YgfQSA1vZ4qRelNPBaUCYsZL9BNR6aDzARmbo55tjS3BycQEkc2l0
uVPpAtlC05cBz+uNtW2qJbIiD7L8EytG8rlRvZY8SiI7wH5/wUVW2yADk39EH2JD
7Ac813Hpc4V39M+uUfS0mzovGtWflBb40pWnyN6mt2d3wIC1+g==
=9MNO
-----END PGP SIGNATURE-----

--0AgufY4oYWzkcGJR--
