Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793210550;
	b=jp+yJaabqTzJpYY79x1Hwi6Ww16A0hcP0oSk5i6GT2eUyUB3sNrb9Lw9ijUt2fJ/e+h6
	 7tHsdR7/J4eUSSeWXUAT3pOEKEH9zhdlJE8vbuRIVpxRiXBDYr3iTmYugrySAlNsGU6vm
	 ZacSQ/FEXpBOWQXUw93fkW/ZgdErPy806Ucgr0WgurbB/Om7eMHyAq+lpmhV5d4F9ydcp
	 LjxcL7VEEjTVS/cleJtUrijhOk8VSR6C/GUyskMYUka0y9ZJX2aO/lDmKR2GsEAjMJwd2
	 qM8uhZPXGBBaNzkpRWLPEg7xv3nV0DfXRTJqTogO5JoOF3E8HGWPQNR9Gh5X1LbdlGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793210550;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=TaxobDx0bSU8Q1F9yVCAtU7lS3TvYgLsBkgZrlCOYow=;
	b=ZfxbFOeGFDAfHpk2mOo8uRn5BIFHtJf3SL/wtgDRFds6egyMbrqa6GogZ4LUSOG2nZYo
	 P5lUAetFmWhEQz7my8r479jnzWIthOBcQYYGPaObyyuXRxfK4VtQU/8KVwdqXYBG27fQo
	 WLDeQnDaJGKkYsZyuIJ4M8HBWpYGAWvjgU87pK+CC8czSWzLOPxqoR+LgF46OBRHoxcn3
	 Rcgb6WLpAixDGNE8PhNZZ2ym78nl7JSqzDrP5BkznfNujhczQOO7tCRDYKusBA6xMaBUs
	 hcO8Hg0NUMbjl2TvnbTv88s+w4LevEOt1DmYBhrgx/Kq6xBKHS7FeTh2ZBbpp3El+MA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=LcA42K3A;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739C1606A321
	for <devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 18:02:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 739C1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=LcA42K3A
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id AB4BCC4FED5
	for <devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 18:03:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A7F4B60769;
	Wed, 28 Oct 2026 18:02:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9E237103290E8;
	Wed, 28 Oct 2026 19:02:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793210541; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TaxobDx0bSU8Q1F9yVCAtU7lS3TvYgLsBkgZrlCOYow=;
	b=LcA42K3A+5+d2nLHobTEcdGIi9oZfu0rMVoEzBvPQH5GFRCqY7Q0sfK/EErI0Ub6A09CYf
	BdlhyNyieZRdVcrh0eYwaf0bufzAumIy850kJh/HZYjhgCMaCS6kStqopjS0MquaV+YZQq
	wpwEbHq6cosTury4xgJxcEblg8OwZtoVAD8GN4cyo1Jf57y1E1xAAsZlGqqHicuG2NNtJ3
	hU2UPrvwvmas19IST+wKIHUr1TZPaAmchN2q7xa/ZBFU4nHVR+ZtPEojmTVRekUeJQzkoX
	3stj8OsunLKaZX712cn8Mi4180W9znwPvnwCm3qq0pm0/ft1x8qwHi0iIHSs2A==
Date: Wed, 28 Oct 2026 19:02:18 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>, David Gibson
 <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v2 4/6] tests: Allow dtc-fatal.sh to check the error
 message
Message-ID: <20261028190218.490c6f19@bootlin.com>
In-Reply-To: <20261028093620.3705074-5-sjg@chromium.org>
References: <20261028093620.3705074-1-sjg@chromium.org>
	<20261028093620.3705074-5-sjg@chromium.org>
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

On Wed, 28 Oct 2026 03:36:11 -0600
Simon Glass <sjg@chromium.org> wrote:

> dtc-fatal.sh only checks that dtc exits with status 1, so a test which
> expects a particular error passes just as well if dtc fails for some
> other reason, such as a mistake in the test's dts file.
> 
> Add a -m option which also checks that dtc's output contains a given
> message. Use it for the nonexist-node-ref2 test.
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> 
> Changes in v2:
> - Add new patch to check the error message in dtc-fatal.sh
> 
>  tests/dtc-fatal.sh | 18 +++++++++++++++++-
>  tests/run_tests.sh |  3 ++-
>  2 files changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/dtc-fatal.sh b/tests/dtc-fatal.sh
> index 08a4d29..2fa96ef 100755
> --- a/tests/dtc-fatal.sh
> +++ b/tests/dtc-fatal.sh
> @@ -1,9 +1,21 @@
>  #! /bin/sh
>  
> +# Usage: dtc-fatal.sh [-m <message>] <dtc args>
> +# Check that dtc fails, and with -m that its output contains <message>
> +
>  SRCDIR=`dirname "$0"`
>  . "$SRCDIR/testutils.sh"
>  
> -verbose_run $VALGRIND "$DTC" -o/dev/null "$@"
> +if [ "$1" = "-m" ]; then
> +    msg="$2"
> +    shift 2
> +fi
> +
> +LOG=tmp.log.$$
> +rm -f $LOG
> +trap "rm -f $LOG" 0
> +
> +verbose_run_log "$LOG" $VALGRIND "$DTC" -o/dev/null "$@"
>  ret="$?"
>  
>  if [ "$ret" -gt 127 ]; then
> @@ -12,4 +24,8 @@ elif [ "$ret" != "1" ]; then
>      FAIL "dtc returned incorrect status $ret instead of 1"
>  fi
>  
> +if [ -n "$msg" ] && ! grep -qF -- "$msg" "$LOG"; then
> +    FAIL "Expected message '$msg'"
> +fi
> +
>  PASS
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index 8813846..1018a6b 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -760,7 +760,8 @@ dtc_tests () {
>      check_tests "$SRCDIR/minusone-phandle.dts" explicit_phandles
>      run_sh_test "$SRCDIR/dtc-checkfails.sh" phandle_references -- -I dts -O dtb "$SRCDIR/nonexist-node-ref.dts"
>      run_sh_test "$SRCDIR/dtc-checkfails.sh" phandle_references -- -I dts -O dtb "$SRCDIR/nonexist-label-ref.dts"
> -    run_sh_test "$SRCDIR/dtc-fatal.sh" -I dts -O dtb "$SRCDIR/nonexist-node-ref2.dts"
> +    run_sh_test "$SRCDIR/dtc-fatal.sh" -m "Label or path nosuchnode not found" \
> +	-I dts -O dtb "$SRCDIR/nonexist-node-ref2.dts"
>      check_tests "$SRCDIR/bad-name-property.dts" name_properties
>  
>      check_tests "$SRCDIR/bad-ncells.dts" address_cells_is_cell size_cells_is_cell interrupts_extended_is_cell

Nice!

Can we imagine to add the '-m' option in other dtc-fatal.sh calls.

Best regards,
Hervé
