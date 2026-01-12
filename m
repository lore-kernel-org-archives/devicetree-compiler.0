Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF28D361667
	for <devicetree-compiler@vger.kernel.org>; Mon, 12 Jan 2026 14:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227689; cv=none; b=mXOLTRL3tQ517kTTXUaHaQ2IEJq+AQdepfAiTbtYyyZ6+w7IH9BFcZfxnrj73qfTuWHyw+5sx0R3J8haL+VtMeovNR39l9FpaBAf4Y6MR4lYqTzmRxzon1EuAv2EOegs2tuIVJs5sifv0MpOoe1MgclQUC+azv3wJ66o0jNZ6GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227689; c=relaxed/simple;
	bh=rg9z+VpW6LnOy3nEU1gPmfERK+TSCIO/nbOFNd4Ncpo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aS2A6wmys9H7AD/lV5+ida4P/FA03U4Bnw95uzBqfSV6CrkG3q81IE6NxfwLK44iJB+HFRmRnAcYbk6VXehxLmM2msEjEF8IHg66MWz//mP8yhjpBuIgC0hA4lTqGrnkUA3MuaK3Cbmp8fBEOZLDIc4Fu4yAhfgRytN9pxEIY7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=1Rh+7SIi; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="1Rh+7SIi"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0BBAEC2086C;
	Mon, 12 Jan 2026 14:20:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 84044606FA;
	Mon, 12 Jan 2026 14:21:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C6A09103C9269;
	Mon, 12 Jan 2026 15:21:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227684; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=mt1ukzE1WdqxEMlqc5egdvChAzbkLpTNQ+GIEG3HFTc=;
	b=1Rh+7SIiA5A/iRCqcvP95WMTi4N5De//C/qMw1LGN6qtLskbrgd6cArg5WEcGyK3SkNBcY
	nPMlBNc98PZKbxMuPgRSYAJkLOrHrsNp7n0ORoBg0lZAmAZYGeH+w0FXexqMKoEWaogEfG
	R1TS2Q71N/efNBVJp/ghUfU9vrb6I8Tpa1jnpZ8eT04M4uB/tvnnlmu4//gXtbsfI3SsnX
	F93aVKx2ZVmXTT9ggm9fj9wf+v88nVr05UKaXUkEu9/g9XMeuI0d7/hGY4jYI65gJXLZs2
	rXoUkNiWgagrVy9g8H7XHT7Y6ZkscU6MOpwJYcYoSdJcau8ek5RJQVeV34b7fA==
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
Subject: [RFC PATCH 42/77] dtc: Introduce dti_get_node_by_phandle()
Date: Mon, 12 Jan 2026 15:19:32 +0100
Message-ID: <20260112142009.1006236-43-herve.codina@bootlin.com>
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

To prepare this change, introduce and use dti_get_node_by_phandle().

dti_get_node_by_phandle() retrieves a node by its phandle value like
get_node_by_phandle() but it works at the struct dt_info level.

It handles the case where a 'root' device-tree is not present and will
handle orphan nodes trees as soon as they will be introduced.

This introduction doesn't lead to any functional changes.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 checks.c   | 14 +++++---------
 dtc.h      |  2 +-
 livetree.c | 19 ++++++++++++++++---
 3 files changed, 22 insertions(+), 13 deletions(-)

