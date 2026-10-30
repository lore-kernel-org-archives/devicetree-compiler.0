Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793353221;
	b=sv8iJrBgjKRJb4vmGglViMO72G/jjPuYVcNq7/HlJkpEFGD18+j3fEcNpSr3W9BPop6P
	 ydnjC0P8czjJg5xhGZuAiCPZbw40cN0T98t8t6+8AAInu40KYDj3Ts3twYhrXSN9Fs+yf
	 JTxxLP/Uy5xrBQK3YRPN2plPbj296WZ/qUQyUXXk0BkNSNa66LQtVWCgG6FXHoOAwSRMx
	 1qFblMg9udAunqPtDiih41+pVjXO6gyIo5sHAOvdhsE1hWyI0tMLibYrQl99Hcg0aIPLt
	 bdIlQ13F6pzESo+eQ8cL3Xm/TP4tgcNiUzQwkBKf61gTNFZ804qWQ4bFUSD6udoWkLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353221;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=OwOnTJ4d7JwPKPL61l4o9bN+NPrhhiy6C9V02L9Hkxc=;
	b=ABF49CPP/YoGcmedNV6jnYsLxhD74UgKkAHRtRDKHjNFNxCgqMWPYv2Gqg7dPZUtf3t+
	 uKJK8xuvwVAeV2ikJ/bRfVV7zArXm68jBR14rk/PVQSvjDWVLFxasQSnkBtfo91ESM+iu
	 No0b2r/5cstAWn/u4WGRRTJ2f0AWWyJVY9RFBAWZqqyEetFyDM/tAsSmlpFern/4R3yIZ
	 mPv6HrJlDkNMn38DOHrrSbejk2BKLHsS07hgnlSGYyltdpKGlmgmzTj9NvHxPmFpOIDLU
	 pazYXmSDFqjvsVAqa3n4TpScBvtvEDMn0BE7GROnVayWMR3+p4v5ueLZJ7CwKEQQr3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=hE69043z;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9739C60A2616
	for <devicetree-compiler@vger.kernel.org>; Fri, 30 Oct 2026 09:40:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9739C60A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=hE69043z
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DD0F71A1398;
	Fri, 30 Oct 2026 09:40:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A9511603C2;
	Fri, 30 Oct 2026 09:40:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 617B7103287DA;
	Fri, 30 Oct 2026 10:40:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793353215; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=OwOnTJ4d7JwPKPL61l4o9bN+NPrhhiy6C9V02L9Hkxc=;
	b=hE69043zNn00u2aYG9m6Au1ISR5PaNjJKRXj+vJ+1KMXz7R+uXq+o3aK6NsujBIZqq2fPC
	wlE8AVTXpnwrHiYozLkXxtRVeHpckv335yowHcsAGoiQGZteJgQRt9r7gPwF9+e87wZoG8
	to9GETbRTC4BfADmraUk0K0vtftwFPzRUlRqvyFYTF6ooTJdRc/K7iIIRWFQfwpkUthwIQ
	gXbckLe+Mih6LWd9Xu9QpI71FUCrM/OK7RuxB9EVE7WUtXg4xZWOS3H647z3JJ1VOXAFHX
	8Vef1S7x8dn+Papba1lqElvexJKEjqFM7Ar/oZPU3LO4FrE28DWs/TkgnpRW5Q==
Date: Fri, 30 Oct 2026 10:40:11 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Simon Glass <sjg@chromium.org>, Devicetree Compiler
 <devicetree-compiler@vger.kernel.org>
Subject: Re: [PATCH v3 1/4] tests: Check the message when dtc fails
Message-ID: <20261030104011.7bf119be@bootlin.com>
In-Reply-To: <auQQtdKjywFWPe7D@gractus.seuss>
References: <20261029093115.3647778-1-sjg@chromium.org>
	<20261029093115.3647778-2-sjg@chromium.org>
	<20261029121152.00820613@bootlin.com>
	<auQQtdKjywFWPe7D@gractus.seuss>
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

Hi,

On Fri, 30 Oct 2026 14:36:22 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

...

> > > @@ -319,7 +322,8 @@ libfdt_overlay_tests () {
> > >  	run_dtc_test -I dts -O dtb -o $tree.test.dtb "$SRCDIR/$tree.dts"
> > >  	run_test overlay_bad_fixup overlay_base_manual_symbols.test.dtb $tree.test.dtb
> > >      done
> > > -    run_sh_test "$SRCDIR/dtc-fatal.sh" -I dts -O dtb -o /dev/null "$SRCDIR/fixup-ref-to-path.dts"
> > > +    run_wrap_error_msg_test "Can't generate fixup for reference to path" \
> > > +	$VALGRIND $DTC -I dts -O dtb -o /dev/null "$SRCDIR/fixup-ref-to-path.dts"  
> > 
> > I don't think that the $VALGRIND here is a good idea. Also this is not consistent
> > with other dtc test calls. Those tests calls (other than using a script) use
> > run_dtc_test(). run_dtc_test() use $VALGRIND internally.  
> 
> So, this is reminding me why I think dtc-fatal.sh existed in the first
> place:
>   1. We want to wrap all dtc invocations in $VALGRIND
>   
>   2. We don't want to use valgrind on other commands we invoke via
>      wrap_error
> 
>   3. We want to avoid individual test invocations from dealing with
>      $VALGRIND
> 
> Hence, two different wrappers: run_wrap_error_test for general
> commands, dtc-fatal.sh for errors from dtc specifically.  Why one is a
> function and one a separate script I don't recall, although I have a
> nasty feeling there might have been a particular reason for having the
> script, though I've forgotten what it might have been.
> 
> I can think of one more modern reason to prefer scripts over shell
> functions:  the current integration of run_tests.sh into meson is
> pretty ugly.  Rather than using meson to manage testcases (which it
> can do reasonably well), we just invoke each "set" of tests from
> run-tests.sh as a single meson testcase.  That means more levels of
> logs to figure out exactly what went wrong for a meson test failure.
> 
> At some point it might be nice to eliminate run_tests.sh and make the
> testsuite meson native.  For that, shell function wrappers are
> obviously not ideal.

Have you consider switching current tests to TAP (Test Anything Protocol)?

TAP is supported by meson test.

If at some point the plan is to move current tests to a a better meson
integration, I suggest to consider TAP. Indeed, this will allow a finer
grain in test results compared to a meson basic executable test.

We can move tests from current tests to TAP by parts to ease this moving
task.

run_test.sh can provide its output in TAP format.

Cleaner test harnesses are create step by step by extracting parts from
run_test.sh until run_test.sh is empty.

Also all new tests should be TAP tests.

Libraries exist to help building TAP tests. One lib to chose for C test
program (if they are run out of a test shell script) and an other for
Shell test scripts should be enough.

> 
> The split between patches 1 & 2 here isn't ideal, btw.  The VALGRIND
> behaviour change is correct, but not logicall connected to the
> run_wrap_error_test / dtc-fatal.sh consolidation.  Meanwhile removing
> dtc-fatal.sh _does_ belong with the patch that makes it possible
> (given that's a single fairly small patch).
> 
> So, where next.
> 
> I think keep dtc-fatal.sh for the time being, but extend it with the
> -m option to check for specific messages.  Consider moving
> run_wrap_error_test into its own script (which dtc-fatal.sh could
> call).

Ok.

Best regards,
Hervé
