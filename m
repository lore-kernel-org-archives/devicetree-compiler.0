Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DDC3C17
	for <devicetree-compiler@vger.kernel.org>; Thu,  5 Jun 2025 10:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749120565; cv=none; b=YMD/3xb0pfn9qogZQlyB0iLZOnrfFi7pVLT7lv0jbc+TNUGmaxAAydIywnLcJQ/F8GJrcurGGJKcgI0fuxTlaFmfS6MNiQqQAQEH+uPh5bxU2UxUFhaNsDM8MzJ1IvAN6mL90pwfFgwCo8+G3evrUlaNCQ0Ibg5bZqyITKYCuLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749120565; c=relaxed/simple;
	bh=HSe3gjucfAFVBPY00rD0OYsYCXkj0pHUcgmwufqRWio=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pdn1OqOws0oSO8JYcr6kdXxu9BruoMIakkzZX+OSTu5EuX6nS94IZwu/+iZrk2Vnh6bc69Hh5QdbnunaD9T9+rzPFK4W5P00HmYy8scuMPw4lYKWt8jFWumrEAkYzEax5MFX+Vte5YiI+AaLRSe24VCIj5JovXEKqqZWQjDkKZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=xq/w9KRU; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="xq/w9KRU"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-747fc7506d4so944992b3a.0
        for <devicetree-compiler@vger.kernel.org>; Thu, 05 Jun 2025 03:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1749120563; x=1749725363; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/lV06I/ql+XBRZ1SVNY46124SrtcEG8dnPWQpuHNzp4=;
        b=xq/w9KRUS5Dd+WuBxJXhlLdp3Lk70tyvdGIdNxrNOZlsTgH1Y9psTGdNQlaUV+tvMy
         cxho6bUJkTRreP1Movv8CoPfHUmLmoA7u+GReqxt8DmM3wxHImq9o3EqqceGlOzK/Sf1
         57Yjen7C2YGnJrt7YDgiyK1RmleU6ewYXekDG6QeNMHFMRleU116ZsxDjMhFFIYdr37V
         eCm9cOKiNQ1VB0GFHZhGW4271MXGlh0DCZ6egvMfFgRTXeVPnp4zlq8kOLhBEYTuFUUI
         R/GTeXO6oY2f30KpjNk464+Mtvn0LAcUrnOWNbXBu7UQWGh1fw7gUz4Zdi4dqCOcTUDa
         AXdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749120563; x=1749725363;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/lV06I/ql+XBRZ1SVNY46124SrtcEG8dnPWQpuHNzp4=;
        b=snQBb1gQn6I/zHAN3gteKZN43i9VBfdpf3OYfOqruBUmZBjVQ019lmUu4IUMSVPw+8
         jjfZVu9EHksukFzL9AnM0DgkJ5wvGCo5PA6fXgwJQrr+P6WZQvaZGOSYMMlOpV+0THGS
         6OP2oI+m1tZOryg1Zx19CtRAb6TerjpcY3FfVj5zWp4Aqv5hZt8mXNOx94WPk8TyWeUi
         xEEfHNsFFR10BrFkHteKy0Xp6bVQNl8aA1TZc6BTqCGiGVu1pXPhnroqP62cP4G3xf2A
         6aOl59A6Xhv8g9nquD8LW7b8y6LkQsfv5UNhBx8bP+udh2MUV6YXTwpT/ZR0DP4XSr2Z
         AO6A==
X-Gm-Message-State: AOJu0Yxp+zsM33rEthGOKAEwI+cSwGIgkKogafFx7iT4Fv4zI65fZzru
	y40UDyIozkvtNRgoH4Jp+vf075mx7gM64t4WnF1bzEz1c5MguNQiJGPXGn8bXdUytw==
X-Gm-Gg: ASbGncsY/rRXcXl54KLw7KoQqLwf28iFfN4ZE3uisa4b0Wb86r57PzugVy1WQILxanG
	KYkDrol9gUK+f26CmzmZa62/M7nsCGJRK8AoH6FCMHGwMM9UzQv1TS0ef0JDPd8471CpTvpCoa3
	UXix6XxCVx7DlVroB4m4AM+QCTbgB1PKObMiQVsNo3TRyOBA1XToKdIldH0uv14vCKL0Z/ss3Lw
	jbfuF0mdpE3lnMAdNhrdtDXMwhludPfMtuQysp+MAWHaDpEWfOYGiNYXpeP5frjZlDHuKO4M/mV
	kWsdStf5B5jCnW/dj2fi7Nj9pHS+4PEnqhs8iwkDdS9D36uyf6j/88mLdAoGfA==
