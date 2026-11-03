Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793689694;
	b=XYCGSDiHQWH5Xwm87Qh/iH80mzgYlbqmkn4IJvUQ5J3Kx43Xy4ADOUXot1wyE5JJ4E8f
	 3tzkLMj7IdLwVtRPTmqpPs1gxzqEKo1gsCKEvvTITGgk+5DKXvfQ2V15scYpKRodmeoIj
	 HA7WTYpFnjWlk31NRKcw2f4TaELkTZaJtagk1asSkCbycUXuQyESYAtlQApqiexRedVL3
	 D6dkRjn+204k3da3RcOUiqgWNLaFx+8pnDeLlhZ/CpO9T7YAYYBB8bj03gT7Nldkp24pP
	 SfhJcTQderm2q0bQlZPgxzX2L12NXStjXdJSKegxM3QhnD1DVbpNbHUrhYSj0nVG56A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793689694;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=M3AcHdnDY9k9QVCpsqD8e8BKwQEDu6sEPAveQveU/X8=;
	b=fhhMzNjtVfig9D4O5U6OlwA6nC9LPMqtVLeFmzxcY9iekcEtxwNE+rC5j0S7f1cUrGL4
	 6o+x+vrQvAA9yPSQ2aHf4yKZr+VKn4OS9dZjOaKga+QZuYMlkC4e+MdSnVQwOinEKn15b
	 WVAQgxe7NLsi7bxZiYByfKNFOCAWEPsDgNossVJGagNe+FWlOVWKPUKf7VOwWuWV0W7Mn
	 KXxUA0yEMiIytZn4wX6FFuGSilvXKBTzZ5MEWOfpOrJwczgL1HQvaMsQtN8YBhtZJFPDX
	 /stsAbqV28maE4QwFE4MO2CHFNoxpgGCW05IE9RqUfd9omUnH5BxPUOqMDyo7Vft+Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=O2z6pd4g;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D84606A32E
	for <devicetree-compiler@vger.kernel.org>; Tue,  3 Nov 2026 07:08:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29D84606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=O2z6pd4g
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2E87A1A13C8;
	Tue,  3 Nov 2026 07:08:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EEFD96046C;
	Tue,  3 Nov 2026 07:08:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 54C93103291A7;
	Tue,  3 Nov 2026 08:08:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793689688; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=M3AcHdnDY9k9QVCpsqD8e8BKwQEDu6sEPAveQveU/X8=;
	b=O2z6pd4g6KTnrNIqInYmC2WgYjF0EkIl5+X34HuBhfxFY3dAgn/jOBrONCwiQRAExxoCAf
	JKBpeRK9wsimD//J5wr9wQ/f9KDloIzjerZiQPhPgd11T3XcsD/pncg++zlRmMe6jOtsbc
	znoF6NhVD6uJHI9snFLbCPRVZwanOSThuimHoJ9mY5rBnY9GgNIIFclvdarnDbX1VrfFq9
	sQtXqYI6xP5nOp3RxKWFrcFP/7G+1iQ5a3fQErP4h6N2/b9DOkLts9TN2jnxBhkrlDaydm
	Fflvy6GkMMf3yUyCpDVb5YaZuIe1zG32KHBdGkmxH84tud/Cqnl9PvdTxnelGw==
Date: Tue, 3 Nov 2026 08:08:04 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Simon Glass <sjg@chromium.org>, Devicetree Compiler
 <devicetree-compiler@vger.kernel.org>
Subject: Re: [PATCH v3 1/4] tests: Check the message when dtc fails
Message-ID: <20261103080804.4f46b751@bootlin.com>
In-Reply-To: <auViQZqdLhTbnaME@gractus.seuss>
References: <20261029093115.3647778-1-sjg@chromium.org>
 <20261029093115.3647778-2-sjg@chromium.org>
 <20261029121152.00820613@bootlin.com>
 <auQQtdKjywFWPe7D@gractus.seuss>
 <20261030104011.7bf119be@bootlin.com>
 <auViQZqdLhTbnaME@gractus.seuss>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi David,

