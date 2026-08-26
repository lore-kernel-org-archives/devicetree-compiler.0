Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F7C3FF8A3;
	Wed, 26 Aug 2026 09:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787737998; cv=none; b=Phn5PsUE1zzXhbXJhmrynJUNwsTqoCxmb3ze1ViUYkLSQ5ZiR+BFhaj/jo/sEje9wJVDmk1UJB0q1z1x5gW5LjgI7VqGAkaBuKMSSnx1S15UKJemLK1DkUio+u+iYK7xnYXbmuIen0iAhGyvn314M08lQ+Olsxw76eTwv8VjVyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787737998; c=relaxed/simple;
	bh=oyz3CsgYdxIfmJMyNM0huqvHDABcNMBSVcIQSGrzmyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=biudDlRQX5n+U8MPbGgyN6Nub6BSH65jkS/HNK2XT3pHRr/AyQvzOkT7Sdt7JBZMXKGpG16wiFwX3rM9+WdHn4MBOnUTmOR/izZIKypYxyF0tokylP1MpiwfekrA1tfcZWCoL/PBWnskJEUTL3rOWQPCUbjmb2Ks4Mc78d3A+Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=yr5P4SCY; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="yr5P4SCY"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D96DC1A183A;
	Wed, 26 Aug 2026 09:53:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AE29F604EC;
	Wed, 26 Aug 2026 09:53:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D685211C7ACD5;
	Wed, 26 Aug 2026 11:53:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787737994; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=sgF0PhQ58PpIbQcIJSGs/F6uEdAznO75JcU5b7dSayY=;
	b=yr5P4SCY5iEgB3YqqKAdSzaLaSncN0qWqgK1wtgk891K/DvZatdmWVwXXHmen2kLLxw/oP
	HthHmMLTaILqurmZbz7e4qrNEHuAuHf+HexQrNUNfZHLcUHTxgl/XuSOq1h7Jb5GRggypU
	txT3TJuvVO90V/Z8Z/nmTDRo2oxUkXTxekWsjhICpwDuiJuqVmUNsm5kgvCaxM/+4vD3SA
	V7BqhNDgwY5qUlfDE9VMttqqxDpMX5ekLVPLkBVuV+tK1Ij4IgWQ5HtnjMex5B2AeW9rHW
	HZaB4aVUGLASO8kvfD6+E4vUaJVFngwlc50WZUm4rPhUCNEnHQlv1XsRKh3BJg==
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
Subject: [RFC PATCH v2 50/74] dtc: Add basic support for addon orphan nodes in dts
Date: Wed, 26 Aug 2026 11:49:19 +0200
Message-ID: <20260826094950.1088288-51-herve.codina@bootlin.com>
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

Orphan nodes are nodes without a parent. The root device-tree node is a
particular orphan node and is not part of those 'orphan' nodes group.

The orphan nodes group is related to nodes identified by a reference in
addons or plugins device-trees. For instance, int the following snippet,
foo is an orphan node:
   --- 8< ---
   /addon/

   &foo {
       subnode {
           prop  = <1>;
       };
   };
   --- 8< ---

The foo referenced node described has no parent. Indeed, it is not
a child of the root node.

This kind of node is legit in addons device-tree in order to perform
modification on existing node when the addon dtb is applied.

Add support for addon orphan node in dts.

Compared to plugin (overlay) orphan node parsing, the orphan node parsed
in the addon context does not lead to any change in the device-tree
structure. '/fragment@0/__overlay__' or similar kind of structure is not
needed for addons.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 dtc-parser.y | 60 +++++++++++++++++++++++++++++++++++-----------------
 dtc.h        |  2 ++
 livetree.c   | 30 ++++++++++++++++++++++++++
 treesource.c |  8 +++++++
 4 files changed, 81 insertions(+), 19 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index 885123af..197a9533 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -23,6 +23,7 @@ extern void yyerror(char const *s);
 
 extern struct dt_info *parser_output;
 extern bool treesource_error;
+extern struct node *parser_orphanlist;
 
 unsigned int last_header_flags;
 
@@ -31,7 +32,8 @@ static bool is_ref_relative(const char *ref)
 	return ref[0] != '/' && strchr(&ref[1], '/');
 }
 
