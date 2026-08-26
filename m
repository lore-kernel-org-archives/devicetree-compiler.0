Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EBB31D39A;
	Wed, 26 Aug 2026 09:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787737849; cv=none; b=p+P08YPc5zZ6y9Iu+oO98cSi6/KqE/i3/3WPnYjqzheTwIwqJIDFufqyT1nxfaWIIaioXXg9ySJvST/soA/M+WFRJtqX01JzRuzEvwwRIBkJJQWjUoEj3IYTBjnvmh0k1X9GK80T4yqpVciHzau1P9OLMYwGwaRHfYJhAuFsNbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787737849; c=relaxed/simple;
	bh=ijw+VDfKjPKYEIbV6jTzOKaWmbW2Pyfy4qArUDYTNP8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KXCStL71vkQ6+vE4YCB821CoQWfOmF8XZ9NQ4SFWuP/gkdCvrueVPMioy9VqUywePBxfnD8yepVkODDcZ9+b9gpdXoIjSAZvw3tetmtVOpkKtj+s7XtOH3glTQvTJqPNxGr7jE8KFyy28iwX3FDtaMjW6D8RKueIoF3ivVJC6oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=oOmY3qsR; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="oOmY3qsR"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 267184E413C2;
	Wed, 26 Aug 2026 09:50:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EF8A4604EC;
	Wed, 26 Aug 2026 09:50:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E20DF11C7AD52;
	Wed, 26 Aug 2026 11:50:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787737841; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Ef+rb3t4e8AalK99fxj/EVtI1AQNvNk/0pDqAH1wUVw=;
	b=oOmY3qsRleteSoUB3t6hnU/h/73y2F0L15kii+f5JgTkE2F3WdXM5fErXR/r0NhPt7+HK+
	ynfeNFxOX6/WeYjMJrOk3tKxi0IX31nM+5G/YRwVveaMeUhrVMm7VchLBDDY5liubT4OPP
	Xgc+K1t73qNzlT7wkBPh1oW2WLgZkYnSAbTdpV+Fy4DvvyCMUph08yOipHaPPIA7ZmS2zx
	lwMCc7ZBHQGoAx9V5vjNW9fad4ucsZcKoyVr62NS7iVGqzLQ3352fVsSQj55AKKOSkRmkG
	EWcv25mq2X+yCY6KBP77kILx7YBeRt0ccAIR/mCSIik1adKeEY5dhL6VLc6Iww==
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	David Lechner <dlechner@baylibre.com>,
	Ayush Singh <ayush@beagleboard.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree-compiler@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree-spec@vger.kernel.org,
	Hui Pu <hui.pu@gehealthcare.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>
Subject: [RFC PATCH v2 04/74] libfdt: Introduce fdt_get_structured_tag_data()
Date: Wed, 26 Aug 2026 11:48:33 +0200
Message-ID: <20260826094950.1088288-5-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826094950.1088288-1-herve.codina@bootlin.com>
References: <20260826094950.1088288-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

With structured tag, data len can be encoded in the tag itself (no data,
1 cell data, 2 cells) or with a dedicated cell (varlen) added between
the tag and the data.

In multiple places, getting the data related to the tag will be needed.

To avoid code duplication, introduce fdt_get_structured_tag_data() which
purpose is to get the tag data part and its length based on the tag
value.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 libfdt/fdt.c             | 80 ++++++++++++++++++++++++++--------------
 libfdt/libfdt_internal.h |  3 ++
 2 files changed, 55 insertions(+), 28 deletions(-)

diff --git a/libfdt/fdt.c b/libfdt/fdt.c
index 506e0dd3..7941632f 100644
--- a/libfdt/fdt.c
+++ b/libfdt/fdt.c
@@ -167,11 +167,56 @@ const void *fdt_offset_ptr(const void *fdt, int offset, unsigned int len)
 	return fdt_offset_ptr_(fdt, offset);
 }
 
