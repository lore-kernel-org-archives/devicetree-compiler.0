Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793036157;
	b=dynfU+Xeqvvvp5XnS7VtUoWGcK98ujA8wsWNavaKf6odaRr4nQwSemgjHb72j9p0/Dd9
	 wwI2WcDeT0lRSKNmK29oAfwNZ8r2YTh8HxxA2HgoQFPuj3B1E10aRivHOuFyU25kEPMXJ
	 ACiSfC7gRGnqbIKVFa7YhiyAq7d18+pUQu7bWVAypcZz2fWE8J7bbwzwkyu2d2hQhwmeb
	 TrrABRhl0K5SswsxaPFy8/Q/VEusdi0F5IiGTHVPgVOITkTSh9+0KuUfIVC4AOqYL5cRp
	 XJWy0g+v7idOsfvrRiYlGUW1zNUYiyvF3napHykMlZl7/9wzH6IsGG2dDXUTb0qIBBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793036157;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=N/z5vVsr3e/1hA/ECUv0nmIPeGLsIJhvDnxny8I8GbU=;
	b=fTotLOVv6QA169SmCmLFpz+x9eKKIncMN+3QAXSpipAkLSVFcheQtu0ligu8nt99Jsdx
	 V9jd/kULTnS4GEX0CqOx2Gg32pt36pU08ZJ87q6FkI5D/O/UPPELXVeEbW0uq9Iq1Yh6Q
	 H7T1gaUZ60LxvnkQihqy4PiBhLhiJKRQh50Xtf8njvitCJbdexVUVCYn+9Hx5es082+m9
	 PZJCb5jmP+Ooh2xSZs/xPUoAgUQit+vcfPJBR4D7ZnxCEsihhLqdRdsftd5zSCyOr2jGv
	 6gfgHdxH6rG3vGb8pv+6Hd1h/WQEx2pKiaBu21sM6jmI0DTwqY9u54/UOwA1KxdIr7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=LiDEX0+b;
	arc=none smtp.remote-ip=209.85.160.45
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290A0606A31A
	for <devicetree-compiler@vger.kernel.org>; Mon, 26 Oct 2026 17:35:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 290A0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=LiDEX0+b
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-483d290f398so1914027fac.2
        for <devicetree-compiler@vger.kernel.org>; Mon, 26 Oct 2026 10:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793036156; x=1793640956; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N/z5vVsr3e/1hA/ECUv0nmIPeGLsIJhvDnxny8I8GbU=;
        b=LiDEX0+bb8gzgtuT6BQjvPtaTDXzVs3fiQfbJKWcqEzYfZ/FtBJI84hkM9nVdeBgcP
         7SOZ0Nqa2PG7eBrP7eXy+Sx/v7BuuGpa3iaiOF9N0mxeofoq/suPBUKagAcrvfzPpWLm
         6KQanSM15dlRfnsmlrHJP+sw0J5aVekvpM0Xo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793036156; x=1793640956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N/z5vVsr3e/1hA/ECUv0nmIPeGLsIJhvDnxny8I8GbU=;
        b=TON3FeGSt/GfHucvu5JHzu58aWKM3s0OqqghjovJ2sKw6/OrMzidC/yuyEon8NzTIO
         EF1pLFHK2QeVYm7UtyYPzi3XW+8QWTNrlTr3GdbNXMx6hxeLh8QoWfEfkWAcQNNIkuCg
         u93ZVqmACeGrDtHPkOUj53SdSsyqr0XsRPn1JSvqIxZmEbYtA4zlJVKDII+qsk9IUO4M
         LfO5rR4s6tbetChqq20oxywUUlPhP6k+XMzqbVQXf1A6L9o/vcMlfzl3nm8kixnrBmUo
         xcpRABl8QIavoiRo22QnutZ85MSqpNCqTDjtY+IWaQHC1yVXMpVcKFZ5aXi+AK4qxTB1
         7XxQ==
X-Gm-Message-State: AFq9FYI+/sIe0NDATgRWtreQzaAaM8ntv43I3B/3lpf1ljxK+n9qdLB/
	ig+NFW2Qoeq0OW9ebZ2Ehz78qrRQ36+sYub2ajq/642U/mz2zOU3PQvXDEHx/7UJGwhAhblAlRZ
	Mct7vGw==
