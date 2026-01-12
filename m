Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4C42EC0A5;
	Mon, 12 Jan 2026 14:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227662; cv=none; b=qhZ4tKjv2Q0Tgn94PD5+2UgEUS3YyStm1BsVqtoISeJBFt7Tl++B0izjDCAUF50cZOSwwouE8gBKF5Cg8/6GJI0iB5gGX3TLBFZD1F0fOSsX6izKVbagCRKpp6rQQp5X294yS8USZKfruHgx5qmn+oQwA5K74b4SQJCE4OC33gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227662; c=relaxed/simple;
	bh=J6bCEsZwMsxttH6QPEEWjkYfZh/WpP7ik2dZx1kzGFA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bnqhbM1XdM2QldZzK0J8iV0AuyExJxeBnC4ERsvMEPDsA1Hz7jLfmaJGATjjm7/vAodECXOY2nX08OYIv6Kvb5TMPHavPpjoz7p6n57e4L3/Z6F54EkJQm2D9VRq0O1WCK2gNNS/zZRK2hcWLqZ3rsevnKvdX5TyNO4uf9jPCoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=h0sbFq/1; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="h0sbFq/1"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id F07551A27FF;
	Mon, 12 Jan 2026 14:20:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C66FA606FA;
	Mon, 12 Jan 2026 14:20:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B840D103C9263;
	Mon, 12 Jan 2026 15:20:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227652; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=3BmKNBuRwyGDqMyaOhYLXX0QommV1DD0zaD2Zr2QKNg=;
	b=h0sbFq/1YaMhabvgGSwzZ9GblOMG8Rj5g7okbRNLNDBB56ZgNgNdMK6fIFnwyS6JPfWoTD
	L8jFcPHPI/UxM9QqQX3me461bHRYCq8tkJGpqKt+sOOTXt1Hk3yiWPL637zXWixbfLtuex
	sYRfJl6+a+LwtopJWGnGtL02OBtPLmW/AzuPi+tqgbUdmc5RyXFYhC/FwOHfmC/a0Hi78G
	YSqpX62BrLAhZorIaaa3qKZsKv5gk+B5KS+kleIQpSRRkZ/f4rUenocETvmQs6XcEB9mkZ
	hEUs0dMppgMhPpimmyMoYfQ7wlVnFNTPFcLpdEocaAs3rAhClBEYAW4zNyK/tA==
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
Subject: [RFC PATCH 20/77] dtc: Add support for /export/ dts keyword parsing
Date: Mon, 12 Jan 2026 15:19:10 +0100
Message-ID: <20260112142009.1006236-21-herve.codina@bootlin.com>
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

The /export/ dts keyword is the keyword used to define an exported
symbol at a given node level.

This keyword can be present in a node definition (after properties and
before subnodes) to export a symbol. If several symbols need to be
exported, several /export/ keywords are present.

The syntax used is the following:
  /export/ name: reference;

with:
  name: The name of the exported symbol
  reference: The reference of a node the symbol is pointing to.

For instance:
  - Reference by label:
      /export/ foo: &foo1;

    The exported symbol foo references the node identified by
    the label foo1.

  - Reference by path:
      /export/ foo: &{/path/to/foo@100};

    The exported symbol foo references the node at /path/to/foo@100.

Add support for /export/ dts keyword.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 dtc-lexer.l  |  6 ++++
 dtc-parser.y | 53 ++++++++++++++++++++++++++++++++++
 dtc.h        |  8 ++++++
 livetree.c   | 80 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 147 insertions(+)

diff --git a/dtc-lexer.l b/dtc-lexer.l
index a4a8e0b..90fe70e 100644
--- a/dtc-lexer.l
+++ b/dtc-lexer.l
@@ -149,6 +149,12 @@ static void PRINTF(1, 2) lexical_error(const char *fmt, ...);
 			return DT_OMIT_NO_REF;
 		}
 
+<*>"/export/" 	{
+			DPRINT("Keyword: /export/\n");
+			BEGIN_DEFAULT();
+			return DT_EXPORT;
+		}
+
 <*>{LABEL}:	{
 			DPRINT("Label: %s\n", yytext);
 			yylval.labelref = xstrdup(yytext);
diff --git a/dtc-parser.y b/dtc-parser.y
index 9c93673..a0d0aef 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -46,6 +46,8 @@ static bool is_ref_relative(const char *ref)
 	struct property *proplist;
 	struct node *node;
 	struct node *nodelist;
+	struct symbol *symbol;
+	struct symbol *exportlist;
 	struct reserve_info *re;
 	uint64_t integer;
 	unsigned int flags;
@@ -60,6 +62,7 @@ static bool is_ref_relative(const char *ref)
 %token DT_DEL_PROP
 %token DT_DEL_NODE
 %token DT_OMIT_NO_REF
+%token DT_EXPORT
 %token <propnodename> DT_PROPNODENAME
 %token <integer> DT_LITERAL
 %token <integer> DT_CHAR_LITERAL
@@ -80,6 +83,8 @@ static bool is_ref_relative(const char *ref)
 %type <data> bytestring
 %type <prop> propdef
 %type <proplist> proplist
+%type <symbol> exportdef
+%type <exportlist> exportlist
 %type <labelref> dt_ref
 
 %type <node> devicetree
@@ -276,6 +281,49 @@ nodedef:
 		{
 			$$ = build_node(NULL, $2, NULL, &@$);
 		}
+	| '{' proplist exportlist subnodes '}' ';'
+		{
+			/*
+			 * exportlist is created with chain_symbol() and so it
+			 * is created in reverse order. Reverse it now to have
+			 * it in correct order
+			 */
+			$$ = build_node($2, $4, reverse_symbol($3), &@$);
+		}
+	| '{' exportlist subnodes '}' ';'
+		{
+			/*
+			 * exportlist is created with chain_symbol() and so it
+			 * is created in reverse order. Reverse it now to have
+			 * it in correct order
+			 */
+			$$ = build_node(NULL, $3, reverse_symbol($2), &@$);
+		}
+	;
+
+exportlist:
+	  exportdef
+		{
+			$$ = chain_symbol($1, NULL);
+		}
+	| exportlist exportdef
+		{
+			$$ = chain_symbol($2, $1);
+		}
+	| exportlist propdef
+		{
+			ERROR(&@2, "Properties must precede exports");
+			YYERROR;
+		}
+	;
+
+exportdef:
+	DT_EXPORT DT_LABEL dt_ref ';'
+		{
+			$$ = build_exportsym($2, $3, 0, &@$);
+			free($2);
+			free($3);
+		}
 	;
 
 proplist:
@@ -576,6 +624,11 @@ subnodes:
 			ERROR(&@2, "Properties must precede subnodes");
 			YYERROR;
 		}
