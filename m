Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCA83B8921;
	Wed, 26 Aug 2026 08:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787733169; cv=none; b=FZDLxWpqQ4xCt6doKI1qGradRdBtK255D4cSdu7QMSny4lqNkk7M8jdefFb/1RVBjjO4CeGu+CmvzRQ9jl9GZ5pmB9afm71W+NXzliIsyeUyRCmdzPUHz3Ghoxg/2L+kKchql2bAWbjj/4H8yOYM3kMuZA0TOV+Sah9dePVbw3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787733169; c=relaxed/simple;
	bh=SvnrI4XKbm69hwbW4FnPoNxrxxzQqWC9H7w6rqeDnEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XBVjmR/ASuSui21OEAm676HT0KGeifMaH0GYlI1GoJ/TXHzNKaLbZfmhYZ7TJyOCQLuamjngM2xEwvtwD8j0s90PwbTq1YkMtOSSZ/S8ibCwOb3d+kYxlETtTKjjaimj5GH3Hn5NT1bvZTYYKYTxU8FnYZ9FI0cVglHfG7tCCgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=tx5ywbf8; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="tx5ywbf8"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4F3654E413C1;
	Wed, 26 Aug 2026 08:32:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 226F5604EC;
	Wed, 26 Aug 2026 08:32:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2CF4D11C7A96D;
	Wed, 26 Aug 2026 10:32:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787733165; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Vwooc4B3R0CfZKT2vciMVi7EI4eYpEP71MWHW1Bldss=;
	b=tx5ywbf84g6yN06AcxJog9iGIeBLUF4sRMoDYrmS+iNbHpISxkgj3m2fnZA9ZBrbP9w9+T
	JTw/kYAivh/yqOBZ3zpyqfJ41SRJJk6qcE0qAO1MxTgWv+7Wautaldj56+IegbGv09OEk7
	FtfwF6+/hZ6hX02M+N1XacCZf8vd0LzGzLaAX1ZWoxofc4hAs3dm2BqSXf+UpYM5ZA9fhL
	ZdmkNeUbz013asKJSu+AXDzHtgGTIA1IQpHpmhxX2CTRuBTPS1Rgnh147KWGCDSsPp/t12
	diTkQecX/9uNAUhJpfaIOOy7H6qyS8vjgxyHcvLqu4DYD+Lnd4NHPAR1+s6Tag==
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
Subject: [PATCH v3 04/15] tests/nopulate: Add a FDT_NOP before the root node
Date: Wed, 26 Aug 2026 10:31:35 +0200
Message-ID: <20260826083146.304291-5-herve.codina@bootlin.com>
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

A FDT_NOP tag can be present at the offset 0 and so before the root
node. This is a legit case.

The nopulate tool adds FDT_NOP tag after each tag encountered but it
doesn't add a FDT_NOP tag at offset 0.

Improve nopulate to fix this lack and add a FDT_NOP tag at offset 0.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 tests/nopulate.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/nopulate.c b/tests/nopulate.c
index 06f8369a..050e69fb 100644
--- a/tests/nopulate.c
+++ b/tests/nopulate.c
@@ -22,7 +22,10 @@ static int nopulate_struct(char *buf, const char *fdt)
 	uint32_t tag;
 	char *p;
 
+	/* Add a FDT_NOP before the root node (first node) */
 	p = buf;
+	*((fdt32_t *)p) = cpu_to_fdt32(FDT_NOP);
+	p += FDT_TAGSIZE;
 
 	do {
 		offset = nextoffset;
-- 
2.55.0

