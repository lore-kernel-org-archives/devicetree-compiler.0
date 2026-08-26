Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6BD40EB9D;
	Wed, 26 Aug 2026 09:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787738018; cv=none; b=aD7swCh956lpJwg94jnw9NiLwj+5/GOSjTKbsRacOMQyhGt/aFdX/+qp7LyngSz0yme8csd/VEk+/bZHcAvAIekHXAXRGtPzZxkBvW9RT+gXwBmQP+WZGrQDJjzOFTZCBe2t98fNXutuSGBNDvFBDkLTVaBwWtsCdF0pyztz6GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787738018; c=relaxed/simple;
	bh=O0NUBMrXbm1LeInqs/4nkriarE+dfUKStPPehX8/fBU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a6REJLODFswJweCalJi4elWdbSJxD4vDJlir/j5k6hn1UbvDEKug2woCcrEYqpr5G+EaZqa0AkI/NYHPMiZE1wLVBgbrwwKqgFFe3ZINyhLBuUVfrNKOj2iRQldCLAtEk/58wK/086qQp8+aoWKjuE6il8phtmzfIXw8qwlivbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=z/KFvbDF; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="z/KFvbDF"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 771DC4E413C1;
	Wed, 26 Aug 2026 09:53:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4B91D604EC;
	Wed, 26 Aug 2026 09:53:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8569B11C7AD65;
	Wed, 26 Aug 2026 11:53:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787738014; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=5Iym/uSDZti+GCtanRVfiK99EXl+ir/YWctdAPVSdCM=;
	b=z/KFvbDFucRiz5BFCHuXy9xv4GzMY3TaAipX2Mi/4bZtI2TL9s4wi+hHATE1nihakAL1UV
	tQaTFind1QrhyCPK0oicOz8FGRq+c7+z504coveEzguUxVgfADz+PMqKwfKbJ8KNUnQpke
	8ukXTj/TFcEmTwMTo84MhBDstKdgVvQ72I1H06zGOWg6bORjCb0d55vngiCFR/vO+l5Onl
	CSBdEOUVGO3GhwhS3m2TRdkRmJDc/Axwf69tigA5Q54Nfw5XA7Dre5bVvO6lHwCY+lkXWV
	jn2mHmq0aCEDGE2gV1MVKSl6XPUtoBWGk+4libCzy0tSPh63o2TO24x8QDEwvw==
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	David Lechner <dlechner@baylibre.com>,
	Ayush Singh <ayush@beagleboard.org>,
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
Subject: [RFC PATCH v2 58/74] tests: metadata: Improve sort test to check for orphan nodes sorting
Date: Wed, 26 Aug 2026 11:49:27 +0200
Message-ID: <20260826094950.1088288-59-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826094950.1088288-1-herve.codina@bootlin.com>
References: <20260826094950.1088288-1-herve.codina@bootlin.com>
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
index 270c06db..df3c02ba 100644
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
index d5e22674..faca4f67 100644
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
index e523e209..3b690a53 100644
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
2.55.0

