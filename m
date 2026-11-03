Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691267;
	b=lwVr1eOHbB6z9pTXvRnpBVUNcoisE9LTx/8grg/jILgEEY7hJbQQ9cJ3O3E7cZOPscpn
	 L2KPof9FU1sXfZFchVdx2Y1fPiRvIVZKTVHUZdUH178b2CbereLXgzbHRpUq/yjO9c/SG
	 cb4+gDKk/iE/hMPG4hiFqAIE1DS4RYPZz/E1jDzlBYXMJMYlH8Xuxelxe1JxpFpe4X5Zs
	 HvOW3akmOUixfn08zFMonWGgAZYZUmC544oURRnjq9NdFQnAbXZK44JjEc8suDBSn8iuT
	 nnUIyDU+CikhEnL29iE5PYA3L64ygQehrqElDp5bXgTP0KsNH0HcFwmxYD6uJThVbUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691267;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=JDhno7wcOQsahiGSpGr27l0GnQSogX4ySIzEmQYhius=;
	b=pNkoOnrNlT5dkG2uYzzM3m9IXXBeX/5JgiORLFKuUraD5nT2RYLC0GKVfb6sL1woZcDR
	 vYOfTHiqA9FYJbGJ6rNQZVrU1JW4FjIB5IEBBAf1Ae9gPgR7ZDP4BTh2OOY5Fv5AtiJhW
	 fjyfeMg/j2aP/+q9d6drKiWbNAZpCcWKS1tV3f9k8kZpkug5NH+kWXKYUKD18xdYwzb6d
	 zoTwgxOzbKxExbcTbTGcD6hOevvgS47HrIj0y197NU7QgeMaALKuDeYMJjnx2+g8uk9KJ
	 qgYjpBK7qml3Bfu8OxexdxZj3WrtuLCwAgPgeexH+z4vRdNVeoUmS6NX//uH6hD//6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=Dv8wlwgE;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB19606A32D
	for <devicetree-compiler@vger.kernel.org>; Tue,  3 Nov 2026 07:34:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EB19606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=Dv8wlwgE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793691256;
	bh=JDhno7wcOQsahiGSpGr27l0GnQSogX4ySIzEmQYhius=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dv8wlwgEzUNniltpR63Pc+JX9ADTEQoPXa55f/UUCGYhaaGs6W33lLgimS1EVQmZ+
	 9UF0yutRDMxfV5Om3aUKc3fB89Lo24pfhgiLHeB7+GL+BYLoGqbNc5X6xfT9QhQDKy
	 8WpkzCe2z5bOG4a25zBXC/Vl1z9e9ql2J4G6cY+cC7/7lxzgD2Mq+81UUFrwQqDkLc
	 CSRW21yYXwdWKSbzEfJfHfMPiG0MicJMMcd1c2H5NyAgxKeYPb5IpVfLSxhB/YpfST
	 iQ0SNYReV/5p0imM5t8kzTaqloCz0Jvt1bJd/3tWBay5RHoajnaoRpHUv7GxvNwIND
	 F1q+cNEA/ZUuA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jJgLc5qgLz4wDh; Tue, 03 Nov 2026 18:34:16 +1100 (AEDT)
Date: Tue, 3 Nov 2026 18:21:38 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Simon Glass <sjg@chromium.org>,
	Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Subject: Re: [PATCH v3 1/4] tests: Check the message when dtc fails
Message-ID: <aumLcU4Q7Ok5JvR1@gractus.seuss>
References: <20261029093115.3647778-1-sjg@chromium.org>
 <20261029093115.3647778-2-sjg@chromium.org>
 <20261029121152.00820613@bootlin.com>
 <auQQtdKjywFWPe7D@gractus.seuss>
 <20261030104011.7bf119be@bootlin.com>
 <auViQZqdLhTbnaME@gractus.seuss>
 <20261103080804.4f46b751@bootlin.com>
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
	protocol="application/pgp-signature"; boundary="RjNJJa5svtuHFYzq"
Content-Disposition: inline
In-Reply-To: <20261103080804.4f46b751@bootlin.com>

