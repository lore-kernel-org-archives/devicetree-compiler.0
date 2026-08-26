Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FBE3C76BB;
	Wed, 26 Aug 2026 09:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787737974; cv=none; b=dIkLD9ADd7x6Vz1J66ZmYPynn/X5UW2BSZY/nogUinz6VlY80FF6WUMqQxxOTKesQ/MhLehVGZ5rdFUfkWc3/ya4p89ia6xrSNLUxOro1H+56sphh2OV8uI61tFlKfEMkzXDxLCuqH6fXUt/O/XQdcGRiigx1eIfhq49zXW98/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787737974; c=relaxed/simple;
	bh=32HXnz0JNhGXTTyzr73cCsDK+zjwFrp1hFYlxjim9uA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q/0a32+Z1Mas/xSPw1yNVnOQzRnDIn8YEes5jBDPatFhImDEZLefhIAiA1avpkbNHJiehYv0x1+yHWI+VRpsrvotqrkJZY04PTl4UseWKiwXlp2oXa3aYmydBEdATY4Svru25X1RLkAEDvaGRARi9hbgFLY0Fc0kF7lBQLvhA+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=TZQSUjNQ; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="TZQSUjNQ"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0D26B4E413BC;
	Wed, 26 Aug 2026 09:52:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D62EB604EC;
	Wed, 26 Aug 2026 09:52:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 99CDB11C7AD52;
	Wed, 26 Aug 2026 11:52:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787737966; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=QlhrHe1hz0RMEFm2j7aa9Cg2yZSF7D/6JMN8E7kGdU0=;
	b=TZQSUjNQ295AZ5E7HrYdMpyAXvQ6XJXhk+hZuFRTItEiO230her7V1VRnfk6gNAagUZP7E
	8HaHNaCof8UJ9nX0K2SNFGw6VLo4i+5K75qEF6YWW77GAcPjLm1RTdNIC/yVABnS8MlHME
	kuBXsKFQHFZ6bPmN1QbD4h1AiCR8Eyo38HZx3tCA3hI1z79mwh+mav511553aJYZ95dvWk
	x6ZzOsulxXbSm7U5F/6kyr6yo3T6J5QImobpxl3SEOgY/3sJJLsnP8bO/D/E8pS64/uArz
	cYZNdT1J7W68q2bsw2NXv6pNg7aC9JDnik42HPxcRC8yTyh7tJ894sjXy0sqcg==
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
Subject: [RFC PATCH v2 43/74] dtc: Change fill_fullpaths() signature to take dt_info
Date: Wed, 26 Aug 2026 11:49:12 +0200
Message-ID: <20260826094950.1088288-44-herve.codina@bootlin.com>
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

The future introduction of orphan nodes for addons device-tree will lead
to more than one tree in the addons data. Those trees will be:
  - the classical root tree starting at the root node
  - trees related to orphan nodes

Also, an addon device-tree can have only trees based on orphan nodes. In
other words an addon device-tree is valid without having the classical
'root' tree.

To prepare orphan nodes introduction, move fill_fullpaths() parameter
one level up and use dt_info struct instead of the 'root' tree (i.e.
dti->dt).

This change doesn't lead to any functional changes.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 livetree.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/livetree.c b/livetree.c
index f8abc5d4..a8c7c852 100644
--- a/livetree.c
+++ b/livetree.c
@@ -542,7 +542,7 @@ struct reserve_info *add_reserve_entry(struct reserve_info *list,
 	return list;
 }
 
-static void fill_fullpaths(struct node *tree, const char *prefix)
+static void fill_fullpaths_(struct node *tree, const char *prefix)
 {
 	struct node *child;
 	const char *unit;
@@ -556,7 +556,14 @@ static void fill_fullpaths(struct node *tree, const char *prefix)
 		tree->basenamelen = strlen(tree->name);
 
 	for_each_child(tree, child)
-		fill_fullpaths(child, tree->fullpath);
+		fill_fullpaths_(child, tree->fullpath);
+}
+
+static void fill_fullpaths(struct dt_info *dti)
+{
+	/* Fill fullpaths for the root node */
+	if (dti->dt)
+		fill_fullpaths_(dti->dt, "");
 }
 
 static void complete_ref_and_is_local(struct dt_info *dti, char **ref,
@@ -660,7 +667,7 @@ struct dt_info *build_dt_info(unsigned int dtsflags,
 	dti->boot_cpuid_phys = boot_cpuid_phys;
 	dti->importsymlist = importsymlist;
 
-	fill_fullpaths(dti->dt, "");
+	fill_fullpaths(dti);
 
 	/*
 	 * Complete references (REF_PHANDLE and export symbols).
-- 
2.55.0

