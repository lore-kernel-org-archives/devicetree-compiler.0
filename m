Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7F83C454F;
	Wed, 26 Aug 2026 09:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787737898; cv=none; b=BMZkanBRjlehImTBWjlgmjKdKkMrwthBb42TR/0aANVC/MCn76Wv5G7FkUP0DlRPFgCFccRoJ0YDOg+urLx3jdHXHEuUprmWm8myZwNMi49Bwt/Pgr5Ez9qmFy5zFvd90DykD6mu+tliIPIvsHrRc54Yizq7RSh3CQf8GdxLnWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787737898; c=relaxed/simple;
	bh=FafxXcWLHkT6mobjaPahraFM56aLYdhtmOWljdhGozI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D6H5hVcDuGRj64Kf5J/EJDe78YVhXevBeC+f29QKre5uZG0aX8LrPx63TUlbC7pKRXV+PcZ0s0MS/hYO2Qvpg2aDwCQU7uuCIPlKaYiW0Eo4yBbaI1CTdLNsOX4WWQPTwfYbK2U1fKparpiv5z2BDPI3SpW18x9BjW0WUAc4IKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=uBTEvyDc; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="uBTEvyDc"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 868A94E413BF;
	Wed, 26 Aug 2026 09:51:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5B10A604EC;
	Wed, 26 Aug 2026 09:51:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2200411C7AD59;
	Wed, 26 Aug 2026 11:51:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787737893; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=0OOERp9GOpR0ilEqw6m/Mc9kXd1+dbUxBx6/f3UWhGg=;
	b=uBTEvyDcujxONUTlJtUT8l4efpSyeGVEdGJq1BBfMJEezQiadO1ocoOBOWl767C71TMFsR
	cK4DPIeHb4L9/0CA8OHE9aLKxUrXBrVKRT18472iHThmQw2ol5Vtzx4Tgycv4fLBebNOP4
	qYTxikqREgWJhM62IuoBuJGmVHmCiA9TuHR/t6LRadmdgPxtrNfsto4jOfeq3mRg7wqBev
	SOAjlmn8V5V3hgZY/7nwonXLvsympY8KzRU+/jNI2HTEKxSHGfNghGQwag+prf7aiCbZs9
	ynIgsd1fk+VkNNSQdoGy0EwFObPSBP/rnzvkqqHzpKS/E4tXAnbR2qEMatIPcg==
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
Subject: [RFC PATCH v2 16/74] dtc: Introduce export symbols
Date: Wed, 26 Aug 2026 11:48:45 +0200
Message-ID: <20260826094950.1088288-17-herve.codina@bootlin.com>
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

Export symbols allow to define a list of symbols exported at a given
node level. Those exported symbols can be used by an addon when the
addon is applied on the node exporting the symbols. In order to perform
its symbol resolution. Any unresolved phandle value will be resolved
using those exported symbols.

The feature is similar to __symbols__ involved with overlay but while
all symbols are visible with __symbols__, only specific symbols
(exported symbols) are visible with export symbols.

Also an exported symbol has a specific name and this name has to
used for symbol resolution.

