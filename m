Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893502C11CF;
	Wed, 26 Aug 2026 09:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787737846; cv=none; b=sgxJXiWjR5LoJOLVCoHCTHWaW+COW9wDjSEoqSKg7SK5QkhjSQybI3x82eSWiB/jatSRbF2rkSdd6kkmZ/XGFAWQLmfBRc7+3/bi009ztbHrtoL6eUffkeYrmPbOrU/XePCtxf3dDvMhZa9y7UYPOmyePL+iKiKg4UFX4gWdRd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787737846; c=relaxed/simple;
	bh=4ep8ocahczW0bykc33GnX25WIXJ2QmVQ9umxh6EK9To=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MzVnmSnB7aXHDWui5nUgJhiTeHjzqcdmLUCv40kRZ5hY6gG2hZQmRtuXAgtHCq/Yhzqz8OnLD8JuL/QHiZ7troctCBvV7WDdkQEX4E6EfU+KJi8ZJhp+xJf6RydeTpeVxGwiotvsNXGDR98h36GlLJ0nylfiq60zK3YuCV/GrgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=gV5nX8mV; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="gV5nX8mV"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7C3381A183F;
	Wed, 26 Aug 2026 09:50:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 51520604EC;
	Wed, 26 Aug 2026 09:50:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2F0C011C780F5;
	Wed, 26 Aug 2026 11:50:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787737838; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=qdnwEeJ6vZ4qOpnJAMnHCeQdSLTyJM8xTsgm3ZkBt/A=;
	b=gV5nX8mVLc5xw9iYqRoYxDyAz250a5h9coDJvWZpgDW8e5OZwtFBblOpMeKg1fR9KPAojs
	H1+EJz8tmn2XLvZSq4XgQkfYwsbks5URMbTlmPzn2YJu/+FykCiqyuCbmjwrfSnDTQdWm+
	Xco4Z8dkgW+JvDVThkyiNhY1Y7qqKiluVvTGBkT6n2rLF8Sl/eO2BLgyPSq3liJNPe0UZo
	qHkt569caTuX39PBZAd7WEyB7Ap02VchWIR+iUNENzfSRc96cz57igjkks20pOiXWAiux5
	LG5eytN4POD3MTM9gFg03pSfqGKb1qkW1pqxrGNEhDrvbctmSKJ/UQZE722BeA==
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
Subject: [RFC PATCH v2 03/74] fdtdump: Introduce get_structured_tag_data()
Date: Wed, 26 Aug 2026 11:48:32 +0200
Message-ID: <20260826094950.1088288-4-herve.codina@bootlin.com>
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

In order to avoid code duplication, introduce get_structured_tag_data()
which purpose is to get the tag data part and its length based on the
tag value.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 fdtdump.c | 50 ++++++++++++++++++++++++++++++--------------------
 1 file changed, 30 insertions(+), 20 deletions(-)

diff --git a/fdtdump.c b/fdtdump.c
index 20854752..f26d3a89 100644
--- a/fdtdump.c
+++ b/fdtdump.c
@@ -44,6 +44,33 @@ static const char *tagname(uint32_t tag)
 #define dumpf(fmt, args...) \
 	do { if (debug) printf("// " fmt, ## args); } while (0)
 
+static const char *get_structured_tag_data(uint32_t tag, const char *blob,
+					   const char **data, int *data_size)
+{
+	int sz = 0;
+
+	switch (tag & FDT_TAG_DATA_MASK) {
+	case FDT_TAG_DATA_NONE:
+		break;
+	case FDT_TAG_DATA_1CELL:
+		sz = FDT_CELLSIZE;
+		break;
+	case FDT_TAG_DATA_2CELLS:
+		sz = 2 * FDT_CELLSIZE;
+		break;
+	case FDT_TAG_DATA_VARLEN:
+		/* Get the length */
+		sz = fdt32_to_cpu(GET_CELL(blob));
+		break;
+	}
+
+	*data_size = sz;
+	*data = sz ? blob : NULL;
+
+	/* Skip the data bytes */
+	return PALIGN(blob + sz, 4);
+}
+
 static void dump_blob(void *blob, bool debug, int dump_unknown)
 {
 	uintptr_t blob_off = (uintptr_t)blob;
@@ -58,7 +85,7 @@ static void dump_blob(void *blob, bool debug, int dump_unknown)
 	uint32_t version = fdt32_to_cpu(bph->version);
 	uint32_t totalsize = fdt32_to_cpu(bph->totalsize);
 	uint32_t tag;
-	const char *p, *s, *t;
+	const char *p, *d, *s, *t;
 	int depth, sz, shift;
 	int i;
 	uint64_t addr, size;
@@ -153,21 +180,7 @@ static void dump_blob(void *blob, bool debug, int dump_unknown)
 		}
 
 		if ((tag & FDT_TAG_STRUCTURED) && (tag & FDT_TAG_SKIP_SAFE)) {
-			sz = 0;
-			switch (tag & FDT_TAG_DATA_MASK) {
-			case FDT_TAG_DATA_NONE:
-				break;
-			case FDT_TAG_DATA_1CELL:
-				sz = FDT_CELLSIZE;
-				break;
-			case FDT_TAG_DATA_2CELLS:
-				sz = 2 * FDT_CELLSIZE;
-				break;
-			case FDT_TAG_DATA_VARLEN:
-				/* Get the length */
-				sz = fdt32_to_cpu(GET_CELL(p));
-				break;
-			}
+			p = get_structured_tag_data(tag, p, &d, &sz);
 
 			if (dump_unknown) {
 				printf("%*s// Unknown tag ignored: 0x%08"PRIx32", data len %d",
@@ -175,13 +188,10 @@ static void dump_blob(void *blob, bool debug, int dump_unknown)
 				if (dump_unknown > 1 && sz != 0) {
 					printf(" ");
 					for (i = 0; i < sz; i++)
-						printf("%02hhx", *(p + i));
+						printf("%02hhx", *(d + i));
 				}
 				printf("\n");
 			}
-
-			/* Skip the data bytes */
-			p = PALIGN(p + sz, 4);
 			continue;
 		}
 
-- 
2.55.0

