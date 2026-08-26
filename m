Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924773F12C2;
	Wed, 26 Aug 2026 09:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787737938; cv=none; b=uCTuV2uuIJx3gEvEQFdcQypBLXrY5PU8otzqpCL9LgLob6KgaIRgXmgtnr6DOsvjOREnroWSK02VNiFiu1kS3Tw8dQBv/fKQ93JvSavN4l93hlTALw556Rx5niOZ8IfHB6DuTlppvyYQFXF21LVCZInKYq54XwBLJiXyX3DJbFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787737938; c=relaxed/simple;
	bh=a0WPqiq7buP5BIsCiievBjAbwTdSmlRm9Gu+RTgmTnw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aqUjrG54GoAMU6RifO1XHsf5n+oYtC9QQ6LF00pZdsY321kvdZLaYB+ojd2cVKGKtR1nT/6RXHAG8HFaIQUM0tkU4siBn8VQHOEoh3MLgxx30fq6d2wiE9zEgDJSA5aIHUjxhjRJC4oABenSPcoZFdw5Nzbj8FVF+ga3QKg4JfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=R+XDdHMd; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="R+XDdHMd"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 54B3F1A183A;
	Wed, 26 Aug 2026 09:52:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 21A44604EC;
	Wed, 26 Aug 2026 09:52:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3DDA711C7AD52;
	Wed, 26 Aug 2026 11:52:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787737935; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZVQWpmEyygnjjaS4S1/YQs5wBXNGmyCDERQUlWo5ugU=;
	b=R+XDdHMdcwLHe5DdOCEm8znVKfwnBS7Pi+cpFQJdv4RcnQkKKmtwY0HT62bAqdlY8beeb0
	yR2XeOMV2d8A0R1nX6RoOuGRwCCvV+3y6xnXeIzJb6sicS/p/KmLF5wdB4BU/5s8MwwKtz
	X+TBe7H3gI5UVq7Kg/NzdU/nGMKUTOKF07/WYZrjUXjZ4iruAF9svQs462ECesSu4kT4WP
	zmENue2pGm445CZL9ON0uHYXIVXcn99yxmr7IIDE4AtTbiz3b+o+DVNS5uYlqA++BrIwmP
	N4KTxMoomSGp1kTZXqsdhsbN9wfptdKkpV/SCE0DGOFRJvzL/ywgiWLEwLol9w==
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
Subject: [RFC PATCH v2 35/74] checks: Get 'chosen' node using get_subnode()
Date: Wed, 26 Aug 2026 11:49:04 +0200
Message-ID: <20260826094950.1088288-36-herve.codina@bootlin.com>
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

get_node_by_path() is going to be updated in order to handle orphan node
support for addon device-tree.

The 'chosen' node is a subnode of the root node and can perfectly be
retrieved using get_subnode().

In preparation of the future change related to get_node_by_path(),
replace its usage to get the 'chosen' node by a call to get_subnode().

The modification doesn't introduce any functional changes.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 checks.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/checks.c b/checks.c
index 13e8b121..1332acc4 100644
--- a/checks.c
+++ b/checks.c
@@ -1349,8 +1349,7 @@ static void check_obsolete_chosen_interrupt_controller(struct check *c,
 	if (node != dt)
 		return;
 
-
-	chosen = get_node_by_path(dt, "/chosen");
+	chosen = get_subnode(dt, "chosen");
 	if (!chosen)
 		return;
 
-- 
2.55.0

