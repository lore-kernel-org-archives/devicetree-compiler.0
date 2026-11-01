Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793552931;
	b=ktUBLiGtfEl3SJXijzPxO7eEj4JZmU3qTxatdFQvxSfzykvVhr143u8i0QSo6TF/SXrM
	 OlKe0zE5g9VYXtJhB/q5TXWy6fUAiRCLxpxdUkn8aH6M+1Gq6oARh45WRLPGC4cqAuBfB
	 juFLxt4BBJHBDlykS9n1veOVV3NNH4GuooHAhcO/VlmuUIeOPZqkw4pZAFOmKmgrWyGFX
	 7uuGxZWaFJk/UQIvPW9mcQPrQZIKs9gdMdc5fR1UzCMWcd2UkvUphEhIkmwKWeCf/F4CI
	 T3q62r++zUOT05TTapUHyUi+lOOZXBZPSbpwceqWW2UOP+wSH7RKNx1wqJFNwcUsF+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793552931;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Q27Lqel1R5UcHl3niZyGrtgFDxbKtxcLicMJgSxYDB8=;
	b=uOs3fVda16rXxBXwWSwmnjH0zlPLQIJFNGFtmGE4UTj3eyKtvRqfj3ocsC/PeCM0TOws
	 lINVtMLzqLmHZUD9ly4EyWTT3ofuI8vRjc6PPxG+X+yc9WcprOg9WBD3xG4sCOAsdDzCk
	 XsogkqYAvw8UhQnrnsUjHNmXfcB77ru2A4ZV0aOVhJ7zseadmzxtrd5JyTnsLjh/6/B4h
	 OfWbXSvLOGsoP2QPE9t6D3td7tyQVC2KpzlwgbfMIL2gfVYTYJae6UNqVoFo2J50wYeBo
	 0wF6NxEhtM+Azpte7jiKrHFyvWrTjjn8PQ+qgcJk61fnUzLbAU+fgfdmLwTy8JXT6iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=fVplLM7l;
	arc=none smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1725A606A326
	for <devicetree-compiler@vger.kernel.org>; Sun,  1 Nov 2026 17:08:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1725A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=fVplLM7l
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6d68de53053so1063502eaf.0
        for <devicetree-compiler@vger.kernel.org>; Sun, 01 Nov 2026 09:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793552930; x=1794157730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q27Lqel1R5UcHl3niZyGrtgFDxbKtxcLicMJgSxYDB8=;
        b=fVplLM7luCu2XQDxvol/2q5elsSuebq18dk/8DbhDp1ln6zMOCI9rJ/DhEpbUVFfzL
         MjB14Tv99J5JBTqPdsKSRNLs6FlFaaPRwQt0fgCvDI10Q/OzP9Ivo6ha5T2q4Ot0dmR3
         1/5PPyVWnoHK9vayuK9tgXZQ6iLx+o4k12bXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793552930; x=1794157730;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q27Lqel1R5UcHl3niZyGrtgFDxbKtxcLicMJgSxYDB8=;
        b=q2SSIsRuazGeUcvN8nAF7s/YOcXRbdkDrCoOHtiVhWnECsonS2XfNId0ZD8hkkBix9
         TNsufYeci2LVOpb2MMdI7D2LeRZpfibCNjro3AC8fAoWNqfV1c4jKgP34qL8zsbGYunF
         1UzaNIwZSGNYSrYA3a11HIQEUPH2u1kOFuG0RhEg0MDxnnOMYp+ITn3RGeWlZzjN/h1C
         VYfUc0Amz4XgSm5f3+zzQFF+fzG47cRseKtYWBvmFOWN/sv1+gBCbNn0aq5WucgIBnpt
         9rPaBNRh3sLkrfk+e3HSvtNbf0p3ptK5KYsz7p9tLrGsQsNoCSqZ8HrhpeHEyIiFnd7e
         /qog==
