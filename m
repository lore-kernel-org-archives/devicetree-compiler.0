Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795566890;
	b=mXW0zI6a0fPKIIulQyIq4faJ5czkSnifbLR/kKwlR5L8iwDHAbUVj3pRwd9v8b/u9DQ+
	 U/J/cQ1AhyUCDU+GzDWC+jC4YrSdAXWBNfpcaO3V+MqLq9e0mSysOK90A9+dokbPRfbdr
	 7mfEBr8TWzpSDl4CbOMx6hgU7/H89lZSqFe4yt1kTc7F0HuI/on4upPaU+cZiAVm7RH5L
	 EVBZyyGQaGq0ACg6u/8qgJYyun0XdQJNC1BO1ByfObSkqfXcoBvvHu8bq9HGn0kd6y7q1
	 5jLi4yl25dUzHmiXAFqt07eLhjjtEVXiZFXc2dF7Yvm7QgSsyiHEeU2p/ZKxDnrUUHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795566890;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=xMZBNiiomxtlm5rYWDMFgW+WNZJuGKVir0fCLurS9XI=;
	b=S77y3sZahuM898wQ82NkNbizlKzRzTcFYRH05GpVh8YHbdF8fnpVsz3UAeVVTONxSDOW
	 g0nsxFO/WbLHeLTbprYklsI3QUWU2qbP123F3MALd752rze2KV1hJkdZ48jRs/jGzfTFK
	 5YzRB9bKJhz2cxAN0hAFZEcbM3IkAGwF94STPmllwwqjTDHW1ztYoeAU5+ZRUWMcufjMR
	 IsAxP+P3cShbhQS+lLUxTtFAyrslR6k2lYSn4FgYSkyE2picmsGJ9LnoIJ1LJQ9WcPl54
	 Xj1YTYTvtQSzjivMgs/IKBfvj6Xn6Sg7bwOI2YOk6769tO3rYMKm4Szcq03L7L4ZPng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=q4hXYzbZ;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C40606A31E
	for <devicetree-compiler@vger.kernel.org>; Wed, 25 Nov 2026 00:34:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60C40606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=q4hXYzbZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1795566886;
	bh=xMZBNiiomxtlm5rYWDMFgW+WNZJuGKVir0fCLurS9XI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q4hXYzbZmGlbkUSzaxH04jLnOLJmdqidn3wgubVbXHWl8Q97MyYC2Ahoc6LPz2l8b
	 uR4lmX05/DJhl6Mgy2NVg1z6ploqPQbcLOOqzDIWUOlZXmHJmEADapzVP4NCwmrU/S
	 +XyIleIYD1jd1U8Uxg7X9z3vhv3O81AWH/Ot8+7rzvBN5bJ5zCAxItSWy27ELjlE7m
	 b3KnIjeoy1pfeDMjE5YgfTRNRIlFdhcxnhiKYLfJV+ipw8cE09C+a9W/ya/Ueq+QXg
	 8EaxrAvAriGcpHZ8ibjlstCF1Ju2H/cNYfWXe5luWOs8Bfqmg1Fk2KFIqNoAHID2zM
	 dKpR2yASkpU3A==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jZ10Q3bxwz4wDl; Wed, 25 Nov 2026 11:34:46 +1100 (AEDT)
Date: Wed, 25 Nov 2026 11:34:30 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v4 01/10] tests: Check how the fragments of a dts file
 are merged
Message-ID: <awYtBTUE2zhepJU2@gractus.seuss>
References: <20261116235813.935070-1-sjg@chromium.org>
 <20261116235813.935070-2-sjg@chromium.org>
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
	protocol="application/pgp-signature"; boundary="2ZL4Ir7xG3Rb+RDN"
Content-Disposition: inline
In-Reply-To: <20261116235813.935070-2-sjg@chromium.org>

--2ZL4Ir7xG3Rb+RDN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 04:57:55PM -0700, Simon Glass wrote:
> When the parser merges the top-level fragments of a dts file, it can
> report that a label or path is not found, or that a label-relative
> reference is not supported in a plugin. Most of these errors are not
> covered by any test, and the two tests which do reach them only check
> that dtc fails, not the message or where it is reported. The merge
> logic is about to move out of the grammar, so this needs better tests.
>=20
> Add a test file for each error which is not covered, and check the
> message and its position for all of them, including the two existing
> ones. Also check that merging carries on after an error, so that later
> errors are reported too, that a labelled reference within a plugin adds
> the label, that / { ... } and &{/} { ... } differ in a plugin, and that
> a label in a plugin becomes an overlay fragment if it is not found,
> since nothing covers these either.
>=20
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>

I've tentatively merged this (not in 'main' for now, but I plan to put
it there if no additional problems appear), because I think it's
useful enough.  There are a couple of warts that would be nice to
address in a follow up.

