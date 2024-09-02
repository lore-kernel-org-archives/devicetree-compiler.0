Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D75119E96A
	for <devicetree-compiler@vger.kernel.org>; Mon,  2 Sep 2024 12:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725279518; cv=none; b=qabQ2BbAx4RxtTSJmT9kilHyd/vP2b837utUn3XyK7qZsxhrYrIOu28CoIZCy1MFCgi6Ww8fR68FOU5rDaXRU3nk5R1xFGUOo06cahmUcJQig+1PXRhjOIN7uM9mhi/Iyr0+lb8RMLpSCSxrVa0qm/aWceX+34ldSV4nZjUg0ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725279518; c=relaxed/simple;
	bh=a9LC8XSPxCnmWQAnkgS9F0E/Qt2eITtiqyh0+nGEIpI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bshN+0A/coF3l2WPIdNF1EFs9Un5uVgMWR1sE+wTXLg2JxRslI7t2nxv5LcsiZX93aBMrzivGMrnywdeO/L5t/qBp3/E7uStmgEU9LAY2YtEhSeQXj7vSVftS8FYp8sJoTis3RDVckfCyvkfZUjp0k54LFGglpo/bWB9W3bgRKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=cG4UFOyM; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="cG4UFOyM"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2d885019558so1710127a91.2
        for <devicetree-compiler@vger.kernel.org>; Mon, 02 Sep 2024 05:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1725279516; x=1725884316; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5yIC4Bm/15ckqSxVfmlqWKMfe4mDEW3p8pm7mJDm2mw=;
        b=cG4UFOyMGd2eUeDi5g/wp3mGncqKRix4i42GvMSeiLm08ACyReCk4i9MTyR0NyLn2t
         L191kyyxftnff7EZfob6V4xZXRrPYTp7k4adOHy4XrDX15EtQsgNAp5jxGY2hmSLBntH
         vFha2mzUzfZHYAq1Gu4R/Ek509LG+92VLAfWF1mtmgqgXtu3dFvRqz0CqKmrR/DfpjK1
         JyxzZt4ZH5p4dGc4Usx8ea6ph4pPCEP+tiX6OCkbtzErHuJoQWtpOVkoogTX5UEqMcmT
         ojaDipblFn7Cqgx5AmXSW/4ZQtTOvmqrxOOekiK8oRpQaOhPD08TGiVrYp8X9QiXq480
         BG+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725279516; x=1725884316;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5yIC4Bm/15ckqSxVfmlqWKMfe4mDEW3p8pm7mJDm2mw=;
        b=FluQ2ngtF5/sPaugZFwFFSDLU12vCMsYUs6vuJSVd78fimrIJFrR6AxS2P9faz+bkF
         vGU58Dszg3Rfg5kROhR2kh8PAM4JYuh3tMkdXvy8ClITgxEMYkSHxlANgPjQ+x6MZrsr
         qvaYfW3muKxSs6AFn+a4vwuepgSxWgYA8gTIWg0lds0+fNHylp5ncI1D9gS4yC0RjFdC
         mR4UZ32x5u5WVHT3Uuv2ByAkPo8lez9ethbSljx7AK4Pz82jgXSkt0Zl4xs8g3CYN6h/
         GQMNuwEPev014R0+jM/oLoBHAeys0FoIy1MaKWPPGRL3gp/1bJ4/lxrIezC3YAEAHHd/
         rhJA==
X-Gm-Message-State: AOJu0YzyYWcvi7EECCx5vC9TN8MPAXaECzNJWKKxqbTyL6UOt+r/bmVf
	Yr0II3Cp+LkQK78NrIpyyD37PmmP9HWhljerBEojRViOnBFdiuUjeJtVnfB30vzdaN4j4MHuvFl
	OHg==
X-Google-Smtp-Source: AGHT+IGnsaV8hxY7r6NU8FhqXTJ+BP4qR/KQrDN89wjRpMFaftQmqkMwHPpvwb1hr82IkegaAECiJA==
X-Received: by 2002:a17:902:ea0b:b0:202:26d:146c with SMTP id d9443c01a7336-205472c560cmr36427845ad.5.1725279516477;
        Mon, 02 Sep 2024 05:18:36 -0700 (PDT)
