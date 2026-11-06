Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793994834;
	b=DhXndYDJyDwPelQ02EK6tvTVKffu/SccXQu27u9oP3agQYP/97OU0gKHhFAtkMjsuAts
	 +/ItH7ofmTvU9/EMzOBph/1/xl5IZNvHBfYcw/7w21/rd1/rPCAFrSi2GQHc7ORj29Q5w
	 gvx1QB0OcWcL9+gme889+YLQas7RNeX/+O3JWY6lt7ghNiEaibJJnCEIIdRs1PTNA3Msg
	 fimlXlqDUg9LeRDUUk+wpF6Ag/SUwiZWavfv8Bn1yI42xSZBvnFLk0M/WN7Synsvomu7r
	 J0Q9Ygwq4LEWNg8Q7umRHMJr0FpexcgCE9xVj97IpVugS1sRYRXRMfZLvVt7oFvIwPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793994834;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pibXMrjdFvKGeT5E76VPZVlizR4IMS8csWdXKylFWds=;
	b=Q3gK0lBXQEbkcbLWDGyyCnkKCQo/KX/ZO5FEGLaZPTE3fXQALekthwj0DX5DMNmaAsEX
	 6Be+89jIRDV5H0mxxyb8gBFKbCr1la3ZJEoiIuePoEFKzAOkPwO1UhqCupo11GPgFtRcN
	 JUeI+ZCXyghA1j+YY4hPzyB0kJAOyYOgQxxFPWIi8MtAH/DTlIxffQdGa0XO3POD7cvZA
	 ezMeE21UCvoQhcCfnZ7Mz83plftnIr113L0Vu79F91njYXa+VmUn9Z+DTVBa5iLNgp+e0
	 d3bPMfKc4QH1F+OpKLpijHaTMJPgBRE7a6cUWRs+6Pn+Y4fiqVaAXloGY463wBZE5pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=FVe+vGS6;
	arc=none smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B930A606A326
	for <devicetree-compiler@vger.kernel.org>; Fri,  6 Nov 2026 19:53:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B930A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=FVe+vGS6
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-70b875f6f13so907396eaf.0
        for <devicetree-compiler@vger.kernel.org>; Fri, 06 Nov 2026 11:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793994833; x=1794599633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pibXMrjdFvKGeT5E76VPZVlizR4IMS8csWdXKylFWds=;
        b=FVe+vGS6PL7xUb2n63nHhOPASk0ojtpsjgRXRY1jsJHtLJv1BiqPkv7PJbrPn2/KRm
         SLo8RyaWCpSD/ih4MlyhVaTJV1m2GFVBtqt2IDWzvB6gKjeDPUvqKR0oVx/SYwprlJJ8
         pE7oCAW5NUNgC1BZMEQbb357t5NPEDcXGhY2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793994833; x=1794599633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pibXMrjdFvKGeT5E76VPZVlizR4IMS8csWdXKylFWds=;
        b=oBIrjUV1J6FJI25qv2Fjs304wFfk5fYCwdr8/BfyT1ssTl0N01jFxEJT6cwYU+tHWK
         ZE5D5rTcIXI4k9jaIZrszah8qPRkZkYTS4E+MStqcg1/2k+6skdReK4xb5fUDQwfrqsF
         vrX3wPWwc0L8jb1Gdp+ANCTjoTZcQeq5fqdA8LqpNRj/OkQvIKf/hDT4ki7ugWDUK0px
         Q1SsdWXkkI3I+O2UlBKCx7QkK9oPMu81ZYmgIDogP8vvZP8aVzFCk/8K/Y8iKr0PclpL
         rSdvuKm4lAOB8IYtccJVy3PkUU2eA7TU8m73pzGbfFus66Xh4Ba/n93k1nn1Z/RpmZLc
         yUCQ==
X-Gm-Message-State: APuU4Z//BNIea6CbQDa6vYXI+wIw4Lx+x2RfdBDTgUPeqO9G6FCANNPB
	b4lehigBg3mSnqH+o0liYVhaz0HJ+5HS+UOhsJ4LaU7HUnDIG9NI3rnMpalW411OmY51SUpPOyb
	DrK1HSg==
