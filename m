Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C903B7741;
	Wed, 26 Aug 2026 08:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787733175; cv=none; b=Fezm22MAzfcjJJ+ZaV9THXrUEaU+HxkkW+Xr1arqfo6+sTW3QJG/Qp/G+gsDQUEq/6wS5HNJDQar5KBVuM6SZZdotY+OE9e+sZvR0pFJzzL0KCvWhHNo/r3/6aHCJwBJ1lssXAyAHWfJ0U3s18d2xOSx9KOTjblJllYonwz8iPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787733175; c=relaxed/simple;
	bh=LyfoGBf+bozP8v8sfTfgbLFIPFn7OocWM5OCM5etkZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K1hsaZE7DlKwtIu4DOWnjCZ3Fb4HcPfp0/F66lSMQhqCWbHklMFDENUowJNfBEN2wXdlzJtU/paBjaEAsPUusLbzy3xQm4XWWOUlE/LEuoj+ji60A1z2IoVyNEzAx+oBVFJbJRiEourQX+OvsawmgJN/biDQNdOK5Cyp1CmLTF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=C92s42Fh; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="C92s42Fh"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 36B091A1842;
	Wed, 26 Aug 2026 08:32:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0A086604EC;
	Wed, 26 Aug 2026 08:32:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 93CB211C7AC4A;
	Wed, 26 Aug 2026 10:32:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787733170; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=BovFWMOtZhvJgX8p9K2wqIASV+yACJxR34EojkuuGFg=;
	b=C92s42FhPeU1E7dk/BRC2Z1LnPQdynoshACWbsbJO0mwg4zCBY6++NXGBDs7RHICas3iA8
	fDC72b9iEFQeP7bnZyn0GuigNJRxplx8EnszI6odS++hxJQ9HO/rNdUv4M67+UxabXXAjj
	NzXVR2pARSr+ViiLxT40UhBkHpbh9qUKBJU5HTwgqutY268hfjkU9bNU8UiWuX+idt2UT0
	P2pxVN50g3IaZ8OhsyBLCRzc7ROuOQmN4FBdo4eCi5rj7QOYtQfPFIdMLjj7JKbVHPddIU
	QLBa5kEKYKX8FPpBCQ+K5olQhilzPkXAR+gJ9o2PB1cMgxDcJoR9G8x8IlZGsw==
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
	Herve Codina <herve.codina@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v3 06/15] Introduce structured tag value definition
Date: Wed, 26 Aug 2026 10:31:37 +0200
Message-ID: <20260826083146.304291-7-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826083146.304291-1-herve.codina@bootlin.com>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 libfdt/fdt.h | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/libfdt/fdt.h b/libfdt/fdt.h
index a07abfcc..f41a355f 100644
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
+#define FDT_TAG_STRUCTURED	(1U<<31)
+#define FDT_TAG_SKIP_SAFE	(1U<<30)
+#define FDT_TAG_DATA_MASK	(3U<<28)
+#define FDT_TAG_DATA_NONE	(0U<<28)
+#define FDT_TAG_DATA_1CELL	(1U<<28)
+#define FDT_TAG_DATA_2CELLS	(2U<<28)
+#define FDT_TAG_DATA_VARLEN	(3U<<28)
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
2.55.0

