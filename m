Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BEB5403E9D;
	Wed, 26 Aug 2026 09:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787738006; cv=none; b=Vf8lrV1lnmOOFr8uNxeEczWgg7gEo9IsCwwdCt4DiwYETXUjQ+VVKyYOgCsOo+2nQEk97/V5oiyTcrzBz4UISOCYPed5T/QMH3MXq9V1nb04J+fvrlFIGSK+RhStUaiGMg4WHPZudDdFHQ7DmHBolJJ9vJMiFxvuIEtDeB+HDQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787738006; c=relaxed/simple;
	bh=Wp67rf63aoEeZmJOqdSlQ7BjcyBA17gPgw01eC2b+ao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AXuufRFnNfbrM9PrKf5KkLaIslSoyzJ0WkBm2AYN9X+pWveMZoPHqpspAKeysk1w8Rs3uId6qVZanjSHYO0/1Q0TGiXQe6Eis+v2798R+p0/mr1yFEYW6Ik996Qj0ywGJKRIrWVQ70B+ts8iISi6OhrD0snh+VNy3pN6f++NTrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=H1XCEtCN; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="H1XCEtCN"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2149C4E413BF;
	Wed, 26 Aug 2026 09:53:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EAA4C604EC;
	Wed, 26 Aug 2026 09:53:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 34A5211C7AD37;
	Wed, 26 Aug 2026 11:53:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787738001; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=EsMsQfWGevD4uhbzz1lPR3JMyl7+baU+j5rVrn18Sz0=;
	b=H1XCEtCNznyJ9QOvMbHu2+95V/VBooSi9+5iB3O7hCMuf0MCqmjr9bMQakst08JAlIdFdP
	dRnGWlzaE93OC+Nf+TOulR1lIFZ2lDuhmyZJO1XbgqGKHKp3I6b3CW8nD+DVpkdLnXCM/F
	w58yQHZL16HFSBvFRC5w3nQGMKBvT96ydhuWU2j7bNswP3klQ907tGAyM7/LBiG55CEpyD
	uWtU/yFE1+bKplnLOLE5brd74WIvD4u1k5rdME9OuRezitRGUnw+VaI252xDD5k4pVhfRj
	XTYBp5XqtidlCKSybIVxmoYzckkg2NBWPMgDN33tsijXL7r6oovng8C21G+cjA==
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
Subject: [RFC PATCH v2 53/74] dtc: Add support for missing root node in addon device-tree
Date: Wed, 26 Aug 2026 11:49:22 +0200
Message-ID: <20260826094950.1088288-54-herve.codina@bootlin.com>
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

Addon can have orphan nodes fully described (dts) and encoded (dtb)
without the need for a root device tree.

Contrary to plugin (overlay), addon doesn't need any specific root tree
structure to described the orphans. Indeed, /fragment@n/__overlay__
doesn't exist for addons. Orphans are encoded in dtb using the
FDT_BEGIN_NODE_REF tag without any impact on the root tree.

The following snippet is fully legit for addon:
   --- 8< ---
   /addon/;

   &foo {
      subnode {
        prop = <1>;
      };
   }
   --- 8< ---

This snippet doesn't contains a root device tree, and the related dtb
doesn't need any root device tree to encode the snippet.

The root device is no more mandatory for addon.

Add support for addon without a root device-tree.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 checks.c     | 29 +++++++++++++++++++++++++++--
 dtc-parser.y | 18 ++++++++++++++----
 dtc.c        | 21 ++++++++++++++++-----
 flattree.c   | 43 ++++++++++++++++++++++++++++++-------------
 livetree.c   | 13 +++++++++++--
 treesource.c |  3 ++-
 6 files changed, 100 insertions(+), 27 deletions(-)

