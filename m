Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B8B1DE894
	for <devicetree-compiler@vger.kernel.org>; Wed, 12 Mar 2025 19:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741808571; cv=none; b=LOtYy/Rs8X+WmwDTs8wslw6WB9nzedFr8E1cAtBGpGAHq+cwsCzdatBVibVFurP32fBY6Mo27qV4NAq0Wh/aLTgP7NbWmmhorhf4FODaKagfa7JN3MMVXTV5tDThK/W07pPMx2TVr0ayR1WyxWu1IxgRAftxK9+23Q3locHshAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741808571; c=relaxed/simple;
	bh=yeVEd4OZmdSO6rPxjqlBtoymT3tgvS0LHE1f8sw0+pk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tkXGvq/1eWVUaR6abxRMTgsbuv120o2OaW7wm+U2e+LDtHdZsB9rjUEDvi9kb3wx4CW6z2pon+CPDxla3tSrwatFg6v/zC6zV/pqrsMArvcHeYaJ11SMO6GTLnrNH5As8Uf3EtAV0XKqCqHxEaY54a/ccVtyT2IT5WO3ye/zohE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=X1cqMeCS; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="X1cqMeCS"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2fa8ada6662so592213a91.1
        for <devicetree-compiler@vger.kernel.org>; Wed, 12 Mar 2025 12:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1741808569; x=1742413369; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CWFRA78jU9xpXD3RLDvxBF9xV4Htj5JqOpCL9qv2SLM=;
        b=X1cqMeCSB1d0hT19yNFowgxlsWdPMeDRDnWsjjo3JaYHe1KjwZSdaRHLzWRRtXi4TA
         COKUYrc/4a+Ofnu3dExTGViVljyQ6uPAqUjmtTWsM35zf5t4HEC3rz/Gj/Me0n61N/6L
         2vOr6+c5AvIdWsh9LmIR8HRyq7l289s1765IJfGZfEtxdQV9OF6xbnFeXUuuZLrEAqeD
         sPYctETdnfUm89btKOukPO1wOnmyWkR742pED83Xuh4oSdg6A3Cupe+BJm7mNikyT9+6
         9RartqBtJlBFtw0Ihtq2/IZq3EceVF4zzCAj670p+dAuqn8/du+5JPfpLH8oYugk9Vcn
         MlSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741808569; x=1742413369;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CWFRA78jU9xpXD3RLDvxBF9xV4Htj5JqOpCL9qv2SLM=;
        b=wa46Fwd1plUStzrofbtIitdhXS3gnSzV9JvgXHu7iCvZ3lJsI8ykLiDxgu299fZ062
         l3eAgQMFLWUWxI0E3UMpVaa8cjhr7nsJ5bw91Tbw6LAGgRrKg+hIusBrdPhqJkU0q6k0
         MWcbp13vsD9YKLBm9h7xxbYnAAjPYIjdBH0fG2T1fs1H/XWyPNc3O3snAyxmbvKcjoWX
         oNIdowccAkpXV2C2/TvIBuyZjwR1Q9IZozEQohgElW72VT2/Ns8CfkcUyFI+OErgJqAo
         Jjy03EqVnM6sNmG25RVkDq+nH1LAXB8SEj2wmUGhH5FophvkyGyNBLn5MmKrzO059ZPR
         V6WA==
X-Gm-Message-State: AOJu0YwZ6/v6qzsXv0rrFrlzbMr7YzBVkD/d/oQn7CHioCAfgA5ur8du
	5S3TvJP/N3wjFdq84HvTxsKpta2QpvoRdDVSBC6faiMAm4xYwBWQaEPsUn7g6Q==
X-Gm-Gg: ASbGncuOx5r0tj38k7DtolZP0m4zItqrkPUVfM3UYeayy5R7PgQdcDx+I6/VW796f8q
	/4xdcSyr18YatON9+e9gKzcJqV+B6Xl3UHqsPXP4kv+AOJgLjpxwsALcFcM+FD7NmnFaGP08y0r
	fuc/wjaxV6UUbFJEHwNG/Su4YBGDzcijR7byR1q7NiLkfMF3HFePn5FO8vSEATLpar2dHV8wuVI
	fnoQa6IBI4QC+B8khv7P/Awx0S/b1xHBmaIdGPKagER1Vcc0/HIPjT3+Pcmf7zCHVdp1XieJxip
	1Shdx/wkg6XYntfEZDt1kYc6UsoofOH2DPt4BrlCI7Zi93ajRR4=
X-Google-Smtp-Source: AGHT+IFJ/T9+HspP/td44/VT4hWLpJzvKWBhlZz0HwmLAtzF26W46dy7HyIk9wrKlyNhh4n3rLZgCQ==
X-Received: by 2002:a05:6a21:7103:b0:1f5:80a3:b008 with SMTP id adf61e73a8af0-1f580a3b158mr23418343637.32.1741808568977;
        Wed, 12 Mar 2025 12:42:48 -0700 (PDT)
