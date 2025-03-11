Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500BB255E37
	for <devicetree-compiler@vger.kernel.org>; Tue, 11 Mar 2025 15:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741707368; cv=none; b=hZtBggKcKB37Ybd+3nM/sIKKKAX//sr4/8GrY2IZrP7UK6+hOeD0VcilId/q5PoHzsjdN4mMG0+Q/d24lCPo1whxXw0TkgxVKiBw1N6HNRrCURg79hs248MmwFieXXejwidfpclEc6zrF3EuZgR/SXd6UXJpXvSQFfbRgaE2a1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741707368; c=relaxed/simple;
	bh=xDNR8XWNBKrRYHZg4w5OLvJbVJbwA3p5zXYLpQLizB0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AehdWv6qjd7uAyKbdMQmeQpacaG9C9DsPtBLiMPcYeoziz2tI6pH8Zx8WuuJO/kvpzPM6OdhTAzWgzyOCRdx/kqFhb4AiAXKtSD0Jx+jBk7fyLEul83mMgGI45rhTv54+PnFTtgfEK69o+tylr0anKUTKEXOF2PGaHj55L7rVjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=gvNRnPCg; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="gvNRnPCg"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2f9d3d0f55dso8667370a91.1
        for <devicetree-compiler@vger.kernel.org>; Tue, 11 Mar 2025 08:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1741707366; x=1742312166; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JU469PFU1aIoWeR6GX4nZa45ZVpG/Dj2JFeEAq3pl88=;
        b=gvNRnPCgfnEGoSaNJnTMtRQSzKQiztQ8t0bGhg1NVly72eH4C9Sz03XGwsLGBLPxlT
         8cZk5Eq7Cfx4xG5Ja9PsG9bI1WJ2HVS4qlE7yGktLGPWGWEV8l3sfRiWkduUjxzQ1D7f
         Kpwhv2a9r8nApjNBlqS8HY81oWT24sc0r83I2cH7O8xr/kB64NDNX9IhIElQ0RYCvxRA
         FpDBMCcaqXHiw3tvG1HWIku+22V5nW4rGE6bE6ZwRYbcE756g1hJ9+n0Z0AZPPZGBRtZ
         6EA+VJqclpKrkXTrIM/ygJyEdTn53f9uWxyuWiGjK4a89zh5CrANOun4MSbr68DZrD2w
         4zsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741707366; x=1742312166;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JU469PFU1aIoWeR6GX4nZa45ZVpG/Dj2JFeEAq3pl88=;
        b=u4armDPwGEZaAPfQX1nTJ03A8fviuNNW5lO9+rY2SAqeXkLjV8a3ICc2sf6kWMbDE4
         qGRMKYDHn9FKkbrT9HbO5cz8skZOMU/sS1BBn7cJLWhQIX6W/5n+KsH1Klutai4HMxCM
         OM4I0GF4NJEX9TDM51Q/NPiiHfou/8vXu7ZkVHrWR1N4/KX6PC/HRNbGUi1d9cTIXOIi
         9OPJvbnADmi/4DNwVEn7aWD55/CbI/6TPHsJ+Ioy3wyjC66ALjbmP6xfBXtAfC3iV2mU
         kkwAWty6+cSkjDFHDFH6MYl7DEOEFOh/oknk5ECoRSIETYPuRTwqGZJg4kxyGXZQ1SqM
         5fcA==
X-Gm-Message-State: AOJu0YzgwOAyxoHUL/VSS1D035N91pV4LfnwAtF9GHJrjrVd5zL42OJa
	kYa1J+MaFqvy9UxuV6uTmPR9FwkhIlCQCR3z2rkp9t3B5qFHC8aCECOGXqthY7qJ1l4w9bQAWUQ
	atg==
X-Gm-Gg: ASbGncslyZq9ZCRAe9F6EAL9EJTtwBgLd8W9O2cfO0N4yzmd0KExoVRTyqXEDJHWvXZ
	5mMLqa7rwmzHlr6rcJl6DkFeaoEtPmXusRzv1/x3ArvLTMTZxIDoKrlcEllYOLT7CCq1GAQfaEC
	pOh4y3W+xA5svFsbn+k34VgJzkuBKvyZ57MtLJ1W0OzE03BHdIM2s0lAnb1ofNjhcHSxDZXkVBz
	7HAdcEDEudacCFFYKrkr0ti0mGn/eRmp4QPZe3HfpCPhBOGtZbm5uyf1HyGHlh2s/4GZYkSHvOI
	qHyBylhCaetFM1EAnca7kpX7Koducqw8Lu74ZrujPMfjwAucE4w=
X-Google-Smtp-Source: AGHT+IF7Q1Sqx4Ra1Mx+mfjumPsqQWzXAyAGv/ztwsE+cqI03+XXO8A1puyKSh3kXY2hc7yjV5QuHg==
X-Received: by 2002:a17:90a:d40f:b0:2ff:618c:a1e0 with SMTP id 98e67ed59e1d1-2ff7cf37945mr26454104a91.29.1741707366598;
        Tue, 11 Mar 2025 08:36:06 -0700 (PDT)
