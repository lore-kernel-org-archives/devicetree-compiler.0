Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180206;
	b=L/SlzhVqkb9X/YVvYcaR/sjVMmItCtTyY699UQhC/NRWN3/P8KBctLZA6ATC0UCxY4Dw
	 IGyVconftSiapb3yYCs1754KaXjEjnUoLAv/SQs2cTOuZg8sAaQAG8HgqPBIt74K6B6k1
	 3g/pF37i5Jp9qniUGeunUD3pcExWzflz/SEJXWgqSONKrxgVKVSg16Zo9iU4ibBbkWIvu
	 PXDTxvZsTz5mVU8zLu1+IcpGQjivB565Nq5ohvY5HLwQ3ar/fCIdASdPCReqjMQ+V48oR
	 DrPgapco/nmzJhlOJy1wObEnF84hLxSi7zRck5DW69Yjjn7ezyIGb8zkKa544SwI6iA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180206;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kp+nBPX/GTtzmzgtAt3psTUn30bwaVKQrh5fr4xdaxg=;
	b=vKxQtE56HWs6/gVIZLFDzlf+p6gjTj0vFHllxMwLuZqcfCp7164x1kIwpSTPRNgaxKiY
	 2sG4d+HddZxI/VZC6mL1usufWvIIA+IxbrMJHoWOZRTvqlLcbXMGWYZu2Oyg/r2vLQQ2c
	 FRVe/P7D8j2WikujG7WAEYfQIp3OLvWFal0047pjh4niQbwQC31e6XF1/fe/1IPFqImfc
	 FjkwU6vtjAvz/XGufT+2c+7CuaMiUhN3sP3Wjh/Grw4e2EYyulRzp/wuAFMjdrY8puP6S
	 c56bT01ZfK1QymH81qlFEyyxA8dPKXyZRwByX3oaVOPTVmnFlCo3yMFe/kDIOv3EPuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=MagGfBRW;
	arc=none smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6094606A320
	for <devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 09:36:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6094606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=MagGfBRW
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7f84a55cc06so405503a34.2
        for <devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 02:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793180205; x=1793785005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kp+nBPX/GTtzmzgtAt3psTUn30bwaVKQrh5fr4xdaxg=;
        b=MagGfBRWqkc6lG8xfl8Uio40EvXI6ph54XrLkk8uKI5t3AF/75+eaZsE3hPo0cDB/2
         NaKYaWctDmELwqTDQ08QjbNZxMYzldnv6xwRgMrgxAT2Sd2y9dIwnci25cTiD188/UeQ
         BYEXlbljEOtjdFKmOZN9T74IL2t1Me2oN7H/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180205; x=1793785005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kp+nBPX/GTtzmzgtAt3psTUn30bwaVKQrh5fr4xdaxg=;
        b=JO1poUVI2X864L8yKBfKt4aVVbUo5TD9nO/s5J+wJ6MmBKiyg229P8a5ZfVW5LteNC
         WvbKvYGNL3nHDeu7A+T22X2vQOyANl1c6RCGB2zAZEp0BUoYf7bP81IO+1NxzIwyevrX
         7QgbMVUjeaKx3ikLlst4vUTbghn+maP6vWNU7nCTDQjK8eIOFEhzRgMR60taVigVEiZE
         1Q8ppIlENt4nbSwSdch3Zyz9QwzXNtPx0GfQDE/YqQbcFeR1/ogiweDPRHn3a6rEOP7x
         qA8ijVOhSysQFZleQ6KXm+bddQgi1PZmFxGhgO97ZCKlMg2iimvEz/OuKg6/npoLgS4o
         9HRg==
X-Gm-Message-State: AFq9FYIQT5WjkdaWAqzeMuVxfUr/gj4ZTERzF9W6yCysy3yOZitbN771
	gL2ooPn1N4rSawN8nnKacNVdeU21Q6pFASo8jPzxby+/CqfR7GODfyVpNSM5rqTYgmlEmGDcsAX
	Y9QFWdg==
