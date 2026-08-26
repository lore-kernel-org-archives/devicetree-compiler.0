Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E6B3B71CE
	for <devicetree-compiler@vger.kernel.org>; Wed, 26 Aug 2026 08:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787733179; cv=none; b=GPdvx0zoBzMk6wq3fx0zIVwoByD77MvUNylp9qA2hLWIKq4EHYgw2Lwr1TMjLRR+ldG8jmtm89OXt5dltGd4C2wylK5+k6nb6pfl16PRW1ENPb6H0Ti3X+V0z2z1imMV2Z0WHdm/Nnc3ONK8BueA49BdBrJgxhVuXMmH/qCAx7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787733179; c=relaxed/simple;
	bh=QpN4qCEt7hYwfnpdO4a5K03B/9xVWyqMhVF9158lw10=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nwo+SDlXv0KWvwoXafSY0T/FRHrBNCsBIyUqZ99CPmnMNKmJAffeUnZjvIBBYs0QY6kxp918t4q9De0US78UEma/NBNhXevIhREjduznwk2RicGwufkErI39YcNb6I8ME8SPHnweLUmytWjxDheRZxIZr9wYAzrV3YbacSRpbNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=gsqEE0Sn; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="gsqEE0Sn"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 81EE21A1846;
	Wed, 26 Aug 2026 08:32:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4E78F604EC;
	Wed, 26 Aug 2026 08:32:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 655C511C7AC5A;
	Wed, 26 Aug 2026 10:32:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787733175; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=D7Zzba+aoynELITCEBt8J/Zswm9vFahDLREpmOs5caI=;
	b=gsqEE0Snv8tqiXD49byCdDSB/UMboSB2y+I9kDtXFJSMuOwchg0LUAs9O1t5CQMHZ2DRSH
	VpictovkXdMDS1WJdsRCupfQDrAlHSaZ52qHlbByE+RgJ4eku8v8DEYGXjrfmb0u+q29Tp
	u1Hh41TYaIntguvuOEkafs9bbD6U90aOMib4QdYG+HSEePh3PBKLz8WjYC9XKDIbMH27Cs
	MaxIjnPraGNawRaK+io8O6SF0jqwDrBCZ/hAgb5TR/gYOg76jnPJgBx62ouaXFxnRGqcGY
	rR6hp9Ot2q5oTadF0+PDCTo9HBqwfydJHE9GDmmKfx1HAvMhzHr1xR/Jo1AxLQ==
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
	Herve Codina <herve.codina@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v3 08/15] flattree: Handle unknown tags
Date: Wed, 26 Aug 2026 10:31:39 +0200
Message-ID: <20260826083146.304291-9-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826083146.304291-1-herve.codina@bootlin.com>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
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
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 flattree.c                                 | 65 ++++++++++++++++++++--
 tests/run_tests.sh                         |  5 ++
 tests/unknown_tags_can_skip.dtb.dts.expect | 19 +++++++
 3 files changed, 84 insertions(+), 5 deletions(-)
 create mode 100644 tests/unknown_tags_can_skip.dtb.dts.expect

diff --git a/flattree.c b/flattree.c
index f3b698c1..88dbfa7e 100644
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
+	case FDT_TAG_DATA_VARLEN:
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
index f3647e63..8fc23cb7 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -882,6 +882,11 @@ dtc_tests () {
 
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
index 00000000..2194025b
--- /dev/null
+++ b/tests/unknown_tags_can_skip.dtb.dts.expect
@@ -0,0 +1,19 @@
+/dts-v1/;
+
+/ {
+	prop-int = <0x3201>;
+	prop-str = "abcd";
+
+	subnode1 {
+		prop-int = <0x6401 0x6402>;
+	};
+
+	subnode2 {
+		prop-int1 = <0x64020 0x64021>;
+		prop-int2 = <0x32022>;
+
+		subsubnode {
+			prop-bool;
+		};
+	};
+};
-- 
2.55.0

