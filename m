Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B75366546;
	Mon, 12 Jan 2026 14:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227703; cv=none; b=flXeOP5YFpgCzDCoTC9hpd0c0BT8qdM8VI4ZesYHqQ29k4TycwzCStLWcRjqlBzlHKjf7w/g7D8w3PRcA2O6fa+lsQNZd+vEb5QnJNFF/2m47Sn1JPJ4MvHOWhXAQsOm1+vhBs5i4KD/KeprZIZCLR+kCbK/C9Krw59LhsrO0KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227703; c=relaxed/simple;
	bh=3XmB2u9U/VDfXppclgC3N/shDA+YrQfPSs8p/ZHWy/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ifcoj8tFl2CKZOcGxhQO+M7wayuF6XVpnd3L7FAAH2K5nLW3qG7DUMr62Dn5gINmc1OjdmLnFudzJd9KL5ZymND80oJtPfW110lSoyHMo39d27uSQweY1BJYJb4XeUoWeiFibq7S43165HsgyM0dG1Y6SI6KM9CMSWAfNp1zoVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kFrD/Ruf; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kFrD/Ruf"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id F0D604E42097;
	Mon, 12 Jan 2026 14:21:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C17A2606FA;
	Mon, 12 Jan 2026 14:21:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A63AB103C9262;
	Mon, 12 Jan 2026 15:21:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227699; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Y8Z8zQUeievmL1QoaB7RXDFDsCHVVHoepAC6NjzURqA=;
	b=kFrD/RufScajvf3u54a20+5Q+sljs5ndCGvLbkFJ9X+gGPfD0WauuGYnarPoFkJU19f13r
	+1D31pb1IjLTJvDpINj1cYtbTXYDG+Ud/uNvfc1e7w7aludPNjanC8Lz6br7fNT6/aGs7G
	ucygB3gELZWbQL8q4+l2a0W2E1bPESc7vzyrSeV/rYFwt6x5tlY+oxt4VtDN+ddzZ9hdHp
	eZcVmJGPmAWhvNLYkLVtjiafbMLV5V8E+tNVTmKxD5g/SnjcS1UgwSMYfHqmfJCgepBfVz
	PFjDHt8C7xey7X6LX/aZQ7ZGyQHyfSTxwr8lJl1QTUpTpDh/Ad+EWOAWWrDtoA==
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
Subject: [RFC PATCH 52/77] checks: Perform checks for orphan nodes
Date: Mon, 12 Jan 2026 15:19:42 +0100
Message-ID: <20260112142009.1006236-53-herve.codina@bootlin.com>
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

Those nodes and related trees need to be handled by the check process.

Indeed, in addition to performing checks, phandles are allocated and
referenced nodes are marked 'referenced' during the check process.

Take into account orphan nodes in check process.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 checks.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/checks.c b/checks.c
index 0a855f9..3ed3a0c 100644
--- a/checks.c
+++ b/checks.c
@@ -155,6 +155,7 @@ static bool is_multiple_of(int multiple, int divisor)
 static bool run_check(struct check *c, struct dt_info *dti)
 {
 	struct node *dt = dti->dt;
+	struct node *orphan;
 	bool error = false;
 	int i;
 
@@ -180,6 +181,9 @@ static bool run_check(struct check *c, struct dt_info *dti)
 
 	check_nodes_props(c, dti, dt);
 
+	for_each_orphan(dti->orphanlist, orphan)
+		check_nodes_props(c, dti, orphan);
+
 	if (c->status == UNCHECKED)
 		c->status = PASSED;
 
-- 
2.52.0

