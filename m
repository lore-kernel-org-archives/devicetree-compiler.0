Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180203;
	b=pwleeozLg9MgJPToDCLIP1ZpQf4sR1booNwEKBq619MqBXFoB1MAYSbBZHxCwwiQlxuc
	 6ERvzS5C8Pup+q5pbwhHwf4TX6XCivisq2N3B4Iob8wkxtKftY5MkMaCX9e3NiYgaDa8p
	 YuksMQH0gWHFHTzGRf5E2eGpVW1olOgWWktj11O03mhLS610Dglw+NJaUSKn0+adOoXMj
	 fRrg0m9JVGwWUYvAcS6aDclH62xpelMGgQa9vnkKCOmlaHAJiobMRdAE5XoCDLkNMzYpG
	 E/fxVsPT+Du2+YdU2os5ezt33r4TMND9hlyHhEFqH9aohMnv9ylf45Zvbx+vRrq07TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180203;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cP+c8n4uXMkHy3b0gs0L+AoCe7mInl1bGGUQJ47Ay1I=;
	b=3S11LQqkGAaQ5/h5l/lqF20qOrKQD7HP4AcntimLNpptFD5pu3JqYZBFc+vSxKrTU9S7
	 1wX+7wnhKN+4t3PMcdNgi6t/iBig871thhrmes09lFwSKnR5c8xRUwjHPke1SSA2p20UR
	 famQ49yiC7nDW7lqswdYSoNlKHCqhiGHo+EASJHULlJJQ5ELL1Tg9mXgG2R6vx0JKnEMV
	 nSeMiINOpFc2d3YxwW2FPjNoB5P7DqyGBPRQUjaxZJfHo8avvkBKYK+bLxc7s6X4PUIFZ
	 zV7D5Tl0ZZzIf6GqF0qX+/cgAvXHOLk3VJG65boPr/4nPpqegHUI5gOXGLtLYnXO+rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=I+3bcCd5;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF89A606A31D
	for <devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 09:36:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF89A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=I+3bcCd5
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-8446af403b5so473464a34.2
        for <devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 02:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793180202; x=1793785002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cP+c8n4uXMkHy3b0gs0L+AoCe7mInl1bGGUQJ47Ay1I=;
        b=I+3bcCd5DThDvedtNElbr85r4U7LjfeC4JsCY3vU16Fk45pqEGnIq4OFSvWIKVIiL0
         g5h3KM0iW8ijh/kIzEEer6o3fpLBWG6ihuWGOH9EvdCJMMrx8co/QCIjW3sCiptCr8vy
         NzoV6RfzH76QUddkqvG2K1ALvLd6b2vwbE9O4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180202; x=1793785002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cP+c8n4uXMkHy3b0gs0L+AoCe7mInl1bGGUQJ47Ay1I=;
        b=EzSm4XyI0pXJ/WCfbxgRSjWhrzXNpfVt/xKJ9DfXy8fQ8yxH69fNxhKpMg/vKIHVxL
         PGQ6w+GvbVA2s6HaDWePkH2QL3wxav9Gyet+IoMQcQykZqL3VmGVdlSayLUzOSZiZ9X2
         HpjVQsokaohQHa+IaIUdRD9d8XmgVgZvLZJ8yBUSEGJxm5vPFuZk5SUjzhPjisWiIzAD
         tzysqofg7hEf1CPkNz65p+1rAk78246NcvZg8Ab3wBlbZtt0zQHUYibmFgxvIvxsPryn
         p4EZkFoSjX5ldb3U+dfqdlFhUpZ3tKYWbvKsv4SVUcWodUFklRWu9LvU0hUzSlK6dtkj
         WeYg==
X-Gm-Message-State: AFq9FYIdefVSwH4UcwdWHwN9iLlXdGqlbmSGjOjlBEqrzlzuhUHLg/kt
	YhfVyY0gM2fuutGfoN8oiFpgunDoOjeXH4Z0HDgydKKnNZiep0yjJr0/d7eWk86xaNzp6DSZq+b
	Io8dRkA==
