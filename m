Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793827124;
	b=PCPL5CurK2QCwTB9Y5wedH34CVyENkQcWkkVCVQsXsArKqgp9JAP/C+pWAOJ+/U6moZS
	 vZX56u8cU1HD11/N7Sqvdr5VJANcyDGU8FtAwp9ewBmjnJF0R0YwcUdDdpp17Q3uxJugb
	 baN9l1R07viwOUJoDUlBVaJ6cDrqia1v0uwURKWk84jWgEyRGrWCv/CmpJGVV95RMz8vH
	 NhvYPicazFPB5/JiZh9QtxCu6JKcJw+z5hUvdaNabBHXI4Tw2verd4rrQmSfF9iplTzoQ
	 fZWAN43VPtOeqS/jaIZMCntlitH43+DSh1Gxw1adjsfSQH3AUdblivA3h1gmVlJO+hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793827124;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=z6f5cwDabL3Rk696Cw9Mi86eZ4vD2VD2M+um09OrCUw=;
	b=l3qwKaxeO6HhI9p/D9HMhoXLFJzFCuPmAQZchxhcEcryixWzfvr+NK4IHVnjICZKSmWD
	 cHAJ1eGkyySUlfuiEjEDM0kg29vVDlK/Odwk84ltuHfFMzUNPR0eBWpqfT1+QMpjrA8fg
	 S7ZxvHPaRidpwTZvnQtxhPzVEpkjQajQlxUipbmqajKMZb3LP0jH5g2EYt2QNEuxfYvCT
	 Wwi8OOvVA3TqEhGSILT8csoXvgy97yFUrxdYjhcCc50lHaSwjM5FRMKZf6BjuK1kqwhuA
	 tpxP6Zk8a/qF8+3rSb2b5PZYmd79pI5a0c3t0pjnp+MT77Xjxg8IPLvTXAt1p1v6TCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=KSvKfdSZ;
	arc=none smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666E4606A847
	for <devicetree-compiler@vger.kernel.org>; Wed,  4 Nov 2026 21:18:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 666E4606A847
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=KSvKfdSZ
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6dde81a6820so763998eaf.2
        for <devicetree-compiler@vger.kernel.org>; Wed, 04 Nov 2026 13:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793827123; x=1794431923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z6f5cwDabL3Rk696Cw9Mi86eZ4vD2VD2M+um09OrCUw=;
        b=KSvKfdSZh5R7Xs/ZCRQmKVxUKd11xv/6QbOEZMkdefdVKW5LQ6UGH+62J8cO7bYLfa
         OaKZ1mXPd7UpNO5eyZP6dzzRRhSOIF2/ntzsE0ZebxLdaCGD5GVMLbWedgJKi2dUZ2XF
         Py+fxRanr5qMktFuEyj3jDXCnOEaybup+xW9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793827123; x=1794431923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z6f5cwDabL3Rk696Cw9Mi86eZ4vD2VD2M+um09OrCUw=;
        b=wnPT9MwdgOAliUO7w7fmkWFpd0qJb0UIvqebV2cyRub3ag5VofPt8+weA0s249zbMY
         3uboNpDE0Ps+Ia43bnCXo+h2gppYmSryH1EaG9Dbjip5DVOREHhXla4CuKR/FqrTXU78
         T1ebrfNclXaUtPPOnweEeaVJecgHtdppfM972SAIhuJ0PStF6IojqebfziCsly1UB9tp
         pbsCNefWphDssw6aYDoEflFTR3Xt5SPZom6e5dO3pIl/dgNHsjHGl86xuqf+16SDYnQU
         hFy/FQ1EwUCoy7sfp/WMlJxNs/rGfvsy+6EDxCGcEfrWgrbyB+Dk2XXikkMTcbscAiW9
         YBag==
X-Gm-Message-State: APuU4Z8Ma2VwHLvgngLTiFS8jNsBSpvJFgd7PXcMBCsPI6OtFTuB0MmE
	eLfAyOePNOuA8iyXZKLzI2W3cEMPWZ/q2DmK49Ui4VPGLocQEGZwmzax2roKR4oFVU2N3bEdgQ5
	6dtSdMg==
X-Gm-Gg: AYBFou2Kvyevnh7GcIh1gph9/256gdrnVVUNO+eaiWW+E2Y5ii9jU0sz981z2Xpv2qv
	/zFNA0Kv1kxGyZh5530IumhtZWlJc7gLTXG6rT/lxei5mYR2Ekgq9Zq0LQ239K20Rc1pAG76IU+
	KK6vLhsjAt/6eIjEVP6Xd9daXEj0e7KQXdp8wCWfKVFxXL+ivik4uNi6XyDD8UmXcEwc4WF7Mrm
	HbBy14I55sAmPxUDiHBurTVFjSkAdhArx0XvhqsA/M/Ia8ucI14M6TfaJBDHJ/CkvaWy7VZrxT7
	rBU1OTM4fZGQ8XQIPTrnAhAQH+GhJv9g+/EiQQ0q4ByW16bRgYT9lsLiv7WsiFYc91ULhXQQAwe
	PJJH9bbU1w+VBguEoZotwXftLvy0gqOZCAgFRsdpSRz6+9UQZw8qFXtdtZ7AmYZJrgxefZAQnmW
	FkEGzILq7dHWVfQfFSSCoB0qvpbmVbq+DYK9KwaVgyflAWaGOgI4cR+cLDhvjStxJQvnm9olYSP
	bZZH1KNeI2Wn4Y4Yx0yBh1p/FIcYKAooaisCkTSqxDJANzDYy+XlzJznXcFGhOmcYqkSIjIoUvQ
	gDN6BwgnUt4rYsXu7bjquds6BaXAMzxwb5zIBLRWH9W+Nowt3OCT6DQXmMnAgPvwlGjLOYMLGDT
	6xW0Ec7LtsqjW0ujgFxplXgPmyUdM+9qDf9hArN/NuYw=
X-Received: by 2002:a05:6820:221a:b0:70d:7aa9:8618 with SMTP id 006d021491bc7-714f256beb5mr10218461eaf.63.1793827123327;
        Wed, 04 Nov 2026 13:18:43 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4acd330f3ffsm2947233fac.0.2026.11.04.13.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:18:42 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: Herve Codina <herve.codina@bootlin.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v2 08/15] dtc: Merge &{label} in a plugin as with &label
Date: Wed,  4 Nov 2026 14:17:47 -0700
Message-ID: <20261104211807.972610-9-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104211807.972610-1-sjg@chromium.org>
References: <20261104211807.972610-1-sjg@chromium.org>
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
index 7beb6ae..4661216 100755
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

