Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180200;
	b=L3NvNzl/fwFAewBB+LFhgwNP1rslDG451lzWrrfL1gGVisRxrrNnBVxtOTq1rkpgLeVC
	 r4an1NE3wMvvunZBkusMrjXazNWpeRW9l1rYYluQqRcGtzW4BqGNjIABbBDkML9JmkEWe
	 BE1Ko802eskiW7SO2tglO29gkZUi/93aAoIMtMaIGqn5ONOG7fKOY0zVZBDtusY/HGlYt
	 RbGNACyQzf2ie58t0YhLGfw7z/iyeAHg/GSRwGDNY0u3OlyceAWD1zIA5zGxUxhfW5KdR
	 Jq7F1l0ipYFeGigtZ93GmM2JqCBPLmhQhPh7IOtRna0VPA5WFXNprqvooqc2s/6As/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180200;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=l6QNg7YdCVtKD5wg2QAlwVXOoyLghKrvpfXPR9jLb/k=;
	b=oTbeVBJCJunsBzHbvXL8HpVcWq0jmfA8Rnu739nvIE7NWw8nDckpENbT60R6wKc/OZjv
	 NeHHBdnwG1Ept79HpFokj/XN6bJKgILU0p3RIN3+tKtIjPEvSXrMHnIOdouyKlsAYGaOE
	 KKVVqnSQuISFE2SPB6VtXwXwmEilxzbndWdp2oPbJjLohqCX5ZsCuf0jnAR9E9Qv5lmXg
	 BVhrjwAE6Mc2QW/g6/J7w1Yj7tXrGWyr6BAWKf0YP+56r6oXZFZ+dqZ0aPH+TakWMUdrw
	 /RRRxcQb5aPVlAcVlSY+3AVQF4SXz5wBbBVZhUSrZT5arux7gpsHX/chXU2XpywmIWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=gVZiJ9D+;
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CF5606A31D
	for <devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 09:36:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07CF5606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=gVZiJ9D+
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-83bbcfba0ffso561573a34.0
        for <devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 02:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793180199; x=1793784999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l6QNg7YdCVtKD5wg2QAlwVXOoyLghKrvpfXPR9jLb/k=;
        b=gVZiJ9D+n4U+z+xvcVulBz2io3fzp42GMxym/nJJgWnmpE5Bu7G/0p5xIxtp6afvoH
         EvozNEBOQxoHd5LeLj1RjSSDia5dSIhkzET2Da1cQOUto/50B9zXVuLSPtkenEEu+lsX
         nV6LQybJelPEPOMOhNn09o/bGSZG2wfc365EY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180199; x=1793784999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l6QNg7YdCVtKD5wg2QAlwVXOoyLghKrvpfXPR9jLb/k=;
        b=jZAhbvls2LkLbWxJyOsIHZeuSt6poDP5fXQXs1QI2Ln81U+6wJL4EqzaNYOVgAfoHX
         R/ObbTZqwCVYjfc3M7b3MxBj16lDXSteSL2rKnayPuJhe5EAlxRB2m00jt1wmMJc1Drc
         YXP3kXrbNkSY2ww88z8lgQmvs5jP2MpSwTmbxII0mGQjNdg/Sqgfa97CPM3mQNji9rMT
         paJQQY+Dsmk0i0sYJ64hAeqVkbbrwP7TDiqWHeDOSdGLDKDCcFyzkDrY7LZ1HBrI/O/D
         8dLXlaBBZCuddIxFPEL6OilJAWlvUMQx5MRDKN3XCZHlikomSjL+n8RinNtJcM+GsYxI
         dIRg==
X-Gm-Message-State: AFq9FYI8r2VHz48Wn9270qeeu5xV7QGHGBiYKGCPXixDh9eTR+4jGsbU
	3UX9zxNOVksXnLB7t8nXeTi5E+jBT1tvIin/14b3LbBU/uIn7pw+2hLJX5yJ9vtuUHRGm08WJ/i
	OkDiCHw==
X-Gm-Gg: AYBFou2BWhX+SvI46dONouRWutFhIWDxT7LPCZ5u9e+EoGhEamog2DYkIYZ8Z6r/8zE
	Nh9ii77zkOw8/oBj+8uRW3yR/rNt2qmZPjmftv60/bsM5wqaTqIK8CV9bbUtZ9HygHg/MaUL9QY
	ghXRaT59a5mEbDhAVnP2tlQaLgzNtWCKEjxe/DqRiccse6tuyA/5s27+owP1oc98rx4cwyITFYs
	+m5xKD2tsKDpUZQ7Vn9IKk1TV28J357uhwz4h0+g+XDdNRULzQdNf1Ytus+lj/CGQJxT9i1iwmt
	CvLVAt8ZJ/hUa/jTlzQJJmLz506cPR4eYPUsXk0ODXbsd2MijXczroiD7PAckdHcDTZjlJPlrMq
	tyv93JW/NERy4mmzzahvmGuVDVYo163e8+qccUFLOAAm9mgPdL4aGGBGguYToXQUFJtzkl95WFr
	KlmTbqC/Irh3dLb6v7CI4GFmfMJjmRpkzHKkrmshdSlru/H8erfxv7O0sagNcFWQ6D83o/PleN8
	hU9z9xn3I2aTOy0XRj3IKTqb+lL2ATXG/k93Q5mQbZCI91F3HWP8GsGgjMU13EIrjiyOGhL82I5
	sLUmNAuFPKDqePMahjyEL2e/iWxEb17ADPEWkSHS95MbK730sgzMWAAlljMaZIxCLT7ILVJvhYA
	KkemhuOc=
X-Received: by 2002:a05:6830:410b:b0:812:3ec6:58a2 with SMTP id 46e09a7af769-85abd516b69mr1642440a34.12.1793180198774;
        Wed, 28 Oct 2026 02:36:38 -0700 (PDT)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85b205fe36bsm1099953a34.24.2026.10.28.02.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 02:36:37 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v2 4/6] tests: Allow dtc-fatal.sh to check the error message
Date: Wed, 28 Oct 2026 03:36:11 -0600
Message-ID: <20261028093620.3705074-5-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028093620.3705074-1-sjg@chromium.org>
References: <20261028093620.3705074-1-sjg@chromium.org>
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
message. Use it for the nonexist-node-ref2 test.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v2:
- Add new patch to check the error message in dtc-fatal.sh

 tests/dtc-fatal.sh | 18 +++++++++++++++++-
 tests/run_tests.sh |  3 ++-
 2 files changed, 19 insertions(+), 2 deletions(-)

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
index 8813846..1018a6b 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -760,7 +760,8 @@ dtc_tests () {
     check_tests "$SRCDIR/minusone-phandle.dts" explicit_phandles
     run_sh_test "$SRCDIR/dtc-checkfails.sh" phandle_references -- -I dts -O dtb "$SRCDIR/nonexist-node-ref.dts"
     run_sh_test "$SRCDIR/dtc-checkfails.sh" phandle_references -- -I dts -O dtb "$SRCDIR/nonexist-label-ref.dts"
-    run_sh_test "$SRCDIR/dtc-fatal.sh" -I dts -O dtb "$SRCDIR/nonexist-node-ref2.dts"
+    run_sh_test "$SRCDIR/dtc-fatal.sh" -m "Label or path nosuchnode not found" \
+	-I dts -O dtb "$SRCDIR/nonexist-node-ref2.dts"
     check_tests "$SRCDIR/bad-name-property.dts" name_properties
 
     check_tests "$SRCDIR/bad-ncells.dts" address_cells_is_cell size_cells_is_cell interrupts_extended_is_cell
-- 
2.43.0

