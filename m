Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A745216726E
	for <devicetree-compiler@vger.kernel.org>; Mon, 11 Nov 2024 09:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731318900; cv=none; b=FJbVC1Ot4a5UvE63LVkqH5HUooG51idylE4jSLlx0cZPlgIZA7mh1z4PJ9kW4wz2QvGlGaOacO1D9a9ijuOELMHOdW8LLfQlAcL08Ob8bZe4jRfxl9GGOQLlJZQmNVknpWR/gjY4xmqHC1g2lJJYw3AEKdChv44LigW0uFLhU1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731318900; c=relaxed/simple;
	bh=otQf8GlQaNZgXKJG75q1A87adtTPek+fkRXF4k5De0g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NtDN1UE9OipVaEuVNuvPy0AItKqHbNCx03KoXZevgrTBwKIM3iQqt010Z7npFE1hiQB4/7CIgv7VeWpwKqVGuTzowxP62JePFxOhnzIYhijIgyoW46gtHqFG4HiZ7Ok27wLZUQ/KFPynuqv0cgkymy93AwcguEvaDr45HG+EeIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=B0uCmW0B; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="B0uCmW0B"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2114214c63eso35683415ad.3
        for <devicetree-compiler@vger.kernel.org>; Mon, 11 Nov 2024 01:54:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1731318898; x=1731923698; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8AFkEb0VdfAy3jtompql+8xWvdxfuPTRq1bBEqCnUic=;
        b=B0uCmW0BBTpTSuPKHk4GAfDNm4MTmZ022j5exSOwssxSix43kE65N+6n43/KZ7B2jk
         +QI+WFtgKyPhXL/ii/X7ShJvVDod/Vt5nf/tHeAAKM+bzrfZ/33DSGuXNnQ+rce9jIa3
         6tnFHmIoD/THLnrPIDuv6W6yTs8kqAFB+Dwiwnl2dCFW+7J5q283iHazdrWxWdSSNJOP
         UsnxXwFfqMkXLD1KHNMSxg7fxJgUA6q056k6s1mauslrxer8GyEzNtY8jN17ixFL4mHo
         KZPwVdZpv6WpREntO+rzXH3QIotvqsoxTcQjQ8pSm6zX6SiCXHSFMtr/kbnZnY3ngdpu
         JWbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731318898; x=1731923698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8AFkEb0VdfAy3jtompql+8xWvdxfuPTRq1bBEqCnUic=;
        b=ZGfeWcags5/9fJ2+GQCBieCL0FfModgLSz+TnbNxYWaSdrmPoxF3iYotXECehzSPI4
         gniXVM7vpR/ZxmQ1yU+A6ym8SXF+qBjLHZ+yq6jh8JxTux+gEGq7ngdbhM6wJxzSMf93
         QxkTgwU8HcAYQe0Yw7iIg7M2v5OQUBgRyHbis2AcnQA7CvsYpISVWIqfYrBRwWjoFy0x
         rdYzcOwJHKbVynmHmcI9ajtFEGsS/zPp41lsvPXePTEtVyNduF14YumAQb2x4yCAYK9u
         21/eC9iaXaGLjp4LJWz01G2gttpkLXR5VEiN22NddrOy2O8Q5t7grm4FPzFWUJIJvAJJ
         /dhA==
X-Gm-Message-State: AOJu0Yx95KH5e7PG+OkjBVJkptY+/lOMU3R2vgkeXBUeV+cszfIPiVh2
	u5ap4pAhAakfoD8MjGAxMxMTAePOHVHiPA201qT0TxMgs/f7W9hLhE9bZeApHR9B3IOYxN/5bBU
	=
X-Google-Smtp-Source: AGHT+IHrqrrn9D9fWDSbam+6F5YMnVRnYC0K0JsQx43wS5L5k04L9BlMngEjKk+oJ4OUYqbYBpxQPg==
X-Received: by 2002:a17:903:804:b0:211:a6d:85e8 with SMTP id d9443c01a7336-2118359cd69mr121552095ad.39.1731318897930;
        Mon, 11 Nov 2024 01:54:57 -0800 (PST)
Received: from [172.16.118.100] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177dc9073sm72351685ad.1.2024.11.11.01.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 01:54:57 -0800 (PST)
From: Ayush Singh <ayush@beagleboard.org>
Date: Mon, 11 Nov 2024 15:24:34 +0530
Subject: [PATCH v3 2/2] tests: Add test for append-property
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241111-append-v3-2-609c09401f3f@beagleboard.org>
References: <20241111-append-v3-0-609c09401f3f@beagleboard.org>
In-Reply-To: <20241111-append-v3-0-609c09401f3f@beagleboard.org>
To: d-gole@ti.com, lorforlinux@beagleboard.org, jkridner@beagleboard.org, 
 robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com, 
 Andrew Davis <afd@ti.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Robert Nelson <robertcnelson@gmail.com>
