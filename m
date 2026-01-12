Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8663361DA7
	for <devicetree-compiler@vger.kernel.org>; Mon, 12 Jan 2026 14:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227695; cv=none; b=WauZPqXhhM2uqB6UDU8LPCX5YwR8rZeMjKbakeFMUOyF+8Mkj6Hkods+QS/wUB2MgrH3s+pzEdF+ZQ2rh9ZkfbdiwSKaqwxp49BIDW1+gqf5sd3bkU1Uzk4tkU8CpAQF+CZ6BcFRseOjekETWyT0wojFVoVMtt2oZ2lkn2BrleQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227695; c=relaxed/simple;
	bh=LYvYKtSweDD8VHYtaGBPMKOKolrSaO9bVFl/s96npoo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OF/UDI8fPLUCXzBU1yUMgdzqDBDld2CRXp9Ka/hJsaP8Uxuc9GnyNNardDRFI9dWvNOjZBML07xDBe3JfOxwxC55yow0MK55xnf2uH+C74r222lqRIlJIyFeN/0OQW1aQifDVcdtr4aKkm0a4i/ZcPHzJFIk3ZlvRD+scIJpm38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Ay232dxN; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Ay232dxN"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 90E141A2819;
	Mon, 12 Jan 2026 14:21:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5DE6B606FA;
	Mon, 12 Jan 2026 14:21:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7C4DC103C926E;
	Mon, 12 Jan 2026 15:21:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227687; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZmFxIKNmxvZuWpIeOeQbNbEsravESSWH+HLcdBHzG1s=;
	b=Ay232dxN4+Xa/7nfYNObydLwjV+LiFR1l2HkA0dApIglWlTBFMBZkqnIrEjoypcH+PEU9R
	3fTDamSrPn+zIvJcMBFxnn2pKuOd2saS7ddMWUcRqCzgP+PfUxKUWVvgc1FjoOpdM2D2tB
	ByPvWs2F+7cNwsFrk3GYrcGt8zZtMwi8Bhc/5J34nM7qB/3Zj+3MPzIhNOqNPNz3JZeInf
	teXFV+CgaCrXGZQ4NPYnRV9ShhJG/7NdF22YA4dpr3V0ccGiJQ1CBqGYBe1D+/OWFGRIfN
	hhht3CD2ldftBg8pK7D1vpDezTYdkfYA9l2f8LzB4WNlHyBDoQAWAlZ0DyznoQ==
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
Subject: [RFC PATCH 44/77] dtc: Introduce dti_get_node_phandle()
Date: Mon, 12 Jan 2026 15:19:34 +0100
Message-ID: <20260112142009.1006236-45-herve.codina@bootlin.com>
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

The future introduction of orphan nodes for addons device-tree will lead
to more than one tree in the addons data. Those trees will be:
  - the classical root tree starting at the root node
  - trees related to orphan nodes

Also, an addon device-tree can have only trees based on orphan nodes. In
other words an addon device-tree is valid without having the classical
'root' tree.

To prepare this change, introduce and use dti_get_node_phandle().

dti_get_node_phandle() get the phandle value related to a node and
allocate a new value if the node doesn't have yet a phandle value.

It behaves in the same way as get_node_phandle() but it works at the
struct dt_info level.

It handles the case where a 'root' device-tree is not present and will
handle orphan nodes trees as soon as they will be introduced.

This introduction doesn't lead to any functional changes.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 checks.c   | 5 ++---
 dtc.h      | 2 +-
 livetree.c | 7 +++----
 3 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/checks.c b/checks.c
index a47870d..7dd5032 100644
--- a/checks.c
+++ b/checks.c
@@ -601,7 +601,6 @@ ERROR(name_properties, check_name_properties, NULL, &name_is_string);
 static void fixup_phandle_references(struct check *c, struct dt_info *dti,
 				     struct node *node)
 {
-	struct node *dt = dti->dt;
 	struct symbol *exportsym;
 	struct property *prop;
 	struct node *refnode;
@@ -624,7 +623,7 @@ static void fixup_phandle_references(struct check *c, struct dt_info *dti,
 				continue;
 			}
 
-			phandle = get_node_phandle(dt, refnode);
+			phandle = dti_get_node_phandle(dti, refnode);
 			*((fdt32_t *)(prop->val.val + m->offset)) = cpu_to_fdt32(phandle);
 
 			reference_node(refnode);
@@ -644,7 +643,7 @@ static void fixup_phandle_references(struct check *c, struct dt_info *dti,
 		}
 
 		/* Create the phandle property for this referenced node */
-		phandle = get_node_phandle(dt, refnode);
+		phandle = dti_get_node_phandle(dti, refnode);
 		exportsym->phandle = phandle;
 
 		reference_node(refnode);
diff --git a/dtc.h b/dtc.h
index 832265c..f7b0b23 100644
--- a/dtc.h
+++ b/dtc.h
@@ -323,7 +323,6 @@ struct property *get_property_by_label(struct node *tree, const char *label,
 struct marker *get_marker_label(struct node *tree, const char *label,
 				struct node **node, struct property **prop);
 struct node *get_subnode(struct node *node, const char *nodename);
-cell_t get_node_phandle(struct node *root, struct node *node);
 
 uint32_t guess_boot_cpuid(struct node *tree);
 
@@ -357,6 +356,7 @@ struct node *dti_get_node_by_path(struct dt_info *dti, const char *path);
 struct node *dti_get_node_by_label(struct dt_info *dti, const char *label);
 struct node *dti_get_node_by_phandle(struct dt_info *dti, cell_t phandle);
 struct node *dti_get_node_by_ref(struct dt_info *dti, const char *ref);
+cell_t dti_get_node_phandle(struct dt_info *dti, struct node *node);
 
 /* DTS version flags definitions */
 #define DTSF_V1		0x0001	/* /dts-v1/ */
diff --git a/livetree.c b/livetree.c
index f1c7e27..a4917d1 100644
--- a/livetree.c
+++ b/livetree.c
@@ -853,14 +853,14 @@ static void add_phandle_property(struct node *node,
 	add_property(node, build_property(name, d, NULL));
 }
 
-cell_t get_node_phandle(struct node *root, struct node *node)
+cell_t dti_get_node_phandle(struct dt_info *dti, struct node *node)
 {
 	static cell_t phandle = 1; /* FIXME: ick, static local */
 
 	if (phandle_is_valid(node->phandle))
 		return node->phandle;
 
-	while (get_node_by_phandle(root, phandle))
+	while (dti_get_node_by_phandle(dti, phandle))
 		phandle++;
 
 	node->phandle = phandle;
@@ -1143,7 +1143,6 @@ static void generate_label_tree_internal(struct dt_info *dti,
 					 struct node *an, struct node *node,
 					 bool allocph)
 {
-	struct node *dt = dti->dt;
 	struct node *c;
 	struct property *p;
 	struct label *l;
@@ -1173,7 +1172,7 @@ static void generate_label_tree_internal(struct dt_info *dti,
 
 		/* force allocation of a phandle for this node */
 		if (allocph)
-			(void)get_node_phandle(dt, node);
+			(void)dti_get_node_phandle(dti, node);
 	}
 
 	for_each_child(node, c)
-- 
2.52.0

