Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDDE3C17
	for <devicetree-compiler@vger.kernel.org>; Thu,  5 Jun 2025 10:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749120553; cv=none; b=Wi9eP3zPL3M4PX7E1VArxlhmYeBmMM2uAyfTmATzI/t+8Vo8TokQatq7I3Yvwe08fhF3RM0H5xl1AXfyLb6qg08ZmG9qpojc43/bao0JTkwSINOX6JtvIPHPX5YT48wNHlu82Va29i3WnEtNECV/Z6/6+nv72jIhNuOULUa1yCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749120553; c=relaxed/simple;
	bh=cmGA7Vp4jgL+oLOlnLu2xILDU1/CBgZeRBP1KliA7A4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b5+5cxvt3F9KBst9yZkuIE3bmMd4OzsstyneRCpkIh0yYTK33MjXsIIp6REeoNAawWzNlZ1lI0ugKWTzkqkIsvn6J0SO2EjhRy2aLorHpcZ2hknd9EgQTs0801BWOVpPzscYRoK1AKs+UjKLVe+1408JdjWggQRUUreWQoV/7cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=AYfmz5tj; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="AYfmz5tj"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7424ccbef4eso780663b3a.2
        for <devicetree-compiler@vger.kernel.org>; Thu, 05 Jun 2025 03:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1749120550; x=1749725350; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KTYKGtGhkQGNdBGuM+nE1m4Gd1pD2YZr6/UJTtRj8UM=;
        b=AYfmz5tjo69vc+5GfeIaskrYeH63Rba1uQoMEF/+iHIsy5PrABo5VPjeFZQDl3OQVd
         QUFl59NH4wRS/+I9avfreloV1A8HfispmG22SV9yrjCIgLvikoUlHYqDzmqXZAY5OWDl
         ccEBL0NIzCXdqr2mYjty/66fbG11BNAnkJVF7+9d2B50ONUky2w1YbpvRRUqnve88jm4
         6wOMiF0zRvYsEQuoRRVjr0h6UvianhnWCCse6Xzx228Bvyymbm168ul00W5JfHrxzWjg
         5+uswlrATj8XjK+LZqJc5J1e6a1kPxW1KWjtge1yK9c7mrwfvVnpDeTphVs4TtTFh4Qn
         ovJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749120550; x=1749725350;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KTYKGtGhkQGNdBGuM+nE1m4Gd1pD2YZr6/UJTtRj8UM=;
        b=kgxtdAQ6MP5d2YxJZYL12KG0NL/RjHHaE/uRyEWFU2yrFU/RTcBYI5PSOvzCajDmjV
         oSZuqgm6WT9yIzwe7SJge7FqclUsSbfayTWGqLjy3cGJvG60LO/bzufTYUWPgTV66qlL
         27HoLbFjGR3FxY5Lud0Zs94ClqdOJN+4de+BV9aO4gqONWVAvuxNVrBKM2hb6ND4rkXd
         LJiPXjaUpea7gSpx3ItAts62oiVxtT0fbCKnMhfjaeZwhiMV+frFKU0N6lTDPSwCyCUH
         OfG85GlyYnrA0pfCaKRhTYua1jb5tO3YCGt+DE7WuQCW0BpUs8H64Olueq3y/OWHDCTz
         J+dg==
X-Gm-Message-State: AOJu0YyAIdaw/IpXrKXcNigLaKHCRVM0pHNFunittT88CGf/VoOdNOxW
	PHRvIcJDmYrYRXIvwSUaA8Lq/smGpjLy3DMhxuf0viWdBmaeIv3rm/Ybr+0wC5pp00zki3o6+Iz
	Wm9A=
X-Gm-Gg: ASbGnctOjnaMUUsO3uI24XPWgex0EeT4XYtGXooZFK56pz6jQDNAJkepEangAcElAfm
	tvrDKOnahjcO7cFZK9LJydCOdPJB11+5cj9OikoLPU9kq66YMOqdoccdMsLgLNtd8f1iFAGPXPG
	l/xBmoNjbxKrU/3IzpzH5DJMeFJEnw0yOPp7AyIwA0rgX1YQbwxAfplNn1oNmCiOZOzjGcJ2oYx
	IE5dI7iFIjjvmhtUKLqRtBB6agyzoHkbRsfXCMna4pA49FGEEZffjhCfRYsyeYYeg+GUbSPKfwk
	6NNCsbH+jCZGIzIf7xpff3CxT28X/z7xNNu0y2FK3hQeCKGQMFSyVQybiNkCZw==
