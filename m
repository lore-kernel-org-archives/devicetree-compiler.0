Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793607367;
	b=dvCuXNZA+Uu1aM1QCbterYlt6lEmB2dJvie0Kj4mSkL7GQNgGAGUHrokKTg0zAfkzS+7
	 zKGn2K54oKmlXaphdfshq1tOYVouc+BYHKsWt1Oanx5JBUiwaZ4jlmqFgMpLMNS0dDETo
	 TLp0aLupshOcWWzDfqjHYtgAzbSF1Y9d0R3ShfkgnrzUWg/TQq7pezFDOlgnNCfFATB7e
	 xdqDsXE3aivd2VZD4IZjUmQmYtrD7LdM84dD6VzsXTgc3IqECdQ9TZGLz+VnHndnFnb7p
	 zMeuOl3vnoOhsHnNerfYK0vjuS7x2KnMuhi5xYXh9I3lw8ePucG1sUY9iWj4RdO+lhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793607367;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=I+W0a3BhmlR6qCTV/ziHW2GjAA1rEFshq1+eHKCyE/w=;
	b=H+Eij1twlipqmR/gitOpU4ZHy+p+TnL/qCVwUcfOVGyWCxEF3LgdGKP0xyE61drL+svr
	 ISXll8y70e+FJVkybfraPQL1KvonhBewwGr1cO0eZDgPdJRQ3fCDrnop25fj77tkwzAak
	 BPPpYccgbHAX3tRhaEDH9DRRjOUJFoOvuG2RxPZWucXGDq+rpMeBuiGFcfHhbmURGGo4d
	 ytPIRaG+j9jza8CXfTBTb3Z3DKaj21GWIZgrcjwKaqJJbS5xkuhaBoajKsIsnu+sdDun7
	 5reYZfxYL10VKCpwh02K7bJNz7fJWqD6wT7FcyvgNPmlZB3+Xu6nXjLN82qhB0kKb4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=EG1rqXhB;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3F3606A324
	for <devicetree-compiler@vger.kernel.org>; Mon,  2 Nov 2026 08:16:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E3F3606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=EG1rqXhB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793607363;
	bh=I+W0a3BhmlR6qCTV/ziHW2GjAA1rEFshq1+eHKCyE/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EG1rqXhB2yhI/nt89fWboIrDydHicMyOPTr8gW1esLZhkQPnt2XPPOE1zwMBq/xQT
	 jE2h8/zPu49+Df9P8eFxL8cZAElLUhD99EqdABJTTigSBY6nfdW4RCJb2jFC2EzyT9
	 pqJ+miqfOlJOw0okDzNNRs9fbT/CvFZQFpA6b781skMxG1wC4ZFLYcI0/RwQMvdO0Z
	 Vo8/tZYWXmB2UQod/2JmbeAFfbjkip3CfASSe8s1rAeZ57mCf4pXmH6Z9SisXpvZQs
	 kmBGbd7U8oDpB0iGmtKPr4E4pM0+w9rYiWp90tWM3ZmPwWOcngOTe3Nj76grqK4RfW
	 d4Z4qKWkxaBNw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jJ4KH0LBhz4w1W; Mon, 02 Nov 2026 19:16:03 +1100 (AEDT)
Date: Mon, 2 Nov 2026 17:32:10 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Subject: Re: [PATCH 01/13] tests: Check each error when merging a dts file
Message-ID: <auguYCmZz3fSo3eB@gractus.seuss>
References: <20261101163721.2458982-1-sjg@chromium.org>
 <20261101163721.2458982-2-sjg@chromium.org>
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
	protocol="application/pgp-signature"; boundary="x0fatfgDi6W3RVcT"
Content-Disposition: inline
In-Reply-To: <20261101163721.2458982-2-sjg@chromium.org>

--x0fatfgDi6W3RVcT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 01, 2026 at 09:36:55AM -0700, Simon Glass wrote:
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
> errors are reported too, that a reference error is still reported when
> the parser finds another error, and that a labelled reference within a
> plugin adds the label, since nothing covers these either.
>=20
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>

Couple of nits, otherwise LGTM.