Cc: devicetree-compiler@vger.kernel.org, 
 Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1801; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=otQf8GlQaNZgXKJG75q1A87adtTPek+fkRXF4k5De0g=;
 b=owEBbQKS/ZANAwAIAQXO9ceJ5Vp0AcsmYgBnMdRiBEqlcbAi/7wnLq10uGjsE7hHDDOUt8VBO
 lBHCs1bI7GJAjMEAAEIAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCZzHUYgAKCRAFzvXHieVa
 dLToEACfZ7r1snX0J0VEOn1fvZDSBvsbmWlE0VSVptyQrvh8Y8bv1ycXAL0/+5clJONhLZPMFIK
 52i+rd1KtttPygdLED8ZwUi0MHlsjHenqFQ0lQELH/yHEpjWQYHLMTR3ACWjmCzTJJAbcfN+H/S
 qmUoKN0uLU+lyOvUi8vk0d6nCun4vA3vS06ygbOL6AFoTIBDzxzwMuFn4QaeKK9wUu+Q5DTSRcG
 lgUmxIJosYdxX3qxShJT7N2z+935oNhzWZ7K1tjZCu4qxXPspq5UxB9ld7RgYqEKX/atmYd7/nr
 8mJnPJZG8bwLnG0dfhzn1CMnIqaj0EwBpRx29u9TSIVfpj1mXITJ1CQoNjCJl5R58Ii0MyavKEv
 UjSew1pyZpTW0ODXHLLKtAz6Z5rf8KODkZQeTOKzprwVXbtY0hY+cGFgOesmQLW31DrXaaGucML
 9Z0jQsq3YjTERYc49vE+Pdcln6h0rIx3Cmt6zleqiznoWniJTyuvhQl0cOsDtSmuVpPUYcqEG2S
 rEcr5W7cKhsr1jAdVW5+aDkn87duzAA9qL0HXnWg4YaCmXMBp0ovwQ4nQWJ0j9WHqP+l1eIYgGS
 bDXE1U8ufRgf1TPu/3mTDggHiB0NlsE3yRMlTDOVCU33fJMfxYHLoMqgc9CNnvyjT4/Py3LpXNm
 +nFrdfjTMUVcK4g==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

- Test /append-property/ on a string and int array.
- Also test on subnode property.

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
 tests/append_prop.dts | 21 +++++++++++++++++++++
 tests/run_tests.sh    |  7 +++++++
 2 files changed, 28 insertions(+)

diff --git a/tests/append_prop.dts b/tests/append_prop.dts
new file mode 100644
index 0000000000000000000000000000000000000000..248d4ed5ce5a753c9444d21359249669d88b7784
--- /dev/null
+++ b/tests/append_prop.dts
@@ -0,0 +1,21 @@
+/dts-v1/;
+
+/ {
+	str-prop = "0";
+	num-prop = <2>;
+
+	subnode{
+		str-prop = "0";
+		num-prop = <2>;
+	};
+};
+
+/ {
+	/append-property/ str-prop = "1";
+	/append-property/ num-prop = <1>;
+
+	subnode{
+		/append-property/ str-prop = "1";
+		/append-property/ num-prop = <1>;
+	};
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 937b128864d03a2aaa8edc171d7ec7bd8fa28569..571980a155ac4510c77686c254ee809a0f4ff108 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -708,6 +708,13 @@ dtc_tests () {
     run_dtc_test -I dts -O dtb -o dtc_tree1_delete.test.dtb "$SRCDIR/test_tree1_delete.dts"
     tree1_tests dtc_tree1_delete.test.dtb
 
+    # Check prop append functionality
+    run_dtc_test -I dts -O dtb -o append_prop.test.dtb "$SRCDIR/append_prop.dts"
+    run_fdtget_test "0 1" append_prop.test.dtb "/" "str-prop"
+    run_fdtget_test "2 1" append_prop.test.dtb "/" "num-prop"
+    run_fdtget_test "0 1" append_prop.test.dtb "/subnode" "str-prop"
+    run_fdtget_test "2 1" append_prop.test.dtb "/subnode" "num-prop"
+
     # Check omit-if-no-ref functionality
     run_dtc_test -I dts -O dtb -o omit-no-ref.test.dtb "$SRCDIR/omit-no-ref.dts"
     run_test check_path omit-no-ref.test.dtb not-exists "/node1"

-- 
2.47.0

