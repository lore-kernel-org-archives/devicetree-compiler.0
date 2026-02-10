Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B61138E133
	for <devicetree-compiler@vger.kernel.org>; Tue, 10 Feb 2026 17:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770744873; cv=none; b=KgS/CODwhA6tvrlu6Ljn9kuCt/cTe0I2fmHGr3tHgiHd5UebtjwIgWy+ss+EBjHNRk+pqvo8oyaWfmopcbwznW3p89HROfs5NhkB2aFVjY0mDs0xVWMEgRhTow5WBeLOiFZGfBvjHqLTAcCt7uhD8QlRj21/dAeuWTVH1eVWkSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770744873; c=relaxed/simple;
	bh=EM6J0dEcKfIdr7d2XOOqiXEzf+XkS7OHUWgKVYm9Hd4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FEjat7c8SGij8l/7GpyWBk9SeD31vRgjDUlZngON+YOHlm1Moi5qFSKSUweVgX9Gazu6itfVS1opape9F6ncgEScUtj1Jx0/I3crTWGpzcuRQyIwdOxOuV0ldf02SAiAqTyr47ytSz8U8OR2/GL1TC1HlabjnT0Wmqumtj6ouRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=cXMnk9f9; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cXMnk9f9"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 23FB7C8F455;
	Tue, 10 Feb 2026 17:34:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B9C90606BD;
	Tue, 10 Feb 2026 17:34:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B7A9C10B9222C;
	Tue, 10 Feb 2026 18:34:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770744869; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Kw02+4pfGTQRfMaOOh1LaHp+lrmAxxrpyVPxs0syLUY=;
	b=cXMnk9f9r+S/DTfTi3XxF/JBrdsGbUnrBIqKUKs+cAu94zkbAr8bEmeaoFPm0VwL8MOcNk
	u9dZ0hn/2cciQp/eJu8+DOtWfa3B857Pf2XABoruPS3Mi7tTlNTY8ZIuGDjzLfQBRCDGC4
	lSiOZqpFZdIExDcToiwYt01BDhdHX1FS5boqyjwEAF4lc9mxisNf0+U7ZPU8OVRGzok1w6
	J/Q7UeVH413p9j9qK9ICMlLKUb5UcbGGCIOAvblajI6TiNcNIgwPr1P7JunPw9B2I1MjDH
	zbIlMiQ4iSSagCHDc/CkDO05yupnftWkaVu77v3nHy4mhE5/Xb0J/ANfjCo1BQ==
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
Subject: [RFC PATCH 07/15] libfdt: fdt_check_full: Handle FDT_NOP when FDT_END is expected
Date: Tue, 10 Feb 2026 18:33:35 +0100
Message-ID: <20260210173349.636766-8-herve.codina@bootlin.com>
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

fdt_check_full() makes the assumption that a FDT_END tag is present
immediately after the FDT_END_NODE tag related to the root node.

This assumption is not correct. Indeed, FDT_NOP tags can be present
between this FDT_END_NODE tag and the FDT_END tag.

Handle those possible FDT_NOP tags.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 libfdt/fdt_check.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libfdt/fdt_check.c b/libfdt/fdt_check.c
index a21ebbc..cca0523 100644
--- a/libfdt/fdt_check.c
+++ b/libfdt/fdt_check.c
@@ -43,7 +43,7 @@ int fdt_check_full(const void *fdt, size_t bufsize)
 			return nextoffset;
 
 		/* If we see two root nodes, something is wrong */
-		if (expect_end && tag != FDT_END)
+		if (expect_end && tag != FDT_END && tag != FDT_NOP)
 			return -FDT_ERR_BADSTRUCTURE;
 
 		switch (tag) {
-- 
2.52.0

