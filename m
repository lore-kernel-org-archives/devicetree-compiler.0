Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848E31E0083
	for <devicetree-compiler@vger.kernel.org>; Wed,  6 Nov 2024 13:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730898094; cv=none; b=IAsroohASugrBKkyvG4oO4/vXspmaqLWw6ATOPyUYMiF9HO0BtSAoSpL8bqT1ujdwDcaGRWcaCdSemVtT4k6lesy+2lO4Elx10K49eDXSk2SC1ejTPHd9gAOk9h03ji+7cAOAVsEPp4Rpb3revyT34+glCUjlpNcoyN+JhrzVh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730898094; c=relaxed/simple;
	bh=SQnO4REamNDhVtR3Dv4azjIhFUxEEeFLvHKNrFu8kKQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OSqnDOKqpNMukxp2/hxBLwJW+CGJwgsIuxIo+TpPFaXzi3/JnfaDFrkMo1kykOGda4tAEjB08mjEa+Iz0u/wKv8U2WioDc7WfcVrO8p3v20DDkk3oq8dsT076OH2LSLN0M3gaCgtLipk8aiRKxEOgkmyCJNxWFgPFMa21/pPnGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1t8ff0-0004ur-Kv; Wed, 06 Nov 2024 14:01:22 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
To: devicetree-compiler@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v2] checks: Relax avoid_unnecessary_addr_size check to allow child ranges properties
Date: Wed,  6 Nov 2024 14:01:08 +0100
Message-Id: <20241106130108.852323-1-p.zabel@pengutronix.de>
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
Changes in v2:
 - Add comment to child 'reg'/'ranges' check.
 - Add child 'ranges' to failure message.
 - Link to v1: https://lore.kernel.org/all/20241025161307.3629901-1-p.zabel@pengutronix.de/
---
 checks.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/checks.c b/checks.c
index 6e06aeab5503..9e6a7b6a3e97 100644
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
@@ -1228,13 +1226,18 @@ static void check_avoid_unnecessary_addr_size(struct check *c, struct dt_info *d
 		return;
 
 	for_each_child(node, child) {
-		prop = get_property(child, "reg");
-		if (prop)
-			has_reg = true;
+		/*
+		 * Even if the child devices' address space is not mapped into
+		 * the parent bus (no 'ranges' property on node), children can
+		 * still have registers on a local bus, or map local addresses
+		 * to another subordinate address space. The properties on the
+		 * child nodes then make #address-cells/#size-cells necessary:
+		 */
+		if (get_property(child, "reg") || get_property(child, "ranges"))
+			return;
 	}
 
-	if (!has_reg)
-		FAIL(c, dti, node, "unnecessary #address-cells/#size-cells without \"ranges\", \"dma-ranges\" or child \"reg\" property");
+	FAIL(c, dti, node, "unnecessary #address-cells/#size-cells without \"ranges\", \"dma-ranges\" or child \"reg\" or \"ranges\" property");
 }
 WARNING(avoid_unnecessary_addr_size, check_avoid_unnecessary_addr_size, NULL, &avoid_default_addr_size);
 
-- 
2.39.5

