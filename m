Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793994803;
	b=YIK3Ifjvjt/RPcfsdmCqqFzzLG0yWkYcaGdhwC6RSJTuE/qLzvj1Bn4IR/7Yed2eRPwn
	 LI3I2F+3hBGMHA7F9ahuTSuacSbKzm7HfBr+/zTHnQ0PywWQA3R7B43rwSbAFCSfZpoFQ
	 nWo86IRpyE3coh/mhwIxJdYMXr8+q1K7e91vmmn3b3VWKoa49FMnaeqLJziL8sVK53CNR
	 rvHtfiUvi9/5QAmPVBLMuWdYLrqCxCntJ/VQB9fyrHEh+DD2pSLWqojUbRnByDB9YYaXW
	 rxju+ecs6BEVdtG7NKQUZajZS5chZ9J0NAHnLBmZDKW2nO/I1uGYzoLITtd86NN40Cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793994803;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ac1kKTyiTKkX5cixL1wyMaH1snoItHMm+fhKgk0GVQc=;
	b=pIfL6eNn2xUxP8VfqykXOy38VmumzZvWDy42MfkIBaor7ILi3Y8Dy3dG/EA1dt8IXbY/
	 E2pw+Bk7TsSeoHpbR87hKIt415DfMnBqH7iqHFMszny5dMGQKZVlm2+5weDYYicQm15+A
	 wR8oSPO1zfUEkQAZJP5dSh2KQalHyH08PQ5MjG1S2w3UvHGVQfZU5fY8ZSJ0kjmNE+qwz
	 pkVPF6DFylRzRhy5BoOegZi99yd/sUL4wiWkZlTC7yG7BQ/v5cCVXu3fbLP269EAX75zz
	 aROpxl9NeU32XVK/nyPu98GPI/kCyigwRsNFECeLxwi8pY3ae7Fu0cxEvCPtXfqR2KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=iqqa7Vol;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81423606A330
	for <devicetree-compiler@vger.kernel.org>; Fri,  6 Nov 2026 19:53:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81423606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=iqqa7Vol
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-7143451981fso673671eaf.3
        for <devicetree-compiler@vger.kernel.org>; Fri, 06 Nov 2026 11:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793994802; x=1794599602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ac1kKTyiTKkX5cixL1wyMaH1snoItHMm+fhKgk0GVQc=;
        b=iqqa7VolMqlQJQeirqbdOlbt8+3lS7OzzR9BvJy58gSTOTit460JOBPNATcHhhfXQf
         hLUk6mk+68VxvTInA0ZweJrdyLBfhovb496GvCcqbOWdMuuPGqGu1s8LVCaXwkyzIuaI
         rtfveCkwHy5H4n6AmkVToU1VbVm/cnxG5nBnc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793994802; x=1794599602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ac1kKTyiTKkX5cixL1wyMaH1snoItHMm+fhKgk0GVQc=;
        b=MIOzzWZOH1W0JN2VGsJh15Cti0A639yUZ8ko+DG/TguwfDOY6aZEzXpyH9SdtP+KaB
         2hHn0mnYD6weeADAcoNkryuTJ4jCBp9lIckc/Fqrd87nNsN7uTENTCuWGnkZMvklCXE1
         3SBVUGONz/Q5QwUGXDabJ1AYo2tP6FiPaeZFNxjbXYRMWN3eynqYXoXZFKAziN06TQuE
         WuI06Mcc40DRmDKjou8qwASt3jUoZ/cOw/EdLxG043r4MJsCtC+j/gkw4V6qsMe8CXUr
         LnScUrYbqlJIeCIdNhh5aiKNcsfL7NT5CmaIWMrMdGHIKGDWRWB2Q5eMgcU62pOTXaVt
         uTdw==
X-Gm-Message-State: APuU4Z8MJ5DVhdmne2WHU9XtLm07Y3bHnka+/G94d2Zor+7pncFT6FTp
	jbNQEFX7+6mcCYichh8a9XKcVjmh3/uZwMNao/lTQj3bsclr5/vsgYr8ZK2P+Aabh7r7HUMMUNB
	o7gqL8Q==
X-Gm-Gg: AYBFou0UxXdvcp/0L3mkOh4SecNuU3EtH4aXDWFhFfD/bVBr7VRfASh8DpK/anwW5rU
	boK9Mv/3PMOVrLdJ/64VL2woBnLMeE0h2zPxdl6ktPAyZnJxiIBNNg7/TjMXUzLrOw1BI/qerG3
	mIUS/1yXrF86KNiSVWfy/dWIJ2e3p/hvKvlRLQF9EdGnha7pfCP7CeO06MFVgPw+/f/oGmBp2zO
	tgrAF9ZknjxgCfj4f2dnFHb4G7Q3osls6VT7J8FnGewK7rNu9v3xv/HhXN42ilZsrzyw7OhtCDk
	zHg6TSjwHAYEKvixCleip/6rKep2ttXgOIVzsIUjIZQngCAmWdkcKmhMWagwmQNzro2Ew9xDgG3
	0WyCpzZflu1PGGhfq6ZIh3UeClEbGgXL/VQ0NdWI+h5n/Z0qoCZDvEYR0HUCgjt3lRPZPatWyKV
	ZQPW9AVAX7RN6+go6fWAKbHPuGMFq5LeiyWL2Z4pcjR33saCU511hBhrRlXl5rC3i2zbQBw0ciR
	vvJ60BZ/kDUFF+HeaCk1g9tMw1pLUdr5Lvt/84NxW0BPNuSQPj/l2B+DF1n7E5WdXnrYQRi184b
	oA6o1MbFCCJPPZf6DZi6KuLsbydICh3CcaBM+orOMQotucYyi9NPVb98MYXycba0kSSRBKbwzuV
	YLGeSRuIcE7YeDkGv6NyJ
