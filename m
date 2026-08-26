Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378063C09F1;
	Wed, 26 Aug 2026 09:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787737954; cv=none; b=rw0640PoEFnowMCChgNQNFXJ/Hrq0yc0iiY2U5ayBAayaPUGL5QlwaPtLLOrFAOy6koUOUnaFArTy7QMBDUPdrdR5jIsKvFX5+Xf8fp4N1lyN6mYFaStygYZ1zmFvahSegjE9IaYSCXV4y7wsaWcfaKEQmBewZlNCNNHbTG/V5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787737954; c=relaxed/simple;
	bh=mkTEVuBwnL7cLByjCSgFifSvsLxriFjYuJgAg4CBXuY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O/mG8BYWVnHvxdoFwx9QaZ6pUWhi0OxmnVhpmhIkZyEnKk8yqhSDd4xgLHQUaOrS4HvkHZDMwLQyHiVr5a9A+9lremhMGeN7/BZg4prj2cYufow0XjlqH0IrH/HEqr5Lg9JwgNRXgbLAPD0EO/WWLhwRza6tL/04sMRUzBl6oOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Ipq1M8N8; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Ipq1M8N8"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E8ECB1A183A;
	Wed, 26 Aug 2026 09:52:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B6CD0604EC;
	Wed, 26 Aug 2026 09:52:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3BA3B11C7AD64;
	Wed, 26 Aug 2026 11:52:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787737946; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=wpUlkOVxyoiS/FboVOPBjzYeW7ZlKu5gmFmVI1uE68g=;
	b=Ipq1M8N8aSt/evST96fDI6UjjmxnM+CBoqxAYiSzg/EJJsErOFHS4DTcn+hmQ1pOUf3Inf
	we+dLrx/BNIPPJGAz0oNvMaAyUzmOT2PUVqhan/+HQ4bI4vN86Dh118aoCsHu49GUNy2D7
	xECDIFpwiqQ3j3qp3MJVsG1JBXBWvNgQQ5lT25+s2DNwX/ruG6mnCAZU9Zb1EweHWoU9r4
	T6TRM1jAdt0idCEdAY4M+h4BpG3OL7BSg1XEf7YDQ1EEx3AP+hitMupVKSUWMehg7a9vkt
	KWYzqwHmKqE5wS8mWn4xYuuNTbh6er3ZVFjAup2gQVm1lupZP7g/2AX41C7mdA==
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
Subject: [RFC PATCH v2 38/74] dtc: Change get_node_by_phandle() signature to take dt_info
Date: Wed, 26 Aug 2026 11:49:07 +0200
Message-ID: <20260826094950.1088288-39-herve.codina@bootlin.com>
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

The future introduction of orphan nodes for addons device-tree will lead
to more than one tree in the addons data. Those trees will be:
  - the classical root tree starting at the root node
  - trees related to orphan nodes

Also, an addon device-tree can have only trees based on orphan nodes. In
other words an addon device-tree is valid without having the classical
'root' tree.

To prepare orphan nodes introduction, move get_node_by_phandle()
parameter one level up and use dt_info struct instead of the 'root' tree
(i.e. dti->dt).

This change doesn't lead to any functional changes.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 checks.c     | 14 +++++---------
 dtc.h        |  2 +-
 livetree.c   | 21 +++++++++++++++++----
 treesource.c |  2 +-
 4 files changed, 24 insertions(+), 15 deletions(-)

