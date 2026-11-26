Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795718515;
	b=gfW7S6ZSuLzpgQM85Uo7Jajh5sia5tvSlsYYlkCpmsRGyhYAcVuNuqr2lC+rqpOZNLGu
	 VszLk4bgB146Fak+iWMUHvxKYGw/oX/YCoJMP33lOF+4exsLJPpcEK2G6P2S+KVbVoyfU
	 0JEoJgnCWYUskBn8ET0ag/7RDBsXCLAxURQfRiM0V1sivfrByQVcEUac0wG3dDF+XrVqG
	 /E/iCb0nr6VZ5MkhD82HTSRZBHL0+mRxLsExI3/ETNF1WHnDOmI80IXKSlTWkuXjPVg/S
	 H0tC3jCTj9GyrncsqfbrZCm5V9HEUzrwDAf6JP+NmelsnTPCtURvK/pDqXvtHjiF/vA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795718515;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5aPQ3M4CBuu0xCgvRi8QIxRDm5hjwr+PXUhBE6OPxhA=;
	b=DQNXkagMWw3SSw7t1tttstYU1XITTDmicwHAoiXGpfnWSzEXSgpz4FdOcvUy4uFwS1HA
	 IdF0oukis4IPrSgntXBcX/RJ1UgtUoiYRUYcqSyTOmLv+VYqYcIMcxFhnkXMgVtfzk8Tt
	 mEqMHADvavoRdLPejWCnHxpVJnZmtb1xA+Gz5H9TlXO0uPcad+9vNJmLVOb6awfRDcC6X
	 eF2c0IqXBTTb9dnGSC5D3VWDaK0kMzIRTP3W0YUamQr04rfy35j395WUy6/uq37DMZK5P
	 KJpUuntI/XB5t/Vcfm9IECkGK9zs9X9uZ2YrN60bBMv0WV9fLPujuE5cf+6CaVVdclw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=LdbsxgBH;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DB2606A323
	for <devicetree-compiler@vger.kernel.org>; Thu, 26 Nov 2026 18:41:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3DB2606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=LdbsxgBH
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-845788309b4so3417985a34.1
        for <devicetree-compiler@vger.kernel.org>; Thu, 26 Nov 2026 10:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795718513; x=1796323313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5aPQ3M4CBuu0xCgvRi8QIxRDm5hjwr+PXUhBE6OPxhA=;
        b=LdbsxgBHBPZwdkhOl/K3gertfZMQ1s1QPsqrky6vNmBOPXF+1izWrV+1RxnwIgYNEn
         5eKzlEfmTYA02tM+HQpo1fZQzqOid4BwQyCnyagmuMJKR8mpjhxqrZ8vDpuB2vrs2d0+
         mUQaSQDx8vHVR/Zl+g2PCqfo3h6a2LGYSDVXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795718513; x=1796323313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5aPQ3M4CBuu0xCgvRi8QIxRDm5hjwr+PXUhBE6OPxhA=;
        b=v+1/EK28+4X9U1HvE51PvuHYdcE7+m2AXdvDVJ+lxR7JSb496JPiTI6Yw9T1jM/EuP
         eHD59D8LDEpgDJd7OE62DfyDeKfOWkOaFVPtTRdlM6HThsX7N47dE/P46Pv896SHD4Ii
         CZA7SiSGeHl9QdlNUUcBsJjDndoAUwQdpVoEnYJ2X3cWSVpWlRtLnunx+zeAjs/6xQ+R
         /reKt6DgXUwik3hwOiLNiVQCRKEVY48DiElf1pQlZFlxOG6o7FQz/s+Yh1QhoEyI0g/m
         hXlG/kLFS3VO9Y3ckDyxXiD675uGa6cDEFy5Zx1GK0THS9uwsW8R3WiRib0jsGM4BYs7
         s7zA==
X-Gm-Message-State: APuU4Z+OF2eRA1EUrpLIEshk+S7w1i7p02e6u6L9gQi+xQgjbohi2FCA
	n7qjScmLwnEccdGJWjR84/Eexq52Rubxk7ZzSbGWsQaDS/d/6686NLshPaqAN2vEdGw5sbX+LVn
	9UwvrvQ==
