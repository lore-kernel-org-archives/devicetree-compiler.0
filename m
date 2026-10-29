Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793272321;
	b=167PkqJNfcWYepzmt6jWIn8u5XiRrmf9H4G2PDmlHGW8czuUE9lvDQ58/Vt4pzRnNTVr
	 ngAAxtQ95CbLqAC9wMyHNNfUBN8s7IpFgb7DE124PZQo2FyLtGQKuX8YJYgyUVaz69mgI
	 pWnt6V+H1a47dY5+M2sLOppDQyRzoVH/CoLTYccGUdwjJJ+hpnnQ2WjNUe/8dNGKKaodo
	 auilFAf2iyRspO6/IDpqG5i2Oz6DEw8ulH9DDRlR/APLWPna9FM1gJ2zgXF6EbWUlaz23
	 daHS3lobQveLmsh1CP6siZx4II7Xd5VhuNtCHXKrAKaWfS+U5HbR08ywHdxd8eVnfJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793272321;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=WcYb2v1Z11YBzVEfw+KI9JmiDr6yzSg7xLWChiIJwOI=;
	b=VvJlhlas5leTUSX8pKGD18I15MQxrsQlq5bcEjIS2f9iu1c02q6eOMs9sFKXm2YiO8V2
	 2ZvHFaoWw9yuH/p542FFg2C2AtReAwklA09HLFH3xzkp9LaqnSf/EZluq1ipOIDurcyqK
	 MBBhKOJFTanMRlNAZ5WyrXC2IX8NqWdi4tiK/eX0dxbowZzCEvw0nL2VCDQ0ydOfgqLpA
	 TcgB039OhYp76p4zjdLiC0G/zTydlToUTRk3qH+Bt3yTr23gl71XtrPXYexxZR8v2Nh0H
	 N4PJx1jtZsjgTRwsK7IUUDBhQD0jZCPQQ2GcPmAAXGpuKntHusM8wand2pSFz521xYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=vdin9dpb;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4AB606A31D
	for <devicetree-compiler@vger.kernel.org>; Thu, 29 Oct 2026 11:11:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D4AB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=vdin9dpb
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4B4614E4138B
	for <devicetree-compiler@vger.kernel.org>; Thu, 29 Oct 2026 11:11:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1733160360;
	Thu, 29 Oct 2026 11:11:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 112F2103290B1;
	Thu, 29 Oct 2026 12:11:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793272316; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WcYb2v1Z11YBzVEfw+KI9JmiDr6yzSg7xLWChiIJwOI=;
	b=vdin9dpb9WM7t7MzEq7X1No2x3ZnGs5ORUCGxbSxqF/8fGXhdfyKyirjEOokfJ7B1YkE2L
	sbF+Zt85Vv0Le7M1T6j/M5z87V2G14mpTZUfMA6yMLrbjYKeUQfWKBYTu2uJkARwide+gj
	Psf//yj+QEDqho6AqHb1KpNUu1zfUsp2D6iMhApciRMZ+IfHL33J3CUvb5D9TVLxJl5gr/
	v48+5KDCqBgMDbs3pZilyYKTMS9TT91AMTpuZzqUhOBtoJwyymGNJiIXZFazo/YGTFB9Ys
	toVp36Sst2ReAR71FIqvCKSmxgwCA5YC0ZE/IzxIfg0rOWawK/A8WxrlXOptgg==
Date: Thu, 29 Oct 2026 12:11:52 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>, David Gibson
 <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v3 1/4] tests: Check the message when dtc fails
Message-ID: <20261029121152.00820613@bootlin.com>
In-Reply-To: <20261029093115.3647778-2-sjg@chromium.org>
References: <20261029093115.3647778-1-sjg@chromium.org>
	<20261029093115.3647778-2-sjg@chromium.org>
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

On Thu, 29 Oct 2026 03:30:54 -0600
Simon Glass <sjg@chromium.org> wrote:

> dtc-fatal.sh only checks that dtc exits with status 1, so a test which
> expects a particular error passes just as well if dtc fails for some
> other reason, such as a mistake in the test's dts file.
> 
> Use run_wrap_error_msg_test() instead, which also checks that dtc's
> output contains the expected message.
> 
> dtc-fatal.sh also catches a valgrind error, since valgrind exits with
> a status other than 1. Make wrap_error_msg() report a valgrind error as
> wrap_test() does, so this is not lost.
> 
> Suggested-by: Herve Codina <herve.codina@bootlin.com>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> 
> Changes in v3:
> - Use run_wrap_error_msg_test() instead of adding -m to dtc-fatal.sh
> - Check the message in all five tests
> 
> Changes in v2:
> - Add new patch to check the error message in dtc-fatal.sh
> 
>  tests/run_tests.sh | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index 5bc7817..d3134f2 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -193,6 +193,9 @@ wrap_error_msg () {
>  	FAIL_IF_SIGNAL $ret
>  	if [ "$ret" -eq 0 ]; then
>  	    FAIL "Expected non-zero return code"
> +	elif [ "$ret" -eq $VGCODE ]; then
> +	    echo "VALGRIND ERROR"
> +	    exit $VGCODE
>  	fi
>  	if ! grep -qF -- "$msg" "$log"; then
>  	    FAIL "Expected message '$msg'"
> @@ -319,7 +322,8 @@ libfdt_overlay_tests () {
>  	run_dtc_test -I dts -O dtb -o $tree.test.dtb "$SRCDIR/$tree.dts"
>  	run_test overlay_bad_fixup overlay_base_manual_symbols.test.dtb $tree.test.dtb
>      done
> -    run_sh_test "$SRCDIR/dtc-fatal.sh" -I dts -O dtb -o /dev/null "$SRCDIR/fixup-ref-to-path.dts"
> +    run_wrap_error_msg_test "Can't generate fixup for reference to path" \
> +	$VALGRIND $DTC -I dts -O dtb -o /dev/null "$SRCDIR/fixup-ref-to-path.dts"

I don't think that the $VALGRIND here is a good idea. Also this is not consistent
with other dtc test calls. Those tests calls (other than using a script) use
run_dtc_test(). run_dtc_test() use $VALGRIND internally.

Could we imagine run_dtc_fatal_test() (or similar name) to call here in order
to be consistent with other calls?

This will look like the following:
--- 8< ---
	run_dtc_fatal_test "Can't generate fixup for reference to path" \
			   -I dts -O dtb -o /dev/null "$SRCDIR/fixup-ref-to-path.dts"
--- 8< ---

At some point, also dtc-checkfails.sh script could be replace by
run_dtc_checkfails_test wrapper and dtc-fails.sh by run_dtc_checkfails_test
wrapper.

Best regards,
Hervé
