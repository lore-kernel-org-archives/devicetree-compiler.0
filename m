Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB99628690;
	Mon, 12 Jan 2026 14:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227636; cv=none; b=ttQrcLupzZkTrs4WXmJs0hEuz2IiCJnf4Bxt71wDKnasKXlNScnvEjxEQCZC/R28XsKXfsNDbOwPyHWFKL4SGHf47SoINFV0LRmWXYoXkvuCvdrgWnk8HBJcYVUxiAqHSEl7W5Lmsp4+y+njbb4dLLO0svGqL1gq7tYVqE4B3kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227636; c=relaxed/simple;
	bh=HnzCHq9aLoqzn8azuoQ36GxKVX+LOp2A1A6oGdqgrTk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YkHLxoFQ/TneJirRUup0+5QVXHzIVVRMLTigcCuseb00fkfG+vRJhmGZpYT7xrnqKwUAz8fKWCQlBRUihDTbFGpymYEVVONdvMSxQVeszSfxhj0Bf1/fwXO+nN+6SWhRkESMw8BdfAK3FcLOynnjT/DvRszKkrlnHBNCdMNE/Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=yCRp+iDf; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="yCRp+iDf"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8398CC2086B;
	Mon, 12 Jan 2026 14:20:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3ABE860732;
	Mon, 12 Jan 2026 14:20:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 253D4103C8CD8;
	Mon, 12 Jan 2026 15:20:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227623; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=1j23LmyPC4ZZ4R/AQp4I/05eHF1WCAB+ohIqJ2dvH/A=;
	b=yCRp+iDfT3SkkLMyTtJaenXAzv8XuHvr1g8rR9swTaly6viikF6zHwDzPIEm8CdX1gDYtX
	lJEkuaBcDusWVA0ZRS+dJ94OWu1fRitI6dR76DY4vl3F1e4iA/zWFovr8XzZny/PzNFB+G
	CAisq4q86guRPrsZOgxnQ+8o4nnqr/In5zObiYDaK1UKH3F99cXfabhNL7gEWYGfj+iw2j
	Xsza/9RmLD6ys8YqmxjRm7s83OGFDnAOORJ+oEEoywUsogBSLdBeuwvTHepJoxXru9VP6E
	hJcd05CfGLBfwPc7YH27udmZ/n2r2S9Vb65tNswaOQCIwwcoRAJJ4Z+BbxJpPQ==
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
Subject: [RFC PATCH 01/77] checks: Use consistent type for strspn() returned value
Date: Mon, 12 Jan 2026 15:18:51 +0100
Message-ID: <20260112142009.1006236-2-herve.codina@bootlin.com>
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

strspn() returns a size_t value.

The function is called in several places and in all places this value is
stored in a size_t variable except in check_node_name_chars_strict().

Fix the variable type used in check_node_name_chars_strict().

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 checks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/checks.c b/checks.c
index 5d09216..041e565 100644
--- a/checks.c
+++ b/checks.c
@@ -324,7 +324,7 @@ ERROR(node_name_chars, check_node_name_chars, NODECHARS);
 static void check_node_name_chars_strict(struct check *c, struct dt_info *dti,
 					 struct node *node)
 {
-	int n = strspn(node->name, c->data);
+	size_t n = strspn(node->name, c->data);
 
 	if (n < node->basenamelen)
 		FAIL(c, dti, node, "Character '%c' not recommended in node name",
-- 
2.52.0

