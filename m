Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4B72E9749;
	Mon, 12 Jan 2026 14:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227659; cv=none; b=fvU8BZMslTnqp3RfZ9nMqNYnPVeDVQF7yyM6uiIVgQ5f5P9mpEgVFoD5H7VQYaWekv/KAnv6+sAMnlzutQsxT4VbkCp9RWfyp/zzVlTA69TUF0DcFJlzXqsOZUOTqr5vQRh8rJ9H6u7C5LwwBOf9mM1uazJJiUq0O1gbGGh2+RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227659; c=relaxed/simple;
	bh=onITgzl/j/aTxCmRAXv0CYwm9QPcprVC79srL7J+ERI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KF7BK1vfj7IT7+vZ8A/yv8tAy8680xx1CMDb5WLQqNElTmkJtd5pWRLn4Ir8TdPL9ud7WNi8zM6QYrerN2PpRroRFM/OIysw3liyCVP+22xWwfdgFWastV+wLSeFDm0MQDOaquEEnhxBSCZ6DpfPfCDASgwFRkQwqaYmcVK13g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=qqyDn8B2; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="qqyDn8B2"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A80004E4208F;
	Mon, 12 Jan 2026 14:20:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7C57E606FA;
	Mon, 12 Jan 2026 14:20:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 77D14103C8CD8;
	Mon, 12 Jan 2026 15:20:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227653; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=MbcsH2VKS+PWLxCMGjlcJa8WB63hBbUf1OPFHJBaSgU=;
	b=qqyDn8B2FgG4r6t2KN0YUo+XOGcvyjD3SmeihyXPJ8hMKAGS5DAFTN+a+pDznob4Sr2TL/
	r1JyntFgF9bh2a+GdI/teeGcOHkPY0zyIDWtRpQsqpAjqS+phflRzT+KXjZNeMJMd2FWXm
	SIezYCV6P8JWJPT0nzPmsZy3bGUvwRf5bvVBJCr4TC75QRuxPOscU3M5rh3wr+2FdMz6es
	o+uP1SvULOg9Kc7Zs8MjL3oL4QNKsX00Uvh2ZuYsag9XFrdTlLXnsw5ZRtTP7Gqtpfx+GH
	2YCi6HWIV/8dcRLeGx9rDb6MicVNH56uSFo4kYzR4WP9Zn0nuGOvpRsbSL6D2g==
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
Subject: [RFC PATCH 21/77] checks: Handle export symbols in fixup_phandle_references()
Date: Mon, 12 Jan 2026 15:19:11 +0100
Message-ID: <20260112142009.1006236-22-herve.codina@bootlin.com>
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
index 2be19c0..d1e215e 100644
--- a/checks.c
+++ b/checks.c
@@ -604,12 +604,13 @@ static void fixup_phandle_references(struct check *c, struct dt_info *dti,
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
@@ -631,6 +632,25 @@ static void fixup_phandle_references(struct check *c, struct dt_info *dti,
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
2.52.0

