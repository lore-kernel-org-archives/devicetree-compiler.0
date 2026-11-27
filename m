Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795810515;
	b=Dzu/ncv/urSG+HULgubPiSllCVx6yH69gIQzWEgze2RQ8sDYjnbZ0/6JCdkn3FDmR4ul
	 RNb+MdLzloqBirHfmMmxdkBn7C3r9nfk+HmVnFy3LbS7OmjhmN5hstMC/zKy7cm9WBuid
	 NqiMFCSuAzP8tCH0fUZiHcqzgSRvdBej4hxPaqlkA67n82TYHmHem+CFqMRBnedMj2KmM
	 LSReSPQragvd2FwAcmLxM+Nx/F/CIu6tzgT8hNLwzQGM9KyjS/SfjcZ1YeYiDOkoJr7lt
	 fiC/rQ60mdwUc/Hos3odr7VWnzRoI1zmYSPGa9JRR37UmLuLNJAcqNDQlU8MxCif2pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795810515;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3FDqM+o0IgFwkKYEiw4tHGnvhgv536vv+vIh3iQ+UeA=;
	b=fAQqFQ7Wo6TOiuvvlQoecRCSO820PW5vB4sSr4n8ro6zowRpZfYqfYRg3qlJ65F6cWZQ
	 rC+UGtaeDUtmKhoVESOlvW38oqrVGZ6dhG24l5ekWTDrK8vESvQplAPh7Fn757JvKjIaQ
	 /h8TXfTvCsY7F6DEXRGr+75PaNooRYwejyHqIThghgo0ajjJxDTTZANAfyEaLjwwl1cv/
	 6/PWu9ZjjCtczg2+hJgqazZR/3uNdrDZs2Ni1mGLpCr3vTO8hfZq5z4JOtiIJGHbdHzEB
	 a3gVuOZme2c5VJPifUM2TYHnb6WtmhocMgeZShEN9rmNfgufYRkwc1s7UrSeLgje1HA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=epZislFj;
	arc=none smtp.remote-ip=209.85.160.47
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99487606A327
	for <devicetree-compiler@vger.kernel.org>; Fri, 27 Nov 2026 20:15:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99487606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=epZislFj
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-499f20c7054so4450732fac.0
        for <devicetree-compiler@vger.kernel.org>; Fri, 27 Nov 2026 12:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795810513; x=1796415313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3FDqM+o0IgFwkKYEiw4tHGnvhgv536vv+vIh3iQ+UeA=;
        b=epZislFjiVYN2ICzsM2rZuzCqWq1SQe9mn1jkLxlOVUJfIFvab76V6XGOoQxY6/1Oe
         FMPIZPoy7pOy5BMRpJbNuGmX09fAhjHJwdNdQmWBckb5rhwoO4hQJ1UoBL6pcq7Jo5QS
         cK3SSM3fiWR35/EmkFtoa7aJVXAp+g4eC+aqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795810513; x=1796415313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3FDqM+o0IgFwkKYEiw4tHGnvhgv536vv+vIh3iQ+UeA=;
        b=Z4vjcLPcNjU1d0/h7BB3o5REVRORngiw1VQ9fMDlwMgCJ6Hwdigq+mFetmxPkOc6X4
         BNq6jdUJyRffoZIaEcWk87AEJu2Bz2kZ+j/NOLqaRkgvi5RlLmYxjS4DinfBAuk4LX/p
         2Q4R/V6y2VctVHl5kZ/14kt5AtvFmqOF3Z4dKOalIxr/PNLekQjyM3l7EUwhd3d4TBue
         HYp9tKHSBqxtfQ4Q9gE2aj6/vzZFbp2qFTWy6R826sgojZ/qgRD4Vb9uzqzx/99FFW1P
         IrWkXOwkPr3tZ/S55bq791zFEAv2xi9ynGUY4WNB6n9AQ8WIGvTeDQZYSfMI4KRO/x0L
         LyJw==
