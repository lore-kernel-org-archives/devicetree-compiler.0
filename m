Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794873530;
	b=1HyK9oRfuWC0ftwZE8olJXb8KttBJmw9fne7/lN987Qgd091ps0ANGD+wLiIlYlTDq7C
	 pIzxRgirFasByJspiLtaGG32zvNDG6/G1VXIHjDhstbdaK4b9zdsFrx55QtSgjGrKEsA5
	 ugN9XDROhJqh/32UHSswFMGFRwAA9cdlK1L5ebCQ1ztGyigpceUERj+Oc5qBbAWHSsMba
	 Fuy2ZhFPkilHB2byNLeb2bmqba4ojSrUclFoo6iFoSIfgCcrUmMVvekYPItMndFXAOGPP
	 9TD9wxAzKyQ2RH5IaKMawE7sKf78SEDS4iflSdA8I7MF60m4Am2id60qBEfvzQ+Olcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794873530;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lU0c8bbfxDVhoMb4DAQth0klmBYLtgonMpQ+8AnwtXM=;
	b=4ibEFTe2hxeM9S5Ckcf8lTQ7gy2L2SzPzZuR+WKSGmGTe8ftR2GEU7K4rlNFABTYUMT+
	 3Cg/dmax0klOCcgwANX2cKVy65cT6fLQNywtg1iDagGtr+HkISSiZwilga2Ybsala11Qp
	 16cFMQjhC/sh966b6o5KiT9P7kl/G6LEn0bryPNmwCDDR1J3k+qPN4TuAUham9fK+iUOz
	 bnVeVhY79y27lynWn+2xLiB09BO7CrSJcCS4IjJTWfAeKyMlY5wwYFDbad271k5qcIKg+
	 BNLuKV8L/GiAI2ILYRl6S4S7wyrTDcHIqQrTMt/7druy1a7heL+90kVlD9OLJ6ENyVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Fsph+NoU;
	arc=none smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578BE606A323
	for <devicetree-compiler@vger.kernel.org>; Mon, 16 Nov 2026 23:58:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 578BE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Fsph+NoU
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-85ac281604dso2979302a34.0
        for <devicetree-compiler@vger.kernel.org>; Mon, 16 Nov 2026 15:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794873529; x=1795478329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lU0c8bbfxDVhoMb4DAQth0klmBYLtgonMpQ+8AnwtXM=;
        b=Fsph+NoURc23NlmffyZqjjgvZDExOEqNN0e2DfQjjR4142eoESOMm1huQrpWojG518
         V77Nl/6r4aEe7hKnZ1RSx/BxvQlvRF1kYBa5rjM8RsiiEFSNgFZ81pWfo6OZRcazHS+O
         D/WArFP1UrT3K2YHSk0ZnQCUK0LYo1uq+rbXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794873529; x=1795478329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lU0c8bbfxDVhoMb4DAQth0klmBYLtgonMpQ+8AnwtXM=;
        b=yrpjifHva9N04Dt0an/5LfkBWlDu+e++JffDVOJUAyCuBUtpMnf2DMlPH80dthVFfv
         iPznH75puotukHMG7kSVjf0hTZcQic4zetgzcqoRJqJupDFmD8Wu2/KHh/rag6fjbjmu
         IOy81fbhiBXX7qSllL9sP8v4VxNPMqRiEuX1xzvzBimNn13wYVmpKiQ8FxKf2E2dUmjq
         VE+FQb70jvxHMebcR4gtejD5sWrEg2E98vzgPzvWoz/c4tXYBXqrCra8R5h0WCN97pDl
         8hI+rcZORDMxAGe9yolNoeGQ0bKfO9q4GEaVkHCrFa1Gf9EBVHzzhEL1KVP7YHcdyhth
         U/3g==
X-Gm-Message-State: APuU4Z95/7IPLhqujRJXRi97cYzezX69TCG+7ks/vHntjcyGJo/m21n2
	eyEiPJms7om7WNIpirGTjpWnvbfa8IiWJzDv/qL7LazvSZ2XP+q+DKSCupU6TxaLmcxRp/568q4
	V0/jaIA==
X-Gm-Gg: AYBFou1hoMkIH9BjWuEKkyoalnXwUPivL+UmssC66WO6suwDhHdJmO4Fk0QFrNyIxC4
	frgmVYrbZ+qQYW5cwQR91X5PZy9LqScpc2JxZ6BYQryERa3jH2nYhf7NfwbG5cBq8WAuwFnKKXj
	9dnaZBOykT8bFO4siMKcjvjzL7VH7YrdYUN0Cjv2+c+492XKq5UWOdlO5BvpzgtHEayRk0K2jKA
	yR8j5LMId9pmAjVcMKTvv99qAd5wQZzkQxNJvgu8cYzBR5cTxb+pNbwzXODp0l/tFXTwvKXZMQ+
	YbfIgSaM4wjxk1iaJGR1Ta5zzFEHlzm+uY92rV4LcqS7V3i1/ztyORdNJCmp51Q670qBahJe33s
	F4lyzy1YmeZbcOcIXjaYaa1jbLyGzcKCybX60EsrHbotJL14dw37QHHOFPNJ6bmnKEVRKjo/esV
	vHWXPl4v3uKo8WimJnovRHDQ3ntb0AzhlqD7ixl3lCZon2j8qViW5SJdLeb1jDuv9PuFGm3uLF7
	JfO2hgnHOpelk+5surSktGCcGM20tWUJZecIHPndC/1HywyeO8Y4cHW0Iy/WrEGwPvYnDcehXaB
	jaYA/zudhUuMwRI3+uMuUeLE9NmF0f14Ej3EwXTAJKnGXT2q1OjG4AGuuugRtzpSQb6CorkEsJi
	C8CQ6d+fvE2ysZzNd9x+ipA==
X-Received: by 2002:a05:6830:230c:b0:81f:da91:c984 with SMTP id 46e09a7af769-8628984ffd3mr17159637a34.11.1794873529324;
        Mon, 16 Nov 2026 15:58:49 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86287f0e0fcsm12210177a34.2.2026.11.16.15.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:58:47 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Herve Codina <herve.codina@bootlin.com>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v4 07/10] dtc: Merge &{label} in a plugin as with &label
Date: Mon, 16 Nov 2026 16:58:01 -0700
Message-ID: <20261116235813.935070-8-sjg@chromium.org>
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

Add the merge-label-braces.dts and merge-label-order.dts tests to check
this.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---

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
index 2d4dcb6..7e1e6c7 100644
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
index 146d288..7f9a24a 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -804,6 +804,18 @@ dtc_tests () {
     run_fdtget_test "/node" merge-labelled-plugin.test.dtb /__symbols__ newlabel
     run_fdtget_test "value" merge-labelled-plugin.test.dtb /node prop
 
+    # In a plugin, &{label} is the same as &label
+    run_dtc_test -I dts -O dtb -o merge-label-braces.test.dtb \
+	"$SRCDIR/merge-label-braces.dts"
+    run_fdtget_test "" merge-label-braces.test.dtb /node prop
+    run_fdtget_test "node" merge-label-braces.test.dtb -l /
+
+    # The last definition wins, with no fragment for &{label}
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