diff --git a/checks.c b/checks.c
index f4ae776b..6b25c204 100644
--- a/checks.c
+++ b/checks.c
@@ -541,7 +541,6 @@ static cell_t check_phandle_prop(struct check *c, struct dt_info *dti,
 static void check_explicit_phandles(struct check *c, struct dt_info *dti,
 				    struct node *node)
 {
-	struct node *root = dti->dt;
 	struct node *other;
 	cell_t phandle, linux_phandle;
 
@@ -563,7 +562,7 @@ static void check_explicit_phandles(struct check *c, struct dt_info *dti,
 	if (linux_phandle && !phandle)
 		phandle = linux_phandle;
 
-	other = get_node_by_phandle(root, phandle);
+	other = get_node_by_phandle(dti, phandle);
 	if (other && (other != node)) {
 		FAIL(c, dti, node, "duplicated phandle 0x%x (seen before at %s)",
 		     phandle, other->fullpath);
@@ -1422,7 +1421,6 @@ static void check_property_phandle_args(struct check *c,
 					struct property *prop,
 					const struct provider *provider)
 {
-	struct node *root = dti->dt;
 	unsigned int cell, cellsize = 0;
 
 	if (!is_multiple_of(prop->val.len, sizeof(cell_t))) {
@@ -1465,7 +1463,7 @@ static void check_property_phandle_args(struct check *c,
 					  cell);
 		}
 
-		provider_node = get_node_by_phandle(root, phandle);
+		provider_node = get_node_by_phandle(dti, phandle);
 		if (!provider_node) {
 			FAIL_PROP(c, dti, node, prop,
 				  "Could not get phandle node for (cell %d)",
@@ -1632,7 +1630,6 @@ static void check_interrupt_map(struct check *c,
 				struct dt_info *dti,
 				struct node *node)
 {
-	struct node *root = dti->dt;
 	struct property *prop, *irq_map_prop;
 	size_t cellsize, cell, map_cells;
 
@@ -1686,7 +1683,7 @@ static void check_interrupt_map(struct check *c,
 			break;
 		}
 
-		provider_node = get_node_by_phandle(root, phandle);
+		provider_node = get_node_by_phandle(dti, phandle);
 		if (!provider_node) {
 			FAIL_PROP(c, dti, node, irq_map_prop,
 				  "Could not get phandle(%d) node for (cell %zu)",
@@ -1724,7 +1721,6 @@ static void check_interrupts_property(struct check *c,
 				      struct dt_info *dti,
 				      struct node *node)
 {
-	struct node *root = dti->dt;
 	struct node *irq_node = NULL, *parent = node;
 	struct property *irq_prop, *prop = NULL;
 	cell_t irq_cells, phandle;
@@ -1755,7 +1751,7 @@ static void check_interrupts_property(struct check *c,
 				continue;
 			}
 
-			irq_node = get_node_by_phandle(root, phandle);
+			irq_node = get_node_by_phandle(dti, phandle);
 			if (!irq_node) {
 				FAIL_PROP(c, dti, parent, prop, "Bad phandle");
 				return;
@@ -1890,7 +1886,7 @@ static struct node *get_remote_endpoint(struct check *c, struct dt_info *dti,
 	if (!phandle_is_valid(phandle))
 		return NULL;
 
-	node = get_node_by_phandle(dti->dt, phandle);
+	node = get_node_by_phandle(dti, phandle);
 	if (!node)
 		FAIL_PROP(c, dti, endpoint, prop, "graph phandle is not valid");
 
diff --git a/dtc.h b/dtc.h
index bf8f0ce4..27f49bc6 100644
--- a/dtc.h
+++ b/dtc.h
@@ -323,7 +323,6 @@ struct property *get_property_by_label(struct node *tree, const char *label,
 struct marker *get_marker_label(struct node *tree, const char *label,
 				struct node **node, struct property **prop);
 struct node *get_subnode(struct node *node, const char *nodename);
-struct node *get_node_by_phandle(struct node *tree, cell_t phandle);
 struct node *get_node_by_ref(struct node *tree, const char *ref);
 cell_t get_node_phandle(struct node *root, struct node *node);
 
@@ -357,6 +356,7 @@ struct dt_info {
 
 struct node *get_node_by_path(struct dt_info *dti, const char *path);
 struct node *get_node_by_label(struct dt_info *dti, const char *label);
+struct node *get_node_by_phandle(struct dt_info *dti, cell_t phandle);
 
 /* DTS version flags definitions */
 #define DTSF_V1		0x0001	/* /dts-v1/ */
diff --git a/livetree.c b/livetree.c
index aec1e160..5bd65b1b 100644
--- a/livetree.c
+++ b/livetree.c
@@ -584,7 +584,7 @@ static void complete_ref_and_is_local(struct dt_info *dti, char **ref,
 	}
 
 	if (*is_local) {
-		refnode = get_node_by_phandle(dti->dt, phandle);
+		refnode = get_node_by_phandle(dti, phandle);
 		if (!refnode)
 			die("Node not found for phandle 0x%"PRIx32"\n", phandle);
 
@@ -834,7 +834,7 @@ static cell_t get_node_phandle_existing(struct node *node)
 	return propval_cell(prop);
 }
 
-struct node *get_node_by_phandle(struct node *tree, cell_t phandle)
+static struct node *get_node_by_phandle_(struct node *tree, cell_t phandle)
 {
 	struct node *child, *node;
 	cell_t tree_phandle;
@@ -852,7 +852,7 @@ struct node *get_node_by_phandle(struct node *tree, cell_t phandle)
 	}
 
 	for_each_child(tree, child) {
-		node = get_node_by_phandle(child, phandle);
+		node = get_node_by_phandle_(child, phandle);
 		if (node)
 			return node;
 	}
@@ -918,6 +918,19 @@ struct node *get_node_by_label(struct dt_info *dti, const char *label)
 	return NULL;
 }
 
+struct node *get_node_by_phandle(struct dt_info *dti, cell_t phandle)
+{
+	struct node *node;
+
+	if (dti->dt) {
+		node = get_node_by_phandle_(dti->dt, phandle);
+		if (node)
+			return node;
+	}
+
+	return NULL;
+}
+
 static void add_phandle_property(struct node *node,
 				 const char *name, int format)
 {
@@ -941,7 +954,7 @@ cell_t get_node_phandle(struct node *root, struct node *node)
 	if (phandle_is_valid(node->phandle))
 		return node->phandle;
 
-	while (get_node_by_phandle(root, phandle))
+	while (get_node_by_phandle_(root, phandle))
 		phandle++;
 
 	node->phandle = phandle;
diff --git a/treesource.c b/treesource.c
index d22f1d32..705fe9a6 100644
--- a/treesource.c
+++ b/treesource.c
@@ -205,7 +205,7 @@ void add_phandle_marker(struct dt_info *dti, struct property *prop, unsigned int
 	}
 
 	phandle = dtb_ld32(prop->val.val + offset);
-	refn = get_node_by_phandle(dti->dt, phandle);
+	refn = get_node_by_phandle(dti, phandle);
 
 	if (!refn) {
 		if (quiet < 1)
-- 
2.55.0

