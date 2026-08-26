Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E820E3B83FB
	for <devicetree-compiler@vger.kernel.org>; Wed, 26 Aug 2026 09:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787737987; cv=none; b=pN9LMd2EaaEy7E+USitjfYh6tij0DR9j2ooL3w8+NmRrwyiW6XyEpBU/sACd6/AyyplzPYbVr49OUVcyXuzgpNz1kTTwzji/6PADPqlwd9bTKSVw441JNYq1+Iqrk1n3nOfj5x76dA6wIiFxB6Fgc1MFv/EW9L4vF+WkrQ7jOJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787737987; c=relaxed/simple;
	bh=7uG7E4D9qhhXOQWHcZ6nAEsM827E5OiGTL6M3Ol5EUw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qttlroI70xIKvOY61nkYR7aJeXnw/ggFB/fgDOSDuJBqNAu6/4Yt53cet4j92RWvcQrVqqxsk0udIHWS0F3Vsvpkty6wc3zoPqoWj1ZzV5h0vcoXWktY3Q1SQe3AVReWa+KjcZTF3rid2V/pGUfmtf+XMddfE38d/j89it7Pgvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=arrXAn+p; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="arrXAn+p"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A40B54E413BF;
	Wed, 26 Aug 2026 09:53:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 77799604EC;
	Wed, 26 Aug 2026 09:53:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E0F1C11C7AD35;
	Wed, 26 Aug 2026 11:52:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787737979; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=X3QHQNsEvF+JwH/XQ0R8jOEuG/8AhpR8wL7FDcBtvew=;
	b=arrXAn+pRRe1vngJ45atN9T/kPj/9bs2AiHlf27hNqdFKOEATfGBshcWkzLNFKQp/C+/wi
	8KvlHxmjH5/y5n9UWenOuGFW9ofT9CPdPPETAxle8cPj1PWCxDO63uiXJdX9mOOIWJfWhb
	KHqBoIS9SS8yYNqFhJcl4HjnFbalM2GZ1ISOR2O98pOAJt2L/34AMCR5vh7Mj2RH5j1neC
	FXS513gKfT/JY8K96NiwK4mpdCFX/MQHKieGz5qFD1VtAOupyWpK8jeBZcWdkV5GzRpZ2g
	B/4fi7CNBPOUVZxoRR/0BCJx2IGMqJKRvTdYWT8L7z7k3sZ9Nn+MhjRpY8NbCw==
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
Subject: [RFC PATCH v2 45/74] dtc: Handle orphan nodes in get_xxx_by_yyy()
Date: Wed, 26 Aug 2026 11:49:14 +0200
Message-ID: <20260826094950.1088288-46-herve.codina@bootlin.com>
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

Orphan nodes have been introduced recently.

Retrieving a node, a property and/or a marker from an orphan node tree
is perfectly legit.

Those retrievals are performed by the get_xxx_by_yyy() functions family.

Update them to handle orphan nodes.

Note: Retrieving a node by path (get_node_py_path() function) from an
orphan node tree is not yet supported. Indeed, there is no way to define
a path involving an orphan node.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 livetree.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/livetree.c b/livetree.c
index fddb4b4f..c61025a5 100644
--- a/livetree.c
+++ b/livetree.c
@@ -917,6 +917,7 @@ struct node *get_node_by_path(struct dt_info *dti, const char *path)
 
 struct node *get_node_by_label(struct dt_info *dti, const char *label)
 {
+	struct node *orphan;
 	struct node *node;
 
 	if (dti->dt) {
@@ -925,11 +926,18 @@ struct node *get_node_by_label(struct dt_info *dti, const char *label)
 			return node;
 	}
 
+	for_each_orphan(dti->orphanlist, orphan) {
+		node = get_node_by_label_(orphan, label);
+		if (node)
+			return node;
+	}
+
 	return NULL;
 }
 
 struct node *get_node_by_phandle(struct dt_info *dti, cell_t phandle)
 {
+	struct node *orphan;
 	struct node *node;
 
 	if (dti->dt) {
@@ -938,11 +946,18 @@ struct node *get_node_by_phandle(struct dt_info *dti, cell_t phandle)
 			return node;
 	}
 
+	for_each_orphan(dti->orphanlist, orphan) {
+		node = get_node_by_phandle_(orphan, phandle);
+		if (node)
+			return node;
+	}
+
 	return NULL;
 }
 
 struct node *get_node_by_ref(struct dt_info *dti, const char *ref)
 {
+	struct node *orphan;
 	struct node *node;
 
 	if (dti->dt) {
@@ -951,6 +966,12 @@ struct node *get_node_by_ref(struct dt_info *dti, const char *ref)
 			return node;
 	}
 
+	for_each_orphan(dti->orphanlist, orphan) {
+		node = get_node_by_ref_(orphan, ref);
+		if (node)
+			return node;
+	}
+
 	return NULL;
 }
 
@@ -970,6 +991,7 @@ struct property *get_property_by_label(struct dt_info *dti, const char *label,
 				       struct node **node)
 {
 	struct property *property;
+	struct node *orphan;
 
 	if (dti->dt) {
 		property = get_property_by_label_(dti->dt, label, node);
@@ -977,6 +999,12 @@ struct property *get_property_by_label(struct dt_info *dti, const char *label,
 			return property;
 	}
 
+	for_each_orphan(dti->orphanlist, orphan) {
+		property = get_property_by_label_(orphan, label, node);
+		if (property)
+			return property;
+	}
+
 	*node = NULL;
 	return NULL;
 }
@@ -985,6 +1013,7 @@ struct marker *get_marker_label(struct dt_info *dti, const char *label,
 				struct node **node, struct property **prop)
 {
 	struct marker *marker;
+	struct node *orphan;
 
 	if (dti->dt) {
 		marker = get_marker_label_(dti->dt, label, node, prop);
@@ -992,6 +1021,12 @@ struct marker *get_marker_label(struct dt_info *dti, const char *label,
 			return marker;
 	}
 
+	for_each_orphan(dti->orphanlist, orphan) {
+		marker = get_marker_label_(orphan, label, node, prop);
+		if (marker)
+			return marker;
+	}
+
 	*prop = NULL;
 	*node = NULL;
 	return NULL;
-- 
2.55.0

