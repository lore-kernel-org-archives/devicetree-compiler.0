Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692234;
	b=gMhSd7ihQTpWFDzFTOyCUa3mYXwjAE9kbrnZXYXh0DOwsm+Dc2xSGG3PJdrCFa6xqowC
	 zpDn8p1nQ7ufYhsc2LXf0/00gk0CWVRHVu/NnCHsH2gns3JNrjc67AEwmcQenvXHUgEvl
	 Wzvd/JTCLW0E9+G2Nvi+/ukpFfGjGOzi5KFliDGUWVgmuc3VdIpDmbJvhl8HlGCC+S0ub
	 5qLOXcCDCDQPyjmp67L3mOuzTpLloFTQvtiwfwUSVIYI21n1EH4X6uccffNkvurxrs8Eg
	 zqtMW+CLdR0WuyGkm7unKj84YQ1BNALqjySI2I6/c3YpCqJYWWAi4O6FKZmUja7RWAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692234;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=s2EtH40azXOiVVPp8DW/wpG+i0QUJgTJ57XpXp+fCSw=;
	b=pwAU91Q/fg7Nbeai22MWklwgg4Kot579Gg4u+mUtg4k/wzacL2nV27Q+BNfAP9ouZcC9
	 5cwk+LhVGxV6XWca/SInW+ZPR8Q+sETjKQDgTBLmyb0sTW7+R2wUwBoXolmdYqgkGLFcJ
	 YoiAGx0ppKWyU+bJFeCHcl6pSU6cQ3UThRXm2hnlENwZB1RNO7vQmq+8xRSo6+OmabsSS
	 V7PLHEOfNoH2oaN4zL499qSRo7+RqHcAUzXqrWe7ontuXNi5Gh7UqJSaKCMPdt11Hvn06
	 fX6sAzMTj6RRU70dGpWw4xFLUy23QuXshbrd3a0gNmSfspW8OaMJEog4ysGhI9aJ4eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=W8jIZRRw;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601F2606A321;
	Thu, 26 Nov 2026 11:23:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 601F2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=W8jIZRRw
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 44E7BC2B9C9;
	Thu, 26 Nov 2026 11:24:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F0A4C60237;
	Thu, 26 Nov 2026 11:23:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5CFE011E6B361;
	Thu, 26 Nov 2026 12:23:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795692227; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=s2EtH40azXOiVVPp8DW/wpG+i0QUJgTJ57XpXp+fCSw=;
	b=W8jIZRRwDgc8bJXgmk1G6lztz6kE8vENPn2tAKCgbj7L67WRsorMLT/k5rfvFQ6dqGK/xJ
	eiaEF4bREYlfzHI7Kaw2sw+D9Ibhp6rxGT3bTUZdw/+654fdpcxSPZLtys70RUWMEKn0hM
	0jVBdCS63A0AHCDcwleuyQ3MPZQd718y9OTDn2+ked/pnICly5CixhUrldEpZOzpgBhz0p
	dXXxxiP2ag7ci9PAQ+iC6XNxlVn0w+TQkBv/bZT/YSu49UlJsePsZOPTVGK29NX7b+mYM+
	NHW91vUIwGYSWqPIi5jbye4/lbDoHF3MALsgTMmnZYzof9fHX/IJ6K81YD/sog==
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
Subject: [PATCH v4 08/22] tests: treegen: Introduce tree harness
Date: Thu, 26 Nov 2026 12:22:25 +0100
Message-ID: <20261126112239.636284-9-herve.codina@bootlin.com>
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

Tree harnesses allow grouping tree generation.

Harnesses and related tree generation can be moved to specific source
files exporting only the harness to main().

treegen.c will be split in that direction, and the introduced harness is
a needed feature for this split.

Apart from some display in main(), no functional changes.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 tests/treegen.c | 68 +++++++++++++++++++++++++++++++++++--------------
 1 file changed, 49 insertions(+), 19 deletions(-)

diff --git a/tests/treegen.c b/tests/treegen.c
index 2321a6c3..f210a525 100644
--- a/tests/treegen.c
+++ b/tests/treegen.c
@@ -789,13 +789,28 @@ static struct buf make_bad_proplen(void)
 	return b;
 }
 
-/* Tree table and main */
-
-static struct {
+/* Tree generator */
+struct treegen {
 	struct buf (*generator)(void);
 	const char *filename;
-} trees[] = {
+};
 #define TREE(name)	{ make_##name, #name ".dtb" }
+
+/* Tree harness */
+struct treeharness {
+	const char *name;
+	const struct treegen *tab_treegen;
+	unsigned int nb_treegen;
+};
+#define TREEHARNESS(name_, tab_treegen_) \
+	{ \
+		.name = name_, \
+		.tab_treegen = tab_treegen_, \
+		.nb_treegen = ARRAY_SIZE(tab_treegen_), \
+	}
+
+/* Tree base generators */
+static const struct treegen treegens[] = {
 	TREE(test_tree1),
 	TREE(bad_node_char), TREE(bad_node_format), TREE(bad_prop_char),
 	TREE(ovf_size_strings),
@@ -808,9 +823,17 @@ static struct {
 	TREE(bad_proplen),
 };
 
+/* Tree base harness */
+struct treeharness treeharness_base = TREEHARNESS("base", treegens);
+
+/* Tree harnesses */
+static const struct treeharness *tab_treeharness[] = {
+	&treeharness_base,
+};
+
 int main(int argc, char *argv[])
 {
-	unsigned int i;
+	unsigned int i, j;
 
 	if (argc != 2) {
 		fprintf(stderr, "Usage: %s <output-dir>\n", argv[0]);
@@ -822,24 +845,31 @@ int main(int argc, char *argv[])
 		return 1;
 	}
 
-	for (i = 0; i < ARRAY_SIZE(trees); i++) {
-		struct buf b = trees[i].generator();
-		const char *filename = trees[i].filename;
-		int fd;
-		ssize_t ret;
+	for (i = 0; i < ARRAY_SIZE(tab_treeharness); i++) {
+		const struct treeharness *treeharness = tab_treeharness[i];
+
+		printf("Harness \"%s\"\n", treeharness->name);
+
+		for (j = 0; j < treeharness->nb_treegen; j++) {
+			const struct treegen *treegen = &treeharness->tab_treegen[j];
+			struct buf b = treegen->generator();
+			const char *filename = treegen->filename;
+			int fd;
+			ssize_t ret;
 
-		printf("Tree \"%s\", %zu bytes\n", filename, b.cursor);
+			printf("  Tree \"%s\", %zu bytes\n", filename, b.cursor);
 
-		fd = open(filename, O_WRONLY | O_CREAT | O_TRUNC, 0666);
-		if (fd < 0)
-			perror("open()");
+			fd = open(filename, O_WRONLY | O_CREAT | O_TRUNC, 0666);
+			if (fd < 0)
+				perror("open()");
 
-		ret = write(fd, b.data, b.cursor);
-		if (ret < 0 || (size_t)ret != b.cursor)
-			perror("write()");
+			ret = write(fd, b.data, b.cursor);
+			if (ret < 0 || (size_t)ret != b.cursor)
+				perror("write()");
 
-		close(fd);
-		free(b.data);
+			close(fd);
+			free(b.data);
+		}
 	}
 
 	return 0;
-- 
2.56.1

