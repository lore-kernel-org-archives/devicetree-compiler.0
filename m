Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793425065;
	b=TtDouAtcYAaYKgGq0Dlo103CywAgcyKpYlxsFFbZ/2zflPkhUExG1D8Dak0VOwcmPjlB
	 3sLUpQlYVS0GjJtXXLgcchhSVZ97NP2Ftm9yQIb7mqCE0LM09dRLCkipv++MY5uBpmoIU
	 eHoYtrYTtAgpF2qEBsdSFx4yOnJCySqqrCexteK75wwGducYW6+80vjCQrDxkF3kfl4Jj
	 6XFEHzZp0i0fZlDYakYjnI1zFsQOGKxOJNl+ZKIpnQCmr++uA/q5JO0GSIRzrfg4dYUXh
	 kOWavG5vH7h9/OPsYqNSe6KQjIweqjPSmKgmMXsOsxmLDA6calGeaAHde0H1MESvTyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793425065;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=9G8GEj8PivVmw7li7vp9tLDsyPnTwsigDloNvviZaVU=;
	b=BoD4Jb6LTKuh//OzqnDZcpAjXRoPCzXYaoqNBnVAoTE0C1yYEvlRMvgbKC2ABdeSx/kI
	 02aKroZRn2po+U5HS76ERKZIhbdjVuX/hP9O6xFQgVpTrS+PSek8wUh7LDSWVADKIJoHa
	 tCcDtAAIO3sI4OW6ZAcUY1YHM9c6lkvaSrwPCIWIXPRxk1FdDyYat3sOTYHRz3SD4Cx+P
	 iIGfTkYbOW7AS09fAO0TgVhLnL1yhapcK3JS6N6M9dqjAVQyAluKBTBFLBEcq2doV38eZ
	 88RRL1979FFKCMcK/uf8cVwmfVhCYwXZpYP2S2jYjbw3H9XBBereObsUnuASxBuSTuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=b6j+Hrdy;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4617F606A31A
	for <devicetree-compiler@vger.kernel.org>; Sat, 31 Oct 2026 05:37:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4617F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=b6j+Hrdy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793425061;
	bh=9G8GEj8PivVmw7li7vp9tLDsyPnTwsigDloNvviZaVU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b6j+HrdyPx50ewjVog8RxkYXL/yRfpJHQ1QgoAChUK0wTCaU73o5rY5MRjvg2Dn0K
	 EiwzqpYDZjk98G72OMsexxyI3MjbmG+nb75yBWSf2HwzG++rZ8xgWZludePi3z6JbW
	 29t3qamA4ANyelJ4TxG6Agws1weNLUqyIZwqXRjvt1dQIfF7RaOR8p91P/qlAne0fm
	 gUO9IEemY3XQbN5u6GQSyMbxfuLde1wlHb5CBJd0SHGSD6eCzNv2+fPZ/OvTUTDSAo
	 Z2GHTI5jkXo7iVtG2N/oQPPUfjXsZiVs1uxqfq4UHqusl1w7qU3rqIBo5tzW3t8hWK
	 /FExy7Ew5LuMA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jGmvT0CKHz4wsx; Sat, 31 Oct 2026 16:37:41 +1100 (AEDT)
Date: Sat, 31 Oct 2026 14:36:42 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Simon Glass <sjg@chromium.org>,
	Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Subject: Re: [PATCH v3 1/4] tests: Check the message when dtc fails
Message-ID: <auViQZqdLhTbnaME@gractus.seuss>
References: <20261029093115.3647778-1-sjg@chromium.org>
 <20261029093115.3647778-2-sjg@chromium.org>
 <20261029121152.00820613@bootlin.com>
 <auQQtdKjywFWPe7D@gractus.seuss>
 <20261030104011.7bf119be@bootlin.com>
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
	protocol="application/pgp-signature"; boundary="YkoP4cieXtPOeTjY"
Content-Disposition: inline
In-Reply-To: <20261030104011.7bf119be@bootlin.com>