On Sat, 31 Oct 2026 14:36:42 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Fri, Oct 30, 2026 at 10:40:11AM +0100, Herve Codina wrote:
> > Hi,
> > 
> > On Fri, 30 Oct 2026 14:36:22 +1100
> > David Gibson <david@gibson.dropbear.id.au> wrote:
> > 
> > ...
> >   
> > > > > @@ -319,7 +322,8 @@ libfdt_overlay_tests () {
> > > > >  	run_dtc_test -I dts -O dtb -o $tree.test.dtb "$SRCDIR/$tree.dts"
> > > > >  	run_test overlay_bad_fixup overlay_base_manual_symbols.test.dtb $tree.test.dtb
> > > > >      done
> > > > > -    run_sh_test "$SRCDIR/dtc-fatal.sh" -I dts -O dtb -o /dev/null "$SRCDIR/fixup-ref-to-path.dts"
> > > > > +    run_wrap_error_msg_test "Can't generate fixup for reference to path" \
> > > > > +	$VALGRIND $DTC -I dts -O dtb -o /dev/null "$SRCDIR/fixup-ref-to-path.dts"    
> > > > 
> > > > I don't think that the $VALGRIND here is a good idea. Also this is not consistent
> > > > with other dtc test calls. Those tests calls (other than using a script) use
> > > > run_dtc_test(). run_dtc_test() use $VALGRIND internally.    
> > > 
> > > So, this is reminding me why I think dtc-fatal.sh existed in the first
> > > place:
> > >   1. We want to wrap all dtc invocations in $VALGRIND
> > >   
> > >   2. We don't want to use valgrind on other commands we invoke via
> > >      wrap_error
> > > 
> > >   3. We want to avoid individual test invocations from dealing with
> > >      $VALGRIND
> > > 
> > > Hence, two different wrappers: run_wrap_error_test for general
> > > commands, dtc-fatal.sh for errors from dtc specifically.  Why one is a
> > > function and one a separate script I don't recall, although I have a
> > > nasty feeling there might have been a particular reason for having the
> > > script, though I've forgotten what it might have been.
> > > 
> > > I can think of one more modern reason to prefer scripts over shell
> > > functions:  the current integration of run_tests.sh into meson is
> > > pretty ugly.  Rather than using meson to manage testcases (which it
> > > can do reasonably well), we just invoke each "set" of tests from
> > > run-tests.sh as a single meson testcase.  That means more levels of
> > > logs to figure out exactly what went wrong for a meson test failure.
> > > 
> > > At some point it might be nice to eliminate run_tests.sh and make the
> > > testsuite meson native.  For that, shell function wrappers are
> > > obviously not ideal.  
> > 
> > Have you consider switching current tests to TAP (Test Anything Protocol)?
> > 
> > TAP is supported by meson test.  
> 
> Sort of.  Using TAP for this would, IMO, negate one of the big
> advantages of moving to meson tests - being able to easily run
> specific test cases.  Indeed, I'm not overly fond of TAP in general -
> I'd be more likely to try converting to exeter[0].
> 
> [0] https://www.youtube.com/watch?v=4yKwN9u33TI

Exeter seems a nice tool!

One idea that came in mind for Exeter is the ability to run sub sub-test.

./my-test --list
test-a
test-b
  test-b1
  test-b2
test-c

'./my-test test-a' run test-a
'./my-test test-b' run test-b1 and test-b2
'./my-test test-b.test-b1' (or similar syntax) run test-b1 available in the test-b set.

Back to meson and TAP, meson can run run specific TAP test. The problem will be to run
specific sub-tests.

> 
> > If at some point the plan is to move current tests to a a better meson
> > integration, I suggest to consider TAP. Indeed, this will allow a finer
> > grain in test results compared to a meson basic executable test.  
> 
> Uh.. how so?

If TAP is used, meson will logs results of TAP sub-tests.

Without TAP, a test() program in Meson should be an individual test without
sub-tests.

run_test.sh contains several sub-tests (which can also probably be split
in sub sub-tests). Moving run_test.sh to TAP allows meson to logs those
individual sub-tests results instead of one whole result for the whole
run_test.sh.

If run-test.sh parameter to select a sub-tests, we still can run specific
sub-tests with TAP.

Best regards,
Hervé

> 
> > We can move tests from current tests to TAP by parts to ease this moving
> > task.  
> 
> I don't see how TAP really makes an incremental conversion any easier.
> 
> > run_test.sh can provide its output in TAP format.
> > 
> > Cleaner test harnesses are create step by step by extracting parts from
> > run_test.sh until run_test.sh is empty.
> > 
> > Also all new tests should be TAP tests.
> > 
> > Libraries exist to help building TAP tests. One lib to chose for C test
> > program (if they are run out of a test shell script) and an other for
> > Shell test scripts should be enough.  
> 
> I'm aware,.
> 
> > > The split between patches 1 & 2 here isn't ideal, btw.  The VALGRIND
> > > behaviour change is correct, but not logicall connected to the
> > > run_wrap_error_test / dtc-fatal.sh consolidation.  Meanwhile removing
> > > dtc-fatal.sh _does_ belong with the patch that makes it possible
> > > (given that's a single fairly small patch).
> > > 
> > > So, where next.
> > > 
> > > I think keep dtc-fatal.sh for the time being, but extend it with the
> > > -m option to check for specific messages.  Consider moving
> > > run_wrap_error_test into its own script (which dtc-fatal.sh could
> > > call).  
> > 
> > Ok.
> > 
> > Best regards,
> > Hervé
> >   
> 
