Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE08E36B06F
	for <devicetree-compiler@vger.kernel.org>; Mon, 12 Jan 2026 14:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227725; cv=none; b=mCwq6NLX7xQcsZu2EZsLx7UMukErfQbkmGebEI8PZ5JVEmSoXa8brztWsiHjPSOn3VE9mQhCusXPjQpjU0Hp3eyRoOhCkyI/fEoQAIMNER4k8ruibzF9gjxPdRsbgGo8iYVkN0plPNAXv5TO27ixWxdDn/CIp8V9zS71HbE/l30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227725; c=relaxed/simple;
	bh=eXC6KiPRSYiUbdw5x5z03oKynbhr5u+FK7p6Aso0CQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o7Mdc7vOyYbfP3xWS5/fifVTtgNUE58RqtDHYxr9erCxpcwanuZxSLFgvg9Js0xj9RWs/CoyE2dhrh6CTwJl5UbSq1vtSSg0NKHzrsuet+Meno92HPIq8Cb8wcgGiFq18X18wV23PAraK9M4DXrG/qK3PdcaoqaozcpIUtBzBeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=OmVNvFG8; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="OmVNvFG8"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1D800C20868;
	Mon, 12 Jan 2026 14:21:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 94A74606FA;
	Mon, 12 Jan 2026 14:22:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6A798103C9260;
	Mon, 12 Jan 2026 15:22:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227721; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=2X1bVWB5ni5ZlaBKphLXnDg0oYmAUpV1QfsFhnR66KE=;
	b=OmVNvFG8RZytEjMDSF7NwiZDaybBKcH8AzhWWGQGXEjlkLd73zwdJj78k1RA1jNrX4jUxo
	gcdcZuTlUgF6vihsT3WxBaj2aYhzGkfonifwc6osFlZrzQ2UKS+Dmm6GULYmKS8EHwY4Zk
	ouTmHHCZ44RQTWDWKQ/HdFKe6uKhCyUWfuvAJu/ZC5xeNq9xrkz5E+8ArpYmqy7CgaHunf
	S/V4eGAy6sk0anxsVh/M4Vwfv3gWIe5CETm4lbxxeddYOSFBJCt95Kza/ESd5Bf8MSt2hv
	UrKZwLqZaQY9gP8cPJ6gK+k2mO94EIjx2FwbxY0qYAF+5g48S9792Gq2v4oNYA==
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
Subject: [RFC PATCH 66/77] dtc: Add support for namespace labels references
Date: Mon, 12 Jan 2026 15:19:56 +0100
Message-ID: <20260112142009.1006236-67-herve.codina@bootlin.com>
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

Namespace labels references can only be present in addons and involves
import/exported symbols.

They allow to 'jump' from node to node based on exported symbols defined
at each node.

When a label reference contains a dot ('.') char, it becomes a namespace
labels reference.

For instance &foo.bar.baz is a namespace label reference. The resolution
of this reference is performed in a recursive way.
   - Get the node referenced by foo.
   - From this node get the node referenced by bar in exported symbols
     from foo.
   - From this node get the node referenced by baz in exported symbols
     from bar.
   - ...

The first item (foo) involves import symbols defined in the addon and
export symbols defined in the node the addon is applied to.

Other items involves only exported symbols in referenced nodes to
perform the resolution chain.

We leave the addon thanks to the first item and import symbols. Other
items allow to perform jumps from node to node in the base device-tree
without leaving it.

The full resolution can be summarized with the following diagram:

  (addon DT)
  &foo.bar.baz
   |    |   |
   |    |   +--------------------------------------------+
   |    |                                                |
   |    +-------------------------------+                |
   |                                    |                |
   |   (addon DT)                       |                |
   +-> /import/ foo: --+                |                |
                       |                |                |
                       |                |                |
  addon applied at     |                |                |
  target node in the   |                |                |
  base DT              |                |                |
    |                  |                |                |
    |   (base DT)      |                |                |
    +---> target {     v                |                |
             /export/ foo: &n1;         |                |
                            |           |                |
                            |           |                |
                            v (base DT) |                |
                            n1 {        v                |
                              /export/ bar: &n2;         |
                                             |           |
                                             v (base DT) |
                                             n2 {        v
                                               /export/ baz: &n3;
                                                              |
                                                              |
                                                              v
                                                              n3 { ... };

'&foo.bar.baz' references, in the end, the n3 node from the base DT.

Implement support for namespace references parsing in dtc.

The resolution part is out of dtc. Indeed, dtc has no support for
applying an addon.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 dtc-lexer.l  | 13 +++++++++++++
 dtc-parser.y | 49 ++++++++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 59 insertions(+), 3 deletions(-)

diff --git a/dtc-lexer.l b/dtc-lexer.l
index 540bfdf..14b5488 100644
--- a/dtc-lexer.l
+++ b/dtc-lexer.l
@@ -232,6 +232,12 @@ static void PRINTF(1, 2) lexical_error(const char *fmt, ...);
 			return DT_LABEL_REF;
 		}
 
+<*>\&{LABEL}(\.{LABEL})+	{	/* namespace label reference */
+			DPRINT("Ref namespace: %s\n", yytext+1);
+			yylval.labelref = xstrdup(yytext+1);
+			return DT_LABEL_NAMESPACE_REF;
+		}
+
 <*>"&{"{PATHCHAR}*\}	{	/* new-style path reference */
 			yytext[yyleng-1] = '\0';
 			DPRINT("Ref: %s\n", yytext+2);
@@ -246,6 +252,13 @@ static void PRINTF(1, 2) lexical_error(const char *fmt, ...);
 			return DT_ORPHAN_PATH_REF;
 		}
 
+<*>"&{\$"{LABEL}(\.{LABEL})+([/]{PATHCHAR}*)?\}  {	/* orphan path reference */
+			yytext[yyleng-1] = '\0';
+			DPRINT("Ref (namespace) orphan path: %s\n", yytext+1);
+			yylval.labelref = xstrdup(yytext+2);
+			return DT_ORPHAN_PATH_REF;
+		}
+
 <BYTESTRING>[0-9a-fA-F]{2} {
 			yylval.byte = strtol(yytext, NULL, 16);
 			DPRINT("Byte: %02x\n", (int)yylval.byte);
diff --git a/dtc-parser.y b/dtc-parser.y
index 9d619cd..8c63e83 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -32,6 +32,11 @@ static bool is_ref_relative(const char *ref)
 	return ref[0] != '/' && strchr(&ref[1], '/');
 }
 