> ---
>=20
> Changes in v4:
> - Drop merge-parse-error.dts and merge-overlay-order.dts
> - Drop the checks that later fragments are merged after an error
> - Move the &{label} tests to the patch which changes its behaviour
> - Use a label outside the plugin in the label-relative tests
>=20
> Changes in v3:
> - Add merge-overlay-order.dts to check deletes and order with fragments
> - Change the subject, since the tests are not only for errors
>=20
> Changes in v2:
> - Add merge-label-base.dts to check a label which is not in the plugin
> - Add merge-label-braces.dts to check &{label} in a plugin
> - Add merge-label-order.dts to check the order of &{label} and &label
> - Add merge-root-plugin.dts to check / { ... } against &{/} { ... }
> - Reword four comments in the test files
>=20
>  tests/merge-delete-missing.dts     |  9 ++++++
>  tests/merge-errors.dts             | 14 +++++++++
>  tests/merge-first-ref-relative.dts |  7 +++++
>  tests/merge-first-ref.dts          |  6 ++++
>  tests/merge-label-base.dts         | 10 +++++++
>  tests/merge-labelled-plugin.dts    | 12 ++++++++
>  tests/merge-labelled-relative.dts  | 10 +++++++
>  tests/merge-omit-missing.dts       |  9 ++++++
>  tests/merge-path-ref-missing.dts   | 11 +++++++
>  tests/merge-path-relative.dts      | 10 +++++++
>  tests/merge-root-plugin.dts        | 12 ++++++++
>  tests/run_tests.sh                 | 47 ++++++++++++++++++++++++++++++
>  12 files changed, 157 insertions(+)
>  create mode 100644 tests/merge-delete-missing.dts
>  create mode 100644 tests/merge-errors.dts
>  create mode 100644 tests/merge-first-ref-relative.dts
>  create mode 100644 tests/merge-first-ref.dts
>  create mode 100644 tests/merge-label-base.dts
>  create mode 100644 tests/merge-labelled-plugin.dts
>  create mode 100644 tests/merge-labelled-relative.dts
>  create mode 100644 tests/merge-omit-missing.dts
>  create mode 100644 tests/merge-path-ref-missing.dts
>  create mode 100644 tests/merge-path-relative.dts
>  create mode 100644 tests/merge-root-plugin.dts
>=20
> diff --git a/tests/merge-delete-missing.dts b/tests/merge-delete-missing.=
dts
> new file mode 100644
> index 0000000..b36e39e
> --- /dev/null
> +++ b/tests/merge-delete-missing.dts
> @@ -0,0 +1,9 @@
> +/dts-v1/;
> +
> +/ {
> +	label: node {
> +	};
> +};
> +
> +/* Try to delete a node using a non-existent label */
> +/delete-node/ &nosuchnode;
> diff --git a/tests/merge-errors.dts b/tests/merge-errors.dts
> new file mode 100644
> index 0000000..f828e86
> --- /dev/null
> +++ b/tests/merge-errors.dts
> @@ -0,0 +1,14 @@
> +/dts-v1/;
> +
> +/ {
> +	label: node {
> +	};
> +};
> +
> +/* Each fragment below refers to a missing node, and each is reported */
> +&nosuchnode1 {
> +	prop;
> +};
> +
> +/delete-node/ &nosuchnode2;
> +/omit-if-no-ref/ &nosuchnode3;
> diff --git a/tests/merge-first-ref-relative.dts b/tests/merge-first-ref-r=
elative.dts
> new file mode 100644
> index 0000000..fe4cf9b
> --- /dev/null
> +++ b/tests/merge-first-ref-relative.dts
> @@ -0,0 +1,7 @@
> +/dts-v1/;
> +/plugin/;
> +
> +/* A plugin cannot define a node using a label-relative reference */
> +&{label/node} {
> +	prop;
> +};
> diff --git a/tests/merge-first-ref.dts b/tests/merge-first-ref.dts
> new file mode 100644
> index 0000000..2f585d6
> --- /dev/null
> +++ b/tests/merge-first-ref.dts
> @@ -0,0 +1,6 @@
> +/dts-v1/;
> +
> +/* Only a plugin can start with a reference */
> +&nosuchnode {
> +	prop;
> +};
> diff --git a/tests/merge-label-base.dts b/tests/merge-label-base.dts
> new file mode 100644
> index 0000000..1a0a8bb
> --- /dev/null
> +++ b/tests/merge-label-base.dts
> @@ -0,0 +1,10 @@
> +/dts-v1/;
> +/plugin/;
> +
> +/ {
> +};
> +
> +/* A label which is not in the plugin may be in the base tree */
> +&{baselabel} {
> +	prop;
> +};
> diff --git a/tests/merge-labelled-plugin.dts b/tests/merge-labelled-plugi=
n.dts
> new file mode 100644
> index 0000000..3849cc5
> --- /dev/null
> +++ b/tests/merge-labelled-plugin.dts
> @@ -0,0 +1,12 @@
> +/dts-v1/;
> +/plugin/;
> +
> +/ {
> +	label: node {
> +	};
> +};
> +
> +/* Add a label to a node defined in the plugin itself */
> +newlabel: &label {
> +	prop =3D "value";
> +};
> diff --git a/tests/merge-labelled-relative.dts b/tests/merge-labelled-rel=
ative.dts
> new file mode 100644
> index 0000000..8faaf5e
> --- /dev/null
> +++ b/tests/merge-labelled-relative.dts
> @@ -0,0 +1,10 @@
> +/dts-v1/;
> +/plugin/;
> +
> +/ {
> +};
> +
> +/* A label outside the plugin cannot be used in a label-relative referen=
ce */
> +newlabel: &{baselabel/subnode} {
> +	prop;
> +};
> diff --git a/tests/merge-omit-missing.dts b/tests/merge-omit-missing.dts
> new file mode 100644
> index 0000000..0357648
> --- /dev/null
> +++ b/tests/merge-omit-missing.dts
> @@ -0,0 +1,9 @@
> +/dts-v1/;
> +
> +/ {
> +	label: node {
> +	};
> +};
> +
> +/* Try to mark a node using a non-existent path */
> +/omit-if-no-ref/ &{/nosuchnode};
> diff --git a/tests/merge-path-ref-missing.dts b/tests/merge-path-ref-miss=
ing.dts
> new file mode 100644
> index 0000000..ad2e35e
> --- /dev/null
> +++ b/tests/merge-path-ref-missing.dts
> @@ -0,0 +1,11 @@
> +/dts-v1/;
> +
> +/ {
> +	node {
> +	};
> +};
> +
> +/* Try to redefine a node using a non-existent path */
> +&{/nosuchnode} {
> +	prop;
> +};
> diff --git a/tests/merge-path-relative.dts b/tests/merge-path-relative.dts
> new file mode 100644
> index 0000000..0a79379
> --- /dev/null
> +++ b/tests/merge-path-relative.dts
> @@ -0,0 +1,10 @@
> +/dts-v1/;
> +/plugin/;
> +
> +/ {
> +};
> +
> +/* A label outside the plugin cannot be used in a label-relative referen=
ce */
> +&{baselabel/node} {

This seems redundant with merge-labelled-relative.dts, and arguably
with nmerge-first-ref-relative.dts as well.

> +	prop;
> +};
> diff --git a/tests/merge-root-plugin.dts b/tests/merge-root-plugin.dts
> new file mode 100644
> index 0000000..f67355e
> --- /dev/null
> +++ b/tests/merge-root-plugin.dts
> @@ -0,0 +1,12 @@
> +/dts-v1/;
> +/plugin/;
> +
> +/* This is in the root node of the plugin */
> +/ {
> +	prop1;
> +};
> +
> +/* This is an overlay fragment for the root node of the base tree */
> +&{/} {
> +	prop2;
> +};

