Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6D937CD3B;
	Thu,  9 Apr 2026 11:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775735694; cv=none; b=JaTOqQcueiDUkjPj2+us9xC/Di+J0AIbtzHEBvgicnma6M9gsCzb661I9V2/f3esSAHrDsKpkDUy3Js1cAha2XHcvAx/x3hwn551FXBxy9f6HEaJ8sxh2ypWoO5eF6gk7oLHGrb7dEvHMSEUJE5BFSonul20cZhd2ZKxAyYgPMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775735694; c=relaxed/simple;
	bh=YUZDALDxvc4QSuC81g79Pee9AkbHNENDaalileizgfs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P54Oe4mXnV5NWzn6vaX6k1QUJYRQQgHhKGnyTT8oUQyoXECkwX2Ma7k7Pd10rNI4btOODkx3fDRZbRgl/HSPSTWoiS2FH3fbbJO78Zg9/6JKMPxTEQs20SDcvVnH+dZpo2zgQBdQci0k8xRfhj40Cq/hBWOjwzX1N2C466tQKvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=qsV2gpmb; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="qsV2gpmb"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9C3A51A323E;
	Thu,  9 Apr 2026 11:54:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 727045FDEB;
	Thu,  9 Apr 2026 11:54:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F214B104500AF;
	Thu,  9 Apr 2026 13:54:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775735690; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uUjOXtKOaxCwfkI49svwzAHimjSl1yjJCHOT6sumpQ8=;
	b=qsV2gpmbLR9rtayD+CrwE+SkUPWjhUjrQIxpCAihDGiDuv37lz8i7AnqZuXi2H8qazZOZN
	mg2UIZNJy+Tc0AAmmvm7X1lyFJajMTebuAXnR3fJfG549rwIUhJO4bNhIz56WUs6o45Qfi
	k5nSAhvt3PQ1tf3GoszSbbye1ANaYxVySWmLJw4e4eFBfD3g0kWr7gr9VHLoQT9pKh5wUZ
	++9PdFPVC+eDmrvbFe5wUojJR6h2qpIkKMy9stx+ff9cNAUyTf/Sm5PtIGoV1Iu7cPc1nG
	q93ifjV0Oeq57p/iFn3ndqlFuhW/WHbj6Y6hA+JoWzpcuBqqtsw0UIFHlU8nSQ==
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
Subject: [PATCH v2 01/10] libfdt: Introduce fdt_first_node()
Date: Thu,  9 Apr 2026 13:54:17 +0200
Message-ID: <20260409115426.352214-2-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260409115426.352214-1-herve.codina@bootlin.com>
References: <20260409115426.352214-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

In several places, libfdt assumes that a FDT_BEGIN_NODE tag is present
at the offset 0 of the structure block.

This assumption is not correct. Indeed, a FDT_NOP can be present at the
offset 0 and this is a legit case.

Indeed, the device-tree specification [0] defines the FDT_NOP tag as
follow:

   The FDT_NOP token will be ignored by any program parsing the device
   tree. This token has no extra data; so it is followed immediately by
   the next token, which can be any valid token. A property or node
   definition in the tree can be overwritten with FDT_NOP tokens to
   remove it from the tree without needing to move other sections of
   the tree’s representation in the devicetree blob.

Nothing refers to any location for this tag and it has to be simply
ignored. Having this tag at offset 0 doesn't make an exception, the tag
has to be ignored.

Introduce fdt_first_node() in order to get the offset of the first node
(first FDT_BEGIN_NODE tag) available in a fdt blob taking care of
FDT_NOP tags.

[0] https://github.com/devicetree-org/devicetree-specification/blob/main/source/chapter5-flattened-format.rst?plain=1#L317

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
2.53.0

