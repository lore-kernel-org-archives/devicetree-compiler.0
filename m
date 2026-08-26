Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D823B71B8;
	Wed, 26 Aug 2026 08:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787733158; cv=none; b=hvQJeXsqcpJL7y/PYmVwKHJxeCVSTUSozVsC7aHvXgYgMnqqa7GzxTFdXfkjK5AJqaJiFyg8yUjWLJDnQmV2rMIbR291q8NfVOVj49RB01hswR62ET3aolhofJhAgIQXSy74RV51uF2uSYS8yWo+lekb3cqVMGi2b1QVTxiQ9QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787733158; c=relaxed/simple;
	bh=n2QIIBZjmbgnupjMVzE5oPOSGKv45iKI1Fovz/8xFxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DcUjvhvEvm63ipZ7kKTtSt9sWUpNXW8SkjAitgPaMHPOlIrV9gNt9dR3dtPBYyd/WoD6cW3Pmc/JTbPHgL8g+lpl/6z1pcQl0H9igrz/xBOaCSzXEQfGethL9kITkbb1rTHdkaaqvOlFMf/I8ndconqPkstqcr/6aYCRwf6Uq1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=yyFoxvW7; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="yyFoxvW7"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7DC884E413BC;
	Wed, 26 Aug 2026 08:32:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4FC8E604EC;
	Wed, 26 Aug 2026 08:32:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B344C11C7AC4A;
	Wed, 26 Aug 2026 10:32:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787733149; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=ijfJDCYjmaY3mHI9qGkrNyCnSe01wkhGYj63FXlvkY8=;
	b=yyFoxvW7Y+sFzLPJ39LN4/vqqyWGqjftk2Dva0MsKO7a7yI+xdGJ/lHTgDnhqJydKl5szz
	3iojsG5tKCrzZbtC4Og6kj9xp61LMTGvQp0o2i7N6SjnO2IpAIU4ExXGyhlXWNJfM6fyRN
	c15O1qXC4g5jF9DHtFNpZwQ6G4uJ6I4cdjO7edh9e7QqnGslQSV8N4ubzTiI3FiLJEqQ1P
	rrsZzNN7Ldbjulu/xH23Bs9Rn2qWY6XRjxbVYcsplpYXObvK48v+8MrqcQNpBRBDT/aDWw
	CdpufzonS/vFOLUDAOFGIEMITCOqFfFzFknqMzRCfJhXcJ3+DAiNPdLv/7HdwQ==
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
Subject: [PATCH v3 01/15] fdtget: Use libfdt iterators instead of open coded loops
Date: Wed, 26 Aug 2026 10:31:32 +0200
Message-ID: <20260826083146.304291-2-herve.codina@bootlin.com>
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

fdtget uses directly fdt_{first,next}_property_offset() with a while(1)
loop to iterate over node properties.

It also uses the low level primitive fdt_next_tag() with custom tags,
level and depth handling to iterates over subnodes.

It is worth noting that FDT_NOP can be returned by fdt_next_tag() and
this tag is not taken into account in the fdtget open coded loop. This
will lead to an incorrect error if a FDT_NOP tag is encountered.

libfdt provides iterators to iterate over node properties and subnodes.
The subnode iterator provided by libfdt is robust against FDT_NOP tags
and will be robust in the future when new tags are introduced.

Replace fdtget open coded loops by iterators provided by libfdt and
designed to perform those operations.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 fdtget.c | 73 ++++++++++++++++++--------------------------------------
 1 file changed, 23 insertions(+), 50 deletions(-)

diff --git a/fdtget.c b/fdtget.c
index dd709854..c6169691 100644
--- a/fdtget.c
+++ b/fdtget.c
@@ -138,21 +138,20 @@ static int show_data(struct display_info *disp, const char *data, int len)
 static int list_properties(const void *blob, int node)
 {
 	const char *name;
+	const void *p;
 	int prop;
 
-	prop = fdt_first_property_offset(blob, node);
-	do {
-		/* Stop silently when there are no more properties */
-		if (prop < 0)
-			return prop == -FDT_ERR_NOTFOUND ? 0 : prop;
-		fdt_getprop_by_offset(blob, prop, &name, NULL);
-		if (name)
+	fdt_for_each_property_offset(prop, blob, node) {
+		p = fdt_getprop_by_offset(blob, prop, &name, NULL);
+		if (p && name)
 			puts(name);
-		prop = fdt_next_property_offset(blob, prop);
-	} while (1);
-}
+	}
 
-#define MAX_LEVEL	32		/* how deeply nested we will go */
+	if ((prop < 0) && (prop != -FDT_ERR_NOTFOUND))
+		return prop;
+
+	return 0;
+}
 
 /**
  * List all subnodes in a node, one per line
@@ -163,47 +162,21 @@ static int list_properties(const void *blob, int node)
  */
 static int list_subnodes(const void *blob, int node)
 {
-	int nextoffset;		/* next node offset from libfdt */
-	uint32_t tag;		/* current tag */
-	int level = 0;		/* keep track of nesting level */
 	const char *pathp;
-	int depth = 1;		/* the assumed depth of this node */
-
-	while (level >= 0) {
-		tag = fdt_next_tag(blob, node, &nextoffset);
-		switch (tag) {
-		case FDT_BEGIN_NODE:
-			pathp = fdt_get_name(blob, node, NULL);
-			if (level <= depth) {
-				if (pathp == NULL)
-					pathp = "/* NULL pointer error */";
-				if (*pathp == '\0')
-					pathp = "/";	/* root is nameless */
-				if (level == 1)
-					puts(pathp);
-			}
-			level++;
-			if (level >= MAX_LEVEL) {
-				printf("Nested too deep, aborting.\n");
-				return 1;
-			}
-			break;
-		case FDT_END_NODE:
-			level--;
-			if (level == 0)
-				level = -1;		/* exit the loop */
-			break;
-		case FDT_END:
-			return 1;
-		case FDT_PROP:
-			break;
-		default:
-			if (level <= depth)
-				printf("Unknown tag 0x%08X\n", tag);
-			return 1;
-		}
-		node = nextoffset;
+	int subnode;
+
+	fdt_for_each_subnode(subnode, blob, node) {
+		pathp = fdt_get_name(blob, subnode, NULL);
+		if (pathp == NULL)
+			pathp = "/* NULL pointer error */";
+		if (*pathp == '\0')
+			pathp = "/";	/* root is nameless */
+		puts(pathp);
 	}
+
+	if (subnode < 0 && (subnode != -FDT_ERR_NOTFOUND))
+		return subnode;
+
 	return 0;
 }
 
-- 
2.55.0

