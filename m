Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862918;
	b=baoa5Ruk+SDAZ/GkBcZA5wgLeAdFvoCAZjwwuVhDQe9wFQBsnzLPc4Rz61cMGropIsEB
	 cT63G6RIMd+FZ3EZbtfZxshk4EmfnAWg0IJPOeLxfx9E3EkzOMIUPhc3Kcj9nKdQ/U+zH
	 ey83RE3KTaUQ76HfUxeK16xE+S2dcF1zFBzKu5IK9dRTdWQyj8A8INL5tpmZ/+KT8aLV9
	 cb2oO3fsZVSZhDBoFl/H1QMi9b7qDQxV9dpDp233lMIW/MwVpoimKMrbQ6LXijZ+WcM87
	 PBFxGgpn6ux89fxjD+5S8jC2oYD74s2NNnWlm068MzPuA8YF3eAq4jUQ5IFFncayKTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862918;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Type;
	bh=KEsQMDDt/wu7yLE1buVHI6zdgj62ZAZ6WbkNQURciqU=;
	b=TJd9p26XzoVOzxkinysSfZobMCUB7j9MQ9PrYKc2M/gO6nF/RlwYl3lPb0uYtw2ce0Ma
	 f26j0EDaAMI5d2/yQBbynJDvGbK7dzAWa7FHjw8OvNV3qm74iNEUDGJo3lRndnE7kyTpU
	 QbA+iwpMxTHQ/R18pEOc586PxdJDxOWcC6eG8fdlbcMm+loqAgjPlpRHLU/PtUboYKAKz
	 ZRAacgjTAH+igm791mMvuNFbgDz55soswfQ0mEGdli7ZKxvQxO84jesGUIsG/ctqWHuIc
	 YQ4Opa2VITQqdJGo+Y1jVgsBe+QPMfXkNU8WrGUHrqb2QRU/Te6gIsEC5/1rF1OWaVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=harmonic.fun;
	spf=pass smtp.mailfrom=harmonic.fun;
	dkim=pass header.d=harmonic.fun header.i=@harmonic.fun header.a=rsa-sha256 header.s=google header.b=JL71USLj;
	arc=none smtp.remote-ip=209.85.160.50
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7262D606A88A
	for <devicetree-compiler@vger.kernel.org>; Mon, 16 Nov 2026 21:01:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7262D606A88A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=harmonic.fun
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=harmonic.fun
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=harmonic.fun header.i=@harmonic.fun header.a=rsa-sha256 header.s=google header.b=JL71USLj
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-4ad587ba293so3029013fac.0
        for <devicetree-compiler@vger.kernel.org>; Mon, 16 Nov 2026 13:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=harmonic.fun; s=google; t=1794862917; x=1795467717; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:subject:cc:to:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KEsQMDDt/wu7yLE1buVHI6zdgj62ZAZ6WbkNQURciqU=;
        b=JL71USLjpA1tIZP2Eis9na8TrI8WdsSeKMUEAyyCnjFY5SH+IGVhNWfarZzouClu+h
         KML9sgfpDnChXisT0dukVt7gYwsioPswVhiDAD8eDg3gdFDr5KKtIFU3iNrHzHOWfVlY
         pPsuuIcmnLL2xbHq6YzvzzEp/elcGENHG09Ynk91Zbsp4R1l/2pGOnvMheEih3hQvli3
         dgz2DND2aCWreCtGNkgYYeYm95gpe4vvvMQ6fkQkcudUhKhxGfKOydSzQx1m3KcxtOGQ
         /PM1WRhe1f26ysTmYVc2FrCCt/lUVN35/l+5qTCPB3eyZGOQOkwuIYLGnu9xzNhOWbsi
         lhug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794862917; x=1795467717;
        h=content-type:mime-version:message-id:date:subject:cc:to:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KEsQMDDt/wu7yLE1buVHI6zdgj62ZAZ6WbkNQURciqU=;
        b=ejRTEZ+ROQhYXBXYHi4LzSVruVjlvbidaDXT0ffh7SSEAytgIv2B175EtYM8i9EHOA
         mQRjLu8YTyD/4SSjyZJ5c+YCGvJJD8F12DnxFGZo3jsdhOhsOXwdtoHuvkvMXw8Ed6H9
         be8kz0FzfULxtC5Haokxx1Q+Tlt3/dPmjBYQsyioKmXRQ+stiPQSdc8YwaS9HcBX1Ucn
         iAEtDrtRpt3Muv5fplBqVW9HRVObeyKLVNm1AC5IqlD2p04xoV7tvVvWIq/agR4VMjk8
         Q3ndCCSMcecHcMWxHJQONqQQhMdMB1FZfTrDOUSllUSkVNJoRuJmaPYU9zhvTbDCOKlL
         7RXA==
