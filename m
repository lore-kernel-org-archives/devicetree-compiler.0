Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69979221DA5
	for <devicetree-compiler@vger.kernel.org>; Tue, 11 Mar 2025 15:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741707359; cv=none; b=uwWhY4kL14Qr152ypJ+5HAhauVo7z3zjiluIAD3P8oDqZS+83CjbeELQgK1y/V7CqarOswAgYB/6//SIfyqlQ3VG5I35VqurkW/vYAfJh024kkhBe/urjviKaN8c6RcZXXTcVmWdXd62GPN6HTefmd7YRO/EdvR0Rk9WU4l4Wsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741707359; c=relaxed/simple;
	bh=X7yF/Pi8/5Zwz0C56C/nFTdxmYLPc0xya9ZlasLZblQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b4/wqSB7KVlUqH1k1w72V/tjsKPwxYKtHPzlci5ox+BnzgdMO/vF9gVfMdM9e328Huh0BzuixETuIm1UCq/riK7HMZmpHgL4mCvLUzPp6GI0t1YvUIWVHd/nPe05DuZLwUG8XSRCdAl656XZnIdTfrGUbUSttQ6ay0yATP/0GJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=oDmQr0H1; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="oDmQr0H1"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2ff6cf448b8so11369196a91.3
        for <devicetree-compiler@vger.kernel.org>; Tue, 11 Mar 2025 08:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1741707357; x=1742312157; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a1vTKxNZnReM7IWBW5n16lH9S4xyQu5K+TZhb51jebI=;
        b=oDmQr0H1REjbrTlKINwmxsfPM8dn3ucvv0EZJrksEn41azhoCj4cI6FJGE4XAK82D/
         bfK1c3YNP9qeaCGJMCAseaAXKjfBcBLWSalRwsFq1j0U+8YTHPxzL8wHhAdNLwKHQ9Tb
         cgxwxf0AoyfXgkXJdISfQAnDoWpaL2rihMbTtKUhV+5gJnz2sBMZQfT/MZfPOHPC9TJi
         4ZvkouATpjVqpfFO+2vzUC/ZbP3wxb3JTTyVgOnVbuIuMBZcuoU+NA/GoCiumxIuPBvO
         7JJfkHAPYXGjQNQVuYnhAry8/1iOwZB12XS9Hr9AhObEvm8+/x2IK+VBFu94UNQBxP0t
         5G4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741707357; x=1742312157;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a1vTKxNZnReM7IWBW5n16lH9S4xyQu5K+TZhb51jebI=;
        b=vYl8rbV0KG+eiIWYeVCssu6im3Eu4AsA8wqd6s2Ohxyn0FBySJ5+uncDCuXfm2wJv4
         SCuZb1rKVqmsOOXnGCpINCgKy7iNTv6MMkNlwaQOYcywTktukviZqq3Vhrl8AA2nY17E
         YDxWmLY5HnHroknTFpmu4YvCcy2+L9E12Tep1CR7EOcanlv1TWPBCir+/smpPwBOu+as
         StEE+HuvVIRIu3KB9XPG+jcfLvRoSYhrbZ/hb92UX6ajuqr7QQhf7lvOCu1SpUEa+IqD
         t8VtUFx+8StqoYDjsvZnM7bgdFHewThpE4weWbiqEEdayYwecDZQNElw1rDOVbryS5gJ
         aWtA==
X-Gm-Message-State: AOJu0YwSd8zkldDqEZFROelO4vXARHc4Y0HJUVrpP6Js/Gg3WvVFS3Vu
	/KJuAza8fWSoMHKl82weVHXrEkqqt9Ewg8b3UkCxQQ+3TDli9pf5LLMr9zykGhLyMhHxvwZE+EI
	GcQ==
X-Gm-Gg: ASbGnctYpZbxd061+u84C7ugrSHJiJ3XIgCfDHTJWm51zqXz1tt+okSKPgYK7hDhFAU
	IsZgtcpy0G9sKZDz+a51I+2g2PXmjgdIFfZfA49rh+7GDyMsNBtQa6VrcPDAkavQd1UHNWXOvkJ
	0aaz/h659Ggw6NoNlh0mDOiOjsH1A1To0lT7nSapueZQKCDoeGlFAmaYOfyVW3cwtZCJHrQTB/4
	ghuiQrEFQds57/RIjfHkjbHcW6JDfyKiaoAWZiIhMxL6ci1qEe+2KFI8Ax2ThfmJg7qr7kAfpjj
	TcK8gUVkt3sesTFXj5s7sHw+18dCILV1EDuZJ7zvgAyvaV00maEobzmjD3CYJQ==
X-Google-Smtp-Source: AGHT+IF3Y2ijVkokaS/t+/RbLNd+cHe/OFkQvoQPvk36JeRqHzGGluKk5UiyP1fa87CDSOolUf15Sg==
X-Received: by 2002:a17:90a:ec87:b0:2ee:d024:e4fc with SMTP id 98e67ed59e1d1-2ff7cf4cf61mr32127160a91.33.1741707357539;
        Tue, 11 Mar 2025 08:35:57 -0700 (PDT)
