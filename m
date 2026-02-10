Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A61393DEF;
	Tue, 10 Feb 2026 17:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770744877; cv=none; b=rXMwVcIdn6Z4HQa3l+lqk3793OhPzEnRzyBP+y160akcK3A4ASa63FpcnMCE8JUS6N+0B4QFhl2tfhG1lTHH3MtBLnlSNn3ct97vTi+6/fKKabbneOAHMLuDx1rCIWKjUVEdgqGnXl64zjNf/5mq74qYzOoau0reEW1mI9JSD9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770744877; c=relaxed/simple;
	bh=39K4m3cDwzIk0lw+fWTf25HhLhw7zbT6CjlxHX8Oc8Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nKD0n0RAi5z21t99ebMzGVgzFkhq0fOW3uK/jnkOWcdbTXspKVlYo2CExoHw2Xsk86WBg+cL2+hPILg3pG5pJnc79JJ1CpHYCJwoPHTXKsMf4w3JL4WIeLBqJsPnne8UWDpnKpAixrZqRHLShDmYN77BVPq+JL7YLh1AUzo56mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=phsanotU; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="phsanotU"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7C4E04E40C03;
	Tue, 10 Feb 2026 17:34:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 47D68606BD;
	Tue, 10 Feb 2026 17:34:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1165810B91FBE;
	Tue, 10 Feb 2026 18:34:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770744873; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=5ibmTCsT8ORXKdaMNLgIZH3vWyXFUJS/N9D+sJGZPHo=;
	b=phsanotUjbErY3UW6KKNe8xnMrtoRFQQoRqXQ9K4PaDZqVjJZ+GDWrkwIqHRgjWD8b8+jw
	U4TplRwZjEaqFlwC2W2eiyXK4RRU1gePqYXqBQpySUMRy2hn0Gln4KcGZw+Dos1n6MbkyC
	ERECTsuCLXouf220RILbCu2e5OT7nS4J7RuVBpsrIftgENkrGsdCni+/E5avJss43YPKig
	HQUm9tQ/F8TymoR83i+/4SyBw/aqSVPKAkgOsXw6yvopTFIsC88uHTuHHFs+Xtlf2ABf16
	zfI0HTWd2VSqOE+cPuz3ek2+FqFV2ryCz507lz1qFz3BsNP/V0UrDm8q5+Kteg==
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
Subject: [RFC PATCH 09/15] Introduce structured tag value definition
Date: Tue, 10 Feb 2026 18:33:37 +0100
Message-ID: <20260210173349.636766-10-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260210173349.636766-1-herve.codina@bootlin.com>
References: <20260210173349.636766-1-herve.codina@bootlin.com>
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
related to the unknown tag needs to be identify. Also a flag is present
to tell an old release if this tag can be simply skipped or must lead to
an error.

Structured tag value is defined on 32bit and is defined as follow:

Bits  | 31 | 30       | 29             28 | 27    0|
------+----+----------+-------------------+--------+
Fields| 1  | CAN_SKIP | DATA_LNG_ENCODING | TAG_ID |
------+----+----------+-------------------+--------+

Bit 31 is always set to 1 to identified a structured tag value.

Bit 30 (CAN_SKIP) is set to 1 if the tag can be safely ignore when its
TAG_ID value is not a known value (unknown tag). If the CAN_SKIP bit is
set to 0 this tag must not be ignored and an error should be reported
when its TAG_ID value is not a known value (unknown tag).

Bits 29..28 (DATA_LNG_ENCODING) indicates the length of the data related
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
index a07abfc..2e07599 100644
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
+#define FDT_TAG_DATA_LNG	(3<<28)
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
+#define FDT_TEST_LNG_CAN_SKIP		FDT_TAG_CAN_SKIP(FDT_TAG_DATA_LNG, 0)
+#define FDT_TEST_NONE_NO_SKIP		FDT_TAG_NO_SKIP(FDT_TAG_DATA_NONE, 0)
+
 #define FDT_V1_SIZE	(7*sizeof(fdt32_t))
 #define FDT_V2_SIZE	(FDT_V1_SIZE + sizeof(fdt32_t))
 #define FDT_V3_SIZE	(FDT_V2_SIZE + sizeof(fdt32_t))
-- 
2.52.0

