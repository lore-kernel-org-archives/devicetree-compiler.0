Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DEB3D79E2;
	Wed, 26 Aug 2026 09:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787737905; cv=none; b=fRvcOhwGdfsj6A3Qx5y9L1hgTV1OjiVizsUN5aLiAJc8JPQoDk0JZJSb48bAmdhH2Ps4LtzK6VFay5SBq/xtoWquIxqg32ObZyS3k9hQpf6TOQ19LLKX+MYF753tZl7eYLcPc7/inp7OvYXEMs7EyKP+ykzo8+qeLNiwfkS7Vv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787737905; c=relaxed/simple;
	bh=sAwQnoO3xM4ObRwH/lj6Lqi6FMlOxwsGNoedO0ELfIs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I7iG+3M8bV6U/9hcL0emFQ/tm0gYZ0tEEecXGhOfNZQwgCheq1YYDK/NXov5Lvxn7gWPkT3t1uchlpqzQI8U6nk00w5o6OlZNGM2nkI3ZRrk/lw5edqEJ7Ytv6nGfYT1vEjhYhhQla+7LPatli4XfeceyrlprXncpfBRJvWPbpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=A1XSdnuM; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="A1XSdnuM"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C6AD34E413BF;
	Wed, 26 Aug 2026 09:51:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9B9CC604EC;
	Wed, 26 Aug 2026 09:51:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 811DB11C780F5;
	Wed, 26 Aug 2026 11:51:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787737900; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=2IAT60NMhRbnjs/hFwW1xL6sDToXowEgmrekbo2BisE=;
	b=A1XSdnuMglJuFilGL5GlviVqhFn3B1MLgxHLUJ77r6gCFrg23RAtEfitvfc55eT1XZCWFb
	nTpADUOyeRUWhA4f+HVIzoDQyrFUkEQ2dzqpTOe53oDzdyxaNkuxu084Uwqg9Ww5I3V8iQ
	Z3oMx61SN6VKn8ylNhmVchGuTcwd8HIRsFoda11hdXQvLQ+OmVOtrHml9RmDmaiXOAKYLi
	lgr9czzONeHqBm4/WTmu9rbFmv8bZGqeffuEcOSaNS3zX8Wra6ZZrMG3YHsRtJUoUkhBJW
	4ccifQEF21fGepMQ67ljPf/dnTNJU8ShyDRnOX3HHGnI4mTarHjMlMFTGTf/bw==
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
Subject: [RFC PATCH v2 19/74] dtc: Add export symbols (/export/ keyword) in generated dts file
Date: Wed, 26 Aug 2026 11:48:48 +0200
Message-ID: <20260826094950.1088288-20-herve.codina@bootlin.com>
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

The export symbols (/export/ keyword) parsing from a dts file is
supported.

Add the support for this keyword in the dts file generation.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 treesource.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/treesource.c b/treesource.c
index 9f6cf92d..a7228f60 100644
--- a/treesource.c
+++ b/treesource.c
@@ -370,6 +370,7 @@ static void write_propval(FILE *f, struct property *prop)
 
 static void write_tree_source_node(FILE *f, struct node *tree, int level)
 {
+	struct symbol *exportsym;
 	struct property *prop;
 	struct node *child;
 	struct label *l;
@@ -399,6 +400,18 @@ static void write_tree_source_node(FILE *f, struct node *tree, int level)
 		fprintf(f, "%s", prop->name);
 		write_propval(f, prop);
 	}
+
+	if (tree->exportsymlist)
+		fprintf(f, "\n");
+	for_each_symbol(tree->exportsymlist, exportsym) {
+		write_prefix(f, level+1);
+		fprintf(f, "/export/ %s: ", exportsym->name);
+		if (exportsym->ref[0] == '/')
+			fprintf(f, "&{%s};\n", exportsym->ref);
+		else
+			fprintf(f, "&%s;\n", exportsym->ref);
+	}
+
 	for_each_child(tree, child) {
 		fprintf(f, "\n");
 		write_tree_source_node(f, child, level+1);
-- 
2.55.0

