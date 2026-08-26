Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A573E8C46;
	Wed, 26 Aug 2026 09:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787737935; cv=none; b=oVEz5eCMCsjr4woht1I6jigCiCvzXHRFg+uY6RRnEPsU41BoHSSGk30kQeIiQ21lqC+R1MBbSIZNW22sWgUF5B21bwcAYvyigHIY5h6UZOYkI+wdmrZyXlizkFvrPaZa3dTv2gGuQssjhUqDxDnF6YJ7qV4y95lBkEVWt627Oik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787737935; c=relaxed/simple;
	bh=csy9YCtBKm6aTxukYKCqFV0UOYbFpHeAF2p4aeWvJVA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AjozafkOReFdQlNcz0iwvuqVELBgAJdIpZ52taU7KdZ/bNDPp81yLE/Pb7YKDSzSZ/TMj7cR5+0zFZixow3lwkHh82zeHoST2nvsS+4PsxNH86t81LA93i6XDm2Pku+UKBfqEhNhLNIzsk5uS/qL/gVLQyRAib9BJUuI/7Gbduo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=TefKbpfj; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="TefKbpfj"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B89ED4E413BC;
	Wed, 26 Aug 2026 09:52:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8EE76604EC;
	Wed, 26 Aug 2026 09:52:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B056F11C7AD6B;
	Wed, 26 Aug 2026 11:52:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787737930; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=vekBZ1ODZdm7J9ZkfWlU6lJGtfrkL5q7Y9+W+ZLUHbA=;
	b=TefKbpfjSA4whMF7auYbmcU2j3w/7TfxRptuuWam+DC9rfjMbX8hLMBD8dgpPOMC1EUCje
	L1cnCON3N5Y+Z45Buc1mLL+kUnnkmmFhuv2T/60wfErMnNInMAPwJ10kCIBrP0A+m8djmg
	DACKTf7g+JXnObqet5GnDStdCwetBpuMHhKNWe/lzKCQI4AQHx9JEmQ8Dx/EFLXk59ZM1a
	ED4vcWGBfwQbGOt/Ms848ujfeiT4m0W+tkJxnKfSsLkF80Y1rdZZZ50fqfn1mErIX2hs3u
	scHkJ3kJ+0SXyL4xERHY1wMkeoI7gtPOthkM6WruMjUmyKR4cTrRNje7Y7CDUw==
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
Subject: [RFC PATCH v2 33/74] dtc: Add support for import symbols sorting
Date: Wed, 26 Aug 2026 11:49:02 +0200
Message-ID: <20260826094950.1088288-34-herve.codina@bootlin.com>
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

dtc can sort items when the command line --sort option is set.

Add support for import symbols sorting when this option is used.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 livetree.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/livetree.c b/livetree.c
index 30344fb8..130ddf25 100644
--- a/livetree.c
+++ b/livetree.c
@@ -1126,9 +1126,36 @@ static void sort_node(struct node *node)
 		sort_node(c);
 }
 
+static void sort_importsyms(struct dt_info *dti)
+{
+	int n = 0, i = 0;
+	struct symbol *symbol, **tbl;
+
+	for_each_symbol(dti->importsymlist, symbol)
+		n++;
+
+	if (n == 0)
+		return;
+
+	tbl = xmalloc(n * sizeof(*tbl));
+
+	for_each_symbol(dti->importsymlist, symbol)
+		tbl[i++] = symbol;
+
+	qsort(tbl, n, sizeof(*tbl), cmp_symbol);
+
+	dti->importsymlist = tbl[0];
+	for (i = 0; i < (n-1); i++)
+		tbl[i]->next = tbl[i+1];
+	tbl[n-1]->next = NULL;
+
+	free(tbl);
+}
+
 void sort_tree(struct dt_info *dti)
 {
 	sort_reserve_entries(dti);
+	sort_importsyms(dti);
 	sort_node(dti->dt);
 }
 
-- 
2.55.0

