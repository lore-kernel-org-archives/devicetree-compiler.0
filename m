Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2699525A642;
	Mon, 12 Jan 2026 14:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227637; cv=none; b=V5jvWCydvtb/SHTopM7n3cKBOG+LS6i8yiUE5s1+4uM5BmIs04nTS8XNrgIijKb9tgw90nAQu70iZMHLbqONLCB/CPIwUpWg8NDAcoqQD2Vm99R04z2gUB0u1pFkR7z3K0yTgW33qtPSlhk7K2QR+fHWIboZq1tGQNVsvW0SYps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227637; c=relaxed/simple;
	bh=mvH09V7lrGA/S50DWTiUI7+DX7/+HTFsSeoUZVw3bdM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GlhBuMpZX5PxrLcXF412YrhmAOXZbPfIygmXtSISCDx+RbcRbA0lM/mMjLGODuqxKTzrW7phI7fReaqucFQisVZ797I5gfvR4sIsD2va09LqePff1AZgf7PAHGBx7hCvHyMvOdd7gogVUSEchRjlY3yCsHNSgag/c/GfwXsGNFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WMj9umbO; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WMj9umbO"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8B1EBC2086C;
	Mon, 12 Jan 2026 14:20:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 765386075A;
	Mon, 12 Jan 2026 14:20:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4D442103C8C61;
	Mon, 12 Jan 2026 15:20:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227626; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=jngatU43htu5Ifo+yB7tNhvkj0T5808QtUi5ZKsFCRA=;
	b=WMj9umbOglb1r4mpLmEV8b9Z6AYSkvZgg9xsV7ooUTkEbkeTTJYlgrXo4+1ZXjuQon4sFU
	4qEWoFEcXzj5lXrg0TWFD2XgqPc65itivxIRif9yx1+LAnbJDhMlNFpEpkpmVKvogf2/MU
	AcVZECoyKg0DoQK0w3+cFCWWM2TdGuTEthu/0zTsbZ7ZnbA51QqmBiCSEAnGm9cyq/Br0b
	f2GDoCmODwr/nzELFxT4GpcWGpyvlmjKNeetc7Mb2IRPMRNYE+9QW2RF1tJSC3LhDcOt82
	ZlyycE8N1nCrzbVFH4iW1e7powy8gOJHC3hmwP+avy7ZDbb5egVLt6AdWKXoGQ==
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
Subject: [RFC PATCH 03/77] libfdt: Introduce fdt_next_tag_full() and use it in fdt_next_tag()
Date: Mon, 12 Jan 2026 15:18:53 +0100
Message-ID: <20260112142009.1006236-4-herve.codina@bootlin.com>
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

In v18 dtb new tags are added. Prepare libfdt to handle those new tags.

Keep fdt_next_tag() handling only existing tags and introduce
fdt_next_tag_full() to handle new tags.

fdt_next_tag() uses fdt_next_tag_full() but it will filter out new tags
when they are introduced to have those new tags transparent for existing
fdt_next_tag() callers.

Code that will need to handle those new tags will use explicitly
fdt_next_tag_full() to have access to them when they need to.

No new tags have been introduced yet and modifications done here prepare
their introduction.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 libfdt/fdt.c       | 35 ++++++++++++++++++++++++++++++++++-
 libfdt/libfdt.h    | 18 ++++++++++++++++++
 libfdt/version.lds |  1 +
 3 files changed, 53 insertions(+), 1 deletion(-)

diff --git a/libfdt/fdt.c b/libfdt/fdt.c
index 95f644c..ce051a0 100644
--- a/libfdt/fdt.c
+++ b/libfdt/fdt.c
@@ -159,7 +159,7 @@ const void *fdt_offset_ptr(const void *fdt, int offset, unsigned int len)
 	return fdt_offset_ptr_(fdt, offset);
 }
 
-uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
+uint32_t fdt_next_tag_full(const void *fdt, int startoffset, int *nextoffset)
 {
 	const fdt32_t *tagp, *lenp;
 	uint32_t tag, len, sum;
@@ -220,6 +220,39 @@ uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
 	return tag;
 }
 
+uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
+{
+	uint32_t tag, tmp_tag;
+	int tmp_offset, tmp_next;
+
+	/* Retrieve next tag */
+	tag = fdt_next_tag_full(fdt, startoffset, nextoffset);
+
+	/* Look at next one to see what we need to do */
+	tmp_next = *nextoffset;
+	do {
+		tmp_offset = tmp_next;
+		tmp_tag = fdt_next_tag_full(fdt, tmp_offset, &tmp_next);
+		switch (tmp_tag) {
+		case FDT_BEGIN_NODE:
+		case FDT_END_NODE:
+		case FDT_PROP:
+		case FDT_NOP:
+		case FDT_END:
+			/* Next tag is not new tag introduced in v18 -> Ok */
+			*nextoffset = tmp_offset;
+			return tag;
+
+		default:
+			break;
+		}
+	} while (1);
+
+	/* We shouldn't reach this code */
+	*nextoffset = -FDT_ERR_BADSTRUCTURE;
+	return FDT_END;
+}
+
 int fdt_check_node_offset_(const void *fdt, int offset)
 {
 	if (!can_assume(VALID_INPUT)
diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index c5cd35d..d1a9cd5 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -154,6 +154,24 @@ static inline void *fdt_offset_ptr_w(void *fdt, int offset, int checklen)
  */
 uint32_t fdt_next_tag(const void *fdt, int offset, int *nextoffset);
 
+/**
+ * fdt_next_tag_full - get next tag in the device tree without any filtering
+ * @fdt:	Pointer to the device tree blob
+ * @offset:	Offset within the blob to start searching
+ * @nextoffset:	Pointer to variable to store the offset of the next tag
+ *
+ * fdt_next_tag_full() returns the tag type of the next tag in the device tree
+ * blob starting from the given @offset. If @nextoffset is non-NULL, it will
+ * be set to the offset immediately following the tag.
+ * fdt_next_tag() can return only a subset of all possible tags performing some
+ * internal filtering. fdt_next_tag_full() doesn't perform this filtering.
+ *
+ * returns:
+ *	the tag type (FDT_BEGIN_NODE, FDT_END_NODE, FDT_PROP, FDT_NOP, FDT_END),
+ *	FDT_END, if offset is out of bounds
+ */
+uint32_t fdt_next_tag_full(const void *fdt, int offset, int *nextoffset);
+
 /*
  * External helpers to access words from a device tree blob. They're built
  * to work even with unaligned pointers on platforms (such as ARMv5) that don't
diff --git a/libfdt/version.lds b/libfdt/version.lds
index cbfef54..7e2dde2 100644
--- a/libfdt/version.lds
+++ b/libfdt/version.lds
@@ -52,6 +52,7 @@ LIBFDT_1.2 {
 		fdt_strerror;
 		fdt_offset_ptr;
 		fdt_next_tag;
+		fdt_next_tag_full;
 		fdt_appendprop;
 		fdt_create_empty_tree;
 		fdt_first_property_offset;
-- 
2.52.0