diff --git a/checks.c b/checks.c
index a0024389..fee37ce0 100644
--- a/checks.c
+++ b/checks.c
@@ -154,7 +154,6 @@ static bool is_multiple_of(int multiple, int divisor)
 
 static bool run_check(struct check *c, struct dt_info *dti)
 {
-	struct node *dt = dti->dt;
 	struct node *orphan;
 	bool error = false;
 	int i;
@@ -179,7 +178,8 @@ static bool run_check(struct check *c, struct dt_info *dti)
 	if (c->status != UNCHECKED)
 		goto out;
 
-	check_nodes_props(c, dti, dt);
+	if (dti->dt)
+		check_nodes_props(c, dti, dti->dt);
 
 	for_each_orphan(dti->orphanlist, orphan)
 		check_nodes_props(c, dti, orphan);
@@ -2105,6 +2105,31 @@ void process_checks(bool force, struct dt_info *dti)
 		exit(2);
 	}
 
+	if (!dti->dt) {
+		/* No root node is only allowed for addons */
+		if (dti->dtsflags & DTSF_ADDON) {
+			if (!dti->orphanlist) {
+				/*
+				 * but addons without a root node and without
+				 * orphan nodes is really incorrect
+				 */
+				fprintf(stderr,
+					"ERROR: Input tree has no root or orphan nodes, aborting\n");
+				exit(2);
+			}
+		} else {
+			fprintf(stderr, "ERROR: Input tree has no root node, aborting\n");
+			exit(2);
+		}
+	}
+
+	if (!(dti->dtsflags & DTSF_ADDON)) {
+		if (dti->orphanlist) {
+			fprintf(stderr, "ERROR: Input tree has orphan nodes, aborting\n");
+			exit(2);
+		}
+	}
+
 	for (i = 0; i < ARRAY_SIZE(check_table); i++) {
 		struct check *c = check_table[i];
 
diff --git a/dtc-parser.y b/dtc-parser.y
index 197a9533..8d43cc4e 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -133,12 +133,18 @@ static struct node *parser_get_node_by_ref(struct node *dt, struct node *orphanl
 sourcefile:
 	  headers memreserves devicetree
 		{
+			if (!($1 & DTSF_ADDON) && !$3)
+				ERROR(&@3, "Only addon support missing root node");
+
 			parser_output = build_dt_info($1, $2, $3,
-			                              guess_boot_cpuid($3),
+			                              $3 ? guess_boot_cpuid($3) : 0,
 						      NULL, parser_orphanlist);
 		}
 	|  headers memreserves importlist devicetree
 		{
+			if (!($1 & DTSF_ADDON) && !$4)
+				ERROR(&@4, "Only addon support missing root node");
+
 			/*
 			 * importlist is created with chain_symbol() and so it
 			 * is created in reverse order. Reverse it now to have
@@ -241,7 +247,10 @@ devicetree:
 		}
 	| devicetree '/' nodedef
 		{
-			$$ = merge_nodes($1, $3);
+			if ($1)
+				$$ = merge_nodes($1, $3);
+			else
+				$$ = name_node($3, "");
 		}
 	| dt_ref nodedef
 		{
@@ -256,8 +265,9 @@ devicetree:
 							  ""),
 						$2, $1);
 			} else {
-				ERROR(&@2, "Orphan node %s without a root node not yet supported", $1);
-				YYERROR;
+				addon_add_orphan_node(&parser_orphanlist,
+						      orphan_node($2, $1));
+				$$ = NULL;
 			}
 		}
 	| devicetree DT_LABEL dt_ref nodedef
diff --git a/dtc.c b/dtc.c
index e5068375..d0f8998e 100644
--- a/dtc.c
+++ b/dtc.c
@@ -316,18 +316,29 @@ int main(int argc, char *argv[])
 
 	process_checks(force, dti);
 
-	if (auto_label_aliases)
+	if (auto_label_aliases) {
+		if (!dti->dt)
+			die("auto-alias not supported without a root node\n");
 		generate_label_tree(dti, "aliases", false);
+	}
 
-	generate_labels_from_tree(dti, "__symbols__");
+	if (dti->dt)
+		generate_labels_from_tree(dti, "__symbols__");
 
-	if (generate_symbols)
+	if (generate_symbols) {
+		if (!dti->dt)
+			die("generation of symbols not supported without a root node\n");
 		generate_label_tree(dti, "__symbols__", true);
+	}
 
-	fixup_phandles(dti, "__fixups__");
-	local_fixup_phandles(dti, "__local_fixups__");
+	if (dti->dt) {
+		fixup_phandles(dti, "__fixups__");
+		local_fixup_phandles(dti, "__local_fixups__");
+	}
 
 	if (generate_fixups) {
+		if (!dti->dt)
+			die("generation of fixups not supported without a root node\n");
 		generate_fixups_tree(dti, "__fixups__");
 		generate_local_fixups_tree(dti, "__local_fixups__");
 	}
diff --git a/flattree.c b/flattree.c
index b5223089..f680dec1 100644
--- a/flattree.c
+++ b/flattree.c
@@ -573,7 +573,9 @@ void dt_to_blob(FILE *f, struct dt_info *dti, int version)
 
 	dt_flags |= dti->dtsflags & DTSF_ADDON ? FDT_FLAG_ADDON : 0;
 
-	flatten_tree(dti->dt, &bin_emitter, &dtbuf, &strbuf, vi);
+	if (dti->dt)
+		flatten_tree(dti->dt, &bin_emitter, &dtbuf, &strbuf, vi);
+
 	flatten_imports(dti->importsymlist, &bin_emitter, &dtbuf, vi, dt_flags);
 	flatten_orphans(dti->orphanlist, &bin_emitter, &dtbuf, &strbuf, vi,
 			dt_flags);
@@ -769,7 +771,9 @@ void dt_to_asm(FILE *f, struct dt_info *dti, int version)
 	fprintf(f, "\t.long\t0, 0\n\t.long\t0, 0\n");
 
 	emit_label(f, symprefix, "struct_start");
-	flatten_tree(dti->dt, &asm_emitter, f, &strbuf, vi);
+
+	if (dti->dt)
+		flatten_tree(dti->dt, &asm_emitter, f, &strbuf, vi);
 
 	fprintf(f, "\t/* FDT_END */\n");
 	asm_emit_cell(f, FDT_END);
@@ -1238,7 +1242,7 @@ struct dt_info *dt_from_blob(const char *fname)
 	struct inbuf memresvbuf;
 	int sizeleft;
 	struct reserve_info *reservelist;
-	struct node *tree;
+	struct node *tree = NULL;
 	struct symbol *importsymlist = NULL;
 	struct symbol *importsym;
 	struct node *orphanlist = NULL;
@@ -1352,15 +1356,24 @@ struct dt_info *dt_from_blob(const char *fname)
 
 	reservelist = flat_read_mem_reserve(&memresvbuf);
 
-	val = flat_read_tag(&dtbuf);
-	if (val != FDT_BEGIN_NODE)
-		die("Device tree blob doesn't begin with FDT_BEGIN_NODE (begins with 0x%08x)\n", val);
+	if (!(dtsflags & DTSF_ADDON)) {
+		val = flat_read_tag(&dtbuf);
+		if (val != FDT_BEGIN_NODE)
+			die("Device tree blob doesn't begin with FDT_BEGIN_NODE (begins with 0x%08x)\n",
+			    val);
 
-	tree = unflatten_tree(&dtbuf, &strbuf, "", flags, false);
+		tree = unflatten_tree(&dtbuf, &strbuf, "", flags, false);
 
-	val = flat_read_tag(&dtbuf);
+		val = flat_read_tag(&dtbuf);
+		if (val != FDT_END)
+			die("Device tree blob doesn't end with FDT_END\n");
+	} else {
+		val = flat_read_tag(&dtbuf);
+		if (val == FDT_BEGIN_NODE) {
+			tree = unflatten_tree(&dtbuf, &strbuf, "", flags, false);
+			val = flat_read_tag(&dtbuf);
+		}
 
-	if (dtsflags & DTSF_ADDON) {
 		if (flags & FTF_EXPORT_IMPORT_SYM) {
 			while (val == FDT_IMPORT_SYM) {
 				importsym = flat_read_importsym(&dtbuf);
@@ -1377,16 +1390,20 @@ struct dt_info *dt_from_blob(const char *fname)
 				val = flat_read_tag(&dtbuf);
 			}
 		}
-	}
 
-	if (val != FDT_END)
-		die("Device tree blob doesn't end with FDT_END\n");
+		if (!tree && !orphanlist)
+			die("Device tree blob has 0x%08x tag instead of FDT_BEGIN_NODE or FDT_BEGIN_NODE_REF\n",
+			    val);
+
+		if (val != FDT_END)
+			die("Device tree blob doesn't end with FDT_END\n");
+	}
 
 	free(blob);
 
 	fclose(f);
 
-	if (get_subnode(tree, "__fixups__") || get_subnode(tree, "__local_fixups__"))
+	if (tree && (get_subnode(tree, "__fixups__") || get_subnode(tree, "__local_fixups__")))
 		dtsflags |= DTSF_PLUGIN;
 
 	return build_dt_info(dtsflags, reservelist, tree, boot_cpuid_phys,
diff --git a/livetree.c b/livetree.c
index 26c3c079..f7c13585 100644
--- a/livetree.c
+++ b/livetree.c
@@ -692,7 +692,8 @@ static void complete_references(struct dt_info *dti)
 {
 	struct node *orphan;
 
-	complete_references_internal(dti, dti->dt);
+	if (dti->dt)
+		complete_references_internal(dti, dti->dt);
 
 	for_each_orphan(dti->orphanlist, orphan)
 		complete_references_internal(dti, orphan);
@@ -1336,7 +1337,9 @@ void sort_tree(struct dt_info *dti)
 {
 	sort_reserve_entries(dti);
 	sort_importsyms(dti);
-	sort_node(dti->dt);
+
+	if (dti->dt)
+		sort_node(dti->dt);
 }
 
 /* utility helper to avoid code duplication */
@@ -1605,6 +1608,8 @@ void generate_labels_from_tree(struct dt_info *dti, const char *name)
 
 void generate_label_tree(struct dt_info *dti, const char *name, bool allocph)
 {
+	assert(dti->dt);
+
 	if (!any_label_tree(dti, dti->dt))
 		return;
 	generate_label_tree_internal(dti, build_root_node(dti->dt, name),
@@ -1613,6 +1618,8 @@ void generate_label_tree(struct dt_info *dti, const char *name, bool allocph)
 
 void generate_fixups_tree(struct dt_info *dti, const char *name)
 {
+	assert(dti->dt);
+
 	if (!any_fixup_tree(dti, dti->dt))
 		return;
 	if (generate_fixups_tree_internal(dti, build_root_node(dti->dt, name), dti->dt))
@@ -1719,6 +1726,8 @@ void fixup_phandles(struct dt_info *dti, const char *name)
 
 void generate_local_fixups_tree(struct dt_info *dti, const char *name)
 {
+	assert(dti->dt);
+
 	if (!any_local_fixup_tree(dti, dti->dt))
 		return;
 	if (generate_local_fixups_tree_internal(dti, build_root_node(dti->dt, name), dti->dt))
diff --git a/treesource.c b/treesource.c
index b50d9f81..d18025c5 100644
--- a/treesource.c
+++ b/treesource.c
@@ -466,7 +466,8 @@ void dt_to_source(FILE *f, struct dt_info *dti)
 		fprintf(f, "\n");
 	}
 
-	write_tree_source_node(f, dti->dt, 0);
+	if (dti->dt)
+		write_tree_source_node(f, dti->dt, 0);
 
 	for_each_orphan(dti->orphanlist, orphan) {
 		fprintf(f, "\n");
-- 
2.55.0

