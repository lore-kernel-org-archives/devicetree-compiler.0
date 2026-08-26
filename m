Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF0D3C060F;
	Wed, 26 Aug 2026 09:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787737947; cv=none; b=Tp7b5V1nWfEAbFS9hJ0nRfX943AhI4RCtPPTjF5kx/gGmLM8Xgo0ywmTAYM6NNzbysnCwecw2ToefxmweCz1OJ52yoYgGarDUyS3+PjQp1+IL9a/jtLCKa/a1e2mJbfyA4rZSRtQ+f/1MvSr6wANgDIpEVM1yMR4OEqaAJw05ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787737947; c=relaxed/simple;
	bh=nD2OcS/K4Wd3IPOZ2dD5IZv6svHv/qo+znasNDJlosw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G3+jvlHbyLe1qzB0hEjn4D3KffTdXcN/sSQGn+1pzU83V5tLhCIJ6b4RgmCuuHKVyxYv4Z1mYI6s1sS1l9VK8Ny4hPXz8YdZDRPYmPL97vxfvsjw3Deve5VSOrcK2OUBGF0mvWf7LhYxyw7f80/xSg/YJpSh3mR/L/nxE9etdwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=RkEEHzLf; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="RkEEHzLf"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DAC664E413BC;
	Wed, 26 Aug 2026 09:52:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A56E8604EC;
	Wed, 26 Aug 2026 09:52:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 84D4011C780F5;
	Wed, 26 Aug 2026 11:52:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787737939; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=GjuJPcsW5Ab4eYj6YvA1jVYNo1TBMC33woe0oyWmUG8=;
	b=RkEEHzLfqQdA5at1BCPHPovNfNnAy1YRZwLM+kqQag8jk0BebBTL2BExFyGz6eJiBS2/Em
	bf6LWp7ZKdu9qdG6DA2vrLqGqyqI1/s7Kq9oClN9AsLgTtIsuRK+z05ihW4BpvTiwIpoPX
	SmAhbBH3sFfIuFwa9lzh34uEnxdDi2QREI6s6hElEzJ4aF6M7nGdq9JzyTYkhghEKt00ih
	T+x2NU29ClCK9pZHt5EatdpHAUMawju5Uhs5J7egcGI6kD/rLICWiN35TGfoOFlt7qGFZP
	zhkt95IqVDQ0vGqxtt4yK3GVT+0Wxhj9xuXRgIaREVZxVuClU0uDCiD3Z7GgGA==
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
Subject: [RFC PATCH v2 37/74] dtc: Change get_node_by_label() signature to take dt_info
Date: Wed, 26 Aug 2026 11:49:06 +0200
Message-ID: <20260826094950.1088288-38-herve.codina@bootlin.com>
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

To prepare orphan nodes introduction, move get_node_by_label() parameter
one level up and use dt_info struct instead of the 'root' tree (i.e.
dti->dt).

This change doesn't lead to any functional changes.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 checks.c   |  2 +-
 dtc.h      |  2 +-
 livetree.c | 19 ++++++++++++++++---
 3 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/checks.c b/checks.c
index 3b852a9d..f4ae776b 100644
--- a/checks.c
+++ b/checks.c
@@ -452,7 +452,7 @@ static void check_duplicate_label(struct check *c, struct dt_info *dti,
 	struct property *otherprop = NULL;
 	struct marker *othermark = NULL;
 
-	othernode = get_node_by_label(dt, label);
+	othernode = get_node_by_label(dti, label);
 
 	if (!othernode)
 		otherprop = get_property_by_label(dt, label, &othernode);
diff --git a/dtc.h b/dtc.h
index a07df2c8..bf8f0ce4 100644
--- a/dtc.h
+++ b/dtc.h
@@ -323,7 +323,6 @@ struct property *get_property_by_label(struct node *tree, const char *label,
 struct marker *get_marker_label(struct node *tree, const char *label,
 				struct node **node, struct property **prop);
 struct node *get_subnode(struct node *node, const char *nodename);
-struct node *get_node_by_label(struct node *tree, const char *label);
 struct node *get_node_by_phandle(struct node *tree, cell_t phandle);
 struct node *get_node_by_ref(struct node *tree, const char *ref);
 cell_t get_node_phandle(struct node *root, struct node *node);
@@ -357,6 +356,7 @@ struct dt_info {
 };
 
 struct node *get_node_by_path(struct dt_info *dti, const char *path);
+struct node *get_node_by_label(struct dt_info *dti, const char *label);
 
 /* DTS version flags definitions */
 #define DTSF_V1		0x0001	/* /dts-v1/ */
diff --git a/livetree.c b/livetree.c
index 0120efd2..aec1e160 100644
--- a/livetree.c
+++ b/livetree.c
@@ -797,7 +797,7 @@ static struct node *get_node_by_path_(struct node *tree, const char *path)
 	return NULL;
 }
 
-struct node *get_node_by_label(struct node *tree, const char *label)
+static struct node *get_node_by_label_(struct node *tree, const char *label)
 {
 	struct node *child, *node;
 	struct label *l;
@@ -809,7 +809,7 @@ struct node *get_node_by_label(struct node *tree, const char *label)
 			return tree;
 
 	for_each_child(tree, child) {
-		node = get_node_by_label(child, label);
+		node = get_node_by_label_(child, label);
 		if (node)
 			return node;
 	}
@@ -883,7 +883,7 @@ struct node *get_node_by_ref(struct node *tree, const char *ref)
 			path = slash + 1;
 		}
 
-		target = get_node_by_label(tree, label);
+		target = get_node_by_label_(tree, label);
 
 		free(buf);
 
@@ -905,6 +905,19 @@ struct node *get_node_by_path(struct dt_info *dti, const char *path)
 	return NULL;
 }
 
+struct node *get_node_by_label(struct dt_info *dti, const char *label)
+{
+	struct node *node;
+
+	if (dti->dt) {
+		node = get_node_by_label_(dti->dt, label);
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
-- 
2.55.0

