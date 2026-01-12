Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF1336AB7A;
	Mon, 12 Jan 2026 14:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227722; cv=none; b=j13ZbeK1apzyIClFzJMzPsjmM0PwNuueMi3gZO5xseyEmlSGaAOVY45scjoKfa/RyQx8Y5rvUIDh4VfQQeCXWJJBO9y+4no8YZrFsdfOvKzdsj22+gAqiuGP48vTPIDmkdL7l+0WsLOyp+ncRJOd7HVqv+0IcFgrJkLcHKdcxRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227722; c=relaxed/simple;
	bh=IQAXO5C5Eq1ZdOJzJLzu/hy+A3JAeF8JEfjcPrQjQag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XeZp6B4rqaMxniWetMR9pfySS/a3ZfKw/L8kaev+9t48pPssf1NBFCfAyeRGujMtS+P4PrWTkl9VPDuMisQTiqAynKtolwkGB4nzit8YyhKKeYszM4toSjUYGbE7UOM9nBQ+fuhyggvBb5aKEmo0F1VBbEvDujBXUkGHrTXqcRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=vjcwI++6; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="vjcwI++6"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 877451A2810;
	Mon, 12 Jan 2026 14:21:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 571C8606FA;
	Mon, 12 Jan 2026 14:21:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 93FE1103C9262;
	Mon, 12 Jan 2026 15:21:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227718; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=zkrl7KQL2mBWiVPlgvVg1DTApCz/hctc5nPdz+ry7R4=;
	b=vjcwI++6Kkr2AdtBxraNlVfueJGHciiQ8fq1VLcZtVGY0ZtC+UR9QksinNKoULX7W2d3Ko
	DTrBKrjU6Ol7+UUm+0uTjSJJa2oBeWkEx2+T4xc6nGO6aWlgZRqGW4F+JgHfFgB0WzwF26
	hyrtteDonOX33ELV7creSCLmpg0KXH+wri2xaZ5vSR6qk7dqZJb7V2+YFJgDx/vD9LF6Sd
	tN216lb0W0rORQ6Z3q6d3BLTNjEemej5RSFngNFsI4KsUU5wJVUL3iLXWvlXhqFqKx4pR+
	Csk+5JmKc6KoKArJ5obzcVLjWmVnWY7mja9ZKNE0lOTYZ+msWHyJU4V5mxDESA==
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
Subject: [RFC PATCH 64/77] dtc: Add support for references by path involving orphan nodes
Date: Mon, 12 Jan 2026 15:19:54 +0100
Message-ID: <20260112142009.1006236-65-herve.codina@bootlin.com>
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
FDT_REF_LOCAL.

Converting back this dtb to a dts, the marked local phandle should be
translated to a path to the related local node.

The issue is that this local node is not in a root device tree. We need
to identify the orphan node the foo node belongs to.

We cannot use a path starting by '/'. This kind of path identify node in
the root tree.

This new syntax allows to identify the orphan node in a path:
  $<orphan_name>/<path>

This leads to a reference by path in the form &{$<orphan_name>/<path>}.

Using the previous example, those both phandles points to the same node:
  foo-phandle1 = <&foo_label>;    /* Reference by label */
  foo-phandle2 = <&{$node2/foo}>; /* Reference by path */

When the dtb is converted back to a dts, the marked local phandle
involving subnode available from orphan nodes can be translated to a
reference by path thanks to the new syntax.

Add support for this &{$<orphan_name>/<path>} syntax to reference by
path a local node from an orphan node.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 dtc-lexer.l  |  7 +++++++
 dtc-parser.y | 19 +++++++++++++++++++
 dtc.c        | 22 ++++++++++++++++++++--
 livetree.c   | 14 +++++++++++++-
 treesource.c |  3 ++-
 5 files changed, 61 insertions(+), 4 deletions(-)

diff --git a/dtc-lexer.l b/dtc-lexer.l
index cb616f9..540bfdf 100644
--- a/dtc-lexer.l
+++ b/dtc-lexer.l
@@ -239,6 +239,13 @@ static void PRINTF(1, 2) lexical_error(const char *fmt, ...);
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
index 7f8c294..9d619cd 100644
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
diff --git a/dtc.c b/dtc.c
index 63725bf..72d85e4 100644
--- a/dtc.c
+++ b/dtc.c
@@ -48,13 +48,31 @@ static void fill_fullpaths(struct node *tree, const char *prefix)
 static void dti_fill_fullpaths(struct dt_info *dti)
 {
 	struct node *orphan;
+	struct node *child;
 
 	/* Fill fullpaths for the root node */
 	if (dti->dt)
 		fill_fullpaths(dti->dt, "");
 
-	for_each_orphan(dti->orphanlist, orphan)
-		fill_fullpaths(orphan, "__orphan__/");
+	/* Fill fullpaths for orphan nodes */
+	for_each_orphan(dti->orphanlist, orphan) {
+		if (orphan->name[0] == '\0')
+			die("orphan node has an empty name\n");
+
+		/*
+		 * An orphan node name is set with its reference.
+		 * Its name is in the form "&xxxxxx".
+		 * For its full path, we use "$xxxxx" to make a clear
+		 * distinction between a reference (&xxxx) where a resolution
+		 * could be involved vs a "simple" path where we just need to
+		 * identified the orphan ($xxxx).
+		 */
+		xasprintf(&orphan->fullpath, "$%s", orphan->name + 1);
+		orphan->basenamelen = strlen(orphan->name);
+
+		for_each_child(orphan, child)
+			fill_fullpaths(child, orphan->fullpath);
+	}
 }
 
 /* Usage related data. */
diff --git a/livetree.c b/livetree.c
index 59b912d..263da1f 100644
--- a/livetree.c
+++ b/livetree.c
@@ -804,7 +804,19 @@ static struct node *get_node_by_ref(struct node *tree, const char *ref)
 			path = slash + 1;
 		}
 
-		target = get_node_by_label(tree, label);
+		if (label[0] == '$' && tree->name[0] == '&') {
+			/*
+			 * We search for an orphan and the given tree is an
+			 * orphan. Use the given tree only if it matches the
+			 * expected orphan.
+			 */
+			if (streq(label + 1, tree->name + 1))
+				target = tree;
+			else
+				target = NULL;
+		} else {
+			target = get_node_by_label(tree, label);
+		}
 
 		free(buf);
 
diff --git a/treesource.c b/treesource.c
index 71dbd5f..44de0db 100644
--- a/treesource.c
+++ b/treesource.c
@@ -278,7 +278,8 @@ static void write_propval(FILE *f, struct property *prop)
 					break;
 
 			if (m_phandle) {
-				if (m_phandle->ref[0] == '/')
+				if (m_phandle->ref[0] == '/' /* Root node */ ||
+				    m_phandle->ref[0] == '$' /* Orphan node */)
 					fprintf(f, "&{%s}", m_phandle->ref);
 				else
 					fprintf(f, "&%s", m_phandle->ref);
-- 
2.52.0

