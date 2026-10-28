Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180193;
	b=1PAr1LPmYhujPKVZQ28gBGNsGFeiefeCZAXagwtPpGVvfMJ8HO8XNvmfkTGcC2xKKQ6y
	 zy53fikdOa1NIf8zTCNYz5GFOZFVg4a3L6OpYBhqSc6BCxDohPkiaJ3GzBeHEZtUWif0G
	 aTxkGqJIBo0XNHu3+Hj3+FXyDHA/Hw/6H/7I1U4o/G2zjAtSYGcEx3fwD6+8/4tC1Ukty
	 WREXhFLVn0x8bA96Hxocknw2SJiTSt20WZvFT06MjpfYQHY0cgXvWO+6iJ2hQ++bLNSiX
	 FNkE4y0fSxYziRj5fhR0BfilGe82brD49SuHvXdEYh612E64hQz+H9Jg6WUiAauqe+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180193;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=T5pvJgAtbQiJD9CdhW+YhRRCVbOw4qevR3NbtDk9Q7w=;
	b=mg9j4rlpJlG2Ub+3IWggkr6bdf8IyyOjLGOnAhxozSsBvlDfKz7jnBUDnuSLBFrkyq0N
	 sVP2EVrLiRyLPqYt5TSAv5vLUocFoRnxBaOBAUNUGjhO7UpgMdPFzR8HU50HwmciEo4Mn
	 RQjUEUwhd6vu0hOyK4ApY+cnO1cCRrU4KfQy9ba98JeNNR6hJ4SSgE/xiIGrHXJjx1zof
	 R1cBAV5bMfL69A0FatnHsFk+Bxh8zPNWlVbD0ua3uOugNnMlYF1KaJ2tX75EoKkyT2KTN
	 Q2Gppo3jgpIolzKoYJZslByVxAyV8nBQ0f2klSOxng+nvIHFOToLP9qvljwB3xK1TEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=H0uu07kK;
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A01C606A31C
	for <devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 09:36:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A01C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=H0uu07kK
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-823e4047037so552356a34.2
        for <devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 02:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793180191; x=1793784991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T5pvJgAtbQiJD9CdhW+YhRRCVbOw4qevR3NbtDk9Q7w=;
        b=H0uu07kK2FRUZkDrSSf8PysGAh23/mXjT8f5SwQMktcL3wtFdGtOsS/yUFrrP3hN1M
         Xw7q5fasnWJSQ9i00etITtaQDza5dulfpnkh7zoShT2pld+9swmDYCHXVumylR0iaJYA
         S6kybhluQz1QS+PEs5EqQL/ANy7OjwtDxBrEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180191; x=1793784991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T5pvJgAtbQiJD9CdhW+YhRRCVbOw4qevR3NbtDk9Q7w=;
        b=UVD1eskVbcYoBbeVaU6YeKZFSGY4RnGQFPMJBLHoiJQ7meiREnACZ+FC5Kt+K/PwBZ
         6toYVN5NScNBYvGnV95IJ4LIcuX2i52bFkXq8bYPkn+nqr+XOQqbkVAmIAOY2H1vmFeC
         TSpa5TkKNzwNOa7EncTNc4Cm/GWWyy19sIQV2u7GQznPPiBIqAQo1hBb2zKu67hydpUr
         J21dL/PFtE2tPnMrMKvwW0btBAVdXwOmWBAYqx0uG54TVdgXNhNgmmrSOU6gPyZPEPgo
         dyH+WAm4dFph+RiP4BA6jveS59pgv0zLuV6Gibre2Yz587Th0Fk9XdL8f0t/pO8iW/wB
         c/qQ==
X-Gm-Message-State: AFq9FYLFPVekNHw6v/0FTlLpa3mYC0DEw3F+zLwZXydsXrjqoCpNwsr5
	o9QLcAYydIefYXF3d6VXhibLflFEHuHGQbegii+nDZ38VGn1upFtFPiKjga5V+w4UFoQKXi5oXY
	sV2WMHQ==
