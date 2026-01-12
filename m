Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B733644AD;
	Mon, 12 Jan 2026 14:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227702; cv=none; b=iJamgGcuH7TBYtGt0yAl8u7ZKkuYcEtDH2a3BhoOdCkw7+uDvqt5+WqR0NebGUj3z8Ov/7cZS6CHjS2uks5lmgtv6xspN+FQ6k1veuqGbDVolQG3hvzM80zlso6gOBfnoayvre8XaQOMuZ79RGn9vARjBIauA5naanRU2vL+qa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227702; c=relaxed/simple;
	bh=xntXbVBtO+nX4Yp2Qnt+pPiYDGBiY9+fP2bcPhSivOM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mo68dXibBciCIsaa733QRPw+TnLf3B5MOvuEJlckoKYrkL7ai4eh2BT2N+q/RoBMEzhYuISlgM2sQYoROhYBGmCEC+VNoSn1YbSs3Lu1hcK2HzBaqDTzBta5tu83PkbIZfaKQVZIqzXk8lVzaCF2mnhxOoDNR1s6tz/jcEqZN0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=HZxLyH+2; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="HZxLyH+2"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7C7604E42088;
	Mon, 12 Jan 2026 14:21:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 52332606FA;
	Mon, 12 Jan 2026 14:21:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 76E0B103C9260;
	Mon, 12 Jan 2026 15:21:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227696; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=XGMM8bs5DtdAdz+Pv3kNdr/9N9Lli16DVt2ayg+uReo=;
	b=HZxLyH+2BWYf5IxKEcDiANcUqFsDEY4nTa5NsjyUjyo1y7R4W5S+bGQKBXKhLf6dkutAtr
	4psfZ1Q4AktmfIwvgVJ6tmsBIObV5w4NdR0Lp6UGg97b3rqsWobzpXkeOArTePoLsJXN03
	Y3H8e3HOAXm3y61HpaToAwxSBjpjjt6ofVF1cVhDOkdG7dOMj/sQ+MRfP4Oi146wmJ/Tws
	OxW2sMHdK9Ye5F/+Ogi08eV0GCInYeWulLBql9vZKWHXSMyFOebJBJH+C7LcZl3koHTxBv
	hGb0EHrZhwr5UVllvuBD/dGl++IPci8kntSeciOXc+TKcDIaf0+7veVMnWSLuQ==
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
Subject: [RFC PATCH 50/77] dtc: Handle orphan nodes in mark_local_xxx() and update_xxx_ref()
Date: Mon, 12 Jan 2026 15:19:40 +0100
Message-ID: <20260112142009.1006236-51-herve.codina@bootlin.com>
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

mark_local_phandles() and mark_local_exports() mark phandles and export
symbols as local when they reference a local node (i.e. a node in the
current device-tree).

update_phandles_ref() and update_exports_ref() update references
pointing to local nodes.

Those phandles, export symbols and references can involve orphan trees.

Indeed, even if an orphan node itself is not present in the current
device-tree, its subnodes are fully described in the current device-tree
and so, those subnodes have to be considered as local nodes.

Update those functions to handle orphan nodes.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 livetree.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/livetree.c b/livetree.c
index fa9daff..52c55be 100644
--- a/livetree.c
+++ b/livetree.c
@@ -1481,7 +1481,12 @@ static void update_phandles_ref_internal(struct dt_info *dti, struct node *node)
 
 void update_phandles_ref(struct dt_info *dti)
 {
+	struct node *orphan;
+
 	update_phandles_ref_internal(dti, dti->dt);
+
+	for_each_orphan(dti->orphanlist, orphan)
+		update_phandles_ref_internal(dti, orphan);
 }
 
 static void mark_local_phandles_internal(struct dt_info *dti,
@@ -1507,7 +1512,12 @@ static void mark_local_phandles_internal(struct dt_info *dti,
 
 void mark_local_phandles(struct dt_info *dti)
 {
+	struct node *orphan;
+
 	mark_local_phandles_internal(dti, dti->dt);
+
+	for_each_orphan(dti->orphanlist, orphan)
+		mark_local_phandles_internal(dti, orphan);
 }
 
 static void update_exports_ref_internal(struct dt_info *dti, struct node *node)
@@ -1537,7 +1547,12 @@ static void update_exports_ref_internal(struct dt_info *dti, struct node *node)
 
 void update_exports_ref(struct dt_info *dti)
 {
+	struct node *orphan;
+
 	update_exports_ref_internal(dti, dti->dt);
+
+	for_each_orphan(dti->orphanlist, orphan)
+		update_exports_ref_internal(dti, orphan);
 }
 
 static void mark_local_exports_internal(struct dt_info *dti,
@@ -1559,6 +1574,10 @@ static void mark_local_exports_internal(struct dt_info *dti,
 
 void mark_local_exports(struct dt_info *dti)
 {
+	struct node *orphan;
+
 	mark_local_exports_internal(dti, dti->dt);
 
+	for_each_orphan(dti->orphanlist, orphan)
+		mark_local_exports_internal(dti, orphan);
 }
-- 
2.52.0

