Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9C236656E
	for <devicetree-compiler@vger.kernel.org>; Mon, 12 Jan 2026 14:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227706; cv=none; b=J4Wk9gqGY5maW4SQc7wyiqpPdZ2QOe0HCqtOap9ze2j6xTC8aTTAA4vHUfTgy1/2miAlyG5cIidIaxTPRwBUe7pef4+rzPLPKOw0EkIe311msSTeGB45m/DsUI3vIOL6FFvb3rhR5JlSWhTw52y08ImZJ3VHEBM2Er2nsQF2QA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227706; c=relaxed/simple;
	bh=IrJPZI6VXCZCzF0YNT1D3PR1MOkanfIcfCm7fDKWAPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JeylnzR8lxolBC/yLLkdlU0Nz2iniazbgENtfbfjah2wuAN4umSAkNQjSnHcGWtCB+JDaGHNhu2dBVtPLFPidf9fanSCjigm69xldC56QVJnxkjwXkw/SNHkm83UFLNz7J8i48+eROE9tY1YrkPNZRcZw+jj6TLPSoBtaamnG/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Xp7VO5A/; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Xp7VO5A/"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id CDE38C20869;
	Mon, 12 Jan 2026 14:21:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4FF67606FA;
	Mon, 12 Jan 2026 14:21:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 25DD3103C9260;
	Mon, 12 Jan 2026 15:21:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227701; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=j3WcZn970eu+twwPT7s+M2+clKeDIgsnBF2MtWzp4oI=;
	b=Xp7VO5A/3sM7dI3gTUhbrhOa3LNSxwToUVVwkESrmeBCehZ8lc8hCD2k9A5uWmL0jw5bSU
	d0sYwJ+D4vOpus+eZHwx1HVb1W/yEENXjcw0dhf5cSJ3EOQuWKvgvH8NeIeErvx3CUJ3rx
	j2CKSwyBZ4486Bm2VEvrqe6rv+O452aFjbvoBQrFEMFF+CMMycLQcSjbwc/vWeTHyW+YGY
	7vbfd0OfMgnrwadxUwF/tCm/zCLrkGUhJ2lbSh4EpHwICYvEJVkXPF0J2J7NvuKVvzYeV7
	Uc0aZrkWwEowS8zqRl9t85lS6sQ5J+MqAJpp/yqYY1lvhBmIylp/2Eqb9SEeKg==
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
Subject: [RFC PATCH 53/77] dtc: Rename add_orphan_node() to plugin_add_orphan_node()
Date: Mon, 12 Jan 2026 15:19:43 +0100
Message-ID: <20260112142009.1006236-54-herve.codina@bootlin.com>
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

add_orphan_node() is used when a orphan node is parsed in a plugin
(overlay) device-tree.

This function creates some device-tree nodes (/fragment@n/__overlay__)
in order to merge the parsed orphan node.

This is specific to plugin device-trees and cannot be used for addon
device-trees.

In order to clarify that add_orphan_node() is specific to plugin
device-trees and to prepare the support for orphan node parsing
in the addon context, rename current add_orphan_node() to
plugin_add_orphan_node().

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 dtc-parser.y | 6 +++---
 dtc.h        | 3 ++-
 livetree.c   | 3 ++-
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index 626a232..2b5b3c4 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -245,7 +245,7 @@ devicetree:
 				ERROR(&@2, "Label or path %s not found", $1);
 			else if (is_ref_relative($1))
 				ERROR(&@2, "Label-relative reference %s not supported in plugin", $1);
-			$$ = add_orphan_node(
+			$$ = plugin_add_orphan_node(
 					name_node(build_node(NULL, NULL, NULL, NULL),
 						  ""),
 					$2, $1);
@@ -269,7 +269,7 @@ devicetree:
 			if (last_header_flags & DTSF_PLUGIN) {
 				if (is_ref_relative($2))
 					ERROR(&@2, "Label-relative reference %s not supported in plugin", $2);
-				add_orphan_node($1, $3, $2);
+				plugin_add_orphan_node($1, $3, $2);
 			} else {
 				struct node *target = parser_get_node_by_ref($1, $2);
 
@@ -288,7 +288,7 @@ devicetree:
 				merge_nodes(target, $3);
 			} else {
 				if (last_header_flags & DTSF_PLUGIN)
-					add_orphan_node($1, $3, $2);
+					plugin_add_orphan_node($1, $3, $2);
 				else
 					ERROR(&@2, "Label or path %s not found", $2);
 			}
diff --git a/dtc.h b/dtc.h
index 399beee..e463756 100644
--- a/dtc.h
+++ b/dtc.h
@@ -305,7 +305,8 @@ struct node *omit_node_if_unused(struct node *node);
 struct node *reference_node(struct node *node);
 struct node *chain_node(struct node *first, struct node *list);
 struct node *merge_nodes(struct node *old_node, struct node *new_node);
-struct node *add_orphan_node(struct node *old_node, struct node *new_node, char *ref);
+struct node *plugin_add_orphan_node(struct node *old_node, struct node *new_node,
+				    char *ref);
 
 void add_property(struct node *node, struct property *prop);
 void delete_property_by_name(struct node *node, char *name);
diff --git a/livetree.c b/livetree.c
index 52c55be..a21dfc1 100644
--- a/livetree.c
+++ b/livetree.c
@@ -319,7 +319,8 @@ struct node *merge_nodes(struct node *old_node, struct node *new_node)
 	return old_node;
 }
 
-struct node * add_orphan_node(struct node *dt, struct node *new_node, char *ref)
+struct node *plugin_add_orphan_node(struct node *dt, struct node *new_node,
+				    char *ref)
 {
 	static unsigned int next_orphan_fragment = 0;
 	struct node *node;
-- 
2.52.0