X-Gm-Message-State: APuU4Z90Nu03kXgYqfootPEbIXz58hlRROk4cGDPxACIs751BzuNkq7U
	hnhj7dsGMyS8RAhTgGyZ3ugXvYLcF6HJd5UcFTrAaclGAjqS0pRkABsvC4C7ya48MFnjrut15vu
	2DTzn9XYP67Ls9Gf+Zf3mbb9cz21nIxBKSY6+GhF7YsXDmif4r320S1YnmpAWYHrWwDbo1pJtdp
	3QT6+4wS41HeSAYncWFl57ZKVCI54hGzLSiP5rl72d/7a2U0MIYHY95QoUPDeACwVNi6ljX3S8L
	w==
X-Gm-Gg: AYBFou3hbjmLjbWGwlcRzqdlmAbqapNFpeUkAwrlNx5yZ6JXDWrvnrmK7F4P0NJCkLy
	eJX8qo8QVWdAfCUceeO01ZO2GTXGFLi3ZSQkUCeNdLLxjlSHvxjODONZBjvPNNNKWeMpp4Pkcbc
	DIEbr23FdcRSW9VdCjTslNelhv8xn8KkXRGNzLWIxnzoWm33Kb9jcWO1xx7hvWWe7o80A3eehOF
	olyXs6Es0GjHSWOeyCGLwayIc+RKPWQt9PYKDvziegA2xUhwo+0ZrvOAXpv2tkn74XJBK7jyEqM
	d2i/2DAJ9ByLMBVzAEnKbGjJS5ctLCL08BYpaTxvsucngTciGCYU1oj6BKgJobWhRNvAmaq4tN/
	PYsGUw72EUBNzFUjOeAAuXrY1z9MEcHwIhyR0eDl+wnYlcJd8sQZE/gB9tEUTJOO+zlZi16vNzU
	LdUok1jXCg4hCHD1aUanPwJL3TIbPPSgbN6A7BcvK0AH9bKDpFCMU9oi+hydY1DGK5yu4zXLRUX
	IW97dU7sgggLyMLv2oKR7V9aR9jwxyiJsyKPLgkctJ4OY7+N1UEUiL7NR7zvOhUN2PgBQN1d3Tk
	0qTKqP1ZjjnFL8g1rnfxRn+Th8/5UyNVvPa6oGhZXaGO9u9gdBcG9XyFxEzSKVVA1QFZzGHp79m
	0RfU7+w8crLBwasUYJi8/m0qSRCO/u3Hhb/zVLPUydbA=
X-Received: by 2002:a05:6808:6d82:b0:573:1dfa:f0c2 with SMTP id 5614622812f47-5731dfaf630mr5040589b6e.29.1794862917155;
        Mon, 16 Nov 2026 13:01:57 -0800 (PST)
Received: from gabe-dijkstra-dev-central.tail5deed.ts.net (133.115.58.34.bc.googleusercontent.com. [34.58.115.133])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e70d6572csm10893402b6e.15.2026.11.16.13.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:01:56 -0800 (PST)
From: Gabe Dijkstra <gabe.dijkstra@harmonic.fun>
To: devicetree-compiler@vger.kernel.org
Cc: Gabe Dijkstra <gabe.dijkstra@harmonic.fun>
Subject: [PATCH] libfdt: overlay: Bounds check local fixup offsets
Date: Mon, 16 Nov 2026 21:01:19 +0000
Message-Id: <20261116210119.1562863-1-gabe.dijkstra@harmonic.fun>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"

An unchecked /__local_fixups__ offset lets an overlay make
fdt_overlay_apply() do a four byte read-modify-write up to 4 GiB past
the property it names, outside the caller's overlay buffer.
overlay_update_local_node_references() never compares the offset
against the length of the property it is patching.

Fix this by rejecting an offset that does not name a whole cell inside
the target property, there and in the identical pattern in
overlay_update_node_conflicting_references(), and add a test case.

