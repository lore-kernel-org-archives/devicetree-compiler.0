Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9653138B98E;
	Tue, 10 Feb 2026 17:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770744871; cv=none; b=N9aCtnynmMF+Smzo0XQayR8grnrkMo8hoCY5F9zsEO+s5nT8rn0kSflJd3PVlmhYnjM9r10TaskDVDVxiYGgnNfPv3VBr83X08Od6H1XtVCt5YTK0kHL5DUS44A+gaivn+w2LrBUYHClcxsPkyfExh9IHEdGDRhDMJQZAWvB9o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770744871; c=relaxed/simple;
	bh=Z/oydfpGOCxdFGc372aiXq83qdbcRaqJqG51xjNfBrI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pifzUA15m7FQaoOqGzoOAqG4H14ILzjZFQooXw9YFtd/HXO5rSP52spn9LDn0XHv3Xc59QZ9DJA2gsFrpBEuupabDdxXkIyz/SLbETExaE3ziA8SkPrwRZgOZgYADlRy3ZrAP1VyrqsiSQSKl/OO/gJ7MBXVQLk+vUVMBQWFb3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=N5sRmW2h; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="N5sRmW2h"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 659231A0D83;
	Tue, 10 Feb 2026 17:34:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3BE8B606BD;
	Tue, 10 Feb 2026 17:34:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5FF9110B92228;
	Tue, 10 Feb 2026 18:34:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770744868; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=lfBZyaOnQKahul2oKqZRv4nz6l5s4zrM0dhVGQ0T4Ak=;
	b=N5sRmW2hTPH7fhqm581SWeOx+3u7OTlL6VWaYvZ3Fvb2WCDzZAhpnr+9d58vItsBnolJAd
	r267RfSI27SHVweFqiiofw2+c9Taer9MQ4Zmaomj9CVSL5K2iLkkpAn3G1rULTexeO6+fK
	xD0PO/jUdP3HswSJaaNgcHfIgvPn6p1BkIIh6ePALVL5OqhxwRDszrB8iIb/LJmGgx3OYX
	xMPEnnWQtCIWxhmDV5br8wq7q6Kd+tAetPpx0RvdYgsW/SVq6nGPWqDPWCsvWRoNzJZSbY
	ctvmcfIUPDQlcv3CMqGFStmC2LnIQB6yxtF4mV5/RhMv3al2/LH/XX+7bxG3MA==
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
Subject: [RFC PATCH 06/15] libfdt: Don't assume that a FDT_BEGIN_NODE tag is available at offset 0
Date: Tue, 10 Feb 2026 18:33:34 +0100
Message-ID: <20260210173349.636766-7-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260210173349.636766-1-herve.codina@bootlin.com>
References: <20260210173349.636766-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

In several places, libfdt assumes that a FDT_BEGIN_NODE tag is present
at the offset 0 of the structure block.

This assumption is not correct. Indeed, a FDT_NOP can be present at the
offset 0 and this is a legit case.

fdt_first_node() has been introduce recently to get the offset of the
first node (first FDT_BEGIN_NODE) in a fdt blob.

Use this function to get the first node offset instead of looking for
this node at offset 0.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 libfdt/fdt.c    | 10 ++++++++--
 libfdt/fdt_ro.c | 16 +++++++++++++---
 libfdt/fdt_rw.c |  6 ++++++
 3 files changed, 27 insertions(+), 5 deletions(-)

diff --git a/libfdt/fdt.c b/libfdt/fdt.c
index 676c7d7..ff2fa6c 100644
--- a/libfdt/fdt.c
+++ b/libfdt/fdt.c
@@ -279,11 +279,17 @@ int fdt_first_node(const void *fdt)
 
 int fdt_next_node(const void *fdt, int offset, int *depth)
 {
-	int nextoffset = 0;
+	int nextoffset = offset;
 	uint32_t tag;
 
+	if (offset <= 0) {
+		nextoffset = fdt_first_node(fdt);
+		if (nextoffset < 0)
+			return nextoffset;
+	}
+
 	if (offset >= 0)
-		if ((nextoffset = fdt_check_node_offset_(fdt, offset)) < 0)
+		if ((nextoffset = fdt_check_node_offset_(fdt, nextoffset)) < 0)
 			return nextoffset;
 
 	do {
diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
index 63494fb..8e1db7d 100644
--- a/libfdt/fdt_ro.c
+++ b/libfdt/fdt_ro.c
@@ -229,6 +229,12 @@ int fdt_subnode_offset_namelen(const void *fdt, int offset,
 
 	FDT_RO_PROBE(fdt);
 
+	if (!offset) {
+		offset = fdt_first_node(fdt);
+		if (offset < 0)
+			return offset;
+	}
+
 	for (depth = 0;
 	     (offset >= 0) && (depth >= 0);
 	     offset = fdt_next_node(fdt, offset, &depth))
@@ -251,13 +257,17 @@ int fdt_path_offset_namelen(const void *fdt, const char *path, int namelen)
 {
 	const char *end = path + namelen;
 	const char *p = path;
-	int offset = 0;
+	int offset;
 
 	FDT_RO_PROBE(fdt);
 
 	if (!can_assume(VALID_INPUT) && namelen <= 0)
 		return -FDT_ERR_BADPATH;
 
+	offset = fdt_first_node(fdt);
+	if (offset < 0)
+		return offset;
+
 	/* see if we have an alias */
 	if (*path != '/') {
 		const char *q = memchr(path, '/', end - p);
@@ -579,7 +589,7 @@ int fdt_get_path(const void *fdt, int nodeoffset, char *buf, int buflen)
 	if (buflen < 2)
 		return -FDT_ERR_NOSPACE;
 
-	for (offset = 0, depth = 0;
+	for (offset = fdt_first_node(fdt), depth = 0;
 	     (offset >= 0) && (offset <= nodeoffset);
 	     offset = fdt_next_node(fdt, offset, &depth)) {
 		while (pdepth > depth) {
@@ -617,7 +627,7 @@ int fdt_get_path(const void *fdt, int nodeoffset, char *buf, int buflen)
 	else if (offset == -FDT_ERR_BADOFFSET)
 		return -FDT_ERR_BADSTRUCTURE;
 
-	return offset; /* error from fdt_next_node() */
+	return offset; /* error from fdt_next_node() or fdt_first_node() */
 }
 
 int fdt_supernode_atdepth_offset(const void *fdt, int nodeoffset,
diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
index 90ea14e..f5c28fc 100644
--- a/libfdt/fdt_rw.c
+++ b/libfdt/fdt_rw.c
@@ -354,6 +354,12 @@ int fdt_add_subnode_namelen(void *fdt, int parentoffset,
 
 	FDT_RW_PROBE(fdt);
 
+	if (!parentoffset) {
+		parentoffset = fdt_first_node(fdt);
+		if (parentoffset < 0)
+			return parentoffset;
+	}
+
 	offset = fdt_subnode_offset_namelen(fdt, parentoffset, name, namelen);
 	if (offset >= 0)
 		return -FDT_ERR_EXISTS;
-- 
2.52.0

