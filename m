Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793266298;
	b=bGezfQP869WjQi+PbkaSG9uWj5k6jsYHKlrvX9vcv/7qHn5zawOzrXv2oZV4irvwZOcL
	 utL7meEt8lxFHsde/TmPbxRqkT9ARGrMl/wJNWgDAlITUm6b1vtSUveBWoMyzBpNGhoTL
	 0X/rkDpYyAlJvO4rbohPihcCo0pAA4GucvZojPxIYJOg/UUtT1bc12Bagh8aXyFpOTxsL
	 PMHX2fvqVKKELeEqVZiJAAxcHY+MvpgdrXfSGIgXuWvjnGKNnV3GJ5DjRgj0fT200CuWG
	 j0MUp6VWJE1zLLh75fS/sQvaD+UmZI+SNMwirtFDtGw5wtiZEQuQR7yqy83++vhuhwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793266298;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=42rafPb3cb+sLDh15HfoxEpIAiAAzZ1vCLU11KmFcFk=;
	b=Op0BVjNd9koJW0Dpne3rLERoMC5xnlP0Jg0tP7qOCnQ7dnT4uFjs+HqpvxXY1xr6qrvk
	 I4YL6LMfl8+i97djYkJm3t3qts41ZQOe4VbTcNaVUyQHn/NINyTEXWyLE3KEPXhpRSYII
	 3AX5t3dmiNBc1SXYXE2b439h8xuWuXX6S6XQSnX4KiLc8T8Gzbse5TXjvG4V5tWGoBCCN
	 PMrEpUPxwoQ9eRtFlrEyDaeWutH2opKLQpP33O7VoRSZoEvKRIpWj1h9QPbM2kq19JitC
	 FIFdwiPq7VShGdHarlLuBcbtZDrPnG/ZNriXHGiHs+oohzEt7WoHOGTQ3wGPHUQMf4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=NktjaVR6;
	arc=none smtp.remote-ip=209.85.167.181
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38540606A31A
	for <devicetree-compiler@vger.kernel.org>; Thu, 29 Oct 2026 09:31:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38540606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=NktjaVR6
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-4f66bb2ab57so753370b6e.3
        for <devicetree-compiler@vger.kernel.org>; Thu, 29 Oct 2026 02:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793266297; x=1793871097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=42rafPb3cb+sLDh15HfoxEpIAiAAzZ1vCLU11KmFcFk=;
        b=NktjaVR6jwBv3moFz5AGITaVXYMynwpJRHSC5qqRFugSvE6PTHuRTx9jTgkjMYfbfa
         aNmcfZqIYnlPAux+fKF09+P5MDm8+nQ2EpJgqrJHiyR0k5DCe2B5tPgnS3S6HXHMEJrf
         7F81B6hTFipsi+DlGJLpj1Ig0XycBLh3GX1lg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793266297; x=1793871097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=42rafPb3cb+sLDh15HfoxEpIAiAAzZ1vCLU11KmFcFk=;
        b=HDMT0m2QWIgzX+nLaaWr9WptwieGyCJVzdhRqvzfXlo74/ve8KPjo3Kkv2bYFcvXdZ
         domqjaJz5NT+uMUnBnRh6+gn3H13e5jK2Xx2ICokI35jmOBUxk7opHgHR0grcnp6h7Hu
         rdoKXvogxJPsk5gX6mOYdGLpTsAHQT2igUqblMrsqcWYQJDTdOjs+i6ix0v6ybID4tPk
         JfF54ug2r8zRhIb7uhnSMh4LjKpl9LO1s/guaEBAOb6kTk4XSq7/2mx/jNTO12OKzlLR
         cFclTMqtf2Vdzd5NukDcMAkOVYqyRXtiYe+VwC4wdvXiwPmvBAp5b2Wgg84oXw5WfKOm
         mJAQ==
X-Gm-Message-State: AFq9FYI5yzdDfAPHVwZdSUOMOdoiPzrBDh2ekYQrS3cwMIsXm9Iz5M5v
	AswLa3qJ4KtLanM2gmPCJ4OhL6WMBxKnGvPTIwzMqWq5Wsxv7d6j0bcan2ivQFy1Ii2vffZmKVP
	OVdl5Bg==
X-Gm-Gg: AYBFou3IGCcgi+EkKgBd3VWoNEvjsz1ECD6dvNdAf+xCP/rHtFLhhVhd08bjfvGGfbr
	RUYzzYUHdXB+wikRib2WO27DhfAkhm/id6U0KrgcHAxRKW02EuOYFuAllzRc6ZJ0sCNJuRli2S0
	t83TV7Md5mdHMGN4fk6EFlGzMn1dNj+JLEtQ5KF8mdvQE0VfD7rzMJQi+0C8q15buP9M2EBFaBA
	9JTLDWCrXxE15qgHsSteBq6ywRSNAYsS8a5ed4fmEW7BTASCrXTjtwxIre+IzAFmjZpwDItq9/T
	uCM3SqeLD8tum5ZPUFTVFbCXh32LOKtdvAgVdA07qgvgRyAMzF7VqxMZ8Lwuo1UKGk7U3unWUbO
	KO2yibWKx5UPNHpFiaPGmPbr52P1NMBiEl16+PdQyoUBuzw63jAr7u8Xn27lZEEdhL3aNS3sV+g
	EmAIeOHR1jbv7pQ3FNQgI/hI1dJa7mJRIsrTNl8yZqlIGLjZv7b2Y/dP/oZjldY/bvygpC84wfQ
	NSerXcf8lSJ0m0b7PAb0n+p/MYULv/uUvE9O2ZTpsXnM6HRDPHpNmngevirn6scyyz6zywMZZGm
	tcRmTCl5U32V3BslaYThcunYSwfb0xFoR+nEEhYy8yL6Bm9Jeon0USyupZIo66kfuyYO4wSWf20
	XxIICqpNiHjkEqFjTXPW4XA==
