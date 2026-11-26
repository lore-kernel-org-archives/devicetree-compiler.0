Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692227;
	b=iAGrZTr76rECCgZ3nFTJciQZqhHAAE7Ram0aWYMEhbW/T4YxHnoxL+1P1KJ9gs2ymjkD
	 y4+4UkC0QaQmnfJ4kT+asEqNZ1eXMnu6gDkxQdKEnQ9AKi7IfInaQMIcfhryu1Rw8H6eu
	 ppcNwUf/eiAnEqGQ5iBV3+czGXuhVkuxZ67wIIFQtQMVEBdG7nX1yOyRn2gNbhuWo9C2O
	 Uur9Jautm5OJGk7kxnOlxqDHjz3MYufoV2lD9DBWhOLQfQEPdfKwkT2j2qFjVbvYzjFWN
	 8jOIPHpnRl0JNafGnoWvpHLHS5AJfuO4UITHdGemZ+ayQ6ufK85YNRhKWJHTWO3IF0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692227;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=o8uIXl9o/pNf+alDSsYUvXOB+LVRQrPiFrS9AtaVhWw=;
	b=amfqzY4Eu1HQs/yzmfiOpAa9BJDgQQ+DSP+8YjllO4Hz/0+KiKPojipMyVYuD3USbiai
	 RwR2KpwQqKSv/juzwU8UwI+j0eHD2IEDax2tfywqBOuxE42+4ejAEc+WhOZ6f67vSuTCs
	 zQpLEVHxTlzi82FyTVvRTOMcVgZqNff/8HIpZZ4m8+g7S3VMQlMPPe4L1cI/X9YsDHEzV
	 GpL4DwXu86qJT7LLaqF8MLwD8tgno3aRjngEXSC4uqHVByDYPkhWqLn5cmBti5XZaYSR2
	 p6guXlupfMGBcw0CZhEuIYGYz1uG1Yc1B1eJOHrK/V4zO422j0IOysxdAmetjTJmpXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="Pw/OrKx7";
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6196606A331;
	Thu, 26 Nov 2026 11:23:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6196606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Pw/OrKx7
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 701AC4E41798;
	Thu, 26 Nov 2026 11:23:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3BF9860237;
	Thu, 26 Nov 2026 11:23:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C13FD11E6B370;
	Thu, 26 Nov 2026 12:23:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795692219; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=o8uIXl9o/pNf+alDSsYUvXOB+LVRQrPiFrS9AtaVhWw=;
	b=Pw/OrKx79bTSwdRdsCcF+2A4pzwb49mY8IDwDJiT//2FrvUdTOPfChlEhiThHFUyP9pai+
	cJMVIJV5c+eHSlCadOR7FUcNSQxKB9gXDGn4bflKFwRR3MrM7HcTFz4zrOrJvKFGIWe98y
	TSdAkU55iJNe4KTPUtMiyxK5GqAy81bi2lzlQ8pF14I9CXwNpy1Ge5lQ4ZcC9lzaVd+7XR
	Z/e2PWVBl5gn/nu3TMEI0Nj7f8gxF7AJsKcQ47e0CkGAbYEq6pV/ZhMA3yGQIfLypb0n8U
	qgg02kc0cUOolbFKNBN7/jyE9wLzliAiU/Q7SVWp6zjwYS2Q2ui5ejdYQEmGaA==
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Frank Li <Frank.Li@nxp.com>,
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
Subject: [PATCH v4 07/22] tests: treegen: Introduce emit_fdt_header_vers()
Date: Thu, 26 Nov 2026 12:22:24 +0100
Message-ID: <20261126112239.636284-8-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126112239.636284-1-herve.codina@bootlin.com>
References: <20261126112239.636284-1-herve.codina@bootlin.com>
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
X-Last-TLS-Session-Version: TLSv1.3

treegen is used to generate custom dtbs. It uses emit_fdt_header()
to generate the header part.

The current definition of this function doesn't allow setting custom
values for the version fields.

In order to easily generate dtbs with custom version values, introduce
emit_fdt_header_vers().

The modification doesn't introduce any functional changes.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
---
 tests/treegen.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/tests/treegen.c b/tests/treegen.c
index c9bf5711..2321a6c3 100644
--- a/tests/treegen.c
+++ b/tests/treegen.c
@@ -105,7 +105,8 @@ static void fill_prop_name(struct buf *b, size_t strs, size_t prop, size_t strof
 
 /* FDT structure helpers */
 
-static size_t emit_fdt_header(struct buf *b)
+static size_t emit_fdt_header_vers(struct buf *b, uint32_t version,
+				   uint32_t last_comp_version)
 {
 	size_t off = emit_u32(b, FDT_MAGIC);
 
@@ -113,14 +114,19 @@ static size_t emit_fdt_header(struct buf *b)
 	emit_u32(b, 0);	/* off_dt_struct */
 	emit_u32(b, 0);	/* off_dt_strings */
 	emit_u32(b, 0);	/* off_mem_rsvmap */
-	emit_u32(b, 0x11);	/* version */
-	emit_u32(b, 0x10);	/* last_comp_version */
+	emit_u32(b, version);	/* version */
+	emit_u32(b, last_comp_version);	/* last_comp_version */
 	emit_u32(b, 0);	/* boot_cpuid_phys */
 	emit_u32(b, 0);	/* size_dt_strings */
 	emit_u32(b, 0);	/* size_dt_struct */
 	return off;
 }
 
+static size_t emit_fdt_header(struct buf *b)
+{
+	return emit_fdt_header_vers(b, 0x11, 0x10);
+}
+
 static void finish_rsvmap(struct buf *b, size_t hdr, size_t rsvmap)
 {
 	struct fdt_header *fh = (struct fdt_header *)(b->data + hdr);
-- 
2.56.1

