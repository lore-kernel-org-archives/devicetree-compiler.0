Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793221747;
	b=zN7lmfCobyuK++uirVX8zRwRXDquOBc1r+IWOBVDg9p8/8xjnm2FEzbwGhGcDtGHkJrh
	 vUveZPwYiIRPZIaTeE3akmodtv4OeVSAXp5FNU2F3ci6bXL6xy8kKM8Fi8eaTP0xQaIHK
	 Q0YQW0ht+R/M3YLFsxdmUedPxsbyqJp1DF1Yw1LSn8WuAqbXHVtGgq2J8rP3mlA+NsZmp
	 zBMMC1MQuSyPN3u2LUOlEyFebTq16Ev5d5BH+WavWGAi1hmdcT2Wls+sM24Ar8EejGP3B
	 mOCW5V2Rb/L3DK11OveNqWjEVJQLgwj+gR1C46g1ltIvXxm+byBaaku59iQddiTeOAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793221747;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=pfiMfINIAHeKnVXXEJkQeRBshDC3bQOy99xgz49EiFw=;
	b=m6p5wT9zYcYHIgkRTP596O/MOAbGVUHEQffVaTwBJLlR2j8v3QKlTUpHnq1zlb3OSjgO
	 eOB/Gjq0hR5fXFH5NhwePWtkLVV8EozxfM7EIN6KEQMpCo8dpWFfBM2Fm1nkIcni1wL8r
	 0UXWJSZpWBpdsBXulYlnSD5ffG+ch+vPO4GUj7zRafp6Pv0hzOxumI2sPaVQRdWNq4lFb
	 jDoHUsHr0B8SoxtIts+dUMJt6ojRmSxQZEDxeW22Q/m8Eri3ptt9Zs/kKMuvD4E96/ciH
	 yRXn1oeewSpvpSVIDTRAOVbVZr3f3ajlbs1AV0zUqmXDIaEMlS/gc88+gTfxCkhDZvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="F1Y/fU46";
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66D6606A31A
	for <devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 21:09:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B66D6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=F1Y/fU46
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1014A4E4136F
	for <devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 21:09:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BFD0460769;
	Wed, 28 Oct 2026 21:09:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AD5F7103290E9;
	Wed, 28 Oct 2026 22:08:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793221738; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pfiMfINIAHeKnVXXEJkQeRBshDC3bQOy99xgz49EiFw=;
	b=F1Y/fU468TtY/wgsGxzBe/FgHO5MJqkW+6tSSo97fB4/eY6cuJnkKstNWBy+bRq6yS4S/O
	9XVQqX5wogzbq9pzrRKcl/V60Ff2u59O9WG6GBP3cRuxuWXcPLFc2dGIZ233HYYlJcgLlN
	0vWqP4p2LqJi+60hG1hPz1SCTF3x6ff/wweieMM8anQ5QgCpRVuxtfVrE22TTUxGGZoAiv
	yKzgBfiUAq4glVVMEP4ZXKq3G0H5IdDGIr+3KSfmtNiAuJ2diZGOBaeD3tvPZknJn6XLf2
	y+MABnc6kkvQmSpFTRvjl9IcpnsyWkJ5jDLYnEzd7LhPQwBa3Dp19485kZSElg==
Date: Wed, 28 Oct 2026 22:08:54 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>, David Gibson
 <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v2 3/4] fdtput: Suggest -p when a node is missing
Message-ID: <20261028220854.5f7edb4e@bootlin.com>
In-Reply-To: <20261028073440.3327687-4-sjg@chromium.org>
References: <20261028073440.3327687-1-sjg@chromium.org>
	<20261028073440.3327687-4-sjg@chromium.org>
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

Hi Simon,

On Wed, 28 Oct 2026 01:34:19 -0600
Simon Glass <sjg@chromium.org> wrote:

