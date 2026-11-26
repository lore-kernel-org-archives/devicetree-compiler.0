Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795718511;
	b=TGNwNl19C+RFadsVJYb/V6lZzXJHGSiI6eNnGciYiauRvwnmXK9SIzvgSBzu6rsbFKws
	 v3ZCXnB/V8ad5XlkZQooowvR0/VBwgYMuF8a6QvJeYkoKWhBad4ad9plmUnEDPo8W/2sH
	 6aFJMm0wXFxvlWpQXYOeWxWiigbrw+kEtdqjF0NNEmbOWQIrw5PzlVb4TuFVYuwKKuKzz
	 XgcgRHAhG9FqMZKdlrmL2C5cRmJsw1GzFh/cJqfX1Lg2EOzN8+EBcQ4Tkdxu4s/Xb4A+M
	 7rQkYHUHtrny4XWtlV8RK3BWYDW8fWFG29Sc9wDQJcr94wBPm4L93neZuI0ZxWwNwEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795718511;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WOwubOhEraj9BHNmbPFsGyy3OlB5/wUZFdoAj5V9+T4=;
	b=wX6+IAfU5FFI6auq52AJ2npX8niMSCVGv4mk+gvXoatNCEckDJNYFwArAf9H7ApT/O5l
	 zkeV1Wa6qLpwHbJjXrdYXhuiVozckkuKVcfI8f5Wy8FVI+bHJyBGkGDtwDAb94xB42LA0
	 rmJRupdJv0T/D7sZeJDBvVEOPDFigdffYgUczQxEINPYartlMZRvwItsUjnXt2sIXGFrZ
	 BRlmKeN30PKCWQHoIWn6S4Tk513pjlo+GysHFcmHj0yY9gweYEbo9o4iVvl71IUbbopT5
	 pCfF8XNtnbwhwiT3UUAA7eZ2vZxz+YuDZvNwUxDzoXUnAGRBixD5+CC7HBmgU5k15UA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=oLmiei6m;
	arc=none smtp.remote-ip=209.85.210.53
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3E7606A326
	for <devicetree-compiler@vger.kernel.org>; Thu, 26 Nov 2026 18:41:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC3E7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=oLmiei6m
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-862df509d48so5512868a34.0
        for <devicetree-compiler@vger.kernel.org>; Thu, 26 Nov 2026 10:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795718510; x=1796323310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WOwubOhEraj9BHNmbPFsGyy3OlB5/wUZFdoAj5V9+T4=;
        b=oLmiei6m2g5I3yHhMkYUiTcjrE+flqae1e1PRhXyfdfvlCu2dc5UIoeTRDzz/2KHqT
         bmdFLNHIIXvhKRj9ij2Wevpw1/yNuKa7/jky3HGFcOwZi3rYKtryEGZW1W4AzpJLM/R3
         38df2A4BAV5cSGApqKj1yTtPIW+f/Pgh8Igi0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795718510; x=1796323310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WOwubOhEraj9BHNmbPFsGyy3OlB5/wUZFdoAj5V9+T4=;
        b=nBWO5Q7Vnk80fKTXmh/SmRg09C9ALg66pImJWXbtiQNHML17oKeyKsY3loJJEfEXlh
         imNWEhQoKZ/MWnR4HHiVlt/bJN+n30VYpXIHsXrIdBIAlpjkQ74uxZZKyiUgWe+NYaSg
         fgHWjaaq/Ieuj6vhPpbjVRAR3EQHFCCYI80PVzm/9BvfjOat64HMHIWbaNyxieXftvM2
         58TiyMFU9kpi5ymPEtOWV0J4HVb9nj79Aw1Pn9Q1FqrONFjV1qijeQb6frYc0SBTGk5j
         bjdLwPWWLaP+kf0PchUoPYjNnJ3h8GaJwxM56U9pVifTi9bPNy7A6OHfDqQzbBSYqNLe
         alUw==
X-Gm-Message-State: APuU4Z8o7j1M2XIUTxEM/jkmyQ5yxqUqynYTNzIS1naW0XWDBqrZkyd+
	64Rm5KOTI4m8Y8wV4HkSuxuWr+L9XwxvcTSpyB4eypPIT0q+k0Rn8iZ47+10/LtEHJdmUQ/to32
	grtjTfQ==
