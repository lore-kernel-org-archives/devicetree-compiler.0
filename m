Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82283D565B
	for <devicetree-compiler@vger.kernel.org>; Wed, 26 Aug 2026 09:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787737903; cv=none; b=r0J7lf/jufg3WFFEboeHmnyIc8bXRw51aAh49l8oN1l3SztnqxpOpDMr3gwMYiMghMJBfCMaAU+u3N2IoBPS+3d4Lx3x0to57ST11AbJHBjJDDrNxR+oUf/S7ZF4DKU18M/6Vg6jwtUu3hFmT14rviFhcdVJvKlg3HcFyb8/ics=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787737903; c=relaxed/simple;
	bh=tHTPX6KoUCmyMITxuCoVYfmnjnE0EzR9yju9R4KgJJw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pU62zoXUBKgaafspW2ajzovrH+vCAJ0hfjA58VSE3Chxv6BOL4z2txFYlCT67dPlXm3+RGG/nNEp++BY15iUVUIt5vSyxBdhACAWrmSsdVmpL+tUQG8dxTx03SmSZH2hxU1wsGZD0J45T3DwMrn0MXJOp6T1zHeMdCxXjf3TXFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=x9X1q9Pm; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="x9X1q9Pm"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4E70F1A183D;
	Wed, 26 Aug 2026 09:51:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2185F604EC;
	Wed, 26 Aug 2026 09:51:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8D55B11C7AD5F;
	Wed, 26 Aug 2026 11:51:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787737898; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=wqZujohaK0sAjx/xhCHMteLuLH6vHHuH9u0wjHd6wao=;
	b=x9X1q9PmWZF6Rb6e551WKKzMrnnNnRQO3iIVHJxhP9PA9+pjv03kkSVchP6fEEzuP6vEiH
	gb/LwXuCA74eMxQETjqI9oshhbrGayP9ZMdBa8bVORUiF32Ek2Nnlvj701lDqgrFTcqto9
	W4QV9AhBMEkPnA33OIliG0ehwavWYEZ8Ldr0ClhbaJITs2Ve5W3cX6iCzrM6p6It19l0rk
	yQybGXK7PpsXAgOEFKMaQBnOP+H21nUa2M4pDpN91LEYr4EDwuV45lM4Rzr14sc8laKfor
	+vpCCBcd6CuYE0IUIuKwkFYLZMYZ5CCTrcmKrlNlJ6zEXvEC94IOrlRq+QgYAw==
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
Subject: [RFC PATCH v2 18/74] checks: Handle export symbols in fixup_phandle_references()
Date: Wed, 26 Aug 2026 11:48:47 +0200
Message-ID: <20260826094950.1088288-19-herve.codina@bootlin.com>
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

Export symbols use phandle references.

Referenced nodes must have a phandle property set in order to have those
references working.

fixup_phandle_references() does the needed operation for properties
that use a phandle.

Extend fixup_phandle_references() to perform exact same operation for
export symbols.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 checks.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/checks.c b/checks.c
index cb3b4b16..13e8b121 100644
--- a/checks.c
+++ b/checks.c
@@ -612,12 +612,13 @@ static void fixup_phandle_references(struct check *c, struct dt_info *dti,
 				     struct node *node)
 {
 	struct node *dt = dti->dt;
+	struct symbol *exportsym;
 	struct property *prop;
+	struct node *refnode;
+	cell_t phandle;
 
 	for_each_property(node, prop) {
 		struct marker *m = prop->val.markers;
-		struct node *refnode;
-		cell_t phandle;
 
 		for_each_marker_of_type(m, REF_PHANDLE) {
 			assert(m->offset + sizeof(cell_t) <= prop->val.len);
@@ -639,6 +640,25 @@ static void fixup_phandle_references(struct check *c, struct dt_info *dti,
 			reference_node(refnode);
 		}
 	}
+
+	for_each_symbol(node->exportsymlist, exportsym) {
+		refnode = get_node_by_ref(dt, exportsym->ref);
+		if (!refnode) {
+			if (!(dti->dtsflags & (DTSF_PLUGIN | DTSF_ADDON))) {
+				FAIL(c, dti, node,
+				     "Export \"%s\" references to non-existent node or label \"%s\"\n",
+				     exportsym->name, exportsym->ref);
+			}
+			exportsym->phandle = cpu_to_fdt32(0xffffffff);
+			continue;
+		}
+
+		/* Create the phandle property for this referenced node */
+		phandle = get_node_phandle(dt, refnode);
+		exportsym->phandle = phandle;
+
+		reference_node(refnode);
+	}
 }
 ERROR(phandle_references, fixup_phandle_references, NULL,
       &duplicate_node_names, &explicit_phandles);
-- 
2.55.0