X-Gm-Gg: AYBFou3AteIvoBGyuBYDMZQmNNU8heruWtXl5vK8mj+fNWgl/K709bc1REfUcMRj8hG
	U9d310XyTuE1JDwW5mNRoRTFGmacv/wve41aiZHF6PWHpIvlqXqsfBQs+7yubTY3Ux79Tu9lKm+
	9rWkzRwNzl01Z78iZQf4FQyJCe78qmRxon0f8SE3gTMhdahS+szS+vcE+LqjIkPnhRoXaJJ9cIp
	df1JdfkAUyEpXJKc9at6mHcgPqcXwwp1423HjN0/bGstrMOlogDIzaU6nULroBgKaoyLk7VOIl5
	uPhcg5shOp7PWMK1U5GuObrH5sfjyTelGVwU8FEGPhT/ySDHHn8rk1PJdEOcMWzRd/bbaR+UOw3
	vVtksbWY61cNxnHhZQVtnpjhrl68pein15GQh/rUA8PcHy8d+K78neuKz2DPzL5GyAX6WLPuJWq
	zx3KzK+t89gTtL/IsMHzCbXjhu7nG5qv48EzMu+P9LRjgnEllIA7mXB7YPzRFgtwctuhQlJO5eQ
	1A8TedAk6czyF6l49LkfU8+Al0h0j5+f2L248yEfXOqm0ficawJxsrw6wYMCkel4zpIyxORER96
	4nvnNtMOupcLKIir7Jm1rEgsDytN0RCGi0/8CsBpXkQfWeI+GZ3AdJGrN+dr1mhfAIwvjtuLorr
	oVcNZAdFCmKX0BjHFY/2b
X-Received: by 2002:a05:6820:1609:b0:717:c:756f with SMTP id 006d021491bc7-717000c7780mr97604eaf.36.1793994832587;
        Fri, 06 Nov 2026 11:53:52 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ad97a37725sm2825498fac.11.2026.11.06.11.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 11:53:51 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Herve Codina <herve.codina@bootlin.com>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v3 18/18] dtc: Add the overlay fragments after merging a plugin
Date: Fri,  6 Nov 2026 12:51:45 -0700
Message-ID: <20261106195159.2623314-19-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106195159.2623314-1-sjg@chromium.org>
References: <20261106195159.2623314-1-sjg@chromium.org>
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

In a plugin, merge_fragments() turns each fragment which refers to the
base tree into an overlay fragment (a fragment@N node) as soon as it is
merged. This puts the fragment@N nodes into the tree which later
fragments are merged into, so converting the plugin to the overlay
format is still mixed with the merge.

Keep these fragments in dti->fragments instead and add the fragment@N
nodes from main() once the merge is complete. A later fragment can still
refer to a label in one of them, so look up a label in these fragments
as well as in the tree. Make add_orphan_node() return the fragment@N
node, so that its full path can be filled in.

This changes the output in three cases.

Firstly, where a / { ... } fragment comes after one which refers to the
base tree, the fragment@N nodes now come after the nodes which it adds,
rather than before them.

Secondly, a / { ... } fragment can no longer add to a fragment@N node by
giving its name, which now gives a duplicate-node-name error. dtc
generates these nodes and numbers them in order, so a plugin should not
rely on their names, and an error is better than silently changing a
generated fragment.

Finally, /delete-node/ and /omit-if-no-ref/ can no longer refer to a
node in an overlay fragment by its path, such as
&{/fragment@0/__overlay__/node}, since that path does not exist until
after the merge. The path also relies on a generated name, whereas a
label, which still works, refers to the node as written in the source.

Update the tests for these three cases.

Suggested-by: Herve Codina <herve.codina@bootlin.com>
Link: https://lore.kernel.org/devicetree-compiler/20261105100714.47bf0434@bootlin.com/
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---
None of these changes affects any .dts or .dtso file in Linux
v7.3-12284-g3799eeb906c9

Changes in v3:
- Add new patch to add the overlay fragments after merging a plugin

 dtc.c              |   1 +
 dtc.h              |   6 ++-
 livetree.c         | 105 ++++++++++++++++++++++++++++++++++-----------
 tests/run_tests.sh |  20 ++++-----
 4 files changed, 94 insertions(+), 38 deletions(-)

diff --git a/dtc.c b/dtc.c
index 73e5d76..13a9963 100644
--- a/dtc.c
+++ b/dtc.c
@@ -301,6 +301,7 @@ int main(int argc, char *argv[])
 
 	if (!merge_fragments(dti))
 		die("Unable to merge input tree\n");