X-Received: by 2002:a05:6820:410e:b0:702:dd8d:316e with SMTP id 006d021491bc7-716e77f47eemr1601994eaf.25.1793994802337;
        Fri, 06 Nov 2026 11:53:22 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ad97a37725sm2825498fac.11.2026.11.06.11.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 11:53:21 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Herve Codina <herve.codina@bootlin.com>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v3 08/18] dtc: Merge &{label} in a plugin as with &label
Date: Fri,  6 Nov 2026 12:51:35 -0700
Message-ID: <20261106195159.2623314-9-sjg@chromium.org>
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

In a plugin, &label { ... } is merged into the labelled node if the
label is in the plugin, as of commit 0fcffda15e9f ("Merge nodes with
local target label references"). But &{label} { ... } always becomes a
separate fragment@N node, since anything in braces is lexed as a path
reference. This adds a fragment which is not needed, which that commit
aims to avoid, and fails with FDT_ERR_NOTFOUND if the label is not
within a fragment.

Treat a reference as a path only if it starts with '/', so that both
forms are merged into the node. This changes the output for such a file.
Applying an overlay which already works gives the same result, apart
from the order of the properties and that a later &label { ... } now
overrides an earlier &{label} { ... }, as the source order suggests.

Other references are not affected. An absolute path still becomes a
fragment@N node, as does a label which is not in the plugin, since it
may be in the base tree.

This also means that dtc does not need to record whether a reference is
written in braces. The merge code, which is about to move out of the
grammar, can tell a path from a label by looking at the reference.

Update the merge-label-braces.dts and merge-label-order.dts tests to
match.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---

(no changes since v2)

Changes in v2:
- Add new patch for &{label} in a plugin

 dtc-parser.y                 | 10 +++++++---
 tests/merge-label-braces.dts |  2 +-
 tests/merge-label-order.dts  |  2 +-
 tests/run_tests.sh           | 10 +++++-----
 4 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index c58a66d..3614d71 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -193,6 +193,8 @@ devicetree:
 		}
 	| devicetree DT_PATH_REF nodedef
 		{
+			struct node *target = get_node_by_ref($1, $2);
+
 			/*
 			 * We rely on the rule being always:
 			 *   versioninfo plugindecl memreserves devicetree
@@ -201,10 +203,12 @@ devicetree:
 			if ($<flags>-1 & DTSF_PLUGIN) {
 				if (is_ref_relative($2))
 					ERROR(&@2, "Label-relative reference %s not supported in plugin", $2);
-				add_orphan_node($1, $3, $2);
+				/* A path is in the base tree and a label may be */
+				if ($2[0] == '/' || !target)
+					add_orphan_node($1, $3, $2);
+				else
+					merge_nodes(target, $3);
 			} else {
-				struct node *target = get_node_by_ref($1, $2);
-
 				if (target)
 					merge_nodes(target, $3);
 				else
diff --git a/tests/merge-label-braces.dts b/tests/merge-label-braces.dts
index d5f8d0f..569e7f8 100644
--- a/tests/merge-label-braces.dts
+++ b/tests/merge-label-braces.dts
@@ -6,7 +6,7 @@
 	};
 };
 
-/* This becomes an overlay fragment, even though the label is in the plugin */
+/* A label in the plugin itself is merged, however it is written */
 &{label} {
 	prop;
 };
diff --git a/tests/merge-label-order.dts b/tests/merge-label-order.dts
index f7923a0..40fa668 100644
--- a/tests/merge-label-order.dts
+++ b/tests/merge-label-order.dts
@@ -7,7 +7,7 @@
 	};
 };
 
-/* The fragment for &{label} is applied last, so "second" wins */
+/* The last definition wins */
 &{label} {
 	p = "second";
 };
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 2d392e2..0aaa29c 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -812,17 +812,17 @@ dtc_tests () {
     run_fdtget_test "/node" merge-labelled-plugin.test.dtb /__symbols__ newlabel
     run_fdtget_test "value" merge-labelled-plugin.test.dtb /node prop
 
-    # In a plugin, &{label} becomes an overlay fragment, even if it is found
+    # In a plugin, &{label} is the same as &label
     run_dtc_test -I dts -O dtb -o merge-label-braces.test.dtb \
 	"$SRCDIR/merge-label-braces.dts"
-    run_fdtget_test "" merge-label-braces.test.dtb /fragment@0/__overlay__ prop
-    run_fdtget_test "node\nfragment@0\n__local_fixups__" merge-label-braces.test.dtb -l /
+    run_fdtget_test "" merge-label-braces.test.dtb /node prop
+    run_fdtget_test "node" merge-label-braces.test.dtb -l /
 
-    # The fragment for &{label} is applied after any local merges
+    # The last definition wins, with no fragment for &{label}
     run_dtc_test -I dts -O dtb -o merge-label-order.test.dtb \
 	"$SRCDIR/merge-label-order.dts"
     run_fdtget_test "third" merge-label-order.test.dtb /fragment@0/__overlay__/foo p
-    run_fdtget_test "second" merge-label-order.test.dtb /fragment@1/__overlay__ p
+    run_fdtget_test "fragment@0\n__fixups__" merge-label-order.test.dtb -l /
 
     # In a plugin, / { ... } and &{/} { ... } are not the same thing
     run_dtc_test -I dts -O dtb -o merge-root-plugin.test.dtb \
-- 
2.43.0