X-Gm-Gg: AYBFou2o8yOeRNJVmv95Iz55iGxQDQ+Q1AKZv+f2Yl5ATk3uAyv5PfhKighqxoDpaOP
	ymjUfGVmvF/35fZuMF3neuPImOwPWShynVZt6dfarbGVtU0pd74U22aeTNDdqp3JF6eVak9cLZr
	uYNWE+Qt2/vwlqmJNbfI4GjgHIs3FHaA2o33XmuBRQoU07nODILBqdUycmfFWZ1FaVc7FezkcTc
	nyo7gCWVmDxPDV7d13DumbrVJ/NdxntNzH5C11S0vAqRyiOzsX9D3WK/nssmPZcGbYl4PntuNKT
	pDRauKfw0sKKmEVjgTECJbrXghSb9sbg4Xr8JeeQ7WWZyPlAODlv36FgJTI+FZeL0ptkWsKGrHq
	vDbienVY0Jv8hHYQaKM1lqfMW+ikfWLI3yeKDvZvH0HdHrGyLUp4CAc4uOrTRZIE/XPfTYmH2B/
	DEdxHJjRIY0IEuIRj1Zplf4k8E5FJVSAsvdYF/HVUG6r2yCbdASm6CAqghSWsYH/jAjBziQtfsk
	/rdr3NezJR5waEak1Ozkhy72ycreX9P+Gc9WAihxXOnBPhw0UVtZ1G7Srr7N88y0UuuGxa6dsWU
	EN87Gx6h2H55
X-Received: by 2002:a05:6870:e08c:b0:488:5278:e2f5 with SMTP id 586e51a60fabf-4a83f581d64mr4603345fac.30.1793036155820;
        Mon, 26 Oct 2026 10:35:55 -0700 (PDT)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a843231095sm4773675fac.17.2026.10.26.10.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 10:35:53 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH 2/2] dtc: Remove a deleted node or property from the tree
Date: Mon, 26 Oct 2026 11:35:20 -0600
Message-ID: <20261026173529.3080952-3-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026173529.3080952-1-sjg@chromium.org>
References: <20261026173529.3080952-1-sjg@chromium.org>
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Deleting a node or property only flags it as deleted, leaving it in
place. If a later section adds it again, merge_nodes() finds the flagged
entry and revives it where it was, along with its subnodes, which come
back in their old order before any new ones. So deleting a node in
order to redefine it does not give the order which the source shows.

Unlink a node or property from its parent when deleting it, so that
adding it again creates a new entry after the existing ones. Nothing
deleted then stays in the tree while parsing, so merge_nodes() has
nothing to revive and can skip deleted entries like everything else.

Leave the node's next_sibling alone, since fixup_omit_unused_nodes()
deletes nodes while walking over their siblings.

Note that this changes the output of existing dts files. When a dts
deletes a node or property and then defines it again, the new definition
now comes after its siblings instead of taking the old one's place, and
its subnodes come in the order of the new definition alone.

This is the better behaviour because:

- Deleting is how a dts says to start again. A dts which wants to keep a
  node's place can override the node without deleting it, since merging
  already updates a node in place
- Node order can matter. In issue 174, U-Boot's binman builds an image
  from a node which is deleted and defined again, yet the image comes
  out in the old order. The only workaround is to define the nodes in
  the wanted order before including the file which defines them
- It matches the previous patch, in which a node deleted and defined
  again within a section, or deleted in the first section and defined
  by a later one, already comes out where the new definition is

Closes: https://github.com/dgibson/dtc/issues/174
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---

 livetree.c                       | 43 ++++++++++++++++++------
 tests/delete_readd_order.dts     | 57 ++++++++++++++++++++++++++++++++
 tests/delete_readd_order_ref.dts | 28 ++++++++++++++++
 tests/run_tests.sh               |  6 ++++
 4 files changed, 123 insertions(+), 11 deletions(-)
 create mode 100644 tests/delete_readd_order.dts
 create mode 100644 tests/delete_readd_order_ref.dts

diff --git a/livetree.c b/livetree.c
index b474a05..6609e4e 100644
--- a/livetree.c
+++ b/livetree.c
@@ -208,8 +208,6 @@ struct node *merge_nodes(struct node *old_node, struct node *new_node)
 	struct node *new_child, *old_child;
 	struct label *l;
 
-	old_node->deleted = 0;
-
 	/* Add new node labels to old node */
 	for_each_label_withdel(new_node->labels, l)
 		add_label(&old_node->labels, l->label);
@@ -229,14 +227,13 @@ struct node *merge_nodes(struct node *old_node, struct node *new_node)
 		}
 
 		/* Look for a collision, set new value if there is */
