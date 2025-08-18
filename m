Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA1721B9E7
	for <devicetree-compiler@vger.kernel.org>; Mon, 18 Aug 2025 10:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755513364; cv=none; b=dWZw5xQT4CV1Mx8bNXAJEqWU7NllZKbIMfDm5PB4ES35nu/dVafZx8Y3VAUnBuDPh16vIQ8FEMPp2QyVbgI6IB/+CHs0mfVZrCciTT+jb+F54elUYUhCg7ZLsgKWh1haMKmSH2jHTmc02jFS+sqhDTBV5HzNwdMxLjb0JHwpgsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755513364; c=relaxed/simple;
	bh=cAaNhBrZaYbs7wPDW8tUGzB49sgEQ1lFwr3juT0PcTA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B/213nWiNiIWXhAPmeoi4VL3zI1LZ/Agqmr1X8EnJF8KWQKKTW9lE//8hWrfbNtfpyj8eqImqnwcKl35ehxzBZHhWv17evRxVdl/nGgpIFPCWpniXIn9WRR7cL4w3/rUCa/zrz+Yk/TX94DQKdMLFxbkkRsHAnUs9mJDY8lSqts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=NkF/EMf7; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="NkF/EMf7"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3b9edf36838so2561881f8f.3
        for <devicetree-compiler@vger.kernel.org>; Mon, 18 Aug 2025 03:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1755513360; x=1756118160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0+GnFKUEjqDOaP+/r8is/6CbZVSSD89Im6fjMXPJuZU=;
        b=NkF/EMf7TdXkN2DQtBBM6g2uS6VS/Ztk0sKv+zOJAVE5HdGVShQuz3RUcxOhur3j7Z
         ITeIY0Uivc/lJdBTPRbxz0C2iRO1oOCLJzryo054IYGyAJvc+LJDG57uOoDZ3kBZAFZ8
         F7JOeckwjMZ8xYw5ieHx1U/NuHAx/fZcFV9/5nx8v8mn+CaZUSTbxe6+n7Z7sx1jNawt
         fbz599wlU0/K7oerg/ImLZWna+u9ypRY68WJd056fArNX2zJ7/2fwpd5L0zYdUJg8LqP
         9qtfzJKhpaPIZvQHWeqQeTz+qdvyg43aWWZenBL2eKLReP53Ssl3PgZ40qu8CKE8K2av
         3OHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755513360; x=1756118160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0+GnFKUEjqDOaP+/r8is/6CbZVSSD89Im6fjMXPJuZU=;
        b=r4LoSvGQLQo9Hje/SOxrXkWExTjSGHk647gIhvk1BL7iJd1B+nrSp/FmNYT+DSo+iG
         0YINtFf+UHKj0898w/kEFggRfgZNt5pVMJGiyJ7sakqwM/XVzEYzdCI+84SsEQXuOKtk
         LNkr85lWV2mcV0byxARWtDt68DWxU7WLifGj+eoWTgHQ9err28r6MAVWUGZCT3M82wWo
         G+mtSMwvUs3S8OwG7/SDxn9tKdEe9Jz7afR6oOMLA5mxiNpRYW/MM8LM5XniiV+XKRS4
         Ek9zgW7RnijPpDmFimmrLqvTKJeiI1VeTZyMprcTK/9otvzmgGYdX2UrsnHlyw210Fq+
         b2jA==
X-Gm-Message-State: AOJu0YytSjxRfe09Ge6kfBx3stT125qLQDVhN9y3fBIj4TiPcd7k3/jw
	QKbfpjCKEnnP8aeXsXRafZaGFnuFb1LTTkcKVvzITfkSUkdAowYd0aigcy4Yo1vOhu+UlTQRwUi
	1HOV4
X-Gm-Gg: ASbGncvQXH36vOxBBQ8FqaXmtd4w2xKuJK8XkmLE0yCKrmh9Bfz29WC/x4vLqbx1IMV
	CHoiAzdFaAzSxXqF2Fe2nAEuSkAFBqM4Wtcg4Y1tNpNYZF6CeWaqIFumOBZ5815LPvm3D8yRyHW
	gxC1/MxSxkd8ZCvRVIZKPlrDo8TuQYT6zX157EXSqUFrj+wUQzpEqC+XSM1cmsV+iTvT/xtYnxP
	BXjBoRkCG8LIaB9GFhrQd6GRs+zkd0j4cqPXsbEmdxBfl/qu+tQ7I9FPaQo6+4u7eCq8+UYX7Ce
	Ms0+620fjzkWcwf2mSO4fuf3Qs47KkmX5czniUrlpf0DejwF+M0st9Uy9vxU3mQtHGFy3fb+lku
	v2drrYZ4dT3Bh6ljJXNDeo320ZC0C90+nVkl0nBCU5ORwYrSFjS1QNAoCrxRRmhH0
