Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795810533;
	b=XP9ChgQusxOHFX02qo76Ubt+42GY6ZU0/f0Xy9DNjq3rB0DaL8VwBrm1991WAZ1d3w3L
	 eal6WaPiKt38lcB47GnIPGg+18fX3K2Viy89mUINIjtIymfRRHLSC/dS13ryiYAioIc+e
	 6LCwhRZ7Mqmsx5m8uw1WJDUkmWy6Y5tnnr9PJvSw328wf+ttmCBW3xcRKrj4TjTy0b/RU
	 qAOC0OBwtEk/oUc2HcRXfeVchbFqoI0w9QjRKbNaVSydINdmsZHDtM1glLQE+oWY2mF1w
	 rEI7gdosEIR/COB949kyTxz8TO12HdPzjj5yOxsZpGteeCX51/93spAcDfGHCAH0vzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795810533;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dxQjYPWRqc5QczCMFPbnNY5JZVvP1qj4qebfuXGo/90=;
	b=ro10NMqtZOMpOymKpZ7aKW8kRGI9tFb2cFFZitlzisO6NjyQcHcLEzbIXKWqf9W9+x0e
	 CjfDe/4JtSCRf4bCK3EtZGM+ARhiN2/Csj+Mxt6rQQ5uNaoCKNeNOeQoIxh7o6Yli5geE
	 RcuDTYyEB4AwuZUjr8cmL/CfLGJvdTg6eaUHSJoA2NM4nM1+FZQu9KJ4bU9vIjzRNsj5E
	 gMTjOGHBgcetlj7Vy+C3ICnIePi5CJuMxHdjnhOM9kVKSbMKJaKVqZJ7llHt/VeXPh19P
	 1GNw+9bvfqRxuBFSO84ExE8mLw1UfHjwNYcflCVjTf46utQTjSVLkTLI59iUTlBO7nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="BQhI/tlQ";
	arc=none smtp.remote-ip=209.85.167.180
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42160606A31C
	for <devicetree-compiler@vger.kernel.org>; Fri, 27 Nov 2026 20:15:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42160606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=BQhI/tlQ
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-51f2e9e6987so6349435b6e.1
        for <devicetree-compiler@vger.kernel.org>; Fri, 27 Nov 2026 12:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795810532; x=1796415332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dxQjYPWRqc5QczCMFPbnNY5JZVvP1qj4qebfuXGo/90=;
        b=BQhI/tlQBNIGduRDbFsf590tSkGaxAZc7dKc+xm+aSpubICNNyiS93MOmJSsto8fjs
         e77j/tUcK1NhFWtn14sL1c9O92jM2ANxRH8mxoUhjc6mrp3AOSBKlvlFERYfxlB/4dCW
         2MUxuNTVIYEZvgxuoGr8mIqrpA1Bg+4t1mukY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795810532; x=1796415332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dxQjYPWRqc5QczCMFPbnNY5JZVvP1qj4qebfuXGo/90=;
        b=20/49yk7inZe9pUAZ5lFtaTcSXLd439JnZAEEFsP09nX6gFhyx1FQsDcY8LXsZqVIK
         RYpH+dI3yqUb76jkK8j12IYgMN86ERD5/p9wQriAcsGlKJgyBlx363rEousf+PtJ6mmd
         wvPy59wDBWWHozldeuG5EdnRIACl6t+rL/Al4LgwR879D7Mc/Ig8P210sqtFGjvBze6j
         ok0fIki47pXoF4PJ1GKLB6jK+YktGjtLvRVGY9aRTIi0caDuYskQQhCmON+n1P3GOMdh
         otv3qLrtkFvA5pagH0bn+PUSY4g70M1stEsFKkMRItaEsv/86sIxEFRk2KrrA5a5eg7M
         GiyQ==
X-Gm-Message-State: APuU4Z8lSLWnxPKFrgMbSk6JmXsBeVK3c0hascobywZ1+pfSSJ/LsEje
	vWrDUH40btH6UBsbySHhzZdTLEERek28XHmL5WTi9w/iM2H0CKcj7iAJHk1CwrojAB7jr+JzDcJ
	cHGyrFA==
