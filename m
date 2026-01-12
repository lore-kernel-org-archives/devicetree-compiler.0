Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4364259CAF
	for <devicetree-compiler@vger.kernel.org>; Mon, 12 Jan 2026 14:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227636; cv=none; b=M0KhD+uL01xC+09wbksiV/PFL9/l7lUJef0qErLfixMsaYJ/a7H4tYZCTYEiK1tg0F8DDL6geCt6/rMuX/uu8yGE4FxcD82skYxPaM+ZCahHnfK8zH2DlynyZNSBScxMmzvAkpf7vxF6Sb1EXdAX6EWljE0skUXINfgwsn4ZSxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227636; c=relaxed/simple;
	bh=CvLvY8SMr9F9mZwO/2tuWr2whQw14srELqUnn6HBTBc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DQL2wvcUrmb948dqnd2QIenam4Bk7QIcAGu4RMP6Vlf14IJZ3U6KUqIwcl8Tg6g6+/YPZyY5RjFhqYGKUNNMgPtMn1TQCRJuH48Yi/NNz1V3kXcbsNsnHl+/WOJzQq1EeN3Cd+XtlJ7BLe7HIE6NXpqaUKYWCmagr8+4FVohAyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=oqaGkhsI; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="oqaGkhsI"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 804C2C20869;
	Mon, 12 Jan 2026 14:20:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 93AA16075F;
	Mon, 12 Jan 2026 14:20:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5EC3A103C8CD8;
	Mon, 12 Jan 2026 15:20:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227629; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=IUPvT7nS1D4nXzhnOstmhdejKMlnh6AgZFSDlvQ1CHk=;
	b=oqaGkhsI+7DtrxzeEiBANcHQo4BF29lj6p8jmQMnXsHi/URq3Tdtp6KbqYfbjvchL/Uty8
	I3Z9xJP3BlPJGLIiHPDD5gb5GGSHB7biB4xL7V/LzuOeWTdAtPPNI3MB9LfG9G4ELSLEts
	6QXI3EwpkLK6uKzTcDW+16A/1E6CD9RHPwzCjtT3E17/aWjQjjibnvl72Ldnz+4U1MPqli
	7LcgSOiga2F14gVCmIhu5zJqxKT8PeT1IrlxSeczfDOf2JZXVWbWMv7h5a0hmaEYtwK2mB
	tTATXFdY1M/4EqCtascIcRroOkLVcmwkSQ6MrGqj9r0IJ3hWBZE7668l+y3uhA==
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
Subject: [RFC PATCH 05/77] fdtdump: Change FDT_PROP prob handling to ease future addition
Date: Mon, 12 Jan 2026 15:18:55 +0100
Message-ID: <20260112142009.1006236-6-herve.codina@bootlin.com>
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

In order to ease future tags addition, perform operation related to
FDT_PROP when the tag is explicitly FDT_PROP instead of relying to a
kind of default value case.

Handle the FDT_PROP tag exactly in the same way as it is done for
other tags.

No functional modification.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 fdtdump.c | 34 ++++++++++++++++++----------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/fdtdump.c b/fdtdump.c
index ec25edf..95a2274 100644
--- a/fdtdump.c
+++ b/fdtdump.c
@@ -129,23 +129,25 @@ static void dump_blob(void *blob, bool debug)
 			continue;
 		}
 
-		if (tag != FDT_PROP) {
-			fprintf(stderr, "%*s ** Unknown tag 0x%08"PRIx32"\n", depth * shift, "", tag);
-			break;
+		if (tag == FDT_PROP) {
+			sz = fdt32_to_cpu(GET_CELL(p));
+			s = p_strings + fdt32_to_cpu(GET_CELL(p));
+			if (version < 16 && sz >= 8)
+				p = PALIGN(p, 8);
+			t = p;
+
+			p = PALIGN(p + sz, 4);
+
+			dumpf("%04"PRIxPTR": string: %s\n", (uintptr_t)s - blob_off, s);
+			dumpf("%04"PRIxPTR": value\n", (uintptr_t)t - blob_off);
+			printf("%*s%s", depth * shift, "", s);
+			utilfdt_print_data(t, sz);
+			printf(";\n");
+			continue;
 		}
-		sz = fdt32_to_cpu(GET_CELL(p));
-		s = p_strings + fdt32_to_cpu(GET_CELL(p));
-		if (version < 16 && sz >= 8)
-			p = PALIGN(p, 8);
-		t = p;
-
-		p = PALIGN(p + sz, 4);
-
-		dumpf("%04"PRIxPTR": string: %s\n", (uintptr_t)s - blob_off, s);
-		dumpf("%04"PRIxPTR": value\n", (uintptr_t)t - blob_off);
-		printf("%*s%s", depth * shift, "", s);
-		utilfdt_print_data(t, sz);
-		printf(";\n");
+
+		fprintf(stderr, "%*s ** Unknown tag 0x%08"PRIx32"\n", depth * shift, "", tag);
+		break;
 	}
 }
 
-- 
2.52.0

