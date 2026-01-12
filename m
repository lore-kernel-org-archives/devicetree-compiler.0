Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C18361DB3;
	Mon, 12 Jan 2026 14:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227696; cv=none; b=F0MIvLOpsoWruMsxolAYsoatBOE+sNFqsxcqKyWGlx5ai73OUT2YUfUv9LEDL4u+JQctoh1ha2PZsTy0IWkEKzpe4hzXWI6ayveFR8pgn0DTiWVpMI1wa1hEt3Cg7qcVcjLjfLBiTNT5eiGkQvfA6A5XzfZQ7P+REhV9L9DvOsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227696; c=relaxed/simple;
	bh=J4OwbzsaGmvStRtfoi4aXlIuTe0bzd/9gdauNOCKTx0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SPSEdggEp2oQx+G3Mw/BnJEiSNQ2fuZxizS99QFT805cBfgZwmM3Pf1Ei0vmyfxGfpbYrIBGh9X2TXfKjBZFKqmZZPj3xiB7r509ZQPJ/kY3bo3Y7m+mEb9z8fYnA3XS5fGHuBBjLZGh+IpepzOBErSEmDMu9By940u64F/vQ4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=1yjdFBCB; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="1yjdFBCB"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 36D34C2086E;
	Mon, 12 Jan 2026 14:21:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AEDDC606FA;
	Mon, 12 Jan 2026 14:21:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DB427103C926F;
	Mon, 12 Jan 2026 15:21:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227688; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=dOGFWVUqh1Cd7Jo0lpL3swxRFgTM5DRrEwAInjw1SZY=;
	b=1yjdFBCBnIotTLCgeD0IVWoZ8VEEtPDSC8TVGnYHPomUhlJXxFk7QTj2hcmyPF5CIAu4yh
	FnnPquZEp+VveLY2kKTUWBKqlKwr02ak4ZJQgUA9E4/c2fqqAtFTay0lxwkY8vyCrFaY8P
	6ynhQTRfpInlSAQNOA0mfTpntzDfcVVBzNvOqVlA9zOhFxkJK92s6mujw/73TT9R2CSLUt
	S8jybZAvLtxk4+Xv0oQedLwBaVpnlKp7yZf/THRCTto8wTyUYV805vitIq3KNTF4IHJ13m
	Pu1OzW5heKNmqs8DOnX/hkC9xtgmZijvo5LcRCpp0j9lPipToHr9i8OyaOTgnw==
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
Subject: [RFC PATCH 45/77] dtc: Introduce dti_get_property_by_label()
Date: Mon, 12 Jan 2026 15:19:35 +0100
Message-ID: <20260112142009.1006236-46-herve.codina@bootlin.com>
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

To prepare this change, introduce and use dti_get_property_by_label().

dti_get_property_by_label() retrieves a property (and the related
node) by its label like get_property_by_label() but it works at the
struct dt_info level.

It handles the case where a 'root' device-tree is not present and will
handle orphan nodes trees as soon as they will be introduced.

This introduction doesn't lead to any functional changes.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 checks.c   |  2 +-
 dtc.h      |  5 +++--
 livetree.c | 18 +++++++++++++++++-
 3 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/checks.c b/checks.c
index 7dd5032..75040c0 100644
--- a/checks.c
+++ b/checks.c
@@ -447,7 +447,7 @@ static void check_duplicate_label(struct check *c, struct dt_info *dti,
 	othernode = dti_get_node_by_label(dti, label);
 
 	if (!othernode)
-		otherprop = get_property_by_label(dt, label, &othernode);
+		otherprop = dti_get_property_by_label(dti, label, &othernode);
 	if (!othernode)
 		othermark = get_marker_label(dt, label, &othernode,
 					       &otherprop);
diff --git a/dtc.h b/dtc.h
index f7b0b23..399e7fa 100644
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
@@ -357,6 +355,9 @@ struct node *dti_get_node_by_label(struct dt_info *dti, const char *label);
 struct node *dti_get_node_by_phandle(struct dt_info *dti, cell_t phandle);
 struct node *dti_get_node_by_ref(struct dt_info *dti, const char *ref);
 cell_t dti_get_node_phandle(struct dt_info *dti, struct node *node);
+struct property *dti_get_property_by_label(struct dt_info *dti,
+					   const char *label,
+					   struct node **node);
 
 /* DTS version flags definitions */
 #define DTSF_V1		0x0001	/* /dts-v1/ */
diff --git a/livetree.c b/livetree.c
index a4917d1..d023075 100644
--- a/livetree.c
+++ b/livetree.c
@@ -594,7 +594,7 @@ cell_t propval_cell_n(struct property *prop, unsigned int n)
 	return fdt32_to_cpu(*((fdt32_t *)prop->val.val + n));
 }
 
-struct property *get_property_by_label(struct node *tree, const char *label,
+static struct property *get_property_by_label(struct node *tree, const char *label,
 				       struct node **node)
 {
 	struct property *prop;
@@ -837,6 +837,22 @@ struct node *dti_get_node_by_ref(struct dt_info *dti, const char *ref)
 	return NULL;
 }
 
+struct property *dti_get_property_by_label(struct dt_info *dti,
+					   const char *label,
+					   struct node **node)
+{
+	struct property *property;
+
+	if (dti->dt) {
+		property = get_property_by_label(dti->dt, label, node);
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
2.52.0

