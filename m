Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F073396B71;
	Tue, 10 Feb 2026 17:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770744879; cv=none; b=rxgmASp0iswBohtt1uNwiuaVGQOyjoI5dg7B2GbyoVVVkK7SYi2aNwGa4sLz7hB7Cgg5wwTpKk374PQuvE1N7bkPmm4+inVj9BaUmSuIMXBsVuEarOCkHXc3dJgT13tkZmeiFPrXVZo+L3+7DeBUr2mZebxj7hbCqsbP9Gvufeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770744879; c=relaxed/simple;
	bh=mChCLV73SfDyjkx1FnS/Bp4AcikarcmzTUZ+U8IvJ0w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HTtyNiAgMmv/vDONJdDXReLcYPu+ihdchPhM/F1CQaNM+sGM5TicXysf1ZbxCvyS+KMxKZVSoyPr3/+JtrjHq09kKY6gxLpkzhKRTcXTajYHry1Nlqf5oUsdlgColtnHrH7Dnn4UwzCxMb50BGM69QyPLtvAVgzH/Zot1wudDfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VJmFcoWV; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VJmFcoWV"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6259DC8F455;
	Tue, 10 Feb 2026 17:34:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 03175606BD;
	Tue, 10 Feb 2026 17:34:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0420B10B9213C;
	Tue, 10 Feb 2026 18:34:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770744876; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=yTNPBv983V3G10hN3xMTv91meECHpLrvslxwBaJ5IF8=;
	b=VJmFcoWV9zBZznwDaBWZN7O5NnhudKSRVamYIcWSJKf1bbf5HtXBOT3/bU12BjgiHIMCcZ
	8kPrplPs7H8OWRQMkEW125lomkbSwWBrsWbK6t5n2+CDDj1p7wJqS8Ak3nXBOxIzhSwHbK
	SA0cWBTZskWQkcYO4CHAZzu/rijVnXREaMoOrxrmb6/T7OUJHXsLoqVD4sI3jM2EBKnWK3
	ejPWCD5u/mzxVgyBUZ55u6zc8LZAz0gKzF6elPH/36arr0wDEzIaCCVBamY2tng2Nf3H+f
	y5/6nFmIYoEtHFbZIhwK5buF4Ft732Db+z9mmBeSJCwWKrajig9S4WjyKpUmkg==
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
Subject: [RFC PATCH 11/15] flattree: Handle unknown tags
Date: Tue, 10 Feb 2026 18:33:39 +0100
Message-ID: <20260210173349.636766-12-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260210173349.636766-1-herve.codina@bootlin.com>
References: <20260210173349.636766-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The structured tag value definition introduced recently gives the
ability to ignore unknown tags without any error when they are read.

Handle those structured tag.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 flattree.c                                 | 65 ++++++++++++++++++++--
 tests/run_tests.sh                         |  5 ++
 tests/unknown_tags_can_skip.dtb.dts.expect | 19 +++++++
 3 files changed, 84 insertions(+), 5 deletions(-)
 create mode 100644 tests/unknown_tags_can_skip.dtb.dts.expect

diff --git a/flattree.c b/flattree.c
index f3b698c..23813e2 100644
--- a/flattree.c
+++ b/flattree.c
@@ -579,7 +579,8 @@ static void flat_read_chunk(struct inbuf *inb, void *p, int len)
 	if ((inb->ptr + len) > inb->limit)
 		die("Premature end of data parsing flat device tree\n");
 
-	memcpy(p, inb->ptr, len);
+	if (p)
+		memcpy(p, inb->ptr, len);
 
 	inb->ptr += len;
 }
@@ -604,6 +605,61 @@ static void flat_realign(struct inbuf *inb, int align)
 		die("Premature end of data parsing flat device tree\n");
 }
 
