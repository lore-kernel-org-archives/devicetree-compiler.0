Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FBD361670;
	Mon, 12 Jan 2026 14:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227703; cv=none; b=Wu97u1uxpZrFfb0kjWhuDe23cjNEpaCi6fHVcd20aaZe4R1JEYe8LJQ3NPPbMSZ9Li9c2XJkCS9oH8o5njepz1cz9VW6kXCbBA39Ajt5Q5zPXbr7KuyNl+mvutx+OY27181+zQS74gyFbG+/EfGvQl0XQpdrV1/jcM4CQpQsy+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227703; c=relaxed/simple;
	bh=emz6BTfiZT39QJRtAInNNGDoqzeKXs1k4yodIzfFbMc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hYMkRfsYSENtLG7xYRPCuBW5Ol8Hyc6QdAgb6dH2qPg4gAJ/V0BO6TtRVtkZD9iE5iPmXato+9DVL4JOBQERBlKvA6APq5cNoOV4A1ckhtSTO9hxN8zjbUXhJ616iT99zS00mitG5D1vWV6zQyuDVgrUXjGvyUXP05yuWDdyuW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=j2pXUTvN; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="j2pXUTvN"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 84A484E42094;
	Mon, 12 Jan 2026 14:21:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5AFBA606FA;
	Mon, 12 Jan 2026 14:21:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CBF7B103C8CD8;
	Mon, 12 Jan 2026 15:21:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227698; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=t9eg9xhAykBraJlN9d8iype3cA15Fcc1FzDy86VUk+Y=;
	b=j2pXUTvNwOWF/XjA0ZsrozI3E54u/80Uvc3Fkr50cdFSzyRcWBX1FH+bD8DRZ03UMGg/RV
	3ctqwmb4JKc0RkVDlSWz3SI05o3GDglha87fgN9tjxLZtgH69c56q3udoZJ8sxx8mtNmuI
	mtVFFRwL4SmQkLvMSBQbwAnoxMbFkkVVa58rVm1gOkZu4Vyx9DF5msJsXR02Bq3yFvuR5B
	tJlvAkxUGqreQlVXAfbnl5P3//Yh7XPgpgHqdlptuvNC3d6dXEqe2/AEztNSO6bi/C1IvG
	pUx4+yw/QLzRa7TI8mqW3grLF11mp5QJVDy6F9LenS8DeHmwlzyENG9XV0UF+Q==
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
Subject: [RFC PATCH 51/77] dtc: Avoid NULL fullpath for nodes in orphan trees
Date: Mon, 12 Jan 2026 15:19:41 +0100
Message-ID: <20260112142009.1006236-52-herve.codina@bootlin.com>
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
 dtc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/dtc.c b/dtc.c
index 59f4d77..5cf8f31 100644
--- a/dtc.c
+++ b/dtc.c
@@ -47,9 +47,14 @@ static void fill_fullpaths(struct node *tree, const char *prefix)
 
 static void dti_fill_fullpaths(struct dt_info *dti)
 {
+	struct node *orphan;
+
 	/* Fill fullpaths for the root node */
 	if (dti->dt)
 		fill_fullpaths(dti->dt, "");
+
+	for_each_orphan(dti->orphanlist, orphan)
+		fill_fullpaths(orphan, "__orphan__/");
 }
 
 /* Usage related data. */
-- 
2.52.0

