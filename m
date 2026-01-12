Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97347361671
	for <devicetree-compiler@vger.kernel.org>; Mon, 12 Jan 2026 14:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227695; cv=none; b=DFspoSu4GSu0kFtdPsUe5W9itye6dYTqsq6o1o9i78UBthCyYaXAvP/jPOcsOafo8nyiCN7GT68XhMDRd2Z9v8uQoH9qv2SuqXmAmkklfRrqdytffdbIG6Eiik5rajjaA/TqALvcnSpQvo6r6fjVRVmZ3VM78Jf1ZGqF2GK3JJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227695; c=relaxed/simple;
	bh=CEasET10sP+j3Sucb0CuGp5z2ogY06a0y4XR5kPsAtM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dlXPe+Kjcs4Jmuz4/wuOUM27u9kRoNeaGpsr2OZzO5uYK/p2XCifos58lQEoh8XB46AtNfrPRWwuIpFFzxRH/ArQgCs8zmYeRKCtW55VQI5HdhZcjCtaZATcwOgjS2iAUgtmbpiPKE5qh4mddD1HLE8mpICyTljPV1qGzNQCePY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=qr3IvNPX; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="qr3IvNPX"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3F87D4E4209B;
	Mon, 12 Jan 2026 14:21:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 15FA9606FA;
	Mon, 12 Jan 2026 14:21:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2748D103C926D;
	Mon, 12 Jan 2026 15:21:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227686; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=qkuvUEzHxqmCDSzTmLcBGluTI+Rj6lKZ4lPg+PlL+38=;
	b=qr3IvNPXgRatKHsrHvQ+X7lcNyNwvcsGVOBoR5DapGl4DF8Q2tuz1caG5FfvaFcloD+AoR
	MttzXn5JLy9z373GCdLreYGYMiqjbvj4MqvFby/3zi44vZKh3vC7V6Rmc2K3pxu6eIcA7U
	45kW5PGZVdhOaaXutel8sajWCDnr2c6rvQQuVcTPe9CfmUyyKKicWrjoi7KT07RC7kfGwa
	ijhke4EmAz5B+eWjycRsGCuah7QnzkB7H4mgiPgemZassXbgrjicycqn5XOetsvyD0WVId
	De3ef7SxwV4d7qmUNsVSFEghdsmq4LV04xRknPGBhEmgzTmlV93DryXxXFVZPA==
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
Subject: [RFC PATCH 43/77] dtc: Introduce dti_get_node_by_ref()
Date: Mon, 12 Jan 2026 15:19:33 +0100
Message-ID: <20260112142009.1006236-44-herve.codina@bootlin.com>
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

To prepare this change, introduce and use dti_get_node_by_ref().

dti_get_node_by_ref() retrieves a node by a reference (a label or a
path) like get_node_by_ref() but it works at the struct dt_info level.

It handles the case where a 'root' device-tree is not present and will
handle orphan nodes trees as soon as they will be introduced.

This introduction doesn't lead to any functional changes.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 checks.c     | 10 ++++------
 dtc-parser.y | 22 +++++++++++++++++-----
 dtc.h        |  2 +-
 livetree.c   | 19 ++++++++++++++++---
 4 files changed, 38 insertions(+), 15 deletions(-)

