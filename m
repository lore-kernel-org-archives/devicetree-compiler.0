Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4303C4553;
	Thu,  9 Apr 2026 11:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775735697; cv=none; b=EioLJgyK/gQ/6uETp7ZI9ujFvIFdjT6wqL0ZtiXV4to7Uc8n/qXZgduxqdHsKFMELnyJf946Ir0wDkpFghodZ1S+DdS2ZnTiqwPFWThZVfgmLuiqy4Bo+62eNKQ9MqZwV0nq5kYKBPHZbDFbbbIeZ/M76ta76MkYff1JhkibMEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775735697; c=relaxed/simple;
	bh=V2JsqGwS9xYgK+7CH5F3/e1oMco3g+8nlFA+k/CToI0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aY57x0Me7BtuqyDZUUytWJIRzRX50ui5rkTAYvxh/7nouPStw0+0yCbVwJNEZqgV/HEXArD4Md5zFbScUvtHp0jaVQY+cKR5ERSrrTECIq/sN+gjvQQ6iAyGNSkDiL15eNxP9sbcvYdu3xLman1Sptv6CNzSOPELIBmJj2sqfTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=EAjP2sXW; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="EAjP2sXW"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 47FA11A3244;
	Thu,  9 Apr 2026 11:54:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1E8165FDEB;
	Thu,  9 Apr 2026 11:54:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ABE94104500B1;
	Thu,  9 Apr 2026 13:54:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775735694; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=wQPItEyLNOsk7+xw9oEF1BLERdrQblnRniLdEqpFgw8=;
	b=EAjP2sXWZSTkoiH/23gVq5aeqEstKSnl7wKSVO8kYMePwpDkIChEtcmoGXjmj7lOtfACEw
	53eVnm3cODMQie2lr1kHTp4JqHxLQdcPyvTDc9rj7Vx4Yj5NLY63L58M6rl6ntEfYnKC5Y
	6SZeIbDSPaLKcKVnNH3BHO3Ff5wzrTehi4KM3miL3r0+1Cm0cffm316yn0wfxrPNylPLbR
	Tj52cZzOQuA0Cfz4wHmMDW1xgPXVGi3dFbMD4abef5vz1PAO6W8xWFV/5iOCd3o67rP3ZY
	ivl4w67ss0rmfLz1u4GyKb2xPE5AemPZp/j/i04gM7iuM5fPb59lQxn7FOykXQ==
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
Subject: [PATCH v2 03/10] tests: asm: Introduce treehdr_vers macro
Date: Thu,  9 Apr 2026 13:54:19 +0200
Message-ID: <20260409115426.352214-4-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260409115426.352214-1-herve.codina@bootlin.com>
References: <20260409115426.352214-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

tree.S is used to generate custom dtbs. It uses the treehdr macro to
build the header part.

The current definition of this macro doesn't allow to set custom
settings related to version fields.

In order to easily generate some dtb with custom version values without
duplicating the full header computation, introduce the treehdr_vers
macro.

The modification doesn't introduce any functional changes.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 tests/trees.S | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/tests/trees.S b/tests/trees.S
index d69f7f1..4db2b9b 100644
--- a/tests/trees.S
+++ b/tests/trees.S
@@ -8,7 +8,7 @@
 	.byte	(\val) & 0xff
 	.endm
 
-	.macro	treehdr	tree
+	.macro	treehdr_vers	tree vers last_comp_vers
 	.balign	8
 	.globl	\tree
 \tree :
@@ -17,13 +17,17 @@
 	fdtlong	(\tree\()_struct - \tree)
 	fdtlong	(\tree\()_strings - \tree)
 	fdtlong	(\tree\()_rsvmap - \tree)
-	fdtlong	0x11
-	fdtlong	0x10
+	fdtlong	\vers
+	fdtlong	\last_comp_vers
 	fdtlong	0
 	fdtlong	(\tree\()_strings_end - \tree\()_strings)
 	fdtlong	(\tree\()_struct_end - \tree\()_struct)
 	.endm
 
+	.macro	treehdr	tree
+	treehdr_vers \tree 0x11 0x10
+	.endm
+
 	.macro	rsvmape	addrh, addrl, lenh, lenl
 	fdtlong	\addrh
 	fdtlong	\addrl
-- 
2.53.0