-		for_each_property_withdel(old_node, old_prop) {
+		for_each_property(old_node, old_prop) {
 			if (streq(old_prop->name, new_prop->name)) {
 				/* Add new labels to old property */
 				for_each_label_withdel(new_prop->labels, l)
 					add_label(&old_prop->labels, l->label);
 
 				old_prop->val = new_prop->val;
-				old_prop->deleted = 0;
 				srcpos_free(old_prop->srcpos);
 				old_prop->srcpos = new_prop->srcpos;
 				free(new_prop);
@@ -266,7 +263,7 @@ struct node *merge_nodes(struct node *old_node, struct node *new_node)
 		}
 
 		/* Search for a collision.  Merge if there is */
-		for_each_child_withdel(old_node, old_child) {
+		for_each_child(old_node, old_child) {
 			if (streq(old_child->name, new_child->name)) {
 				merge_nodes(old_child, new_child);
 				new_child = NULL;
@@ -346,14 +343,18 @@ void add_property(struct node *node, struct property *prop)
 
 void delete_property_by_name(struct node *node, char *name)
 {
-	struct property *prop = node->proplist;
+	struct property **pp = &node->proplist;
+
+	while (*pp) {
+		if (streq((*pp)->name, name)) {
+			struct property *prop = *pp;
 
-	while (prop) {
-		if (streq(prop->name, name)) {
+			/* Unlink it, so that adding it again starts afresh */
+			*pp = prop->next;
 			delete_property(prop);
 			return;
 		}
-		prop = prop->next;
+		pp = &(*pp)->next;
 	}
 }
 
@@ -390,19 +391,39 @@ void delete_node_by_name(struct node *parent, char *name)
 	}
 }
 
-void delete_node(struct node *node)
+static void delete_subtree(struct node *node)
 {
 	struct property *prop;
 	struct node *child;
 
 	node->deleted = 1;
 	for_each_child(node, child)
-		delete_node(child);
+		delete_subtree(child);
 	for_each_property(node, prop)
 		delete_property(prop);
 	delete_labels(&node->labels);
 }
 
+void delete_node(struct node *node)
+{
+	struct node **np;
+
+	/*
+	 * Unlink the node, so that adding it again starts afresh. Leave its
+	 * next_sibling alone, since a walk over its siblings may be at it
+	 */
+	if (node->parent) {
+		for (np = &node->parent->children; *np;
+		     np = &(*np)->next_sibling) {
+			if (*np == node) {
+				*np = node->next_sibling;
+				break;
+			}
+		}
+	}
+	delete_subtree(node);
+}
+
 void append_to_property(struct node *node,
 			char *name, const void *data, int len,
 			enum markertype type)
diff --git a/tests/delete_readd_order.dts b/tests/delete_readd_order.dts
new file mode 100644
index 0000000..91a5fa7
--- /dev/null
+++ b/tests/delete_readd_order.dts
@@ -0,0 +1,57 @@
+/dts-v1/;
+
+/*
+ * Delete properties and nodes in a later section and add them again. They
+ * come back as new entries after the existing ones, rather than returning
+ * to their old places along with their old subnodes
+ */
+
+/ {
+	first-prop;
+	moved-prop;
+	last-prop;
+
+	parent {
+		images {
+			old-image {
+			};
+			kept-image {
+				old;
+			};
+		};
+
+		other {
+		};
+	};
+
+	gone: gone-node {
+		old;
+	};
+
+	last-node {
+	};
+};
+
+/ {
+	/delete-property/ moved-prop;
+	moved-prop;
+
+	parent {
+		/delete-node/ images;
+		images {
+			new-image {
+			};
+			kept-image {
+				new;
+			};
+		};
+	};
+};
+
+/delete-node/ &gone;
+
+/ {
+	gone-node {
+		new;
+	};
+};
diff --git a/tests/delete_readd_order_ref.dts b/tests/delete_readd_order_ref.dts
new file mode 100644
index 0000000..7c86d0f
--- /dev/null
+++ b/tests/delete_readd_order_ref.dts
@@ -0,0 +1,28 @@
+/dts-v1/;
+
+/ {
+	first-prop;
+	last-prop;
+	moved-prop;
+
+	parent {
+		other {
+		};
+
+		images {
+			new-image {
+			};
+
+			kept-image {
+				new;
+			};
+		};
+	};
+
+	last-node {
+	};
+
+	gone-node {
+		new;
+	};
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 2650df6..8813846 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -746,6 +746,12 @@ dtc_tests () {
     run_sh_test "$SRCDIR/dtc-checkfails.sh" phandle_references \
 	-n duplicate_node_names -- -I dts -O dtb "$SRCDIR/delete_in_section_badref.dts"
 
+    run_dtc_test -I dts -O dtb -o delete_readd_order.test.dtb \
+	"$SRCDIR/delete_readd_order.dts"
+    run_dtc_test -I dts -O dtb -o delete_readd_order_ref.test.dtb \
+	"$SRCDIR/delete_readd_order_ref.dts"
+    run_test dtbs_equal_ordered delete_readd_order.test.dtb delete_readd_order_ref.test.dtb
+
     # Check some checks
     check_tests "$SRCDIR/dup-nodename.dts" duplicate_node_names
     check_tests "$SRCDIR/dup-propname.dts" duplicate_property_names
-- 
2.43.0