+	| subnode exportdef
+		{
+			ERROR(&@2, "Exports must precede subnodes");
+			YYERROR;
+		}
 	;
 
 subnode:
diff --git a/dtc.h b/dtc.h
index 6508694..0bf5ba5 100644
--- a/dtc.h
+++ b/dtc.h
@@ -273,6 +273,9 @@ struct node {
 	for_each_child_withdel(n, c) \
 		if (!(c)->deleted)
 
+#define for_each_symbol(s0, s) \
+	for ((s) = (s0); (s); (s) = (s)->next)
+
 void add_label(struct label **labels, char *label);
 void delete_labels(struct label **labels);
 
@@ -282,6 +285,11 @@ struct property *build_property_delete(const char *name);
 struct property *chain_property(struct property *first, struct property *list);
 struct property *reverse_properties(struct property *first);
 
+struct symbol *build_exportsym(const char *name, const char *ref, cell_t phandle,
+			       struct srcpos *srcpos);
+struct symbol *chain_symbol(struct symbol *first, struct symbol *list);
+struct symbol *reverse_symbol(struct symbol *list);
+
 struct node *build_node(struct property *proplist, struct node *children,
 			struct symbol *exportsymlist, struct srcpos *srcpos);
 struct node *build_node_delete(struct srcpos *srcpos);
diff --git a/livetree.c b/livetree.c
index 0050492..4458437 100644
--- a/livetree.c
+++ b/livetree.c
@@ -36,6 +36,57 @@ void delete_labels(struct label **labels)
 		label->deleted = 1;
 }
 
+struct symbol *build_exportsym(const char *name, const char *ref, cell_t phandle,
+			       struct srcpos *srcpos)
+{
+	struct symbol *new = xmalloc(sizeof(*new));
+
+	memset(new, 0, sizeof(*new));
+
+	new->name = xstrdup(name);
+	new->ref = ref ? xstrdup(ref) : NULL;
+	new->phandle = phandle;
+	new->srcpos = srcpos_copy(srcpos);
+
+	return new;
+}
+
+struct symbol *chain_symbol(struct symbol *first, struct symbol *list)
+{
+	assert(first->next == NULL);
+
+	first->next = list;
+	return first;
+}
+
+struct symbol *reverse_symbol(struct symbol *list)
+{
+	struct symbol *p = list;
+	struct symbol *head = NULL;
+	struct symbol *next;
+
+	while (p) {
+		next = p->next;
+		p->next = head;
+		head = p;
+		p = next;
+	}
+	return head;
+}
+
+static void add_symbol(struct symbol **list, struct symbol *new)
+{
+	struct symbol **s;
+
+	new->next = NULL;
+
+	s = list;
+	while (*s)
+		s = &((*s)->next);
+
+	*s = new;
+}
+
 struct property *build_property(const char *name, struct data val,
 				struct srcpos *srcpos)
 {
@@ -144,6 +195,7 @@ struct node *merge_nodes(struct node *old_node, struct node *new_node)
 {
 	struct property *new_prop, *old_prop;
 	struct node *new_child, *old_child;
+	struct symbol *new_sym, *old_sym;
 	struct label *l;
 
 	old_node->deleted = 0;
@@ -217,6 +269,34 @@ struct node *merge_nodes(struct node *old_node, struct node *new_node)
 			add_child(old_node, new_child);
 	}
 
+	/* Merge exported symbols. If there is a collision, keep the new one */
+	while (new_node->exportsymlist) {
+		/* Pop the symbol off the list */
+		new_sym = new_node->exportsymlist;
+		new_node->exportsymlist = new_sym->next;
+		new_sym->next = NULL;
+
+		/* Look for a collision, set new value if there is */
+		for_each_symbol(old_node->exportsymlist, old_sym) {
+			if (streq(old_sym->name, new_sym->name)) {
+				old_sym->is_local = new_sym->is_local;
+				free(old_sym->ref);
+				old_sym->ref = new_sym->ref;
+				old_sym->phandle = new_sym->phandle;
+				old_sym->fullpath = new_sym->fullpath;
+				srcpos_free(old_sym->srcpos);
+				old_sym->srcpos = new_sym->srcpos;
+				free(new_sym);
+				new_sym = NULL;
+				break;
+			}
+		}
+
+		/* if no collision occurred, add symbol to the old node list. */
+		if (new_sym)
+			add_symbol(&old_node->exportsymlist, new_sym);
+	}
+
 	old_node->srcpos = srcpos_extend(old_node->srcpos, new_node->srcpos);
 
 	/* The new node contents are now merged into the old node.  Free
-- 
2.52.0