Having both specific exported symbol names and exported symbols at
specific node level allow to:

  - Have several nodes providing the same exported symbols
    name but each of them pointing to different nodes.

    Without looking at the detail of the syntax, node-a and node-b
    export the same symbol foo but pointing to different node.
      node-a {
        /* export foo -> /path/foo1 */
      };
      node-b {
        /* export foo -> /path/foo2 */
      };

    This allow to have the exact same addon referencing 'foo' applied
    either on node-a or node-b.

  - Have several board describing a well defined node even if resources
    needed for exported symbols are not the same.

    On board A, the 'ctrl' exported symbols points to some ctrl device
    available on the SoC:
      node {
        /* export 'ctrl' -> /soc/ctrl@1000
      };

    On board B, the ctrl device used is on a i2c bus
      node {
        /* export 'ctrl' -> /soc/i2c@5000/ctrl@10
      };

    The addon can be used on board A and board B without any
    modification. It uses 'ctrl' exported by the node it is applied
    to.

Introduce the 'symbol' internal data structure and the export symbol
list related to a node.

No functional change yet but preparation for the future support
for export symbol parsing.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 dtc-parser.y |  6 +++---
 dtc.h        | 13 ++++++++++++-
 flattree.c   |  2 +-
 fstree.c     |  2 +-
 livetree.c   |  7 ++++---
 5 files changed, 21 insertions(+), 9 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index 2e152b0e..9c936736 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -183,7 +183,7 @@ devicetree:
 			else if (is_ref_relative($1))
 				ERROR(&@2, "Label-relative reference %s not supported in plugin", $1);
 			$$ = add_orphan_node(
-					name_node(build_node(NULL, NULL, NULL),
+					name_node(build_node(NULL, NULL, NULL, NULL),
 						  ""),
 					$2, $1);
 		}
@@ -270,11 +270,11 @@ devicetree:
 nodedef:
 	  '{' proplist subnodes '}' ';'
 		{
-			$$ = build_node($2, $3, &@$);
+			$$ = build_node($2, $3, NULL, &@$);
 		}
 	| '{' subnodes '}' ';'
 		{
-			$$ = build_node(NULL, $2, &@$);
+			$$ = build_node(NULL, $2, NULL, &@$);
 		}
 	;
 
diff --git a/dtc.h b/dtc.h
index 40aab572..af69b193 100644
--- a/dtc.h
+++ b/dtc.h
@@ -204,6 +204,16 @@ struct label {
 	struct label *next;
 };
 
+struct symbol {
+	bool is_local;
+	char *name;
+	char *ref;
+	cell_t phandle;
+	char *fullpath;
+	struct symbol *next;
+	struct srcpos *srcpos;
+};
+
 struct bus_type {
 	const char *name;
 };
@@ -224,6 +234,7 @@ struct node {
 	char *name;
 	struct property *proplist;
 	struct node *children;
+	struct symbol *exportsymlist;
 
 	struct node *parent;
 	struct node *next_sibling;
@@ -272,7 +283,7 @@ struct property *chain_property(struct property *first, struct property *list);
 struct property *reverse_properties(struct property *first);
 
 struct node *build_node(struct property *proplist, struct node *children,
-			struct srcpos *srcpos);
+			struct symbol *exportsymlist, struct srcpos *srcpos);
 struct node *build_node_delete(struct srcpos *srcpos);
 struct node *name_node(struct node *node, const char *name);
 struct node *omit_node_if_unused(struct node *node);
diff --git a/flattree.c b/flattree.c
index 004119c4..ac6bcd8f 100644
--- a/flattree.c
+++ b/flattree.c
@@ -902,7 +902,7 @@ static struct node *unflatten_tree(struct inbuf *dtbuf,
 	uint32_t len;
 	const char *str;
 
-	node = build_node(NULL, NULL, NULL);
+	node = build_node(NULL, NULL, NULL, NULL);
 
 	flatname = flat_read_string(dtbuf);
 
diff --git a/fstree.c b/fstree.c
index 0f9a534b..445ae53a 100644
--- a/fstree.c
+++ b/fstree.c
@@ -19,7 +19,7 @@ static struct node *read_fstree(const char *dirname)
 	if (!d)
 		die("Couldn't opendir() \"%s\": %s\n", dirname, strerror(errno));
 
-	tree = build_node(NULL, NULL, NULL);
+	tree = build_node(NULL, NULL, NULL, NULL);
 
 	while ((de = readdir(d)) != NULL) {
 		char *tmpname;
diff --git a/livetree.c b/livetree.c
index 2ad7fd09..a7f81a90 100644
--- a/livetree.c
+++ b/livetree.c
@@ -86,7 +86,7 @@ struct property *reverse_properties(struct property *first)
 }
 
 struct node *build_node(struct property *proplist, struct node *children,
-			struct srcpos *srcpos)
+			struct symbol *exportsymlist, struct srcpos *srcpos)
 {
 	struct node *new = xmalloc(sizeof(*new));
 	struct node *child;
@@ -95,6 +95,7 @@ struct node *build_node(struct property *proplist, struct node *children,
 
 	new->proplist = reverse_properties(proplist);
 	new->children = children;
+	new->exportsymlist = exportsymlist;
 	new->srcpos = srcpos_copy(srcpos);
 
 	for_each_child(new, child) {
@@ -248,7 +249,7 @@ struct node * add_orphan_node(struct node *dt, struct node *new_node, char *ref)
 	xasprintf(&name, "fragment@%u",
 			next_orphan_fragment++);
 	name_node(new_node, "__overlay__");
-	node = build_node(p, new_node, NULL);
+	node = build_node(p, new_node, NULL, NULL);
 	name_node(node, name);
 	free(name);
 
@@ -993,7 +994,7 @@ static struct node *build_and_name_child_node(struct node *parent, const char *n
 {
 	struct node *node;
 
-	node = build_node(NULL, NULL, NULL);
+	node = build_node(NULL, NULL, NULL, NULL);
 	name_node(node, name);
 	add_child(parent, node);
 
-- 
2.55.0

