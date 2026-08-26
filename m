Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897453F6C28;
	Wed, 26 Aug 2026 09:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787737961; cv=none; b=PMt6ydYE/7/3Wnln/dq7ikJB72iCrJktu3ez9+Owqw9H6ZLb2Y0cStZQLD+pKvhZ29KSt+wStjIi6jbTL7/71FfgAWdeWnTI+xEoqvdFjAN05EIJo0MEG6/ODr3VackfMu7XtbExPQusA+IYSmVmG9mS8CQvYOvrChv2Fu7O8Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787737961; c=relaxed/simple;
	bh=CjrXTnH5Dnubdmnsg4ic1eB7NrVmntk5aPffvvFre3s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mMgDRn3ekq8NewYK2S1KoYY10Jt15OLfIptRQSF2Ye3RVexM8BjVsdQJvYVfNnpcWXKct3Zmm246DQKG/Zs8tv9cAt403U3fOsITSUeKgY68l0995LzeOn7qlfalcoCBTzxsEQ6TC6bEuF0F5dvLAh0slJh8cy/CJ4hT2p+/w0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CH6sn+7Q; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CH6sn+7Q"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 205634E413BC;
	Wed, 26 Aug 2026 09:52:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E0EDB604EC;
	Wed, 26 Aug 2026 09:52:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5083611C7AD5F;
	Wed, 26 Aug 2026 11:52:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787737952; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Vka/pgsTUYstdtcG9XIFnDMWJYhJRc0xtZUeqcnrmi8=;
	b=CH6sn+7QfgmDxnG/QWzz6/bnWTvs7wceDlMWJ2s3aGELNCgHNGuezpRu6exKTIHJOW10R5
	3z7AfSseK6VwgJB1+IbuqKMWAYWRqo3yibTVPru5ge9alpazMtmZuPV2oehatD6o4ZSwNy
	BV4ebxWP/oujsGVuwAT3eXe9oILVdjvGyULeztNKgydwTxSkrQUfoa/TqmDxxycpyTaC9V
	RjCnc+Xh22Sg4qJMjS0nSor67cKPRG8rfIg4IRZSW7Haxu0wUNjqdROYPT4i/cPvbWInEu
	Oba+57q+WnXFsaE4+vtc56v3tM8moDwW83XquPSlfgoyW9xDmsSh5xHrhGBeXw==
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
Subject: [RFC PATCH v2 39/74] dtc: Change get_node_by_ref() signature to take dt_info
Date: Wed, 26 Aug 2026 11:49:08 +0200
Message-ID: <20260826094950.1088288-40-herve.codina@bootlin.com>
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

The future introduction of orphan nodes for addons device-tree will lead
to more than one tree in the addons data. Those trees will be:
  - the classical root tree starting at the root node
  - trees related to orphan nodes

Also, an addon device-tree can have only trees based on orphan nodes. In
other words an addon device-tree is valid without having the classical
'root' tree.

To prepare orphan nodes introduction, move get_node_by_ref() parameter
one level up and use dt_info struct instead of the 'root' tree (i.e.
dti->dt).

This change doesn't lead to any functional changes.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 checks.c     | 10 ++++------
 dtc-parser.y | 22 +++++++++++++++++-----
 dtc.h        |  2 +-
 livetree.c   | 25 +++++++++++++++++++------
 4 files changed, 41 insertions(+), 18 deletions(-)

