Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC031C5D67
	for <devicetree-compiler@vger.kernel.org>; Sat,  1 Mar 2025 13:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740835572; cv=none; b=UY122+KmTi1SH4NELr93MQK6bTsM0AYYRxSq5AUvjFW/0ipfzn5ghzjeY+y6w8rJ2qbMOBAr6lvM/JhDrSuEqmu6e5Igoe5I3huiwm/R7oYLueK6EvL6JlAGrdoKruTmpFy4IzXhpFnrd39Ut4mSGRAWg+QoQelfwSSnBdrTDO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740835572; c=relaxed/simple;
	bh=Da/9BDo9YQzHLi+lD1S5LPDcZnKn3Ly9QMfXumdYj2Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ihpplb7FN+pQ1LJcJpf/ZV/yaztJYZr+4Ydl8ubDAzW25gqjdM5qLx2N+8Zr0P2yabnUOHwRfzCHD3gXcldWZdwnG9xvVyrK35xhoY111Vr2HBslE4yosZZb6aIxhLOXoCfny+fYAttjq8jrvNdD/aedn8bijwXQjWzDrkX8pb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=FPw1FQgI; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="FPw1FQgI"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22334203781so64344945ad.0
        for <devicetree-compiler@vger.kernel.org>; Sat, 01 Mar 2025 05:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1740835571; x=1741440371; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fhm3hOkXkIYxRAQ5ZrzSWPx9CeJD8k1z1+luaMEl770=;
        b=FPw1FQgIJZpi54+l65ZJ8pEiYPE5nOC3YbAE8ZFB/Z1UK4iq7vbtnJN8XmHuIK6i7u
         VkAnr4s6664xVvP9q1Nun15rYrWEPhBDgMqNhNYkYxwvBCi4vLYQ5ko7GlpyBVkhhfkF
         BFtY0v6Z5Gek1YR/FsEQbyNqFEe/HNNstXwkpT+RU6X/GLR6ZkFqadyJFfULRn78gEd3
         DChW9655YrrONl2SFTZZkITlOY+HPrceKdYbJhdWC8ZbgiKMBKiNzjb7zO/IWzTzr/l5
         mo2maL0PQYCTCiqGZeJIgJoma3hdNdBKACTIRSop4couUCihpJx/3Zvbj4tUnwA5OS23
         TE+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740835571; x=1741440371;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fhm3hOkXkIYxRAQ5ZrzSWPx9CeJD8k1z1+luaMEl770=;
        b=FkRCg7w/8OVROQi22jZYuJSJF//+7JFb/chWPMs/1gLoOeghdq6OY1DnpV/bf3nmKA
         PG0GE1VVf2SY2XlaSUppHWDE/oPK5tlZgMGj5HmB+N+dYcXjIXC+xjhqx9beh7hlpluU
         y82xG78pyGyuI9uxBEE/J0RKqoqPVnvNUwnheP6lV99oh2SL9c+GtuGg6+3r0t9QlYso
         fF4/hB49iRJTG/ENU4Fv7nZ7ps+HXq1fRr+Q5SGqqv1YP2Ibg23NnMHf1AgW4k/q0HGs
         y1qx6vqYHmm0kd+PnarGOros54nB/pE4YlnYU7LBc/jph4i8G5vN52fZWlSN59MlBCrl
         upng==
X-Gm-Message-State: AOJu0YxfwMBVQyQce57EdBPb2UoZ6xOrVPl/uN5C3RAymiDjmZWjOe/6
	fBnlpcK2eVpITkbe0jbZk6SDZhUMo4FSAQJe631tjEUodTlxMh7shxvYnLUsSA==
X-Gm-Gg: ASbGncsJge5vbRd7L1+/nPmleHHNamZeYekS5oEPNf7ReGJwZUCFf4JrTquS5VmWrBW
	hT2gwC2CZAmaGXAMrlKiAELMtQM7qnG35EM11jej+tWgY0DM5+UeYC/Dog1Q22xfzhm50Vkz0Rw
	KfxuxpBz7zjzLuFnNxq+Ee7p5XSRnYlYvSb5KhuupVZ4VeckhJhoMMoO9KY+DuNIloeiCczMoo2
	yj1bntMdJ2Zf3NBLz2La8vY5qtzT28r6zypOnpretXJzZE3LnjYA7LaQNG7hDgNSk/tATTDUwZW
	XNkcYFOKJyGapGAtEtxDgeG7B6qxTuX9T0VNpg3wdBPdAEa7SF0T
X-Google-Smtp-Source: AGHT+IFOdTZiRbND/U8Yn4Th/0csPTwjZNidNOCyRDnAzhAfNzNPIu5uXLdWHZnGioCW04BdMAcS3g==
X-Received: by 2002:a05:6a20:748c:b0:1e1:a449:ff71 with SMTP id adf61e73a8af0-1f2f3cdcfbfmr13456741637.1.1740835570740;
        Sat, 01 Mar 2025 05:26:10 -0800 (PST)
