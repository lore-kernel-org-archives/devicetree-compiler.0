Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681CD2DCC13;
	Mon, 12 Jan 2026 14:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227683; cv=none; b=KGNCvz/YR2/1nWyicewSVE+UgW6X4QkdxEApj3wA5nFUMZrWE6rXxVMOzJ0PuWqVn/r+baJLoEaKzo6wRFdDsUjO91vQCrXBflegyWoCHKWJ4+6VOVBo2P7dD+CN53c8y2zxy2J4hWni0UbEuOJ7L5a4txhmmzqmAG08kVRFZfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227683; c=relaxed/simple;
	bh=vfKZ808QQM0nIlJRvHraS0GHeykUmrjvoLimiiF68wk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rWDMuOiDXhlgu4bbIcsuTWSc/1LLa30lCt6LJaVGbC51oZtH8KX8boZBGjBOaQn+T3/5U60qNftuVkkotFIT7p8SyMjnc/kZqt9gGbLVDBCQ2PBeEzawqQaBQIEYZWpiTOKpiMYDRgEP+mjy5LRYLW1rtQafTbVSJe4PQ9sEQQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KYCJKoRF; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KYCJKoRF"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 906F2C2086C;
	Mon, 12 Jan 2026 14:20:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 13C42606FA;
	Mon, 12 Jan 2026 14:21:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0D971103C9263;
	Mon, 12 Jan 2026 15:21:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227678; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=KEET+tHSWdPNEyFdzi+VJg0Gd+rIpUhql9YgoSlC500=;
	b=KYCJKoRFCyYJzRRJs7Gen6C/gWVni/dHtvUw6U6erIyS4BmWwi7QHVLkt/8nunG2qkGSvA
	F6HFGR/ALszt4fJqA/H/RqA1DAIzUpyC0M576VdAPdp4M5kZpqxIr2+rgVAVroJx0XZ/kA
	ZbqPfumMUHBVkGzzdGBcZx17vIUByRmCvAaPR5zF6INi3bVkgTHSCNLCEkBhlGO0uihZd1
	2Xw2XpHLk5BNlpdrFd8GrY050FyCwXPyv1KjDsP1EOXJFxtOI/FB+DLmX4O/BnV9kTQLwb
	8rmpen1NsQgx1FLYvkxfk+LzVN5BmuYwgtrO/0oDOLxbkWYhsC2imtmNErifIw==
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
Subject: [RFC PATCH 37/77] dtc: Add support for import symbols sorting
Date: Mon, 12 Jan 2026 15:19:27 +0100
Message-ID: <20260112142009.1006236-38-herve.codina@bootlin.com>
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

Add support for import symbols sorting when this option is used.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 livetree.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/livetree.c b/livetree.c
index dac5359..285f6e1 100644
--- a/livetree.c
+++ b/livetree.c
@@ -1014,9 +1014,36 @@ static void sort_node(struct node *node)
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
2.52.0