+static bool is_ref_namespace(const char *ref)
+{
+	return strchr(ref, '.');
+}
+
 static struct node *parser_get_node_by_ref(struct node *dt, struct node *orphanlist,
 					   const char *ref)
 {
@@ -110,6 +115,7 @@ static struct node *parser_get_node_by_ref(struct node *dt, struct node *orphanl
 %token <data> DT_STRING
 %token <labelref> DT_LABEL
 %token <labelref> DT_LABEL_REF
+%token <labelref> DT_LABEL_NAMESPACE_REF
 %token <labelref> DT_PATH_REF
 %token <labelref> DT_ORPHAN_PATH_REF
 %token DT_INCBIN
@@ -260,7 +266,7 @@ importdef:
 		}
 	;
 
-dt_ref: DT_LABEL_REF | DT_PATH_REF;
+dt_ref: DT_LABEL_REF | DT_PATH_REF | DT_LABEL_NAMESPACE_REF;
 
 devicetree:
 	  '/' nodedef
@@ -281,6 +287,9 @@ devicetree:
 			else if (is_ref_relative($1))
 				ERROR(&@2, "Label-relative reference %s not supported in plugin nor addon", $1);
 
+			if (!(last_header_flags & DTSF_ADDON) && is_ref_namespace($1))
+				ERROR(&@2, "Namespaced label reference %s supported only in addon", $1);
+
 			if (last_header_flags & DTSF_PLUGIN) {
 				$$ = plugin_add_orphan_node(
 						name_node(build_node(NULL, NULL, NULL, NULL),
@@ -300,6 +309,10 @@ devicetree:
 			if ((last_header_flags & (DTSF_PLUGIN | DTSF_ADDON)) && is_ref_relative($3))
 				ERROR(&@2, "Label-relative reference %s not supported in plugin nor addon", $3);
 
+			if (!(last_header_flags & DTSF_ADDON) && is_ref_namespace($3))
+				ERROR(&@2, "Namespaced label reference %s supported only in addon", $3);
+
+
 			if (target) {
 				add_label(&target->labels, $2);
 				merge_nodes(target, $4);
@@ -346,6 +359,25 @@ devicetree:
 			}
 			$$ = $1;
 		}
+	| devicetree DT_LABEL_NAMESPACE_REF nodedef
+		{
+			struct node *target = parser_get_node_by_ref(
+						$1, parser_orphanlist, $2);
+
+			if (!(last_header_flags & DTSF_ADDON))
+				ERROR(&@2, "Namespaced label reference %s supported only in addon", $2);
+
+			if (target) {
+				merge_nodes(target, $3);
+			} else {
+				if (last_header_flags & DTSF_ADDON)
+					addon_add_orphan_node(&parser_orphanlist,
+							      orphan_node($3, $2));
+				else
+					ERROR(&@2, "Label or path %s not found", $2);
+			}
+			$$ = $1;
+		}
 	| devicetree DT_DEL_NODE dt_ref ';'
 		{
 			struct node *target = parser_get_node_by_ref(
@@ -422,6 +454,10 @@ exportlist:
 exportdef:
 	DT_EXPORT DT_LABEL dt_ref ';'
 		{
+			/* Only an addon can use namespaced labels references */
+			if (!(last_header_flags & DTSF_ADDON) && is_ref_namespace($3))
+				ERROR(&@2, "Namespaced label reference %s supported only in addon", $3);
+
 			$$ = build_exportsym($2, $3, 0, &@$);
 			free($2);
 			free($3);
@@ -477,6 +513,9 @@ propdata:
 		}
 	| propdataprefix dt_ref
 		{
+			if (!(last_header_flags & DTSF_ADDON) && is_ref_namespace($2))
+				ERROR(&@2, "Namespaced label reference %s supported only in addon", $2);
+
 			$1 = data_add_marker($1, TYPE_STRING, $2);
 			$$ = data_add_marker($1, REF_PATH, $2);
 		}
@@ -582,13 +621,17 @@ arrayprefix:
 		{
 			uint64_t val = ~0ULL >> (64 - $1.bits);
 
-			if ($1.bits == 32)
+			if ($1.bits == 32) {
+				if (!(last_header_flags & DTSF_ADDON) && is_ref_namespace($2))
+					ERROR(&@2, "Namespaced label reference %s supported only in addon", $2);
+
 				$1.data = data_add_marker($1.data,
 							  REF_PHANDLE,
 							  $2);
-			else
+			} else {
 				ERROR(&@2, "References are only allowed in "
 					    "arrays with 32-bit elements.");
+			}
 
 			$$.data = data_append_integer($1.data, val, $1.bits);
 		}
-- 
2.52.0

