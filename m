Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793331391;
	b=4XWgbf2EdJk4JSXg3udrbLQJn3TdP9uLqxU5ujBNMTSJ27MI2+pHLpRIfycVDD6fDj1x
	 VC1+AxvCt/ME17UzuO8iBB4o46PWaiobo9QlBSWLYkz89iu9Cq20kZcy1EDpO0m05B1wr
	 2guro5b3H8oxzakMjwuXjJihPgMQd6sSfJ3ac+71vW9sG8Bx3BjWOw2RZX1ErURBn2xlL
	 c7F4MDuM2lUb/cEb7gHpbfPdvfelMsxbCRa9WSL2vZ1Q3WGvsxi52Zs0njgguk6Squ3RG
	 uyL2Yt/2m8lvLJG1o0Mpgn4OlJVnYRo1BwZiTGTi42wlxnDlVxOxkVjQguuHFDfM42w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793331391;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=V2jck6h1jzm2XPl8JWjqyvwtbNmS/8Iqxvzetntbo2A=;
	b=iR82D0x0yLdnubGZjUX2OkDyKcPKtTBF912neEgA673gBkGbjmqRT+n+noI3dd2Lyuww
	 rjCdenvdzfImhB1KlwlZvfgfo1KUFH6pU6lgQ9dnyMpfmi8bU488ERQXCTRYCsaiQIO4B
	 4nNsYoN70Y7cscpXN5teOvKB08DF3lmWeL3nOT6bFXpLPlz9oMlX1t+f2bvBYAY6GLx46
	 4FFGrEP+R+P09B9M2WezMYiR30wLab1OXwlCG3uuPlIt/Kc6treghHPshxZPz+Y1bl8Ph
	 EuUKTwBZu822WSYM+dTsAmTqRQpLbz+DBFhnGQ2aEbe7FK0yLnnHxEBwQ/F7CoBDGcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=NKrik75C;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02028606A31C
	for <devicetree-compiler@vger.kernel.org>; Fri, 30 Oct 2026 03:36:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02028606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=NKrik75C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793331388;
	bh=V2jck6h1jzm2XPl8JWjqyvwtbNmS/8Iqxvzetntbo2A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NKrik75C5nhJiwjway/Kg/8b2ETnjTyXWaCU6sSsHYw0HpiDCg7it1LhrLiqjly8Z
	 IisFZSh/bHjJMSkp9+9M3O+IMr16ho10jDav2ErrmTFX9C/bac8N6TApUaqxDM2IYo
	 HzoaS4ZVJ1IonVtp9SAAsIAiiDH06G/mdD/KFurCAECsToRUI9xP6dvyn6qIJz+Vdb
	 O2s5ZCHcThZKwvvl3r3hZRJDZV4xJbkZJJmolrVEc7L1kuzTj4Q/4yWgFKay8G3zfd
	 csDMP5qGt7cqtN21LK9GBZwPwSKXjHQEX5qOr3+HKc9B3m4SLOhLyi94XOdGB4Ge6t
	 K7aKkjIfg3/uA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jG6G40B41z4x7j; Fri, 30 Oct 2026 14:36:28 +1100 (AEDT)
Date: Fri, 30 Oct 2026 14:36:22 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Simon Glass <sjg@chromium.org>,
	Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Subject: Re: [PATCH v3 1/4] tests: Check the message when dtc fails
Message-ID: <auQQtdKjywFWPe7D@gractus.seuss>
References: <20261029093115.3647778-1-sjg@chromium.org>
 <20261029093115.3647778-2-sjg@chromium.org>
 <20261029121152.00820613@bootlin.com>
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
	protocol="application/pgp-signature"; boundary="1KudWAoPOAC6rTHU"
Content-Disposition: inline
In-Reply-To: <20261029121152.00820613@bootlin.com>

