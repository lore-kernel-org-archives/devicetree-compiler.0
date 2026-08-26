Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1AE414DF6;
	Wed, 26 Aug 2026 09:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787738023; cv=none; b=R8MdB5y8Ye7xNn58FUcq46Xk0ifRcA7R1drB8owkrobO+Aj3C67TnVHj/qv7NzvjwWw93Z6UDEDQT3aHegsZbOnTX3afKs3gJS1jHkoc3zZUPCXBIs1a1EQH6EM0yrhZb1VOkeKqHykdYS/pPe9F7LjQaGnVzJTxRjsaeW+Dbzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787738023; c=relaxed/simple;
	bh=6E+wFWUy161S1rxriITZO7UE8PlQqF9UPXRPf/ZDivA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YqgvYv1QeB49bNmCBTH0Qlwn2cGMPfgEbo0gk1sj6Dx1D4udcjc/G0S3GA7+PGkTwE+99jDBaSJ4ubNpr5fRtzHHzJxvG1keSJ+KI+ndH4zeYBOQ+8QnzPukm/M6S5725+vnaq82X10GI30rkOL/OYztxzjVl4DJDelg/1PsJeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=bwkmUAqf; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bwkmUAqf"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 76D561A183A;
	Wed, 26 Aug 2026 09:53:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 45ACF604EC;
	Wed, 26 Aug 2026 09:53:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BC77611C7ACD5;
	Wed, 26 Aug 2026 11:53:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787738017; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=N+qVzPTIzveFaIRrq2AZdIluWGl9LMhfGvGolUIoV2U=;
	b=bwkmUAqf9Sr61coHRxAXVtz/o5+8WdR1qYiJMxnbUYcymEu4euT9O9wCoH8yJu8oS7lW+j
	UkPYLMYrx48APQxCl7jdl1lgPSMl7QJgHlEhfMQoKnPNgT4vIan5DZalH11l5Ub1Wwd8yB
	GunVeaBOegOTmfiNrEaeB29iP7Xx9G05UO6+d0XNLfezjPwdnm6a8r7XYNSo0eAZtxlrNB
	3+DE/hjfJ5oWAwq57Pnc5j82g9BGjNbXtP1PuEPLjT7x2hvDTTEEnuDy22uNCw/G3Io48Z
	6qdAnhMuLrWUiuvqdNiTRHA9vsw3XyOKtfOQO1VFw+BdcvlTMl4qb3NeRZqDFw==
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
Subject: [RFC PATCH v2 59/74] dtc: Add support for references by path involving orphan nodes
Date: Wed, 26 Aug 2026 11:49:28 +0200
Message-ID: <20260826094950.1088288-60-herve.codina@bootlin.com>
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

Referencing a sub-node from an orphan node using a path is needed.

Indeed, using the following snippet:
  --- 8< ---
  /addon/;

  &node1 {
      subnode {
          foo-phandle = <&foo_label>;
      };
  };

  &node2 {
      foo_label: foo {
          prop = <1>;
      };
  };
  --- 8< ---

Even if node2 is an orphan node, foo is a local node. foo-phandle
references the foo node using a label.

Once converted to a dtb, the label is lost. Only the phandle of the foo
node is used in the foo-phandle property and this property is marked
FDT_PROPDATA_PHANDLE.

Converting back this dtb to a dts, the marked local phandle should be
translated to a path to the related local node.

The issue is that this local node is not in the root device tree. We
need to identify the orphan node the foo node belongs to.

We cannot use a path starting by '/'. This kind of path identify node in
the root tree.

This new syntax allows to identify the orphan node in a path:
  $<orphan_name>/<path>

This leads to a reference by path in the form &{$<orphan_name>/<path>}.

Using the previous example, those both phandles points to the same node:
  foo-phandle1 = <&foo_label>;    /* Reference by label */
  foo-phandle2 = <&{$node2/foo}>; /* Reference by path */

When the dtb is converted back to a dts, the marked local phandle
involving a subnode available from orphan nodes can be translated to a
reference by path thanks to the new syntax.

Add support for this &{$<orphan_name>/<path>} syntax to reference by
path a local node from an orphan node.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 dtc-lexer.l  |  7 ++++++
 dtc-parser.y | 19 ++++++++++++++++
 livetree.c   | 63 +++++++++++++++++++++++++++++++++++++++++++++++-----
 treesource.c |  3 ++-
 4 files changed, 85 insertions(+), 7 deletions(-)

diff --git a/dtc-lexer.l b/dtc-lexer.l
index f21ae00d..9f611f01 100644
--- a/dtc-lexer.l
+++ b/dtc-lexer.l
@@ -236,6 +236,13 @@ static void PRINTF(1, 2) lexical_error(const char *fmt, ...);
 			return DT_PATH_REF;
 		}
 