X-Google-Smtp-Source: AGHT+IE1P4rUKdtUTnvt/2UjIgjnU5qHNmM7BHVGainkOw5Z4ioF6XflhULF+Y36uN9pQOFxxBjaVw==
X-Received: by 2002:a05:6000:1acf:b0:3b8:d15d:933e with SMTP id ffacd0b85a97d-3bb69699c4emr9191915f8f.56.1755513360240;
        Mon, 18 Aug 2025 03:36:00 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3bb676c96dasm12179744f8f.43.2025.08.18.03.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 03:35:59 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: devicetree-compiler@vger.kernel.org
Cc: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH v3 2/2] livetree: Add only new data to fixup nodes instead of complete regeneration
Date: Mon, 18 Aug 2025 12:35:46 +0200
Message-ID: <b061ee57157fafbb9d5b9b0b86af760d13a04eda.1755512759.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1755512759.git.u.kleine-koenig@baylibre.com>
References: <cover.1755512759.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=9326; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=cAaNhBrZaYbs7wPDW8tUGzB49sgEQ1lFwr3juT0PcTA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoowIF5/jGWy8dG3YD8q35drR4U0229Xi9GQ76c s1Sohe/676JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaKMCBQAKCRCPgPtYfRL+ Tg88B/40ECCr7nSX2tSBZJCfuLeWlNnYydEEBQJepqU3N+P+f6E8J8yAmhtDEqyCePqGX2NFLj8 OXH5mBbizVI+BsOfP0a7GNCTWH0+oxgEeZ+/Zlbj2/0cJniBrlKR24hI+UOolQsGZSBBke4MgWT 9XExcN8eaulIHq88C/OlBR4xuDs+IL1U4KSXNdS5j8FOqFHgi67b0mzGvZsaaBdHfZu+zIldHH8 5R78mH0djYy7dVAfXp2Q5k//T/+KrjSsjRXU0TMkt6owPxQukpfTTzNpusdOJD9fZlM0ccAyEGN WMenZHLLR2NQgpUNPMuyTpkNLTByz9LUo/HJ72/LrBZ/zRLu
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Removing the complete __fixups__ and __local_fixups__ tree might delete
data that should better be retained. See the added test for a situation
that was broken before.

Note that without removing /__fixups__ and /__local_fixups__ in
generate_fixups_tree() and generate_local_fixups_tree() respectively
calling build_and_name_child_node() isn't safe as the nodes might
already exist and then a duplicate would be added. So build_root_node()
has to be used which copes correctly here.

Fixes: 915daadbb62d ("Start with empty __local_fixups__ and __fixups__ nodes")
Closes: https://github.com/dgibson/dtc/issues/170
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 livetree.c              | 127 +++++++++++++++++++++++++++++-----------
 tests/retain-fixups.dts |  29 +++++++++
 tests/run_tests.sh      |   5 ++
 3 files changed, 128 insertions(+), 33 deletions(-)
 create mode 100644 tests/retain-fixups.dts

diff --git a/livetree.c b/livetree.c
index 6127d604d528..2241ec276044 100644
--- a/livetree.c
+++ b/livetree.c
@@ -352,6 +352,63 @@ void append_to_property(struct node *node,
 	p->val = data_append_data(p->val, data, len);
 }
 