--1KudWAoPOAC6rTHU
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 12:11:52PM +0100, Herve Codina wrote:
> Hi Simon,
>=20
> On Thu, 29 Oct 2026 03:30:54 -0600
> Simon Glass <sjg@chromium.org> wrote:
>=20
> > dtc-fatal.sh only checks that dtc exits with status 1, so a test which
> > expects a particular error passes just as well if dtc fails for some
> > other reason, such as a mistake in the test's dts file.
> >=20
> > Use run_wrap_error_msg_test() instead, which also checks that dtc's
> > output contains the expected message.
> >=20
> > dtc-fatal.sh also catches a valgrind error, since valgrind exits with
> > a status other than 1. Make wrap_error_msg() report a valgrind error as
> > wrap_test() does, so this is not lost.
> >=20
> > Suggested-by: Herve Codina <herve.codina@bootlin.com>
> > Assisted-by: Claude:claude-opus-5-5
> > Signed-off-by: Simon Glass <sjg@chromium.org>
> > ---
> >=20
> > Changes in v3:
> > - Use run_wrap_error_msg_test() instead of adding -m to dtc-fatal.sh
> > - Check the message in all five tests
> >=20
> > Changes in v2:
> > - Add new patch to check the error message in dtc-fatal.sh
> >=20
> >  tests/run_tests.sh | 18 +++++++++++++-----
> >  1 file changed, 13 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> > index 5bc7817..d3134f2 100755
> > --- a/tests/run_tests.sh
> > +++ b/tests/run_tests.sh
> > @@ -193,6 +193,9 @@ wrap_error_msg () {
> >  	FAIL_IF_SIGNAL $ret
> >  	if [ "$ret" -eq 0 ]; then
> >  	    FAIL "Expected non-zero return code"
> > +	elif [ "$ret" -eq $VGCODE ]; then
> > +	    echo "VALGRIND ERROR"
> > +	    exit $VGCODE
> >  	fi
> >  	if ! grep -qF -- "$msg" "$log"; then
> >  	    FAIL "Expected message '$msg'"
> > @@ -319,7 +322,8 @@ libfdt_overlay_tests () {
> >  	run_dtc_test -I dts -O dtb -o $tree.test.dtb "$SRCDIR/$tree.dts"
> >  	run_test overlay_bad_fixup overlay_base_manual_symbols.test.dtb $tree=
=2Etest.dtb
> >      done
> > -    run_sh_test "$SRCDIR/dtc-fatal.sh" -I dts -O dtb -o /dev/null "$SR=
CDIR/fixup-ref-to-path.dts"
> > +    run_wrap_error_msg_test "Can't generate fixup for reference to pat=
h" \
> > +	$VALGRIND $DTC -I dts -O dtb -o /dev/null "$SRCDIR/fixup-ref-to-path.=
dts"
>=20
> I don't think that the $VALGRIND here is a good idea. Also this is not co=
nsistent
> with other dtc test calls. Those tests calls (other than using a script) =
use
> run_dtc_test(). run_dtc_test() use $VALGRIND internally.

So, this is reminding me why I think dtc-fatal.sh existed in the first
place:
  1. We want to wrap all dtc invocations in $VALGRIND
 =20
  2. We don't want to use valgrind on other commands we invoke via
     wrap_error

  3. We want to avoid individual test invocations from dealing with
     $VALGRIND

Hence, two different wrappers: run_wrap_error_test for general
commands, dtc-fatal.sh for errors from dtc specifically.  Why one is a
function and one a separate script I don't recall, although I have a
nasty feeling there might have been a particular reason for having the
script, though I've forgotten what it might have been.

I can think of one more modern reason to prefer scripts over shell
functions:  the current integration of run_tests.sh into meson is
pretty ugly.  Rather than using meson to manage testcases (which it
can do reasonably well), we just invoke each "set" of tests from
run-tests.sh as a single meson testcase.  That means more levels of
logs to figure out exactly what went wrong for a meson test failure.

At some point it might be nice to eliminate run_tests.sh and make the
testsuite meson native.  For that, shell function wrappers are
obviously not ideal.

The split between patches 1 & 2 here isn't ideal, btw.  The VALGRIND
behaviour change is correct, but not logicall connected to the
run_wrap_error_test / dtc-fatal.sh consolidation.  Meanwhile removing
dtc-fatal.sh _does_ belong with the patch that makes it possible
(given that's a single fairly small patch).

So, where next.

I think keep dtc-fatal.sh for the time being, but extend it with the
-m option to check for specific messages.  Consider moving
run_wrap_error_test into its own script (which dtc-fatal.sh could
call).


> Could we imagine run_dtc_fatal_test() (or similar name) to call here in o=
rder
> to be consistent with other calls?
>=20
> This will look like the following:
> --- 8< ---
> 	run_dtc_fatal_test "Can't generate fixup for reference to path" \
> 			   -I dts -O dtb -o /dev/null "$SRCDIR/fixup-ref-to-path.dts"
> --- 8< ---
>=20
> At some point, also dtc-checkfails.sh script could be replace by
> run_dtc_checkfails_test wrapper and dtc-fails.sh by run_dtc_checkfails_te=
st
> wrapper.
>=20
> Best regards,
> Herv=E9
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--1KudWAoPOAC6rTHU
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrkELUACgkQzQJF27ox
2GeaRxAAocJChubPzrgZhYQOiWGn4MQyZuSWNqLnBmIg7Ix6DOADWfpFiRAichSP
irBcAb8vew6Pb95TMhtg32uONPDXvqTcD9El4T0vsg33YQ8lsNKuzrvhWITKTW0+
0qwM6TaN791w5rEBWOCmgDMwUL3qaH3LcITZom9hmsRWFfuJzUlinkAX8KMjJDVy
kbBzGMMO0a4AUmAEMML6mQyQCAD0oApEEc6SOnOsAhcQpsDNf8J+W9+LiNXr4LLF
AAk3lwZszKU6xCmX9V3v7W1xi6Fwrb7x2TiaRoxNpep9MaBcmH3b1OK7IVb0mG9H
Jy7DBEIPsfjX/EMfIdYp4w7dTOZLSCKfRMcYQPG3mEwE2t6pjxyTP3iIvz/OdozA
1MgawO+d42k00pJ1HV18nTj5Ah8sZ0o5sOiRqE4c7f8yF08S0Gsds4foOb3Xzx1m
bnFFYlb/dysZCzJjGeklsL4EexxzksBmc0xWmOv6xFNS8g1JZo4ylvpWMUOP4onc
kq/HVdJ6/79ujgOs4ZFwE9cAfu7Ig9JH5n4HTxl77kXcHCJmRamT0XMGOijN83Qj
NpP/NudCr4O5JLyPdNHwEIbIKtfmXkkexMr+QI/dnWpW+CJnqs3t+X99qRQ4eYAN
Q6T3nn1StRAUP7Iafauz+8Eaz5EOnqqL5x45pB+CR5Z8XYeKqjw=
=JYpU
-----END PGP SIGNATURE-----

--1KudWAoPOAC6rTHU--