X-Gm-Gg: AYBFou10ds+Wx04sIaBO/odBps//Td1cZXb1ma33Uc2UqDDJRP+2NIRO6FtwKU7Vic9
	7/Vrk8RIoJYt5h61y8qMJ1BjsSDOBrGAuZeEZm+0CazUZdqKa0QC/kkCZpl38RRVMPeVZj7FlcO
	XFmbW3IBi+L+g16zdL0fNJV+qkFpLrVoGuYF52E5G0uHKljI252nZPvMy9M6GI31dPrBxEoQZ4c
	R1SnwgOLKGNCK//YRnZPK0rV4xk/EsSdsg9r+sTQ+aG0sjYONjm0Ni5x5Ipop9N5lhG0B6yiJwt
	zBQNRAdP8Xg3Mp1uoRKHpKCmy0MlKNuEiqJc+wlOyR56tKhXNOPC+WDJ/PmMT9Qu/TkjNRdNSiz
	SEu08lcITcPUWL+Do4c4EqkE1yzTjV0VpoETDLLY+Ln/S3JuNOfoc9cAjoqBrkz0ZiOCGZLaQCs
	Lr3NYQ0OAvo9OWBUpGuvEJqIeasaUyPdtOTnmaNjTnd7aWC/T735fsbvcWxzWPj3jCcJIXTnhGH
	/QbRLjPwCiqnZoVwkqStCP3bBR7gUn6FxdY2ZpyTjWgJZRmtd9yjEkOMxdlklPCdbAFkOVKAJ9J
	2fuI5Ad9eGLN4lCScQPghCnEB5sUgzEgkZx+cMP1zQU2+t5IEJbP1UFjMsKd0g==
X-Received: by 2002:a05:6830:310d:b0:80c:4d85:9aae with SMTP id 46e09a7af769-85ab7637231mr2398512a34.15.1793180201773;
        Wed, 28 Oct 2026 02:36:41 -0700 (PDT)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85b205fe36bsm1099953a34.24.2026.10.28.02.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 02:36:40 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v2 5/6] dtc: Report an error for a delete in an overlay fragment
Date: Wed, 28 Oct 2026 03:36:12 -0600
Message-ID: <20261028093620.3705074-6-sjg@chromium.org>
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

An overlay cannot encode a /delete-property/ or /delete-node/, since
applying an overlay only adds or updates nodes and properties. So a
delete in an overlay fragment has no effect on the base tree, yet dtc
drops it without complaint, which suggests that it works. A delete which
removes something earlier in the same fragment is fine, since the
fragment is compiled without it.

Report an error for a /delete-property/ or /delete-node/ in a fragment
which does not delete anything within the fragment, naming it. Record in
apply_deletes() which placeholders delete something, and add
find_unapplied_delete() to look for one which does not. Do this for each
of the three ways in which a plugin creates a fragment.

Drop the deletes with nothing to delete from the overlay test, and add
tests which check for the error, one for each way of creating a
fragment.

Note: This breaks the build of two overlays in Linux v7.3-rc7, whose
deletes have never taken effect:

   imx8mn-tqma8mqnl-mba8mx-usbotg.dtso
   imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtso

Linux needs to remove these deletes. Where the result matters, the base
dts must change instead, e.g. by moving the property or node to the
boards which need it, so that the overlay only adds to the tree.

Suggested-by: David Gibson <david@gibson.dropbear.id.au>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v2:
- Add new patch to report an error for a delete in an overlay fragment

 dtc-parser.y                                  | 27 +++++++++--
 dtc.h                                         |  3 ++
 livetree.c                                    | 45 +++++++++++++++++--
 tests/delete_in_section_overlay.dts           |  7 +--
 tests/delete_in_section_overlay_unused.dts    |  8 ++++
 ...delete_in_section_overlay_unused_label.dts | 14 ++++++
 .../delete_in_section_overlay_unused_path.dts | 13 ++++++
 tests/run_tests.sh                            |  9 ++++
 8 files changed, 115 insertions(+), 11 deletions(-)
 create mode 100644 tests/delete_in_section_overlay_unused.dts
 create mode 100644 tests/delete_in_section_overlay_unused_label.dts
 create mode 100644 tests/delete_in_section_overlay_unused_path.dts

diff --git a/dtc-parser.y b/dtc-parser.y
index 0282f7b..e1b8368 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -29,6 +29,25 @@ static bool is_ref_relative(const char *ref)
 	return ref[0] != '/' && strchr(&ref[1], '/');
 }
 
