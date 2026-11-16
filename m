Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794873541;
	b=MZOKPWc1L1MEkbf3fWPqXXZL11xKXChaIsiPmjK+cO6sNpuN7McR0vt9NJ+eZQS7nc3o
	 lP3+LKJrWpgr/kx3JVE5D2GNyVaEtweeE+/DCVJBUrdAZVqaweUB22dre3/R7be8yHJiy
	 1p8Aui2+8r+KlWQQesyejYum3EgaTOVjEz1o3fZ9EDsDXwc7C/po0LCHyMVVmm7c22Fxs
	 zs4vL3S9pO2ibh2+32VSzTVjfhSghJwF1utiIlY8aYG6j7aa2cwhYuKhjGH+moAk+xVvf
	 YVR9aJH1Wfl1bHTnmT7E8ZDzmOmPL9d4LKHTJwcwAizgIADi9VLuOU7uqVYQgsxr7OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794873541;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IkBGwRMRTXK8mpQAYtBNfSHqrAMhAWeCvCnekEruC44=;
	b=F17zx0AVWcYTwC+SMoQtzMxBFBtDb/tVpfmp8WVQmGeHK9GMyvm5poVRGNCjz+KJslSR
	 Xk6MIiKoi+NFzArV961i0yEeqR7rxTj8OAWfidf/JJKfHXVHE01n20tR/45Xj5CAolB4i
	 mxNlfwR5+ldD70/+GN9+mp8x5Ouzig9j63REDLb38GSYYEGZS3jYFxZaWkWUuezT+BP/v
	 jeMtE2/Zko3Rr8bPDpFJl2sZ+xAjBURRn1UYZmnmrjQONGvbvtCLddtlxlvoRt29R8Rk5
	 LgAFXOiKrbBVOHw2yOp5umLyFeRaWIqoDzyK7P0Iv0jqAgZS9YZB6EtpWgaifFWkwGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=HGyFoq6y;
	arc=none smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3693A606A323
	for <devicetree-compiler@vger.kernel.org>; Mon, 16 Nov 2026 23:59:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3693A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=HGyFoq6y
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-85c1135c286so3752022a34.1
        for <devicetree-compiler@vger.kernel.org>; Mon, 16 Nov 2026 15:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794873540; x=1795478340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IkBGwRMRTXK8mpQAYtBNfSHqrAMhAWeCvCnekEruC44=;
        b=HGyFoq6ycdWH1ZTx0w3aTBUVVKlP8Gs3bmcCDudcvXMKNCjEEKM8iICM+BmMg+nZ0E
         ffz0tZ11l+EtCC+iHDTtzhHBqg2sSPL0RTBkMjrY+l/HSs0Bp72fBhINdE7D2FoN0JTo
         OIbT90boWTO8PV8Qg0rdEnobYXfc8CESxZaP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794873540; x=1795478340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IkBGwRMRTXK8mpQAYtBNfSHqrAMhAWeCvCnekEruC44=;
        b=eL61Oeey13aILh1loqP7IA8rJK8CgG9K3mWPSVPri2n0Jr1P6W7StRBpxYmr/FjF/p
         g9MNBSaMqAwocIiXCTGx55MAWEodWtHTrVg0HqvZnVd0ehOcckCy8ffKhhxCt8qe2n4s
         tVxczNvPvsIOODh18pY42tyx6JS3JjtnS7uIyN6ACNNLEYm4i3cX65ssqiw1UX1p6/K9
         TjhH3SfYg/moTo6vUDGVewFx/JQL0hxEEhqtKKM8wmMzKE7IQaWKb8gTyIuuvgPP6Sb3
         DvZa0gOAkb+GIFEDkR/zMnBI1kh94S2ysVKGMrbhPzsH/fZzZel0zcAshcNMg0JH2XIM
         03yw==
X-Gm-Message-State: APuU4Z+YNCkIw4Wp9ApH+fvq1gVQBtFDR6DpWUY5EF78PvqWGjIsGSoW
	6TDgW0ooSmfsraal3tG3EXysY8TxmJRzMKFS42E2g+7mVj3KP2Pnb4daP0JhHhm4P+IoXXcAfXI
	+kSoSww==
X-Gm-Gg: AYBFou1rLDK5ZIXBJ3OV2Nw73vun2PCIMnR75xGvQkv/oOTab9ASdSDIjdNcZ9arQRW
	kHq7vuuNo93X/nBYMWJKW4Zjgixnkpvl7OQP0CTZ3eoYt06yliJCkLDOXY9I/OK44cA5p9SkFT8
	0BAIWqSUhGGZhRq3Jx2TPSp5VjbKSsS5xprrGj97q13cdomPuKIkyot+Rx6F/3BU9Zqanu77iMz
	zkjmXg443YvioiQVpQ8Ysz6Kz8Q1la4x2wHVhkQgvM+Fa4snE+wGQOFRkDLjGo2gj94Nb11xgBF
	cJKEVgGnSlcQI+4RjoRTXjt8ZrMV+Ayfp/HFOvnCl0rWlJahp3lBZ1qxp8LdQSQtt8FgKWAr41Z
	wUcjyef76IZ075k97ieGUht9phtO5H9NFJOQi51qjuFXZK46ezWToSrnSXx4/ddD0zAHFlggX7j
	Yl5WpsQbuX6lkiROkaZeJlA3wkJmjr6jDuwed2yv8ys/oa/opd16Mesq1e3oNi3Ccjt1dRNpw2y
	PqwfmJQVYN1/dWES8FXnUPmTT1CZjPaVisd/Tqe00JLwh2kuZcJuHjKopwE6egasYJX+hGuk+C7
	qAiv8+x7LLc0/8qtCxKYDWLnvXacSfF7+N5GK+9k0ImPoDIe6gxqScwXqfpvk30tLQw/KdwXv0I
	ZWb/kb3FJg8CMXJ3FtDY9vG1r0wj1L/5zndvt7mcCWTo=
