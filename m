Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795810523;
	b=TvD0la74tbcS5oju4w1rEhJzm/xyhJC+1OFGCaFuPOjz2yOIiQaTaNLa04lxBbvI7jjQ
	 +uDgqN73xRbrkHmO4w4S0STlc0hwlEzwrazMeqC39THblfgV5IS2MxgqRNBQqaQLt00fB
	 GsCT0tm2Z+a+vC+KPueobG2P9iRQFdPYszTvgor6ux/PrlRn5v1fdVNIjFN58aUI1TznM
	 xIY/pF1U0D7dUMDpDsHy3VEG9NEaazSJmZBxuma2HuNIiyTO5GIsb305+pN1hzRMISkym
	 Ockv1ms+bR2wTU/DebGFqjWGyTwIZ3AW/68mmW7FR1bHcf3DtqNCJLt+ZkNzsObpOEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795810523;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HCBA6A5MHaa02EmjNV0y5T4a8865mdKWBbDmZBUwwkw=;
	b=ELdlrQQ9BngYWwEE3WYa4a1BGl4kXbae7wFhGtPMwPoB3FUK2E3S4FeGdc/vfNiX0dcP
	 DqImBNOWcr42tRYEps/nQ/qGCEBfF7Y/F7XYYzpbE/tnmjS/R9qRKvUDOmkt31eREZ80i
	 2s4fw3NE8F4Cp68QOWoItBYUSbW0PFyY3JnKoH0u+tP+oHY94bciGt5ZStaMKt3bsF44i
	 us8b4TH/hiA1kuVtzp9b5esP58qoMw4bVeT3GDtNN4PMDkthFRefFOnRdH/8gHHrO9CyK
	 kefEpzM78d2G+gOPvQV5iIVbVMhhPFsH6uIGcoelfz459RR47rrpa5HPg3SlLNyXGpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=bi60pYi8;
	arc=none smtp.remote-ip=209.85.167.176
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99421606A321
	for <devicetree-compiler@vger.kernel.org>; Fri, 27 Nov 2026 20:15:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99421606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=bi60pYi8
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-4a451915d8aso5871034b6e.2
        for <devicetree-compiler@vger.kernel.org>; Fri, 27 Nov 2026 12:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795810521; x=1796415321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HCBA6A5MHaa02EmjNV0y5T4a8865mdKWBbDmZBUwwkw=;
        b=bi60pYi821334f3a7WVkFEvtE0vjxXiTnaVMB/G+Gcw+p/2FQSHukjMqz+sXe/JAij
         SdlUTsV0zebVV3Ptt2+zMJKdSVG0qlLMwxtP9ex8zQBNYfkNEr8vEjIEzzPRtGMmaDsl
         M1PzJnJA/tRWPkvVQYuGfVkT6Lzsk1plp0cg8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795810521; x=1796415321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HCBA6A5MHaa02EmjNV0y5T4a8865mdKWBbDmZBUwwkw=;
        b=tQVA0ITDWSj0MuXRnUTP9sop/XgKUbHKVsLoyfk/uedFKZhoR9AVK0jneJHP9GTxG+
         mLQ6LvWDWRPRzZg8TjdbsTvd+QJqK/9r3nubHMlcjpLXYu76zfO8gNKM2TKfuRYR81fj
         2OWpbTDEiypGvoTX54ByQW3zny/ycnesNPKYmQrQDVH9co0BvCW3QGZaPbbeuF6mrThd
         2QzLAeFfUo6xrNUBf5QAGRydUNpAidRVReS26WUrSf5dEsl0BDwfaqwCBk+NVHV5d0wE
         8tcHOUqhp1LM0ADUbclr+OI/Yrar2biQ45KeAK1cucbpt3MPEoIlDnZyHb0Bl5vIqDYL
         dkLA==
X-Gm-Message-State: APuU4Z8xpFvm5qu/H5/MEQdDAJiSbpPmWgwoxBfAVeJQS860JvgoVRXh
	Hsw1s2841n5ZIQOsyKVftpXBJd791se8NJE+aXNwH/mtq5cKNI7jp3bYdwprTf8q8c2gQY2w8wp
	pAQnuwQ==