Might be worth commenting that this wasn't particularly intentional
and it's not clear if this difference is a good thing, although it's
certainly existing behaviour.

> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index 5775e0c..146d288 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -770,6 +770,53 @@ dtc_tests () {
>      run_sh_test "$SRCDIR/dtc-checkfails.sh" phandle_references -- -I dts=
 -O dtb "$SRCDIR/nonexist-label-ref.dts"
>      run_sh_test "$SRCDIR/dtc-fatal.sh" -m "Label or path nosuchnode not =
found" \
>  	-I dts -O dtb "$SRCDIR/nonexist-node-ref2.dts"
> +
> +    # Check each error when merging the fragments of a dts file, with its
> +    # position
> +    run_wrap_error_msg_test "test_label_ref.dts:7.8-15 Label or path han=
dle not found" \
> +	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/test_label_ref.dts"
> +    run_wrap_error_msg_test "nonexist-node-ref2.dts:9.1-12 Label or path=
 nosuchnode not found" \
> +	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/nonexist-node-ref2.dts"
> +    run_wrap_error_msg_test "merge-first-ref.dts:4.13-6.3 Label or path =
nosuchnode not found" \
> +	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/merge-first-ref.dts"
> +    run_wrap_error_msg_test "merge-first-ref-relative.dts:5.15-7.3 Label=
-relative reference label/node not supported in plugin" \
> +	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/merge-first-ref-relative.dts"
> +    run_wrap_error_msg_test "merge-labelled-relative.dts:8.1-10 Label-re=
lative reference baselabel/subnode not supported in plugin" \
> +	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/merge-labelled-relative.dts"
> +    run_wrap_error_msg_test "merge-path-relative.dts:8.1-18 Label-relati=
ve reference baselabel/node not supported in plugin" \
> +	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/merge-path-relative.dts"
> +    run_wrap_error_msg_test "merge-path-ref-missing.dts:9.1-15 Label or =
path /nosuchnode not found" \
> +	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/merge-path-ref-missing.dts"
> +    run_wrap_error_msg_test "merge-delete-missing.dts:9.15-26 Label or p=
ath nosuchnode not found" \
> +	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/merge-delete-missing.dts"
> +    run_wrap_error_msg_test "merge-omit-missing.dts:9.18-32 Label or pat=
h /nosuchnode not found" \
> +	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/merge-omit-missing.dts"
> +    run_wrap_error_msg_test "merge-errors.dts:9.1-13 Label or path nosuc=
hnode1 not found" \
> +	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/merge-errors.dts"
> +    run_wrap_error_msg_test "merge-errors.dts:13.15-27 Label or path nos=
uchnode2 not found" \
> +	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/merge-errors.dts"
> +    run_wrap_error_msg_test "merge-errors.dts:14.18-30 Label or path nos=
uchnode3 not found" \
> +	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/merge-errors.dts"
> +
> +    # A labelled reference to a node in a plugin adds the label to it
> +    run_dtc_test -@ -I dts -O dtb -o merge-labelled-plugin.test.dtb \
> +	"$SRCDIR/merge-labelled-plugin.dts"
> +    run_fdtget_test "/node" merge-labelled-plugin.test.dtb /__symbols__ =
newlabel
> +    run_fdtget_test "value" merge-labelled-plugin.test.dtb /node prop
> +
> +    # In a plugin, / { ... } and &{/} { ... } are not the same thing
> +    run_dtc_test -I dts -O dtb -o merge-root-plugin.test.dtb \
> +	"$SRCDIR/merge-root-plugin.dts"
> +    run_fdtget_test "" merge-root-plugin.test.dtb / prop1
> +    run_fdtget_test "/" merge-root-plugin.test.dtb /fragment@0 target-pa=
th
> +    run_fdtget_test "" merge-root-plugin.test.dtb /fragment@0/__overlay_=
_ prop2
> +
> +    # In a plugin, a label which is not found becomes an overlay fragment
> +    run_dtc_test -I dts -O dtb -o merge-label-base.test.dtb \
> +	"$SRCDIR/merge-label-base.dts"
> +    run_fdtget_test "" merge-label-base.test.dtb /fragment@0/__overlay__=
 prop
> +    run_fdtget_test "/fragment@0:target:0" merge-label-base.test.dtb /__=
fixups__ baselabel
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

--2ZL4Ir7xG3Rb+RDN
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmsGLQUACgkQzQJF27ox
2GeK1A//ZvHNrd7vYI1SsH4Z9n3BxI7FGlf4lOMISyFhhd1CMbjXmcM8pAMhJL8O
TAhu6JY74I9XKj3RgTQoNL9CT2fXZthui1YPJ7PzwkskSiMl/4jgXPE3KpetWe26
ou0aao2nAnwobX5aKmRLfRaxQaui7hKnLOXYU60tp7JkhHH+UVutUsEiAO+BN0n+
8jc3aXlUl5MNQupQV8vtLM4zQZ7i8Jh2ZA0A7Opw28ze8JmEM2b1kYl3SKkPOgj1
5B9v53mGJGcvoRIJ4Jvww0+s7geOyIXHuARd4wHezhvS/K/4+gQNu47in3uykSVF
gdo+HAOKjQRyDzocUoSVMGWy8GYVJ1l5r3lBLbQkHh9iRjcrpmH+57NfSI86PQrK
MuyhXQ89EoXrUr3PFy5T9O3B6/apk2xeWqd3CFfhD0iDL44GgZcFJg3437KlTzW9
qiHlL6WCYwltMDloROzC0R6B9gzWbhEBBwsFa0sAodfhnqTdPzqggj2ilpBkzCH7
4k08Dixzh9X3MpRjKqZaOzhQ0qfGGyING9H9groGB6dOOh8TrSmejZrsUItzIe6+
ajodXwLp5uXiwBpqYgS05Zq0Gbrxvz4aDMEWGvGFSv6q/fkpsppA2ToL/ZWGMYOE
tjEHUX5qSVEvcr29aqWA7iGBCxeA+yyCZ1YM6+KIWtJTM6sQbmY=
=NhTJ
-----END PGP SIGNATURE-----

--2ZL4Ir7xG3Rb+RDN--
