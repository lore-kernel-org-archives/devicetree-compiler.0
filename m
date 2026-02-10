Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0D438B7CA
	for <devicetree-compiler@vger.kernel.org>; Tue, 10 Feb 2026 17:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770744870; cv=none; b=Uke4pPSKRdCnQcO4h9XsH4R2rAKjNSSz0U5qkiKd63sjRMDNHL9r6SZfw/iw/OIqWbJnHqHfIH7GCnkREz7ZjRmwL5+I256cDVPH73FMjODy1pYs17tFVyit3acBmaenwaHjoxgkGQFWzYZ2F6IR3sHAlZ6nfmOBApIVl8xPRr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770744870; c=relaxed/simple;
	bh=mZqSgwnKCpa15sF6HzNPxNtM7iJNXr4LfjyUvoCEc90=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZQr9TlOGpk6EV81U2/2eCrJjIrKCJl9oxjlZLagiXjlRo6pdQV37ttjTLPYE5BxjHsOTWDVM58aLs73tCAEvsO+ZoowyRzluxI5jpL0WBpSr6J4M4TN434Sgbp+f5rdysBDKHV+qQH6PYh87Cswu/S30OpSQnX3xp/1Zqv1K/dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=2Ree5f83; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="2Ree5f83"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4CEDFC8F450;
	Tue, 10 Feb 2026 17:34:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E1CAA606BD;
	Tue, 10 Feb 2026 17:34:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 09ECB10B921D3;
	Tue, 10 Feb 2026 18:34:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770744867; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=DRWBCWSnytZ6SddzKx+UOrvKKZEvOAMIVqPtoAKNUGY=;
	b=2Ree5f83VtXu87+5FDgLsYutSejxdFo5CeY313rgMsKtXo4/fKhgoF9pXjo7FYuSZnhTtb
	YGw8dW4e5RolRh1m6qnni/CPzh5GhDK0a2KkLsN169Gg5JnIygYq6+O36U0qBQoP9mfMn4
	8f5OlZ5Pz98Jt9WHAGIGIWB2yU4Wsim4hH9YuhkGV0FElvneWzcxJqeXDuKWcUFSUPDAl6
	6rEwwRqflDuxmmfQLMjqKntRD2u8k2dtyGTnMnsGPU5dlZrPZsMxHlpMwyeDd0SQxQSPDs
	a/j0Z/O3CcYeZAr0c9tEBaVuS9FH/RvgPK7pK9oRXrRade7SLusRBkDk9SDVqg==
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
Subject: [RFC PATCH 05/15] libfdt: Introduce fdt_first_node()
Date: Tue, 10 Feb 2026 18:33:33 +0100
Message-ID: <20260210173349.636766-6-herve.codina@bootlin.com>
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

Introduce fdt_first_node() in order to get the offset of the first node
(first FDT_BEGIN_NODE tag) available in a fdt blob.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 libfdt/fdt.c             | 25 +++++++++++++++++++++++++
 libfdt/libfdt_internal.h |  1 +
 2 files changed, 26 insertions(+)

diff --git a/libfdt/fdt.c b/libfdt/fdt.c
index 56d4dcb..676c7d7 100644
--- a/libfdt/fdt.c
+++ b/libfdt/fdt.c
@@ -252,6 +252,31 @@ int fdt_check_prop_offset_(const void *fdt, int offset)
 	return offset;
 }
 
+int fdt_first_node(const void *fdt)
+{
+	int nextoffset = 0;
+	int offset;
+	uint32_t tag;
+
+	do {
+		offset = nextoffset;
+		tag = fdt_next_tag(fdt, offset, &nextoffset);
+		switch (tag) {
+		case FDT_END_NODE:
+		case FDT_PROP:
+			return -FDT_ERR_BADSTRUCTURE;
+
+		case FDT_BEGIN_NODE:
+			return offset;
+
+		default:
+			break;
+		}
+	} while (tag != FDT_END);
+
+	return (nextoffset < 0) ? nextoffset : -FDT_ERR_NOTFOUND;
+}
+
 int fdt_next_node(const void *fdt, int offset, int *depth)
 {
 	int nextoffset = 0;
diff --git a/libfdt/libfdt_internal.h b/libfdt/libfdt_internal.h
index 0e103ca..4c15264 100644
--- a/libfdt/libfdt_internal.h
+++ b/libfdt/libfdt_internal.h
@@ -32,6 +32,7 @@ static inline const char *fdt_find_string_(const char *strtab, int tabsize,
 }
 
 int fdt_node_end_offset_(void *fdt, int nodeoffset);
+int fdt_first_node(const void *fdt);
 
 static inline const void *fdt_offset_ptr_(const void *fdt, int offset)
 {
-- 
2.52.0

