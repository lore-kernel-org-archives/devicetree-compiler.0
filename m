Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03B93F326A;
	Wed, 26 Aug 2026 09:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787737941; cv=none; b=pkhg22/s3s8O+1fcONcpQeePJzXqLgxr6wuOXHu/k/7jW6GYwoUYOixtLubYxLJyaj9wt0iuDqle8Kqw6/WJYDGSXWtcUjIHJKbsJil56I2+Xf+/A3WkQGAHuPxXnJ7AQq4wh943XQjPoqgbgejVPpHEhRBOhkUyuMPz9Vj0REQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787737941; c=relaxed/simple;
	bh=NaNVUT6wvnmE8Ho+05Mk//9ZEq0oKP+SzwPacklKl18=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tfj79LFdBgN9Yaof9JWZF2RbNngIXO4Hr0iz1X2w03F5joNhzB52TnLY5ZDO3aYe+ED0yHg41FOcKV0cx8ZZstxy4+FNRHk5vM6CST6CWv3AMGI+2wmsjQP28wogadmBdy9ElssalffR0WDbtwiF6i5FnerTfqJJZyvB8/rXswQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=V3+dHRwu; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="V3+dHRwu"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2E3911A183D;
	Wed, 26 Aug 2026 09:52:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EF9BC604EC;
	Wed, 26 Aug 2026 09:52:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 74A0511C7AD5F;
	Wed, 26 Aug 2026 11:52:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787737936; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=FpmeaaUP4D5ANThl7zwuZhCEyKXYJbxhpxiPGmadqp8=;
	b=V3+dHRwuRPhjleWwp2KlK1OxTF46yt1Cerop/ouSKWsgcOYuQOnRoT2vo3XhYaQtjAnF0b
	yFABofU5SdzBBOgL5DEz9twCvDb3Ixuo24NA94EdCLsfFPyTLfB8ZvBIIx+QtEEy/E1k9b
	4Kk6X1DAtQTr7eSR3TIXsEeUEP9YHAQgoR1dZZAoUxCl4vdNfpkA2ir7Vs2gUCJbAPzQq5
	z0lvLEW5dg+NZsjsWAWVOCiwmdpf5FiWt7ezgSkwk42xpeZYEmRosvgA5sJ0FFuHiRnDt/
	DcGHUZyw2JISGB6pBGvoPiBqceTFoOZ5RMCmyWDIVqxrn958KlYy/nCP6dgCig==
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
Subject: [RFC PATCH v2 36/74] dtc: Change get_node_by_path() signature to take dt_info
Date: Wed, 26 Aug 2026 11:49:05 +0200
Message-ID: <20260826094950.1088288-37-herve.codina@bootlin.com>
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

To prepare orphan nodes introduction, move get_node_by_path() parameter
one level up and use dt_info struct instead of the 'root' tree (i.e.
dti->dt).

This change doesn't lead to any functional changes.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 checks.c   |  2 +-
 dtc.h      |  3 ++-
 livetree.c | 20 ++++++++++++++------
 3 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/checks.c b/checks.c
index 1332acc4..3b852a9d 100644
--- a/checks.c
+++ b/checks.c
@@ -748,7 +748,7 @@ static void check_alias_paths(struct check *c, struct dt_info *dti,
 
 		/* This check does not work for overlays nor addons with external paths */
 		if (!(dti->dtsflags & (DTSF_PLUGIN | DTSF_ADDON)) &&
-		    (!prop->val.val || !get_node_by_path(dti->dt, prop->val.val))) {
+		    (!prop->val.val || !get_node_by_path(dti, prop->val.val))) {
 			FAIL_PROP(c, dti, node, prop, "aliases property is not a valid node (%s)",
 				  prop->val.val);
 			continue;
diff --git a/dtc.h b/dtc.h
index 61521329..a07df2c8 100644
--- a/dtc.h
+++ b/dtc.h
@@ -323,7 +323,6 @@ struct property *get_property_by_label(struct node *tree, const char *label,
 struct marker *get_marker_label(struct node *tree, const char *label,
 				struct node **node, struct property **prop);
 struct node *get_subnode(struct node *node, const char *nodename);
-struct node *get_node_by_path(struct node *tree, const char *path);
 struct node *get_node_by_label(struct node *tree, const char *label);
 struct node *get_node_by_phandle(struct node *tree, cell_t phandle);
 struct node *get_node_by_ref(struct node *tree, const char *ref);
@@ -357,6 +356,8 @@ struct dt_info {
 	const char *outname;		/* filename being written to, "-" for stdout */
 };
 
+struct node *get_node_by_path(struct dt_info *dti, const char *path);
+
 /* DTS version flags definitions */
 #define DTSF_V1		0x0001	/* /dts-v1/ */
 #define DTSF_PLUGIN	0x0002	/* /plugin/ */
diff --git a/livetree.c b/livetree.c
index 130ddf25..0120efd2 100644
--- a/livetree.c
+++ b/livetree.c
@@ -771,7 +771,7 @@ struct node *get_subnode(struct node *node, const char *nodename)
 	return NULL;
 }
 
-struct node *get_node_by_path(struct node *tree, const char *path)
+static struct node *get_node_by_path_(struct node *tree, const char *path)
 {
 	const char *p;
 	struct node *child;
@@ -789,7 +789,7 @@ struct node *get_node_by_path(struct node *tree, const char *path)
 
 	for_each_child(tree, child) {
 		if (p && strprefixeq(path, (size_t)(p - path), child->name))
-			return get_node_by_path(child, p+1);
+			return get_node_by_path_(child, p+1);
 		else if (!p && streq(path, child->name))
 			return child;
 	}
@@ -892,11 +892,19 @@ struct node *get_node_by_ref(struct node *tree, const char *ref)
 	}
 
 	if (path)
-		target = get_node_by_path(target, path);
+		target = get_node_by_path_(target, path);
 
 	return target;
 }
 
+struct node *get_node_by_path(struct dt_info *dti, const char *path)
+{
+	if (dti->dt)
+		return get_node_by_path_(dti->dt, path);
+
+	return NULL;
+}
+
 static void add_phandle_property(struct node *node,
 				 const char *name, int format)
 {
@@ -940,7 +948,7 @@ uint32_t guess_boot_cpuid(struct node *tree)
 	struct node *cpus, *bootcpu;
 	struct property *reg;
 
-	cpus = get_node_by_path(tree, "/cpus");
+	cpus = get_node_by_path_(tree, "/cpus");
 	if (!cpus)
 		return 0;
 
@@ -1415,7 +1423,7 @@ void generate_labels_from_tree(struct dt_info *dti, const char *name)
 	for_each_property(an, p) {
 		struct node *labeled_node;
 
-		labeled_node = get_node_by_path(dti->dt, p->val.val);
+		labeled_node = get_node_by_path_(dti->dt, p->val.val);
 		if (labeled_node)
 			add_label(&labeled_node->labels, p->name);
 		else if (quiet < 1)
@@ -1497,7 +1505,7 @@ void fixup_phandles(struct dt_info *dti, const char *name)
 			 */
 			*(propname - 1) = '\0';
 
-			n = get_node_by_path(dti->dt, fv);
+			n = get_node_by_path_(dti->dt, fv);
 			if (!n && quiet < 1)
 				fprintf(stderr, "Warning: Label %s references non-existing node %s\n",
 					fp->name, fv);
-- 
2.55.0

