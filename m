Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34B1364040;
	Mon, 12 Jan 2026 14:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227699; cv=none; b=NNDtaeDuT9HM5Gpzci38bTpHs+WcReKu/wF5OjiPLyk4KWNHx3//qATER7BrUBisOCjcpUOvctLN4G1JlH+oKof4lpnOdGDdFHUiXZPMUdmIsHBrOtCQ4yBEGMmY+TJsLplLWxKiQfxYsZSlSdJ4JvO21QmsOde9E3mS6M31I0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227699; c=relaxed/simple;
	bh=QfKhIfkPqMqdIskblp9qTUUzND0cPzgSg1a/L3LMy2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MuHyU39ZKTe5tcLU9NV2cj9d7kqmzD9TVky087Wc2A/O1HM5qbCZI69snxWbdcRtJmSpRmi+90SmGPoC3J5KrK8eqdYFxlX07xNmzRtHF9QqOpmML03PjBO4fIyf61EGL2jn3trc6MDDwq26Qm7tlQyZMwaKU9Sir8UUoSgYMLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mhtDuusA; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mhtDuusA"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8A4AD4E42097;
	Mon, 12 Jan 2026 14:21:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 59FD7606FA;
	Mon, 12 Jan 2026 14:21:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 453CC103C9261;
	Mon, 12 Jan 2026 15:21:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227693; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=a+hqBPUtvnDIK2sOflevWRsdtyg1p/9U7gaK7ZbRQyU=;
	b=mhtDuusA6uhtrgfpTuU99EYRDEUbACmozZsv88r+Dfz7jMKqhkLm4X+CkqEgHkRwViArGO
	RHRT0Lvknt+z8Y/JEaxYpMCe3lndK/saI30gAt+sopK+JDZh/AWhggNDSTI2m5BQ57YFMa
	emNUi2U8RA6V9o0WKc/x9HjxVBm6yMngyZKy6VeW6bRGotEzcHK2REVUo3/25DeJi1B6Nk
	jBlVYjALlEII5Xqz1OgmoC6Ww91BtIa98edVZHLNgoE+jMX5k+IeAsnyQJNH11RXfFM65c
	TELnx/0q/X+Pe6Bb3+Q0S9/zINbJeCBle/r6RIFTw9VvUUi0rxQhXbVjbhUzFw==
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
Subject: [RFC PATCH 48/77] dtc: Introduce orphan nodes
Date: Mon, 12 Jan 2026 15:19:38 +0100
Message-ID: <20260112142009.1006236-49-herve.codina@bootlin.com>
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

Orphans nodes can be present in plugin and addon device-trees.

Those nodes are nodes without a parent. The root device-tree node is a
particular orphan node and is not part of those 'orphan' nodes group.

The orphan nodes group is related to nodes identified by a reference in
addons or plugins device-trees. For instance, the following node can be
described in addons and plugins (overlay) device-trees:
   --- 8< ---
   &foo {
	subnode {
		prop  = <1>;
	};
   };
   --- 8< ---

The foo referenced node described here has no parent. Indeed, it is not
a child of the root node.

This kind of node is legit in plugins and addons device-tree in order to
perform modification on existing node when the plugin or addon dtb is
applied. The foo referenced node is an existing node in the base tree an
the subnode node is added to the foo referenced node chen the dtb is
applied. Even if foo itself doesn't exists in the plugin or addon
device-tree, it needs to be referenced and modifications expected need
to be described (new sub-node for instance).

In plugin dts, when a orphan node is parsed, the dts structure is
changed and the orphan node is merged in the /fragment@n/__overlay__
node. The foo referenced node mentioned in the previous snippet is
transformed to:
   --- 8< ---
   / {
	fragment@0 {
		target = <&foo>;

		__overlay__ {
			subnode {
				prop = <0x01>;
			};
		};
	};

	__fixups__ {
		foo = "/fragment@0:target:0";
	};
   };
   --- 8< ---

With this mechanism, the orphan node itself doesn't exist anymore in
resulting plugin dtb but the resulting device-tree contains meta-data
mixed with pure 'device-tree' data.

Addons have been introduced to avoid this kind of mixing.

For addons, instead of changing the device-tree structure to add
something similar to fragments and __overlay__ present in plugins, the
orphan node will be present as a new dtb block and will be identified as
orphan thanks to meta-data added in dtb.