X-Gm-Gg: AZFdTZf/2SwkTUyM5I4AnTUMwiX8VkyjC1QOzd97sqgXUBjEqz67+2ALMX5soDWDzEL
	WBUnvmI+DTNT9yNgzIDkFqmi/qrEhDomBYU8kwZqZkGwmzVSumyPHSMbRr210QfpJvGKZcyS9As
	Pu+0SOPr1PXWzvhqpVtweJ6siQ/cFWtPeqghyle5g9Rm4DPeLYdTh4lp+jCvXQ5W6reTS1HH4lW
	0umFEJ8WacwWRbP0PXbeR6vEyxyLgfzd1NWbyRd0iTwCCDkdM6ndH64XR8zSqjvBWOnquXoZ093
	6sD9RLcmnuJm89CnjMzY2IMwmn8JhuYalZ+8DQUDoTQaA1Di6xuZQg5p6w9+2dZ2+beBvxHl6eY
	Otcb4PhmM5taJASlIuapUVu56lUc1jMKglkel2QPyQbvUdwcjbvH13uoHOuTvYOuFsvCjfQWuEh
	sketTIqL3Pxfpboq8UvJQ0zdbDxNzWRdq9l3WYxz0Huy/yJqSz06uvcP0Z+77zY5RukCHYRvu4o
	oIzZR8QTAOLE9YZD0peyAZomiJRCM8S92zF66lFRjC4Azz3hiazpsXFBfbX9+dBy/H0z555e4l0
	bXIUnywKnJLSa2iiznhnthfinnuxshWLMNdoGjapp/rwYk7/JmTYJyqUFxRtqCRtJqx2G1zNpjS
	j19SXiZv9cQ2RyPGUX+Xn
X-Received: by 2002:a05:6809:22c2:10b0:57e:8e21:bda7 with SMTP id 5614622812f47-57e8e21c46dmr2805324b6e.41.1795810521312;
        Fri, 27 Nov 2026 12:15:21 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a35e5ab03sm18881561b6e.16.2026.11.27.12.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:15:19 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Herve Codina <herve.codina@bootlin.com>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v6 3/6] dtc: Report first-layer errors at the reference
Date: Fri, 27 Nov 2026 13:14:46 -0700
Message-ID: <20261127201457.1837712-4-sjg@chromium.org>
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

merge_first_ref() reports its errors at the node, while merge_ref()
reports the same errors at the reference, since the problem is with the
reference. So the position for an error depends on whether the source
layer is the first one.

Use the position of the reference in merge_first_ref() too, and update
the merge-first-ref.dts and merge-first-ref-relative.dts tests to match.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v6:
- Add new patch to report first-layer errors at the reference

 livetree.c         | 4 ++--
 tests/run_tests.sh | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/livetree.c b/livetree.c
index 96f4cf2..6389dfc 100644
--- a/livetree.c
+++ b/livetree.c
@@ -556,11 +556,11 @@ bool merge_first_ref(struct node **dtp, struct source_layer *layer,
 	bool ok = true;
 
 	if (!plugin) {
-		srcpos_error(layer->node->srcpos, "Error",
+		srcpos_error(layer->ref_srcpos, "Error",
 			     "Label or path %s not found", layer->ref);
 		ok = false;
 	} else if (is_ref_relative(layer->ref)) {
-		srcpos_error(layer->node->srcpos, "Error",
+		srcpos_error(layer->ref_srcpos, "Error",
 			     "Label-relative reference %s not supported in plugin",
 			     layer->ref);
 		ok = false;
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 58c4a38..f1f8168 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -778,9 +778,9 @@ dtc_tests () {
 	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/test_label_ref.dts"
     run_wrap_error_msg_test "nonexist-node-ref2.dts:9.1-12 Label or path nosuchnode not found" \
 	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/nonexist-node-ref2.dts"
-    run_wrap_error_msg_test "merge-first-ref.dts:4.13-6.3 Label or path nosuchnode not found" \
+    run_wrap_error_msg_test "merge-first-ref.dts:4.1-12 Label or path nosuchnode not found" \
 	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/merge-first-ref.dts"
-    run_wrap_error_msg_test "merge-first-ref-relative.dts:5.15-7.3 Label-relative reference label/node not supported in plugin" \
+    run_wrap_error_msg_test "merge-first-ref-relative.dts:5.1-14 Label-relative reference label/node not supported in plugin" \
 	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/merge-first-ref-relative.dts"
     run_wrap_error_msg_test "merge-labelled-relative.dts:8.11-31 Label-relative reference baselabel/subnode not supported in plugin" \
 	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/merge-labelled-relative.dts"
-- 
2.43.0

