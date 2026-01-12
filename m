Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F5C361643;
	Mon, 12 Jan 2026 14:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227686; cv=none; b=rG+3NzRcllS7/14E2AmGe+F1mMHpSrIytAMpkS8MYkmRDztZ6XKr8AoZ31Cy2KrDlkzMnD6ZYN7HhKxJbv/VEVxe36u2zsOih3zFRr7YA9E6+ig5nwlcB+DgqyS7cpR46x1mWpki8myspeZDVQEp3W+CQjVee5zsSxnqdG4pFm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227686; c=relaxed/simple;
	bh=IhtcqPPHHR+d8cgYxMu+tvtglQnsOrF4VbtnjuBnTIs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FA4FgPGd1uyzhCGMafNZE3U0oFxd2gDvI7/rI4tGpV/NIVckNlnK+7Fx/78ACyg8YxhCN+/iBA2ZO78wk0HPtlI+iT/Z1sQWTrts/Etdbi+GItZX1KNL0AmDPoxALnZsTWAz82/usi4J4vnEOcQ+XMZYeBWXgnt3+j1s1tm926k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=rV3Hjh1S; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="rV3Hjh1S"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 34261C2086B;
	Mon, 12 Jan 2026 14:20:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id ABECF606FA;
	Mon, 12 Jan 2026 14:21:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CAD2B103C9266;
	Mon, 12 Jan 2026 15:21:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227680; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZJldroz6n2K7wZV9eCfbDZE1cK13dJqn3M2idW1Xvtc=;
	b=rV3Hjh1S8lOAzi54BVv3DGRRBHQWcsoBK90n+Lfdmp0QeFxPx8Tu89aKmiF5sYe929blaU
	fJGaOQ7f9sazfylGC8SILYm00CKXGr4g7QN9uOdMbOzAdeRgFEaT8Jh09u1GjnQd0oQBx0
	gkBcp76ZlUNlSl1QJzuflWmQIgDr+WAMvxnFTgcPGVdetbRQozpNi2SlWLIZRnPcDkEvMm
	CEHSZ5sZhsSUWq3ilKH0ZnmruAEjq/5mDNuzZDQd1qLSxBh8zEqdPNUdRhWXvs8/XqoGzo
	GxrI8EmKXNQSKr2cKh7tS+pTzGjmz0gc44u9mW0sluX5s5d/WZO3kL1nL6DXqg==
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
Subject: [RFC PATCH 39/77] check: Get 'chosen' node using get_subnode()
Date: Mon, 12 Jan 2026 15:19:29 +0100
Message-ID: <20260112142009.1006236-40-herve.codina@bootlin.com>
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

get_node_by_path() is going to be replaced by a more generic function in
order to handle orphan node support for addon device-tree.

The 'chosen' node is a subnode of the root node and can perfectly be
retrieved using get_subnode().

In preparation of the future change related to get_node_by_path(),
replace its usage to get the 'chosen' node by call to get_subnode().

The modification doesn't introduce any functional changes.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 checks.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/checks.c b/checks.c
index d1e215e..9744431 100644
--- a/checks.c
+++ b/checks.c
@@ -1341,8 +1341,7 @@ static void check_obsolete_chosen_interrupt_controller(struct check *c,
 	if (node != dt)
 		return;
 
-
-	chosen = get_node_by_path(dt, "/chosen");
+	chosen = get_subnode(dt, "chosen");
 	if (!chosen)
 		return;
 
-- 
2.52.0

