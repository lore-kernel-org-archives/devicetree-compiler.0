Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51EE3FBEC2
	for <devicetree-compiler@vger.kernel.org>; Wed, 26 Aug 2026 09:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787737994; cv=none; b=iPUto5KY8SxI7d3GzN1rgw70qOnDA4U61xj+3nRUkBdhhdifUrq3994clFSn7rHx1xiLfsBi3Xgc70K1XARGaD4iBX0wI0Um+rb5fXRJwzwaZ1H6kHgSJibx/CsytQPLalDNIBLxQICMXpHbBHHxC9LjV6bcOn4p3Wn3JisXssk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787737994; c=relaxed/simple;
	bh=NUD4YcxZSfhRExTbK6LeLNrFCOTxBlnwN4MTLjMfOYk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NxgrCz2SCxbe1Y7QRd96xFWMmcjTgXasEX6xr1/QHNO3F60RJCQjEtkqF9OGiEEj3VSqklvv3CwuTkqGVAt9EGOIEdH15milv3s3Rw5T1OMHeul1+M8iSvmPcAtQA9ILEJmZ41qEEKKA008hieE/BlKG3viqpTcUMoet/5gWA7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=AI0MAE+9; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="AI0MAE+9"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4F6EE4E413C1;
	Wed, 26 Aug 2026 09:53:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1C95C604EC;
	Wed, 26 Aug 2026 09:53:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5E9FF11C7AD6C;
	Wed, 26 Aug 2026 11:53:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787737990; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=fR4+mkB8Ep73YfuoneA+uOAgSJ2DGQUU6W45DVoKB1o=;
	b=AI0MAE+9eR5deNUSLSkHAYd9voHyKZgIGs+N1nBCGbhSDm3eA2jXkRUN4diH1YUgocsuyU
	tnR3D87Uka55ycqUxX+Dhj1xuYXZbrT+tOGa6G6YWV8n42OEer5EAsozJFNgettf5xns+Z
	a1gW2fFtGWSC2JuTDnts9Uqgp71Af4V/V9s5t0weyAAFEAgV4qwsQxdnWt7GNcKO3Y61Ox
	okon1mOnCpVOhvLQnDhIS8E/iDGtDaPVaYUAfYmuvk6rGLMxmhUWe47gHaJI3CJIstNbBU
	t6TcwmsgN5ObDtif4QPtNyEp/UQolGYnTY75H67TnkPOOifD009cvLPcNI7dCw==
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
Subject: [RFC PATCH v2 48/74] checks: Perform checks for orphan nodes
Date: Wed, 26 Aug 2026 11:49:17 +0200
Message-ID: <20260826094950.1088288-49-herve.codina@bootlin.com>
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

Those nodes and related trees need to be handled by the check process.

Indeed, in addition to performing checks, phandles are allocated and
referenced nodes are marked 'referenced' during the check process.

Take into account orphan nodes in check process.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 checks.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/checks.c b/checks.c
index 2b87e212..a0024389 100644
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
 
@@ -313,7 +317,12 @@ ERROR(duplicate_property_names, check_duplicate_property_names, NULL);
 static void check_node_name_chars(struct check *c, struct dt_info *dti,
 				  struct node *node)
 {
-	size_t n = strspn(node->name, c->data);
+	size_t n;
+
+	if ((dti->dtsflags & DTSF_ADDON) && node_is_orphan(dti, node))
+		return; /* Checking name doesn't make sense for an orphan node */
+
+	n = strspn(node->name, c->data);
 
 	if (n < strlen(node->name))
 		FAIL(c, dti, node, "Bad character '%c' in node name",
@@ -324,7 +333,12 @@ ERROR(node_name_chars, check_node_name_chars, NODECHARS);
 static void check_node_name_chars_strict(struct check *c, struct dt_info *dti,
 					 struct node *node)
 {
-	size_t n = strspn(node->name, c->data);
+	size_t n;
+
+	if ((dti->dtsflags & DTSF_ADDON) && node_is_orphan(dti, node))
+		return; /* Checking name doesn't make sense for an orphan node */
+
+	n = strspn(node->name, c->data);
 
 	if (n < node->basenamelen)
 		FAIL(c, dti, node, "Character '%c' not recommended in node name",
@@ -628,6 +642,15 @@ static void fixup_phandle_references(struct check *c, struct dt_info *dti,
 						cpu_to_fdt32(0xffffffff);
 				continue;
 			}
+			if (node_is_orphan(dti, refnode)) {
+				if (!(dti->dtsflags & DTSF_ADDON))
+					FAIL(c, dti, node, "Reference to orphan node \"%s\"\n",
+						m->ref);
+				else /* mark the entry as unresolved */
+					*((fdt32_t *)(prop->val.val + m->offset)) =
+						cpu_to_fdt32(0xffffffff);
+				continue;
+			}
 
 			phandle = get_node_phandle(dti, refnode);
 			*((fdt32_t *)(prop->val.val + m->offset)) = cpu_to_fdt32(phandle);
-- 
2.55.0

