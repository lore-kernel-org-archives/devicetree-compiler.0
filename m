Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3632364042
	for <devicetree-compiler@vger.kernel.org>; Mon, 12 Jan 2026 14:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227702; cv=none; b=ltRBELtmeddzmOYDiG5Uzetrk1rlca+hv9iKdjsw+vG6h3B+2O16F3dt76HGrt14sFA5KYnpyt+El4LbZqvVr6u5j2z6LNsVIGwjetdt933sr/sYVkpevK/aAD582EO96NmlfezGogkyqMghEGo6QFPF6c8Y7oggL6WmclWwBiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227702; c=relaxed/simple;
	bh=SpKTLYZw+7+wk09Q6+LPHx3wY4M0iZWECVL3fNbTi2s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UQeeKUnZL84UgBWPc9eCsrag5TZj2YZIFDakxDTeEc1jbsZxJlTf/5663/OA2GguQ3biRw41nDIRmmNKE7bMDe2/sTdk2z6Nnk2MPNQDk7h1gZXOH3EtDCOLdLnHkoIpEeTlqUHPK/KBuY82x0nj1C7NX/9rNeGCWvtKoWSrvW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=r7M72lOp; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="r7M72lOp"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6A0831A2814;
	Mon, 12 Jan 2026 14:21:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 40B4B606FA;
	Mon, 12 Jan 2026 14:21:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DB21B103C8C61;
	Mon, 12 Jan 2026 15:21:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227695; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=OIU7yMsMxh2KeC6oAXfD8LVNFfIHsbZQjQQWSDSKeoM=;
	b=r7M72lOpHlnFvBidwcX3AjvSXgnAS6UMbbTMRzQTialQ4PmQS989zeQnyo+tK2BlYDJekh
	4e5PZ6AjlnvM8LzDi8roFHvy6gNeZsEqeTvfL7JKkVA1jqDfIhHGo1Lu8I5ncdtaVCj4my
	8DdVlCOfmhTsBF/LWAxO62MWVtXU5OV7R2Svp5bTytDgniGnhhXtJLAg42eEgaXzW4pnE8
	7Hkq/HxOFvxtjZfw54kwhhzHqx9IPHTVctCEeyM6m7lvfhC9N/5Ny3nKAbCGE+oTMgdO7v
	rIqOJv7NiDNKmpJpeELWAqln6wCpD16K5dW/YxbD1Rw/aUrOPkEDwYA3pl2poQ==
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
Subject: [RFC PATCH 49/77] dtc: Handle orphan nodes in dti_get_xxx_by_yyy()
Date: Mon, 12 Jan 2026 15:19:39 +0100
Message-ID: <20260112142009.1006236-50-herve.codina@bootlin.com>
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

Orphan nodes have been introduced recently.

Retrieving a node, a property and/or a marker from an orphan node tree
is perfectly legit.

Those retrievals are performed by the dti_get_xxx_by_yyy() functions
family.

Update them to handle orphan nodes.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 livetree.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/livetree.c b/livetree.c
index 057997a..fa9daff 100644
--- a/livetree.c
+++ b/livetree.c
@@ -789,6 +789,7 @@ static struct node *get_node_by_ref(struct node *tree, const char *ref)
 
 struct node *dti_get_node_by_path(struct dt_info *dti, const char *path)
 {
+	struct node *orphan;
 	struct node *node;
 
 	if (dti->dt) {
@@ -797,11 +798,18 @@ struct node *dti_get_node_by_path(struct dt_info *dti, const char *path)
 			return node;
 	}
 
+	for_each_orphan(dti->orphanlist, orphan) {
+		node = get_node_by_path(orphan, path);
+		if (node)
+			return node;
+	}
+
 	return NULL;
 }
 
 struct node *dti_get_node_by_label(struct dt_info *dti, const char *label)
 {
+	struct node *orphan;
 	struct node *node;
 
 	if (dti->dt) {
@@ -810,11 +818,18 @@ struct node *dti_get_node_by_label(struct dt_info *dti, const char *label)
 			return node;
 	}
 
+	for_each_orphan(dti->orphanlist, orphan) {
+		node = get_node_by_label(orphan, label);
+		if (node)
+			return node;
+	}
+
 	return NULL;
 }
 
 struct node *dti_get_node_by_phandle(struct dt_info *dti, cell_t phandle)
 {
+	struct node *orphan;
 	struct node *node;
 
 	if (dti->dt) {
@@ -823,11 +838,18 @@ struct node *dti_get_node_by_phandle(struct dt_info *dti, cell_t phandle)
 			return node;
 	}
 
+	for_each_orphan(dti->orphanlist, orphan) {
+		node = get_node_by_phandle(orphan, phandle);
+		if (node)
+			return node;
+	}
+
 	return NULL;
 }
 
 struct node *dti_get_node_by_ref(struct dt_info *dti, const char *ref)
 {
+	struct node *orphan;
 	struct node *node;
 
 	if (dti->dt) {
@@ -836,6 +858,12 @@ struct node *dti_get_node_by_ref(struct dt_info *dti, const char *ref)
 			return node;
 	}
 
+	for_each_orphan(dti->orphanlist, orphan) {
+		node = get_node_by_ref(orphan, ref);
+		if (node)
+			return node;
+	}
+
 	return NULL;
 }
 
@@ -844,6 +872,7 @@ struct property *dti_get_property_by_label(struct dt_info *dti,
 					   struct node **node)
 {
 	struct property *property;
+	struct node *orphan;
 
 	if (dti->dt) {
 		property = get_property_by_label(dti->dt, label, node);
@@ -851,6 +880,12 @@ struct property *dti_get_property_by_label(struct dt_info *dti,
 			return property;
 	}
 
+	for_each_orphan(dti->orphanlist, orphan) {
+		property = get_property_by_label(orphan, label, node);
+		if (property)
+			return property;
+	}
+
 	*node = NULL;
 	return NULL;
 }
@@ -859,6 +894,7 @@ struct marker *dti_get_marker_label(struct dt_info *dti, const char *label,
 				    struct node **node, struct property **prop)
 {
 	struct marker *marker;
+	struct node *orphan;
 
 	if (dti->dt) {
 		marker = get_marker_label(dti->dt, label, node, prop);
@@ -866,6 +902,12 @@ struct marker *dti_get_marker_label(struct dt_info *dti, const char *label,
 			return marker;
 	}
 
+	for_each_orphan(dti->orphanlist, orphan) {
+		marker = get_marker_label(orphan, label, node, prop);
+		if (marker)
+			return marker;
+	}
+
 	*prop = NULL;
 	*node = NULL;
 	return NULL;
-- 
2.52.0

