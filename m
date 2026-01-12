Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953ED27380A;
	Mon, 12 Jan 2026 14:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227639; cv=none; b=NSlBvhetY6WxeksN9nz+8vBa5vpioy84n4mfdO2PR6NNtfhWyokYBo9YaU2JHp8baZp1F4gg2vQQoAcoyv1iWXxnC4VwvNMyKqzQS0UX1tvdXdLB5Yo7JXd7XLfm12j33yab9defTLm39yxRIwDHr3eaCUsIvNONyEhfx49FaO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227639; c=relaxed/simple;
	bh=5s4MfuH6bV1kFmHdaAlJjhLcHBaKKPUQ+j0TcMZDzMg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p8jvM0obDs8SBkbHG1K4kFGn2yotLfPP4L8PtRVrWOur5MN/n1F6Mjz0Ba1hlLU1aozCT15JQSLqedJR+WYk18/hH5XtOW6/dKjQhcdH4rWDLSXMBUGWdJH9lOTv2NRh/NNzRI3nqKRpoyPwItyOA53uq7+53jbUGJvDCAVCOWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=1zHUYbzr; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="1zHUYbzr"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 313DFC20870;
	Mon, 12 Jan 2026 14:20:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A92D8606FA;
	Mon, 12 Jan 2026 14:20:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8EBB8103C8C61;
	Mon, 12 Jan 2026 15:20:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227632; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=oKTQDhMRl0VW80WOH8cTeTsgqrNdBUCiZDYFcFk7Fcg=;
	b=1zHUYbzrT9AfAl2lPr9xVXcmUWw+byCIy28LOsoET0K0pNtqIoL0/rZ7qhiftLKgKBMjfr
	I1B7j3jgYEueY6YBYtkbwuC80XBSfMLbdi3fNuH4pZN24bFR0m7sP1sB0H1+7mB/e1185J
	RR1EtT/6fnDmFhwzikuVTPoTuf9rICg33QHoavqZGDp7yRjEpMIlU5avAuOKDUn42Grc9z
	11iZvcUBZf2Hgbz4gYDk8DyajNF9WEJtrN4vnckmZEWm4JMywzx/LeSkQZmCrx/AEEFi75
	PhpMTiJJkfrwb5nHFiYGH8kQwTyuhfVRLH8b9bN2udQM/XW69V4LsMvT0h178g==
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
Subject: [RFC PATCH 07/77] livetree: Improve get_node_by_phandle()
Date: Mon, 12 Jan 2026 15:18:57 +0100
Message-ID: <20260112142009.1006236-8-herve.codina@bootlin.com>
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

get_node_by_phandle() allows to get a node based on its phandle value.
It checks the phandle value against value available in internal node
structure.

This internal phandle value is updated during process_check() and so,
get_node_by_phandle() cannot give correct results before the
process_check() call.

Improve get_node_by_phandle() to look at node phandle properties when
the internal phandle value is not valid.

This allows to return a correct matching node even if process_check()
was not called yet.

With the recently introduced FDT_REF_LOCAL dtb tag, this will be needed
to update internal phandle references before the call to process_check().
Indeed, this tag allows to identify phandles and internal references
need to be updated based on the phandle value before the
process_check() call.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 livetree.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/livetree.c b/livetree.c
index f328824..9b67934 100644
--- a/livetree.c
+++ b/livetree.c
@@ -609,16 +609,35 @@ struct node *get_node_by_label(struct node *tree, const char *label)
 	return NULL;
 }
 
+static cell_t get_node_phandle_existing(struct node *node)
+{
+	struct property *prop;
+
+	if (phandle_is_valid(node->phandle))
+		return node->phandle;
+
+	prop = get_property(node, "phandle");
+	if (!prop) {
+		prop = get_property(node, "linux,phandle");
+		if (!prop)
+			return 0;
+	}
+
+	return propval_cell(prop);
+}
+
 struct node *get_node_by_phandle(struct node *tree, cell_t phandle)
 {
 	struct node *child, *node;
+	cell_t tree_phandle;
 
 	if (!phandle_is_valid(phandle)) {
 		assert(generate_fixups);
 		return NULL;
 	}
 
-	if (tree->phandle == phandle) {
+	tree_phandle = get_node_phandle_existing(tree);
+	if (phandle_is_valid(tree_phandle) && tree_phandle == phandle) {
 		if (tree->deleted)
 			return NULL;
 		return tree;
-- 
2.52.0