diff --git a/checks.c b/checks.c
index a76e96a..fd22524 100644
--- a/checks.c
+++ b/checks.c
@@ -533,7 +533,6 @@ static cell_t check_phandle_prop(struct check *c, struct dt_info *dti,
 static void check_explicit_phandles(struct check *c, struct dt_info *dti,
 				    struct node *node)
 {
-	struct node *root = dti->dt;
 	struct node *other;
 	cell_t phandle, linux_phandle;
 
@@ -555,7 +554,7 @@ static void check_explicit_phandles(struct check *c, struct dt_info *dti,
 	if (linux_phandle && !phandle)
 		phandle = linux_phandle;
 
-	other = get_node_by_phandle(root, phandle);
+	other = dti_get_node_by_phandle(dti, phandle);
 	if (other && (other != node)) {
 		FAIL(c, dti, node, "duplicated phandle 0x%x (seen before at %s)",
 		     phandle, other->fullpath);
@@ -1414,7 +1413,6 @@ static void check_property_phandle_args(struct check *c,
 					struct property *prop,
 					const struct provider *provider)
 {
-	struct node *root = dti->dt;
 	unsigned int cell, cellsize = 0;
 
 	if (!is_multiple_of(prop->val.len, sizeof(cell_t))) {
@@ -1457,7 +1455,7 @@ static void check_property_phandle_args(struct check *c,
 					  cell);
 		}
 
-		provider_node = get_node_by_phandle(root, phandle);
+		provider_node = dti_get_node_by_phandle(dti, phandle);
 		if (!provider_node) {
 			FAIL_PROP(c, dti, node, prop,
 				  "Could not get phandle node for (cell %d)",
@@ -1624,7 +1622,6 @@ static void check_interrupt_map(struct check *c,
 				struct dt_info *dti,
 				struct node *node)
 {
-	struct node *root = dti->dt;
 	struct property *prop, *irq_map_prop;
 	size_t cellsize, cell, map_cells;
 
@@ -1678,7 +1675,7 @@ static void check_interrupt_map(struct check *c,
 			break;
 		}
 
-		provider_node = get_node_by_phandle(root, phandle);
+		provider_node = dti_get_node_by_phandle(dti, phandle);
 		if (!provider_node) {
 			FAIL_PROP(c, dti, node, irq_map_prop,
 				  "Could not get phandle(%d) node for (cell %zu)",
@@ -1716,7 +1713,6 @@ static void check_interrupts_property(struct check *c,
 				      struct dt_info *dti,
 				      struct node *node)
 {
-	struct node *root = dti->dt;
 	struct node *irq_node = NULL, *parent = node;
 	struct property *irq_prop, *prop = NULL;
 	cell_t irq_cells, phandle;
@@ -1747,7 +1743,7 @@ static void check_interrupts_property(struct check *c,
 				continue;
 			}
 
-			irq_node = get_node_by_phandle(root, phandle);
+			irq_node = dti_get_node_by_phandle(dti, phandle);
 			if (!irq_node) {
 				FAIL_PROP(c, dti, parent, prop, "Bad phandle");
 				return;
@@ -1882,7 +1878,7 @@ static struct node *get_remote_endpoint(struct check *c, struct dt_info *dti,
 	if (!phandle_is_valid(phandle))
 		return NULL;
 
-	node = get_node_by_phandle(dti->dt, phandle);
+	node = dti_get_node_by_phandle(dti, phandle);
 	if (!node)
 		FAIL_PROP(c, dti, endpoint, prop, "graph phandle is not valid");
 
diff --git a/dtc.h b/dtc.h
index 3dce237..7d53fcb 100644
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
 
 struct node *dti_get_node_by_path(struct dt_info *dti, const char *path);
 struct node *dti_get_node_by_label(struct dt_info *dti, const char *label);
+struct node *dti_get_node_by_phandle(struct dt_info *dti, cell_t phandle);
 
 /* DTS version flags definitions */
 #define DTSF_V1		0x0001	/* /dts-v1/ */
diff --git a/livetree.c b/livetree.c
index 771ff3d..a551307 100644
--- a/livetree.c
+++ b/livetree.c
@@ -722,7 +722,7 @@ static cell_t get_node_phandle_existing(struct node *node)
 	return propval_cell(prop);
 }
 
-struct node *get_node_by_phandle(struct node *tree, cell_t phandle)
+static struct node *get_node_by_phandle(struct node *tree, cell_t phandle)
 {
 	struct node *child, *node;
 	cell_t tree_phandle;
@@ -811,6 +811,19 @@ struct node *dti_get_node_by_label(struct dt_info *dti, const char *label)
 	return NULL;
 }
 
+struct node *dti_get_node_by_phandle(struct dt_info *dti, cell_t phandle)
+{
+	struct node *node;
+
+	if (dti->dt) {
+		node = get_node_by_phandle(dti->dt, phandle);
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
@@ -1362,7 +1375,7 @@ static void update_phandles_ref_internal(struct dt_info *dti, struct node *node)
 			if (m->is_local) {
 				phandle = propval_cell_n(prop,
 							 m->offset / sizeof(cell_t));
-				refnode = get_node_by_phandle(dti->dt, phandle);
+				refnode = dti_get_node_by_phandle(dti, phandle);
 				if (!refnode)
 					die("Node not found for phandle 0x%"PRIx32"\n", phandle);
 
@@ -1420,7 +1433,7 @@ static void update_exports_ref_internal(struct dt_info *dti, struct node *node)
 			continue;
 
 		if (exportsym->is_local) {
-			refnode = get_node_by_phandle(dti->dt, exportsym->phandle);
+			refnode = dti_get_node_by_phandle(dti, exportsym->phandle);
 			if (!refnode)
 				die("Node not found for phandle 0x%"PRIx32"\n", exportsym->phandle);
 
-- 
2.52.0