X-Google-Smtp-Source: AGHT+IH2qH+aVhjRNU76jDzioWmy/u/nLOyIIWc/O8S5sOjbsxbj7fF/TGRHAA2j2/rtFC1j9LtEfg==
X-Received: by 2002:a05:6a00:2d23:b0:746:2a0b:3dc8 with SMTP id d2e1a72fcca58-7480b457127mr8486193b3a.17.1749120549816;
        Thu, 05 Jun 2025 03:49:09 -0700 (PDT)
Received: from [192.168.1.11] ([2401:4900:8899:bab8:9a99:8bde:e080:9339])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affd41edsm12997594b3a.146.2025.06.05.03.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 03:49:09 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
Date: Thu, 05 Jun 2025 16:18:06 +0530
Subject: [PATCH v3 1/4] srcpos: Define srcpos_free
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-previous-value-v3-1-0983d0733a07@beagleboard.org>
References: <20250605-previous-value-v3-0-0983d0733a07@beagleboard.org>
In-Reply-To: <20250605-previous-value-v3-0-0983d0733a07@beagleboard.org>
To: David Gibson <david@gibson.dropbear.id.au>, 
 Andreas Gnau <andreas.gnau@iopsys.eu>, d-gole@ti.com, 
 lorforlinux@beagleboard.org, jkridner@beagleboard.org, 
 robertcnelson@beagleboard.org, Andrew Davis <afd@ti.com>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Simon Glass <sjg@chromium.org>
Cc: devicetree-compiler@vger.kernel.org, 
 Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2005; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=cmGA7Vp4jgL+oLOlnLu2xILDU1/CBgZeRBP1KliA7A4=;
 b=owEBbQKS/ZANAwAKAQXO9ceJ5Vp0AcsmYgBoQXYdtrQTNq2s+CogN94+dLA/DpyBZET4mY2Z5
 w6skUuVITyJAjMEAAEKAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCaEF2HQAKCRAFzvXHieVa
 dDliEADOfmndAatSNfAyNVSnwN+MYttlb+RywAqxawGmviLoYTl1mAgFKyuziskWiwGMmtzEjqU
 zxrf3Ck03/X//vgkGXeNErESwpP4MpvpCJO1h6bMOmY3Voze9uokJJ2sTehxiZ6epqvqHJxyVjX
 CU/WAar+kha2Vz10KW2YHF4ntJfjQml+T8mW/gswUd5nLk29y0fGt4DeyzuzI0tYXLL1DnwnVEK
 adUbJoC4owEtggIO0HKzfQA3QgVxWq3lT883ZGU90DYRb1pYLHKdZ9bPe4II6hRmUtYlWC2611O
 VKl1F9T6osNwF3tmjU7O57cmmdAeTL9WAVI5C0/f/yMv4EwFAl+zr7bxZ/4xmOe9fYAgvUwW888
 UwnKb7IrdhxVk98FZY6aXTo+cbNTiPo3mvSUyM/7GwtyvW2g4Zk93iBMxuqAIERClYmCka5+8rB
 gfmYau89++0Z0lVoPeq4y7QXUpgkQx/3cNBDIj0FNKa91BjnOBW4lO63hxft7NKxPUBHGE5gQh/
 EnAiBvNlVfbV8ySM+8czeCfOYG+p0D0VASzO+o3JqFEd70ABHfAmFhNwBhUqYzWE5AIDVCy9L4k
 rvsvvr1weWIUjQRByZURLoubttnKpKP//ijCVA1k+KlWlBDUnmslFxufJKn7a//Mp15CAtzM51Z
 0jYzTYBpRlXetng==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

srcpos can be chained together using srcpos_extend. However, in such
cases, we need to free all the chained nodes.

srcpos_free is a helper to recursively free all the linked srcpos.

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
 livetree.c |  2 +-
 srcpos.c   | 11 +++++++++++
 srcpos.h   |  1 +
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/livetree.c b/livetree.c
index 93c77d95a320ec05aa355e12920cef9e1c91c26a..d51d05830b181476ddbab878ef8b556230b58e2b 100644
--- a/livetree.c
+++ b/livetree.c
@@ -174,7 +174,7 @@ struct node *merge_nodes(struct node *old_node, struct node *new_node)
 
 				old_prop->val = new_prop->val;
 				old_prop->deleted = 0;
-				free(old_prop->srcpos);
+				srcpos_free(old_prop->srcpos);
 				old_prop->srcpos = new_prop->srcpos;
 				free(new_prop);
 				new_prop = NULL;
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
2.49.0