X-Gm-Gg: AYBFou3oAegu2aONTxmgupCxRgUduvYwf3z6F6q/H1YlWN/lStk1gnJD45kdBhQDkos
	znB6xmsDRECDQI1eXjqrDlvc8/n8J0kN7Ix/AT3775R+gmqX+RaIslRcu1ryVkXXf4wLN1UF5Nm
	MW/Xd1f7r9mJtCotNHCwP2/Oz+NuyElgcWK+rHbn+a4utSbfvRFRavjdDnp9CrDfM3KtI+eO2TO
	UiIKcjv4Ro2f7RGOsgojYw/1x9TJEcwseXIYHKPhEV/8AMJY/c2upB/r+SUwVImjXs3fDB87GE/
	IJG7dBTxzEAAwG4IPhYTKlEf1EueMinKU5azti/gyN4EF6GNcFKYpYYVSg3gsezmo85BcB2lfq1
	8jn/rXb9SQIZjsmFMpUQE7C2vasw0uxGoaaY9oFMmjdRmscE28H3lAybzNKoYLfWmF7f5MhTDFp
	RqZBoTH8Ak6nAH9kb/MkATIk5hTG1bASrs7/zcwsFE9pD+c+pPS0G8m8OWg4+k3Xch0HIwqVi7S
	Xumzx+07szMvqqni/fwlHjbWfTendG9Jx9PIF4O+YeKVZwNzfqnlSS5oUSrxM3QBGPsaB0qdEcI
	WnGkWS2g2ZLiGAQfbfgrCNXweskYLfGaCmwIsFhxlt2B6ZBzbU08f00BwYq06w==
X-Received: by 2002:a05:6830:2695:b0:80c:d34f:5f5e with SMTP id 46e09a7af769-85abd809ecemr1509970a34.23.1793180191104;
        Wed, 28 Oct 2026 02:36:31 -0700 (PDT)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85b205fe36bsm1099953a34.24.2026.10.28.02.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 02:36:30 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>,
	Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH v2 1/6] dtc: Apply deletes in the section which has them
Date: Wed, 28 Oct 2026 03:36:08 -0600
Message-ID: <20261028093620.3705074-2-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028093620.3705074-1-sjg@chromium.org>
References: <20261028093620.3705074-1-sjg@chromium.org>
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

The parser holds each /delete-property/ and /delete-node/ as a
placeholder entry, flagged as deleted, among the node's properties or
children. It only takes effect when merge_nodes() merges its section
into an earlier one. In the first section of a dts it is ignored, so
'a; /delete-property/ a;' leaves 'a' in the tree. The same happens in
any node which a later section adds, since merge_nodes() attaches a new
child as it is. An ignored /delete-node/ also leaves its placeholder in
the tree, which then shows up as '(null): Duplicate node name'

Apply each delete when its node is built, by dropping the earlier
entries of the same name from that node. Nothing can refer to the node
yet, so they can be unlinked rather than flagged as deleted. Keep the
placeholder, so that merging the node into an earlier definition still
deletes there too.

When a node joins the tree without being merged, as the first section,
as a new child in merge_nodes() or as an overlay fragment, drop its
placeholders, since there is nothing earlier for them to delete. This
keeps placeholders and entries deleted within a section out of the tree,
so that nothing which walks the tree has to skip them.

Duplicate entries within a section are still reported as errors, since
nothing is merged.

Closes: https://github.com/dgibson/dtc/issues/37
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Herve Codina <herve.codina@bootlin.com>
---

(no changes since v1)

 dtc-parser.y                            |   1 +
 dtc.h                                   |   1 +
 livetree.c                              |  69 ++++++++++++-
 tests/delete_in_section.dts             | 125 ++++++++++++++++++++++++
 tests/delete_in_section_badref.dts      |  11 +++
 tests/delete_in_section_labels.dts      |  28 ++++++
 tests/delete_in_section_labels_ref.dts  |   9 ++
 tests/delete_in_section_overlay.dts     |  21 ++++
 tests/delete_in_section_overlay_ref.dts |   9 ++
 tests/delete_in_section_ref.dts         |  44 +++++++++
 tests/run_tests.sh                      |  21 ++++
 11 files changed, 338 insertions(+), 1 deletion(-)
 create mode 100644 tests/delete_in_section.dts
 create mode 100644 tests/delete_in_section_badref.dts
 create mode 100644 tests/delete_in_section_labels.dts
 create mode 100644 tests/delete_in_section_labels_ref.dts
 create mode 100644 tests/delete_in_section_overlay.dts
 create mode 100644 tests/delete_in_section_overlay_ref.dts
 create mode 100644 tests/delete_in_section_ref.dts