Received: from [172.16.118.31] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff4e822bd2sm12030413a91.41.2025.03.11.08.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 08:35:57 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
Date: Tue, 11 Mar 2025 21:05:38 +0530
Subject: [PATCH v2 2/4] srcpos: Define srcpos_free
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250311-previous-value-v2-2-e4a8611e956f@beagleboard.org>
References: <20250311-previous-value-v2-0-e4a8611e956f@beagleboard.org>
In-Reply-To: <20250311-previous-value-v2-0-e4a8611e956f@beagleboard.org>
To: David Gibson <david@gibson.dropbear.id.au>, 
 Andreas Gnau <andreas.gnau@iopsys.eu>, d-gole@ti.com, 
 lorforlinux@beagleboard.org, jkridner@beagleboard.org, 
 robertcnelson@beagleboard.org, Andrew Davis <afd@ti.com>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Simon Glass <sjg@chromium.org>
Cc: devicetree-compiler@vger.kernel.org, 
 Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1478; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=X7yF/Pi8/5Zwz0C56C/nFTdxmYLPc0xya9ZlasLZblQ=;
 b=owEBbQKS/ZANAwAIAQXO9ceJ5Vp0AcsmYgBn0FhLHfKmyfVTez0xF/OzQncl5g8zRKkNSLPOz
 gRGh/CZdbiJAjMEAAEIAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCZ9BYSwAKCRAFzvXHieVa
 dDPcD/sHBA4BOB1xvRUBf0IriDR4lRg/joUpWz9Us6miGQZfz2ckbQCtjiRosLgvNXNbqOjWjga
 uhFLsCEfN1pmP0O2hpUGii7k/FHB/vS+ROPDc+FoLL5RFmXumFJpcANdzLNSz4hElIZOFJqNEXk
 yKPRoNHRbn0GFr028OKtSEKifczCVsVkafNZ0HSoH8mtf7L5FJxdc3ov3KiVic6es6xacZbAiEN
 nghsGl7J0NO710VUYjf34hGi6u0c+BvfZBraTx8BuTcs5mb12BmzmbOfUvKa/m2PvOh6LyadcgY
 Ay/QiAKsKk4McBzR/hOS8ldhodl5NdqJlbh5oT/9RaOfemEXO1gLlzrC4Ep84HWoAIrR6x3W1T7
 Cp97mYWdMG6YXBK/hUr8d2DebR4+PmKLNe2b+dMclOttIk90LNHESo9B8ojzW5oSyUlIPzFqoOf
 9AjgVPeiUvzVv0ob9qLz2sr9omuJnfXT9f3PM9Y09EBOwGDtc6xaPNeCRM0vgG34PI4mDpsh1Lx
 UGn6ktwj8SvCMhKi4Pt88K5EJ2mykCqq3ksL2AZxeu8fF9vxZRt5obsfq6a+MWOEwOLoX6kXH0l
 9piI2du8lSnJo953LeipBULYVIo20GgR/+HqDmG041HcGuYLaXkRlxHC5AYh4HHs6EOhZNpk7TC
 zykIsbvuSxYrg0w==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

srcpos can be chained together using srcpos_extend. However, in such
cases, we need to free all the chained nodes.

srcpos_free is a helper to recursively free all the linked srcpos.

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
 srcpos.c | 11 +++++++++++
 srcpos.h |  1 +
 2 files changed, 12 insertions(+)

diff --git a/srcpos.c b/srcpos.c
index 5e2f7dd299184ff86b00b280dc31498cb9830e28..5bb57bf6856c6ff6b8eb993aff5d216c63bf5ecb 100644
--- a/srcpos.c
+++ b/srcpos.c
@@ -287,6 +287,17 @@ struct srcpos *srcpos_extend(struct srcpos *pos, struct srcpos *newtail)
 	return pos;
 }
 
+void srcpos_free(struct srcpos *pos)
+{
+	struct srcpos *p_next;
+
+	while (pos) {
+		p_next = pos->next;
+		free(pos);
+		pos = p_next;
+	}
+}
+
 char *
 srcpos_string(struct srcpos *pos)
 {
diff --git a/srcpos.h b/srcpos.h
index 4318d7ad34d91d2ada1a5d7f92d2c84148fec366..4d60b50e31197c2da6a7fa8851c5e5a6717d78a6 100644
--- a/srcpos.h
+++ b/srcpos.h
@@ -88,6 +88,7 @@ extern void srcpos_update(struct srcpos *pos, const char *text, int len);
 extern struct srcpos *srcpos_copy(struct srcpos *pos);
 extern struct srcpos *srcpos_extend(struct srcpos *new_srcpos,
 				    struct srcpos *old_srcpos);
+extern void srcpos_free(struct srcpos *pos);
 extern char *srcpos_string(struct srcpos *pos);
 extern char *srcpos_string_first(struct srcpos *pos, int level);
 extern char *srcpos_string_last(struct srcpos *pos, int level);

-- 
2.48.1

