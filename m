Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4483F9F2F;
	Wed, 26 Aug 2026 09:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787737989; cv=none; b=XxpGCh0foJpfmvz1kv36Oh17Alc76It6Q3zWbNhN7i4hvZDIxBOZZNMi3x6GJr0F2TurPRe+eJK12j4GiRQvnQpehu+YvrRXloHpi/+7t5haRKl04fIsDf9t5qezeoX5GfQl/bd6mzKxTR7Matjby1A6c8gH6pSR3U24MKYPrE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787737989; c=relaxed/simple;
	bh=CD1bpG7Cvi6RGJrc4qx9SlGoPdRjIGzcOLi9lRL5JZY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P2PfbTgIlJghW0tjpoA6vXnOs5rQUqz8J5/JtUxLMbeSa9Ubn7ER3IP/8lh06e5SAydb6XBawjGg9wWkM+T/BsNtQCo4X0z7aYkz+wVqWGiQwZXKihhbyvvcqmR6RQGipvPYydrP9oktUiLQI3VzFuB+IN/kIWiGUP8bTIcNSqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=i7rCTuv4; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="i7rCTuv4"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 061844E413BC;
	Wed, 26 Aug 2026 09:53:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CF548604EC;
	Wed, 26 Aug 2026 09:53:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 127AB11C7AD37;
	Wed, 26 Aug 2026 11:53:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787737985; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=4YS4HqvFeRpSjubmer6FhoDk+l6CJqKqfiB3rNIUEeM=;
	b=i7rCTuv467DVp0yhVaN2taCfCLp7GNw4Yfp05SkUtFicQnuJUjN/TEWmUQsIZtXFZhZuJJ
	FS5j3j4HfV2CKR4wKxSSHsGKAzNnZUDskjP0rsBuItHL4V5dalXlSHkab5veltP3ofaNdE
	xa0EtJvnYM1UTkDXptXNlqCsVYmCUG3oolO2+PruDNJok8oVTGaeHe+sMzBGbR/C4h2wdj
	RJICGLZqc8fPSPaoLZ6OIGNocpJ5pvWUYXPMpOByeBAY5QwrTfbZDWGnGr984dImNsJepM
	Z6B0pK/hJVe6GIuHEK6iZVzrMCGIyJxMo3Fd3NvL+vYGl/27BnpYNaucp+t6/A==
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
Subject: [RFC PATCH v2 46/74] dtc: Avoid NULL fullpath for nodes in orphan trees
Date: Wed, 26 Aug 2026 11:49:15 +0200
Message-ID: <20260826094950.1088288-47-herve.codina@bootlin.com>
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

The process_checks() function uses fullpath in several places and
crashes due NULL pointer dereferences if fullpath is NULL.

In order to have process_checks() function running without crashes with
orphan trees (i.e. trees based on orphan nodes), the fullpath of node
available in those orphan trees must not be NULL.

Fullpath values are built by dti_fill_fullpaths(). Update it to handle
fullpath in trees based on orphan nodes.

Use a simple "__orphan__/" prefix to avoid the NULL pointer and to be
distinct from the root node ("/" prefix).

It is worth noting that this "__orphan__/" prefix is a temporary prefix
and it will be change later when support for reference by path involving
nodes in orphan tree is added.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 livetree.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/livetree.c b/livetree.c
index c61025a5..8f0aa868 100644
--- a/livetree.c
+++ b/livetree.c
@@ -561,9 +561,14 @@ static void fill_fullpaths_(struct node *tree, const char *prefix)
 
 static void fill_fullpaths(struct dt_info *dti)
 {
+	struct node *orphan;
+
 	/* Fill fullpaths for the root node */
 	if (dti->dt)
 		fill_fullpaths_(dti->dt, "");
+
+	for_each_orphan(dti->orphanlist, orphan)
+		fill_fullpaths_(orphan, "__orphan__/");
 }
 
 static void complete_ref_and_is_local(struct dt_info *dti, char **ref,
-- 
2.55.0

