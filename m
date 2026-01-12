Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6FB362133
	for <devicetree-compiler@vger.kernel.org>; Mon, 12 Jan 2026 14:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227696; cv=none; b=jvgKVB8+tUpIkGg4Au7fhoZzNozDkIcqr31HVKefhbK/3AQjz/3ICu6uihPIxsld/xhpis/N/uBZKWckdNX/JeGhUw1KTPUqdXmPgDRaNsvbs3UfzjKE0c6fcpla2P81qC0XGvJQbzL0AS0EcNTqRQjkXfOHN5rouOSOocNfvsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227696; c=relaxed/simple;
	bh=Q1Jcf8MoLeMwNAM9YXolzqu1U6JMXXZJYqA8IOX1ZGE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YFwjuh2kiH33OcK/GWYeMg0wWsoLovHea/Xblji2DGIs/jX9FjcJRxHzcgByddfCxluo5YyZ1clbz0Zmp6K7T3AJX8Wi0ZLgZucea3g9lXQAR3KsBbqTw5UOvrbXXqAxHv4Uj+m8wUaTiPPI0T+hqmXmpX5YQPGcO2BLhMdC1BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=neW6A/ev; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="neW6A/ev"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 95BC14E42088;
	Mon, 12 Jan 2026 14:21:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 61BD1606FA;
	Mon, 12 Jan 2026 14:21:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5211B103C8C61;
	Mon, 12 Jan 2026 15:21:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227690; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=ApNNZkGBMsyCar9fLA5GMRRYXn3l1pTg4D1D7ZaVA8o=;
	b=neW6A/evWJMpR9n1IFvGrJGVsnfF7CmNz2YrSzPePAJfg1UbHd9qftI7iY+Jgawzla+C3d
	V8FXweDYZZY2vg8+9gfytEKoSQ62Louei20wu5p2NtXnSpUpLLXWID0Q8hfrB1KaJuHCw0
	m3cidEiXwVFxoEcxeXYRiXoKWiUfxhJSsOLBKZsUb6e7hfl9svoe000GMSIMhOTlT5sfOp
	KM7outFF1ttwvygNrfaofAvmemQnupL2snhDKE78+Dq1QPGUuVoEkDy2YZ/bg68Rjp7Ccl
	hXDNGdVSFwI1kM2KfSygRSNvcAdmcuXUP4mKwmRdCwR6o5sjG5RaYuM3Qmf/cg==
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
Subject: [RFC PATCH 46/77] dtc: Introduce dti_get_marker_label()
Date: Mon, 12 Jan 2026 15:19:36 +0100
Message-ID: <20260112142009.1006236-47-herve.codina@bootlin.com>
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

To prepare this change, introduce and use dti_get_marker_label().

dti_get_marker_label() retrieves a marker and its related node and
property based on the label value. It behaves in the same way as
get_marker_label() but it works at the struct dt_info level.

It handles the case where a 'root' device-tree is not present and will
handle orphan nodes trees as soon as they will be introduced.

This introduction doesn't lead to any functional changes.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 checks.c   |  5 ++---
 dtc.h      |  4 ++--
 livetree.c | 18 +++++++++++++++++-
 3 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/checks.c b/checks.c
index 75040c0..0a855f9 100644
--- a/checks.c
+++ b/checks.c
@@ -439,7 +439,6 @@ static void check_duplicate_label(struct check *c, struct dt_info *dti,
 				  const char *label, struct node *node,
 				  struct property *prop, struct marker *mark)
 {
-	struct node *dt = dti->dt;
 	struct node *othernode = NULL;
 	struct property *otherprop = NULL;
 	struct marker *othermark = NULL;
@@ -449,8 +448,8 @@ static void check_duplicate_label(struct check *c, struct dt_info *dti,
 	if (!othernode)
 		otherprop = dti_get_property_by_label(dti, label, &othernode);
 	if (!othernode)
-		othermark = get_marker_label(dt, label, &othernode,
-					       &otherprop);
+		othermark = dti_get_marker_label(dti, label, &othernode,
+						 &otherprop);
 
 	if (!othernode)
 		return;
diff --git a/dtc.h b/dtc.h
index 399e7fa..d45a84c 100644
--- a/dtc.h
+++ b/dtc.h
@@ -318,8 +318,6 @@ const char *get_unitname(struct node *node);
 struct property *get_property(struct node *node, const char *propname);
 cell_t propval_cell(struct property *prop);
 cell_t propval_cell_n(struct property *prop, unsigned int n);
-struct marker *get_marker_label(struct node *tree, const char *label,
-				struct node **node, struct property **prop);
 struct node *get_subnode(struct node *node, const char *nodename);
 
 uint32_t guess_boot_cpuid(struct node *tree);
@@ -358,6 +356,8 @@ cell_t dti_get_node_phandle(struct dt_info *dti, struct node *node);
 struct property *dti_get_property_by_label(struct dt_info *dti,
 					   const char *label,
 					   struct node **node);
+struct marker *dti_get_marker_label(struct dt_info *dti, const char *label,
+				    struct node **node, struct property **prop);
 
 /* DTS version flags definitions */
 #define DTSF_V1		0x0001	/* /dts-v1/ */
diff --git a/livetree.c b/livetree.c
index d023075..79f7b55 100644
--- a/livetree.c
+++ b/livetree.c
@@ -620,7 +620,7 @@ static struct property *get_property_by_label(struct node *tree, const char *lab
 	return NULL;
 }
 
-struct marker *get_marker_label(struct node *tree, const char *label,
+static struct marker *get_marker_label(struct node *tree, const char *label,
 				struct node **node, struct property **prop)
 {
 	struct marker *m;
@@ -853,6 +853,22 @@ struct property *dti_get_property_by_label(struct dt_info *dti,
 	return NULL;
 }
 
+struct marker *dti_get_marker_label(struct dt_info *dti, const char *label,
+				    struct node **node, struct property **prop)
+{
+	struct marker *marker;
+
+	if (dti->dt) {
+		marker = get_marker_label(dti->dt, label, node, prop);
+		if (marker)
+			return marker;
+	}
+
+	*prop = NULL;
+	*node = NULL;
+	return NULL;
+}
+
 static void add_phandle_property(struct node *node,
 				 const char *name, int format)
 {
-- 
2.52.0