> ---
>=20
>  tests/merge-delete-missing.dts     |  9 +++++++
>  tests/merge-errors.dts             | 14 ++++++++++
>  tests/merge-first-ref-relative.dts | 10 ++++++++
>  tests/merge-first-ref.dts          |  9 +++++++
>  tests/merge-labelled-plugin.dts    | 12 +++++++++
>  tests/merge-labelled-relative.dts  | 14 ++++++++++
>  tests/merge-omit-missing.dts       |  9 +++++++
>  tests/merge-parse-error.dts        | 17 +++++++++++++
>  tests/merge-path-ref-missing.dts   | 11 ++++++++
>  tests/merge-path-relative.dts      | 12 +++++++++
>  tests/run_tests.sh                 | 41 ++++++++++++++++++++++++++++++
>  11 files changed, 158 insertions(+)
>  create mode 100644 tests/merge-delete-missing.dts
>  create mode 100644 tests/merge-errors.dts
>  create mode 100644 tests/merge-first-ref-relative.dts
>  create mode 100644 tests/merge-first-ref.dts
>  create mode 100644 tests/merge-labelled-plugin.dts
>  create mode 100644 tests/merge-labelled-relative.dts
>  create mode 100644 tests/merge-omit-missing.dts
>  create mode 100644 tests/merge-parse-error.dts
>  create mode 100644 tests/merge-path-ref-missing.dts
>  create mode 100644 tests/merge-path-relative.dts
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
> index 0000000..6d3969f
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
> +/* Each error is reported, not just the first */

I'm a bit confused by this comment - I only see one error in this
file.

> +&nosuchnode1 {
> +	prop;
> +};
> +
> +/delete-node/ &nosuchnode2;
> +/omit-if-no-ref/ &nosuchnode3;
> diff --git a/tests/merge-first-ref-relative.dts b/tests/merge-first-ref-r=
elative.dts
> new file mode 100644
> index 0000000..103cd1f
> --- /dev/null
> +++ b/tests/merge-first-ref-relative.dts
> @@ -0,0 +1,10 @@
> +/dts-v1/;
> +/plugin/;
> +
> +/* A plugin cannot start with a label-relative reference */

That's slightly misleading, insn't it?  A plugin can't have _any_
label relative references unless they resolve within the plugin.

