Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C3B3B83FB;
	Wed, 26 Aug 2026 09:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787737981; cv=none; b=VXXdoPnXm2sUnl6q4fRFo1zrIawpZbH+deqtRw5occNp8g/Tff6hfPc4guPVQenrFnK0VT5ZIiLUb/QaYt6elQRUkHf2d4HsvY/dFDSiRuV+2YOKlmfnSvxyXDKvsZbwv1CkklhOi/dqmU+rIIfO77krrGXtBu3wKW5HrgU2B0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787737981; c=relaxed/simple;
	bh=5H5Xdqn7I59ry0S69k3x1GpYewCgUlHgFW2KbfC0ipY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B0ubrx5q9Gx/lXV9zKjCoVfBLFmjsZsX3pQiIcvrqEsmHUb0Kaw4Ts5PG51Fspu9ZmUU8frn+MF+NwonWlkA1ACqX+OJvOv+iN3E3D6yjD90tM1vAsxk4jC6u6WMcxqewkfm50YtMRI4Iff3+mxyW9d9+kAxB62Q6IpNjz2RCtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Q3JAXjMt; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Q3JAXjMt"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9CB451A183A;
	Wed, 26 Aug 2026 09:52:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6F873604EC;
	Wed, 26 Aug 2026 09:52:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 259FF11C7AD64;
	Wed, 26 Aug 2026 11:52:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787737973; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=vWyZ7z2zCioyA4zv+IRLz5Gm/rmhGBSJA8vlRVBYNfw=;
	b=Q3JAXjMtKtWK+tp/T4Ws4qV0qdXHsBneN+xF7jmY4qvebRO+C0XAWizbY0ymdhXw0tu56b
	r0bTitpXEHN+9ok1ovHha7quzmav5TvbMDQBqHdDE4bpyErtJAInVLD+ikAH5jyHyHMGBv
	6Kmd+YDwFg4Ceg2oqYOQMBFp6T5bvvPgkwIEfSP3mutudY7Gc9YPXNdLjLlsOeWmCS5ogO
	ZlDzkP8ph8tYqngQEbDaXtLKXSs2Ciw+XJGb/erNa++RR/b7JzOGlP8Kcb737vmjhVYN8V
	MbaP/jxlqgAEoXQN8JhViCWCUbF87jOluVmvWTa6ELkzqBFp4P6J6d4nJ44qzQ==
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
Subject: [RFC PATCH v2 44/74] dtc: Introduce orphan nodes
Date: Wed, 26 Aug 2026 11:49:13 +0200
Message-ID: <20260826094950.1088288-45-herve.codina@bootlin.com>
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

Orphans nodes can be present in plugin and addon device-trees.

Those nodes are nodes without a parent. The root device-tree node is a
particular orphan node and is not part of those 'orphan' nodes group.

The orphan nodes group is related to nodes identified by a reference in
addons or plugins device-trees. For instance, the following node can be
described in addons and plugins (overlay) device-trees:
   --- 8< ---
   &foo {
	subnode {
		prop  = <1>;
	};
   };
   --- 8< ---

The foo referenced node described here has no parent. Indeed, it is not
a child of the root node.

This kind of node is legit in plugins and addons device-tree in order to
perform modification on existing node when the plugin or addon dtb is
applied. The foo referenced node is an existing node in the base tree an
the subnode node is added to the foo referenced node chen the dtb is
applied. Even if foo itself doesn't exists in the plugin or addon
device-tree, it needs to be referenced and modifications expected need
to be described (new sub-node for instance).

In plugin dts, when a orphan node is parsed, the dts structure is
changed and the orphan node is merged in the /fragment@n/__overlay__
node. The foo referenced node mentioned in the previous snippet is
transformed to:
   --- 8< ---
   / {
	fragment@0 {
		target = <&foo>;

		__overlay__ {
			subnode {
				prop = <0x01>;
			};
		};
	};

	__fixups__ {
		foo = "/fragment@0:target:0";
	};
   };
   --- 8< ---

With this mechanism, the orphan node itself doesn't exist anymore in
resulting plugin dtb but the resulting device-tree contains meta-data
mixed with pure 'device-tree' data.

Addons have been introduced to avoid this kind of mixing.

For addons, instead of changing the device-tree structure to add
something similar to fragments and __overlay__ present in plugins, the
orphan node will be present as a new dtb block and will be identified as
orphan thanks to meta-data added in dtb.

Modification done in this commit doesn't add functional changes but just
introduce orphan nodes entry points in data structures and functions in
order to prepare future changes related to parsing/generating dts and
dtb files.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 dtc-parser.y |  4 ++--
 dtc.h        | 10 +++++++++-
 flattree.c   |  3 ++-
 fstree.c     |  3 ++-
 livetree.c   | 16 +++++++++++++++-
 5 files changed, 30 insertions(+), 6 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index dd346fb4..47f644eb 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -132,7 +132,7 @@ sourcefile:
 		{
 			parser_output = build_dt_info($1, $2, $3,
 			                              guess_boot_cpuid($3),
-						      NULL);
+						      NULL, NULL);
 		}
 	|  headers memreserves importlist devicetree
 		{
@@ -143,7 +143,7 @@ sourcefile:
 			 */
 			parser_output = build_dt_info($1, $2, $4,
 			                              $4 ? guess_boot_cpuid($4) : 0,
-			                              reverse_symbol($3));
+			                              reverse_symbol($3), NULL);
 		}
 	;
 