+static bool flat_skip_unknown_tag(struct inbuf *inb, uint32_t tag)
+{
+	uint32_t lng;
+
+	if (!(tag & FDT_TAG_STRUCTURED) || !(tag & FDT_TAG_SKIP_SAFE))
+		return false;
+
+	switch (tag & FDT_TAG_DATA_MASK) {
+	case FDT_TAG_DATA_NONE:
+		break;
+
+	case FDT_TAG_DATA_1CELL:
+		flat_read_word(inb);
+		break;
+
+	case FDT_TAG_DATA_2CELLS:
+		flat_read_word(inb);
+		flat_read_word(inb);
+		break;
+
+	case FDT_TAG_DATA_LNG:
+		/* Get the length */
+		lng = flat_read_word(inb);
+
+		/* Skip the following length bytes */
+		flat_read_chunk(inb, NULL, lng);
+
+		flat_realign(inb, sizeof(uint32_t));
+		break;
+	}
+
+	return true;
+}
+
+static uint32_t flat_read_tag(struct inbuf *inb)
+{
+	uint32_t tag;
+
+	do {
+		tag = flat_read_word(inb);
+		switch (tag) {
+		case FDT_BEGIN_NODE:
+		case FDT_END_NODE:
+		case FDT_PROP:
+		case FDT_NOP:
+		case FDT_END:
+			return tag;
+		default:
+			break;
+		}
+	} while (flat_skip_unknown_tag(inb, tag));
+
+	die("Cannot skip unknown tag 0x%08x\n", tag);
+}
+
 static const char *flat_read_string(struct inbuf *inb)
 {
 	int len = 0;
@@ -750,7 +806,7 @@ static struct node *unflatten_tree(struct inbuf *dtbuf,
 		struct property *prop;
 		struct node *child;
 
-		val = flat_read_word(dtbuf);
+		val = flat_read_tag(dtbuf);
 		switch (val) {
 		case FDT_PROP:
 			if (node->children)
@@ -905,14 +961,13 @@ struct dt_info *dt_from_blob(const char *fname)
 
 	reservelist = flat_read_mem_reserve(&memresvbuf);
 
-	val = flat_read_word(&dtbuf);
-
+	val = flat_read_tag(&dtbuf);
 	if (val != FDT_BEGIN_NODE)
 		die("Device tree blob doesn't begin with FDT_BEGIN_NODE (begins with 0x%08x)\n", val);
 
 	tree = unflatten_tree(&dtbuf, &strbuf, "", flags);
 
-	val = flat_read_word(&dtbuf);
+	val = flat_read_tag(&dtbuf);
 	if (val != FDT_END)
 		die("Device tree blob doesn't end with FDT_END\n");
 
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index b69b61b..98fa4f4 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -881,6 +881,11 @@ dtc_tests () {
 
     # Tests for overlay/plugin generation
     dtc_overlay_tests
+
+    # Tests with "unknown tags"
+    run_dtc_test -I dtb -O dts -o unknown_tags_can_skip.dtb.dts unknown_tags_can_skip.dtb
+    base_run_test check_diff unknown_tags_can_skip.dtb.dts "$SRCDIR/unknown_tags_can_skip.dtb.dts.expect"
+    run_wrap_error_test $DTC -I dtb -O dts -o unknown_tags_no_skip.dtb.dts unknown_tags_no_skip.dtb
 }
 
 cmp_tests () {
diff --git a/tests/unknown_tags_can_skip.dtb.dts.expect b/tests/unknown_tags_can_skip.dtb.dts.expect
new file mode 100644
index 0000000..94fa6d6
--- /dev/null
+++ b/tests/unknown_tags_can_skip.dtb.dts.expect
@@ -0,0 +1,19 @@
+/dts-v1/;
+
+/ {
+	prop-int = <0x01>;
+	prop-str = "abcd";
+
+	subnode1 {
+		prop-int = <0x01 0x02>;
+	};
+
+	subnode2 {
+		prop-int1 = <0x01 0x02>;
+		prop-int2 = <0x01 0x02>;
+
+		subsubnode {
+			prop-int = <0x01 0x02>;
+		};
+	};
+};
-- 
2.52.0