+static int append_unique_str_to_property(struct node *node,
+					 char *name, const char *data, int len)
+{
+	struct property *p;
+
+	p = get_property(node, name);
+	if (p) {
+		const char *s;
+
+		if (p->val.len && p->val.val[p->val.len - 1] != '\0')
+			/* The current content doesn't look like a string */
+			return 1;
+
+		for (s = p->val.val; s < p->val.val + p->val.len; s = strchr(s, '\0') + 1) {
+			if (strcmp(data, s) == 0)
+				/* data already contained in node.name */
+				return 0;
+		}
+	} else {
+		p = build_property(name, empty_data, NULL);
+		add_property(node, p);
+	}
+
+	p->val = data_add_marker(p->val, TYPE_STRING, name);
+	p->val = data_append_data(p->val, data, len);
+
+	return 0;
+}
+
+static int append_unique_u32_to_property(struct node *node, char *name, fdt32_t value)
+{
+	struct property *p;
+
+	p = get_property(node, name);
+	if (p) {
+		const fdt32_t *v, *val_end = (const fdt32_t *)p->val.val + p->val.len / 4;
+
+		if (p->val.len % 4 != 0)
+			/* The current content doesn't look like a u32 array */
+			return 1;
+
+		for (v = (const void *)p->val.val; v < val_end; v++) {
+			if (*v == value)
+				/* value already contained */
+				return 0;
+		}
+	} else {
+		p = build_property(name, empty_data, NULL);
+		add_property(node, p);
+	}
+
+	p->val = data_add_marker(p->val, TYPE_UINT32, name);
+	p->val = data_append_data(p->val, &value, 4);
+
+	return 0;
+}
+
 struct reserve_info *build_reserve_entry(uint64_t address, uint64_t size)
 {
 	struct reserve_info *new = xmalloc(sizeof(*new));
@@ -914,11 +971,12 @@ static bool any_fixup_tree(struct dt_info *dti, struct node *node)
 	return false;
 }
 
-static void add_fixup_entry(struct dt_info *dti, struct node *fn,
-			    struct node *node, struct property *prop,
-			    struct marker *m)
+static int add_fixup_entry(struct dt_info *dti, struct node *fn,
+			   struct node *node, struct property *prop,
+			   struct marker *m)
 {
 	char *entry;
+	int ret;
 
 	/* m->ref can only be a REF_PHANDLE, but check anyway */
 	assert(m->type == REF_PHANDLE);
@@ -935,32 +993,39 @@ static void add_fixup_entry(struct dt_info *dti, struct node *fn,
 
 	xasprintf(&entry, "%s:%s:%u",
 			node->fullpath, prop->name, m->offset);
-	append_to_property(fn, m->ref, entry, strlen(entry) + 1, TYPE_STRING);
+	ret = append_unique_str_to_property(fn, m->ref, entry, strlen(entry) + 1);
 
 	free(entry);
+
+	return ret;
 }
 
-static void generate_fixups_tree_internal(struct dt_info *dti,
-					  struct node *fn,
-					  struct node *node)
+static int generate_fixups_tree_internal(struct dt_info *dti,
+					 struct node *fn,
+					 struct node *node)
 {
 	struct node *dt = dti->dt;
 	struct node *c;
 	struct property *prop;
 	struct marker *m;
 	struct node *refnode;
+	int ret = 0;
 
 	for_each_property(node, prop) {
 		m = prop->val.markers;
 		for_each_marker_of_type(m, REF_PHANDLE) {
 			refnode = get_node_by_ref(dt, m->ref);
 			if (!refnode)
-				add_fixup_entry(dti, fn, node, prop, m);
+				if (add_fixup_entry(dti, fn, node, prop, m))
+					ret = 1;
 		}
 	}
 
 	for_each_child(node, c)
-		generate_fixups_tree_internal(dti, fn, c);
+		if (generate_fixups_tree_internal(dti, fn, c))
+			ret = 1;
+
+	return ret;
 }
 
 static bool any_local_fixup_tree(struct dt_info *dti, struct node *node)
@@ -985,7 +1050,7 @@ static bool any_local_fixup_tree(struct dt_info *dti, struct node *node)
 	return false;
 }
 
