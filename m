Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1CB3C73C9;
	Thu,  9 Apr 2026 11:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775735703; cv=none; b=TsFQbYKl9wzAUJpNpWXQqIrNbwVd8/wdw0Jfv+UQCUAq0GV46Vw5+JpiWfxUID5kqbgY85ncT6aWeJFzDjZAwQyP/z2zYTjU0LnW8jTwigMtrkvaAueFlj6LnS54eW+ddgFpu68RHNKxixhoMJwCjbjQhPOs6wcz2bSymwZ7nHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775735703; c=relaxed/simple;
	bh=WlzaFeZff72ObXgtJ/TH8EF7ZB1ghVzKs9A8f2dv4Qc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ddh/MNbU4dWFPFm2tRX8X8v6JMHj+dFZKeaX7QnHivjQKS7Gc5yi71hm3pcVS9dYJKtvmvgmcfVPlCUzyj+t4scUPLWpXa6um6kMuI0WvLpeph5u76znzyKjid45xn3yR0fyxlGDQrRr1kpwK4PtPjItZxqS4YvF5Sdnob95kAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VQCTjIQ9; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VQCTjIQ9"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 38882C59F5F;
	Thu,  9 Apr 2026 11:55:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 88F0D5FDEB;
	Thu,  9 Apr 2026 11:55:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 99746104500B2;
	Thu,  9 Apr 2026 13:54:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775735699; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=cjcEgTR+EjskL2q0GwAsLq5wbNbj6oOnMcMqw7miUFM=;
	b=VQCTjIQ9gGuRf9GJ8xBtlHfS/AV9xkn1qDgWgIsZbZkfwrLfw+O8DG6Mzt0stf9+PKOO9U
	x9NCUEFWcrKLZvbU9Aa0/QvQen5pB/Hsxt8qNpK4oaBXVzRxlU4Yp5FKY/wQwG+5duKwdA
	AWQMHxU7USLiPGzD8eaH1XRNGDqvhJFSsBwMAbrWYPcOk4c7a9FaJhsFy6ejMrbYhHGiBG
	S+QcRuDe05B98uYrZTgj6CoVH+s2Ln13RsPh0TtVQOlGk4b4ft6W73ebhsqjjNY45uNIZo
	c9xxjVLBC1klGMEOttZHD8gCLP4lUUMkBlXYh/HoDsmFxpGTxMlxWrUibbYReg==
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
Subject: [PATCH v2 06/10] flattree: Handle unknown tags
Date: Thu,  9 Apr 2026 13:54:22 +0200
Message-ID: <20260409115426.352214-7-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260409115426.352214-1-herve.codina@bootlin.com>
References: <20260409115426.352214-1-herve.codina@bootlin.com>
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
---
 flattree.c                                 | 65 ++++++++++++++++++++--
 tests/run_tests.sh                         |  5 ++
 tests/unknown_tags_can_skip.dtb.dts.expect | 19 +++++++
 3 files changed, 84 insertions(+), 5 deletions(-)
 create mode 100644 tests/unknown_tags_can_skip.dtb.dts.expect

diff --git a/flattree.c b/flattree.c
index f3b698c..88dbfa7 100644
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
index f2855dd..d147011 100755
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
index 0000000..a11ee57
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
+			prop-int = <0x64023 0x64024>;
+		};
+	};
+};
-- 
2.53.0