X-Gm-Gg: AZFdTZe0EbUk1UOnwhyvAdX65qFYuUo+bW2U/ow4EmYWnNwDpAYoKS3zKcCuHlk5cg5
	hxvzJcgI8NGy42cxlAll94Uq909O/1zw6wnbn3PYwxx9RLwyI8Kzd6QoI3KdYboiUmv96E0xdGP
	/FFGrbvdRWtJntuTcqJQbdQqETww110UFZufyy4nAbO7PNVJ/AnvokW9VS+JcXxboimII53xNdG
	HMyREEgn+VhaAViXZGi7sEYoT1fv07d54QO/GfmGB2//+/LtjDDQ9sSIf1389n+TPr8cAZhG/yE
	n3hARcJWuXvGtuK34c8nFKynjxswnH4M7vpqY2gUB+8vSRyLOtQig6nWnqvuhwCjjxPJdYPR65s
	6nTZX//97pR7NL62LCEua7wIiG6A7ByfZNriYColqXGvQqkw/xUYdQX0R5Mrrp8b5K6Q8GT54Mw
	O5SN/1JskamPET0QgWhel83bvcyIWJIOkAhyPjjGmp44MfN5RTVKylqsc4c3koUCdPw/7nLxjmO
	dO/fxcZap7u+lNOjRPZjvWLnz59svRmcAQbl/hmBxXNYtL2ljMNYqcIBe0wcfgLQq3VDCQHQ6Bp
	VEzHLS/8elhRcjUTxM4gi30tJE7N87dHsEegjcw7SdzkNqaa8Tf9FiqRCRlNowAht9NBtBtH5R+
	0nFTivD3eH4Hrz87cjYgpBw==
X-Received: by 2002:a05:6830:3915:b0:7f9:555:1df0 with SMTP id 46e09a7af769-8631576fa97mr15341357a34.12.1795718509885;
        Thu, 26 Nov 2026 10:41:49 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86316910337sm15109586a34.23.2026.11.26.10.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:41:49 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: Herve Codina <herve.codina@bootlin.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v5 07/10] dtc: Merge &{label} in a plugin as with &label
Date: Thu, 26 Nov 2026 11:41:06 -0700
Message-ID: <20261126184126.1472738-8-sjg@chromium.org>
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

In a plugin, &label { ... } is merged into the labelled node if the
label is in the plugin, as of commit 0fcffda15e9f ("Merge nodes with
local target label references"). But &{label} { ... } always becomes a
separate fragment@N node, since anything in braces is lexed as a path
reference. This adds an overlay fragment which is not needed, which that
commit aims to avoid, and fails with FDT_ERR_NOTFOUND if the label is
not within an overlay fragment.

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

Add the merge-label-braces.dts and merge-label-order.dts tests to check
this.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
---

(no changes since v4)

Changes in v4:
- Add the &{label} tests here, rather than in the first patch

Changes in v2:
- Add new patch for &{label} in a plugin

 dtc-parser.y                 | 10 +++++++---
 tests/merge-label-braces.dts | 12 ++++++++++++
 tests/merge-label-order.dts  | 17 +++++++++++++++++
 tests/run_tests.sh           | 12 ++++++++++++
 4 files changed, 48 insertions(+), 3 deletions(-)
 create mode 100644 tests/merge-label-braces.dts
 create mode 100644 tests/merge-label-order.dts

diff --git a/dtc-parser.y b/dtc-parser.y
index 37c588b..8e67182 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -194,6 +194,8 @@ devicetree:
 		}
 	| devicetree DT_PATH_REF nodedef
 		{
+			struct node *target = get_node_by_ref($1, $2);
+
 			/*
 			 * We rely on the rule being always:
 			 *   versioninfo plugindecl memreserves devicetree
@@ -202,10 +204,12 @@ devicetree:
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
new file mode 100644
index 0000000..569e7f8
--- /dev/null
+++ b/tests/merge-label-braces.dts
@@ -0,0 +1,12 @@
+/dts-v1/;
+/plugin/;
+
+/ {
+	label: node {
+	};
+};
+
+/* A label in the plugin itself is merged, however it is written */
+&{label} {
+	prop;
+};
diff --git a/tests/merge-label-order.dts b/tests/merge-label-order.dts
new file mode 100644
index 0000000..40fa668
--- /dev/null
+++ b/tests/merge-label-order.dts
@@ -0,0 +1,17 @@
+/dts-v1/;
+/plugin/;
+
+&basenode {
+	label: foo {
+		p = "first";
+	};
+};
+
+/* The last definition wins */
+&{label} {
+	p = "second";
+};
+
+&label {
+	p = "third";
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 1e9fb7e..467a9dc 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -809,6 +809,18 @@ dtc_tests () {
     run_fdtget_test "/node" merge-labelled-plugin.test.dtb /__symbols__ newlabel
     run_fdtget_test "value" merge-labelled-plugin.test.dtb /node prop
 
+    # In a plugin, &{label} is the same as &label
+    run_dtc_test -I dts -O dtb -o merge-label-braces.test.dtb \
+	"$SRCDIR/merge-label-braces.dts"
+    run_fdtget_test "" merge-label-braces.test.dtb /node prop
+    run_fdtget_test "node" merge-label-braces.test.dtb -l /
+
+    # The last definition wins, with no fragment@N node for &{label}
+    run_dtc_test -I dts -O dtb -o merge-label-order.test.dtb \
+	"$SRCDIR/merge-label-order.dts"
+    run_fdtget_test "third" merge-label-order.test.dtb /fragment@0/__overlay__/foo p
+    run_fdtget_test "fragment@0\n__fixups__" merge-label-order.test.dtb -l /
+
     # In a plugin, / { ... } and &{/} { ... } are not the same thing
     run_dtc_test -I dts -O dtb -o merge-root-plugin.test.dtb \
 	"$SRCDIR/merge-root-plugin.dts"
-- 
2.43.0