Assisted-by: Aristotle (Harmonic) <aristotle-harmonic@harmonic.fun>
Signed-off-by: Gabe Dijkstra <gabe.dijkstra@harmonic.fun>
---
The check used to exist: before 24f60011fd ("libfdt: Simplify
adjustment of values for local fixups") the store went through
fdt_setprop_inplace_namelen_partial(), which rejected an out of range
offset with -FDT_ERR_BADOVERLAY.  That commit replaced the call with
direct pointer arithmetic and the check went with it, so v1.7.1
through v1.8.1 and current main are all affected.

This is the same class of bug as fb7d79d7c6 ("libfdt: overlay: Fix
out-of-bounds write on bad fixup offset"), and the fix mirrors it:
compare by subtracting from the length rather than adding to the
offset, guard the subtraction against underflow, and return
-FDT_ERR_BADOVERLAY for a malformed overlay.  That commit hardened the
shared helper, fdt_setprop_inplace_namelen_partial(), covering every
fixup that reaches the blob through it; this one adds the equivalent
check to /__local_fixups__.

I have a standalone reproducer that builds an overlay with the
sequential-write API, checks it with fdt_check_full() and applies it
to an empty base tree, exhibiting the out-of-bounds read-modify-write;
happy to post it if that is useful.

 libfdt/fdt_overlay.c                          | 20 +++++++++++++--
 .../overlay_bad_fixup_local_fixups_offset.dts | 25 +++++++++++++++++++
 tests/run_tests.sh                            |  1 +
 3 files changed, 44 insertions(+), 2 deletions(-)
 create mode 100644 tests/overlay_bad_fixup_local_fixups_offset.dts

diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
index 4b3e17b..b7da3dd 100644
--- a/libfdt/fdt_overlay.c
+++ b/libfdt/fdt_overlay.c
@@ -234,8 +234,16 @@ static int overlay_update_local_node_references(void *fdto,
 
 		for (i = 0; i < fixup_len; i++) {
 			fdt32_t *refp;
+			uint32_t off = fdt32_ld_(fixup_val + i);
 
-			refp = (fdt32_t *)(tree_val + fdt32_ld_(fixup_val + i));
+			/* the fixup must reference a whole cell inside the
+			 * target property value
+			 */
+			if ((uint32_t)tree_len < sizeof(fdt32_t) ||
+			    off > (uint32_t)tree_len - sizeof(fdt32_t))
+				return -FDT_ERR_BADOVERLAY;
+
+			refp = (fdt32_t *)(tree_val + off);
 
 			/*
 			 * phandles to fixup can be unaligned, so use
@@ -636,8 +644,16 @@ static int overlay_update_node_conflicting_references(void *fdto, int tree_node,
 		for (i = 0; i < fixup_len; i++) {
 			fdt32_t *refp;
 			uint32_t valp;
+			uint32_t off = fdt32_ld_(fixup_val + i);
+
+			/* the fixup must reference a whole cell inside the
+			 * target property value
+			 */
+			if ((uint32_t)tree_len < sizeof(fdt32_t) ||
+			    off > (uint32_t)tree_len - sizeof(fdt32_t))
+				return -FDT_ERR_BADOVERLAY;
 
-			refp = (fdt32_t *)(tree_val + fdt32_ld_(fixup_val + i));
+			refp = (fdt32_t *)(tree_val + off);
 			valp = fdt32_ld(refp);
 
 			if (valp == fdto_phandle)
diff --git a/tests/overlay_bad_fixup_local_fixups_offset.dts b/tests/overlay_bad_fixup_local_fixups_offset.dts
new file mode 100644
index 0000000..34e3637
--- /dev/null
+++ b/tests/overlay_bad_fixup_local_fixups_offset.dts
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+/dts-v1/;
+
+/ {
+	fragment@0 {
+		target-path = "/";
+
+		__overlay__ {
+			test-phandle = <0>;
+		};
+	};
+
+	/*
+	 * The overlay is well formed apart from this: the fixup asks for
+	 * a phandle at byte offset 0x1000 of a four byte property.
+	 */
+	__local_fixups__ {
+		fragment@0 {
+			__overlay__ {
+				test-phandle = <0x1000>;
+			};
+		};
+	};
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 5775e0c..ababc62 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -274,6 +274,7 @@ BAD_FIXUP_TREES="bad_index \
 		empty \
 		empty_index \
 		index_trailing \
+		local_fixups_offset \
 		negative_index \
 		overflow_index \
 		path_empty_prop \

base-commit: 774adc25940050fb06f241b1a2a98e7421e6ed7b
-- 
2.34.1


-- 
*Confidentiality Notice: This email and any attachments are confidential 
and may contain privileged information intended solely for the use of the 
individual or entity to whom they are addressed. If you have received this 
message in error, please notify the sender immediately and delete the email 
and any attachments from your system. Unauthorized disclosure, copying, or 
distribution of this email or its contents is strictly prohibited.*
