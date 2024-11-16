Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B480BEAF6
	for <devicetree-compiler@vger.kernel.org>; Sat, 16 Nov 2024 15:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731769275; cv=none; b=BXOvVI6veuSVLiIMe3a0oLlFnWzGTDQkn2heDe0Ffk1nhHUlmxReFcBUD4gBq7mXnfk7I9r7YVqBCsdFEBjORRsyZAx+TsAddxlOjCfqiuO1UknjLYV6jczw5UoCRWn7LNaXWn7NH2X5q6/nOTyrexzq63BYZ/mBW0XmDHCZ49o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731769275; c=relaxed/simple;
	bh=PYp1TrIULB72kZhZTYGous3fwYkU1zJdxYUJMPQek5k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u6WzWEqV3ueA+vlMXrT4zo3YHW7jnjb/XqSqu6QVsfBURnE1NjGqYvOREtMp634ReRCWWHvIsd8x/UlfzjizPBfUxkFBPo7QS2EMRbCPNINzOsd5Vdb2KF1uNcADNScUXH3QJZg4u2NAO1kytUHQMNvTDNJRJnYtYShvWrcNf80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=GBNDDD1f; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="GBNDDD1f"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20c8b557f91so27681735ad.2
        for <devicetree-compiler@vger.kernel.org>; Sat, 16 Nov 2024 07:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1731769273; x=1732374073; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+i+T1EM5HbAV1CCN6JVPZMdailwQ8YtFBvoJvwG/5to=;
        b=GBNDDD1fGDG3rNpFI/R/WHyLV7DiS/FUJFhsrDBS7pU4ZBHDNzPD2eF8q9J49QAPpj
         fkvbyPs6SXf1zSRoKvQplYiv5djo9nQCK/oZhqra+Y5i6EQz94jpRDHPj2JUM5OL100R
         Usr/M1E3hWOwceJPiTk2yfN2wI0h6+k/SMOi/TgQp4YjlcJZu1t0rKbUISmQMng+hA76
         /rga8JyngeTby9Uf8A+H9dj/htpJvCAp37fHgUkSAi5KmsX7YmChJdFCNi545C4vczQY
         2y953BLproBX/127o9YBwfdY7vxw9a0BfyrKlnNgK551FLk0DJisZoqxzXD4tuGjagqj
         S4HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731769273; x=1732374073;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+i+T1EM5HbAV1CCN6JVPZMdailwQ8YtFBvoJvwG/5to=;
        b=sEv4vQPyOhb7GOesfZS3wMt7oj7fXLjxCztZOXpIWdUmmjIZPia+haCntp2u66NDsx
         DLlVGISNtBfnmMTgIgCEBFvak0Bsr641WOOoTn7yW2aiK4ixlef3AcbFrgWwXlXDo4ZU
         J65cyvEPOe2SiFxbQkhGswIXHLIRJ4jlbjDH8854O/lCGvEEWsEpuByefwYrmxl5EEqC
         w9btgHU2RKgFlvDoSpiBxEnaR2NUtNGYdd/bDiEUxFruQ2wRtbA4AipGwFAsxJ0V0clM
         3QoTg19HsE83pww5jxgQ+YDdWn6Tf/MqxcuBZRhFHy8wviljUqGdDE4Qxz5JMnjzqFqt
         nKPA==
X-Gm-Message-State: AOJu0YyDM2IvEjg0BwQctYoHlmZAOXRzqKeuZJ6pm2cRAB0KbGpHu+Xj
	OipSEC4B3LnusqFaBljSyHfuQ3iQmF6bx/It03RAaY1pqBuVuE81LBcMjb/mbQ==
X-Google-Smtp-Source: AGHT+IGxIzCIuHVjdkqyg5mQGLBvsX55UvDPoN0D960xJz1TYoXvnkomwuQcxvll9a3hO935YB3sRA==
X-Received: by 2002:a17:902:e74b:b0:20c:e4c3:27a1 with SMTP id d9443c01a7336-211d0d4c191mr90106965ad.3.1731769272874;
        Sat, 16 Nov 2024 07:01:12 -0800 (PST)
Received: from [172.16.118.100] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f4694bsm28492305ad.196.2024.11.16.07.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Nov 2024 07:01:12 -0800 (PST)
From: Ayush Singh <ayush@beagleboard.org>
Date: Sat, 16 Nov 2024 20:30:23 +0530
Subject: [PATCH 5/5] tests: Add path tests for overlay
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241116-overlay-path-v1-5-ac3e121359e9@beagleboard.org>
References: <20241116-overlay-path-v1-0-ac3e121359e9@beagleboard.org>
In-Reply-To: <20241116-overlay-path-v1-0-ac3e121359e9@beagleboard.org>
To: d-gole@ti.com, lorforlinux@beagleboard.org, jkridner@beagleboard.org, 
 robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com, 
 Andrew Davis <afd@ti.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Robert Nelson <robertcnelson@gmail.com>