+	add_overlay_fragments(dti);
 	dti->outname = outname;
 
 	if (depfile) {
diff --git a/dtc.h b/dtc.h
index 437efbc..0062e3d 100644
--- a/dtc.h
+++ b/dtc.h
@@ -330,7 +330,8 @@ struct reserve_info *add_reserve_entry(struct reserve_info *list,
  * tree.
  *
  * This is not the same as an overlay fragment (a fragment@N node), although
- * in a plugin a fragment may become one when it is merged.
+ * in a plugin a fragment which refers to the base tree becomes one after the
+ * others are merged.
  */
 
 enum fragment_type {
@@ -378,7 +379,7 @@ struct dt_info {
 	struct reserve_info *reservelist;
 	uint32_t boot_cpuid_phys;
 	struct node *dt;		/* the device tree */
-	struct fragment *fragments;	/* not yet merged into dt */
+	struct fragment *fragments;	/* not merged into dt */
 	const char *outname;		/* filename being written to, "-" for stdout */
 };
 
@@ -391,6 +392,7 @@ struct dt_info *build_dt_info(unsigned int dtsflags,
 			      struct node *tree, struct fragment *fragments,
 			      uint32_t boot_cpuid_phys);
 bool merge_fragments(struct dt_info *dti);
+void add_overlay_fragments(struct dt_info *dti);
 void sort_tree(struct dt_info *dti);
 void generate_labels_from_tree(struct dt_info *dti, const char *name);
 void generate_label_tree(struct dt_info *dti, const char *name, bool allocph);
diff --git a/livetree.c b/livetree.c
index c5fec49..3413a26 100644
--- a/livetree.c
+++ b/livetree.c
@@ -232,7 +232,7 @@ struct node *merge_nodes(struct node *old_node, struct node *new_node)
  * or a label (target, as a phandle reference). Fragments are numbered in the
  * order they are added.
  *
- * Returns the root node, dt
+ * Returns the fragment@N node
  */
 struct node * add_orphan_node(struct node *dt, struct node *new_node, char *ref)
 {
@@ -262,7 +262,7 @@ struct node * add_orphan_node(struct node *dt, struct node *new_node, char *ref)
 	free(name);
 
 	add_child(dt, node);
-	return dt;
+	return node;
 }
 
 struct node *chain_node(struct node *first, struct node *list)
@@ -602,15 +602,37 @@ static bool check_relative_ref(struct fragment *f, struct srcpos *pos)
 	return false;
 }
 
+/*
+ * Look up a reference in the tree merged so far or, for a label, in base_frags,
+ * the fragments for the base tree so far, since a plugin may refer to a node in
+ * one of these
+ *
+ * Returns the node, or NULL if it is not found
+ */
+static struct node *find_ref(struct node *dt, struct fragment *base_frags,
+			     const char *ref)
+{
+	struct node *target = get_node_by_ref(dt, ref);
+	struct fragment *f;
+
+	if (ref[0] == '/')
+		return target;
+	for (f = base_frags; f && !target; f = f->next)
+		target = get_node_by_ref(f->node, ref);
+
+	return target;
+}
+
 /*
  * Look up the node which a fragment refers to, reporting an error if it is
  * not found
  *
  * Returns the node, or NULL if it is not found
  */
-static struct node *lookup_ref(struct node *dt, struct fragment *f)
+static struct node *lookup_ref(struct node *dt, struct fragment *base_frags,
+			       struct fragment *f)
 {
-	struct node *target = get_node_by_ref(dt, f->ref);
+	struct node *target = find_ref(dt, base_frags, f->ref);
 
 	if (!target)
 		srcpos_error(f->ref_srcpos, "Error",
@@ -622,7 +644,7 @@ static struct node *lookup_ref(struct node *dt, struct fragment *f)
 /*
  * Make an empty tree at *dtp for a first fragment which refers to a label or
  * path, rather than being the root node. This is only valid in a plugin, where
- * the fragment becomes an overlay fragment.
+ * the fragment is kept to become an overlay fragment.
  *
  * Returns true on success, false on an error, which has been reported.
  */
@@ -653,8 +675,8 @@ static bool merge_first_ref(struct node **dtp, struct fragment *f, bool plugin)
  *
  * Returns true on success, false on an error, which has been reported.
  */
-static bool merge_ref(struct node *dt, struct fragment *f, bool plugin,
-		      bool *for_basep)
+static bool merge_ref(struct node *dt, struct fragment *base_frags,
+		      struct fragment *f, bool plugin, bool *for_basep)
 {
 	struct node *target;
 	bool ok = true;
@@ -664,13 +686,13 @@ static bool merge_ref(struct node *dt, struct fragment *f, bool plugin,
 		ok = check_relative_ref(f, f->label ? f->label_srcpos :
 					f->ref_srcpos);
 		if (!f->label &&
-		    (f->ref[0] == '/' || !get_node_by_ref(dt, f->ref))) {
+		    (f->ref[0] == '/' || !find_ref(dt, base_frags, f->ref))) {
 			*for_basep = true;
 			return ok;
 		}
 	}
 
-	target = lookup_ref(dt, f);
+	target = lookup_ref(dt, base_frags, f);
 	if (!target)
 		return false;
 	if (f->label)
@@ -685,9 +707,10 @@ static bool merge_ref(struct node *dt, struct fragment *f, bool plugin,
  *
  * Returns true on success, false on an error, which has been reported.
  */
-static bool merge_delete_node(struct node *dt, struct fragment *f)
+static bool merge_delete_node(struct node *dt, struct fragment *base_frags,
+			      struct fragment *f)
 {
-	struct node *target = lookup_ref(dt, f);
+	struct node *target = lookup_ref(dt, base_frags, f);
 
 	assert(f->type == FRAGMENT_DELETE_NODE);
 	if (!target)
@@ -703,9 +726,10 @@ static bool merge_delete_node(struct node *dt, struct fragment *f)
  *
  * Returns true on success, false on an error, which has been reported.
  */
-static bool merge_omit_if_no_ref(struct node *dt, struct fragment *f)
+static bool merge_omit_if_no_ref(struct node *dt, struct fragment *base_frags,
+				 struct fragment *f)
 {
-	struct node *target = lookup_ref(dt, f);
+	struct node *target = lookup_ref(dt, base_frags, f);
 
 	assert(f->type == FRAGMENT_OMIT_IF_NO_REF);
 	if (!target)
@@ -717,13 +741,14 @@ static bool merge_omit_if_no_ref(struct node *dt, struct fragment *f)
 
 /*
  * Merge a fragment of a dts file into the tree at *dtp, which is NULL for the
- * first fragment. A reference is looked up in the tree as merged so far. If
- * the fragment is for the base tree, *for_basep is set to true.
+ * first fragment. A reference is looked up in the tree as merged so far and in
+ * base_frags, the fragments for the base tree so far. If this fragment is for
+ * the base tree too, *for_basep is set to true.
  *
  * Returns true on success, false on an error, which has been reported.
  */
-static bool merge_fragment(struct node **dtp, struct fragment *f,
-			   bool plugin, bool *for_basep)
+static bool merge_fragment(struct node **dtp, struct fragment *base_frags,
+			   struct fragment *f, bool plugin, bool *for_basep)
 {
 	struct node *dt = *dtp;
 
@@ -740,13 +765,13 @@ static bool merge_fragment(struct node **dtp, struct fragment *f,
 	switch (f->type) {
 	case FRAGMENT_NODE:
 		if (f->ref)
-			return merge_ref(dt, f, plugin, for_basep);
+			return merge_ref(dt, base_frags, f, plugin, for_basep);
 		*dtp = merge_nodes(dt, f->node);
 		break;
 	case FRAGMENT_DELETE_NODE:
-		return merge_delete_node(dt, f);
+		return merge_delete_node(dt, base_frags, f);
 	case FRAGMENT_OMIT_IF_NO_REF:
-		return merge_omit_if_no_ref(dt, f);
+		return merge_omit_if_no_ref(dt, base_frags, f);
 	}
 
 	return true;
@@ -754,39 +779,67 @@ static bool merge_fragment(struct node **dtp, struct fragment *f,
 
 /*
  * Merge the fragments of a dts file into a single tree, in source order. In a
- * plugin, each fragment for the base tree becomes an overlay fragment.
+ * plugin, the fragments for the base tree are left in dti->fragments, for
+ * add_overlay_fragments() to deal with.
  *
  * Returns true on success, false on errors, which have been reported.
  */
 bool merge_fragments(struct dt_info *dti)
 {
 	bool plugin = dti->dtsflags & DTSF_PLUGIN;
-	struct fragment *f, *next;
+	struct fragment *f, *next, *base_frags = NULL;
 	struct node *dt = NULL;
 	bool ok = true;
 
 	if (!dti->fragments)
 		return true;
 
+	/*
+	 * At the start, dti->fragments holds all the fragments in source order,
+	 * dt is NULL and base_frags is empty. Merge each fragment into dt and
+	 * free it, unless it is for the base tree, in which case move it to
+	 * base_frags so that later fragments can refer to its labels. At the
+	 * end, each fragment has been freed or moved to base_frags, and
+	 * dti->fragments is set to base_frags below.
+	 */
 	for (f = dti->fragments; f; f = next) {
 		bool for_base = false;
 
 		next = f->next;
-		if (!merge_fragment(&dt, f, plugin, &for_base))
+		if (!merge_fragment(&dt, base_frags, f, plugin, &for_base))
 			ok = false;
 		if (for_base)
-			add_orphan_node(dt, f->node, f->ref);
-		free_fragment(f);
+			base_frags = append_fragment(base_frags, f);
+		else
+			free_fragment(f);
 	}
 
 	dti->dt = dt;
-	dti->fragments = NULL;
+	dti->fragments = base_frags;
 	dti->boot_cpuid_phys = guess_boot_cpuid(dt);
 	fill_fullpaths(dti->dt, "");
 
 	return ok;
 }
 
+/*
+ * Add an overlay fragment (a fragment@N node) to the tree for each fragment of
+ * a plugin which is left after merging, i.e. which refers to the base tree
+ */
+void add_overlay_fragments(struct dt_info *dti)
+{
+	struct fragment *f, *next;
+	struct node *node;
+
+	for (f = dti->fragments; f; f = next) {
+		next = f->next;
+		node = add_orphan_node(dti->dt, f->node, f->ref);
+		fill_fullpaths(node, dti->dt->fullpath);
+		free_fragment(f);
+	}
+	dti->fragments = NULL;
+}
+
 /*
  * Tree accessor functions
  */
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 92e4d2c..73ab5f8 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -841,21 +841,21 @@ dtc_tests () {
     run_fdtget_test "/fragment@0:target:0" merge-label-base.test.dtb /__fixups__ baselabel
 
     # In a plugin, a node in an overlay fragment can be deleted by its label,
-    # and the overlay fragment comes before the later node in the plugin
+    # and the overlay fragment comes after the nodes in the plugin, since it
+    # is added after the merge
     run_dtc_test -I dts -O dtb -o merge-overlay-order.test.dtb \
 	"$SRCDIR/merge-overlay-order.dts"
-    run_fdtget_test "fragment@0\nnode\n__fixups__" merge-overlay-order.test.dtb -l /
+    run_fdtget_test "node\nfragment@0\n__fixups__" merge-overlay-order.test.dtb -l /
     run_fdtget_test "bar" merge-overlay-order.test.dtb -l /fragment@0/__overlay__
 
-    # In a plugin, a / { ... } fragment can add to an overlay fragment by
+    # In a plugin, a / { ... } fragment cannot add to an overlay fragment by
     # giving the name which dtc generates for it, and a node in an overlay
-    # fragment can be deleted by its path
-    run_dtc_test -I dts -O dtb -o merge-overlay-name.test.dtb \
-	"$SRCDIR/merge-overlay-name.dts"
-    run_fdtget_test 1 merge-overlay-name.test.dtb /fragment@0 prop
-    run_dtc_test -I dts -O dtb -o merge-overlay-path.test.dtb \
-	"$SRCDIR/merge-overlay-path.dts"
-    run_fdtget_test "node2" merge-overlay-path.test.dtb -l /fragment@0/__overlay__
+    # fragment cannot be referred to by its path, since the overlay fragments
+    # are only added after the merge
+    run_sh_test "$SRCDIR/dtc-checkfails.sh" duplicate_node_names -- \
+	-I dts -O dtb "$SRCDIR/merge-overlay-name.dts"
+    run_wrap_error_msg_test "merge-overlay-path.dts:13.15-47 Label or path /fragment@0/__overlay__/node1 not found" \
+	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/merge-overlay-path.dts"
 
     check_tests "$SRCDIR/bad-name-property.dts" name_properties
 
-- 
2.43.0