X-Gm-Gg: AZFdTZfV2x/oAmitYDD4k4wLHJs9zIzz7b9n12+a4ABVFWVTzZRmJEj4FXT/0i3sP4s
	3KtA4dEzLMAoo62joW90KzoVyYi6/qOix89Oji6DRaxxgXLKvwIJ9oTN8rB7aoUq4UbWxW3U50u
	PovGVtdbCP46e2C4lDCV3+Yqx5nG4xUFliLl73sx5a8HWxAsdV4JQV3JgzG3vUZW56z3WIlbLtp
	Ib3DrYo+f3e7/Y5BK/eywyopqka8zHRcAJusrupn2rf7D8w6jFNFoqSc9i0ktqBQefqRQsifPt7
	IEsrkkHP1a05mMVM3yQw05d3SHwFlDezgX8nIMj439hGpRbM8GzaxsFdIII91hp/zqdvaWuVMqY
	NTPE+/0dB3vUllUXAG7U2tlzS8G3AO0ryqhIXRQydU720dkEUpsPnB7rHVfVhdzNBcY+rz4F4Hs
	ilEidagpzMbJLAAeUiMxQk/riAOCsyrDG6coRioUrN7zEE+SHr5iscssZdgyrUyb6l5wssSCLK+
	dUF2bGx80vclXnEuCufk1iRDGunJZXDVDDatRXzOYYYHKJXzjImFg3CGYyy7EQe5G+9XmiXJ/M3
	0i2GXY9PpIeRMYw5T/hXAfj2u7EuNQZEOdxqhgzyEclerJWZgb5Id2YwNAP5z7i7h1uegL0sM61
	CRwTLGr21AAGGhw/dPUWR
X-Received: by 2002:a05:6808:2f19:b0:4f4:e6eb:1283 with SMTP id 5614622812f47-57a0b8505d7mr17858310b6e.28.1795810531938;
        Fri, 27 Nov 2026 12:15:31 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a35e5ab03sm18881561b6e.16.2026.11.27.12.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:15:31 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Herve Codina <herve.codina@bootlin.com>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v6 6/6] dtc: Allow a label on the first source layer
Date: Fri, 27 Nov 2026 13:14:49 -0700
Message-ID: <20261127201457.1837712-7-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127201457.1837712-1-sjg@chromium.org>
References: <20261127201457.1837712-1-sjg@chromium.org>
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

In a plugin, a label on the first source layer, as in
label: &ref { ... };, gives a syntax error, although a later source
layer accepts it.

Add an optional label, maybe_label, to the grammar rule for this,
passing the label to merge_first_ref(), which adds it to the
__overlay__ node, as for a later source layer. Use maybe_label for a
later source layer too, so its labelled and unlabelled rules become one.
Outside a plugin, this gives the same 'Label or path ... not found'
error as &ref { ... }; does.

A memreserve can also have a label. With the memreserves rule being
right-recursive, the parser must decide whether the memreserves have
ended when it sees the label, before it knows which this is. Make the
rule left-recursive to avoid this conflict, building the list with
add_reserve_entry(), and drop chain_reserve_entry() which is no longer
used. The memreserves stay in the same order, since each one is now
added to the end of the list, rather than the start.

The comment about $<flags>-1 names nonterminals which no longer exist.
Correct it and put it once above the devicetree rule, rather than in
only some of the actions which rely on it.

Add merge-first-labelled.dts to check this, along with
merge-first-labelled-missing.dts for the error outside a plugin.

Suggested-by: David Gibson <david@gibson.dropbear.id.au>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v6:
- Add new patch to allow a label on the first source layer

 dtc-parser.y                           | 44 +++++++++++---------------
 dtc.h                                  |  2 --
 livetree.c                             | 14 +++-----
 tests/merge-first-labelled-missing.dts |  6 ++++
 tests/merge-first-labelled.dts         | 10 ++++++
 tests/run_tests.sh                     | 13 ++++++++
 6 files changed, 52 insertions(+), 37 deletions(-)
 create mode 100644 tests/merge-first-labelled-missing.dts
 create mode 100644 tests/merge-first-labelled.dts