diff --git a/checks.c b/checks.c
index fd22524..a47870d 100644
--- a/checks.c
+++ b/checks.c
@@ -486,7 +486,6 @@ ERROR(duplicate_label, check_duplicate_label_node, NULL);
 static cell_t check_phandle_prop(struct check *c, struct dt_info *dti,
 				 struct node *node, const char *propname)
 {
-	struct node *root = dti->dt;
 	struct property *prop;
 	struct marker *m;
 	cell_t phandle;
@@ -504,7 +503,7 @@ static cell_t check_phandle_prop(struct check *c, struct dt_info *dti,
 	m = prop->val.markers;
 	for_each_marker_of_type(m, REF_PHANDLE) {
 		assert(m->offset == 0);
-		if (node != get_node_by_ref(root, m->ref))
+		if (node != dti_get_node_by_ref(dti, m->ref))
 			/* "Set this node's phandle equal to some
 			 * other node's phandle".  That's nonsensical
 			 * by construction. */ {
@@ -614,7 +613,7 @@ static void fixup_phandle_references(struct check *c, struct dt_info *dti,
 		for_each_marker_of_type(m, REF_PHANDLE) {
 			assert(m->offset + sizeof(cell_t) <= prop->val.len);
 
-			refnode = get_node_by_ref(dt, m->ref);
+			refnode = dti_get_node_by_ref(dti, m->ref);
 			if (! refnode) {
 				if (!(dti->dtsflags & (DTSF_PLUGIN | DTSF_ADDON)))
 					FAIL(c, dti, node, "Reference to non-existent node or "
@@ -633,7 +632,7 @@ static void fixup_phandle_references(struct check *c, struct dt_info *dti,
 	}
 
 	for_each_symbol(node->exportsymlist, exportsym) {
-		refnode = get_node_by_ref(dt, exportsym->ref);
+		refnode = dti_get_node_by_ref(dti, exportsym->ref);
 		if (!refnode) {
 			if (!(dti->dtsflags & (DTSF_PLUGIN | DTSF_ADDON))) {
 				FAIL(c, dti, node,
@@ -657,7 +656,6 @@ ERROR(phandle_references, fixup_phandle_references, NULL,
 static void fixup_path_references(struct check *c, struct dt_info *dti,
 				  struct node *node)
 {
-	struct node *dt = dti->dt;
 	struct property *prop;
 
 	for_each_property(node, prop) {
@@ -668,7 +666,7 @@ static void fixup_path_references(struct check *c, struct dt_info *dti,
 		for_each_marker_of_type(m, REF_PATH) {
 			assert(m->offset <= prop->val.len);
 
-			refnode = get_node_by_ref(dt, m->ref);
+			refnode = dti_get_node_by_ref(dti, m->ref);
 			if (!refnode) {
 				FAIL(c, dti, node, "Reference to non-existent node or label \"%s\"\n",
 				     m->ref);
diff --git a/dtc-parser.y b/dtc-parser.y
index 61ebde2..08b3642 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -31,6 +31,18 @@ static bool is_ref_relative(const char *ref)
 	return ref[0] != '/' && strchr(&ref[1], '/');
 }
 
+static struct node *parser_get_node_by_ref(struct node *dt, const char *ref)
+{
+	/*
+	 * Use a temporary dt_info in order to use dti_get_node_by_ref()
+	 */
+	struct dt_info dti = {};
+
+	dti.dt = dt;
+
+	return dti_get_node_by_ref(&dti, ref);
+}
+
 %}
 
 %union {
@@ -240,7 +252,7 @@ devicetree:
 		}
 	| devicetree DT_LABEL dt_ref nodedef
 		{
-			struct node *target = get_node_by_ref($1, $3);
+			struct node *target = parser_get_node_by_ref($1, $3);
 
 			if ((last_header_flags & DTSF_PLUGIN) && is_ref_relative($3))
 				ERROR(&@2, "Label-relative reference %s not supported in plugin", $3);
@@ -259,7 +271,7 @@ devicetree:
 					ERROR(&@2, "Label-relative reference %s not supported in plugin", $2);
 				add_orphan_node($1, $3, $2);
 			} else {
-				struct node *target = get_node_by_ref($1, $2);
+				struct node *target = parser_get_node_by_ref($1, $2);
 
 				if (target)
 					merge_nodes(target, $3);
@@ -270,7 +282,7 @@ devicetree:
 		}
 	| devicetree DT_LABEL_REF nodedef
 		{
-			struct node *target = get_node_by_ref($1, $2);
+			struct node *target = parser_get_node_by_ref($1, $2);
 
 			if (target) {
 				merge_nodes(target, $3);
@@ -284,7 +296,7 @@ devicetree:
 		}
 	| devicetree DT_DEL_NODE dt_ref ';'
 		{
-			struct node *target = get_node_by_ref($1, $3);
+			struct node *target = parser_get_node_by_ref($1, $3);
 
 			if (target)
 				delete_node(target);
@@ -296,7 +308,7 @@ devicetree:
 		}
 	| devicetree DT_OMIT_NO_REF dt_ref ';'
 		{
-			struct node *target = get_node_by_ref($1, $3);
+			struct node *target = parser_get_node_by_ref($1, $3);
 
 			if (target)
 				omit_node_if_unused(target);
diff --git a/dtc.h b/dtc.h
index 7d53fcb..832265c 100644
--- a/dtc.h
+++ b/dtc.h
@@ -323,7 +323,6 @@ struct property *get_property_by_label(struct node *tree, const char *label,
 struct marker *get_marker_label(struct node *tree, const char *label,
 				struct node **node, struct property **prop);
 struct node *get_subnode(struct node *node, const char *nodename);
-struct node *get_node_by_ref(struct node *tree, const char *ref);
 cell_t get_node_phandle(struct node *root, struct node *node);
 
 uint32_t guess_boot_cpuid(struct node *tree);
@@ -357,6 +356,7 @@ struct dt_info {
 struct node *dti_get_node_by_path(struct dt_info *dti, const char *path);
 struct node *dti_get_node_by_label(struct dt_info *dti, const char *label);
 struct node *dti_get_node_by_phandle(struct dt_info *dti, cell_t phandle);
+struct node *dti_get_node_by_ref(struct dt_info *dti, const char *ref);
 
 /* DTS version flags definitions */
 #define DTSF_V1		0x0001	/* /dts-v1/ */
diff --git a/livetree.c b/livetree.c
index a551307..f1c7e27 100644
--- a/livetree.c
+++ b/livetree.c
@@ -748,7 +748,7 @@ static struct node *get_node_by_phandle(struct node *tree, cell_t phandle)
 	return NULL;
 }
 
-struct node *get_node_by_ref(struct node *tree, const char *ref)
+static struct node *get_node_by_ref(struct node *tree, const char *ref)
 {
 	struct node *target = tree;
 	const char *label = NULL, *path = NULL;
@@ -824,6 +824,19 @@ struct node *dti_get_node_by_phandle(struct dt_info *dti, cell_t phandle)
 	return NULL;
 }
 
+struct node *dti_get_node_by_ref(struct dt_info *dti, const char *ref)
+{
+	struct node *node;
+
+	if (dti->dt) {
+		node = get_node_by_ref(dti->dt, ref);
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
@@ -1407,7 +1420,7 @@ static void mark_local_phandles_internal(struct dt_info *dti,
 	for_each_property(node, prop) {
 		m = prop->val.markers;
 		for_each_marker_of_type(m, REF_PHANDLE) {
-			refnode = get_node_by_ref(dti->dt, m->ref);
+			refnode = dti_get_node_by_ref(dti, m->ref);
 			if (refnode)
 				m->is_local = true;
 		}
@@ -1460,7 +1473,7 @@ static void mark_local_exports_internal(struct dt_info *dti,
 	struct node *refnode;
 
 	for_each_symbol(node->exportsymlist, exportsym) {
-		refnode = get_node_by_ref(dti->dt, exportsym->ref);
+		refnode = dti_get_node_by_ref(dti, exportsym->ref);
 		if (refnode)
 			exportsym->is_local = true;
 	}
-- 
2.52.0