Cc: devicetree-compiler@vger.kernel.org, 
 Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2550; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=PYp1TrIULB72kZhZTYGous3fwYkU1zJdxYUJMPQek5k=;
 b=kA0DAAgBBc71x4nlWnQByyZiAGc4s6HITLP11RwMmv2cQoV9bhH6+fMqiiqxvw/7Hd51wlWA3
 IkCMwQAAQgAHRYhBN/MEx7yTy1lb6UE1gXO9ceJ5Vp0BQJnOLOhAAoJEAXO9ceJ5Vp072AP/0vn
 xKhEFdk7RYI6TFBSHUIayMDypOeOM+HFnUFVMCdF2XGWe9vq6yA3iBlahZvI3jhEixDTIln1YDq
 BS9ju8DoKq1S1cL1j1cdWFpBYNvg+6+hQvsEWQzNwYFqgFPRO15iiqLBDR1j1lqy4RbOs4aBfoU
 2gZ7RFmxIyweEdIeJWMr/8t11RmH5L/bYkWlHkxw7U+Gl6uOoTcEqz4+mSGlu9FyjdRStDmT+w+
 QQEJ6RG/97ftzqxVrSBtYncJAmIRcwjeyj65Y599GBPRUF2pLZYys22DD/E3tMNGyKFeQdWzruC
 iOS7qa2ro0mlNU2VeulC3HrIS1mGRDSlUrEoLbzTzWXqwb/DVVfFoafK+LT511LmtxHARsr14b+
 aHpM9III3t5jBNFAGaBmYh13tHAL+scD77hKwJ6qTk6rceeIozZ0e5Bstk2DGBKf+HBqX9XPoHa
 tsLPdOPtCUUTijFs9Uuvf4Gh5OUNP1J+zlYBUn8LkUb5QRiBPJUiHCaEv9RA+94dkWUPppbPUDA
 Hob2ulDRB5KkeV1ZDlPqLOJUIKWdOb007XE7RGaFyuEKFEnkZ9g5621LlIXttkNYtVP/8dyP9HU
 F466du+zGgmNduKDdKVEJw7bmV1rIokPMxLOcmlWJeuuIpXdR2z4MJcl4C2D+eTarIvhU3y1OuV
 n0kJP
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

Add tests to verify path reference support in overlays

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
 tests/overlay_overlay.dts               | 11 +++++++++++
 tests/overlay_overlay_manual_fixups.dts | 26 +++++++++++++++++++++++++-
 tests/overlay_overlay_nosugar.dts       | 19 +++++++++++++++++++
 3 files changed, 55 insertions(+), 1 deletion(-)

diff --git a/tests/overlay_overlay.dts b/tests/overlay_overlay.dts
index c4ef1d47f1f159c5284c8f7282a0232d944ecfd1..18382762eb3d7c26b0f2e507acc3803f38194fb1 100644
--- a/tests/overlay_overlay.dts
+++ b/tests/overlay_overlay.dts
@@ -50,3 +50,14 @@
 		new-sub-test-property;
 	};
 };
+
+&test {
+	test-patha = &test;
+	test-pathb = &test;
+};
+
+&test {
+	sub-path-test-node {
+		test-path = &test;
+	};
+};
diff --git a/tests/overlay_overlay_manual_fixups.dts b/tests/overlay_overlay_manual_fixups.dts
index a5715b6048acaeebcdab56060040a339d08686a3..c40297aaefaaa6d168e42f864639a05bbbe69f57 100644
--- a/tests/overlay_overlay_manual_fixups.dts
+++ b/tests/overlay_overlay_manual_fixups.dts
@@ -86,6 +86,25 @@
 		};
 	};
 
+  fragment@8 {
+		target = <0xffffffff /*&test*/>;
+
+		__overlay__ {
+			test-patha;
+			test-pathb;
+		};
+	};
+
+	fragment@9 {
+		target = <0xffffffff /*&test*/>;
+
+		__overlay__ {
+			sub-path-test-node {
+				test-path;
+			};
+		};
+	};
+
 	__fixups__ {
 		test = "/fragment@0:target:0",
 		       "/fragment@1:target:0",
@@ -95,7 +114,12 @@
 		       "/fragment@5:target:0",
 		       "/fragment@5/__overlay__:test-phandle:0",
 		       "/fragment@6:target:0",
-		       "/fragment@7:target:0";
+		       "/fragment@7:target:0",
+		       "/fragment@8:target:0",
+		       "/fragment@8/__overlay__:test-patha:0",
+		       "/fragment@8/__overlay__:test-pathb:0",
+		       "/fragment@9:target:0",
+		       "/fragment@9/__overlay__/sub-path-test-node:test-path:0";
 	};
 	__local_fixups__ {
 		fragment@5 {
diff --git a/tests/overlay_overlay_nosugar.dts b/tests/overlay_overlay_nosugar.dts
index b5947e96fb00dcf2c321c9f43e708863053b14b3..7e54ae5f5e7641bdf08626200e9471067b0f7677 100644
--- a/tests/overlay_overlay_nosugar.dts
+++ b/tests/overlay_overlay_nosugar.dts
@@ -83,4 +83,23 @@
 			};
 		};
 	};
+
+	fragment@8 {
+		target = <&test>;
+
+		__overlay__ {
+			test-patha = &test;
+			test-pathb = &test;
+		};
+	};
+
+	fragment@9 {
+		target = <&test>;
+
+		__overlay__ {
+			sub-path-test-node {
+				test-path = &test;
+			};
+		};
+	};
 };

-- 
2.47.0