X-Received: by 2002:a05:6808:50a3:b0:549:e9e3:9490 with SMTP id 5614622812f47-56382d8df7fmr2989071b6e.23.1793266297104;
        Thu, 29 Oct 2026 02:31:37 -0700 (PDT)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-563c5a50281sm3715213b6e.7.2026.10.29.02.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:31:35 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Herve Codina <herve.codina@bootlin.com>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v3 1/4] tests: Check the message when dtc fails
Date: Thu, 29 Oct 2026 03:30:54 -0600
Message-ID: <20261029093115.3647778-2-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029093115.3647778-1-sjg@chromium.org>
References: <20261029093115.3647778-1-sjg@chromium.org>
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

Use run_wrap_error_msg_test() instead, which also checks that dtc's
output contains the expected message.

dtc-fatal.sh also catches a valgrind error, since valgrind exits with
a status other than 1. Make wrap_error_msg() report a valgrind error as
wrap_test() does, so this is not lost.

Suggested-by: Herve Codina <herve.codina@bootlin.com>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v3:
- Use run_wrap_error_msg_test() instead of adding -m to dtc-fatal.sh
- Check the message in all five tests

Changes in v2:
- Add new patch to check the error message in dtc-fatal.sh

 tests/run_tests.sh | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 5bc7817..d3134f2 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -193,6 +193,9 @@ wrap_error_msg () {
 	FAIL_IF_SIGNAL $ret
 	if [ "$ret" -eq 0 ]; then
 	    FAIL "Expected non-zero return code"
+	elif [ "$ret" -eq $VGCODE ]; then
+	    echo "VALGRIND ERROR"
+	    exit $VGCODE
 	fi
 	if ! grep -qF -- "$msg" "$log"; then
 	    FAIL "Expected message '$msg'"
@@ -319,7 +322,8 @@ libfdt_overlay_tests () {
 	run_dtc_test -I dts -O dtb -o $tree.test.dtb "$SRCDIR/$tree.dts"
 	run_test overlay_bad_fixup overlay_base_manual_symbols.test.dtb $tree.test.dtb
     done
-    run_sh_test "$SRCDIR/dtc-fatal.sh" -I dts -O dtb -o /dev/null "$SRCDIR/fixup-ref-to-path.dts"
+    run_wrap_error_msg_test "Can't generate fixup for reference to path" \
+	$VALGRIND $DTC -I dts -O dtb -o /dev/null "$SRCDIR/fixup-ref-to-path.dts"
 }
 
 # Tests to exercise dtc's overlay generation support
@@ -764,7 +768,8 @@ dtc_tests () {
     check_tests "$SRCDIR/minusone-phandle.dts" explicit_phandles
     run_sh_test "$SRCDIR/dtc-checkfails.sh" phandle_references -- -I dts -O dtb "$SRCDIR/nonexist-node-ref.dts"
     run_sh_test "$SRCDIR/dtc-checkfails.sh" phandle_references -- -I dts -O dtb "$SRCDIR/nonexist-label-ref.dts"
-    run_sh_test "$SRCDIR/dtc-fatal.sh" -I dts -O dtb "$SRCDIR/nonexist-node-ref2.dts"
+    run_wrap_error_msg_test "Label or path nosuchnode not found" \
+	$VALGRIND $DTC -I dts -O dtb -o /dev/null "$SRCDIR/nonexist-node-ref2.dts"
     check_tests "$SRCDIR/bad-name-property.dts" name_properties
 
     check_tests "$SRCDIR/bad-ncells.dts" address_cells_is_cell size_cells_is_cell interrupts_extended_is_cell
@@ -847,9 +852,12 @@ dtc_tests () {
     run_test integer-expressions integer-expressions.test.dtb
 
     # Check for graceful failure in some error conditions
-    run_sh_test "$SRCDIR/dtc-fatal.sh" -I dts -O dtb nosuchfile.dts
-    run_sh_test "$SRCDIR/dtc-fatal.sh" -I dtb -O dtb nosuchfile.dtb
-    run_sh_test "$SRCDIR/dtc-fatal.sh" -I fs -O dtb nosuchfile
+    run_wrap_error_msg_test "Couldn't open \"nosuchfile.dts\"" \
+	$VALGRIND $DTC -I dts -O dtb -o /dev/null nosuchfile.dts
+    run_wrap_error_msg_test "Couldn't open \"nosuchfile.dtb\"" \
+	$VALGRIND $DTC -I dtb -O dtb -o /dev/null nosuchfile.dtb
+    run_wrap_error_msg_test "Couldn't opendir() \"nosuchfile\"" \
+	$VALGRIND $DTC -I fs -O dtb -o /dev/null nosuchfile
 
     # Dependencies
     run_dtc_test -I dts -O dtb -o dependencies.test.dtb -d dependencies.test.d "$SRCDIR/dependencies.dts"
-- 
2.43.0