X-Gm-Message-State: AFq9FYLFxbr3XGx4Nwui0KcNjmir50+4LwarenSqVkDTsQzWy6DxNlef
	JThN2h/yA/3aFsv38PcOcpUj4XMZtb5Kpi5D+vgHB2r9QT8ZyztDKVLzauDYO/+S8P8BMmImu89
	1VQZqrM0a
X-Gm-Gg: AYBFou08tTMGfyay3oO10PD0Fd3s1LGdwZwW/SW25bLA2yhUO3MVE0ucLNsscBCbFK/
	Wn3h+kAs3jyIIEfO2l0TYYK353gtup911xBeJAOmZysY13jjOKTA6E810kuAUzF0VHkNUREfdJs
	R2e4JVFKiyM9liYWbLpJXXZY4w/j/LSOm8ijMmUhtIS1HjlqhsrFye0/OBBjk6MdWlDL8LoAWIB
	ZGSOwaytSqseQIM/ZXHaqOQuEfku+dl/yzI1X5CrC8n2aPZIcezlrkWVgB7H44+OA98fmHn9Dzg
	tZT7NC31RIGQVQiyHFCjzT4zvYUc0C925lhgYqC0WV/ocO1Ri8NRWHzoEVos3LrXMCLInnTILte
	6TwoffDKH7/lHpQm5gd5mzzZ3YP6VQrPVa128mVAKBdvzbjX0UZ5rowwUynGPmZrrMmUW8jm/AY
	h6jQb1gZNNNkHFViRv5TM6PmdYCMsFU16dMXh5EI4hFMXTiAUelnTGdVEjMCQ42GYugZM+b3PkV
	+psEoeNnXjpfUTELlMyNhonov3Q3PT+dcpDQox7/WDaxFtgild5wY/7tbCTaDkGOnkZUxjlY6+2
	kvPqFxSaD2N9RoEe1Ng/y7fhbLHOfnj3FGpVIGMOq9KLtL1piTORRBSdEB6RivrpZx9SY60R5w/
	HQ88SoFXgAHGchBG16Uuijw==
X-Received: by 2002:a05:6820:3397:20b0:713:f236:a78d with SMTP id 006d021491bc7-714f29b13a3mr3062135eaf.54.1793552929900;
        Sun, 01 Nov 2026 09:08:49 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a95d970b9bsm505302fac.8.2026.11.01.09.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 09:08:48 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: Herve Codina <herve.codina@bootlin.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH] tests: Allow dtc-fatal.sh to check the error message
Date: Sun,  1 Nov 2026 10:08:33 -0700
Message-ID: <20261101170842.2802301-1-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dtc-fatal.sh only checks that dtc exits with status 1, so a test which
expects a particular error passes just as well if dtc fails for some
other reason, such as a mistake in the test's dts file.

Add a -m option which also checks that dtc's output contains a given
message, and use it in each test which runs dtc-fatal.sh. Unlike
run_wrap_error_msg_test, this runs dtc under valgrind when that is
enabled.

Suggested-by: David Gibson <david@gibson.dropbear.id.au>
Link: https://lore.kernel.org/devicetree-compiler/20261029093115.3647778-2-sjg@chromium.org/
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---
The new tests in 'dtc: Merge the fragments of a dts file after parsing'
use run_wrap_error_msg_test. Whichever series is applied second can
switch them to dtc-fatal.sh -m

 tests/dtc-fatal.sh | 18 +++++++++++++++++-
 tests/run_tests.sh | 16 +++++++++++-----
 2 files changed, 28 insertions(+), 6 deletions(-)

diff --git a/tests/dtc-fatal.sh b/tests/dtc-fatal.sh
index 08a4d29..2fa96ef 100755
--- a/tests/dtc-fatal.sh
+++ b/tests/dtc-fatal.sh
@@ -1,9 +1,21 @@
 #! /bin/sh
 
+# Usage: dtc-fatal.sh [-m <message>] <dtc args>
+# Check that dtc fails, and with -m that its output contains <message>
+
 SRCDIR=`dirname "$0"`
 . "$SRCDIR/testutils.sh"
 
