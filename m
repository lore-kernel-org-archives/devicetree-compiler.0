Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569D9368296;
	Mon, 12 Jan 2026 14:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227709; cv=none; b=lrTUv/1Vt66kZxH8PhFdoX8lwmAPWdsppUAUF+cb1ee0Z4sAv1xu75avMokDZdygfzw+hSNCNxxMPlucSBfaleONxJdRuE6QVB3myqfInb9kOmiptkdNbxQci8UnTVovhT6k2SnYei9PtoZr/dBQsTO+a22P/qvuVUNW4nNkWys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227709; c=relaxed/simple;
	bh=lz9hbmhTi1lTJIqpgGtEj0TQNROAWDaLCFz0UGWKBiE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MowqKLaJZNmwQ2dZWR04460rvH8UFSPGoyENNWxTsxiMVm+uRSuOnReGpmIvNNGllvc2afBwMTtn2GPjh9gCTGiOYBKezhu5b1vGziv9mRwW7pMZinilaxKlX+NTITOteATTc8Fz6p1qV6RG48I3qztpGvTi98OL2LtmDBYS9QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=j7LPoSrG; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="j7LPoSrG"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 26CBD4E42094;
	Mon, 12 Jan 2026 14:21:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EF7C0606FA;
	Mon, 12 Jan 2026 14:21:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 92279103C9262;
	Mon, 12 Jan 2026 15:21:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227704; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=F9SddU6hLYTguCqwazUzMkRNt8xyd1Alz30DMqQA3Nw=;
	b=j7LPoSrG+ldgzvU5S5Lr09dBwsM5Gz1uc2x3id1iBNSlkWkLvqpM9/w/Sjrr8HQCNStgFO
	pQXjoEjz5+twFeUYXb05BA1tQEAsk/E73OM2N7NIDqyF0bq9f+ioLyA7rAiFVZ3jA0LM7u
	SgMhKbbGQuY9Q/tjLBLPG4v6+a7VHnPJ1BwVEjLswPuwVujHKJJRAfpYlZypdT1eMQ1Xjd
	nGdOab/CCRhCJ7eAIjfPmHViFYvaJcRKt+pcpSAGaEyld4f4rB8EWbaOD6IohtY8NqK4SE
	BmLB2q3CvlO33yuJLm/QQywPgqWUmGmnAcVHvbPPPh2d2jOU2DVj+UKn8oHhNg==
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
Subject: [RFC PATCH 55/77] dtc: Add orphan nodes in generated dts file
Date: Mon, 12 Jan 2026 15:19:45 +0100
Message-ID: <20260112142009.1006236-56-herve.codina@bootlin.com>
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

Orphan nodes parsing from an addon dts file is supported.

Add the support for orphan nodes in the dts file generation.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 treesource.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/treesource.c b/treesource.c
index 77ff4fb..bc5d847 100644
--- a/treesource.c
+++ b/treesource.c
@@ -384,6 +384,7 @@ void dt_to_source(FILE *f, struct dt_info *dti)
 {
 	struct reserve_info *re;
 	struct symbol *importsym;
+	struct node *orphan;
 
 	fprintf(f, "/dts-v1/;\n");
 	if (dti->dtsflags & DTSF_ADDON)
@@ -410,4 +411,9 @@ void dt_to_source(FILE *f, struct dt_info *dti)
 	}
 
 	write_tree_source_node(f, dti->dt, 0);
+
+	for_each_orphan(dti->orphanlist, orphan) {
+		fprintf(f, "\n");
+		write_tree_source_node(f, orphan, 0);
+	}
 }
-- 
2.52.0

