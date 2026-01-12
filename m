Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2CD36AB42;
	Mon, 12 Jan 2026 14:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227719; cv=none; b=hVrNw7Pd0TNx2XVso5kOBTcwlJuAZniuuijXU1ZvOoOkPWHBX7Abqfo3E4IAfUCHyIF/BVItDz9hQDpVb7y+cm0NCTbUQFI47bv7ej1+ersx57i80/ZxG1d+onoUifVImTQ71qcMdMSIAgO+lbV4hoLK7Te5HuPPUH7yrgyPZeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227719; c=relaxed/simple;
	bh=W9kOSnvSyaOHcr8JISA2bsDOv382/kuOx0poBtNKiko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JtMYCNX750R34FJcBiC+J9vhcMDz4BbymRF9veMQpBQqEZAS7XJFhvK9uPpmz6MxCu2pm/s8Q5WRkY4KYrmPoI2Or7zDtalNtLHFlwBbnRwXzYnJzG/z23FEkwNLX0CGK6PuIi3lmWX+nF0SwClGgYRhyfT54H8anx/fFbS1LQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=na/lIYFP; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="na/lIYFP"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D5FC0C2086C;
	Mon, 12 Jan 2026 14:21:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 590EF606FA;
	Mon, 12 Jan 2026 14:21:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 84BDC103C9261;
	Mon, 12 Jan 2026 15:21:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227715; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=0ya4snKKo2ZGVGe7DjnxyyyxuYX4XyD6EcegEFy9kt0=;
	b=na/lIYFPtHMW1HnzmSMEM5lFhABUOgxLjMDTdDHnAnwSM4ovt2lQAQlMm2N9d1BcAOqeiP
	wABPm6tC/jiKTpi1glv0R4KgHLiDTwYT7VOt2kcK5q3Shsp0jHdq2gX1oG+zV5vA3s2aR1
	4I+L6Rl66IWWMrB6fU5EXDFJEPWebjmHy2cz4C9T4MPXm1brMWgYLlo7nNttzav3+FmLlF
	UA11E0bsIiXoLY9sgi/M2Niu8iQL+DoeoGGQea2nJf2rKR3auBE6iD81oeG/e5GiDtbSC2
	t5bUQOiSmzlTGV60babYozW6UGidrp2fIQc9tHjVXD+NOvYkgjOviNd1gU2X+Q==
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
Subject: [RFC PATCH 62/77] dtc: Add support for orphan nodes sorting
Date: Mon, 12 Jan 2026 15:19:52 +0100
Message-ID: <20260112142009.1006236-63-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112142009.1006236-1-herve.codina@bootlin.com>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
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
index 00274c5..59b912d 100644
--- a/livetree.c
+++ b/livetree.c
@@ -1199,6 +1199,34 @@ static void sort_importsyms(struct dt_info *dti)
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
@@ -1206,6 +1234,8 @@ void sort_tree(struct dt_info *dti)
 
 	if (dti->dt)
 		sort_node(dti->dt);
+
+	sort_orphans(dti);
 }
 
 /* utility helper to avoid code duplication */
-- 
2.52.0