-verbose_run $VALGRIND "$DTC" -o/dev/null "$@"
+if [ "$1" = "-m" ]; then
+    msg="$2"
+    shift 2
+fi
+
+LOG=tmp.log.$$
+rm -f $LOG
+trap "rm -f $LOG" 0
+
+verbose_run_log "$LOG" $VALGRIND "$DTC" -o/dev/null "$@"
 ret="$?"
 
 if [ "$ret" -gt 127 ]; then
@@ -12,4 +24,8 @@ elif [ "$ret" != "1" ]; then
     FAIL "dtc returned incorrect status $ret instead of 1"
 fi
 
+if [ -n "$msg" ] && ! grep -qF -- "$msg" "$LOG"; then
+    FAIL "Expected message '$msg'"
+fi
+
 PASS
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 5bc7817..33a714f 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -319,7 +319,9 @@ libfdt_overlay_tests () {
 	run_dtc_test -I dts -O dtb -o $tree.test.dtb "$SRCDIR/$tree.dts"
 	run_test overlay_bad_fixup overlay_base_manual_symbols.test.dtb $tree.test.dtb
     done
-    run_sh_test "$SRCDIR/dtc-fatal.sh" -I dts -O dtb -o /dev/null "$SRCDIR/fixup-ref-to-path.dts"
+    run_sh_test "$SRCDIR/dtc-fatal.sh" \
+	-m "Can't generate fixup for reference to path" \
+	-I dts -O dtb -o /dev/null "$SRCDIR/fixup-ref-to-path.dts"
 }
 
 # Tests to exercise dtc's overlay generation support
@@ -764,7 +766,8 @@ dtc_tests () {
     check_tests "$SRCDIR/minusone-phandle.dts" explicit_phandles
     run_sh_test "$SRCDIR/dtc-checkfails.sh" phandle_references -- -I dts -O dtb "$SRCDIR/nonexist-node-ref.dts"
     run_sh_test "$SRCDIR/dtc-checkfails.sh" phandle_references -- -I dts -O dtb "$SRCDIR/nonexist-label-ref.dts"
-    run_sh_test "$SRCDIR/dtc-fatal.sh" -I dts -O dtb "$SRCDIR/nonexist-node-ref2.dts"
+    run_sh_test "$SRCDIR/dtc-fatal.sh" -m "Label or path nosuchnode not found" \
+	-I dts -O dtb "$SRCDIR/nonexist-node-ref2.dts"
     check_tests "$SRCDIR/bad-name-property.dts" name_properties
 
     check_tests "$SRCDIR/bad-ncells.dts" address_cells_is_cell size_cells_is_cell interrupts_extended_is_cell
@@ -847,9 +850,12 @@ dtc_tests () {
     run_test integer-expressions integer-expressions.test.dtb
 
     # Check for graceful failure in some error conditions
-    run_sh_test "$SRCDIR/dtc-fatal.sh" -I dts -O dtb nosuchfile.dts
-    run_sh_test "$SRCDIR/dtc-fatal.sh" -I dtb -O dtb nosuchfile.dtb
-    run_sh_test "$SRCDIR/dtc-fatal.sh" -I fs -O dtb nosuchfile
+    run_sh_test "$SRCDIR/dtc-fatal.sh" -m 'open "nosuchfile.dts"' \
+	-I dts -O dtb nosuchfile.dts
+    run_sh_test "$SRCDIR/dtc-fatal.sh" -m 'open "nosuchfile.dtb"' \
+	-I dtb -O dtb nosuchfile.dtb
+    run_sh_test "$SRCDIR/dtc-fatal.sh" -m 'opendir() "nosuchfile"' \
+	-I fs -O dtb nosuchfile
 
     # Dependencies
     run_dtc_test -I dts -O dtb -o dependencies.test.dtb -d dependencies.test.d "$SRCDIR/dependencies.dts"
---
base-commit: c22868416b8db8354ce5db29d3494dda688a2ae3
branch: dtc-fatal-msg

-- 
2.43.0