diff --git a/dtc-parser.y b/dtc-parser.y
index e47f80d..0282f7b 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -160,6 +160,7 @@ dt_ref: DT_LABEL_REF | DT_PATH_REF;
 devicetree:
 	  '/' nodedef
 		{
+			drop_delete_placeholders($2);
 			$$ = name_node($2, "");
 		}
 	| devicetree '/' nodedef
diff --git a/dtc.h b/dtc.h
index 473552e..3e5109d 100644
--- a/dtc.h
+++ b/dtc.h
@@ -277,6 +277,7 @@ struct node *omit_node_if_unused(struct node *node);
 struct node *reference_node(struct node *node);
 struct node *chain_node(struct node *first, struct node *list);
 struct node *merge_nodes(struct node *old_node, struct node *new_node);
+void drop_delete_placeholders(struct node *node);
 struct node *add_orphan_node(struct node *old_node, struct node *new_node, char *ref);
 
 void add_property(struct node *node, struct property *prop);
diff --git a/livetree.c b/livetree.c
index abe73de..b474a05 100644
--- a/livetree.c
+++ b/livetree.c
@@ -85,6 +85,68 @@ struct property *reverse_properties(struct property *first)
 	return head;
 }
 
+/*
+ * The parser holds each /delete-property/ and /delete-node/ as a placeholder
+ * entry, flagged as deleted, among the node's properties or children. Apply
+ * each one by dropping the earlier entries of the same name in the node. The
+ * placeholders stay, so that merging the node into an earlier definition
+ * deletes there too
+ */
+static void apply_deletes(struct node *node)
+{
+	struct property *prop, **pp;
+	struct node *child, **np;
+
+	for (prop = node->proplist; prop; prop = prop->next) {
+		if (!prop->deleted)
+			continue;
+		for (pp = &node->proplist; *pp != prop;) {
+			if (streq((*pp)->name, prop->name))
+				*pp = (*pp)->next;
+			else
+				pp = &(*pp)->next;
+		}
+	}
+
+	for (child = node->children; child; child = child->next_sibling) {
+		if (!child->deleted)
+			continue;
+		for (np = &node->children; *np != child;) {
+			if (streq((*np)->name, child->name))
+				*np = (*np)->next_sibling;
+			else
+				np = &(*np)->next_sibling;
+		}
+	}
+}
+
+/*
+ * Drop the /delete-property/ and /delete-node/ placeholders from a subtree
+ * which joins the tree without being merged, since there is nothing earlier
+ * for them to delete
+ */
+void drop_delete_placeholders(struct node *node)
+{
+	struct property **pp = &node->proplist;
+	struct node **np = &node->children;
+
+	while (*pp) {
+		if ((*pp)->deleted)
+			*pp = (*pp)->next;
+		else
+			pp = &(*pp)->next;
+	}
+
+	while (*np) {
+		if ((*np)->deleted) {
+			*np = (*np)->next_sibling;
+		} else {
+			drop_delete_placeholders(*np);
+			np = &(*np)->next_sibling;
+		}
+	}
+}
+
 struct node *build_node(struct property *proplist, struct node *children,
 			struct srcpos *srcpos)
 {
@@ -100,6 +162,7 @@ struct node *build_node(struct property *proplist, struct node *children,
 	for_each_child(new, child) {
 		child->parent = new;
 	}
+	apply_deletes(new);
 
 	return new;
 }
@@ -212,8 +275,10 @@ struct node *merge_nodes(struct node *old_node, struct node *new_node)
 		}
 
 		/* if no collision occurred, add child to the old node. */
-		if (new_child)
+		if (new_child) {
+			drop_delete_placeholders(new_child);
 			add_child(old_node, new_child);
+		}
 	}
 
 	old_node->srcpos = srcpos_extend(old_node->srcpos, new_node->srcpos);
@@ -245,6 +310,8 @@ struct node * add_orphan_node(struct node *dt, struct node *new_node, char *ref)
 		p = build_property("target", d, NULL);
 	}
 