diff --git a/dtc.h b/dtc.h
index e2d90f63..06dd7db1 100644
--- a/dtc.h
+++ b/dtc.h
@@ -250,6 +250,8 @@ struct node {
 	const struct bus_type *bus;
 	struct srcpos *srcpos;
 
+	char *ref; /* Use only for orphan nodes */
+
 	bool omit_if_unused, is_referenced;
 };
 
@@ -277,6 +279,9 @@ struct node {
 #define for_each_symbol(s0, s) \
 	for ((s) = (s0); (s); (s) = (s)->next)
 
+#define for_each_orphan(o0, o) \
+	for ((o) = (o0); (o); (o) = (o)->next_sibling)
+
 void add_label(struct label **labels, char *label);
 void delete_labels(struct label **labels);
 
@@ -345,6 +350,7 @@ struct dt_info {
 	uint32_t boot_cpuid_phys;
 	struct node *dt;		/* the device tree */
 	struct symbol *importsymlist;	/* Import symbol list */
+	struct node *orphanlist;	/* orphan nodes list */
 	const char *outname;		/* filename being written to, "-" for stdout */
 };
 
@@ -357,6 +363,7 @@ struct property *get_property_by_label(struct dt_info *dti, const char *label,
 				       struct node **node);
 struct marker *get_marker_label(struct dt_info *dti, const char *label,
 				struct node **node, struct property **prop);
+bool node_is_orphan(struct dt_info *dti, const struct node *node);
 
 /* DTS version flags definitions */
 #define DTSF_V1		0x0001	/* /dts-v1/ */
@@ -366,7 +373,8 @@ struct marker *get_marker_label(struct dt_info *dti, const char *label,
 struct dt_info *build_dt_info(unsigned int dtsflags,
 			      struct reserve_info *reservelist,
 			      struct node *tree, uint32_t boot_cpuid_phys,
-			      struct symbol *importsymlist);
+			      struct symbol *importsymlist,
+			      struct node *orphanlist);
 void sort_tree(struct dt_info *dti);
 void generate_labels_from_tree(struct dt_info *dti, const char *name);
 void generate_label_tree(struct dt_info *dti, const char *name, bool allocph);
diff --git a/flattree.c b/flattree.c
index 4f4a185a..bd6974b8 100644
--- a/flattree.c
+++ b/flattree.c
@@ -1315,5 +1315,6 @@ struct dt_info *dt_from_blob(const char *fname)
 	if (get_subnode(tree, "__fixups__") || get_subnode(tree, "__local_fixups__"))
 		dtsflags |= DTSF_PLUGIN;
 
-	return build_dt_info(dtsflags, reservelist, tree, boot_cpuid_phys, importsymlist);
+	return build_dt_info(dtsflags, reservelist, tree, boot_cpuid_phys,
+			     importsymlist, NULL);
 }
diff --git a/fstree.c b/fstree.c
index a6aaf1e8..2be1ffaf 100644
--- a/fstree.c
+++ b/fstree.c
@@ -72,5 +72,6 @@ struct dt_info *dt_from_fs(const char *dirname)
 	tree = read_fstree(dirname);
 	tree = name_node(tree, "");
 
-	return build_dt_info(DTSF_V1, NULL, tree, guess_boot_cpuid(tree), NULL);
+	return build_dt_info(DTSF_V1, NULL, tree, guess_boot_cpuid(tree), NULL,
+			     NULL);
 }
diff --git a/livetree.c b/livetree.c
index a8c7c852..fddb4b4f 100644
--- a/livetree.c
+++ b/livetree.c
@@ -656,7 +656,8 @@ static void complete_references(struct dt_info *dti)
 struct dt_info *build_dt_info(unsigned int dtsflags,
 			      struct reserve_info *reservelist,
 			      struct node *tree, uint32_t boot_cpuid_phys,
-			      struct symbol *importsymlist)
+			      struct symbol *importsymlist,
+			      struct node *orphanlist)
 {
 	struct dt_info *dti;
 
@@ -666,6 +667,7 @@ struct dt_info *build_dt_info(unsigned int dtsflags,
 	dti->dt = tree;
 	dti->boot_cpuid_phys = boot_cpuid_phys;
 	dti->importsymlist = importsymlist;
+	dti->orphanlist = orphanlist;
 
 	fill_fullpaths(dti);
 
@@ -952,6 +954,18 @@ struct node *get_node_by_ref(struct dt_info *dti, const char *ref)
 	return NULL;
 }
 
+bool node_is_orphan(struct dt_info *dti, const struct node *node)
+{
+	struct node *orphan;
+
+	for_each_orphan(dti->orphanlist, orphan) {
+		if (orphan == node)
+			return true;
+	}
+
+	return false;
+}
+
 struct property *get_property_by_label(struct dt_info *dti, const char *label,
 				       struct node **node)
 {
-- 
2.55.0