X-Gm-Gg: AYBFou0jaKciHR4BYqJ/mmhMlsgh7y5sDKWwrvwxdfY4lGRSMRZFdHiaYw2PMnaNeri
	ABhns6eFn0gT6hHxinrfjRYPBJbgD3nBiSE1EvGk1Zc05cPRspz1RAZeBDoFDOqxyP1woK8PJPv
	yFUBddicIeQMdo5DQuldYixKiwsKG6OfrKxmIc0Y5z+pzaA59rxgg/b4owg1XsSCTy1PZ0WVehH
	ZZ1/LvTnD9A4XdqO4f4JBegPvz0/X4P6BpFegyZDOax/beFbAw88QCNIiyWU+5P5BUAKNUE8zXD
	XBOvc0aqmlzBtqZRRZ/97WR3JkT5PtIn0Ea7JZE9s+sD4HM0p8iaNjf9EkjTV1HOhOh9CdhIBk9
	eqSswENyUpUMF+I4JxCLHO+ce6KigEfVfFRJ4vWZ5F+KXQ45cHSxFM7mIq/PfOFv97L8YCQTJaX
	LrkgkJO5xaH3rdEB9wyynQ/eoMv+Tdmy/7Lw0a4SM9iWG+8ifZz0cQ8YqBGG2TQ+xoR77XaBOJ+
	bUFVo58n5xPLt5t+Hyakdq8DAp39gXoHDckBYNHaPJUutVATvrYhIS/1vqpJGOd3zWJAsP40/5B
	Gjraz8nH/rwFbYE9bt73XK1vIwgoB/0Rovdyn5PwBEruSIIHLYYB4B8uG7n0D38otrQDUCbdBWj
	dZIZC3nc=
X-Received: by 2002:a05:6830:4c02:b0:81f:6ea9:aba9 with SMTP id 46e09a7af769-85ac0800765mr1710228a34.20.1793180204866;
        Wed, 28 Oct 2026 02:36:44 -0700 (PDT)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85b205fe36bsm1099953a34.24.2026.10.28.02.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 02:36:43 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v2 6/6] doc: dts-format: Describe later definitions and deletes
Date: Wed, 28 Oct 2026 03:36:13 -0600
Message-ID: <20261028093620.3705074-7-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028093620.3705074-1-sjg@chromium.org>
References: <20261028093620.3705074-1-sjg@chromium.org>
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

dts-format.txt does not say that a node can be defined more than once,
nor describe /delete-property/ and /delete-node/, so the rules for
deletes in the earlier patches are not written down anywhere.

Add a section on how later definitions are merged and how deletes
behave: within a definition, before a node or property is defined
again, and in an overlay.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v2:
- Add new patch to document deletes

 Documentation/dts-format.txt | 44 ++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/Documentation/dts-format.txt b/Documentation/dts-format.txt
index 41741df..d594822 100644
--- a/Documentation/dts-format.txt
+++ b/Documentation/dts-format.txt
@@ -116,6 +116,50 @@ Version 1 DTS files have the overall layout:
 * C style (/* ... */) and C++ style (// ...) comments are supported.
 
 
+Later definitions and deletes
+-----------------------------
+
+A node may be defined more than once, for example in an included file
+and again in the file which includes it. A later definition refers to
+the node by '&' followed by its label or full path in braces, or
+repeats the path from the root. The definitions are merged in source
+order: a property which is defined again takes the new value, and new
+properties and child nodes are added.
+
+	e.g. / {
+		serial: serial@1000 {
+			status = "disabled";
+			clock-frequency = <100000000>;
+		};
+	     };
+
+	     &serial {
+		status = "okay";
+		/delete-property/ clock-frequency;
+	     };
+
+Within a node definition, a property or child node can be removed with:
+	/delete-property/ property-name;
+	/delete-node/ node-name;
+and outside any node, a node can be removed with:
+	/delete-node/ &label;
+
+* A delete removes the property or node as defined so far, including
+  earlier in the same node definition, but not one defined after it.
+  Outside an overlay, a delete within a node definition with nothing to
+  remove is ignored.
+
+* A property or node which is deleted and then defined again comes
+  after the existing ones, like any new property or node. A node defined
+  again has only the properties and child nodes of its new definition.
+
+* In an overlay (a file with /plugin/), a delete can only remove
+  something defined earlier in the same fragment, i.e. the same
+  &label { ... } or &{/path} { ... }. An overlay cannot delete anything
+  from the tree it is applied to, so dtc reports an error for a delete
+  with nothing to remove in its fragment.
+
+
 
 	-- David Gibson <david@gibson.dropbear.id.au>
 	-- Yoder Stuart <stuart.yoder@freescale.com>
-- 
2.43.0

