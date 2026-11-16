Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794803692;
	b=SUwmPuthL/PpaEDU8kEqwNTek1tAZUfPb7h7BC6vbP7LoxKNwWt3FhdOaSOvfenKM5WS
	 Cnc9PP0/BMLImn9zcfMb/1Dq+KzLnw7vqwh/Zb/ESNrDA91Wlst1Y6sSFp/M4mdw/7oZe
	 /Br5XBgiqQmiifRSN3hEZV41PYtXnhNdRwlH9gKY1e1MfU57minAEglzwELnJ5BDx0dOH
	 HeXvomMYhLysE4WOMFz/cN0A9ogEhoybLooCzT0v90o1ACYYpV6CmdHQBD36MPnk89Kra
	 EEygX4jK2j1JKNJhJgUqC4vIhJ6cyvV8f2zcADI/U+tq9dbIjKfZIO3ef+F0NNHvdfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794803692;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=PC5MPKUWnqCmZOIhaGHQs6iljQp05h7PpRVV5+47P8s=;
	b=2P5bLcOaAqD6AMt+acqusNvJNrs5f4+W0Oz/arSOI6hYGKir+IJjrY6wRPiCReWmbX4J
	 xTdfYg/jJpkw+SkConLkgEzPX3xjoGPIrbwR2iVtJFVBNaKI0EjXzVg7pMc2FcHexHZjk
	 jV3X76sbasdSf954QwUim+wpw0MnVufboKF0paRD7sNvmcQRaOO6ognVnvyUJocMNRVWs
	 MgzhVaVavIxlRXjXw0RB3GyPxeAgtMmsqfDjII8Z1bXzvRdyaKjuUWASyWdunXeaTxyb/
	 4HCTtXj6ovo68+wEiGnaWc+Xvsfsw3NkvaT2uyu/5OOjnfCijAhvtFkcbn2HXRcJvdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=mjOwhWvL;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B13606A880
	for <devicetree-compiler@vger.kernel.org>; Mon, 16 Nov 2026 04:34:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55B13606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=mjOwhWvL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1794803680;
	bh=PC5MPKUWnqCmZOIhaGHQs6iljQp05h7PpRVV5+47P8s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mjOwhWvLUhopyqlHy06MRnw01OSxP3HpwEHHAYMyg0bDzB9XCbhuXWZ+X1wJF/Zo9
	 fI9zuaDll9OhMORQsnyyEHOSy57UNtk28qGDm5uw8Z4GiNbklk924CRNPGPsq1BW18
	 KB/3S4lDmp9mJ37qG88N23oH9mFC7hLm48dxEIyYTKpbTo7f6XN/EK5n/kYwYZU8bZ
	 P66S22mE+ljHzeNr/ACm/FhBtrRzNZ8BsR1E2a2UOeW+OycpBLCJ+qG2DiSWbZBboS
	 MU8uOOvoiJCyXgTdaJxpfI94r2mXxRo+6XVpki0mNDuE69IkQaNpE8djVrWL+sGtLE
	 7RN8PW2RiGeIg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jSZlN23nJz4wSb; Mon, 16 Nov 2026 15:34:40 +1100 (AEDT)
Date: Mon, 16 Nov 2026 15:15:59 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v3 17/18] tests: Check references to a generated overlay
 fragment
Message-ID: <avqDfnJY0xP6VRkV@gractus.seuss>
References: <20261106195159.2623314-1-sjg@chromium.org>
 <20261106195159.2623314-18-sjg@chromium.org>
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
	protocol="application/pgp-signature"; boundary="BNiYReBi+LuMRPZh"
Content-Disposition: inline
In-Reply-To: <20261106195159.2623314-18-sjg@chromium.org>

--BNiYReBi+LuMRPZh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 06, 2026 at 12:51:44PM -0700, Simon Glass wrote:
> In a plugin, a fragment can refer to an overlay fragment (a fragment@N
> node) which dtc generates for an earlier fragment, either by giving its
> name in a / { ... } fragment or by giving a path through it to
> /delete-node/. No test covers either of these.

I find that description fairly hard to follow.

