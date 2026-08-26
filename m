Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094CF3D4116;
	Wed, 26 Aug 2026 09:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787737968; cv=none; b=OVqEFxh1SUc/QNCxG6siJt9o8FwZxM+ywA9vF05rJFoCfiodZi52v0Mo4ReYTG5K0ksHnz6e6qBT/Hai7PPY+ZKVGklZFl85TDH/2qwDNDdW5TgQCv96J3fIiRi/NrJhsV8uPlR5eFnHqjWpas4tk5nkurToSgYifE/bvn7SOyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787737968; c=relaxed/simple;
	bh=X7pbhpg/101LTo9o/g7iMXtMT2XWu7B+pPxVH8av++M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ugsFbltDttSxXq/vAdFBBl70AxPsZ4JcGrMpgYQ3xwDTdc5Klsx0baTPOLWnSzOWe/WYrkd8DoLOiVK5b6SX6jkVjeYoDSh3adXVyx02uEVtYIJ+hX6BKFunjQLBCm0fojqJ1gG3JX0YLHFgMKgHMWuO/CLr1KRD1p9swCrb6VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Il8RseLc; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Il8RseLc"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 555921A183D;
	Wed, 26 Aug 2026 09:52:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2982B604EC;
	Wed, 26 Aug 2026 09:52:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3FD1A11C7AD5F;
	Wed, 26 Aug 2026 11:52:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787737964; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=rypeYF4ruAu+q4k7ZH+e67Lzb0VdbijEBA0/zrRJ2tA=;
	b=Il8RseLc9Mx5hnMkmLQUeJzV4TP38f2WqVCz92emevxGgM5RiYXRQhxuv9sgxNBQowjSvA
	FtWr/394LMrYRoiGiM99II2zOCqxTck4jvR5MdLbi9/A7BzltbYW00UKOrcfJiNV6RYeKy
	ODJ81wqYopCgTuo4ir0fkABf1gZB4HhVAexNy0r1Ap+a2qM7+STivL5CNwgyeJokA8gSV1
	nPa7ddbFQZRLmSNojkRBVvgI06jSl27YCL7n9UjRgA+dzy1SbixDvdqUeQ9CCJhiFOMh6x
	H9R6lVVmCsgQHv6YAIZWG1cZaAoIwiVFbEt5aK5va0XN5sDQv2GNCZwyzQILjw==
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
Subject: [RFC PATCH v2 42/74] dtc: Change get_marker_label() signature to take dt_info
Date: Wed, 26 Aug 2026 11:49:11 +0200
Message-ID: <20260826094950.1088288-43-herve.codina@bootlin.com>
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

To prepare orphan nodes introduction, move get_marker_label() parameter
one level up and use dt_info struct instead of the 'root' tree (i.e.
dti->dt).

This change doesn't lead to any functional changes.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 checks.c   |  4 +---
 dtc.h      |  4 ++--
 livetree.c | 22 +++++++++++++++++++---
 3 files changed, 22 insertions(+), 8 deletions(-)

diff --git a/checks.c b/checks.c
index 7b52f37c..2b87e212 100644
--- a/checks.c
+++ b/checks.c
@@ -447,7 +447,6 @@ static void check_duplicate_label(struct check *c, struct dt_info *dti,
 				  const char *label, struct node *node,
 				  struct property *prop, struct marker *mark)
 {
-	struct node *dt = dti->dt;
 	struct node *othernode = NULL;
 	struct property *otherprop = NULL;
 	struct marker *othermark = NULL;
@@ -457,8 +456,7 @@ static void check_duplicate_label(struct check *c, struct dt_info *dti,
 	if (!othernode)
 		otherprop = get_property_by_label(dti, label, &othernode);
 	if (!othernode)
-		othermark = get_marker_label(dt, label, &othernode,
-					       &otherprop);
+		othermark = get_marker_label(dti, label, &othernode, &otherprop);
 
 	if (!othernode)
 		return;
diff --git a/dtc.h b/dtc.h
index b596cdd0..e2d90f63 100644
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
@@ -357,6 +355,8 @@ struct node *get_node_by_ref(struct dt_info *dti, const char *ref);
 cell_t get_node_phandle(struct dt_info *dti, struct node *node);
 struct property *get_property_by_label(struct dt_info *dti, const char *label,
 				       struct node **node);
+struct marker *get_marker_label(struct dt_info *dti, const char *label,
+				struct node **node, struct property **prop);
 
 /* DTS version flags definitions */
 #define DTSF_V1		0x0001	/* /dts-v1/ */
diff --git a/livetree.c b/livetree.c
index 332f2196..f8abc5d4 100644
--- a/livetree.c
+++ b/livetree.c
@@ -733,8 +733,8 @@ static struct property *get_property_by_label_(struct node *tree,
 	return NULL;
 }
 
-struct marker *get_marker_label(struct node *tree, const char *label,
-				struct node **node, struct property **prop)
+static struct marker *get_marker_label_(struct node *tree, const char *label,
+					struct node **node, struct property **prop)
 {
 	struct marker *m;
 	struct property *p;
@@ -751,7 +751,7 @@ struct marker *get_marker_label(struct node *tree, const char *label,
 	}
 
 	for_each_child(tree, c) {
-		m = get_marker_label(c, label, node, prop);
+		m = get_marker_label_(c, label, node, prop);
 		if (m)
 			return m;
 	}
@@ -960,6 +960,22 @@ struct property *get_property_by_label(struct dt_info *dti, const char *label,
 	return NULL;
 }
 
+struct marker *get_marker_label(struct dt_info *dti, const char *label,
+				struct node **node, struct property **prop)
+{
+	struct marker *marker;
+
+	if (dti->dt) {
+		marker = get_marker_label_(dti->dt, label, node, prop);
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
2.55.0