--RjNJJa5svtuHFYzq
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 03, 2026 at 08:08:04AM +0100, Herve Codina wrote:
> Hi David,
>=20
> On Sat, 31 Oct 2026 14:36:42 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Fri, Oct 30, 2026 at 10:40:11AM +0100, Herve Codina wrote:
> > > Hi,
> > >=20
> > > On Fri, 30 Oct 2026 14:36:22 +1100
> > > David Gibson <david@gibson.dropbear.id.au> wrote:
> > >=20
> > > ...
> > >  =20
> > > > > > @@ -319,7 +322,8 @@ libfdt_overlay_tests () {
> > > > > >  	run_dtc_test -I dts -O dtb -o $tree.test.dtb "$SRCDIR/$tree.d=
ts"
> > > > > >  	run_test overlay_bad_fixup overlay_base_manual_symbols.test.d=
tb $tree.test.dtb
> > > > > >      done
> > > > > > -    run_sh_test "$SRCDIR/dtc-fatal.sh" -I dts -O dtb -o /dev/n=
ull "$SRCDIR/fixup-ref-to-path.dts"
> > > > > > +    run_wrap_error_msg_test "Can't generate fixup for referenc=
e to path" \
> > > > > > +	$VALGRIND $DTC -I dts -O dtb -o /dev/null "$SRCDIR/fixup-ref-=
to-path.dts"   =20
> > > > >=20
> > > > > I don't think that the $VALGRIND here is a good idea. Also this i=
s not consistent
> > > > > with other dtc test calls. Those tests calls (other than using a =
script) use
> > > > > run_dtc_test(). run_dtc_test() use $VALGRIND internally.   =20
> > > >=20
> > > > So, this is reminding me why I think dtc-fatal.sh existed in the fi=
rst
> > > > place:
> > > >   1. We want to wrap all dtc invocations in $VALGRIND
> > > >  =20
> > > >   2. We don't want to use valgrind on other commands we invoke via
> > > >      wrap_error
> > > >=20
> > > >   3. We want to avoid individual test invocations from dealing with
> > > >      $VALGRIND
> > > >=20
> > > > Hence, two different wrappers: run_wrap_error_test for general
> > > > commands, dtc-fatal.sh for errors from dtc specifically.  Why one i=
s a
> > > > function and one a separate script I don't recall, although I have a
> > > > nasty feeling there might have been a particular reason for having =
the
> > > > script, though I've forgotten what it might have been.
> > > >=20
> > > > I can think of one more modern reason to prefer scripts over shell
> > > > functions:  the current integration of run_tests.sh into meson is
> > > > pretty ugly.  Rather than using meson to manage testcases (which it
> > > > can do reasonably well), we just invoke each "set" of tests from
> > > > run-tests.sh as a single meson testcase.  That means more levels of
> > > > logs to figure out exactly what went wrong for a meson test failure.
> > > >=20
> > > > At some point it might be nice to eliminate run_tests.sh and make t=
he
> > > > testsuite meson native.  For that, shell function wrappers are
> > > > obviously not ideal. =20
> > >=20
> > > Have you consider switching current tests to TAP (Test Anything Proto=
col)?
> > >=20
> > > TAP is supported by meson test. =20
> >=20
> > Sort of.  Using TAP for this would, IMO, negate one of the big
> > advantages of moving to meson tests - being able to easily run
> > specific test cases.  Indeed, I'm not overly fond of TAP in general -
> > I'd be more likely to try converting to exeter[0].
> >=20
> > [0] https://www.youtube.com/watch?v=3D4yKwN9u33TI
>=20
> Exeter seems a nice tool!
>=20
> One idea that came in mind for Exeter is the ability to run sub sub-test.
>=20
> ./my-test --list
> test-a
> test-b
>   test-b1
>   test-b2
> test-c
>=20
> './my-test test-a' run test-a
> './my-test test-b' run test-b1 and test-b2
> './my-test test-b.test-b1' (or similar syntax) run test-b1 available in t=
he test-b set.

The idea is that what you get from exeter's --list are the smallest
units that you can run individually.  So, rather than it being a
question of "sub tests", it's a question of running all the tests in a
group.  I see that as the job of the runner, rather than of the exeter
protocol itself.

Since that talk, I did add support for advertising metadata for each
testcase, so a runner could use that to build test groups or
supertests or whatever you want to call them.

> Back to meson and TAP, meson can run run specific TAP test. The problem w=
ill be to run
> specific sub-tests.

Well, "test points" as TAP calls them.  The thing is each test case in
the current harness is already (nearly always) a single executable
invocation.  If each executable just emits a single TAP test point,
there's no advantage over using the 'exitcode' protocol.  If the
executable emits multiple test points, then you can't select
individual ones.

> > > If at some point the plan is to move current tests to a a better meson
> > > integration, I suggest to consider TAP. Indeed, this will allow a fin=
er
> > > grain in test results compared to a meson basic executable test. =20
> >=20
> > Uh.. how so?
>=20
> If TAP is used, meson will logs results of TAP sub-tests.

As it would if each test case was converted to an 'exitcode' test.

> Without TAP, a test() program in Meson should be an individual test witho=
ut
> sub-tests.
>=20
> run_test.sh contains several sub-tests (which can also probably be split
> in sub sub-tests). Moving run_test.sh to TAP allows meson to logs those
> individual sub-tests results instead of one whole result for the whole
> run_test.sh.

Ah.. I guess it does deal with the cases where the tests can't be run
individuall because they depend on previous steps.  Yeah, that would
work better with TAP, fair point.

> If run-test.sh parameter to select a sub-tests, we still can run specific
> sub-tests with TAP.
>=20
> Best regards,
> Herv=E9
>=20
> >=20
> > > We can move tests from current tests to TAP by parts to ease this mov=
ing
> > > task. =20
> >=20
> > I don't see how TAP really makes an incremental conversion any easier.
> >=20
> > > run_test.sh can provide its output in TAP format.
> > >=20
> > > Cleaner test harnesses are create step by step by extracting parts fr=
om
> > > run_test.sh until run_test.sh is empty.
> > >=20
> > > Also all new tests should be TAP tests.
> > >=20
> > > Libraries exist to help building TAP tests. One lib to chose for C te=
st
> > > program (if they are run out of a test shell script) and an other for
> > > Shell test scripts should be enough. =20
> >=20
> > I'm aware,.
> >=20
> > > > The split between patches 1 & 2 here isn't ideal, btw.  The VALGRIND
> > > > behaviour change is correct, but not logicall connected to the
> > > > run_wrap_error_test / dtc-fatal.sh consolidation.  Meanwhile removi=
ng
> > > > dtc-fatal.sh _does_ belong with the patch that makes it possible
> > > > (given that's a single fairly small patch).
> > > >=20
> > > > So, where next.
> > > >=20
> > > > I think keep dtc-fatal.sh for the time being, but extend it with the
> > > > -m option to check for specific messages.  Consider moving
> > > > run_wrap_error_test into its own script (which dtc-fatal.sh could
> > > > call). =20
> > >=20
> > > Ok.
> > >=20
> > > Best regards,
> > > Herv=E9
> > >  =20
> >=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--RjNJJa5svtuHFYzq
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrpi3EACgkQzQJF27ox
2GeVgxAAmVbCjSS3ZkBOQvLNBvNEIyGk7V2mq+ZQnkDElHSbHsS9eC8xE6l07N4H
OsB739P9YSjxLH8AlWSmVNhuBS9YsKBOgIWdA+UQ5nmajV1ioMeJIivv4UcollU8
YX5SUrT1VDitlNSC72yGjfYPocwmgVnvOnx2Me4HFpO3wNt4bf95H/N88ujsUHD4
RyuC7dlFxivSpiF/8j3NSXtZpDWQDl17MkG7diMn259p7zMlvxwfWTiCx1irl15z
Qvd/awKjUtFh2wNmUE5kC8FE885PIWw9p8Nq1Mk6Zph1hNt48/728AnW7eu+T4a1
cERI6zoN25mRTvKDwodqOUbt80mTjfoYecIoHz0HV7W+iTomBer8ZFzJSY8UnJ6T
Ie8pZMCip11mtdalLIg2TNBe5tDHuO4wdSSUvGlIds6Jx7nyBUT4M2uXtSmegV8Z
E5dKBCKue+6IVelEaktsJzADtK8HNm3xyl9QQyTHdQ2y4qC3N9mSsJW8TwWkKYka
EuUj0f2C10NnCYOObhIjxjR38XBa1TYhXf9VClYHGdK5hWmLJf38cAKUvwCA+bA2
9KRdjTkegHv5v6KC55PfQiEQa/LI/WCLodRX1l5sxbXw1fNulXihED8mR2V3xkFk
z0CBWPgg1v6DbxKbJKqQwQbnUQPXxxklaf2aeyc4yT6RdzEKFMs=
=N09r
-----END PGP SIGNATURE-----

--RjNJJa5svtuHFYzq--
