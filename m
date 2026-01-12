Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C728336AB6D
	for <devicetree-compiler@vger.kernel.org>; Mon, 12 Jan 2026 14:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227721; cv=none; b=UmGwyjDeSkGzIeX5msSAakiZ2p50DUIEpN5Pi912ILMceX7FwHaKh+mRhugH+ro9g9BSARL3XMQ5jH0Td20krSTfWTkDq6r7iKFhsC0x5TuLqf5F6XnqyvK037VYdKO9VioAYQjkQG+dlUdkdUWsI+Hv+WxxIyLjU2/7Df+2YDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227721; c=relaxed/simple;
	bh=ukav0csfGSYhTySJmPXHNDEiPKRwkJZCNFtIAOUkmi8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O/SUg4wONE/8gG8DrEI9FWssdr/ODAtnXgrAAlgla64Um9+Pi+W4EB5xWKkvT3czqkWZSkZB1Yl6LryTl3luuZGcIhpTICQbQSayiyGFvph9FPShxQAF6Z41Mx2tpDikf0XpNxoiW6gACR4QPjnhfcJM+uN+wn1iEkrzJnaVVQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=2S9yzatz; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="2S9yzatz"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 72DA41A2815;
	Mon, 12 Jan 2026 14:21:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4397A606FA;
	Mon, 12 Jan 2026 14:21:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D6DED103C9260;
	Mon, 12 Jan 2026 15:21:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227717; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=SCPDW1Fd99/HH0hpXZlq0g01YveqESOf+XNqKOwlufg=;
	b=2S9yzatzpGeiD2XvkKJeGBcf+5CxcQf0O24l+LQkIjakRP6k3Kmi+x0HnGB1t+uz+LAkeH
	uyscI1CWo/2zkRx64RVpX51KSiR16ow/fyG9niu0hT7mDli96o7R3gQSJYbkmYxlyStJ6r
	lBsu/aRD71aT/z2umqtiK+Bc0x4GqSpjnWgQE4mNX8uFt/0xXF/UjHY/YNWc4xvuBFYuQT
	ZMMfZthtbrBVTfqowLrLFhv85uB/s9deBUH0jmHEUSAk8EIumJFd5Hx5KOweu3Vkj9zCUR
	hrhySUBNGwJcta/adetiSyoSmbRHq/x+HVOHm8dmghXLSPLDw3f1o3W4qIp1Yg==
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Ayush Singh <ayush@beagleboard.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree-compiler@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree-spec@vger.kernel.org,
	Hui Pu <hui.pu@gehealthcare.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>
Subject: [RFC PATCH 63/77] tests: metadata: Improve sort test to check for orphan nodes sorting
Date: Mon, 12 Jan 2026 15:19:53 +0100
Message-ID: <20260112142009.1006236-64-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112142009.1006236-1-herve.codina@bootlin.com>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

dtc is able to sort orphan nodes when the --sort option is used.

Improve the metadata sort test to perform a check for this feature.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 tests/metadata_sort.dtb.dts.expect | 39 ++++++++++++++++++++++++++++++
 tests/metadata_sort.dtb.expect     | 30 +++++++++++++++++++++++
 tests/metadata_sort.dts            | 33 +++++++++++++++++++++++++
 3 files changed, 102 insertions(+)

diff --git a/tests/metadata_sort.dtb.dts.expect b/tests/metadata_sort.dtb.dts.expect
index 270c06d..df3c02b 100644
--- a/tests/metadata_sort.dtb.dts.expect
+++ b/tests/metadata_sort.dtb.dts.expect
@@ -20,3 +20,42 @@
 		phandle = <0x01>;
 	};
 };
+
+&abc {
+	prop-a = "a";
+	prop-b = "b";
+
+	node-a {
+		prop = <0x01>;
+	};
+
+	node-b {
+		prop = <0x02>;
+	};
+
+	node-c {
+		prop = <0x03>;
+	};
+};
+
+&de1 {
+	prop-a = "a";
+	prop-b = "b";
+
+	node-a {
+		prop = <0x01>;
+	};
+
+	node-b {
+		prop = <0x02>;
+	};
+
+	node-c {
+		prop = <0x03>;
+	};
+};
+
+&de2 {
+	prop-a = "a";
+	prop-b = "b";
+};
diff --git a/tests/metadata_sort.dtb.expect b/tests/metadata_sort.dtb.expect
index 0dacab7..47002fe 100644
--- a/tests/metadata_sort.dtb.expect
+++ b/tests/metadata_sort.dtb.expect
@@ -16,3 +16,33 @@
 // [FDT_IMPORT_SYM] 'abc' (foo,bar)
 // [FDT_IMPORT_SYM] 'de1' (foo,bar)
 // [FDT_IMPORT_SYM] 'de2' (foo,bar)
+&abc {
+    prop-a = "a";
+    prop-b = "b";
+    node-a {
+        prop = <0x00000001>;
+    };
+    node-b {
+        prop = <0x00000002>;
+    };
+    node-c {
+        prop = <0x00000003>;
+    };
+};
+&de1 {
+    prop-a = "a";
+    prop-b = "b";
+    node-a {
+        prop = <0x00000001>;
+    };
+    node-b {
+        prop = <0x00000002>;
+    };
+    node-c {
+        prop = <0x00000003>;
+    };
+};
+&de2 {
+    prop-a = "a";
+    prop-b = "b";
+};
diff --git a/tests/metadata_sort.dts b/tests/metadata_sort.dts
index e523e20..3b690a5 100644
--- a/tests/metadata_sort.dts
+++ b/tests/metadata_sort.dts
@@ -23,3 +23,36 @@
 		/export/ a: &node_b;
 	};
 };
+
+&de2 {
+	prop-b = "b";
+	prop-a = "a";
+};
+
+&abc {
+	prop-b = "b";
+	prop-a = "a";
+	node-b {
+		prop = <2>;
+	};
+	node-a {
+		prop = <1>;
+	};
+	node-c {
+		prop = <3>;
+	};
+};
+
+&de1 {
+	prop-b = "b";
+	prop-a = "a";
+	node-b {
+		prop = <2>;
+	};
+	node-a {
+		prop = <1>;
+	};
+	node-c {
+		prop = <3>;
+	};
+};
-- 
2.52.0

