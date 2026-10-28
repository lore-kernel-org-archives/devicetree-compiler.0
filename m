Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180196;
	b=EH7vw9dE2EgdcMI0KZLe/kKcHBa+Xa4yg3/t/IuTtHWh3/WCNI7ZOAWBhj3KSac3zT9y
	 uRu+V7NZLxAdKQwzQd7SPCmchEPJnhRB2X5u8aHyJKt7J1DqR7D8m+oWsuXGJGQy6dB1k
	 uBz85croUDBx5yxT2DRXDbakaKgDfBpS1yU/pU7pJOhPnBUiTQVyfMoCTnaZPbWWXeg5T
	 cgkJ4OtIvF7PvxMnJaj+5vjmh7BUnb6F8xJf/swzEOrDy3Pa7s6Y3kWb84oD3IkrDU0jf
	 GXxAN4UsZ58548N0NatRbO+JRabmLKpoDdlq8f/pjIhQ6HrEoeZSDd18p4hPaFIxusQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180196;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=W4OVLQhTgi0WQlSJkimFfAacFHqcospgWt1ypMwpAEI=;
	b=LjQtYNrPuJulv/68+p1j7r7CwoLYRtLdLRmGAGMHXjEu63SpYVsELvIanK69Nojg3mZV
	 DPxzPrNA6NAYtAuD97pubimIvB73tM8hOd8T8EYkcfVYZLsl4pjNKj4/l24JcNoFsaqSX
	 8/SdJDyGnPZMXB8e5xJFep+goVEfpE2pw6vrDPGiZ7F/+ZNNBayNVeEAWHTf8ANT7d/mW
	 TOHmwyd8A/3475vnA4uvuzZtZOgMX/GkbN6w5Ajn+LSERaTm3vQYlHqn/s26q/jQzyQqg
	 QUiemnZXTwq1yjTz77VKsBelu0xaXUd4FSYw8bHMspGefdw44Jf22qxK4kcHc4WL2bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=YyPpLeH5;
	arc=none smtp.remote-ip=209.85.210.49
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62473606A31E
	for <devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 09:36:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62473606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=YyPpLeH5
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-84e513877a3so696238a34.0
        for <devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 02:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793180195; x=1793784995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W4OVLQhTgi0WQlSJkimFfAacFHqcospgWt1ypMwpAEI=;
        b=YyPpLeH5yWOSuW2x151XavVEqk0VG6JT5wksgHiMomBu+LLDivUucENO2dcwq9LtPA
         5J5P2U0szpTgjTABkRnegKN2spg/CnZXLs/d/8v0DkwQ0zlL/Jm4XLE1Q6x/YGWUWC02
         HccSecULfKn4ZNwhSLt2yeT1XuLNj5Ntl8xPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180195; x=1793784995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W4OVLQhTgi0WQlSJkimFfAacFHqcospgWt1ypMwpAEI=;
        b=BJjCfKBackUt6zPv1M323R4Nqut6QD+GIZ7JLpcB/3d0mVVssfqh91GxAffoBruNhT
         cG3pqwB22rhgO/r1ZziWyP1ZgN0k7nsQnc8J/uzqaG02YqjLkkKG2Uqi4/HQbdwNRF41
         gtofOoO7pydcCnuNP40AUHWFc7/uMMmUO5tSrsJbj8SQwjWQvb+RNBiO2sOq3ExKIoP1
         i3cCrpzKkWYVQmQYeHUWA8N6ls1vj5Q2K4v+ATCFlf7Zn8aD6GdPt9ZN8HFX4f/XYKJ9
         LmcSVmveiM5PHzDzG638gUZpOn1Tep5Uc////wTyRBFzRiDgQcOulKBIkxOOi50rfCz8
         gSAg==
X-Gm-Message-State: AFq9FYLd76VWR5KCIFIbW2t9pL4yuddeJ0mtWs5vbdGX6EwdnhJvr7Ke
	62UbaPd80b9n325lUR/2K9p7yKpMq3xGZKmD0I/5eXcUNlvCbWstoZnYX6HGdtd/qj/Une88w2d
	nDpvNQw==
