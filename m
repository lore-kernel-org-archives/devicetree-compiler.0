Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27483FF1B4
	for <devicetree-compiler@vger.kernel.org>; Wed, 26 Aug 2026 09:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787737996; cv=none; b=Heb0mv3uILhGET3echdxb5TBO/AafIsBBLcB2Kmp4jLFvMDqoeQpa5VqiEST3DYPhOFJsU1dWF4VGRbUlJM+03kJMMB9jrixha+IRH7vvrlFhinBNXV+AaOTXFxQ6tTeC3BQ+B47QW+/f/Qh/xOyL4BnI4ohpd+NEOH/STnG5Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787737996; c=relaxed/simple;
	bh=d9LYov45tYlEpzEj8R1MMFOs3pKjPYhMHcPGJ68mkNk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fmbb2Ma+dGPHjbF3xFZwv1qTaowVFVPhtYL6H3a0UvokT/HmcTs9YTnE35fpi5TPm7aKFGzU6Yvqx2vRBqKtVGLI39LuJ7wnpbtUJfe8vAGdQEZVC437ImJQp02gRnm7prUM664+iTATu/Ya0Oc3Fu1uQkwr0Oy+nZd45p7OSfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=1N9M6mUC; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="1N9M6mUC"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6C3B44E413BC;
	Wed, 26 Aug 2026 09:53:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 41B10604EC;
	Wed, 26 Aug 2026 09:53:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CBF5F11C7AD35;
	Wed, 26 Aug 2026 11:53:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787737992; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=qfxlR2RQiwmgkv+b8NT3/RctLuodoQblwI+ysKo3gNs=;
	b=1N9M6mUClatuNdXNiPIgWHSEK9KuxwNIPlrYhyWR3w7uaBGVJLrOOsWyzrf2FXMpRW79gT
	hYP9xXVGI/u8AMojMi9V5zyyUSqYewvcbxbx5zxQTXB3Z2jG8uLbWlopHlcPOTpsh/yQTk
	UDNO7IHooA6NRBfMKt1BVZASUo9hp9EA29MhHTgYHKSxMUnCao6kVUJauA4aLe8NBeoI/S
	nG5Jl22ZxEhGE3DI9JhDNQShGDbr+RagxOSRnoo+DCwKa5Ms4wfwGSquRmaCyRveHa7GN2
	Lc7fq6tJfYWkoVSsRq2pxiLoIVRWSqY4BTaTmNZ3sEqgv45iLCx3jRVLfQZ0uw==
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
Subject: [RFC PATCH v2 49/74] dtc: Rename add_orphan_node() to plugin_add_orphan_node()
Date: Wed, 26 Aug 2026 11:49:18 +0200
Message-ID: <20260826094950.1088288-50-herve.codina@bootlin.com>
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
index 47f644eb..885123af 100644
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
index 06dd7db1..cad092c1 100644
--- a/dtc.h
+++ b/dtc.h
@@ -307,7 +307,8 @@ struct node *omit_node_if_unused(struct node *node);
 struct node *reference_node(struct node *node);
 struct node *chain_node(struct node *first, struct node *list);
 struct node *merge_nodes(struct node *old_node, struct node *new_node);
-struct node *add_orphan_node(struct node *old_node, struct node *new_node, char *ref);
+struct node *plugin_add_orphan_node(struct node *old_node, struct node *new_node,
+				    char *ref);
 
 void add_property(struct node *node, struct property *prop);
 void delete_property_by_name(struct node *node, char *name);
diff --git a/livetree.c b/livetree.c
index 71712649..ad9ae295 100644
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
2.55.0