+/*
+ * Add a node from a plugin as an overlay fragment. An overlay cannot encode a
+ * delete, so a /delete-property/ or /delete-node/ which does not delete
+ * anything within the fragment would have no effect when the overlay is applied
+ */
+static struct node *add_fragment(struct node *dt, struct node *new_node,
+				 char *ref, struct srcpos *loc)
+{
+	const char *name;
+	bool is_node;
+
+	name = find_unapplied_delete(new_node, &is_node);
+	if (name)
+		ERROR(loc, "/delete-%s/ %s in %s has no effect in plugin",
+		      is_node ? "node" : "property", name, ref);
+
+	return add_orphan_node(dt, new_node, ref);
+}
+
 %}
 
 %union {
@@ -178,10 +197,10 @@ devicetree:
 				ERROR(&@2, "Label or path %s not found", $1);
 			else if (is_ref_relative($1))
 				ERROR(&@2, "Label-relative reference %s not supported in plugin", $1);
-			$$ = add_orphan_node(
+			$$ = add_fragment(
 					name_node(build_node(NULL, NULL, NULL),
 						  ""),
-					$2, $1);
+					$2, $1, &@2);
 		}
 	| devicetree DT_LABEL dt_ref nodedef
 		{
@@ -207,7 +226,7 @@ devicetree:
 			if ($<flags>-1 & DTSF_PLUGIN) {
 				if (is_ref_relative($2))
 					ERROR(&@2, "Label-relative reference %s not supported in plugin", $2);
-				add_orphan_node($1, $3, $2);
+				add_fragment($1, $3, $2, &@3);
 			} else {
 				struct node *target = get_node_by_ref($1, $2);
 
@@ -231,7 +250,7 @@ devicetree:
 				 * so $-1 is what we want (plugindecl)
 				 */
 				if ($<flags>-1 & DTSF_PLUGIN)
-					add_orphan_node($1, $3, $2);
+					add_fragment($1, $3, $2, &@3);
 				else
 					ERROR(&@2, "Label or path %s not found", $2);
 			}
diff --git a/dtc.h b/dtc.h
index 3e5109d..fc632bd 100644
--- a/dtc.h
+++ b/dtc.h
@@ -208,6 +208,7 @@ struct bus_type {
 
 struct property {
 	bool deleted;
+	bool delete_applied;
 	char *name;
 	struct data val;
 
@@ -219,6 +220,7 @@ struct property {
 
 struct node {
 	bool deleted;
+	bool delete_applied;
 	char *name;
 	struct property *proplist;
 	struct node *children;
@@ -277,6 +279,7 @@ struct node *omit_node_if_unused(struct node *node);
 struct node *reference_node(struct node *node);
 struct node *chain_node(struct node *first, struct node *list);
 struct node *merge_nodes(struct node *old_node, struct node *new_node);
+const char *find_unapplied_delete(struct node *node, bool *is_node);
 void drop_delete_placeholders(struct node *node);
 struct node *add_orphan_node(struct node *old_node, struct node *new_node, char *ref);
 
diff --git a/livetree.c b/livetree.c
index b7a5161..37e37c6 100644
--- a/livetree.c
+++ b/livetree.c
@@ -101,10 +101,13 @@ static void apply_deletes(struct node *node)
 		if (!prop->deleted)
 			continue;
 		for (pp = &node->proplist; *pp != prop;) {
-			if (streq((*pp)->name, prop->name))
+			if (streq((*pp)->name, prop->name)) {
+				if (!(*pp)->deleted)
+					prop->delete_applied = true;
 				*pp = (*pp)->next;
-			else
+			} else {
 				pp = &(*pp)->next;
+			}
 		}
 	}
 
@@ -112,14 +115,48 @@ static void apply_deletes(struct node *node)
 		if (!child->deleted)
 			continue;
 		for (np = &node->children; *np != child;) {
-			if (streq((*np)->name, child->name))
+			if (streq((*np)->name, child->name)) {
+				if (!(*np)->deleted)
+					child->delete_applied = true;
 				*np = (*np)->next_sibling;
-			else
+			} else {
 				np = &(*np)->next_sibling;
+			}
 		}
 	}
 }
 
+/*
+ * Find a /delete-property/ or /delete-node/ in a subtree which did not delete
+ * anything within it. Return its name, setting *is_node to say which it is, or
+ * NULL if there is none
+ */
+const char *find_unapplied_delete(struct node *node, bool *is_node)
+{
+	struct property *prop;
+	struct node *child;
+	const char *name;
+
+	for (prop = node->proplist; prop; prop = prop->next) {
+		if (prop->deleted && !prop->delete_applied) {
+			*is_node = false;
+			return prop->name;
+		}
+	}
+
+	for (child = node->children; child; child = child->next_sibling) {
+		if (child->deleted && !child->delete_applied) {
+			*is_node = true;
+			return child->name;
+		}
+		name = find_unapplied_delete(child, is_node);
+		if (name)
+			return name;
+	}
+
+	return NULL;
+}
+
 /*
  * Drop the /delete-property/ and /delete-node/ placeholders from a subtree
  * which is the first definition of its node, i.e. the first in the list of
diff --git a/tests/delete_in_section_overlay.dts b/tests/delete_in_section_overlay.dts
index e3e8f71..f7c8f64 100644
--- a/tests/delete_in_section_overlay.dts
+++ b/tests/delete_in_section_overlay.dts
@@ -1,18 +1,19 @@
 /dts-v1/;
 /plugin/;
 
-/* Delete within the fragments of an overlay */
+/*
+ * Delete within the fragments of an overlay. Each delete must delete something
+ * in its fragment, since an overlay cannot delete from the base tree
+ */
 
 &target {
 	a;
 	/delete-property/ a;
 	b;
-	/delete-property/ c;
 
 	gone {
 	};
 	/delete-node/ gone;
-	/delete-node/ d;
 };
 
 &{/path} {
diff --git a/tests/delete_in_section_overlay_unused.dts b/tests/delete_in_section_overlay_unused.dts
new file mode 100644
index 0000000..4956689
--- /dev/null
+++ b/tests/delete_in_section_overlay_unused.dts
@@ -0,0 +1,8 @@
+/dts-v1/;
+/plugin/;
+
+/* An overlay cannot delete from the base tree */
+
+&target {
+	/delete-property/ a;
+};
diff --git a/tests/delete_in_section_overlay_unused_label.dts b/tests/delete_in_section_overlay_unused_label.dts
new file mode 100644
index 0000000..b80f3b2
--- /dev/null
+++ b/tests/delete_in_section_overlay_unused_label.dts
@@ -0,0 +1,14 @@
+/dts-v1/;
+/plugin/;
+
+/* A delete with nothing to delete in a subnode of a later fragment */
+
+&target {
+	a;
+};
+
+&other {
+	sub {
+		/delete-node/ gone;
+	};
+};
diff --git a/tests/delete_in_section_overlay_unused_path.dts b/tests/delete_in_section_overlay_unused_path.dts
new file mode 100644
index 0000000..5186b1b
--- /dev/null
+++ b/tests/delete_in_section_overlay_unused_path.dts
@@ -0,0 +1,13 @@
+/dts-v1/;
+/plugin/;
+
+/* A delete before the definition in a later fragment which uses a path */
+
+&target {
+	a;
+};
+
+&{/path} {
+	/delete-property/ p;
+	p;
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 1018a6b..ed93f86 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -743,6 +743,15 @@ dtc_tests () {
 	"$SRCDIR/delete_in_section_overlay_ref.dts"
     run_test dtbs_equal_ordered delete_in_section_overlay.test.dtb \
 	delete_in_section_overlay_ref.test.dtb
+    run_sh_test "$SRCDIR/dtc-fatal.sh" \
+	-m "/delete-property/ a in target has no effect in plugin" \
+	-I dts -O dtb "$SRCDIR/delete_in_section_overlay_unused.dts"
+    run_sh_test "$SRCDIR/dtc-fatal.sh" \
+	-m "/delete-node/ gone in other has no effect in plugin" \
+	-I dts -O dtb "$SRCDIR/delete_in_section_overlay_unused_label.dts"
+    run_sh_test "$SRCDIR/dtc-fatal.sh" \
+	-m "/delete-property/ p in /path has no effect in plugin" \
+	-I dts -O dtb "$SRCDIR/delete_in_section_overlay_unused_path.dts"
     run_sh_test "$SRCDIR/dtc-checkfails.sh" phandle_references \
 	-n duplicate_node_names -- -I dts -O dtb "$SRCDIR/delete_in_section_badref.dts"
 
-- 
2.43.0