-static void add_local_fixup_entry(struct dt_info *dti,
+static int add_local_fixup_entry(struct dt_info *dti,
 		struct node *lfn, struct node *node,
 		struct property *prop, struct marker *m,
 		struct node *refnode)
@@ -1016,30 +1081,35 @@ static void add_local_fixup_entry(struct dt_info *dti,
 	free(compp);
 
 	value_32 = cpu_to_fdt32(m->offset);
-	append_to_property(wn, prop->name, &value_32, sizeof(value_32), TYPE_UINT32);
+	return append_unique_u32_to_property(wn, prop->name, value_32);
 }
 
-static void generate_local_fixups_tree_internal(struct dt_info *dti,
-						struct node *lfn,
-						struct node *node)
+static int generate_local_fixups_tree_internal(struct dt_info *dti,
+					       struct node *lfn,
+					       struct node *node)
 {
 	struct node *dt = dti->dt;
 	struct node *c;
 	struct property *prop;
 	struct marker *m;
 	struct node *refnode;
+	int ret = 0;
 
 	for_each_property(node, prop) {
 		m = prop->val.markers;
 		for_each_marker_of_type(m, REF_PHANDLE) {
 			refnode = get_node_by_ref(dt, m->ref);
 			if (refnode)
-				add_local_fixup_entry(dti, lfn, node, prop, m, refnode);
+				if (add_local_fixup_entry(dti, lfn, node, prop, m, refnode))
+					ret = 1;
 		}
 	}
 
 	for_each_child(node, c)
-		generate_local_fixups_tree_internal(dti, lfn, c);
+		if (generate_local_fixups_tree_internal(dti, lfn, c))
+			ret = 1;
+
+	return ret;
 }
 
 void generate_label_tree(struct dt_info *dti, const char *name, bool allocph)
@@ -1052,29 +1122,20 @@ void generate_label_tree(struct dt_info *dti, const char *name, bool allocph)
 
 void generate_fixups_tree(struct dt_info *dti, const char *name)
 {
-	struct node *n = get_subnode(dti->dt, name);
-
-	/* Start with an empty __fixups__ node to not get duplicates */
-	if (n)
-		n->deleted = true;
-
 	if (!any_fixup_tree(dti, dti->dt))
 		return;
-	generate_fixups_tree_internal(dti,
-				      build_and_name_child_node(dti->dt, name),
-				      dti->dt);
+	if (generate_fixups_tree_internal(dti, build_root_node(dti->dt, name), dti->dt))
+		fprintf(stderr,
+			"Warning: Preexisting data in %s malformed, some content could not be added.\n",
+			name);
 }
 
 void generate_local_fixups_tree(struct dt_info *dti, const char *name)
 {
-	struct node *n = get_subnode(dti->dt, name);
-
-	/* Start with an empty __local_fixups__ node to not get duplicates */
-	if (n)
-		n->deleted = true;
 	if (!any_local_fixup_tree(dti, dti->dt))
 		return;
-	generate_local_fixups_tree_internal(dti,
-					    build_and_name_child_node(dti->dt, name),
-					    dti->dt);
+	if (generate_local_fixups_tree_internal(dti, build_root_node(dti->dt, name), dti->dt))
+		fprintf(stderr,
+			"Warning: Preexisting data in %s malformed, some content could not be added.\n",
+			name);
 }
diff --git a/tests/retain-fixups.dts b/tests/retain-fixups.dts
new file mode 100644
index 000000000000..ec09db8b441c
--- /dev/null
+++ b/tests/retain-fixups.dts
@@ -0,0 +1,29 @@
+/dts-v1/;
+/plugin/;
+
+/ {
+	fixup-node {
+		property = <0xffffffff>;
+		property-with-fixup = <0xffffffff>;
+		property-with-label = <&somenode>;
+		property-with-label-and-fixup = <&somenode>;
+	};
+
+	label: local-fixup-node {
+		property = <0xffffffff>;
+		property-with-local-fixup = <0xffffffff>;
+		property-with-local-label = <&label>;
+		property-with-local-label-and-fixup = <&label>;
+	};
+
+	__fixups__ {
+		somenode = "/fixup-node:property-with-fixup:0", "/fixup-node:property-with-label-and-fixup:0";
+	};
+
+	__local_fixups__ {
+		local-fixup-node {
+			property-with-local-fixup = <0x00>;
+			property-with-local-label-and-fixup = <0x00>;
+		};
+	};
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index fecfe7cc09b3..1c9278d93689 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -666,6 +666,11 @@ dtc_tests () {
         run_test dtbs_equal_ordered $tree.test.dtb $tree.test.dts.test.dtb
     done
 
+    # Check preservation of __fixups__ and __local_fixups__
+    run_dtc_test -I dts -O dtb -o retain-fixups.test.dtb "$SRCDIR/retain-fixups.dts"
+    run_fdtget_test "/fixup-node:property-with-fixup:0 /fixup-node:property-with-label-and-fixup:0 /fixup-node:property-with-label:0" retain-fixups.test.dtb /__fixups__ somenode
+    run_fdtget_test "property-with-local-fixup\nproperty-with-local-label-and-fixup\nproperty-with-local-label" -p retain-fixups.test.dtb /__local_fixups__/local-fixup-node
+
     # Check -Oyaml output
     if ! $no_yaml; then
             for tree in type-preservation; do
-- 
2.50.1

