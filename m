Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66ECB3E49D3;
	Wed, 26 Aug 2026 09:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787737930; cv=none; b=muJKhp+c+aotsdlqYPPnt7Hl4Iadirc5xKkf6wOGuW+j7QrI7HUWgMgkkWjpZ410HLEsMt0/OEpyplqmCgmKm+QNxoVtRezDCvz6UtYblPK0zITmP5tRvpcb980qRpEfwJlRJJHhLyfCNwcQMnGWUERCr1agpZMNuAhW48dCNM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787737930; c=relaxed/simple;
	bh=7gcOUZmUZJS2NLjclVPmerJZlhX2Lo8QV9jN+n9wx8E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=USgA+JBHlbobRs1oFm3lvkl05KJ996kzgK2M27XF6K9uuGAYtwcWlBVerNZJ88Z6i8VhWdTu+fMIeyqfB/ojFNrIjBTW6GuWAew3s4CbpIe05VHsmHiXwrPQPsATupmZOnrtSW5RF0WcB9ZeTUnRQ/BI1tYqmzIo1y9dMVC8Z5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=u1V114eV; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="u1V114eV"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4391F4E413BC;
	Wed, 26 Aug 2026 09:52:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 18ACB604EC;
	Wed, 26 Aug 2026 09:52:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BFD1F11C7AD66;
	Wed, 26 Aug 2026 11:52:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787737924; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=t+VqTYvZ2BOAv4Bsz9T43U13SrmgT19IW2wnO3wG0a4=;
	b=u1V114eV5aMyKJ/owt7NvLTN3B5d1sp7Vg3ANRUc9Wa2lah1S9mMDoHHh8rYLZ9fkcRJ8x
	Imc2DbeIKVwvbRD48oBjHa6HGd1VCdA/vmjs4914xf5j/povkI9h6w4hngxezx02tLkvaK
	92EFhgVnQK6kc5RX1GUI7ivnfIksjHD8Qs1H7vaA3ZAEu8uNmNx7FZFIMSOWXHNTQtt5gg
	oJVxVXsp2aQTFYeLPxAyQW0Jwidb4rRBwSEK7qEt1rvYwGNKQAeXvXzY6h+gPZ3UNurgTF
	bCiHpvfAQyj7cpk41/kt8JUNFSg4Vbif7NsxWQZYbWOElGnW/hNSBxcKVqoR5A==
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
Subject: [RFC PATCH v2 30/74] dtc: Add import symbols (/import/ keyword) in generated dts file
Date: Wed, 26 Aug 2026 11:48:59 +0200
Message-ID: <20260826094950.1088288-31-herve.codina@bootlin.com>
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

The import symbols (/import/ keyword) parsing from a dts file is
supported.

Add the support for this keyword in the dts file generation.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 treesource.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/treesource.c b/treesource.c
index a7228f60..d22f1d32 100644
--- a/treesource.c
+++ b/treesource.c
@@ -431,6 +431,7 @@ static void write_tree_source_node(FILE *f, struct node *tree, int level)
 void dt_to_source(FILE *f, struct dt_info *dti)
 {
 	struct reserve_info *re;
+	struct symbol *importsym;
 
 	fprintf(f, "/dts-v1/;\n");
 	/*
@@ -453,5 +454,14 @@ void dt_to_source(FILE *f, struct dt_info *dti)
 			(unsigned long long)re->size);
 	}
 
+	if (dti->importsymlist) {
+		for_each_symbol(dti->importsymlist, importsym) {
+			fprintf(f, "/import/ %s: \"%s\";\n",
+				importsym->name,
+				importsym->compatible);
+		}
+		fprintf(f, "\n");
+	}
+
 	write_tree_source_node(f, dti->dt, 0);
 }
-- 
2.55.0

