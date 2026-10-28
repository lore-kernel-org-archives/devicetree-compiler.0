Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180195;
	b=KlxY33zlh/qBUzQd/QX3WJ58QnVEqa/rnMUlgaxvKGxG3POfurlzFgnvkpRi3V1fW+Sc
	 nmteeOQGMW34gFjD879oSITSsWDUehWMi+JHvYfic0WneFUILScBDpj+HnHRqAEEVfGmK
	 zrHY9rrsaKbcuzsFKIoHoW1EHyKAhAauEuzus5HjnRK9PfTIW6zag4Q98e8P5lbKI1GWa
	 YOgr35wem5aWafPSqfXRjSvRtjjbk9xLhqYKrDwPkuf+//GP41e7E/6yR/uvPtTMQohaf
	 hsVd80SQLhq7XMiIsdKHQp39S+OLoJxoY+FPPpDcJRG2fOMF7zl2d4qCObvGSZJoTLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180195;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=w1nbIx0fsWM0ydFNAlyrmH9FuHWjyH0OhRN7E954xks=;
	b=PK18kJ0twafTqTm2Bh+STkjN9enovDlgxCYjMXNO6KW3MlOuVM53WOqA55ByE7MqHIgP
	 1sdpizMXsHYFQ99OYBC/Ia76z1m8cZ5N/SEU/VLrXcLKhzlOM3J/pQLys8MX0cUH8CkSU
	 +6yg3vXJz1HNY3yQfDpEK59DKHOBKdONNGJhGoY4G/8/nw8alwvXwxZ6P0k7VZapd/Q1I
	 0LRzEfJ24csESitkauiUkaL7O+ehjOpoZq/sWGHbjuLnLoMhgGjWoS9gPjc7eZF/tVMCW
	 XkQFRh0P/hogSoTBMkNBvaaEyuP2OhAQHCfOi0Cvq9jw4GZ9sHnuMmPYIfGx76btCxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="Q/i8WeIJ";
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C41606A31C
	for <devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 09:36:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4C41606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Q/i8WeIJ
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6faddda49e7so698666eaf.3
        for <devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 02:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793180194; x=1793784994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w1nbIx0fsWM0ydFNAlyrmH9FuHWjyH0OhRN7E954xks=;
        b=Q/i8WeIJ8qapuHaxiYqQ2m4dYJsALWNn5XIc4fdeQS3LmGv0nSGkm0wsi5X9UtXx4d
         VZyFjzsJDH+fQ+lYJiIrzmmOd+Yli4iXTX1dnlJXCv+d5NCwHbFnmfTOe+UjavBMHaOB
         e2ZuSFg7rSKSSItxaDb2gukjGxogpDavJ4ZBM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180194; x=1793784994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w1nbIx0fsWM0ydFNAlyrmH9FuHWjyH0OhRN7E954xks=;
        b=U+dCny7JJIbjVW+IoT98EUxvmt9fxdzhxQy8QVaWyGZz13A+c43VbidiLOh2lMO69D
         7fZGwM6ITgru8RjG+Pon2VexJOsee3PRgbVeKk/ws9NolSumz21oEA5qrzoA2Uf420+W
         1Dkz4zkZCZVaCB/QFkrExSb0UJ7WtGIQ1earc7+961PrCcASYAWXcAPKI2q46ZjxEOc/
         wv+MtFWxYSaAIxOapX1kWAorE+M5tq4RU02XPbg4LZTvX7aErTf3AKlwbx/RYLcDxn/s
         /dZ/Lq4GtZ1KeyyuwjjTJaJfBArm2ciGSn3nW6xsacyvTmablmPg4iSjjAWuuzv562Qp
         Njtw==
X-Gm-Message-State: AFq9FYJqETEoS0FqYs8VuXrvClqLED2do/S8NLq0XyxePUu9yEAkJcq9
	9T6+Bg1/w0udDhanPcjxjDSY0PfAWyYBUoJoNEWnjfHMQk2vDvPrFnvurCFOMz0NOEyKqZXCa9M
	Qtr5Emw==
X-Gm-Gg: AYBFou0kApihFRR08rbjjphm9QkkxEfv0XRJ8bh7x+19fpMRysjQ4PqC0pk3QqR0gqg
	uMXleMo7LgTGTlZSBoljvEdZ47oDy59PpX7kuf4WK4W+oOsalqAXBs4BOfPnv9OB93nOcW7N13s
	jiySP0IFpP2x7i8+ouCRsjdO0Il1yQoEpFO/729OLkE7h8/x6XE19OeSvr05yKozPzQ9BOwFj1z
	6k1V/SOwhxnRRgGe+ileCDBNRjJX85hfEZcojmX25EpFimvQXjtwhKgCrUASfMsjFioHKy2cWmP
	HspFFNe74aUlGPKoNbKbCcWdgMtQz1D6BF/+CXgUp0K/KpKXDU0XY4cIPSbDZoG1GQt0L4zC0eA
	+6KB2izvyRi0XYPD/YJDeViZ15aiwYRRUfNDogcrqhf4aS6Vq3siGN/VHWbw897HkVlhORgiWyL
	IurKYBrPAbcZWUs0KiVxOLvL7DYrmcD4/+qc3XgeNF0od5mRE+Nqq9xaAbmvk0QCdze0ZA0lPTD
	Q3ahZtKe3abnaLOAf+GCwH/T4kEkBJfIFLLpNN6xhfIiDvWWG3vyDbWuqTM/wV6ZOtsLOROs2K3
	xCW7Omc+7DnaBR3YlCebdctz45f5Pvf7SFcMzMEJDCaoPGclf4lHLCiS+ObHBt2L42G2t/kJ5p6
	Twl4kvCk=
X-Received: by 2002:a05:6820:f014:b0:6b6:c0bc:365c with SMTP id 006d021491bc7-713f0baff6dmr858077eaf.22.1793180193753;
        Wed, 28 Oct 2026 02:36:33 -0700 (PDT)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85b205fe36bsm1099953a34.24.2026.10.28.02.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 02:36:33 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>,
	Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH v2 2/6] dtc: Remove a deleted node or property from the tree
Date: Wed, 28 Oct 2026 03:36:09 -0600
Message-ID: <20261028093620.3705074-3-sjg@chromium.org>
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
Reviewed-by: Herve Codina <herve.codina@bootlin.com>
---

(no changes since v1)

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

