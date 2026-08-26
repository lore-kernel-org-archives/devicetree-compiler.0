Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E92C3F8238;
	Wed, 26 Aug 2026 09:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787737965; cv=none; b=dX5Gq4PO7q2pF2jk/QS1Pgiaje0KBIMYY74Bu62bviRZEmaiLmFdeBHlle3LozbtiUx00x98oDH15KhpByX9vSkCLY7qdCOSGktUbA87wiKa/KlcgUZGonKBSOw2rxrJ+Wl9GfwEZTZn1QuGv0HaF6IeqniBAtPXjhxRe8J4Gbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787737965; c=relaxed/simple;
	bh=ER1wpXHuOFXSc2YfRXwmOJQb9Kd2be2N50hEvOPb98U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VZVNG7x00G+iIajlbWFTby9erY61l2saoWXrWZUAZVzoneGnhKjiH10N5v5k6606FS4J3wtxxt0JsfR0wirTNxB+kev9KAnlWH4u7GHxQ6WxOyF90mBD+esFCOPNBpEFZtpOwriEw/S0jItlxX4cX14en7FUftWJN2abqwPQ6uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=qDcfo5gR; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="qDcfo5gR"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EFCFA4E413BC;
	Wed, 26 Aug 2026 09:52:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BCD67604EC;
	Wed, 26 Aug 2026 09:52:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DFC7611C7AD65;
	Wed, 26 Aug 2026 11:52:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787737961; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=3TAZMcxQuW3Lm3yQGKPSTKq+cID7+OJiFxL6KynFLLo=;
	b=qDcfo5gR41dgQyK6zrNVdC7Tr3x9pfZNLwSNQzLnR+H1MJ0iVtH9OqtWoza8h6Y64anR78
	W9z4gRDvXX0xK9frBey2ubEcfOBKim5QQBz5WFjecxpOqbh7qDp39OIrV1QympFRqL8WZ6
	OxtMYhz4RHCb2xQvhqhK2mBuhyzsAmJKzc3GG5yNckFkgMHZPhP6vFSCwXMpTA5OvhwEZl
	FT4XIUz+UsX7B+djved0eoPy+5rbL0rPsxC5ftJ+pPNM/1accoYn7vgezOCUZ4SjbKuTLj
	HsZIQdr0Wpdc77hjH3gHtl3iI8PLHlQbN1tqNk8JT1XvCC7s1qegyePg7Z/CWA==
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
Subject: [RFC PATCH v2 41/74] dtc: Change get_property_by_label() signature to take dt_info
Date: Wed, 26 Aug 2026 11:49:10 +0200
Message-ID: <20260826094950.1088288-42-herve.codina@bootlin.com>
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

To prepare orphan nodes introduction, move get_property_by_label()
parameter one level up and use dt_info struct instead of the 'root' tree
(i.e. dti->dt).

This change doesn't lead to any functional changes.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 checks.c   |  2 +-
 dtc.h      |  4 ++--
 livetree.c | 22 +++++++++++++++++++---
 3 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/checks.c b/checks.c
index f90a8eed..7b52f37c 100644
--- a/checks.c
+++ b/checks.c
@@ -455,7 +455,7 @@ static void check_duplicate_label(struct check *c, struct dt_info *dti,
 	othernode = get_node_by_label(dti, label);
 
 	if (!othernode)
-		otherprop = get_property_by_label(dt, label, &othernode);
+		otherprop = get_property_by_label(dti, label, &othernode);
 	if (!othernode)
 		othermark = get_marker_label(dt, label, &othernode,
 					       &otherprop);
diff --git a/dtc.h b/dtc.h
index 5d39d31f..b596cdd0 100644
--- a/dtc.h
+++ b/dtc.h
@@ -318,8 +318,6 @@ const char *get_unitname(struct node *node);
 struct property *get_property(struct node *node, const char *propname);
 cell_t propval_cell(struct property *prop);
 cell_t propval_cell_n(struct property *prop, unsigned int n);
-struct property *get_property_by_label(struct node *tree, const char *label,
-				       struct node **node);
 struct marker *get_marker_label(struct node *tree, const char *label,
 				struct node **node, struct property **prop);
 struct node *get_subnode(struct node *node, const char *nodename);
@@ -357,6 +355,8 @@ struct node *get_node_by_label(struct dt_info *dti, const char *label);
 struct node *get_node_by_phandle(struct dt_info *dti, cell_t phandle);
 struct node *get_node_by_ref(struct dt_info *dti, const char *ref);
 cell_t get_node_phandle(struct dt_info *dti, struct node *node);
+struct property *get_property_by_label(struct dt_info *dti, const char *label,
+				       struct node **node);
 
 /* DTS version flags definitions */
 #define DTSF_V1		0x0001	/* /dts-v1/ */
diff --git a/livetree.c b/livetree.c
index c42e9a97..332f2196 100644
--- a/livetree.c
+++ b/livetree.c
@@ -706,8 +706,9 @@ cell_t propval_cell_n(struct property *prop, unsigned int n)
 	return fdt32_to_cpu(*((fdt32_t *)prop->val.val + n));
 }
 
-struct property *get_property_by_label(struct node *tree, const char *label,
-				       struct node **node)
+static struct property *get_property_by_label_(struct node *tree,
+					       const char *label,
+					       struct node **node)
 {
 	struct property *prop;
 	struct node *c;
@@ -723,7 +724,7 @@ struct property *get_property_by_label(struct node *tree, const char *label,
 	}
 
 	for_each_child(tree, c) {
-		prop = get_property_by_label(c, label, node);
+		prop = get_property_by_label_(c, label, node);
 		if (prop)
 			return prop;
 	}
@@ -944,6 +945,21 @@ struct node *get_node_by_ref(struct dt_info *dti, const char *ref)
 	return NULL;
 }
 
+struct property *get_property_by_label(struct dt_info *dti, const char *label,
+				       struct node **node)
+{
+	struct property *property;
+
+	if (dti->dt) {
+		property = get_property_by_label_(dti->dt, label, node);
+		if (property)
+			return property;
+	}
+
+	*node = NULL;
+	return NULL;
+}
+
 static void add_phandle_property(struct node *node,
 				 const char *name, int format)
 {
-- 
2.55.0

