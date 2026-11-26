Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795718499;
	b=JF3uO31n6WmmQXeIDlx7ArZgnzVIqVhzBUbkpoLWzteFIMat7dcGxjQSY3vIdtw6cO2X
	 q0CVTJxaZXP0prbimLuG3d+wNe4vHdwrrpbU7JGTnpI+lXWiHDbnuKJHz4Znh2Cc0s8J2
	 9kaDN2M2gICBD+V0AlNoD8Ei7sDm7UDrfEPq8pIbGeUmBrA5rcYPO7rUQ94aAthqCwE7N
	 9pwZYbX+ZD2eBmLydR1Zp6QYrusbuXhjOO6VHWZhGmpqNZgK1gmGHn/t03LH8oLg534pw
	 I0jLRL+mc+W28aUuNvauCaeb1oCvlsKUNgMPAwHswSR2LGWqiMVc9PO7fJ9W1LjA8VA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795718499;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ySNJvBoIRy7isQtH2WrOPu0p2lLgteOBG2dpb9cLNaA=;
	b=SPm2lgclooDMd/20HlNras7lrnaizuj4QdY0yqYaEtAiiIIplS5LJy1DOJyqyYJfGy1e
	 LEUZMSLU+MZX6t0MyBBBi4seigsV7PupT57EAGd3kZPq3I9uGfansr5++Is0r5SNqVI4x
	 W9mJeVWhNuLvV8MPz7Ivfp0dLdGQK+jaimHZD1JM0hWxJHXmkOjySzgX/vAlqiCr3xPdv
	 TnfGhCjFUXJwfJAkwEHww8xR+nYbgrIOjGN8f4KvCKsTOoD/+BEFhoUTq7TL7P9rVYyS9
	 QBYcv0YsKi8EUsz2zwzBEagPCM7DARi74kmdEXy3NZC65/m1ybyM/aqdrgtzGiYq6Bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ciJBDrZM;
	arc=none smtp.remote-ip=209.85.210.49
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E33606A327
	for <devicetree-compiler@vger.kernel.org>; Thu, 26 Nov 2026 18:41:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39E33606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ciJBDrZM
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-8629ef8613aso2797489a34.3
        for <devicetree-compiler@vger.kernel.org>; Thu, 26 Nov 2026 10:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795718498; x=1796323298; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ySNJvBoIRy7isQtH2WrOPu0p2lLgteOBG2dpb9cLNaA=;
        b=ciJBDrZMbT9P9lVA2Kezs9Y5B01SjChM/NwJDL1+rGLAajI5mfH/D/IuqYsVed8V/h
         ObEsqzxWyhr7OX7fX20EhRsSbr77FU96T4iW5n3pGrC4y/iYPUdjI0qfYKEo7faEVD4u
         B8hOb7C4NNItDu9g7xI8azPDcO3TmdQDSr1/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795718498; x=1796323298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ySNJvBoIRy7isQtH2WrOPu0p2lLgteOBG2dpb9cLNaA=;
        b=DvJbPVi+ekhzkq+B/cvWHDhP3xbx2zk5zXlf+CTQDhCgdD+gbGcr4ITVK/6FKPCxQA
         CRoDeOWVv57MiYG3EVfWVdTQOKg5jCtjhoxHxWFqISyDJRnyBJgefKkth992h+zywn6C
         mFiNsRXz2o1aJPEZREXspOMKyZZo+itTmrwROPFc+pBjDXztxP6IjnITsUtncIOXX6xL
         righhTZaGcZRrH1Rk8Y23AVNstAK3Efq9Dh3E9yvZf6LrBGCjKU/Oxxnbh4DGgtIKT8F
         NPdIjnFs8ax1ioFis4C/THKmFZKKehfWyT7pjAOYUHmgBH2qF2XPQerjDlc5coxA6MxA
         mVaQ==
X-Gm-Message-State: APuU4Z9Dhv6vKOhrhOkBnrQvXQqa6WF8QhkPryR5Xzpa94FpEuOLFnSG
	zatrDt261a55VhtH4zYD+k1yuv2BrkwRkJ8MxWRBd6TyuuNAFureot1ZqRGumUsgTTq2NheuzhD
	rpwiZbg==
X-Gm-Gg: AZFdTZdWBHQoxMTclh8PEY5lfji+CmmQ5KUUIMOE+WQ4GI4QZ9LZ0+ib2DyeJozjuMc
	NNCMM++UXp+70PMiKSxA/QMukqCEC6f3fk7uggivp1m7ahoXOZ4ktbGi2kji2i6AFUIP7paKX1V
	2+uMMVrZ2RM92bAm1JOt2kNQUW/FwKvgoeoPWYcFXAyG7TIId7JtyVsfuoYnMH+nNs5YK4h4vOt
	5C7AazkFvG6/HdpKuzFLQEv18G0z2VkzQRjY+G2O1Ko6iTn1Rr/5kgfWYV9aIxID6M5dH8jlQkO
	5LsgZ5CLzx2RcRkdOs0jS4xZ06Sc5kd7EoqKNuz0sHx2HZQPMT0ShNXr5rbVj+OhWEInTz9p0zS
	V/CKJDCioRwRfRBfKHWzqeqvRMcy33wgl2j63pyxR/2EvzWjDuthdVIVpBEB8LeP9D/u8aoKB9E
	o9ZWQn6qwA26xwXF+mZUaXMqfTx6MzlJJOasAzcpuAUAfBwdNKbbjuEs83MhxwNRqMIk/NDVo72
	MJLtjP08hdTCsdXKEZHab9+fhLyeJEpB/WFMIKLe7azAY9CxBdeYCuIKSMuhf1Yka1WrIEUttBc
	FUCff2peMfQPuyYIUficBPOCE2H6vLgUBKmxr1ReGRcrIytpX4HNxqQXIgcOCXddYkP1Xmzz1kv
	Fnz8+IZUvCpQJAkdYu8yJIQ==
X-Received: by 2002:a05:6830:4107:b0:862:a0ce:f55b with SMTP id 46e09a7af769-86315786a7bmr26324031a34.20.1795718498217;
        Thu, 26 Nov 2026 10:41:38 -0800 (PST)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86316910337sm15109586a34.23.2026.11.26.10.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:41:37 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: Herve Codina <herve.codina@bootlin.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v5 01/10] tests: Note that &{/} in a plugin is existing behaviour
Date: Thu, 26 Nov 2026 11:41:00 -0700
Message-ID: <20261126184126.1472738-2-sjg@chromium.org>
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

In a plugin, &{/} { ... } becomes an overlay fragment for the root node
of the base tree, unlike / { ... }. The merge-root-plugin.dts test checks
this, but this is existing behaviour rather than a deliberate choice,
and it is not clear that the two should differ.

Add a comment to the test to say so.

Suggested-by: David Gibson <david@gibson.dropbear.id.au>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v5:
- Add new patch to comment on &{/} in a plugin

 tests/merge-root-plugin.dts | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/merge-root-plugin.dts b/tests/merge-root-plugin.dts
index f67355e..a5926e0 100644
--- a/tests/merge-root-plugin.dts
+++ b/tests/merge-root-plugin.dts
@@ -6,7 +6,11 @@
 	prop1;
 };
 
-/* This is an overlay fragment for the root node of the base tree */
+/*
+ * This is an overlay fragment for the root node of the base tree. This is
+ * existing behaviour rather than a deliberate choice, and it is not clear that
+ * the two should differ.
+ */
 &{/} {
 	prop2;
 };
-- 
2.43.0