+<*>"&{\$"{LABEL}([/]{PATHCHAR}*)?\}  {	/* orphan path reference */
+			yytext[yyleng-1] = '\0';
+			DPRINT("Ref orphan path: %s\n", yytext+1);
+			yylval.labelref = xstrdup(yytext+2);
+			return DT_ORPHAN_PATH_REF;
+		}
+
 <BYTESTRING>[0-9a-fA-F]{2} {
 			yylval.byte = strtol(yytext, NULL, 16);
 			DPRINT("Byte: %02x\n", (int)yylval.byte);
diff --git a/dtc-parser.y b/dtc-parser.y
index 6bf6bb50..c32eb65f 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -111,6 +111,7 @@ static struct node *parser_get_node_by_ref(struct node *dt, struct node *orphanl
 %token <labelref> DT_LABEL
 %token <labelref> DT_LABEL_REF
 %token <labelref> DT_PATH_REF
+%token <labelref> DT_ORPHAN_PATH_REF
 %token DT_INCBIN
 
 %type <data> propdata
@@ -589,6 +590,24 @@ arrayprefix:
 				ERROR(&@2, "References are only allowed in "
 					    "arrays with 32-bit elements.");
 
+			$$.data = data_append_integer($1.data, val, $1.bits);
+		}
+	| arrayprefix DT_ORPHAN_PATH_REF
+		{
+			uint64_t val = ~0ULL >> (64 - $1.bits);
+
+			if ($1.bits == 32) {
+				if (!(last_header_flags & DTSF_ADDON))
+					ERROR(&@2, "Orphan path reference %s supported only in addon", $2);
+
+				$1.data = data_add_marker($1.data,
+							  REF_PHANDLE,
+							  $2);
+			} else {
+				ERROR(&@2, "References are only allowed in "
+					    "arrays with 32-bit elements.");
+			}
+
 			$$.data = data_append_integer($1.data, val, $1.bits);
 		}
 	| arrayprefix DT_LABEL
diff --git a/livetree.c b/livetree.c
index 8d7803ab..49912234 100644
--- a/livetree.c
+++ b/livetree.c
@@ -593,13 +593,31 @@ static void fill_fullpaths_(struct node *tree, const char *prefix)
 static void fill_fullpaths(struct dt_info *dti)
 {
 	struct node *orphan;
+	struct node *child;
 
 	/* Fill fullpaths for the root node */
 	if (dti->dt)
 		fill_fullpaths_(dti->dt, "");
 
-	for_each_orphan(dti->orphanlist, orphan)
-		fill_fullpaths_(orphan, "__orphan__/");
+	/* Fill fullpaths for orphan nodes */
+	for_each_orphan(dti->orphanlist, orphan) {
+		if (!orphan->ref || orphan->ref[0] == '\0')
+			die("orphan node has an empty ref\n");
+
+		/*
+		 * An orphan node name is set with its reference.
+		 * Its name is in the form "&xxxxx" with xxxxx its reference.
+		 * For its full path, we use "$xxxxx" to make a clear
+		 * distinction between a reference (&xxxxx) where a resolution
+		 * could be involved vs a "simple" path where we just need to
+		 * identified the orphan ($xxxxx).
+		 */
+		xasprintf(&orphan->fullpath, "$%s", orphan->ref);
+		orphan->basenamelen = strlen(orphan->ref) + 1;
+
+		for_each_child(orphan, child)
+			fill_fullpaths_(child, orphan->fullpath);
+	}
 }
 
 static void complete_ref_and_is_local(struct dt_info *dti, char **ref,
@@ -619,14 +637,27 @@ static void complete_ref_and_is_local(struct dt_info *dti, char **ref,
 	 * Also take care of references pointing to an orphan node. Those
 	 * reference are not local references. Indeed, an orphan node is an
 	 * external node.
+	 *
+	 * Even if a path to an orphan node is possible, force to use the
+	 * orphan node reference instead of the path to avoid later complexity
+	 * mostly in dtb generation.
 	 */
 
 	if (*ref) {
 		refnode = get_node_by_ref(dti, *ref);
-		if (refnode && !node_is_orphan(dti, refnode))
-			*is_local = true;
-		else
+		if (!refnode) {
 			*is_local = false;
+			return;
+		}
+
+		if (node_is_orphan(dti, refnode)) {
+			*is_local = false;
+			/* Force to use its reference */
+			*ref = refnode->ref;
+			return;
+		}
+
+		*is_local = true;
 		return;
 	}
 
@@ -939,7 +970,19 @@ static struct node *get_node_by_ref_(struct node *tree, const char *ref)
 			path = slash + 1;
 		}
 
-		target = get_node_by_label_(tree, label);
+		if (label[0] == '$' && tree->ref) {
+			/*
+			 * We search for an orphan and the given tree is an
+			 * orphan. Use the given tree only if it matches the
+			 * expected orphan.
+			 */
+			if (streq(label + 1, tree->ref))
+				target = tree;
+			else
+				target = NULL;
+		} else {
+			target = get_node_by_label_(tree, label);
+		}
 
 		free(buf);
 
@@ -955,6 +998,14 @@ static struct node *get_node_by_ref_(struct node *tree, const char *ref)
 
 struct node *get_node_by_path(struct dt_info *dti, const char *path)
 {
+	if (path && path[0] == '$') {
+		/*
+		 * The path starts from an orphan node. Use get node by ref to
+		 * handle this path involving an orphan node.
+		 */
+		return get_node_by_ref(dti, path);
+	}
+
 	if (dti->dt)
 		return get_node_by_path_(dti->dt, path);
 
diff --git a/treesource.c b/treesource.c
index d18025c5..38932e50 100644
--- a/treesource.c
+++ b/treesource.c
@@ -328,7 +328,8 @@ static void write_propval(FILE *f, struct property *prop)
 					break;
 
 			if (m_phandle) {
-				if (m_phandle->ref[0] == '/')
+				if (m_phandle->ref[0] == '/' /* Root node */ ||
+				    m_phandle->ref[0] == '$' /* Orphan node */)
 					fprintf(f, "&{%s}", m_phandle->ref);
 				else
 					fprintf(f, "&%s", m_phandle->ref);
-- 
2.55.0

