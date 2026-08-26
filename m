Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26663D9DB6;
	Wed, 26 Aug 2026 09:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787738017; cv=none; b=RhA3UILqyECIhLauJWdekTTJXw6w0Y+byZg/XQ2tQgH6a6LL5UPlNhL/fMuL00J8SE+0PDfjm1A9y/P7iM4lSzTuZUSck5qWWThWsZbhCybIEXRLxBUOzTwILslvly9o3nzzDrq5Z6iAs+2Lwb9BhoH0H1Wxe832jd/YK4CBNcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787738017; c=relaxed/simple;
	bh=UKPFtsM9Y0dxHmr3RybJ6c3soGcTIkGoiEBbZ/dOTc0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ajaLg/6+fftWxZmidGLb8NkulowHRqqoxND/zkKxJ6/0DCrFkq7oEzS8yZvG3l/oWXkTdrsg5gZaRRY8E8bHsU0dIdPbyNEgSIGWKyopj50CuKDMkgOyhVZd1djubMhMQU86P1GBvfdolY7TgHLoiV+KoD3UM4b2VTJZu8pmMZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YmpWgKtM; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YmpWgKtM"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 19EEF1A183E;
	Wed, 26 Aug 2026 09:53:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E1D55604EC;
	Wed, 26 Aug 2026 09:53:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 12A8411C7AD6C;
	Wed, 26 Aug 2026 11:53:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787738011; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=ydI9Yn/zMnFOImYwImzFF2eDeccGOC3mwcZ5WgLZ45U=;
	b=YmpWgKtMV8v7atCNOS0/pWJxez1RAVFDIECvoPCpuUmchWYniBAp9gft1SAANa86pEAoiu
	NjW3qFaEAqgfEx+gNOjLTXWKZXkDId2T29gnXGtoC2RQrgFhtfoxNxjpo3fwLtdvmG2pu6
	qa61vNFlgWcaI6kvW79piY6jUd07NqcTvOkOVREPaaEAwdLtoWRAWu5w2DlpKB2DL3CjoS
	QwldJkCOyAiUYYTE6hbglwnzMLINE8LgZSsgQWuit4ZRpQEOw836ATOeZ/uQYAbYkvpvlA
	oD/A+icnskWAFW2ZZPGTrZ/Nfr1XksXwDeop1vsOz1P3O/ZRMHYRDt78k5AiDw==
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
Subject: [RFC PATCH v2 57/74] dtc: Add support for orphan nodes sorting
Date: Wed, 26 Aug 2026 11:49:26 +0200
Message-ID: <20260826094950.1088288-58-herve.codina@bootlin.com>
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

Add support for orphan nodes sorting when this option is used.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 livetree.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/livetree.c b/livetree.c
index f7c13585..8d7803ab 100644
--- a/livetree.c
+++ b/livetree.c
@@ -1333,6 +1333,34 @@ static void sort_importsyms(struct dt_info *dti)
 	free(tbl);
 }
 
+static void sort_orphans(struct dt_info *dti)
+{
+	int n = 0, i = 0;
+	struct node *orphan, **tbl;
+
+	for_each_orphan(dti->orphanlist, orphan) {
+		sort_node(orphan);
+		n++;
+	}
+
+	if (n == 0)
+		return;
+
+	tbl = xmalloc(n * sizeof(*tbl));
+
+	for_each_orphan(dti->orphanlist, orphan)
+		tbl[i++] = orphan;
+
+	qsort(tbl, n, sizeof(*tbl), cmp_subnode);
+
+	dti->orphanlist = tbl[0];
+	for (i = 0; i < (n-1); i++)
+		tbl[i]->next_sibling = tbl[i+1];
+	tbl[n-1]->next_sibling = NULL;
+
+	free(tbl);
+}
+
 void sort_tree(struct dt_info *dti)
 {
 	sort_reserve_entries(dti);
@@ -1340,6 +1368,8 @@ void sort_tree(struct dt_info *dti)
 
 	if (dti->dt)
 		sort_node(dti->dt);
+
+	sort_orphans(dti);
 }
 
 /* utility helper to avoid code duplication */
-- 
2.55.0