Received: from [172.16.118.100] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2055d6fe84dsm25262125ad.11.2024.09.02.05.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 05:18:36 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
Date: Mon, 02 Sep 2024 17:47:56 +0530
Subject: [PATCH 2/2] tests: Add test for symbol resolution
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240902-symbol-phandle-v1-2-683efb2a944b@beagleboard.org>
References: <20240902-symbol-phandle-v1-0-683efb2a944b@beagleboard.org>
In-Reply-To: <20240902-symbol-phandle-v1-0-683efb2a944b@beagleboard.org>
To: d-gole@ti.com, lorforlinux@beagleboard.org, jkridner@beagleboard.org, 
 robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com, 
 Andrew Davis <afd@ti.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Robert Nelson <robertcnelson@gmail.com>
Cc: devicetree-compiler@vger.kernel.org, 
 Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4064; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=a9LC8XSPxCnmWQAnkgS9F0E/Qt2eITtiqyh0+nGEIpI=;
 b=owEBbQKS/ZANAwAIAQXO9ceJ5Vp0AcsmYgBm1a0OtQDzKflV+lei6MhVHzPQpEN211ujPfY/A
 rN6+Yg2RmCJAjMEAAEIAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCZtWtDgAKCRAFzvXHieVa
 dFH4D/9mhruTVvmXEQII2PS2WUB7nuMUlnBS+9XCrqM9jh1zVSi2GEzk4BMMma5TW5MEvv0nVxa
 /2hJm5Sgi8FZFL7DUnGfg/nEEgMJ5GpVcS5/zq7BsU+d3euJR4Bcu+2ESj76BZjctKFwfAlo7HV
 WQNFjWpXy7Vaw9Cn2XRdlSEGHu8BXxw42rX2b99GQCUAoGko4yQL5umFMP1EWO+Nd7TYRHGLEFM
 WkKOvxVZGNqjnsLOBsEjdAg1rTCQqb9QonrwY+UqJ6PcahvMDiOOJEM+AR8CB7n5GRj0FMOesSp
 XjJKCE2Y4I6uLn43K8Rw2fEAEMcnnZJJ1Vga0eknKmgVpSczFoJbPXf2OMHJHSeSG1+GMWX1RZU
 qLlFGfCubQCSe9SjhhpoKbxaIV4zeL1I3+goiRjA8cML9qczODPPd42xuw97iJpumxehHlILtNl
 uhKc/qb8zGtgmHBRX5kAB1bdU8R28IVSWwTr/e3GW92h1jzPChoUwejSr5P843hMczbvWY49vfX
 2fCwF1PDUWrDis2ZyB3a3MkpftWSXHvoKoMzCEPs8R68ygh+FLMIzKNJCpABIztfmpCWnwNwRsb
 p9jEXcWnJznG/8bu7JeC2oxx0PFw0rK1Rfjob5duTQBhEc4GyAvD9v4nbEVLhI0OdI2qkHDkzqD
 kkqb7fTnY2f5tNA==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

A simple test for both phandle symbols and string symbols. Also tests
chaining symbol overlays.

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
 tests/overlay_overlay_symbols1.dts     | 12 ++++++++++++
 tests/overlay_overlay_symbols2.dts     |  9 +++++++++
 tests/overlay_overlay_symbols_user.dts | 26 ++++++++++++++++++++++++++
 tests/run_tests.sh                     | 19 +++++++++++++++++++
 4 files changed, 66 insertions(+)

