Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794540035;
	b=hHQ6xugR8LIJIHlM4SRmiJWyQxoMinrdcUHgYNbA2xKhwGFE1fwxd7AfHEuX7ewuNA86
	 3l2feDW3lECLICF7v4XHtiMTa5aj0Wo+0s4BdceVHY22orpFbmoJtwmzrGJhrX9QKvYsm
	 uLDEXQft1T4xg7uhL6Qyw+24/JR50aYao7erDmFOD8g+Gb8cYLvoPggzjZCGuQz644VqU
	 AQuUuYqS73e7mo5XHABqW0vxdF2RGfC8WKSBQEiW79e5CxMkiTWrucoOJKLwJCqym5ior
	 XUq4asgljHD8XZp1PEvQ8rrZOu2ZbnE+3VO4XAKnh+Ur1aypCboD8DPBosfLMGQxRKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794540035;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=t5mSsD0QkQYHJuiV1V/u6i1xQgDNWpdpmItY7wvgPHc=;
	b=paZRiN8Cw6WJC3CYOUT9Pao1M5m0HrdMtS8vwog5/EpKsfoeAM2szqkf/hvV+5WRha69
	 cQLDQCqEaPE1Us46zLMTouOnJwjg8PgfFvw89HTgAkuNJSri3TFs9Je9clFldWGJ8y0o6
	 TVKxrL3/7UIdZaVyZnc37AwJ+29fJ+i2ZLC+lF/OW9xelGdGWj511cakVp8X18Q1lMazz
	 9pjBKLLctzVJU3mRHOhxBE+LVpnKXMmSfh9GmvdYBQz+Ea/dLbbY8GIrdEOql7DFiUgZD
	 PSJ652O37ragl3v3RhPoowTsMMZyF+memTZbtECRwpXtIuLUoUdftyYLkB+487wGO6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=AmLdDYuj;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EE9606A323
	for <devicetree-compiler@vger.kernel.org>; Fri, 13 Nov 2026 03:20:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67EE9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=AmLdDYuj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1794540031;
	bh=t5mSsD0QkQYHJuiV1V/u6i1xQgDNWpdpmItY7wvgPHc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AmLdDYujVZScOrUgsNAPjJuyOV0xy1wTBPaivVuYvm6Rz8w9co/QYugGuKNR+8zl5
	 KO3pRCC64w6D7A/XxNf7ND2bmlx18WI3qGRFfNwXxETcJG46n0UjuYnzONp/RMgbOV
	 B0ewzNyjpPHY0Is94EqlIHB0/aEiDZjqvQbqgld6DDPGig2TIs6Qh3MZ1t/167yHmR
	 IOkpvmGdZioKhuVHmrr7LquiDdkkUtu9V0xJQQnPTfvVe9yL30GRYrWbbxzfSVsLmA
	 uSdxEqTChLFTYjg4d4IxYvUiu3G1l7Oa1gkH42wKpRSBdM3lFdOXVbwAMpqH7f/A5y
	 EuMTbkWbOf97g==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jQjFC3VZMz4wTj; Fri, 13 Nov 2026 14:20:31 +1100 (AEDT)
Date: Fri, 13 Nov 2026 14:20:22 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v3 01/18] tests: Check how the fragments of a dts file
 are merged
Message-ID: <avaB9WaP4CUaBJuU@gractus.seuss>
References: <20261106195159.2623314-1-sjg@chromium.org>
 <20261106195159.2623314-2-sjg@chromium.org>
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
	protocol="application/pgp-signature"; boundary="NUlmeT5ydKwlsOBY"
Content-Disposition: inline
In-Reply-To: <20261106195159.2623314-2-sjg@chromium.org>

--NUlmeT5ydKwlsOBY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 06, 2026 at 12:51:28PM -0700, Simon Glass wrote:
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
> the parser finds another error, that a labelled reference within a
> plugin adds the label, that / { ... } and &{/} { ... } differ in a
> plugin, and that a label in a plugin becomes an overlay fragment if it
> is not found or is written as &{label}, which applies after any local
> merges, since nothing covers these either. Also check that a node in an
> overlay fragment can be deleted by its label, and where the overlay
> fragment goes among the plugin's own nodes.
>=20
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>