> Add a test for each, checking that the / { ... } fragment adds to the
> generated fragment@N node and that the path finds the node in it.
> Neither is really desirable, since dtc generates these names and a
> plugin should not rely on them, but the tests show what changes when the
> fragment@N nodes are added after the merge.
>=20
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
>=20
> Changes in v3:
> - Add new patch to check references to a generated overlay fragment
>=20
>  tests/merge-overlay-name.dts | 14 ++++++++++++++
>  tests/merge-overlay-path.dts | 13 +++++++++++++
>  tests/run_tests.sh           | 10 ++++++++++
>  3 files changed, 37 insertions(+)
>  create mode 100644 tests/merge-overlay-name.dts
>  create mode 100644 tests/merge-overlay-path.dts
>=20
> diff --git a/tests/merge-overlay-name.dts b/tests/merge-overlay-name.dts
> new file mode 100644
> index 0000000..be08268
> --- /dev/null
> +++ b/tests/merge-overlay-name.dts
> @@ -0,0 +1,14 @@
> +/dts-v1/;
> +/plugin/;
> +
> +&basenode {
> +	node {
> +	};
> +};
> +
> +/* Refers to the overlay fragment above by the name which dtc gives it */
> +/ {
> +	fragment@0 {
> +		prop =3D <1>;
> +	};
> +};

Hrm.  I don't think we want to enshrine this behaviour in a test - it
kind of arises by accident.  For one thing this is relying on the
order in which dtc assigns fragment numbers, which I've never thought
of as a guarantee.

> diff --git a/tests/merge-overlay-path.dts b/tests/merge-overlay-path.dts
> new file mode 100644
> index 0000000..2f4c5fc
> --- /dev/null
> +++ b/tests/merge-overlay-path.dts
> @@ -0,0 +1,13 @@
> +/dts-v1/;
> +/plugin/;
> +
> +&basenode {
> +	node1 {
> +	};
> +
> +	node2 {
> +	};
> +};
> +
> +/* Refers to a node in the overlay fragment above by its path */
> +/delete-node/ &{/fragment@0/__overlay__/node1};

Similar thoughts here.

> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index 8391717..92e4d2c 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -847,6 +847,16 @@ dtc_tests () {
>      run_fdtget_test "fragment@0\nnode\n__fixups__" merge-overlay-order.t=
est.dtb -l /
>      run_fdtget_test "bar" merge-overlay-order.test.dtb -l /fragment@0/__=
overlay__
> =20
> +    # In a plugin, a / { ... } fragment can add to an overlay fragment by
> +    # giving the name which dtc generates for it, and a node in an overl=
ay
> +    # fragment can be deleted by its path
> +    run_dtc_test -I dts -O dtb -o merge-overlay-name.test.dtb \
> +	"$SRCDIR/merge-overlay-name.dts"
> +    run_fdtget_test 1 merge-overlay-name.test.dtb /fragment@0 prop
> +    run_dtc_test -I dts -O dtb -o merge-overlay-path.test.dtb \
> +	"$SRCDIR/merge-overlay-path.dts"
> +    run_fdtget_test "node2" merge-overlay-path.test.dtb -l /fragment@0/_=
_overlay__
> +
>      check_tests "$SRCDIR/bad-name-property.dts" name_properties
> =20
>      check_tests "$SRCDIR/bad-ncells.dts" address_cells_is_cell size_cell=
s_is_cell interrupts_extended_is_cell
> --=20
> 2.43.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--BNiYReBi+LuMRPZh
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmr6g34ACgkQzQJF27ox
2GfHFA/8CS6Gtp/rofkco7lUV8pTsOc8fEmG9LnwjxTaWvsLXiboqUWMRC3LT6fW
/DLi6x72tVMkKx7XgdE01xLWMWG2LJhUDYzK88wUROW8gNZvrVjcHj1wYInXLtc8
DtBFFEj1HkqiWXyQlp2wqUlWRyB2/DbmCP1p1u/lxhH1egpaOFxFa1J7y5iIdr3O
XrQKXVAcohqPmdq5tCCM0JmV0Xpx4zzFVEI00EUQTzPHBAVgHvd5AnfIqgpp4j1g
PgdpJqJPZNuaT7VA1pk7FfJCka4LAyO3kEuKUV5VU/w3Nwb9TEMF6SU2Cv6n8aOU
Vtt7VprVC+1awWj2jLAB4YYsCkVarQkwZK2lqXw066AWYDA8YBrDs4OWFioTYoWQ
7fu5+7mxBNG2A8Ky3O+nbo/ECCKos0c1az/x3Y7hhJflz1ggVWmslYC/FSG1CLYn
VRpva9QKg1XW/siTespla+Sm9fF0oMRrOL/pnUZ58GxAKCPjXZ42lscierrwp4Fh
6Y3d8YngctLK7TGHGFNaLYhHkkrgx1PMKMrE9NJBI5KhSd2ok0ZY45e47gW10nHb
msni86wSooRjIM/CQiDk+wb6KYqOzRvRQrvs2hQYVQdxl7cPU4Of8wnVEUrROQCC
SSwJHVQyNt9PQwrgVhhtnY1dZ70SUvGGBBSJT76XnpX3rOUgMp4=
=2lF+
-----END PGP SIGNATURE-----

--BNiYReBi+LuMRPZh--