> When the node being written to does not exist, fdtput just prints
> FDT_ERR_NOTFOUND - nothing points to -p, which creates missing nodes, so
> it is easy to conclude that fdtput cannot add nodes at all.
> 
> When creating a node with -c, the error also names the full path, even
> though it is the parent which is missing.
> 
> Add a hint to use -p when a node is missing, both when writing a
> property and when creating a node. Report the parent path when it is
> the parent which is missing.
> 
> Add tests that writing a property or creating a node fails when a parent
> node is missing and -p is not given, and that the error suggests -p.
> Add a run_wrap_error_msg_test() helper for this, which checks the
> output as well as the return code.

Nice idea!

> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> 
> Changes in v2:
> - Check that the error suggests -p, using a new helper
> - Drop David's Reviewed-by, since the tests have changed
> 
>  fdtput.c           | 20 ++++++++++++++++++--
>  tests/run_tests.sh | 37 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 55 insertions(+), 2 deletions(-)
> 
> diff --git a/fdtput.c b/fdtput.c
> index 3c6cc98..b8d5081 100644
> --- a/fdtput.c
> +++ b/fdtput.c

...

I am ok with the implementation in fdtput.c.


> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index b3d3f3a..cf978ee 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -181,6 +181,37 @@ run_wrap_error_test () {
>      base_run_test wrap_error "$@"
>  }
>  
> +# Run a command, checking that it fails and that its output has $1 in it
> +wrap_error_msg () {
> +    (
> +	msg="$1"
> +	shift
> +	log=tmp.log.$$
> +	trap "rm -f $log" 0
> +	verbose_run_log "$log" "$@"
> +	ret="$?"
> +	FAIL_IF_SIGNAL $ret
> +	if [ "$ret" -eq 0 ]; then
> +	    FAIL "Expected non-zero return code"
> +	fi
> +	if ! grep -qF -- "$msg" "$log"; then
> +	    FAIL "Expected message '$msg'"
> +	fi
> +	PASS
> +    )
> +}
> +
> +# Check that a command fails and prints a message
> +# $1: message to look for in the output
> +# $2...: command to run
> +run_wrap_error_msg_test () {
> +    msg="$1"
> +    shift
> +    shorten_echo "$@"
> +    printf " {!= 0, \"%s\"}:	" "$msg"
> +    base_run_test wrap_error_msg "$msg" "$@"
> +}
> +

Right, you introduce this wrapper and I think they can be useful for other
cases.

You also sent the series "dtc: Fix deletes within a section and before a
redefinition" [1].

The patch "tests: Allow dtc-fatal.sh to check the error message" [2]
available in the series plays also with error messages, adding a "-m" option
to tests/dtc-fatal.sh.

At some point, could all tests use the same uniform method (probably the
wrappers added here)?

Could dtc-fatal.sh script be replaced by an existing wrapper?

Again, I think wrappers you added here are nice. I would like to have your
opinion related to dtc-fatal.sh and a way to avoid the '-m' option in order
to have uniform features.

[1]: https://lore.kernel.org/devicetree-compiler/20261028093620.3705074-1-sjg@chromium.org/
[2]: https://lore.kernel.org/devicetree-compiler/20261028093620.3705074-5-sjg@chromium.org/

>  # $1: dtb file
>  # $2: align base
>  check_align () {
> @@ -962,6 +993,12 @@ fdtput_tests () {
>      run_wrap_error_test $DTPUT $dtb -c /chosen
>      run_wrap_error_test $DTPUT $dtb -c /chosen/son
>  
> +    # Writing below a missing node fails without -p, suggesting -p
> +    run_wrap_error_msg_test "Use -p to create missing nodes" \
> +	$DTPUT $dtb -c /blackadder/the-second
> +    run_wrap_error_msg_test "Use -p to create missing nodes" \
> +	$DTPUT $dtb /blackadder/the-second cost -ts high
> +
>      # Automatic node creation
>      run_wrap_test $DTPUT $dtb -cp /blackadder/the-second/turnip \
>  	/blackadder/the-second/potato

Best regards,
Hervé