diff --git a/dtc-parser.y b/dtc-parser.y
index 4a6da6d..2ccd4ab 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -76,6 +76,7 @@ extern bool treesource_error;
 %type <prop> propdef
 %type <proplist> proplist
 %type <labelref> dt_ref
+%type <labelref> maybe_label
 
 %type <node> devicetree
 %type <node> nodedef
@@ -133,9 +134,9 @@ memreserves:
 		{
 			$$ = NULL;
 		}
-	| memreserve memreserves
+	| memreserves memreserve
 		{
-			$$ = chain_reserve_entry($1, $2);
+			$$ = add_reserve_entry($1, $2);
 		}
 	;
 
@@ -153,6 +154,19 @@ memreserve:
 
 dt_ref: DT_LABEL_REF | DT_PATH_REF;
 
+maybe_label:
+	  /* empty */
+		{
+			$$ = NULL;
+		}
+	| DT_LABEL
+	;
+
+/*
+ * The actions which check for a plugin rely on the rule being always:
+ *   headers memreserves devicetree
+ * so $<flags>-1 is what we want (headers)
+ */
 devicetree:
 	  '/' nodedef
 		{
@@ -162,22 +176,17 @@ devicetree:
 		{
 			$$ = merge_nodes($1, $3);
 		}
-	| dt_ref nodedef
+	| maybe_label dt_ref nodedef
 		{
 			struct source_layer *layer;
 
-			layer = build_layer_ref(NULL, $1, &@1, $2);
-			/*
-			 * We rely on the rule being always:
-			 *   versioninfo plugindecl memreserves devicetree
-			 * so $-1 is what we want (plugindecl)
-			 */
+			layer = build_layer_ref($1, $2, &@2, $3);
 			if (!merge_first_ref(&$$, layer,
 					     $<flags>-1 & DTSF_PLUGIN))
 				treesource_error = true;
 			free_layer(layer);
 		}
-	| devicetree DT_LABEL dt_ref nodedef
+	| devicetree maybe_label dt_ref nodedef
 		{
 			struct source_layer *layer;
 
@@ -187,21 +196,6 @@ devicetree:
 			free_layer(layer);
 			$$ = $1;
 		}
-	| devicetree dt_ref nodedef
-		{
-			struct source_layer *layer;
-
-			layer = build_layer_ref(NULL, $2, &@2, $3);
-			/*
-			 * We rely on the rule being always:
-			 *   versioninfo plugindecl memreserves devicetree
-			 * so $-1 is what we want (plugindecl)
-			 */
-			if (!merge_ref($1, layer, $<flags>-1 & DTSF_PLUGIN))
-				treesource_error = true;
-			free_layer(layer);
-			$$ = $1;
-		}
 	| devicetree DT_DEL_NODE dt_ref ';'
 		{
 			struct source_layer *layer;
diff --git a/dtc.h b/dtc.h
index 97db4dc..1a1006c 100644
--- a/dtc.h
+++ b/dtc.h
@@ -313,8 +313,6 @@ struct reserve_info {
 };
 
 struct reserve_info *build_reserve_entry(uint64_t start, uint64_t len);
-struct reserve_info *chain_reserve_entry(struct reserve_info *first,
-					 struct reserve_info *list);
 struct reserve_info *add_reserve_entry(struct reserve_info *list,
 				       struct reserve_info *new);
 
diff --git a/livetree.c b/livetree.c
index 7ade91e..895eb0f 100644
--- a/livetree.c
+++ b/livetree.c
@@ -421,15 +421,6 @@ struct reserve_info *build_reserve_entry(uint64_t address, uint64_t size)
 	return new;
 }
 
-struct reserve_info *chain_reserve_entry(struct reserve_info *first,
-					struct reserve_info *list)
-{
-	assert(first->next == NULL);
-
-	first->next = list;
-	return first;
-}
-
 struct reserve_info *add_reserve_entry(struct reserve_info *list,
 				      struct reserve_info *new)
 {
@@ -546,7 +537,8 @@ static bool is_ref_relative(const char *ref)
 /*
  * Make the tree at *dtp from a first source layer which refers to a label or
  * path, rather than being the root node. This is only valid in a plugin, where
- * the source layer becomes an overlay fragment.
+ * the source layer becomes an overlay fragment, with any label on its
+ * __overlay__ node.
  *
  * Returns true on success, false on an error, which has been reported.
  */
@@ -565,6 +557,8 @@ bool merge_first_ref(struct node **dtp, struct source_layer *layer,
 			     layer->ref);
 		ok = false;
 	}
+	if (layer->label)
+		add_label(&layer->node->labels, layer->label);
 	/* Make a new, empty tree with a fragment@N node for the reference */
 	*dtp = add_orphan_node(name_node(build_node(NULL, NULL, NULL), ""),
 			       layer->node, layer->ref);
diff --git a/tests/merge-first-labelled-missing.dts b/tests/merge-first-labelled-missing.dts
new file mode 100644
index 0000000..9dce5eb
--- /dev/null
+++ b/tests/merge-first-labelled-missing.dts
@@ -0,0 +1,6 @@
+/dts-v1/;
+
+/* Only a plugin can start with a reference, even with a label */
+newlabel: &nosuchnode {
+	prop;
+};
diff --git a/tests/merge-first-labelled.dts b/tests/merge-first-labelled.dts
new file mode 100644
index 0000000..a6450c6
--- /dev/null
+++ b/tests/merge-first-labelled.dts
@@ -0,0 +1,10 @@
+/dts-v1/;
+/plugin/;
+
+/* The parser must tell a labelled memreserve from a labelled source layer */
+mem: /memreserve/ 0x1000 0x100;
+
+/* A label on the first source layer goes on the __overlay__ node */
+newlabel: &baselabel {
+	prop;
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 14a35db..72786c4 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -782,6 +782,8 @@ dtc_tests () {
 	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/merge-first-ref.dts"
     run_wrap_error_msg_test "merge-first-ref-relative.dts:5.1-14 Label-relative reference label/node not supported in plugin" \
 	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/merge-first-ref-relative.dts"
+    run_wrap_error_msg_test "merge-first-labelled-missing.dts:4.11-22 Label or path nosuchnode not found" \
+	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/merge-first-labelled-missing.dts"
     run_wrap_error_msg_test "merge-labelled-relative.dts:8.11-31 Label-relative reference baselabel/subnode not supported in plugin" \
 	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/merge-labelled-relative.dts"
     run_wrap_error_msg_test "merge-path-relative.dts:8.1-18 Label-relative reference baselabel/node not supported in plugin" \
@@ -815,6 +817,12 @@ dtc_tests () {
     run_fdtget_test "/fragment@2/__overlay__" merge-labelled-base.test.dtb \
 	/__symbols__ newlabel3
 
+    # The same applies to a label on the first source layer
+    run_dtc_test -@ -I dts -O dtb -o merge-first-labelled.test.dtb \
+	"$SRCDIR/merge-first-labelled.dts"
+    run_fdtget_test "/fragment@0/__overlay__" merge-first-labelled.test.dtb \
+	/__symbols__ newlabel
+
     # In a plugin, &{label} is the same as &label
     run_dtc_test -I dts -O dtb -o merge-label-braces.test.dtb \
 	"$SRCDIR/merge-label-braces.dts"
@@ -1219,6 +1227,11 @@ fdtoverlay_tests() {
     run_fdtoverlay_test "/node" "/__symbols__" "newlabel3" "-ts" \
 	merge-labelled-base-tree.test.dtb merge-labelled-target.test.dtb \
 	merge-labelled-base.test.dtb
+    run_dtc_test -@ -I dts -O dtb -o merge-first-labelled.test.dtb \
+	"$SRCDIR/merge-first-labelled.dts"
+    run_fdtoverlay_test "/node" "/__symbols__" "newlabel" "-ts" \
+	merge-labelled-base-tree.test.dtb merge-labelled-target.test.dtb \
+	merge-first-labelled.test.dtb
 
     # verify that phandles are not overwritten
     run_dtc_test -@ -I dts -O dtb -o overlay_base_phandle.test.dtb "$SRCDIR/overlay_base_phandle.dts"
-- 
2.43.0