--YkoP4cieXtPOeTjY
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 10:40:11AM +0100, Herve Codina wrote:
> Hi,
>=20
> On Fri, 30 Oct 2026 14:36:22 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> ...
>=20
> > > > @@ -319,7 +322,8 @@ libfdt_overlay_tests () {
> > > >  	run_dtc_test -I dts -O dtb -o $tree.test.dtb "$SRCDIR/$tree.dts"
> > > >  	run_test overlay_bad_fixup overlay_base_manual_symbols.test.dtb $=
tree.test.dtb
> > > >      done
> > > > -    run_sh_test "$SRCDIR/dtc-fatal.sh" -I dts -O dtb -o /dev/null =
"$SRCDIR/fixup-ref-to-path.dts"
> > > > +    run_wrap_error_msg_test "Can't generate fixup for reference to=
 path" \
> > > > +	$VALGRIND $DTC -I dts -O dtb -o /dev/null "$SRCDIR/fixup-ref-to-p=
ath.dts" =20
> > >=20
> > > I don't think that the $VALGRIND here is a good idea. Also this is no=
t consistent
> > > with other dtc test calls. Those tests calls (other than using a scri=
pt) use
> > > run_dtc_test(). run_dtc_test() use $VALGRIND internally. =20
> >=20
> > So, this is reminding me why I think dtc-fatal.sh existed in the first
> > place:
> >   1. We want to wrap all dtc invocations in $VALGRIND
> >  =20
> >   2. We don't want to use valgrind on other commands we invoke via
> >      wrap_error
> >=20
> >   3. We want to avoid individual test invocations from dealing with
> >      $VALGRIND
> >=20
> > Hence, two different wrappers: run_wrap_error_test for general
> > commands, dtc-fatal.sh for errors from dtc specifically.  Why one is a
> > function and one a separate script I don't recall, although I have a
> > nasty feeling there might have been a particular reason for having the
> > script, though I've forgotten what it might have been.
> >=20
> > I can think of one more modern reason to prefer scripts over shell
> > functions:  the current integration of run_tests.sh into meson is
> > pretty ugly.  Rather than using meson to manage testcases (which it
> > can do reasonably well), we just invoke each "set" of tests from
> > run-tests.sh as a single meson testcase.  That means more levels of
> > logs to figure out exactly what went wrong for a meson test failure.
> >=20
> > At some point it might be nice to eliminate run_tests.sh and make the
> > testsuite meson native.  For that, shell function wrappers are
> > obviously not ideal.
>=20
> Have you consider switching current tests to TAP (Test Anything Protocol)?
>=20
> TAP is supported by meson test.

Sort of.  Using TAP for this would, IMO, negate one of the big
advantages of moving to meson tests - being able to easily run
specific test cases.  Indeed, I'm not overly fond of TAP in general -
I'd be more likely to try converting to exeter[0].

[0] https://www.youtube.com/watch?v=3D4yKwN9u33TI

> If at some point the plan is to move current tests to a a better meson
> integration, I suggest to consider TAP. Indeed, this will allow a finer
> grain in test results compared to a meson basic executable test.

Uh.. how so?

> We can move tests from current tests to TAP by parts to ease this moving
> task.

I don't see how TAP really makes an incremental conversion any easier.

> run_test.sh can provide its output in TAP format.
>=20
> Cleaner test harnesses are create step by step by extracting parts from
> run_test.sh until run_test.sh is empty.
>=20
> Also all new tests should be TAP tests.
>=20
> Libraries exist to help building TAP tests. One lib to chose for C test
> program (if they are run out of a test shell script) and an other for
> Shell test scripts should be enough.

I'm aware,.

> > The split between patches 1 & 2 here isn't ideal, btw.  The VALGRIND
> > behaviour change is correct, but not logicall connected to the
> > run_wrap_error_test / dtc-fatal.sh consolidation.  Meanwhile removing
> > dtc-fatal.sh _does_ belong with the patch that makes it possible
> > (given that's a single fairly small patch).
> >=20
> > So, where next.
> >=20
> > I think keep dtc-fatal.sh for the time being, but extend it with the
> > -m option to check for specific messages.  Consider moving
> > run_wrap_error_test into its own script (which dtc-fatal.sh could
> > call).
>=20
> Ok.
>=20
> Best regards,
> Herv=E9
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--YkoP4cieXtPOeTjY
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrlYkEACgkQzQJF27ox
2GdfVBAAq93L9Fl4hUe3gLfBqWmvWIIDi/GjEX7m5mAlmWUCP+kVtblghH7LBHO5
bgHGId8xEuZAJ1x1+B6d0f1ro6XAPF1Xs9/9ux3fBhpvodH4ckgKZGfPWtYK1Gn6
gpXGpJu8HN5qbdm7bbEQ1JG8ICRXgwQAIiY/fQqADkQ3xA6pL5RBVEDtd/cNYSCp
+bHrg9+4+tDVYvx6m7K5PGJ5C0eaLKRG3yUnt0MkUn/hEAFwiZx+jEaF9rS10y7S
KuxxDsYxcsqwrIGWXUW/nFYyGeEEejHg6JkuZflpiEzlFjNIaO14xEa3IcDKxq9f
bZ4um+2AjyenGVcA86qhkNGmyTmlWPUbjDhBkorAHlL1wMkaTkuontoUMtkQUKJp
0d1F1SrI/I9tw4rKiuDL4gpBx0xoxY/hA4laZ/kOgUJc158vlOsmGTOVZtcZ6SPB
ejV+c/AUSeUtKWrcAEYn4gEk/mYtU/xK4liVzKTcIdJx/jrrQljlpufYbR6cwswz
3V7SdPdSc/UMQRf+aoNkVAyZKSfWqltBUPL+VAsP8iIGMGnJRpxMadgZavu6TNN6
wcFyCJjp7IU9ZkIB9HQPH1H/A1WReaUw+xQnnX1pqJGQct6YqXI6I9UgJvCptDq4
oiMK8Ap54xI8ZfH4yVDUli12/xCzzUjO7UOFOSTYCJMWdONiLOA=
=fWkI
-----END PGP SIGNATURE-----

--YkoP4cieXtPOeTjY--
