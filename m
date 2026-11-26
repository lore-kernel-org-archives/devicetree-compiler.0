Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692276;
	b=D2okMKxlAFCyE8ijPiDjLLNBitmoPCaocxn1gvyecb+SaTDcqEUAi+RUx3JB8gAkcqgC
	 +Ksu/7zOIYn0L6LaUx5BidyhXzCjzpL5F10cVa6gOEBpEWUpAFNnzKYgrNz4+yILvXyZA
	 y5BhFQzDfmkjqAHUmPamZu4WJURzVl3yzMkGD1h8pKU2OWKP3slBuZ/blGuh7T4TiEqbO
	 TcGnYDYTmHwKL5CT7hLObkiav83/6JTNCulfPa8GWypvgSoXEdMdjs9rkbI4LVaEEY6XN
	 +Xz9hUx3el+iB+6SaVUbVH7CDzGPEnjLEYNml9+SqXQekg+hKS/HkWwyqdOfX+zgvcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692276;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=UVxlk6g5JbI0vlkgcbA1fCwyIz587P7XOysaUBcQn9c=;
	b=ZZ1bIIzKk9dJIZAmn2eh1RwwN8mO68AfOT9y0MNtKuLd2qphz2wuCxb+dhqW2ffuI42v
	 NAiBNAtH+YawssL5xsw/ETRg1t3wOTHyAFQyp/2ay2nPG/nZDuCG53sG79oQ4vKnk6R2/
	 RjO/8UzudxL7OythHV2u8VWpmUsNYP9uFIcrExzmzagB9WFT0L2eKUXd+RizyjSOQJsAa
	 be4Xhz/AYXbQryxSHJJNTkvOlO4ayKjNiQeV6uWZULhUxtLMr0ru15oLCY+LM+n8U2Fj4
	 8f4YwVabW2PNFiWcmBQqzV87Js6XhesPEEN4Jf1trhnwcyApOYV7aU8aFiaWNL6mk5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Kjv0Jagu;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB92606A333;
	Thu, 26 Nov 2026 11:24:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEB92606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Kjv0Jagu
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id F2EDEC2B9CC;
	Thu, 26 Nov 2026 11:24:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B034E60237;
	Thu, 26 Nov 2026 11:24:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CA04C11E6B363;
	Thu, 26 Nov 2026 12:24:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795692273; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=UVxlk6g5JbI0vlkgcbA1fCwyIz587P7XOysaUBcQn9c=;
	b=Kjv0JaguTUr6OIJ6SNTvNnheU/6jE3V6VDyd5Ky8UbjSGB//sjnKppSXk5jBMx6MqBMYE8
	XNRfDw5kVLrkE2NAqI6BEhe6lrqqMqx+YIDZHBBMI+pxZcU2z2vcqCHfsMvlQbVOOKuaGI
	zaPH4htqDlHraF2d8aiafq129lMuan79LEgWYLA+3y3S6VZrGzYMreOb4WAMUhCnqdnWde
	zWGhSf1EPXYRQNQc4pS/pE5Po+2PL2pmtffEF/eFBYz7DdrXp2ttSmC3rv4Pbn+aHEzYb7
	C5eQnaJtOwVGOHKswU9V+Fh8cPRruXHyFR3a0bKms3TvnN/ef5e5Tyi86rn+dQ==
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Frank Li <Frank.Li@nxp.com>,
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
Subject: [PATCH v4 17/22] flattree: Handle unknown tags
Date: Thu, 26 Nov 2026 12:22:34 +0100
Message-ID: <20261126112239.636284-18-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126112239.636284-1-herve.codina@bootlin.com>
References: <20261126112239.636284-1-herve.codina@bootlin.com>
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The structured tag value definition introduced recently gives the
ability to ignore unknown tags without any error when they are read.

Handle those structured tags.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 flattree.c         | 69 +++++++++++++++++++++++++++++++++++++++++++---
 tests/run_tests.sh |  4 +++
 2 files changed, 69 insertions(+), 4 deletions(-)

diff --git a/flattree.c b/flattree.c
index b7d81d60..90ff62ae 100644
--- a/flattree.c
+++ b/flattree.c
@@ -580,7 +580,8 @@ static void flat_read_chunk(struct inbuf *inb, void *p, int len)
 	if ((inb->ptr + len) > inb->limit)
 		die("Premature end of data parsing flat device tree\n");
 
-	memcpy(p, inb->ptr, len);
+	if (p)
+		memcpy(p, inb->ptr, len);
 
 	inb->ptr += len;
 }
@@ -605,6 +606,66 @@ static void flat_realign(struct inbuf *inb, int align)
 		die("Premature end of data parsing flat device tree\n");
 }
 
+static void flat_read_structured_tag_data(struct inbuf *inb, uint32_t tag,
+					  struct inbuf *databuf)
+{
+	uint32_t len;
+
+	len = FDT_TAG_DLEN_GET(tag);
+	if (len != FDT_TAG_DLEN_VARLEN) {
+		len *= sizeof(fdt32_t);
+	} else {
+		/* Get the length */
+		len = flat_read_word(inb);
+	}
+
+	/*
+	 * Put the data (len bytes) in databuf if provided.
+	 * No need to check the validity of the inb ptr + len against the inb
+	 * limit. This will be check in the following chunk read.
+	 */
+	if (databuf)
+		inbuf_init(databuf, inb->ptr, inb->ptr + len);
+
+	/* Skip the following data (len bytes + padding) from inb */
+	if (len) {
+		flat_read_chunk(inb, NULL, len);
+		flat_realign(inb, sizeof(uint32_t));
+	}
+}
+
+static bool flat_skip_unknown_tag(struct inbuf *inb, uint32_t tag)
+{
+	if (!FDT_TAG_IS_SKIPPABLE(tag))
+		return false;
+
+	/* Read tag related data */
+	flat_read_structured_tag_data(inb, tag, NULL);
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
@@ -754,7 +815,7 @@ static struct node *unflatten_tree(struct inbuf *dtbuf,
 		struct property *prop;
 		struct node *child;
 
-		val = flat_read_word(dtbuf);
+		val = flat_read_tag(dtbuf);
 		switch (val) {
 		case FDT_PROP:
 			if (node->children)
@@ -911,7 +972,7 @@ struct dt_info *dt_from_blob(const char *fname)
 
 	/* Skip possible FDT_NOP available before the root node */
 	do {
-		val = flat_read_word(&dtbuf);
+		val = flat_read_tag(&dtbuf);
 	} while (val == FDT_NOP);
 	if (val != FDT_BEGIN_NODE)
 		die("Device tree blob doesn't begin with FDT_BEGIN_NODE (begins with 0x%08x)\n", val);
@@ -920,7 +981,7 @@ struct dt_info *dt_from_blob(const char *fname)
 
 	/* Skip possible FDT_NOP available before FDT_END */
 	do {
-		val = flat_read_word(&dtbuf);
+		val = flat_read_tag(&dtbuf);
 	} while (val == FDT_NOP);
 	if (val != FDT_END)
 		die("Device tree blob doesn't end with FDT_END\n");
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 97f5a50e..5334a9b4 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -1011,6 +1011,10 @@ dtc_tests () {
 
     # Tests for overlay/plugin generation
     dtc_overlay_tests
+
+    # Tests with "unknown tags"
+    run_dtc_test -I dtb -O dtb -o unknown_tags_can_skip.dtb.dtb unknown_tags_can_skip.dtb
+    run_test dtbs_equal_ordered --noskip-nop unknown_tags_can_skip.dtb.dtb unknown_tags_removed.dtb
 }
 
 cmp_tests () {
-- 
2.56.1