diff --git a/checks.c b/checks.c
index 6b25c204..b22b616c 100644
--- a/checks.c
+++ b/checks.c
@@ -494,7 +494,6 @@ ERROR(duplicate_label, check_duplicate_label_node, NULL);
 static cell_t check_phandle_prop(struct check *c, struct dt_info *dti,
 				 struct node *node, const char *propname)
 {
-	struct node *root = dti->dt;
 	struct property *prop;
 	struct marker *m;
 	cell_t phandle;
@@ -512,7 +511,7 @@ static cell_t check_phandle_prop(struct check *c, struct dt_info *dti,
 	m = prop->val.markers;
 	for_each_marker_of_type(m, REF_PHANDLE) {
 		assert(m->offset == 0);
-		if (node != get_node_by_ref(root, m->ref))
+		if (node != get_node_by_ref(dti, m->ref))
 			/* "Set this node's phandle equal to some
 			 * other node's phandle".  That's nonsensical
 			 * by construction. */ {
@@ -622,7 +621,7 @@ static void fixup_phandle_references(struct check *c, struct dt_info *dti,
 		for_each_marker_of_type(m, REF_PHANDLE) {
 			assert(m->offset + sizeof(cell_t) <= prop->val.len);
 
-			refnode = get_node_by_ref(dt, m->ref);
+			refnode = get_node_by_ref(dti, m->ref);
 			if (! refnode) {
 				if (!(dti->dtsflags & (DTSF_PLUGIN | DTSF_ADDON)))
 					FAIL(c, dti, node, "Reference to non-existent node or "
@@ -641,7 +640,7 @@ static void fixup_phandle_references(struct check *c, struct dt_info *dti,
 	}
 
 	for_each_symbol(node->exportsymlist, exportsym) {
-		refnode = get_node_by_ref(dt, exportsym->ref);
+		refnode = get_node_by_ref(dti, exportsym->ref);
 		if (!refnode) {
 			if (!(dti->dtsflags & (DTSF_PLUGIN | DTSF_ADDON))) {
 				FAIL(c, dti, node,
@@ -665,7 +664,6 @@ ERROR(phandle_references, fixup_phandle_references, NULL,
 static void fixup_path_references(struct check *c, struct dt_info *dti,
 				  struct node *node)
 {
-	struct node *dt = dti->dt;
 	struct property *prop;
 
 	for_each_property(node, prop) {
@@ -676,7 +674,7 @@ static void fixup_path_references(struct check *c, struct dt_info *dti,
 		for_each_marker_of_type(m, REF_PATH) {
 			assert(m->offset <= prop->val.len);
 
-			refnode = get_node_by_ref(dt, m->ref);
+			refnode = get_node_by_ref(dti, m->ref);
 			if (!refnode) {
 				FAIL(c, dti, node, "Reference to non-existent node or label \"%s\"\n",
 				     m->ref);
diff --git a/dtc-parser.y b/dtc-parser.y
index 61ebde2d..dd346fb4 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -31,6 +31,18 @@ static bool is_ref_relative(const char *ref)
 	return ref[0] != '/' && strchr(&ref[1], '/');
 }
 
+static struct node *parser_get_node_by_ref(struct node *dt, const char *ref)
+{
+	/*
+	 * Use a temporary dt_info in order to use dti_get_node_by_ref()
+	 */
+	struct dt_info dti = {};
+
+	dti.dt = dt;
+
+	return get_node_by_ref(&dti, ref);
+}
+
 %}
 
 %union {
@@ -240,7 +252,7 @@ devicetree:
 		}
 	| devicetree DT_LABEL dt_ref nodedef
 		{
-			struct node *target = get_node_by_ref($1, $3);
+			struct node *target = parser_get_node_by_ref($1, $3);
 
 			if ((last_header_flags & DTSF_PLUGIN) && is_ref_relative($3))
 				ERROR(&@2, "Label-relative reference %s not supported in plugin", $3);
@@ -259,7 +271,7 @@ devicetree:
 					ERROR(&@2, "Label-relative reference %s not supported in plugin", $2);
 				add_orphan_node($1, $3, $2);
 			} else {
-				struct node *target = get_node_by_ref($1, $2);
+				struct node *target = parser_get_node_by_ref($1, $2);
 
 				if (target)
 					merge_nodes(target, $3);
@@ -270,7 +282,7 @@ devicetree:
 		}
 	| devicetree DT_LABEL_REF nodedef
 		{
-			struct node *target = get_node_by_ref($1, $2);
+			struct node *target = parser_get_node_by_ref($1, $2);
 
 			if (target) {
 				merge_nodes(target, $3);
@@ -284,7 +296,7 @@ devicetree:
 		}
 	| devicetree DT_DEL_NODE dt_ref ';'
 		{
-			struct node *target = get_node_by_ref($1, $3);
+			struct node *target = parser_get_node_by_ref($1, $3);
 
 			if (target)
 				delete_node(target);
@@ -296,7 +308,7 @@ devicetree:
 		}
 	| devicetree DT_OMIT_NO_REF dt_ref ';'
 		{
-			struct node *target = get_node_by_ref($1, $3);
+			struct node *target = parser_get_node_by_ref($1, $3);
 
 			if (target)
 				omit_node_if_unused(target);
diff --git a/dtc.h b/dtc.h
index 27f49bc6..d76ba6b7 100644
--- a/dtc.h
+++ b/dtc.h
@@ -323,7 +323,6 @@ struct property *get_property_by_label(struct node *tree, const char *label,
 struct marker *get_marker_label(struct node *tree, const char *label,
 				struct node **node, struct property **prop);
 struct node *get_subnode(struct node *node, const char *nodename);
-struct node *get_node_by_ref(struct node *tree, const char *ref);
 cell_t get_node_phandle(struct node *root, struct node *node);
 
 uint32_t guess_boot_cpuid(struct node *tree);
@@ -357,6 +356,7 @@ struct dt_info {
 struct node *get_node_by_path(struct dt_info *dti, const char *path);
 struct node *get_node_by_label(struct dt_info *dti, const char *label);
 struct node *get_node_by_phandle(struct dt_info *dti, cell_t phandle);
+struct node *get_node_by_ref(struct dt_info *dti, const char *ref);
 
 /* DTS version flags definitions */
 #define DTSF_V1		0x0001	/* /dts-v1/ */
diff --git a/livetree.c b/livetree.c
index 5bd65b1b..40ca873a 100644
--- a/livetree.c
+++ b/livetree.c
@@ -575,7 +575,7 @@ static void complete_ref_and_is_local(struct dt_info *dti, char **ref,
 	 */
 
 	if (*ref) {
-		refnode = get_node_by_ref(dti->dt, *ref);
+		refnode = get_node_by_ref(dti, *ref);
 		if (refnode)
 			*is_local = true;
 		else
@@ -860,7 +860,7 @@ static struct node *get_node_by_phandle_(struct node *tree, cell_t phandle)
 	return NULL;
 }
 
-struct node *get_node_by_ref(struct node *tree, const char *ref)
+static struct node *get_node_by_ref_(struct node *tree, const char *ref)
 {
 	struct node *target = tree;
 	const char *label = NULL, *path = NULL;
@@ -931,6 +931,19 @@ struct node *get_node_by_phandle(struct dt_info *dti, cell_t phandle)
 	return NULL;
 }
 
+struct node *get_node_by_ref(struct dt_info *dti, const char *ref)
+{
+	struct node *node;
+
+	if (dti->dt) {
+		node = get_node_by_ref_(dti->dt, ref);
+		if (node)
+			return node;
+	}
+
+	return NULL;
+}
+
 static void add_phandle_property(struct node *node,
 				 const char *name, int format)
 {
@@ -1283,7 +1296,7 @@ static bool any_fixup_tree(struct dt_info *dti, struct node *node)
 	for_each_property(node, prop) {
 		m = prop->val.markers;
 		for_each_marker_of_type(m, REF_PHANDLE) {
-			if (!get_node_by_ref(dti->dt, m->ref))
+			if (!get_node_by_ref_(dti->dt, m->ref))
 				return true;
 		}
 	}
@@ -1339,7 +1352,7 @@ static int generate_fixups_tree_internal(struct dt_info *dti,
 	for_each_property(node, prop) {
 		m = prop->val.markers;
 		for_each_marker_of_type(m, REF_PHANDLE) {
-			refnode = get_node_by_ref(dt, m->ref);
+			refnode = get_node_by_ref_(dt, m->ref);
 			if (!refnode)
 				if (add_fixup_entry(dti, fn, node, prop, m))
 					ret = -1;
@@ -1362,7 +1375,7 @@ static bool any_local_fixup_tree(struct dt_info *dti, struct node *node)
 	for_each_property(node, prop) {
 		m = prop->val.markers;
 		for_each_marker_of_type(m, REF_PHANDLE) {
-			if (get_node_by_ref(dti->dt, m->ref))
+			if (get_node_by_ref_(dti->dt, m->ref))
 				return true;
 		}
 	}
@@ -1423,7 +1436,7 @@ static int generate_local_fixups_tree_internal(struct dt_info *dti,
 	for_each_property(node, prop) {
 		m = prop->val.markers;
 		for_each_marker_of_type(m, REF_PHANDLE) {
-			refnode = get_node_by_ref(dt, m->ref);
+			refnode = get_node_by_ref_(dt, m->ref);
 			if (refnode)
 				if (add_local_fixup_entry(dti, lfn, node, prop, m, refnode))
 					ret = -1;
-- 
2.55.0