Received: from [172.16.118.31] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff4e822bd2sm12030413a91.41.2025.03.11.08.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 08:36:06 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
Date: Tue, 11 Mar 2025 21:05:40 +0530
Subject: [PATCH v2 4/4] tests: Add test for /./
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250311-previous-value-v2-4-e4a8611e956f@beagleboard.org>
References: <20250311-previous-value-v2-0-e4a8611e956f@beagleboard.org>
In-Reply-To: <20250311-previous-value-v2-0-e4a8611e956f@beagleboard.org>
To: David Gibson <david@gibson.dropbear.id.au>, 
 Andreas Gnau <andreas.gnau@iopsys.eu>, d-gole@ti.com, 
 lorforlinux@beagleboard.org, jkridner@beagleboard.org, 
 robertcnelson@beagleboard.org, Andrew Davis <afd@ti.com>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Simon Glass <sjg@chromium.org>
Cc: devicetree-compiler@vger.kernel.org, 
 Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2514; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=xDNR8XWNBKrRYHZg4w5OLvJbVJbwA3p5zXYLpQLizB0=;
 b=owEBbQKS/ZANAwAIAQXO9ceJ5Vp0AcsmYgBn0FhLGs3fC5sJXiMtpuM3NDw7vA8hRInoaSpDN
 vsE75dMMGaJAjMEAAEIAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCZ9BYSwAKCRAFzvXHieVa
 dKPmD/9uWdUy1YMSd5BEzLxCFomOV1iCFbuGHYm3hNraxhU3f9F9H5qX6GYYlWM/RzAkXhGnsyR
 WJU1QJfhffTE5r6oYoShq+QONs6dF2JP/X6fzesYttVTWsibmi+et/i96qD5zrG76e2EhnQFZrd
 OG2MF5BiBfd55ACKfT4GLu2uLr+NchrS0TU1UjCM09opCUWzLGbvzjDwuVWEbFuwlKLs81CBhNl
 4VTPNa6H8NFERXZkwpOYQAdy+GZTZxavjXfom+VaIFWg1VYENbNpjMMZV4LQZaTmv7N0AM8siLE
 On6ZnmJUZj5+W+sCnxGh9/Osphg00c9Ny1pvCRbkKGjDlFL7/qINTE/duxaglXA10jr4Yq8f/+q
 JQfAq4m3NfK57VGzkNlbIyuTExMcpAkH89F+bw/x/LhSQrqVGQ6MkKOtqrxBw19o0YoMotGNsv1
 vyITRTvR7+47NgnMQ02Hd0FkMPuJLW8Xr0vpopNMq5ZRxhHXoHvNtXODvAzzq0HByEbWfclVmZA
 B79fJa735GjOn65/O3O1YK51dTpJEAOAcvBepiLKyAFmvlwu2Uo7WUJTK+ALki/P78NQAp42Aeo
 2JVsC+T8Ag8RCThNFv0p/HhIH0CuP3OWISGV+Vngah2pnx/drbObU2GRbVLNC4lfWD6NhZy3m8k
 ftU3kqYdMHm54vw==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

- Test /./ on a string and int array.
- Also test on subnode property.

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
 tests/prev_prop.dts          | 25 +++++++++++++++++++++++++
 tests/prev_prop_expected.dts | 13 +++++++++++++
 tests/run_tests.sh           |  5 +++++
 3 files changed, 43 insertions(+)

diff --git a/tests/prev_prop.dts b/tests/prev_prop.dts
new file mode 100644
index 0000000000000000000000000000000000000000..27b5395628999b0a06ccd0c160d4e928bd6396ea
--- /dev/null
+++ b/tests/prev_prop.dts
@@ -0,0 +1,25 @@
+/dts-v1/;
+
+/ {
+        str-prop = "1", "2";
+        int-prop = <1 2>;
+
+        mixed-prop = "1", <0>;
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
+        mixed-prop = <1>, /./, "0";
+
+        subnode {
+                str-prop = /./, "3", "4", /./;
+                int-prop = /./, <3 4>, /./;
+        };
+};
diff --git a/tests/prev_prop_expected.dts b/tests/prev_prop_expected.dts
new file mode 100644
index 0000000000000000000000000000000000000000..59e6573674e55c3d7cf8b0f236324ec0f8585915
--- /dev/null
+++ b/tests/prev_prop_expected.dts
@@ -0,0 +1,13 @@
+/dts-v1/;
+
+/ {
+        str-prop = "1", "2", "3", "4", "1", "2", "6";
+        int-prop = <1 2 3 4 1 2 6>;
+
+        mixed-prop = <1>, "1", <0>, "0";
+
+        subnode {
+                str-prop = "1", "2", "3", "4", "1", "2";
+                int-prop = <1 2 3 4 1 2>;
+        };
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index f0b51c04bf0af69f1df483b185f3aefa5d0bae27..c66793aa0d99a8d066a675f70bdb33b3462d6fa8 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -708,6 +708,11 @@ dtc_tests () {
     run_dtc_test -I dts -O dtb -o dtc_tree1_delete.test.dtb "$SRCDIR/test_tree1_delete.dts"
     tree1_tests dtc_tree1_delete.test.dtb
 
+    # Check previous property functionality
+    run_dtc_test -I dts -O dtb -o prev_prop.test.dtb "$SRCDIR/prev_prop.dts"
+    run_dtc_test -I dts -O dtb -o prev_prop_expected.test.dtb "$SRCDIR/prev_prop_expected.dts"
+    run_test dtbs_equal_ordered prev_prop.test.dtb prev_prop_expected.test.dtb
+
     # Check omit-if-no-ref functionality
     run_dtc_test -I dts -O dtb -o omit-no-ref.test.dtb "$SRCDIR/omit-no-ref.dts"
     run_test check_path omit-no-ref.test.dtb not-exists "/node1"

-- 
2.48.1

