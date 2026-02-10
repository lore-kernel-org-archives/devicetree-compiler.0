Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173E6393DEF;
	Tue, 10 Feb 2026 17:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770744875; cv=none; b=jJ4esk0wqrz5QvyOo/DDR2+h12a+/k7+uIQpyMUX75npvxvaa+5FuEzSRw07enHWybvh3kGE+6VY8OuWtX4HT9C7/mSn8488FWfVHzuK102Ql33S6Yv4R4KX/HWBqIpE+L2Xmfnihto75kfcvifFczaATsuXFiiOX6gENYtujTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770744875; c=relaxed/simple;
	bh=kHRGihOy6m8oDXS/75QNz1877zsdyY+cQ4ynaVyUZ1w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ghSsqFjbJ7+ZqCxNrzFFdmWRq2VmrFAnjXgxrqDm+cSE9HDWnYeA57c6txyEX73LpgutD3f0tpvn9aTds4fiwXDcbSAO/jy+SbpkXGtLbVBA6xG5qeNeBljZEiP1SNFs/EA3srWMftAPETDGb072quz+5vQaBIIJJC88QgLOzgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NRpjwJLd; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NRpjwJLd"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 24AF4C8F450;
	Tue, 10 Feb 2026 17:34:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B9BC5606BD;
	Tue, 10 Feb 2026 17:34:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 53F5510B91B35;
	Tue, 10 Feb 2026 18:34:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770744871; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=MRm5gadAPy/JOC6qJTX8byNIg7bTWl9sy1ThiPgeJwc=;
	b=NRpjwJLdl7n5/iRzAaTOePiu747xDJS8lfvya++1MvahYhtegZb1iCrlb7u2V4NbOtEnG2
	XnO5EBJo+Mw9y36Xjz+Y/s67wtPJQmMVeqRGrXqcgeBfOmX9ASyKwGz/daEaqDn3ohcrql
	Z76VFzEvOELfwygEh//P9rkrkxtkdI/49ehltE4emHS5kWGrJjr5XBQ0yMi8aIY45ZiNyO
	UzbkVc5a15X1nOC/hHmRh052HGDTx8khwn6tYU8e8onjgzvQFVPqzb8uSq0JsqrHIZENeW
	gNXvf1Tts/KtpkCT/SmwItDlo8dwOonGa67pmF6mB+cq3kbybzizr1nTW8MHDA==
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
Subject: [RFC PATCH 08/15] tests: asm: Introduce treehdr_vers macro
Date: Tue, 10 Feb 2026 18:33:36 +0100
Message-ID: <20260210173349.636766-9-herve.codina@bootlin.com>
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
2.52.0

