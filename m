Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9D4369208;
	Mon, 12 Jan 2026 14:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227713; cv=none; b=HZYBuB5/MCdfvK3kccvUWcRGhBstDnHXRCt5eveYZPb02jQ8LaTk/6saMSkkD4UYQo/S0zLILop0UbQFbgZt8m62t7pBWAr9ypBRnrSQBRZJ89T4HnTQ3RKFeiBOHAFhGEHHHRI26yEJYDkZ+aaRDR0o7c+RgUMqWrg1rusejAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227713; c=relaxed/simple;
	bh=G0B++6o2k/AlJDsoZQtscR7WvdTA/3bbuO8/6ZEtB+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mNXyguHVGvx3Apqy+Gn4Fw6La+x7SpPM/1yxT+wSH+f2bm1jWCPBbNv+X8uKD7YJacRHNTRIrIihyiTDKExljFgkBx9V/z4tO1/dD6/wMQCBT1HQvHrfNpcuSxM6o+5kMSThnoP3D/z+aU5KDwmsy8pwWLdJlrrY0D9eZiYSLv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KiH6b5Ez; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KiH6b5Ez"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8D75EC2086D;
	Mon, 12 Jan 2026 14:21:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 10CF4606FA;
	Mon, 12 Jan 2026 14:21:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 075E0103C8CD8;
	Mon, 12 Jan 2026 15:21:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227709; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=vKpQaKQa5FbyWIJ4mel2ZrzrfeLGkep42cMZy8gu/kk=;
	b=KiH6b5EzsjbCsVowgcPkFSJBMYkTrUvsAnIGn58LuT+67Lzgb5abq6ayWyT7I6yMzxjqGo
	AZP9XI79nh2nS7fzzyV5BmxeydICW+HvZwGZw/ls1HzTKEDM/Wubv34HymibFq8m0EUrCW
	107Kil8pySAgQ2eqKnYtekStYdLbSRJVUA4lCfLiwMQn936WQT/tT9TtFFrGDWVBTwlrun
	70llz0+jNAtwLIciq1+TXDsAQpYt8c5JWPmwB5HDQqkoy28K7y5cNVrRKDnKdAnBS0EQVJ
	YjAbXJCA+dyNIy6LbuiMNApnalsij9E4E3j/z9l3CX/O+D5Ue5L7+J+NERtPoA==
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
Subject: [RFC PATCH 58/77] dtc: Add support for missing root node in addon device-tree
Date: Mon, 12 Jan 2026 15:19:48 +0100
Message-ID: <20260112142009.1006236-59-herve.codina@bootlin.com>
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
 checks.c     | 28 ++++++++++++++++++++++++++--
 dtc-parser.y | 18 ++++++++++++++----
 dtc.c        | 36 +++++++++++++++++++++++-------------
 flattree.c   | 42 +++++++++++++++++++++++++++++-------------
 livetree.c   | 22 +++++++++++++++++-----
 treesource.c |  3 ++-
 6 files changed, 111 insertions(+), 38 deletions(-)

diff --git a/checks.c b/checks.c
index 83a0f6e..f98f153 100644
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
@@ -2079,6 +2079,30 @@ void process_checks(bool force, struct dt_info *dti)
 	unsigned int i;
 	int error = 0;
 
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
index 10ca6d4..cf5447a 100644
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
index 5cf8f31..63725bf 100644
--- a/dtc.c
+++ b/dtc.c
@@ -351,27 +351,37 @@ int main(int argc, char *argv[])
 	update_exports_ref(dti);
 	mark_local_exports(dti);
 
-	/*
-	 * With FDT_REF_PHANDLE added in dtbs, we need to identified
-	 * if some unresolved phandle references are allowed in the dtb
-	 * we have parsed (needed for process_check() to run properly).
-	 *
-	 * Identify plugin device-trees (overlays) based on specific node
-	 * presence.
-	 */
-	if (get_subnode(dti->dt, "__fixups__") ||
-	    get_subnode(dti->dt, "__local_fixups__"))
-		dti->dtsflags |= DTSF_PLUGIN;
+	if (dti->dt) {
+		/*
+		 * With FDT_REF_PHANDLE added in dtbs, we need to identified
+		 * if some unresolved phandle references are allowed in the dtb
+		 * we have parsed (needed for process_check() to run properly).
+		 *
+		 * Identify plugin device-trees (overlays) based on specific node
+		 * presence.
+		 */
+		if (get_subnode(dti->dt, "__fixups__") ||
+		    get_subnode(dti->dt, "__local_fixups__"))
+			dti->dtsflags |= DTSF_PLUGIN;
+	}
 
 	process_checks(force, dti);
 
