Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC901311B5
	for <devicetree-compiler@vger.kernel.org>; Thu, 29 Aug 2024 20:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724961889; cv=none; b=pEbzhGthx36rJdQAY0yTiysSVaWOU+XDDHxb4lcuIWC/3npYNjQ1cdewWtMdkhxS9rVbuAVA9OaLw1Ki7eX/OfB3ExZB+l1cHMdJG3wMAQUhnhcweymHp0/0z9v/waFSQXDUkVynCIILGdtUysJfgJXF80IJTDVbWeb1mN6STR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724961889; c=relaxed/simple;
	bh=puZj4ip79OwkG9AFRmbN5OxPLhSWxfXG7GJUGgCvQsg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L+Z0ETVlk1vBWU9ljbbrTRt1QqnXnhkVWBOGMYCJB1HURBgSFY8D2BRIy/DoQm97GP89laYFl3ikew0eMI8q+zk9gaSgf05371eZaig+Bv/qbQi25DDfNB2b/BA3zj0Arh2rWIDVw1LpZliOiWhC3nzDnO7xFriCf4WTjxz+d4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=d6BRTljb; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="d6BRTljb"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2021537a8e6so8857425ad.2
        for <devicetree-compiler@vger.kernel.org>; Thu, 29 Aug 2024 13:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1724961887; x=1725566687; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3uQ7GpJl8myighVhc5xvwJdK4arhPJl0xtUqb/hwQy0=;
        b=d6BRTljboH/gWRCyobhZig1cNkY94tYLhLHYHaRm6LDGncxtvmc5g9FyuRx8g7zkrX
         XCG4OftvO6hA5zLwgN6zArC+Qut2Djgrh3AO6KvCPVcYEAFJMKPktxpW+zCyLgs2XQJR
         R/3MuVeY4yoxSdeJC4cet+dGr9dFOoevygJ2BiBUEXPTe7ZW81GIS5PMK3zEYFNu5ETz
         am7SVGqhy5h+wO/5QUbCokOFJuxbrtvMxPjv3jflO5MLCqyl2M3Zrk7D/SAzK90xMHs4
         kmPr5C1Ba3eML9Jl/s03RawzK1/pNRwFZyffpyK4fYmXZnhskRyd5jVqbSFkHK6WiAtJ
         E/jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724961887; x=1725566687;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3uQ7GpJl8myighVhc5xvwJdK4arhPJl0xtUqb/hwQy0=;
        b=q55yejcFJ5PaVbkEXVkyr1PlI23My19ujMXBnaIzZfAVV84zB9bwpWl4LxmSwSlajc
         964rms9xYxB1iFWtPJirMGZjC/+QrqsDpHlMmsQgINTGT6MecXtk9+EHTauIsV9JPu0e
         rvu45zdj1kSe8hWHFRLYpDvlJil+ovfqUB+ebxo98vpHx4yjvZHbMV9jbKiua2rX9vKk
         E07n4TcrxqaM9CMb2A/+iQZ8jaKf2N3zRu4adEjuEkeOMigAXBJODXzwFqapK/MMr5DT
         9Or6pENCBPcrM07bNB68OjMaCPxNfOTJVIr32obBRZgNThZtO6iKP6IcCaoQ3um1ZDLk
         B4iA==
X-Gm-Message-State: AOJu0YzeCVWeVNpTSZePKlv5G9N683a3/HkYiCBbEwTD1XLD7d7iIA1y
	ORzOxCSH9MG+SqccPgE9ocgZ24vQ0PDp2pxH6FeZw31yH1lzJsqFaNq800x4ZQ==
X-Google-Smtp-Source: AGHT+IHiGbdMAYWSUDgcmPu4MmaSN8BSBu5t4rLFQERV/FQMs9/v4XOSAS1gf5RSEA0ohqVYKIqnAA==
X-Received: by 2002:a17:903:40cf:b0:203:6c70:b8f4 with SMTP id d9443c01a7336-2050c474437mr35380055ad.41.1724961887144;
        Thu, 29 Aug 2024 13:04:47 -0700 (PDT)
Received: from [172.16.118.100] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2051555140csm15105575ad.244.2024.08.29.13.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 13:04:46 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
Date: Fri, 30 Aug 2024 01:33:40 +0530
Subject: [PATCH v2 2/2] tests: Add test for append-property
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240830-append-v2-2-ec1e03f110ad@beagleboard.org>
References: <20240830-append-v2-0-ec1e03f110ad@beagleboard.org>
In-Reply-To: <20240830-append-v2-0-ec1e03f110ad@beagleboard.org>
To: d-gole@ti.com, lorforlinux@beagleboard.org, jkridner@beagleboard.org, 
 robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com, 
 Andrew Davis <afd@ti.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Robert Nelson <robertcnelson@gmail.com>
Cc: devicetree-compiler@vger.kernel.org, 
 Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1669; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=puZj4ip79OwkG9AFRmbN5OxPLhSWxfXG7GJUGgCvQsg=;
 b=owEBbQKS/ZANAwAIAQXO9ceJ5Vp0AcsmYgBm0NRSUjicHZTiJnu52hCNDSwwBnjBLW/QWLqUQ
 N7dGK2pBDCJAjMEAAEIAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCZtDUUgAKCRAFzvXHieVa
 dBoED/9ESGAuH/4zXKRq7UuXQyvEKxGrjPvWL16+ky+XjJM/pWmUhIm7fcs9JglZ7KKRIVtM2N2
 Sy+2yxQ0Bd5zdWpSwBnoobkqTqT+kM5D4SLGvx6C7qIAPv+WnhXcds/eQIx7UGX+fEO0JEk/fVW
 zmlMTCKwaTH5wFYRai3dxR+SZS59rrqtrUDspamrSn9y+aOnrYwgbLfHpRUijoo7s3Mk77W5qRm
 Q/1Pyhh+2O4U14J//HzhbvKnvxaYrMMY7286g6LHRsAXm/Qk/KYU6UnFy6LR68EhVJ13jGRRkUD
 cvypDGxzRs5POhcuYKezz1lzSSVgD8DxFD2yJFkNE/wi//Fa73EuhARAN8w761pi3z13121uqUG
 2DbgB5luRohf4aV84+IPvF3G4yvFoLv8d+HCphIPxDNW7WjmYH+un3Xg9pS4qJARNZ8fqlGnyto
 ZiisfFEf0rwvb8hsPu58h0fwW6wq21BXY4jdxhHDZMIPHt07lYrwElCf0oKF4fQYwZpevIIlwZh
 FphqOiVKo28s9X0oggI9kWw7bg9RIZWAEiWTQDAlsIzlrroHBBdrONfbva583oLZ3MDmOkBz7j8
 EM8WqKDtLNj34pa3lwZmIDKpR5HJvddNw68ZKkTYeccnQtO2o9bho+rRl5syFSLCJwQW37N/kQL
 gVtsIzpQWLTCVZg==
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
index 0000000..248d4ed
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
index 937b128..571980a 100755
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
2.46.0