X-Gm-Gg: AZFdTZeaJBNLzioqIR0hkxzN83goQvqxkvGrBt9FBOXNywry4XG/SSys7BS0Bhhs8co
	5YLawwxX7PwYwhRfRLRyNqwD4M/B0gJgrXwHnz7qcOY1FuneVEGrnNpC3QY8wUbHLzhGKfLIvsk
	nlBh9lxf2vaY4GENDi9b4ltR+P/sNpHoAKEZmnlrbAdZnjUVNqumcw73dnMhntuHdTIrA/28Xqx
	nA6CEQhXRwUgkYSfzWF9efUiUninpDwv7RPzbpmpAzWW52Ws7yIMvIFgmGu9gULeW5w/iMw5oz2
	g/q+buD+uAVIWhRuJQxVmjzWUgO0gl8JCpx7UTiRj0aIJeruXR1FTEYgE2btZ7zQlxh7cheL/HV
	xadVX13QBcy4uOQsP/3FL1Q82rxvlgwudO75te2vzvGMEtCetaE7ySbhIrX5RVCKCvlkRkhKGxX
	bSPyZ+XpwBIyJkjgCaZWMce5xytreW2ZSM87nhOmYYICznvkbU0U7Ey/ra6RvgAC+uSdFO3+fFl
	KoX22gbZueU48t1jK5AmiTMLgheNz+qtF6EoWgQl+F3LXGHRfh/RL1MBNSzI+ZnD6wo3QL1kz+g
	Fx+LChOYQiW8UjF60oS8TLcL35CX2AMHT0hYf7uWVlbD9EqcR4lqgREjvozG7c2mg83avzvCMZe
	vjOWzvby20H2rPo5w1ZkKXQ==
X-Received: by 2002:a05:6830:4ac3:b0:862:bb04:b557 with SMTP id 46e09a7af769-863158f0eb3mr29710684a34.8.1795718513641;
        Thu, 26 Nov 2026 10:41:53 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86316910337sm15109586a34.23.2026.11.26.10.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:41:53 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: Herve Codina <herve.codina@bootlin.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v5 09/10] dtc: Move labelled-reference handling out of the grammar
Date: Thu, 26 Nov 2026 11:41:08 -0700
Message-ID: <20261126184126.1472738-10-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126184126.1472738-1-sjg@chromium.org>
References: <20261126184126.1472738-1-sjg@chromium.org>
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

Move it into merge_ref(), passing it a struct source_layer with the
label.

The output does not change. In a plugin, the error for a label-relative
reference now gives the position of the reference rather than the label,
since the problem is with the reference. Update the
merge-labelled-relative.dts test to match.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v5:
- Say that a label on a node outside the plugin is an error
- Use the term 'source layer' rather than 'fragment'

Changes in v4:
- Explain why a fragment which adds a label does not go in an overlay
- Free the fragment after merging it
- Report the label-relative error at the reference, not the label

Changes in v2:
- Combine merge_labelled_ref() into merge_ref()
- Use dt_ref instead of fragment_ref

 dtc-parser.y       | 14 +++++---------
 livetree.c         |  9 +++++++--
 tests/run_tests.sh |  2 +-
 3 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index 993eb7b..98b68b1 100644
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
+			struct source_layer *layer;
 
-			if (target) {
-				add_label(&target->labels, $2);
-				merge_nodes(target, $4);
-			} else
-				ERROR(&@3, "Label or path %s not found", $3);
+			layer = build_layer_ref($2, $3, &@3, $4);
+			if (!merge_ref($1, layer, $<flags>-1 & DTSF_PLUGIN))
+				treesource_error = true;
+			free_layer(layer);
 			$$ = $1;
 		}
 	| devicetree dt_ref nodedef
diff --git a/livetree.c b/livetree.c
index 0be2da2..a33f021 100644
--- a/livetree.c
+++ b/livetree.c
@@ -545,10 +545,13 @@ bool is_ref_relative(const char *ref)
 
 /*
  * Merge a source layer which refers to a label or path into the node it refers
- * to.
+ * to, adding any label in the source layer to that node.
  *
  * In a plugin, a path always refers to the base tree and a label may do so, if
  * it is not found. In both cases, the source layer becomes an overlay fragment.
+ * dtc cannot put a label on the target of an overlay fragment, so a source
+ * layer which adds a label must refer to a node in the plugin, or it is an
+ * error.
  *
  * Returns true on success, false on an error, which has been reported.
  */
@@ -565,7 +568,7 @@ bool merge_ref(struct node *dt, struct source_layer *layer, bool plugin)
 				     layer->ref);
 			ok = false;
 		}
-		if (layer->ref[0] == '/' || !target) {
+		if (!layer->label && (layer->ref[0] == '/' || !target)) {
 			/* Add a fragment@N node for the reference */
 			add_orphan_node(dt, layer->node, layer->ref);
 			return ok;
@@ -577,6 +580,8 @@ bool merge_ref(struct node *dt, struct source_layer *layer, bool plugin)
 			     "Label or path %s not found", layer->ref);
 		return false;
 	}
+	if (layer->label)
+		add_label(&target->labels, layer->label);
 	merge_nodes(target, layer->node);
 
 	return ok;
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 467a9dc..58c4a38 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -782,7 +782,7 @@ dtc_tests () {
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