+	drop_delete_placeholders(new_node);
+
 	xasprintf(&name, "fragment@%u",
 			next_orphan_fragment++);
 	name_node(new_node, "__overlay__");
diff --git a/tests/delete_in_section.dts b/tests/delete_in_section.dts
new file mode 100644
index 0000000..e742e79
--- /dev/null
+++ b/tests/delete_in_section.dts
@@ -0,0 +1,125 @@
+/dts-v1/;
+
+/*
+ * Delete properties and nodes defined earlier in the same section. This is
+ * the first section, so nothing is merged into an earlier one
+ */
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	gone-prop;
+	/delete-property/ gone-prop;
+	kept-prop;
+	again-prop = "old";
+	/delete-property/ again-prop;
+	again-prop = "new";
+	both-prop;
+
+	/* Deleted and added again here, then changed by a later section */
+	redel-prop = "old";
+	/delete-property/ redel-prop;
+	redel-prop = "new";
+	reset-prop = "old";
+	/delete-property/ reset-prop;
+	reset-prop = "new";
+
+	gone-node {
+	};
+	/delete-node/ gone-node;
+
+	again-node {
+		old;
+	};
+	/delete-node/ again-node;
+	again-node {
+		new;
+	};
+
+	lbl: node {
+		inner-prop;
+		/delete-property/ inner-prop;
+
+		inner-node {
+		};
+		/delete-node/ inner-node;
+	};
+
+	redel-node {
+		old;
+	};
+	/delete-node/ redel-node;
+	redel-node {
+		new;
+	};
+
+	remerge-node {
+		old;
+	};
+	/delete-node/ remerge-node;
+	remerge-node {
+		new;
+	};
+
+	/* Checks must not see what is deleted here */
+	named-node {
+		name = "other";
+		/delete-property/ name;
+	};
+
+	bus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		child@1 {
+			reg = <1>;
+		};
+		/delete-node/ child@1;
+	};
+
+	/* Deleted here, then added again by a later section */
+	readd@1 {
+		reg = <1>;
+		old;
+	};
+	/delete-node/ readd@1;
+	/delete-node/ placeholder@2;
+};
+
+/* Delete within nodes which a later section adds, and within the merge */
+
+/ {
+	both-prop = "new";
+	/delete-property/ both-prop;
+	/delete-property/ redel-prop;
+	reset-prop = "later";
+
+	new-node {
+		new-prop;
+		/delete-property/ new-prop;
+		kept;
+	};
+
+	/delete-node/ redel-node;
+
+	remerge-node {
+		later;
+	};
+
+	readd@1 {
+		reg = <1>;
+		later;
+	};
+
+	placeholder@2 {
+		reg = <2>;
+	};
+};
+
+&lbl {
+	child {
+		child-prop;
+		/delete-property/ child-prop;
+	};
+};
diff --git a/tests/delete_in_section_badref.dts b/tests/delete_in_section_badref.dts
new file mode 100644
index 0000000..79a40e4
--- /dev/null
+++ b/tests/delete_in_section_badref.dts
@@ -0,0 +1,11 @@
+/dts-v1/;
+
+/* A reference to a node deleted in the same section has nothing to refer to */
+
+/ {
+	ref = <&gone>;
+
+	gone: node {
+	};
+	/delete-node/ node;
+};
diff --git a/tests/delete_in_section_labels.dts b/tests/delete_in_section_labels.dts
new file mode 100644
index 0000000..fbde838
--- /dev/null
+++ b/tests/delete_in_section_labels.dts
@@ -0,0 +1,28 @@
+/dts-v1/;
+
+/*
+ * A label moves to the new definition of a node deleted in the same
+ * section, and labels on deleted nodes stay out of __symbols__
+ */
+
+/ {
+	ref = <&moved>;
+
+	moved: node {
+		old;
+	};
+	/delete-node/ node;
+	moved: node {
+		new;
+	};
+
+	gone: gone-node {
+	};
+	/delete-node/ gone-node;
+};
+
+/ {
+	later: later-node {
+	};
+	/delete-node/ later-node;
+};
diff --git a/tests/delete_in_section_labels_ref.dts b/tests/delete_in_section_labels_ref.dts
new file mode 100644
index 0000000..5d8cf38
--- /dev/null
+++ b/tests/delete_in_section_labels_ref.dts
@@ -0,0 +1,9 @@
+/dts-v1/;
+
+/ {
+	ref = <&moved>;
+
+	moved: node {
+		new;
+	};
+};
diff --git a/tests/delete_in_section_overlay.dts b/tests/delete_in_section_overlay.dts
new file mode 100644
index 0000000..e3e8f71
--- /dev/null
+++ b/tests/delete_in_section_overlay.dts
@@ -0,0 +1,21 @@
+/dts-v1/;
+/plugin/;
+
+/* Delete within the fragments of an overlay */
+
+&target {
+	a;
+	/delete-property/ a;
+	b;
+	/delete-property/ c;
+
+	gone {
+	};
+	/delete-node/ gone;
+	/delete-node/ d;
+};
+
+&{/path} {
+	p;
+	/delete-property/ p;
+};
diff --git a/tests/delete_in_section_overlay_ref.dts b/tests/delete_in_section_overlay_ref.dts
new file mode 100644
index 0000000..48f36b3
--- /dev/null
+++ b/tests/delete_in_section_overlay_ref.dts
@@ -0,0 +1,9 @@
+/dts-v1/;
+/plugin/;
+
+&target {
+	b;
+};
+
+&{/path} {
+};
diff --git a/tests/delete_in_section_ref.dts b/tests/delete_in_section_ref.dts
new file mode 100644
index 0000000..20d459a
--- /dev/null
+++ b/tests/delete_in_section_ref.dts
@@ -0,0 +1,44 @@
+/dts-v1/;
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	kept-prop;
+	again-prop = "new";
+	reset-prop = "later";
+
+	again-node {
+		new;
+	};
+
+	lbl: node {
+		child {
+		};
+	};
+
+	remerge-node {
+		new;
+		later;
+	};
+
+	named-node {
+	};
+
+	bus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+
+	new-node {
+		kept;
+	};
+
+	readd@1 {
+		reg = <1>;
+		later;
+	};
+
+	placeholder@2 {
+		reg = <2>;
+	};
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 842b543..2650df6 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -725,6 +725,27 @@ dtc_tests () {
     run_dtc_test -I dts -O dts -o delete_reinstate_multilabel.dts.test.dts "$SRCDIR/delete_reinstate_multilabel.dts"
     run_wrap_test cmp delete_reinstate_multilabel.dts.test.dts "$SRCDIR/delete_reinstate_multilabel_ref.dts"
 
+    # Check deletes within the section which has them
+    run_dtc_test -E reg_format -E avoid_unnecessary_addr_size -I dts -O dtb \
+	-o delete_in_section.test.dtb "$SRCDIR/delete_in_section.dts"
+    run_dtc_test -I dts -O dtb -o delete_in_section_ref.test.dtb \
+	"$SRCDIR/delete_in_section_ref.dts"
+    run_test dtbs_equal_ordered delete_in_section.test.dtb delete_in_section_ref.test.dtb
+    run_dtc_test -@ -I dts -O dtb -o delete_in_section_labels.test.dtb \
+	"$SRCDIR/delete_in_section_labels.dts"
+    run_dtc_test -@ -I dts -O dtb -o delete_in_section_labels_ref.test.dtb \
+	"$SRCDIR/delete_in_section_labels_ref.dts"
+    run_test dtbs_equal_ordered delete_in_section_labels.test.dtb \
+	delete_in_section_labels_ref.test.dtb
+    run_dtc_test -I dts -O dtb -o delete_in_section_overlay.test.dtb \
+	"$SRCDIR/delete_in_section_overlay.dts"
+    run_dtc_test -I dts -O dtb -o delete_in_section_overlay_ref.test.dtb \
+	"$SRCDIR/delete_in_section_overlay_ref.dts"
+    run_test dtbs_equal_ordered delete_in_section_overlay.test.dtb \
+	delete_in_section_overlay_ref.test.dtb
+    run_sh_test "$SRCDIR/dtc-checkfails.sh" phandle_references \
+	-n duplicate_node_names -- -I dts -O dtb "$SRCDIR/delete_in_section_badref.dts"
+
     # Check some checks
     check_tests "$SRCDIR/dup-nodename.dts" duplicate_node_names
     check_tests "$SRCDIR/dup-propname.dts" duplicate_property_names
-- 
2.43.0