X-Google-Smtp-Source: AGHT+IHPTsGQH3zgvFpz7FL7FeBETQYkbaeOWtm00o7IwUjigvQIgcSjoT0R57aOXmse299w02JjLg==
X-Received: by 2002:a05:6a00:b81:b0:739:50c0:b3fe with SMTP id d2e1a72fcca58-7480b23acb1mr9922849b3a.8.1749120563339;
        Thu, 05 Jun 2025 03:49:23 -0700 (PDT)
Received: from [192.168.1.11] ([2401:4900:8899:bab8:9a99:8bde:e080:9339])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affd41edsm12997594b3a.146.2025.06.05.03.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 03:49:22 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
Date: Thu, 05 Jun 2025 16:18:09 +0530
Subject: [PATCH v3 4/4] tests: Add test for /./
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-previous-value-v3-4-0983d0733a07@beagleboard.org>
References: <20250605-previous-value-v3-0-0983d0733a07@beagleboard.org>
In-Reply-To: <20250605-previous-value-v3-0-0983d0733a07@beagleboard.org>
To: David Gibson <david@gibson.dropbear.id.au>, 
 Andreas Gnau <andreas.gnau@iopsys.eu>, d-gole@ti.com, 
 lorforlinux@beagleboard.org, jkridner@beagleboard.org, 
 robertcnelson@beagleboard.org, Andrew Davis <afd@ti.com>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Simon Glass <sjg@chromium.org>
Cc: devicetree-compiler@vger.kernel.org, 
 Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2514; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=HSe3gjucfAFVBPY00rD0OYsYCXkj0pHUcgmwufqRWio=;
 b=owEBbQKS/ZANAwAKAQXO9ceJ5Vp0AcsmYgBoQXYdPcgT6xYxZyRcmjaGFZt4Hbl+dUsNwuGcw
 XCIcTGtF1yJAjMEAAEKAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCaEF2HQAKCRAFzvXHieVa
 dOaREADRMlxzgylRX7kOgUcqKyezasQVF4iIkGPl9E4WmgLBOM7rA1JVkwmuLAaYNHlui7I25Kh
 Hm5Kro/GZeGFi6yt9yHw0vgOiDnDcxIA+h9rHYqYH+ibS2Cbj2mrROjyHiVHjfXl8Jf2SxzJXsQ
 HDal22omOfYvN/iD1AE02jbpQk91YBOQzTS8F9m2wICEVYMVJs1Mc5XGqwedSQEytYKXWsDunpj
 7K4fTB1npKPjreccZ4EcJe+Y03Bi3AfQISKUVB1I8C2x1krWdHBspW7I4Gae8bXk3CWzGKtVLpC
 Qao2W6XDH7waoLs4d7/9i07I87B5BIVDR7XgMo/G20UX549N+DM7dcQod4mIQ9pax27q+DX2D0k
 +RbhZwhrj5Xv18nZm5kfVs88MikIIYx8OiVUGSe0Nceff69EqV/n8vIBslM79gGAaC1hhpKUhq5
 BWjOkk+n/zG4aoV7AxbFn7bvESbDJRa2qxV31qJrTQJ1IpF/rmZ5hsRM2x9ri9inkepXkxDhZSg
 6WkjiIC0/wWP05BHrcHvKxqLNpEvioe8ERUuvG1I8uBTzvJCkXpKE41biN02r/P8q6hZQVnD3fk
 95MXFABSDOp7OzzBv64v6HCOZXH1EAbPh6YEdz7ATifVTwleSfBKYxV1pD4HOycwzdxcbUn7Gt7
 k/+8+ekRHcaZBNg==
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
index fecfe7cc09b3517acd264e5dead378730671fbca..476554c2138192277ef8266c476b1cc45067f407 100755
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
2.49.0

