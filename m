Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92F43F7892;
	Wed, 26 Aug 2026 09:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787737963; cv=none; b=X8rJDC1O0q30eDJ4IF0JTsJzgKw0xhd2nID+rusYCLXulq9oWN2rthFbmPZz4/NEbsnyRKuCa+NOagAkexl79jSDIl/1MNjgCIo7fGWXETnm3WxViAjnii1WTtNPItfCLUjeX4r78esENRz2rHC/jF9lXa0wphggyNEefcm9Z/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787737963; c=relaxed/simple;
	bh=Ae+J0Fp73WWMKpZ07y93E8FUkklv3etcE/CfM5G7Wow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oft9VDfDPUig0K2nGllpTRZQyvmoJy2zil+UP5ftGjXzoM7Xb+mPmNhloj+5V9zt/TtKqg9dFnmOZBlTRlf6Re/sltB5nJ6PymuL3rodWC7zA/AqdGsVgu8/qzFSE2pTDTmVL9lHdWKbw1O0qqLt+jX+OcpWGLKvpQRt+65BDKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CLZEcR43; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CLZEcR43"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9267A4E413BF;
	Wed, 26 Aug 2026 09:52:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 67CDB604EC;
	Wed, 26 Aug 2026 09:52:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6E00011C7AD52;
	Wed, 26 Aug 2026 11:52:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787737959; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=xyEGlRxncAFiW/2GYUo6g9GIqN9eaNjDBZgfRLAFvac=;
	b=CLZEcR43txjRWSSYC9qlVW2ks18s5oML1Kv8ku+jgqCq1c386NV09Z8sp49c7JkV771Fjx
	AeXnLjjFwpiepVIBEJQJCWw9B4UKF4OUX8ndMHVlGI/+Fo6pl1RDMrskIUTmvAc9PHEQdh
	pyK4jIn95auSbFd9VPNB98EdXDPN8/hWgRI+gDZevcrP6VKiNUdMye3QmQMPeauSVMo1Ae
	EScZOwMMxoS2zsiIoU2DxnTMHLj/psPP1HPJ8JzpOVMbGAupoa5cEWQidmVomktjr04m8d
	AP3HReF7L618+Xqo/yfXzhafUiQWge/Wn2GUMBgVFweKnzPUtjGgin++iFpiMw==
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
Subject: [RFC PATCH v2 40/74] dtc: Change get_node_phandle() signature to take dt_info
Date: Wed, 26 Aug 2026 11:49:09 +0200
Message-ID: <20260826094950.1088288-41-herve.codina@bootlin.com>
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

To prepare orphan nodes introduction, move get_node_phandle() parameter
one level up and use dt_info struct instead of the 'root' tree (i.e.
dti->dt).

This change doesn't lead to any functional changes.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 checks.c   | 5 ++---
 dtc.h      | 2 +-
 livetree.c | 7 +++----
 3 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/checks.c b/checks.c
index b22b616c..f90a8eed 100644
--- a/checks.c
+++ b/checks.c
@@ -609,7 +609,6 @@ ERROR(name_properties, check_name_properties, NULL, &name_is_string);
 static void fixup_phandle_references(struct check *c, struct dt_info *dti,
 				     struct node *node)
 {
-	struct node *dt = dti->dt;
 	struct symbol *exportsym;
 	struct property *prop;
 	struct node *refnode;
@@ -632,7 +631,7 @@ static void fixup_phandle_references(struct check *c, struct dt_info *dti,
 				continue;
 			}
 
-			phandle = get_node_phandle(dt, refnode);
+			phandle = get_node_phandle(dti, refnode);
 			*((fdt32_t *)(prop->val.val + m->offset)) = cpu_to_fdt32(phandle);
 
 			reference_node(refnode);
@@ -652,7 +651,7 @@ static void fixup_phandle_references(struct check *c, struct dt_info *dti,
 		}
 
 		/* Create the phandle property for this referenced node */
-		phandle = get_node_phandle(dt, refnode);
+		phandle = get_node_phandle(dti, refnode);
 		exportsym->phandle = phandle;
 
 		reference_node(refnode);
diff --git a/dtc.h b/dtc.h
index d76ba6b7..5d39d31f 100644
--- a/dtc.h
+++ b/dtc.h
@@ -323,7 +323,6 @@ struct property *get_property_by_label(struct node *tree, const char *label,
 struct marker *get_marker_label(struct node *tree, const char *label,
 				struct node **node, struct property **prop);
 struct node *get_subnode(struct node *node, const char *nodename);
-cell_t get_node_phandle(struct node *root, struct node *node);
 
 uint32_t guess_boot_cpuid(struct node *tree);
 
@@ -357,6 +356,7 @@ struct node *get_node_by_path(struct dt_info *dti, const char *path);
 struct node *get_node_by_label(struct dt_info *dti, const char *label);
 struct node *get_node_by_phandle(struct dt_info *dti, cell_t phandle);
 struct node *get_node_by_ref(struct dt_info *dti, const char *ref);
+cell_t get_node_phandle(struct dt_info *dti, struct node *node);
 
 /* DTS version flags definitions */
 #define DTSF_V1		0x0001	/* /dts-v1/ */
diff --git a/livetree.c b/livetree.c
index 40ca873a..c42e9a97 100644
--- a/livetree.c
+++ b/livetree.c
@@ -960,14 +960,14 @@ static void add_phandle_property(struct node *node,
 	add_property(node, build_property(name, d, NULL));
 }
 
-cell_t get_node_phandle(struct node *root, struct node *node)
+cell_t get_node_phandle(struct dt_info *dti, struct node *node)
 {
 	static cell_t phandle = 1; /* FIXME: ick, static local */
 
 	if (phandle_is_valid(node->phandle))
 		return node->phandle;
 
-	while (get_node_by_phandle_(root, phandle))
+	while (get_node_by_phandle(dti, phandle))
 		phandle++;
 
 	node->phandle = phandle;
@@ -1250,7 +1250,6 @@ static void generate_label_tree_internal(struct dt_info *dti,
 					 struct node *an, struct node *node,
 					 bool allocph)
 {
-	struct node *dt = dti->dt;
 	struct node *c;
 	struct property *p;
 	struct label *l;
@@ -1280,7 +1279,7 @@ static void generate_label_tree_internal(struct dt_info *dti,
 
 		/* force allocation of a phandle for this node */
 		if (allocph)
-			(void)get_node_phandle(dt, node);
+			(void)get_node_phandle(dti, node);
 	}
 
 	for_each_child(node, c)
-- 
2.55.0

