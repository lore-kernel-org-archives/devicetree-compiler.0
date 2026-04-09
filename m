Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD3B3C555B
	for <devicetree-compiler@vger.kernel.org>; Thu,  9 Apr 2026 11:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775735699; cv=none; b=lQQ3jiSSZGmxeprKeMS79ac7nDOQmwS9a1/kl7V4KqoDMqZ3fIB8T+/sM8G+aOkoIOCr3aMRsbMtOVcadlGW5fNFhJfQl2xZ7ZxwOFwRibFmGMflFdyJ/q6zk0+fsZUD0FGSxK3GogwVcajyNIBRF0SzvFN29ZRp+VtLYM21oc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775735699; c=relaxed/simple;
	bh=APdfskW9t42gu0I23t61qHqrQRUaaGhF5IxcP+GJoWY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iGm0FxiPRl4hVZRXZ6/eNR3hrlp3gzxlh9oVQuPaSUPOyIlL3P+c+rXtZ+tlhFLpb+OLFtla4CDCP3wlpA0I/oUORKIwgOTfIrr+2CiJskqPStkkPMNhFDxRPTYXVqz2Rg4p9il7WeJLUx2jKaFa/mn+0dT17xShxmxmWwBh73Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=SnAJBh9b; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="SnAJBh9b"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 236BA4E42997;
	Thu,  9 Apr 2026 11:54:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EE7835FDEB;
	Thu,  9 Apr 2026 11:54:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B4C0D104500AF;
	Thu,  9 Apr 2026 13:54:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775735696; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=soz0pV1eOKd8XkPs79hMEbludp+fdUlKY3x1WUAoozI=;
	b=SnAJBh9b4+g6oxb8KnY3KTHV16y6FbwxcftJRe4pCegps6xyJvSpAkU3p8Pi+Feyr2K6Nm
	b9yPElnP7MddrMYgNgSwJQvdmg4yMyy17vnjp2VtIUCn/Qx+krAAxNQ0IiRbv5LbcVnAj/
	GzM73qpyikFV79RTefAroXMl9AE8NQxB/PafHG5xTJJgcw9WHjuGIspw53azFq21sg0JKr
	0vy7rKKBZiSk5elSpA+eVSAejf1ZzxCj0nN2dRhTOuERXW3EjzbTSZq1rSZh/2W8qM3U+V
	nVaiMjn29UfzclCHhhxGVVB1E4HwRrwIhTPFbF6Vv8TG0ytn1f0YYno9dYshWA==
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Ayush Singh <ayush@beagleboard.org>,
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
Subject: [PATCH v2 04/10] Introduce structured tag value definition
Date: Thu,  9 Apr 2026 13:54:20 +0200
Message-ID: <20260409115426.352214-5-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260409115426.352214-1-herve.codina@bootlin.com>
References: <20260409115426.352214-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The goal of structured tag values is to ease the introduction of new
tags in future releases with the capability for an already existing
release to ignore those structured tags. In order to do that data length
related to the unknown tag needs to be identified.

Also add a flag to tell an old release if this tag can be simply skipped
or must lead to an error.

Structured tag value is defined on 32bit and is defined as follow:

  Bits  | 31 | 30        | 29             28 | 27    0|
  ------+----+-----------+-------------------+--------+
  Fields| 1  | SKIP_SAFE | DATA_LEN_ENCODING | TAG_ID |
  ------+----+-----------+-------------------+--------+

Bit 31 is always set to 1 to identify a structured tag value.

Bit 30 (SKIP_SAFE) is set to 1 if the tag can be safely ignored when its
TAG_ID value is not a known value (unknown tag). If the SKIP_SAFE bit is
set to 0 this tag must not be ignored and an error should be reported
when its TAG_ID value is not a known value (unknown tag).

Bits 29..28 (DATA_LEN_ENCODING) indicates the length of the data related
to the tag. Following values are possible:
  - 0b00: No data.
          The tag is followed by the next tag value.

  - 0b01: 1 cell data
          The tag is followed by a 1 cell (u32) data. The next tag is
          available after this cell.

  - 0b10: 2 cells data
          The tag is followed by a 2 cells (2 * u32) data. The next tag
          is available after those two cells.

  - 0b11: Data length encoding
          The tag is followed by a cell (u32) indicating the size of the
          data. This size is given in bytes. Data are available right
          after this cell.

          The next tag is available after the data. Padding is present
          after the data in order to have the next tag aligned on 32bits.
          This padding is not included in the size of the data.

Bits 27..0 (TAG_ID) is the tag identifier defining a specific tag.

Introduce the structured tag values definition and some specific tags
reserved for tests based on this structure definition.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 libfdt/fdt.h | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/libfdt/fdt.h b/libfdt/fdt.h
index a07abfc..e6f75e7 100644
--- a/libfdt/fdt.h
+++ b/libfdt/fdt.h
@@ -49,6 +49,7 @@ struct fdt_property {
 
 #define FDT_MAGIC	0xd00dfeed	/* 4: version, 4: total size */
 #define FDT_TAGSIZE	sizeof(fdt32_t)
+#define FDT_CELLSIZE	sizeof(fdt32_t)
 
 #define FDT_BEGIN_NODE	0x1		/* Start node: full name */
 #define FDT_END_NODE	0x2		/* End node */
@@ -57,6 +58,28 @@ struct fdt_property {
 #define FDT_NOP		0x4		/* nop */
 #define FDT_END		0x9
 
+/* Tag values flags */
+#define FDT_TAG_STRUCTURED	(1<<31)
+#define FDT_TAG_SKIP_SAFE	(1<<30)
+#define FDT_TAG_DATA_MASK	(3<<28)
+#define FDT_TAG_DATA_NONE	(0<<28)
+#define FDT_TAG_DATA_1CELL	(1<<28)
+#define FDT_TAG_DATA_2CELLS	(2<<28)
+#define FDT_TAG_DATA_VARLEN	(3<<28)
+
+#define FDT_TAG_NO_SKIP(tag_data, tag_id) \
+		(FDT_TAG_STRUCTURED | tag_data | tag_id)
+
+#define FDT_TAG_CAN_SKIP(tag_data, tag_id) \
+		(FDT_TAG_STRUCTURED | FDT_TAG_SKIP_SAFE | tag_data | tag_id)
+
+/* Tests reserved tags */
+#define FDT_TEST_NONE_CAN_SKIP		FDT_TAG_CAN_SKIP(FDT_TAG_DATA_NONE, 0)
+#define FDT_TEST_1CELL_CAN_SKIP		FDT_TAG_CAN_SKIP(FDT_TAG_DATA_1CELL, 0)
+#define FDT_TEST_2CELLS_CAN_SKIP	FDT_TAG_CAN_SKIP(FDT_TAG_DATA_2CELLS, 0)
+#define FDT_TEST_VARLEN_CAN_SKIP	FDT_TAG_CAN_SKIP(FDT_TAG_DATA_VARLEN, 0)
+#define FDT_TEST_NONE_NO_SKIP		FDT_TAG_NO_SKIP(FDT_TAG_DATA_NONE, 0)
+
 #define FDT_V1_SIZE	(7*sizeof(fdt32_t))
 #define FDT_V2_SIZE	(FDT_V1_SIZE + sizeof(fdt32_t))
 #define FDT_V3_SIZE	(FDT_V2_SIZE + sizeof(fdt32_t))
-- 
2.53.0

