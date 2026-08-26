Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8DB3C0623;
	Wed, 26 Aug 2026 09:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787737862; cv=none; b=oJfhNsS13IKkdkARNVk1ZJtqunfMlJTtzRI8oJEBn8vyWfepHmnSZbeDhPquE8umWyPucJoWbcYa/2b5j93PRdGx1Evyzft88eUjHGeOXaCmkCXEednBPDwEY9F9Sc4nGBil0ZfnGinHLkD3fnlpaBhvFWxQSJcYyN1mJZoFP+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787737862; c=relaxed/simple;
	bh=RdBFkMecL4wuSKPo/cQyMycG1M2ORqtMZfHz2lQEras=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B5XxddcfbP5vst6PfTUfcAOP2rbMiHRFlbMHDZIcb7KfcZ8IG3JXRkWUaPuTGqtvndVBPIESXb5m8J/uQVRC/lBC2pIMIKSpGgM8zRaQ/Wv1AuvKi9qnCDKQo0dtWkt3WxmDAdcMQ5ULrbtH+XbH9RAW31YcOODorCHJBROrdhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=TO4rmgGI; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="TO4rmgGI"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CD0A04E413BC;
	Wed, 26 Aug 2026 09:50:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 999F3604EC;
	Wed, 26 Aug 2026 09:50:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3943111C7AD5A;
	Wed, 26 Aug 2026 11:50:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787737849; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=zbpn10RhSC4nlm/nIJyNq6oASYUb80vxfi05iGG20Rw=;
	b=TO4rmgGI2YGv547V0QFMU9Lb/A/DZc/pXe3EZScI6iyFMjlF0spVxShKljrXZoGWaH5C7v
	ekT5e8Mh0WOU+YM87kTocLgyeIYOL0V/pWi3z80HW+JCmTzDpjtgil8EGITalDAUQgWEgU
	xDbfYFHyQ58XYNqRRgcGVfV+LSJFcH510D5veHTWGHN1u8LrnfIGTxAhvELkN+V4QG8dVl
	vgxRGogDMbLoYO6VMM6UBmFmcw/P36e0AD8ojxko4Miit8oCNPwWlcnFGXHINi0ieP949M
	bseoSBY9EaY1TtqA4C5y+jTXCGxP8V7j+tMCq5ppRklhCBBAEuyCQ4VrbxD8bg==
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
Subject: [RFC PATCH v2 08/74] livetree: Improve get_node_by_phandle()
Date: Wed, 26 Aug 2026 11:48:37 +0200
Message-ID: <20260826094950.1088288-9-herve.codina@bootlin.com>
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

With the recently introduced FDT_PROPDATA_HANDLE dtb tag, this will be
needed to update internal phandle references before the call to
process_check(). Indeed, this tag allows to identify phandles and
internal references need to be updated based on the phandle value before
the process_check() call.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 livetree.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/livetree.c b/livetree.c
index abe73de1..a9f8c5d2 100644
--- a/livetree.c
+++ b/livetree.c
@@ -628,16 +628,35 @@ struct node *get_node_by_label(struct node *tree, const char *label)
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
2.55.0