diff --git a/tests/overlay_overlay_symbols1.dts b/tests/overlay_overlay_symbols1.dts
new file mode 100644
index 0000000..bd74242
--- /dev/null
+++ b/tests/overlay_overlay_symbols1.dts
@@ -0,0 +1,12 @@
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	__symbols__ {
+    TEST_STR = "/test-node";
+    TEST_PHANDLE = <&test>;
+
+    SUBTEST_STR = "/test-node/sub-test-node";
+    SUBTEST_PHANDLE = <&subtest>;
+	};
+};
diff --git a/tests/overlay_overlay_symbols2.dts b/tests/overlay_overlay_symbols2.dts
new file mode 100644
index 0000000..b8da96b
--- /dev/null
+++ b/tests/overlay_overlay_symbols2.dts
@@ -0,0 +1,9 @@
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	__symbols__ {
+		TEST_CHAIN = <&TEST_PHANDLE>;
+		SUBTEST_CHAIN = <&SUBTEST_PHANDLE>;
+	};
+};
diff --git a/tests/overlay_overlay_symbols_user.dts b/tests/overlay_overlay_symbols_user.dts
new file mode 100644
index 0000000..4da2136
--- /dev/null
+++ b/tests/overlay_overlay_symbols_user.dts
@@ -0,0 +1,26 @@
+/dts-v1/;
+/plugin/;
+
+&TEST_STR {
+  str-prop = "test-node";
+};
+
+&TEST_PHANDLE {
+  phandle-prop = "test-node";
+};
+
+&TEST_CHAIN {
+  chain-prop = "test-node";
+};
+
+&SUBTEST_STR {
+  str-prop = "subtest-node";
+};
+
+&SUBTEST_PHANDLE {
+  phandle-prop = "subtest-node";
+};
+
+&SUBTEST_CHAIN {
+  chain-prop = "subtest-node";
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 937b128..56f8d0d 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -1018,6 +1018,25 @@ fdtoverlay_tests() {
     # test that the new property is installed
     run_fdtoverlay_test foobar "/test-node" "test-str-property" "-ts" ${basedtb} ${targetdtb} ${overlaydtb}
 
+    symbol1_overlay="$SRCDIR/overlay_overlay_symbols1.dts"
+    symbol1_overlaydtbo=overlay_overlay_symbols1.fdtoverlay.test.dtb
+    symbol2_overlay="$SRCDIR/overlay_overlay_symbols2.dts"
+    symbol2_overlaydtbo=overlay_overlay_symbols2.fdtoverlay.test.dtb
+    symbol_user_overlay="$SRCDIR/overlay_overlay_symbols_user.dts"
+    symbol_user_overlaydtbo=overlay_overlay_symbols_user.fdtoverlay.test.dtb
+
+    # test overlay symbol resolution
+    run_dtc_test -@ -I dts -O dtb -o $symbol1_overlaydtbo $symbol1_overlay
+    run_dtc_test -@ -I dts -O dtb -o $symbol2_overlaydtbo $symbol2_overlay
+    run_dtc_test -@ -I dts -O dtb -o $symbol_user_overlaydtbo $symbol_user_overlay
+
+    run_fdtoverlay_test test-node "/test-node" "str-prop" "-ts" ${basedtb} ${targetdtb} ${symbol1_overlaydtbo} ${symbol2_overlaydtbo} ${symbol_user_overlaydtbo}
+    run_fdtoverlay_test test-node "/test-node" "phandle-prop" "-ts" ${basedtb} ${targetdtb} ${symbol1_overlaydtbo} ${symbol2_overlaydtbo} ${symbol_user_overlaydtbo}
+    run_fdtoverlay_test test-node "/test-node" "chain-prop" "-ts" ${basedtb} ${targetdtb} ${symbol1_overlaydtbo} ${symbol2_overlaydtbo} ${symbol_user_overlaydtbo}
+    run_fdtoverlay_test subtest-node "/test-node/sub-test-node" "str-prop" "-ts" ${basedtb} ${targetdtb} ${symbol1_overlaydtbo} ${symbol2_overlaydtbo} ${symbol_user_overlaydtbo}
+    run_fdtoverlay_test subtest-node "/test-node/sub-test-node" "phandle-prop" "-ts" ${basedtb} ${targetdtb} ${symbol1_overlaydtbo} ${symbol2_overlaydtbo} ${symbol_user_overlaydtbo}
+    run_fdtoverlay_test subtest-node "/test-node/sub-test-node" "chain-prop" "-ts" ${basedtb} ${targetdtb} ${symbol1_overlaydtbo} ${symbol2_overlaydtbo} ${symbol_user_overlaydtbo}
+
     stacked_base="$SRCDIR/stacked_overlay_base.dts"
     stacked_basedtb=stacked_overlay_base.fdtoverlay.test.dtb
     stacked_bar="$SRCDIR/stacked_overlay_bar.dts"

-- 
2.46.0