X-Gm-Message-State: APuU4Z/3cldafnAnyE5NvC78WAqvJQJ5Jl35eMokMhF4vfRcQ2uaj+kF
	MHnISFFCKSDIafSvYfweDtfQ0KqpfNpxwZY1yygGn4zvceJMHrtTLBptMZmXBfD6KbuJCSwtF0Q
	8ijuBFQ==
X-Gm-Gg: AZFdTZcTkNLR+1DOKUNsMuCIs9dFRza1Af45pH46rXvJyub1CsKIjW2vK0R9X7jLqLq
	5PT1sYsG9tnaGX8hy/rDQzoQoxKD8Mtmh3SHUSxM2Ov/5kvFSen+229C09w5As5DLIBhGZUSylE
	Ga6VCyxfHy5O4zxkaF5y5Zr5miXfzQhKpPMdzIkknP7mjZq7BHz6WXOLNLV7J4wuWhOtaGEzOR2
	wUTdwh2cNoDNToRpVJPxborNub3BHFDPymoWTu52OxEaqHUldR1MGmE1woltGJKl/pWXmrDJU/t
	JkEYnHJlrE4unuLalN0dE/j4+PUlr5B2IE1ZPcqYOQqniAXB6ZvfRmZqzwP00k0tfAyUil49WUO
	W0SFPQoQdGFNpp1QmqYTqTwqepEQvLq2X2PMV1G9JhUrBj1VIP1MWtGtjM+fUOziRZg2mgMI/SM
	HfLoGsIL5HxTZqQ1WPHmNdPARpBm+K1n7ZbTm62fYjQtIEen+7AkPkfhUqKmWHjgKc8mONIBw/m
	pA7Xrf0lmbSWkTsM73Qu9txZ38wxUXMEpaXj6+FVZecoY7GAtEb3oS80mqBtLSftrMTuIRTAo0k
	BLWpbAMzbYdDXyS9TRAVR6j7azJATHR7HFTFXXpqXL3IZN4AOymdjfvdTGX005d6WFVG/5vYRry
	orlA5fp9brMbjVp9y7k1G
X-Received: by 2002:a05:6808:6404:b0:4b9:a829:f015 with SMTP id 5614622812f47-57a0b645f11mr23759611b6e.33.1795810513487;
        Fri, 27 Nov 2026 12:15:13 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a35e5ab03sm18881561b6e.16.2026.11.27.12.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:15:11 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Herve Codina <herve.codina@bootlin.com>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v6 1/6] dtc: Move labelled-reference handling out of the grammar
Date: Fri, 27 Nov 2026 13:14:44 -0700
Message-ID: <20261127201457.1837712-2-sjg@chromium.org>
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

Changes in v6:
- Drop the claim that dtc cannot label an overlay fragment

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
 livetree.c         |  8 ++++++--
 tests/run_tests.sh |  2 +-
 3 files changed, 12 insertions(+), 12 deletions(-)

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
index 0be2da2..76bfa39 100644
--- a/livetree.c
+++ b/livetree.c
@@ -545,10 +545,12 @@ bool is_ref_relative(const char *ref)
 
 /*
  * Merge a source layer which refers to a label or path into the node it refers
- * to.
+ * to, adding any label in the source layer to that node.
  *
  * In a plugin, a path always refers to the base tree and a label may do so, if
  * it is not found. In both cases, the source layer becomes an overlay fragment.
+ * A source layer which adds a label is not handled in this way: it must refer
+ * to a node in the plugin, or it is an error.
  *
  * Returns true on success, false on an error, which has been reported.
  */
@@ -565,7 +567,7 @@ bool merge_ref(struct node *dt, struct source_layer *layer, bool plugin)
 				     layer->ref);
 			ok = false;
 		}
-		if (layer->ref[0] == '/' || !target) {
+		if (!layer->label && (layer->ref[0] == '/' || !target)) {
 			/* Add a fragment@N node for the reference */
 			add_orphan_node(dt, layer->node, layer->ref);
 			return ok;
@@ -577,6 +579,8 @@ bool merge_ref(struct node *dt, struct source_layer *layer, bool plugin)
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