-	if (auto_label_aliases)
+	if (auto_label_aliases) {
+		if (!dti->dt)
+			die("auto-alias not supported without a root node\n");
 		generate_label_tree(dti, "aliases", false);
+	}
 
-	if (generate_symbols)
+	if (generate_symbols) {
+		if (!dti->dt)
+			die("generation of symbols not supported without a root node\n");
 		generate_label_tree(dti, "__symbols__", true);
+	}
 
 	if (generate_fixups) {
+		if (!dti->dt)
+			die("generation of fixups not supported without a root node\n");
 		generate_fixups_tree(dti, "__fixups__");
 		generate_local_fixups_tree(dti, "__local_fixups__");
 	}
diff --git a/flattree.c b/flattree.c
index 27f7608..11447b1 100644
--- a/flattree.c
+++ b/flattree.c
@@ -561,7 +561,9 @@ void dt_to_blob(FILE *f, struct dt_info *dti, int version)
 
 	dt_flags |= dti->dtsflags & DTSF_ADDON ? FDT_FLAG_ADDON : 0;
 
-	flatten_tree(dti->dt, &bin_emitter, &dtbuf, &strbuf, vi);
+	if (dti->dt)
+		flatten_tree(dti->dt, &bin_emitter, &dtbuf, &strbuf, vi);
+
 	flatten_imports(dti->importsymlist, &bin_emitter, &dtbuf, vi, dt_flags);
 	flatten_orphans(dti->orphanlist, &bin_emitter, &dtbuf, &strbuf, vi,
 			dt_flags);
@@ -752,7 +754,9 @@ void dt_to_asm(FILE *f, struct dt_info *dti, int version)
 	fprintf(f, "\t.long\t0, 0\n\t.long\t0, 0\n");
 
 	emit_label(f, symprefix, "struct_start");
-	flatten_tree(dti->dt, &asm_emitter, f, &strbuf, vi);
+
+	if (dti->dt)
+		flatten_tree(dti->dt, &asm_emitter, f, &strbuf, vi);
 
 	fprintf(f, "\t/* FDT_END */\n");
 	asm_emit_cell(f, FDT_END);
@@ -1092,7 +1096,7 @@ struct dt_info *dt_from_blob(const char *fname)
 	struct inbuf memresvbuf;
 	int sizeleft;
 	struct reserve_info *reservelist;
-	struct node *tree;
+	struct node *tree = NULL;
 	struct symbol *importsymlist = NULL;
 	struct symbol *importsym;
 	struct node *orphanlist = NULL;
@@ -1203,16 +1207,24 @@ struct dt_info *dt_from_blob(const char *fname)
 
 	reservelist = flat_read_mem_reserve(&memresvbuf);
 