Received: from [172.16.119.211] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7363cd5c39bsm764618b3a.174.2025.03.01.05.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 05:26:10 -0800 (PST)
From: Ayush Singh <ayush@beagleboard.org>
Date: Sat, 01 Mar 2025 18:55:04 +0530
Subject: [PATCH 3/3] tests: Add test for /./
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250301-previous-value-v1-3-71d612eb0ea9@beagleboard.org>
References: <20250301-previous-value-v1-0-71d612eb0ea9@beagleboard.org>
In-Reply-To: <20250301-previous-value-v1-0-71d612eb0ea9@beagleboard.org>
To: David Gibson <david@gibson.dropbear.id.au>, 
 Andreas Gnau <andreas.gnau@iopsys.eu>, d-gole@ti.com, 
 lorforlinux@beagleboard.org, jkridner@beagleboard.org, 
 robertcnelson@beagleboard.org, Andrew Davis <afd@ti.com>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Simon Glass <sjg@chromium.org>
Cc: devicetree-compiler@vger.kernel.org, 
 Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1927; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=Da/9BDo9YQzHLi+lD1S5LPDcZnKn3Ly9QMfXumdYj2Y=;
 b=owEBbQKS/ZANAwAIAQXO9ceJ5Vp0AcsmYgBnwwrea5St5yJZn+v77A8dbZHT04OY4NYyCj8i3
 yZsg6MBPiuJAjMEAAEIAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCZ8MK3gAKCRAFzvXHieVa
 dIUbD/9P1e2oFCrryk7tFDlxz7nAksKxHLVeOLMLJRUjMRxN+bjvz2FQcvjTP7pq8TqenD0sOcS
 OxzlrvNw11cekO4cfh1N31o/PEmmRfmMJCoHTrsyfmcF1dhTh8eA8zqXNJy6llC7srgRY5x9JUy
 FXX0rFSgYl7IE/AfOyduGgyCFgtzT64LC3RkoYvua7z6iHBe3Req99WGwmmOB75/ngWUzaBtnoW
 7q1zRUqem68nPRrv51n8RXxS1YROHtASxUrZd9RkEwmWjuiGWLwQIKAZXEU6yCmbfvtOeXYnfCf
 wgx7Gcldf1RgcI9fFK8tzuroTS4zbK32y/TA4/prhlpo3wTdNFS/c4x+WnxXN6W59hXFXZCS+96
 oFi8IQN/3l29xMHe2uyFV4fS/vrF6kQUEOOsAwuQuBhKl4PLobACfqTPJnKQ8bfApGeg+IQzGZb
 96v3mSFdaN7uKb4MsZ91OTh1UP2lYv/DnmJtMPqYquMcfBTZ0LrW0PPtYzFpAxswQ4T9DNp/VDM
 SoCViC/3yKzXb3S1ogqK6nN7Q3LgCci07H4Ac+ugXsXqYBSiiUnZFu2deSZFpqrPudeXjDBTGQK
 J6qGVaA1tHBHW1O6w/oihFdp76cwlkDfmiYCq+NP5jW2m11x+aIN9nm8tjE2URFTaq45HJzuYTf
 ZgAPYp/EeOvfpTg==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

- Test /./ on a string and int array.
- Also test on subnode property.

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
 tests/prev_prop.dts | 21 +++++++++++++++++++++
 tests/run_tests.sh  |  7 +++++++
 2 files changed, 28 insertions(+)

diff --git a/tests/prev_prop.dts b/tests/prev_prop.dts
new file mode 100644
index 0000000000000000000000000000000000000000..41a0e19015b006d78a3ec35a26db63982ec4c90a
--- /dev/null
+++ b/tests/prev_prop.dts
@@ -0,0 +1,21 @@
+/dts-v1/;
+
+/ {
+        str-prop = "1", "2";
+        int-prop = <1 2>;
+
+        subnode {
+                str-prop = "1", "2";
+                int-prop = <1 2>;
+        };
+};
+
+/ {
+        str-prop = /./, "3", "4", /./, "6";
+        int-prop = /./, <3 4>, /./, <6>;
+
+        subnode {
+                str-prop = /./, "3", "4", /./;
+                int-prop = /./, <3 4>, /./;
+        };
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index f0b51c04bf0af69f1df483b185f3aefa5d0bae27..30aa99f55570ac10b85c94353711361c19a5b479 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -708,6 +708,13 @@ dtc_tests () {
     run_dtc_test -I dts -O dtb -o dtc_tree1_delete.test.dtb "$SRCDIR/test_tree1_delete.dts"
     tree1_tests dtc_tree1_delete.test.dtb
 
+    # Check previous property functionality
+    run_dtc_test -I dts -O dtb -o prev_prop.test.dtb "$SRCDIR/prev_prop.dts"
+    run_fdtget_test "1 2 3 4 1 2 6" prev_prop.test.dtb "/" "str-prop"
+    run_fdtget_test "1 2 3 4 1 2 6" prev_prop.test.dtb "/" "int-prop"
+    run_fdtget_test "1 2 3 4 1 2" prev_prop.test.dtb "/subnode" "str-prop"
+    run_fdtget_test "1 2 3 4 1 2" prev_prop.test.dtb "/subnode" "int-prop"
+
     # Check omit-if-no-ref functionality
     run_dtc_test -I dts -O dtb -o omit-no-ref.test.dtb "$SRCDIR/omit-no-ref.dts"
     run_test check_path omit-no-ref.test.dtb not-exists "/node1"

-- 
2.48.1