Received: from [172.16.118.31] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736cd220c5fsm7781782b3a.55.2025.03.12.12.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 12:42:48 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
Date: Thu, 13 Mar 2025 01:12:02 +0530
Subject: [PATCH 3/3] tests: Add test for fdtoverlay target argument
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-fdtoverlay-target-v1-3-dd5924e12bd3@beagleboard.org>
References: <20250313-fdtoverlay-target-v1-0-dd5924e12bd3@beagleboard.org>
In-Reply-To: <20250313-fdtoverlay-target-v1-0-dd5924e12bd3@beagleboard.org>
To: David Gibson <david@gibson.dropbear.id.au>, 
 Andreas Gnau <andreas.gnau@iopsys.eu>, d-gole@ti.com, 
 lorforlinux@beagleboard.org, jkridner@beagleboard.org, 
 robertcnelson@beagleboard.org, Andrew Davis <afd@ti.com>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Simon Glass <sjg@chromium.org>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: devicetree-compiler@vger.kernel.org, 
 Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2220; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=yeVEd4OZmdSO6rPxjqlBtoymT3tgvS0LHE1f8sw0+pk=;
 b=owEBbQKS/ZANAwAIAQXO9ceJ5Vp0AcsmYgBn0eOdjsyTU4SFtox8ovY6+HPhKC7lOHrGnO6B7
 8KQDR/oiG2JAjMEAAEIAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCZ9HjnQAKCRAFzvXHieVa
 dA6BD/4493WDFmj2V6s8VfRROEUZs9ytxLAN+QgW9iE7VZvugPmT0YmcmyBymceXga5w9ALb9c5
 G3+u+1kHGutW8AsAJ2nIijCFQRSwbIWonK5iJ0qjhBdAj+XYVpyxxKfkp5af8Dc4D6afyluGzC/
 5ytvFRnxCgeg77walU02KOJ+b+Izakg5XMp+3d63WNccEFfZdVfS3rGocfqTYwe7VqwHkkR5iWb
 0swDJgK9oXCHt7RUOvWv1PrPOsHJ8vl3yvVuwRYju/Lp7/Qb70hDp+eLdlz/QATJ0/F4AOSObqJ
 q7Nv84yoqhCgg4ytiQtlUiwUgA85p5rsbtlWrwugIzYMylg5bZix434tWneZbt+Eag2Dyv0V0MW
 Ca8G2QCcRYnEC8O9zgGCLxZqEtTXyatVOuSEQHpBarVuFI/QcrwnDAAoJnOTK8Psmvj+GBqua+J
 tkzJktND5prgfucRYgpHGIIAr1d9nD4JK9cJSw70aD/DC8nRfUPz9JjnVdVhviLdo4zRGqE7/xy
 CTV0ykzFCN6lqW2piUj1TG9YFQLZK+puHvUNsAmBYSW3fF1BqXBRF1mB8bQafGg+DfDwn1X9zne
 rcynbaPCzoDCFWoz+/Ta9t5yo75CwbIox/vcAmuC3CaYxiCltaLe0UWnUPbbDqmUEJe3+oVw5lO
 YqMc8tXs+QOwO4Q==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

A simple test that using target argument works for both the base node
overlay contents as well as any additions to subnodes.

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
 tests/overlay_target.dts | 18 ++++++++++++++++++
 tests/run_tests.sh       | 14 ++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/tests/overlay_target.dts b/tests/overlay_target.dts
new file mode 100644
index 0000000000000000000000000000000000000000..41b32e2c48e83bda85a3482083a9509e3721a0ba
--- /dev/null
+++ b/tests/overlay_target.dts
@@ -0,0 +1,18 @@
+/dts-v1/;
+/plugin/;
+
+/ {
+	fragment@1 {
+		target-path = "";
+		__overlay__ {
+			test-str-property = "1";
+		};
+	};
+
+	fragment@2 {
+		target-path = "sub-test-node";
+		__overlay__ {
+			test-str-property = "2";
+		};
+	};
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 937b128864d03a2aaa8edc171d7ec7bd8fa28569..1b0819271d796a73a73849e192f1af6bde557b1f 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -1057,6 +1057,20 @@ fdtoverlay_tests() {
 
     run_fdtoverlay_test baz "/foonode/barnode/baznode" "baz-property" "-ts" ${stacked_base_nolabeldtb} ${stacked_addlabel_targetdtb} ${stacked_addlabeldtb} ${stacked_bardtb} ${stacked_bazdtb}
 
+    # test applying overlay to a target
+    overlay_base="$SRCDIR/overlay_base.dts"
+    overlay_basedtb=overlay_base.test.dtb
+    overlay_target="$SRCDIR/overlay_target.dts"
+    overlay_targetdtb=overlay_target.test.dtb
+
+    run_dtc_test -@ -I dts -O dtb -o $overlay_basedtb $overlay_base
+    run_dtc_test -@ -I dts -O dtb -o $overlay_targetdtb $overlay_target
+
+    run_wrap_test $FDTOVERLAY -t "/test-node" -i $overlay_basedtb -o overlay_base0.test.dtb $overlay_targetdtb
+
+    run_fdtget_test "1" overlay_base0.test.dtb "/test-node" "test-str-property"
+    run_fdtget_test "2" overlay_base0.test.dtb "/test-node/sub-test-node" "test-str-property"
+
     # verify that phandles are not overwritten
     run_dtc_test -@ -I dts -O dtb -o overlay_base_phandle.test.dtb "$SRCDIR/overlay_base_phandle.dts"
     run_dtc_test -@ -I dts -O dtb -o overlay_overlay_phandle.test.dtb "$SRCDIR/overlay_overlay_phandle.dts"

-- 
2.48.1

