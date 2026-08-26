Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2A93FAE10;
	Wed, 26 Aug 2026 09:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787737991; cv=none; b=X95B8/KmuTz0EnwdNY9H39l6Y382Cu2bRCkwCgf/KsrS/8G4Ur3eadNIsPy02LlhHg2jckP3UoRm7Z0Wnn1JelcnZ9/z0yT1i9Ubs2dEjYYqFfBNvj66ppeeFhj4oaROgsJBMLw1ICHLiNBcU0wcI6mbqyooCWKx6zw1UtWZ2i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787737991; c=relaxed/simple;
	bh=PFmytyHuQnrMV2ZFVJV44YUZuZ7Vug2ZIztzzJ1uARQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uuJmqafUoYivsuZfVGbhOtxOJfq7R2/DT5No8j+F4nxXa4sWcSi5lBDqVo11ERfigpwDFVDlYRMcQ8t2/lR2Gur/EUAaHP64UFqU40etVHgjCF1XbxKIOcWM2wey7zbcA8wiVMOBctXCBY3HZhx4KuNV2YgM3LtJWzURTIGL5+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=s1E7ULR/; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="s1E7ULR/"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 109694E413BF;
	Wed, 26 Aug 2026 09:53:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D92BA604EC;
	Wed, 26 Aug 2026 09:53:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5214211C7AD65;
	Wed, 26 Aug 2026 11:53:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787737987; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=BBpOfDPqB+DEsSfu2qjc8VkO36mrZzucihzjxLAntww=;
	b=s1E7ULR/hjCVoqJEm7lkGmV7T1QCAO8+i4h4wummv9TLzaCgqtCntp18IFbP/volakv2rt
	f6xtmQZ3SJIWkNBRnbCT4b1ZfvEGHIKxR9e9HGIvo+4vXIA+8OweO3d85L5zgS8HQBzRrW
	jjGPFyhMS/k21/X78E4Qjb+DBf3UzfwNQZa3/jeQnjflq7V9zslw9PNRVHVg9M/v5OK9/i
	zbC6SiqURpRhttXXEUQcgVZ1QL9W6SekGzvFEImsUCTVCoonpHqAt5cefD/TZ9WuB95MJ8
	dY+NVgM0SuWmAja/1O8yEg41DWWUdaARCwlxeEoVufxrH6RElFXQ0gq7SfAm+A==
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
Subject: [RFC PATCH v2 47/74] dtc: Handle orphan nodes in complete_references()
Date: Wed, 26 Aug 2026 11:49:16 +0200
Message-ID: <20260826094950.1088288-48-herve.codina@bootlin.com>
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

Orphan nodes have been introduced recently.

Completing references involving orphan nodes is needed just like for the
'root' node.

Also, it is worth noting that even if an orphan node can be referenced,
this orphan node is an external node and so the references pointing
to orphan nodes cannot be a local reference.

Update related functions to handle orphan nodes.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 livetree.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/livetree.c b/livetree.c
index 8f0aa868..71712649 100644
--- a/livetree.c
+++ b/livetree.c
@@ -584,11 +584,15 @@ static void complete_ref_and_is_local(struct dt_info *dti, char **ref,
 	 * phandle value is available) but not the reference.
 	 *
 	 * Complete both ref and is_local based on existing values.
+	 *
+	 * Also take care of references pointing to an orphan node. Those
+	 * reference are not local references. Indeed, an orphan node is an
+	 * external node.
 	 */
 
 	if (*ref) {
 		refnode = get_node_by_ref(dti, *ref);
-		if (refnode)
+		if (refnode && !node_is_orphan(dti, refnode))
 			*is_local = true;
 		else
 			*is_local = false;
@@ -655,7 +659,12 @@ static void complete_references_internal(struct dt_info *dti, struct node *node)
 
 static void complete_references(struct dt_info *dti)
 {
+	struct node *orphan;
+
 	complete_references_internal(dti, dti->dt);
+
+	for_each_orphan(dti->orphanlist, orphan)
+		complete_references_internal(dti, orphan);
 }
 
 struct dt_info *build_dt_info(unsigned int dtsflags,
-- 
2.55.0

