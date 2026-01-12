Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593FD2D1F6B
	for <devicetree-compiler@vger.kernel.org>; Mon, 12 Jan 2026 14:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227662; cv=none; b=BJMC8cL9bBRclx3n2Vg0xwMnv7ifYvoKq+ktb+pK+FTky+RK8j+igdWqy8zkex2bTQBhduvN3j4tZI9eQqwVKJ6pMWZzF65dYsh+p79uV2UujE63qLW+HryuAgC39o/+JzSqSVDkrHOA7v9GmwC44zKV/Mo81xjCuDvZmIg+Ax0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227662; c=relaxed/simple;
	bh=Nj6kJj98DYHwwdjHPdu2+VgWqk7PRTqBXRT9vZd8eeY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ein8bjkGMaSytvR3+j/ZllNer3lSUkFBap5z3iSfPYhqw0qzZltCxVpe/mcf2XthVOButQTw5X3YZPY1WH1l3l8v3sQYNYSYfUtMAqkqQOk6VeSfpgDv9CU/naJtV4h8om7D0CmkAPxZs3R29UXV3SXggKCfQUhjsjCrOQWJBz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=OWk+hX0W; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="OWk+hX0W"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3E8C21A2801;
	Mon, 12 Jan 2026 14:20:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 13C27606FA;
	Mon, 12 Jan 2026 14:20:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E7A4A103C9261;
	Mon, 12 Jan 2026 15:20:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227655; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=0MOeeR6TasGz+3AxpUMPX0Cq21Iksg66J6fcPymVDvA=;
	b=OWk+hX0Ws5ZSun8uSJ95isB9VmnKshFYFRSaf5ByWplxHtexLxWwE/o1l4qNPsd2IuWBLe
	9RHRsx3J7EnFIDbaOcu+5sfFu4RnvawMLNvWUFcHJesBviN12H5RHBtdf1scy25ZAZD5d9
	GAZyEsSlyzldVThWYrppjqyCa6ItUqmfyl/8BNaY/JeH0ZzT1SuTfNEmqfeAFMspzbR1Q+
	ORUkRDRWyFeemH9l3Erc7bkY7sEOP6qeyLJMTvrPZdx7fYqn6i1mc7y5QuGmgo7VVRCbD5
	KGcZRQw/MIuwA/+/z46rbiiy63+TBwfJuOi8oHQyrL/oh+bMz7ll6oGQxMETgw==
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
Subject: [RFC PATCH 22/77] dtc: Add export symbols (/export/ keyword) in generated dts file
Date: Mon, 12 Jan 2026 15:19:12 +0100
Message-ID: <20260112142009.1006236-23-herve.codina@bootlin.com>
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

The export symbols (/export/ keyword) parsing from a dts file is
supported.

Add the support for this keyword in the dts file generation.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 treesource.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/treesource.c b/treesource.c
index 1db6390..9effe38 100644
--- a/treesource.c
+++ b/treesource.c
@@ -320,6 +320,7 @@ static void write_propval(FILE *f, struct property *prop)
 
 static void write_tree_source_node(FILE *f, struct node *tree, int level)
 {
+	struct symbol *exportsym;
 	struct property *prop;
 	struct node *child;
 	struct label *l;
@@ -349,6 +350,18 @@ static void write_tree_source_node(FILE *f, struct node *tree, int level)
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
2.52.0