X-Received: by 2002:a05:6830:25d0:b0:862:ba3a:f05c with SMTP id 46e09a7af769-862ba3af298mr5567743a34.9.1794873535421;
        Mon, 16 Nov 2026 15:58:55 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86287f0e0fcsm12210177a34.2.2026.11.16.15.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:58:53 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Herve Codina <herve.codina@bootlin.com>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v4 09/10] dtc: Move labelled-reference handling out of the grammar
Date: Mon, 16 Nov 2026 16:58:03 -0700
Message-ID: <20261116235813.935070-10-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116235813.935070-1-sjg@chromium.org>
References: <20261116235813.935070-1-sjg@chromium.org>
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

The grammar action for a top-level label: &ref { ... } holds its merge
logic, which adds the label to the node referred to.

Move it into merge_ref(), passing it a struct fragment with the label.

The output does not change. In a plugin, the error for a label-relative
reference now gives the position of the reference rather than the label,
since the problem is with the reference. Update the
merge-labelled-relative.dts test to match.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v4:
- Explain why a fragment which adds a label does not go in an overlay
- Free the fragment after merging it
- Report the label-relative error at the reference, not the label

Changes in v2:
- Combine merge_labelled_ref() into merge_ref()
- Use dt_ref instead of fragment_ref

 dtc-parser.y       | 14 +++++---------
 livetree.c         | 11 ++++++++---
 tests/run_tests.sh |  2 +-
 3 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index c85b77d..6f7ef24 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -180,16 +180,12 @@ devicetree:
 		}
 	| devicetree DT_LABEL dt_ref nodedef
 		{
-			struct node *target = get_node_by_ref($1, $3);
-
-			if (($<flags>-1 & DTSF_PLUGIN) && is_ref_relative($3))
-				ERROR(&@2, "Label-relative reference %s not supported in plugin", $3);
+			struct fragment *f;
 
-			if (target) {
-				add_label(&target->labels, $2);
-				merge_nodes(target, $4);
-			} else
-				ERROR(&@3, "Label or path %s not found", $3);
+			f = build_fragment_ref($2, $3, &@3, $4);
+			if (!merge_ref($1, f, $<flags>-1 & DTSF_PLUGIN))
+				treesource_error = true;
+			free_fragment(f);
 			$$ = $1;
 		}
 	| devicetree dt_ref nodedef
diff --git a/livetree.c b/livetree.c
index 290467f..cf6849a 100644
--- a/livetree.c
+++ b/livetree.c
@@ -541,10 +541,13 @@ bool is_ref_relative(const char *ref)
 }
 
 /*
- * Merge a fragment which refers to a label or path into the node it refers to.
+ * Merge a fragment which refers to a label or path into the node it refers to,
+ * adding any label in the fragment to that node.
  *
  * In a plugin, a path always refers to the base tree and a label may do so, if
- * it is not found. In both cases, the fragment becomes an overlay fragment.
+ * it is not found. In both cases, the fragment becomes an overlay fragment,
+ * unless it adds a label, since dtc cannot put a label on the target of an
+ * overlay fragment.
  *
  * Returns true on success, false on an error, which has been reported.
  */
@@ -561,7 +564,7 @@ bool merge_ref(struct node *dt, struct fragment *f, bool plugin)
 				     f->ref);
 			ok = false;
 		}
-		if (f->ref[0] == '/' || !target) {
+		if (!f->label && (f->ref[0] == '/' || !target)) {
 			/* Add a fragment@N node for the reference */
 			add_orphan_node(dt, f->node, f->ref);
 			return ok;
@@ -573,6 +576,8 @@ bool merge_ref(struct node *dt, struct fragment *f, bool plugin)
 			     "Label or path %s not found", f->ref);
 		return false;
 	}
+	if (f->label)
+		add_label(&target->labels, f->label);
 	merge_nodes(target, f->node);
 
 	return ok;
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 7f9a24a..62732a4 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -781,7 +781,7 @@ dtc_tests () {
 	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/merge-first-ref.dts"
     run_wrap_error_msg_test "merge-first-ref-relative.dts:5.15-7.3 Label-relative reference label/node not supported in plugin" \
 	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/merge-first-ref-relative.dts"
-    run_wrap_error_msg_test "merge-labelled-relative.dts:8.1-10 Label-relative reference baselabel/subnode not supported in plugin" \
+    run_wrap_error_msg_test "merge-labelled-relative.dts:8.11-31 Label-relative reference baselabel/subnode not supported in plugin" \
 	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/merge-labelled-relative.dts"
     run_wrap_error_msg_test "merge-path-relative.dts:8.1-18 Label-relative reference baselabel/node not supported in plugin" \
 	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/merge-path-relative.dts"
-- 
2.43.0