Modification done in this commit doesn't add functional changes but just
introduce orphan nodes entry points in data structures and functions in
order to prepare future changes related to parsing/generating dts and
dtb files.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 dtc-parser.y | 4 ++--
 dtc.h        | 7 ++++++-
 flattree.c   | 3 ++-
 fstree.c     | 3 ++-
 livetree.c   | 4 +++-
 5 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index 08b3642..626a232 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -132,7 +132,7 @@ sourcefile:
 		{
 			parser_output = build_dt_info($1, $2, $3,
 			                              guess_boot_cpuid($3),
-						      NULL);
+						      NULL, NULL);
 		}
 	|  headers memreserves importlist devicetree
 		{
@@ -143,7 +143,7 @@ sourcefile:
 			 */
 			parser_output = build_dt_info($1, $2, $4,
 			                              $4 ? guess_boot_cpuid($4) : 0,
-			                              reverse_symbol($3));
+			                              reverse_symbol($3), NULL);
 		}
 	;
 
diff --git a/dtc.h b/dtc.h
index d45a84c..399beee 100644
--- a/dtc.h
+++ b/dtc.h
@@ -277,6 +277,9 @@ struct node {
 #define for_each_symbol(s0, s) \
 	for ((s) = (s0); (s); (s) = (s)->next)
 
+#define for_each_orphan(o0, o) \
+	for ((o) = (o0); (o); (o) = (o)->next_sibling)
+
 void add_label(struct label **labels, char *label);
 void delete_labels(struct label **labels);
 
@@ -345,6 +348,7 @@ struct dt_info {
 	uint32_t boot_cpuid_phys;
 	struct node *dt;		/* the device tree */
 	struct symbol *importsymlist;	/* Import symbol list */
+	struct node *orphanlist;	/* orphan nodes list */
 	const char *outname;		/* filename being written to, "-" for stdout */
 };
 
@@ -367,7 +371,8 @@ struct marker *dti_get_marker_label(struct dt_info *dti, const char *label,
 struct dt_info *build_dt_info(unsigned int dtsflags,
 			      struct reserve_info *reservelist,
 			      struct node *tree, uint32_t boot_cpuid_phys,
-			      struct symbol *importsymlist);
+			      struct symbol *importsymlist,
+			      struct node *orphanlist);
 void sort_tree(struct dt_info *dti);
 void generate_label_tree(struct dt_info *dti, const char *name, bool allocph);
 void generate_fixups_tree(struct dt_info *dti, const char *name);
diff --git a/flattree.c b/flattree.c
index add02f0..412c7f8 100644
--- a/flattree.c
+++ b/flattree.c
@@ -1171,5 +1171,6 @@ struct dt_info *dt_from_blob(const char *fname)
 
 	fclose(f);
 
-	return build_dt_info(DTSF_V1 | dtsflags, reservelist, tree, boot_cpuid_phys, importsymlist);
+	return build_dt_info(DTSF_V1 | dtsflags, reservelist, tree, boot_cpuid_phys,
+			     importsymlist, NULL);
 }
diff --git a/fstree.c b/fstree.c
index a6aaf1e..2be1ffa 100644
--- a/fstree.c
+++ b/fstree.c
@@ -72,5 +72,6 @@ struct dt_info *dt_from_fs(const char *dirname)
 	tree = read_fstree(dirname);
 	tree = name_node(tree, "");
 
-	return build_dt_info(DTSF_V1, NULL, tree, guess_boot_cpuid(tree), NULL);
+	return build_dt_info(DTSF_V1, NULL, tree, guess_boot_cpuid(tree), NULL,
+			     NULL);
 }
diff --git a/livetree.c b/livetree.c
index 79f7b55..057997a 100644
--- a/livetree.c
+++ b/livetree.c
@@ -545,7 +545,8 @@ struct reserve_info *add_reserve_entry(struct reserve_info *list,
 struct dt_info *build_dt_info(unsigned int dtsflags,
 			      struct reserve_info *reservelist,
 			      struct node *tree, uint32_t boot_cpuid_phys,
-			      struct symbol *importsymlist)
+			      struct symbol *importsymlist,
+			      struct node *orphanlist)
 {
 	struct dt_info *dti;
 
@@ -555,6 +556,7 @@ struct dt_info *build_dt_info(unsigned int dtsflags,
 	dti->dt = tree;
 	dti->boot_cpuid_phys = boot_cpuid_phys;
 	dti->importsymlist = importsymlist;
+	dti->orphanlist = orphanlist;
 
 	return dti;
 }
-- 
2.52.0

