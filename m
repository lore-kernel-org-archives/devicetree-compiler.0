Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6EC175D46
	for <devicetree-compiler@vger.kernel.org>; Fri, 25 Oct 2024 16:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729872805; cv=none; b=miGWYkkyaGjYpzbViDe1pWOZBR50EiRo/d7qEyafU4eJVhmBwB8Us516lTEnWt3Wc+LIimEu0tbBbF0Ca6cjHZ+pi1Teg15BlpElqvij9jS7J/QnMSUhlQa68MQv6SeJEU7MZRCgxaqSUS546mg9dVWc/T4fGm8Bft8I9JOYbjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729872805; c=relaxed/simple;
	bh=cRV+gA5y3KdAaqVTaEqoRXVQ7x1ITF3GDK/cFF7gir4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fn41Qyd+UvEpBkvuL+MzE1/IO6Wy/vNLGQ2YaMe2y+Vq6XjfH9zM4skMtHBLHFWsy4Y6RtEHYp1028ppYrZGV2PKeNsiK2OeD+UoBf2Vbd48A//YNizf/D45ffe4BlhOHR2bIbz4v2nGjopWAQpgM563i55BA4phZw8TBRk5tAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1t4Mw5-0008Qi-Hv; Fri, 25 Oct 2024 18:13:13 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
To: devicetree-compiler@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH] checks: Relax avoid_unnecessary_addr_size check to allow child ranges properties
Date: Fri, 25 Oct 2024 18:13:07 +0200
Message-Id: <20241025161307.3629901-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree-compiler@vger.kernel.org

Do not fail the unnecessary #address-cells/#size-cells check if any
children of the node have a "ranges" property.

Suggested-by: Rob Herring <robh@kernel.org>
Link: https://lore.kernel.org/all/CAL_JsqKebRL454poAYZ9i=sCsHqGzmocLy0psQcng-79UWJB-A@mail.gmail.com/
Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 checks.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/checks.c b/checks.c
index 6e06aeab5503..76fdee2ed030 100644
--- a/checks.c
+++ b/checks.c
@@ -1217,9 +1217,7 @@ WARNING(avoid_default_addr_size, check_avoid_default_addr_size, NULL,
 static void check_avoid_unnecessary_addr_size(struct check *c, struct dt_info *dti,
 					      struct node *node)
 {
-	struct property *prop;
 	struct node *child;
-	bool has_reg = false;
 
 	if (!node->parent || node->addr_cells < 0 || node->size_cells < 0)
 		return;
@@ -1228,13 +1226,11 @@ static void check_avoid_unnecessary_addr_size(struct check *c, struct dt_info *d
 		return;
 
 	for_each_child(node, child) {
-		prop = get_property(child, "reg");
-		if (prop)
-			has_reg = true;
+		if (get_property(child, "reg") || get_property(child, "ranges"))
+			return;
 	}
 
-	if (!has_reg)
-		FAIL(c, dti, node, "unnecessary #address-cells/#size-cells without \"ranges\", \"dma-ranges\" or child \"reg\" property");
+	FAIL(c, dti, node, "unnecessary #address-cells/#size-cells without \"ranges\", \"dma-ranges\" or child \"reg\" property");
 }
 WARNING(avoid_unnecessary_addr_size, check_avoid_unnecessary_addr_size, NULL, &avoid_default_addr_size);
 
-- 
2.39.5