X-Gm-Gg: AYBFou1q7OFC4smRjOh2E8Gh/qH9Ft2t4lWSNXF+cjy6rVpym7NPGKRq88AQin7D1oT
	gAuo2sed6655nsl4slTMrh1HmSnk9MQu0Bqrl/uH60p617iXvWbSI2xylEgWsLxKBf/6cLNm8FZ
	NKH+jW4MtBDh0Uk4dMwQdjs2jxXzPUI+Sqes0Xrh6L71V4qJOymBDyi6QNwSvzc4OjBue8nR1Et
	2UTgdqqxq+hzZD0Hfd/qey7QA+OkJWaqeAeoDrhFT6jmTFSOtHupMd6lkRvBfl/OOMim3lrRxi2
	cnEii1zkj6qNOQIE4qGYF1ukSH34dj40qLjeOXSY0247NUDCsKTzRr0/0qz+GZUhW6mBQM0uPj2
	SBvCpBU5xi9OxlOD5b95N7lf1bVSxUxq2SM33DKZ7OVT4uYkmcUdyWLdiYBW1RdGiDUQnKn1Dcv
	xkThWAgIefTqcywQgqTlD3olAvlba5Q8uI2cHf2P2MAouJhxsX6n8SXIxFk+9X/UloZyexSvClu
	2kvg2TjKHefkNZSrnuu7fn2Xy/gWFK6uaRkwn2+0vopePAbDzuCtYhu4OiLKC+w+ODjftfoYDfT
	htn8PxumId4ZLmKNVTfwbR7qtF5+CtorEMlNrARe1KbnDr/uZUL/DGd9KYMYRw==
X-Received: by 2002:a05:6830:2645:b0:848:8d7d:4e47 with SMTP id 46e09a7af769-85941ce2036mr3112772a34.10.1793180195345;
        Wed, 28 Oct 2026 02:36:35 -0700 (PDT)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85b205fe36bsm1099953a34.24.2026.10.28.02.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 02:36:34 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v2 3/6] dtc: Clarify when delete placeholders are dropped
Date: Wed, 28 Oct 2026 03:36:10 -0600
Message-ID: <20261028093620.3705074-4-sjg@chromium.org>
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

The comment on drop_delete_placeholders() does not make clear which
subtrees it is for. The call in merge_nodes() also relies on sections
being merged in source order, since it drops the child's placeholders on
the basis that nothing earlier remains to be merged, but nothing there
says so.

Say that drop_delete_placeholders() is for the first definition of a
node, i.e. the first in the list of definitions which are merged
together. Explain at the call in merge_nodes() why the child is the
first definition, and that merging is not associative.

Suggested-by: David Gibson <david@gibson.dropbear.id.au>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v2:
- Add new patch to clarify the comments

 livetree.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/livetree.c b/livetree.c
index 6609e4e..b7a5161 100644
--- a/livetree.c
+++ b/livetree.c
@@ -122,8 +122,10 @@ static void apply_deletes(struct node *node)
 
 /*
  * Drop the /delete-property/ and /delete-node/ placeholders from a subtree
- * which joins the tree without being merged, since there is nothing earlier
- * for them to delete
+ * which is the first definition of its node, i.e. the first in the list of
+ * definitions which are merged together. apply_deletes() has already dropped
+ * what they delete within the subtree, and there is nothing earlier for them
+ * to delete
  */
 void drop_delete_placeholders(struct node *node)
 {
@@ -273,6 +275,14 @@ struct node *merge_nodes(struct node *old_node, struct node *new_node)
 
 		/* if no collision occurred, add child to the old node. */
 		if (new_child) {
+			/*
+			 * This is the first definition of the child, since
+			 * sections are merged in source order, so its
+			 * placeholders have nothing to delete. This is
+			 * important since dropping them makes merging not
+			 * associative: merging later sections together first
+			 * would lose their deletes
+			 */
 			drop_delete_placeholders(new_child);
 			add_child(old_node, new_child);
 		}
-- 
2.43.0