-static struct node *parser_get_node_by_ref(struct node *dt, const char *ref)
+static struct node *parser_get_node_by_ref(struct node *dt, struct node *orphanlist,
+					   const char *ref)
 {
 	/*
 	 * Use a temporary dt_info in order to use dti_get_node_by_ref()
@@ -39,6 +41,7 @@ static struct node *parser_get_node_by_ref(struct node *dt, const char *ref)
 	struct dt_info dti = {};
 
 	dti.dt = dt;
+	dti.orphanlist = orphanlist;
 
 	return get_node_by_ref(&dti, ref);
 }
@@ -132,7 +135,7 @@ sourcefile:
 		{
 			parser_output = build_dt_info($1, $2, $3,
 			                              guess_boot_cpuid($3),
-						      NULL, NULL);
+						      NULL, parser_orphanlist);
 		}
 	|  headers memreserves importlist devicetree
 		{
@@ -143,7 +146,8 @@ sourcefile:
 			 */
 			parser_output = build_dt_info($1, $2, $4,
 			                              $4 ? guess_boot_cpuid($4) : 0,
-			                              reverse_symbol($3), NULL);
+			                              reverse_symbol($3),
+						      parser_orphanlist);
 		}
 	;
 
@@ -241,21 +245,28 @@ devicetree:
 		}
 	| dt_ref nodedef
 		{
-			if (!(last_header_flags & DTSF_PLUGIN))
+			if (!(last_header_flags & (DTSF_PLUGIN | DTSF_ADDON)))
 				ERROR(&@2, "Label or path %s not found", $1);
 			else if (is_ref_relative($1))
-				ERROR(&@2, "Label-relative reference %s not supported in plugin", $1);
-			$$ = plugin_add_orphan_node(
-					name_node(build_node(NULL, NULL, NULL, NULL),
-						  ""),
-					$2, $1);
+				ERROR(&@2, "Label-relative reference %s not supported in plugin nor addon", $1);
+
+			if (last_header_flags & DTSF_PLUGIN) {
+				$$ = plugin_add_orphan_node(
+						name_node(build_node(NULL, NULL, NULL, NULL),
+							  ""),
+						$2, $1);
+			} else {
+				ERROR(&@2, "Orphan node %s without a root node not yet supported", $1);
+				YYERROR;
+			}
 		}
 	| devicetree DT_LABEL dt_ref nodedef
 		{
-			struct node *target = parser_get_node_by_ref($1, $3);
+			struct node *target = parser_get_node_by_ref(
+						$1, parser_orphanlist, $3);
 
-			if ((last_header_flags & DTSF_PLUGIN) && is_ref_relative($3))
-				ERROR(&@2, "Label-relative reference %s not supported in plugin", $3);
+			if ((last_header_flags & (DTSF_PLUGIN | DTSF_ADDON)) && is_ref_relative($3))
+				ERROR(&@2, "Label-relative reference %s not supported in plugin nor addon", $3);
 
 			if (target) {
 				add_label(&target->labels, $2);
@@ -266,12 +277,17 @@ devicetree:
 		}
 	| devicetree DT_PATH_REF nodedef
 		{
-			if (last_header_flags & DTSF_PLUGIN) {
+			if (last_header_flags & (DTSF_PLUGIN | DTSF_ADDON)) {
 				if (is_ref_relative($2))
-					ERROR(&@2, "Label-relative reference %s not supported in plugin", $2);
-				plugin_add_orphan_node($1, $3, $2);
+					ERROR(&@2, "Label-relative reference %s not supported in plugin nor addon", $2);
+				if(last_header_flags & DTSF_PLUGIN)
+					plugin_add_orphan_node($1, $3, $2);
+				else
+					addon_add_orphan_node(&parser_orphanlist,
+							      orphan_node($3, $2));
 			} else {
-				struct node *target = parser_get_node_by_ref($1, $2);
+				struct node *target = parser_get_node_by_ref(
+							$1, parser_orphanlist, $2);
 
 				if (target)
 					merge_nodes(target, $3);
@@ -282,13 +298,17 @@ devicetree:
 		}
 	| devicetree DT_LABEL_REF nodedef
 		{
-			struct node *target = parser_get_node_by_ref($1, $2);
+			struct node *target = parser_get_node_by_ref(
+						$1, parser_orphanlist, $2);
 
 			if (target) {
 				merge_nodes(target, $3);
 			} else {
 				if (last_header_flags & DTSF_PLUGIN)
 					plugin_add_orphan_node($1, $3, $2);
+				else if (last_header_flags & DTSF_ADDON)
+					addon_add_orphan_node(&parser_orphanlist,
+							      orphan_node($3, $2));
 				else
 					ERROR(&@2, "Label or path %s not found", $2);
 			}
@@ -296,7 +316,8 @@ devicetree:
 		}
 	| devicetree DT_DEL_NODE dt_ref ';'
 		{
-			struct node *target = parser_get_node_by_ref($1, $3);
+			struct node *target = parser_get_node_by_ref(
+						$1, parser_orphanlist, $3);
 
 			if (target)
 				delete_node(target);
@@ -308,7 +329,8 @@ devicetree:
 		}
 	| devicetree DT_OMIT_NO_REF dt_ref ';'
 		{
-			struct node *target = parser_get_node_by_ref($1, $3);
+			struct node *target = parser_get_node_by_ref(
+						$1, parser_orphanlist, $3);
 
 			if (target)
 				omit_node_if_unused(target);
diff --git a/dtc.h b/dtc.h
index cad092c1..de5fa266 100644
--- a/dtc.h
+++ b/dtc.h
@@ -309,6 +309,8 @@ struct node *chain_node(struct node *first, struct node *list);
 struct node *merge_nodes(struct node *old_node, struct node *new_node);
 struct node *plugin_add_orphan_node(struct node *old_node, struct node *new_node,
 				    char *ref);
+struct node *orphan_node(struct node *node, const char *ref);
+void addon_add_orphan_node(struct node **dt_orphan, struct node *new_orphan);
 
 void add_property(struct node *node, struct property *prop);
 void delete_property_by_name(struct node *node, char *name);
diff --git a/livetree.c b/livetree.c
index ad9ae295..26c3c079 100644
--- a/livetree.c
+++ b/livetree.c
@@ -351,6 +351,36 @@ struct node *plugin_add_orphan_node(struct node *dt, struct node *new_node,
 	return dt;
 }
 
+struct node *orphan_node(struct node *node, const char *ref)
+{
+	node->ref = xstrdup(ref);
+
+	return node;
+}
+
+void addon_add_orphan_node(struct node **dt_orphan, struct node *new_orphan)
+{
+	struct node **last_orphan;
+	char *name;
+
+	/*
+	 * For addon orphan node, the node name is set to '&reference'
+	 * This ease the dts file generation and the usage of existing code
+	 */
+	xasprintf(&name, "&%s", new_orphan->ref);
+
+	name_node(new_orphan, name);
+	free(name);
+
+	new_orphan->next_sibling = NULL;
+
+	last_orphan = dt_orphan;
+	while (*last_orphan)
+		last_orphan = &((*last_orphan)->next_sibling);
+
+	*last_orphan = new_orphan;
+}
+
 struct node *chain_node(struct node *first, struct node *list)
 {
 	assert(first->next_sibling == NULL);
diff --git a/treesource.c b/treesource.c
index 705fe9a6..b50d9f81 100644
--- a/treesource.c
+++ b/treesource.c
@@ -12,11 +12,13 @@ extern YYLTYPE yylloc;
 
 struct dt_info *parser_output;
 bool treesource_error;
+struct node *parser_orphanlist;
 
 struct dt_info *dt_from_source(const char *fname)
 {
 	parser_output = NULL;
 	treesource_error = false;
+	parser_orphanlist = NULL;
 
 	srcfile_push(fname);
 	yyin = current_srcfile->f;
@@ -432,6 +434,7 @@ void dt_to_source(FILE *f, struct dt_info *dti)
 {
 	struct reserve_info *re;
 	struct symbol *importsym;
+	struct node *orphan;
 
 	fprintf(f, "/dts-v1/;\n");
 	/*
@@ -464,4 +467,9 @@ void dt_to_source(FILE *f, struct dt_info *dti)
 	}
 
 	write_tree_source_node(f, dti->dt, 0);
+
+	for_each_orphan(dti->orphanlist, orphan) {
+		fprintf(f, "\n");
+		write_tree_source_node(f, orphan, 0);
+	}
 }
-- 
2.55.0