-	val = flat_read_word(&dtbuf);
-
-	if (val != FDT_BEGIN_NODE)
-		die("Device tree blob doesn't begin with FDT_BEGIN_NODE (begins with 0x%08x)\n", val);
+	if (!(dtsflags & DTSF_ADDON)) {
+		val = flat_read_word(&dtbuf);
+		if (val != FDT_BEGIN_NODE)
+			die("Device tree blob doesn't begin with FDT_BEGIN_NODE (begins with 0x%08x)\n",
+			    val);
 
-	tree = unflatten_tree(&dtbuf, &strbuf, "", flags, false);
+		tree = unflatten_tree(&dtbuf, &strbuf, "", flags, false);
 
-	val = flat_read_word(&dtbuf);
+		val = flat_read_word(&dtbuf);
+		if (val != FDT_END)
+			die("Device tree blob doesn't end with FDT_END\n");
+	} else {
+		val = flat_read_word(&dtbuf);
+		if (val == FDT_BEGIN_NODE) {
+			tree = unflatten_tree(&dtbuf, &strbuf, "", flags, false);
+			val = flat_read_word(&dtbuf);
+		}
 
-	if (dtsflags & DTSF_ADDON) {
 		if (flags & FTF_EXPORT_IMPORT_SYM) {
 			while (val == FDT_IMPORT_SYM) {
 				importsym = flat_read_importsym(&dtbuf);
@@ -1229,10 +1241,14 @@ struct dt_info *dt_from_blob(const char *fname)
 				val = flat_read_word(&dtbuf);
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
 
diff --git a/livetree.c b/livetree.c
index eaface5..00274c5 100644
--- a/livetree.c
+++ b/livetree.c
@@ -1203,7 +1203,9 @@ void sort_tree(struct dt_info *dti)
 {
 	sort_reserve_entries(dti);
 	sort_importsyms(dti);
-	sort_node(dti->dt);
+
+	if (dti->dt)
+		sort_node(dti->dt);
 }
 
 /* utility helper to avoid code duplication */
@@ -1451,6 +1453,8 @@ static int generate_local_fixups_tree_internal(struct dt_info *dti,
 
 void generate_label_tree(struct dt_info *dti, const char *name, bool allocph)
 {
+	assert(dti->dt);
+
 	if (!any_label_tree(dti, dti->dt))
 		return;
 	generate_label_tree_internal(dti, build_root_node(dti->dt, name),
@@ -1459,6 +1463,8 @@ void generate_label_tree(struct dt_info *dti, const char *name, bool allocph)
 
 void generate_fixups_tree(struct dt_info *dti, const char *name)
 {
+	assert(dti->dt);
+
 	if (!any_fixup_tree(dti, dti->dt))
 		return;
 	if (generate_fixups_tree_internal(dti, build_root_node(dti->dt, name), dti->dt))
@@ -1469,6 +1475,8 @@ void generate_fixups_tree(struct dt_info *dti, const char *name)
 
 void generate_local_fixups_tree(struct dt_info *dti, const char *name)
 {
+	assert(dti->dt);
+
 	if (!any_local_fixup_tree(dti, dti->dt))
 		return;
 	if (generate_local_fixups_tree_internal(dti, build_root_node(dti->dt, name), dti->dt))
@@ -1514,7 +1522,8 @@ void update_phandles_ref(struct dt_info *dti)
 {
 	struct node *orphan;
 
-	update_phandles_ref_internal(dti, dti->dt);
+	if (dti->dt)
+		update_phandles_ref_internal(dti, dti->dt);
 
 	for_each_orphan(dti->orphanlist, orphan)
 		update_phandles_ref_internal(dti, orphan);
@@ -1545,7 +1554,8 @@ void mark_local_phandles(struct dt_info *dti)
 {
 	struct node *orphan;
 
-	mark_local_phandles_internal(dti, dti->dt);
+	if (dti->dt)
+		mark_local_phandles_internal(dti, dti->dt);
 
 	for_each_orphan(dti->orphanlist, orphan)
 		mark_local_phandles_internal(dti, orphan);
@@ -1580,7 +1590,8 @@ void update_exports_ref(struct dt_info *dti)
 {
 	struct node *orphan;
 
-	update_exports_ref_internal(dti, dti->dt);
+	if (dti->dt)
+		update_exports_ref_internal(dti, dti->dt);
 
 	for_each_orphan(dti->orphanlist, orphan)
 		update_exports_ref_internal(dti, orphan);
@@ -1607,7 +1618,8 @@ void mark_local_exports(struct dt_info *dti)
 {
 	struct node *orphan;
 
-	mark_local_exports_internal(dti, dti->dt);
+	if (dti->dt)
+		mark_local_exports_internal(dti, dti->dt);
 
 	for_each_orphan(dti->orphanlist, orphan)
 		mark_local_exports_internal(dti, orphan);
diff --git a/treesource.c b/treesource.c
index bc5d847..71dbd5f 100644
--- a/treesource.c
+++ b/treesource.c
@@ -410,7 +410,8 @@ void dt_to_source(FILE *f, struct dt_info *dti)
 		fprintf(f, "\n");
 	}
 
-	write_tree_source_node(f, dti->dt, 0);
+	if (dti->dt)
+		write_tree_source_node(f, dti->dt, 0);
 
 	for_each_orphan(dti->orphanlist, orphan) {
 		fprintf(f, "\n");
-- 
2.52.0