Adding tests for this is very valuable.  Few concerns about some of
the specific things tested, see below.


[snip]
> diff --git a/tests/merge-errors.dts b/tests/merge-errors.dts
> new file mode 100644
> index 0000000..1e97088
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
> +/* All three of the references below are bad, and each one is reported */

Which three references?  I only see one.

> +&nosuchnode1 {
> +	prop;
> +};
> +
> +/delete-node/ &nosuchnode2;
> +/omit-if-no-ref/ &nosuchnode3;
> diff --git a/tests/merge-first-ref-relative.dts b/tests/merge-first-ref-r=
elative.dts
> new file mode 100644
> index 0000000..eece7a7
> --- /dev/null
> +++ b/tests/merge-first-ref-relative.dts
> @@ -0,0 +1,10 @@
> +/dts-v1/;
> +/plugin/;
> +
> +/* A plugin cannot define a node using a label-relative reference */
> +&{label/node} {
> +	prop;
> +};
> +
> +/* Later fragments are still merged */

Not sure this tests anything useful, since the compile will fail
overall.

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

Again, not sure what this is really testing.

> +/delete-node/ &nosuchnode2;
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
> diff --git a/tests/merge-label-braces.dts b/tests/merge-label-braces.dts
> new file mode 100644
> index 0000000..d5f8d0f
> --- /dev/null
> +++ b/tests/merge-label-braces.dts
> @@ -0,0 +1,12 @@
> +/dts-v1/;
> +/plugin/;
> +
> +/ {
> +	label: node {
> +	};
> +};
> +
> +/* This becomes an overlay fragment, even though the label is in the plu=
gin */
> +&{label} {

I'm not sure if this is testing behaviour we actually want to
enshrine.  My first thought was that &{label} should be illegal (the
path must be absolute.  But then I realised this does need to be
valid, as a degenerate case of a label-relative path.

That may currently have the side effect of forcing this to be an
orphan node, but I think that's an accident of implementation rather
than an intentional policy.

> +	prop;
> +};
> diff --git a/tests/merge-label-order.dts b/tests/merge-label-order.dts
> new file mode 100644
> index 0000000..f7923a0
> --- /dev/null
> +++ b/tests/merge-label-order.dts
> @@ -0,0 +1,17 @@
> +/dts-v1/;
> +/plugin/;
> +
> +&basenode {
> +	label: foo {
> +		p =3D "first";
> +	};
> +};
> +
> +/* The fragment for &{label} is applied last, so "second" wins */
> +&{label} {
> +	p =3D "second";
> +};
> +
> +&label {
> +	p =3D "third";
> +};

In this derived case, that existing behaviour just seems like a bug to
me.

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
> index 0000000..9bedfd9
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
> +/* Not allowed even though the reference is found */

Again, I'm not sure this is behaviour we want to enshrine in a test.
Since we can resolve this locally it would be reasonable to extend the
code so that it does.

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
> diff --git a/tests/merge-overlay-order.dts b/tests/merge-overlay-order.dts
> new file mode 100644
> index 0000000..2490157
> --- /dev/null
> +++ b/tests/merge-overlay-order.dts
> @@ -0,0 +1,19 @@
> +/dts-v1/;
> +/plugin/;
> +
> +&basenode {
> +	label: foo {
> +	};
> +
> +	bar {
> +	};
> +};
> +
> +/* A node in the plugin itself, after the overlay fragment */

As discussed on another thread, I'm not sure we really want to allow
this, although we might need to at least in the short to medium term,
for compatibility.

> +/ {
> +	node {
> +	};
> +};
> +
> +/* A label in an overlay fragment can be referred to */
> +/delete-node/ &label;
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

Reporting multiple errors is, in general, desirable behaviour, but..


This look like something that might be broken by the proposed changes:
the division by zero will caught during parse (since that's when we
resolve arithmetic) but we're going to defer the discovery of the
unknown node until the merge pass.  While reporting both errors would
be nice, it's not worth complexifying the implementation for it.
Therefore, I'm not sure we want to enshrine that behaviour in a test.

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
> index 0000000..c4e00a4
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
> +/* A plugin cannot define a node using a label-relative path reference */

It's possible in future we could allow this in some cases, if the
label can be resolved locally in the plugin.  What we definitely can't
do is use a label-relative path reference with an external label, so
that would be the more useful case to test.

> +&{label/node} {
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
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index f750faa..2d392e2 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -770,6 +770,80 @@ dtc_tests () {
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
> +
> +    # In a plugin, &{label} becomes an overlay fragment, even if it is f=
ound
> +    run_dtc_test -I dts -O dtb -o merge-label-braces.test.dtb \
> +	"$SRCDIR/merge-label-braces.dts"
> +    run_fdtget_test "" merge-label-braces.test.dtb /fragment@0/__overlay=
__ prop
> +    run_fdtget_test "node\nfragment@0\n__local_fixups__" merge-label-bra=
ces.test.dtb -l /
> +
> +    # The fragment for &{label} is applied after any local merges
> +    run_dtc_test -I dts -O dtb -o merge-label-order.test.dtb \
> +	"$SRCDIR/merge-label-order.dts"
> +    run_fdtget_test "third" merge-label-order.test.dtb /fragment@0/__ove=
rlay__/foo p
> +    run_fdtget_test "second" merge-label-order.test.dtb /fragment@1/__ov=
erlay__ p
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
> +    # In a plugin, a node in an overlay fragment can be deleted by its l=
abel,
> +    # and the overlay fragment comes before the later node in the plugin
> +    run_dtc_test -I dts -O dtb -o merge-overlay-order.test.dtb \
> +	"$SRCDIR/merge-overlay-order.dts"
> +    run_fdtget_test "fragment@0\nnode\n__fixups__" merge-overlay-order.t=
est.dtb -l /
> +    run_fdtget_test "bar" merge-overlay-order.test.dtb -l /fragment@0/__=
overlay__
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

--NUlmeT5ydKwlsOBY
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmr2gfUACgkQzQJF27ox
2Gcf/xAAmX0siQLiMgShcrtJkmaI4LZAEeaajg789YpSWpjLpUfxDhq6KfACtgfk
WLXJQgekxckyPX09dUWy6M6dVYFc04z+aJoVndutyUxK2unj9DaFlNqln9YwbB0Y
Vcx+mrUp7mYxEdM7mbxE+4EoU7H0IoJ3W6v78Ig53p/Cr5O8mmLm6p0nr9cInnND
Mq/QV9p5S2HCv/EcUSVI6r1/N6WiQgscUXQAaR6cMZAu/COdM3KnGA37cfzpJ57I
lNNWE/qOVkkhj14TICBDS6s3JBzqaKNjondaP4BHMLzPP1gdGRETnxdtmabHa4jt
Nd90nlSEvSb2BvHfdo/LhHnIJZSn0jLykp5GZu3wScBjZ3u2jokk8hX7R9T+OUIo
iQFZNS/aJ6Ce8oWNpPU3QlQSYRGelGQ7QvniH3MUAbhpTpzhSisKUtfZFb11seAU
hRiYPPS0TGn0ZhTniTcPvjjezfrigsvO81AHlKdOEDsOHHpvFytIUwgsTNAgpnOZ
NVAJ5tZfljadhLnk1nyCkJ/sEAeijqlctwRqBmAqzuJvcgxa5hRCvRQH+dcZrF0l
4HPGdCmwOhErEqYjdqdggzXMoKCGq9lFhHo20vIESkMdYV/DIbWMJXjKz4LzRet8
YdZ0Z1yujMDhFlgO3Bo2BrpzqidLBcysdcXIA5ilj4I9OMhODO0=
=ac7v
-----END PGP SIGNATURE-----

--NUlmeT5ydKwlsOBY--
