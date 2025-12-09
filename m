Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC0724A06D
	for <devicetree-compiler@vger.kernel.org>; Wed, 10 Dec 2025 02:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765333213; cv=none; b=sUDkZcVZ3PJkbbEk9x8QLLKmeY2nAAA0OmrB3nrPL3BvBpw4kqZ63XYHadk6TdMJZ/wc2z+ApN7jzwp66qFXkzpIQii9S1qHmnmJT5jXp1w4PK1BprywcwI5QWQwyfQ//ix/qnibWdAiayCigCREn7K02jPT4WjGCaxbshA3iY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765333213; c=relaxed/simple;
	bh=8l1VMAdq9EbchkHyWhQYY4nThnW5m+naQY2y0UeksLs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oLyHeb+/1lpTYjTU/jUMRMaD7bGi9U5qAuMF15mboa6PhyDD0CfMJu9k2MsyFCdcrF4iRYNpIajodO1T7dJI9hvWRaWtGLvVD94UEBQJGJBZfWhi755Jn9GepzZA8CqVDs0mIYAsZFM0+S4Xi+HqN7300fPI0GwonAuFbLGy6wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=TMAS00s3; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="TMAS00s3"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-45358572a11so3621504b6e.3
        for <devicetree-compiler@vger.kernel.org>; Tue, 09 Dec 2025 18:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1765333211; x=1765938011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XLHWhdAY/Oo4EFpaDWw3mGUqw0MEaPhylXOlrYS0at4=;
        b=TMAS00s3fBe7fjZcsuN68Td2ciP/2BsBwaZiQP9n/NU1T0iBgpxe+Fud2NC8IOOgK9
         vyXW460WWl/gRHxt1g8OqiN6zuPdQeZO1zneqxTo20nZMZmy2QAeYkybW8lacSB8Q5gf
         sq2NAItGYXboijkvbIIDsLAdfmnIBkjsyaRVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765333211; x=1765938011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XLHWhdAY/Oo4EFpaDWw3mGUqw0MEaPhylXOlrYS0at4=;
        b=JMimm1klXQ/STWMHB5oKeWk7nwfu1jMA/t+QM91DdLPb4PxFGbzp+zqBi1g7M3pfEd
         6TMjTJp1zIL0XqtdWkxrilOKbDWdMQLW9gOGySxI/D9OQDbWUg94XLfrxwISaT4qcAcj
         wlslGW55pFkAjefoQREAYXDcV7tYhi3tIMbHPH6syVBNOAeY5BoIb73ZpNpXYELmrY0a
         FI1XSXm0SjEqwXL/mkJo5ctqxkfxQf+LHMjkedG+rMmRU4hViZ/SQjA/DKnnDqwtj/8K
         WE5nc6ToU8xXNS+El7RAixf4cFPhTT3ZvwHYEsB1TwWtsRTroxf4bJWKiy08+rckEq0w
         +GjQ==
X-Gm-Message-State: AOJu0YxUPiUHGBRaibAYfm78CT34x0pmbJ67n/5FVXp4wE4Vr/+LzOt0
	vle8CUSs6SFmRSbpdFxskkY2VFeKAr8vL48EqQ7w9V25wu+UlmMnCIHSHj5nt/p/oOwoUjwvdPE
	BhOzW5Rs=
X-Gm-Gg: ASbGncuhpjuKo+YGUbQCbkoeehxBeuNCC5HFnpS4B+Ih9v29bRDnEbDBa+Gx3rcGdpY
	mjxZEyoES+OqIROgy+lRyoGZo+znMaByR48p1SE7G5n0wQLlCLmEYdMCGx9Ih6xf9CLSFca+i5T
	zWtnImfTbqZLeheqmYCBrPYZ29ojita4b+UFUkUMAO5ksO6X3Rz+fMsXFyVE+pZ2l9ym7OTcMs0
	KBG4BVqvB2rTAEXuaGdeeBP8szBLCknDX+8WVMQZQcQ3zEQ64ZBabcQ11X8f1Dx4ubWKMkJQhbs
	aad4BOpl18b9R/MM2nbzXtrs+1uY2e0iMCbvnUA1b2dmN4P0I2zTyIE9zje4N8ecK3W0pquO/RE
	5A6dl0gPlmG4RPXrJX7PfU+xS/jgonc8/I7idzdbOE0Cki52sZVYIoLKFPURYutidTmEEeyhE1o
	RmFtD2uW3eEM+UP2cLR9m7dEAAZcxIl2Fdm4HrqBJdmW/RaC5iRTzU
X-Google-Smtp-Source: AGHT+IGilMBeCzZpRtBOJ+/1S7iYmW8ptFUFYw1JlY57k/k5pYBQ1vBYKogK5s58tmXQ9ogO3Z70ng==
X-Received: by 2002:a05:6808:3448:b0:450:d6fe:89a5 with SMTP id 5614622812f47-45586551b27mr665071b6e.10.1765333210681;
        Tue, 09 Dec 2025 18:20:10 -0800 (PST)
Received: from bill-the-cat.. (fixed-189-203-103-235.totalplay.net. [189.203.103.235])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45587ae2dbcsm386346b6e.13.2025.12.09.18.20.09
        for <devicetree-compiler@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 18:20:10 -0800 (PST)
From: Tom Rini <trini@konsulko.com>
To: devicetree-compiler@vger.kernel.org
Subject: [PATCH 2/3] libfdt: Improve size savings in FDT_RO_PROBE slightly
Date: Tue,  9 Dec 2025 15:50:52 -0600
Message-ID: <20251210022002.3004223-3-trini@konsulko.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210022002.3004223-1-trini@konsulko.com>
References: <20251210022002.3004223-1-trini@konsulko.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the case where we have set FDT_ASSUME_MASK to disable
ASSUME_VALID_DTB checks, we can improve the FDT_RO_PROBE macro slightly.
The first thing that fdt_ro_probe_() does when we can_assume(VALID_DTB)
is true is to return whatever the contents of the totalsize field of the
DTB is. Since the FDT_RO_PROBE macro only cares about a negative value
there, we can optimize this check such that we are to assume it's a
valid DTB, we don't need to do anything here.

Signed-off-by: Tom Rini <trini@konsulko.com>
---
In the case of U-Boot SPL (and similar very early stages) we are
extremely concerned with binary size, and also assume the device tree is
valid. This patch here is not a huge savings for us, but every little
bit helps when talking about something that impacts more than half our
build configurations.
---
 libfdt/libfdt_internal.h | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/libfdt/libfdt_internal.h b/libfdt/libfdt_internal.h
index 9eb32394eb79..0e103cafa714 100644
--- a/libfdt/libfdt_internal.h
+++ b/libfdt/libfdt_internal.h
@@ -11,11 +11,13 @@
 #define FDT_TAGALIGN(x)		(FDT_ALIGN((x), FDT_TAGSIZE))
 
 int32_t fdt_ro_probe_(const void *fdt);
-#define FDT_RO_PROBE(fdt)					\
-	{							\
-		int32_t totalsize_;				\
-		if ((totalsize_ = fdt_ro_probe_(fdt)) < 0)	\
-			return totalsize_;			\
+#define FDT_RO_PROBE(fdt)						\
+	{								\
+		if (!can_assume(VALID_DTB)) {				\
+			int32_t totalsize_;				\
+			if ((totalsize_ = fdt_ro_probe_(fdt)) < 0)	\
+				return totalsize_;			\
+		}							\
 	}
 
 int fdt_check_node_offset_(const void *fdt, int offset);
-- 
2.43.0