> +&{label/node} {
> +	prop;
> +};
> +
> +/* Later fragments are still merged */
> +/delete-node/ &nosuchnode;
> diff --git a/tests/merge-first-ref.dts b/tests/merge-first-ref.dts
> new file mode 100644
> index 0000000..8f23a44
> --- /dev/null
> +++ b/tests/merge-first-ref.dts
> @@ -0,0 +1,9 @@
> +/dts-v1/;
> +
> +/* Only a plugin can start with a reference */
> +&nosuchnode {
> +	prop;
> +};
> +
> +/* Later fragments are still merged */
> +/delete-node/ &nosuchnode2;
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
> index 0000000..00369e3
> --- /dev/null
> +++ b/tests/merge-labelled-relative.dts
> @@ -0,0 +1,14 @@
> +/dts-v1/;
> +/plugin/;
> +
> +/ {
> +	label: node {
> +		subnode {
> +		};
> +	};
> +};
> +
> +/* A plugin cannot use a label-relative reference, even if it is found */
> +newlabel: &{label/subnode} {
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
> diff --git a/tests/merge-parse-error.dts b/tests/merge-parse-error.dts
> new file mode 100644
> index 0000000..c39318b
> --- /dev/null
> +++ b/tests/merge-parse-error.dts
> @@ -0,0 +1,17 @@
> +/dts-v1/;
> +
> +/ {
> +	label: node {
> +	};
> +};
> +
> +/* Reported even though the parser finds another error below */
> +&nosuchnode {
> +	prop;
> +};
> +
> +/ {
> +	node {
> +		prop =3D <(1/0)>;
> +	};
> +};
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
> index 0000000..94a0b38
> --- /dev/null
> +++ b/tests/merge-path-relative.dts
> @@ -0,0 +1,12 @@
> +/dts-v1/;
> +/plugin/;
> +
> +/ {
> +	label: node {
> +	};
> +};
> +
> +/* A plugin cannot use a label-relative path reference */
> +&{label/node} {
> +	prop;
> +};
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index 5bc7817..e0504c0 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -765,6 +765,47 @@ dtc_tests () {
>      run_sh_test "$SRCDIR/dtc-checkfails.sh" phandle_references -- -I dts=
 -O dtb "$SRCDIR/nonexist-node-ref.dts"
>      run_sh_test "$SRCDIR/dtc-checkfails.sh" phandle_references -- -I dts=
 -O dtb "$SRCDIR/nonexist-label-ref.dts"
>      run_sh_test "$SRCDIR/dtc-fatal.sh" -I dts -O dtb "$SRCDIR/nonexist-n=
ode-ref2.dts"
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
> +    run_wrap_error_msg_test "merge-first-ref.dts:9.15-27 Label or path n=
osuchnode2 not found" \
> +	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/merge-first-ref.dts"
> +    run_wrap_error_msg_test "merge-first-ref-relative.dts:5.15-7.3 Label=
-relative reference label/node not supported in plugin" \
> +	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/merge-first-ref-relative.dts"
> +    run_wrap_error_msg_test "merge-first-ref-relative.dts:10.15-26 Label=
 or path nosuchnode not found" \
> +	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/merge-first-ref-relative.dts"
> +    run_wrap_error_msg_test "merge-labelled-relative.dts:12.1-10 Label-r=
elative reference label/subnode not supported in plugin" \
> +	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/merge-labelled-relative.dts"
> +    run_wrap_error_msg_test "merge-path-relative.dts:10.1-14 Label-relat=
ive reference label/node not supported in plugin" \
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
> +    run_wrap_error_msg_test "merge-parse-error.dts:9.1-12 Label or path =
nosuchnode not found" \
> +	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/merge-parse-error.dts"
> +    run_wrap_error_msg_test "merge-parse-error.dts:15.12-15 Division by =
zero" \
> +	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/merge-parse-error.dts"
> +
> +    # A labelled reference to a node in a plugin adds the label to it
> +    run_dtc_test -@ -I dts -O dtb -o merge-labelled-plugin.test.dtb \
> +	"$SRCDIR/merge-labelled-plugin.dts"
> +    run_fdtget_test "/node" merge-labelled-plugin.test.dtb /__symbols__ =
newlabel
> +    run_fdtget_test "value" merge-labelled-plugin.test.dtb /node prop
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

--x0fatfgDi6W3RVcT
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmroLmAACgkQzQJF27ox
2Gc26A/9Fob9ILeZdernIvPXNTdVsm+uR3OVVIr8XSEvg7I87W3TH1ePEhfMeRJy
Y3UT8ZyQQoZ/RbzWQ6pqqrFso40B3cpwBWKJF4HquCoWub2x2mvl+0PbiUaxV7Kw
5lVfDWBCbzNUalcP//sG4IQad6xsPeEJZHocPTU/ntw6CoxQzDk6zsrzzLA07ukW
PRJA+1Ky5B2swVw3LddF78UtOwHZniOeAAFI4adzNvk300n+0Z6c9A/XUSAzSmqr
t4B9VhZFAe71NzKsDoGskPYF+0CcqcMtFWC68F5b3bjKpSRF9cBnfKbyH1B3Vd1Z
QRse9LmkdMg0PtfadX5oRz2sCLxHD/EakwO3nLDvU/gxOzhNbz7mXmokKCJTg29N
zuGIWnUEV1/voZcX2Q/SP0LS8UwMDgQCEsjR1WMayE5x+J0q7NGJ0Sc6tTDB797m
R5bydwOLfeywY1aowrWhX4EJKHpTVFgZF6omaZs56kB32BHam0zPPZUriSlRtpl9
2E5Mk0rr6zXhb0u1UgKukOhbh6dEc67e2OChr7mQZER80pJvPD50TtT7YIVsBiC3
64qnjJAub6bj2ZHrTrJfrRl9AmmHlorzSyPWQyfkvk5M+mtkckQLkIEEPnfXxKbl
QPnLUi4PqMxYzTebdGHxPaiMz3EzXXx0EuRLJGX2khNgrUHCiqw=
=GmXy
-----END PGP SIGNATURE-----

--x0fatfgDi6W3RVcT--