+int fdt_get_structured_tag_data(uint32_t tag, const void *fdt, int offset,
+				uint32_t *data_len)
+{
+	int data_offset = offset;
+	uint32_t len = 0, sum;
+	const fdt32_t *lenp;
+
+	if (!(tag & FDT_TAG_STRUCTURED))
+		return -FDT_ERR_INTERNAL;
+
+	switch (tag & FDT_TAG_DATA_MASK) {
+	case FDT_TAG_DATA_NONE:
+		break;
+	case FDT_TAG_DATA_1CELL:
+		len = FDT_CELLSIZE;
+		break;
+	case FDT_TAG_DATA_2CELLS:
+		len = 2 * FDT_CELLSIZE;
+		break;
+	case FDT_TAG_DATA_VARLEN:
+		/* Get the length */
+		lenp = fdt_offset_ptr(fdt, offset, sizeof(*lenp));
+		if (!can_assume(VALID_DTB) && !lenp)
+			return -FDT_ERR_BADSTRUCTURE;
+		len = fdt32_to_cpu(*lenp);
+
+		/* Skip the cell encoding the length */
+		data_offset += sizeof(*lenp);
+
+		/* Check for the length value */
+		sum = len + data_offset;
+		if (!can_assume(VALID_DTB) &&
+		    (sum >= INT_MAX || sum < (uint32_t) offset))
+			return -FDT_ERR_BADSTRUCTURE;
+
+		break;
+	}
+
+	if (data_len)
+		*data_len = len;
+
+	return data_offset;
+}
+
 static uint32_t fdt_next_tag_all(const void *fdt, int startoffset, int *nextoffset)
 {
 	const fdt32_t *tagp, *lenp;
 	uint32_t tag, len, sum;
 	int offset = startoffset;
+	int tmp_offset;
 	const char *p;
 
 	*nextoffset = -FDT_ERR_TRUNCATED;
@@ -221,34 +266,13 @@ static uint32_t fdt_next_tag_all(const void *fdt, int startoffset, int *nextoffs
 		if (!(tag & FDT_TAG_STRUCTURED) || !(tag & FDT_TAG_SKIP_SAFE))
 			return FDT_END;
 
-		switch (tag & FDT_TAG_DATA_MASK) {
-		case FDT_TAG_DATA_NONE:
-			break;
-		case FDT_TAG_DATA_1CELL:
-			offset += FDT_CELLSIZE;
-			break;
-		case FDT_TAG_DATA_2CELLS:
-			offset += 2 * FDT_CELLSIZE;
-			break;
-		case FDT_TAG_DATA_VARLEN:
-			/* Get the length */
-			lenp = fdt_offset_ptr(fdt, offset, sizeof(*lenp));
-			if (!can_assume(VALID_DTB) && !lenp)
-				return FDT_END; /* premature end */
-			len = fdt32_to_cpu(*lenp);
-			/*
-			 * Skip the cell encoding the length and the
-			 * following length bytes
-			 */
-			len += sizeof(*lenp);
-			sum = len + offset;
-			if (!can_assume(VALID_DTB) &&
-			    (sum >= INT_MAX || sum < (uint32_t) offset))
-				return FDT_END; /* premature end */
-
-			offset += len;
-			break;
-		}
+		tmp_offset = fdt_get_structured_tag_data(tag, fdt, offset, &len);
+		if (tmp_offset < 0)
+			return FDT_END; /* premature end */
+
+		/* Skip the whole data bloc */
+		offset = tmp_offset + len;
+		break;
 	}
 
 	if (!fdt_offset_ptr(fdt, startoffset, offset - startoffset))
diff --git a/libfdt/libfdt_internal.h b/libfdt/libfdt_internal.h
index ce128fda..d4154119 100644
--- a/libfdt/libfdt_internal.h
+++ b/libfdt/libfdt_internal.h
@@ -23,6 +23,9 @@ int32_t fdt_ro_probe_(const void *fdt);
 uint32_t fdt_next_tag_(const void *fdt, int startoffset, int *nextoffset,
 		       bool *is_unknown);
 
+int fdt_get_structured_tag_data(uint32_t tag, const void *fdt, int offset,
+				uint32_t *data_len);
+
 int fdt_check_node_offset_(const void *fdt, int offset);
 int fdt_check_prop_offset_(const void *fdt, int offset);
 
-- 
2.55.0

