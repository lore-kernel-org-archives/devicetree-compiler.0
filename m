Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EAA53C8C77;
	Wed, 26 Aug 2026 09:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787737923; cv=none; b=hs4gVbHFRblHw8BWN15GN0e7tClj14XrN5834jk5TAFiAcMVjFtgQzY4V2kNB3d9aRu1vyZKYtNm32vXkZxetGZ8hUM2EDz/LXsDWjh87DaCVVLWSeAi+dDHSgaVSNjQM5P8ck8u6PrTabraoJelGmM4lP6EY0IYF5Hm0LHSPxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787737923; c=relaxed/simple;
	bh=YrRB78bDzAxToXsFsesV2URHsP4n3DYGrpsb260vml4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A0ci9SQ80jURA/b2RQpCRI/+kHL5ttm3YZ997dpTUduepgtI3PXsiyaOxzHkxw8+CwZFE5a39DgVOgLlhha6xgUkASUwvYTb5TTtMINX4uceMOaxM1DZ4ydRCXnbvjDDOBfrKAWQjOx+a4IRJN3ISfVKeRqPNBh6b2MH3VCyW4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=luGhI7wX; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="luGhI7wX"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7E6DA4E413BF;
	Wed, 26 Aug 2026 09:51:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4BB39604EC;
	Wed, 26 Aug 2026 09:51:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CC9E811C7AD64;
	Wed, 26 Aug 2026 11:51:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787737918; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=EVUIWjyZYaqFgmFKnR8vrxTiryS29hhPQyy6WYDQ8t8=;
	b=luGhI7wXU4MKqinBsWsd+kKq3XreXoVsTnov3sCAjqo8U/QxQ17RJ6PjopnUcO95jGrRpw
	CzI5/31RYc08neOV4Qyt25v8nKxk09TSSu8jI1eU7WiKsKhk5AKvvCWO0H9Pi5RDsRsgS4
	DJm2IbDv2wGHIr7fE7jwO2rSlrtuO53jGmm3GUdid1i4S3sj7SgZfGab2qSXfQ9qDrNsCK
	TmqQerD8A6jMMyHI5/A7llznzgW4bIUr6eFQ+jQ5RtA0qD4F1DUgfTHVeUYY77YXsFi3Ua
	vfSHIYw6HaAfkFPN1LQew9Dx3SPzLohsiN6v0NNZhAPLMz/vaPUMUQFS+XGQHA==
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
Subject: [RFC PATCH v2 27/74] dtc: Introduce import symbols
Date: Wed, 26 Aug 2026 11:48:56 +0200
Message-ID: <20260826094950.1088288-28-herve.codina@bootlin.com>
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

Import symbols allow to define a list of symbols imported and used by an
addon.

Those symbols have to be resolved when the addon is applied on a base
device-tree and will involved exported symbols provided at the node the
addon is applied to.

Import symbols are similar in term of feature to __fixups__ available
in device-tree overlays.

The goal is to identify symbols which are used by an addon but not
defined by the addon itself. Those specific symbols are the imported
symbols.

Introduce the import symbols list related to an addon. No functional
change yet but preparation for the future support for import symbol
parsing.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 dtc-parser.y | 3 ++-
 dtc.h        | 4 +++-
 flattree.c   | 2 +-
 fstree.c     | 2 +-
 livetree.c   | 4 +++-
 5 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index a0d0aef9..4e46e9d1 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -113,7 +113,8 @@ sourcefile:
 	  headers memreserves devicetree
 		{
 			parser_output = build_dt_info($1, $2, $3,
-			                              guess_boot_cpuid($3));
+			                              guess_boot_cpuid($3),
+						      NULL);
 		}
 	;
 
diff --git a/dtc.h b/dtc.h
index 8a20d6da..63fe4dc1 100644
--- a/dtc.h
+++ b/dtc.h
@@ -350,6 +350,7 @@ struct dt_info {
 	struct reserve_info *reservelist;
 	uint32_t boot_cpuid_phys;
 	struct node *dt;		/* the device tree */
+	struct symbol *importsymlist;	/* Import symbol list */
 	const char *outname;		/* filename being written to, "-" for stdout */
 };
 
@@ -360,7 +361,8 @@ struct dt_info {
 
 struct dt_info *build_dt_info(unsigned int dtsflags,
 			      struct reserve_info *reservelist,
-			      struct node *tree, uint32_t boot_cpuid_phys);
+			      struct node *tree, uint32_t boot_cpuid_phys,
+			      struct symbol *importsymlist);
 void sort_tree(struct dt_info *dti);
 void generate_labels_from_tree(struct dt_info *dti, const char *name);
 void generate_label_tree(struct dt_info *dti, const char *name, bool allocph);
diff --git a/flattree.c b/flattree.c
index 4e4727e9..45dc4ed4 100644
--- a/flattree.c
+++ b/flattree.c
@@ -1241,5 +1241,5 @@ struct dt_info *dt_from_blob(const char *fname)
 	if (get_subnode(tree, "__fixups__") || get_subnode(tree, "__local_fixups__"))
 		dtsflags |= DTSF_PLUGIN;
 
-	return build_dt_info(dtsflags, reservelist, tree, boot_cpuid_phys);
+	return build_dt_info(dtsflags, reservelist, tree, boot_cpuid_phys, NULL);
 }
diff --git a/fstree.c b/fstree.c
index 445ae53a..a6aaf1e8 100644
--- a/fstree.c
+++ b/fstree.c
@@ -72,5 +72,5 @@ struct dt_info *dt_from_fs(const char *dirname)
 	tree = read_fstree(dirname);
 	tree = name_node(tree, "");
 
-	return build_dt_info(DTSF_V1, NULL, tree, guess_boot_cpuid(tree));
+	return build_dt_info(DTSF_V1, NULL, tree, guess_boot_cpuid(tree), NULL);
 }
diff --git a/livetree.c b/livetree.c
index fe0f300b..a6c40642 100644
--- a/livetree.c
+++ b/livetree.c
@@ -635,7 +635,8 @@ static void complete_references(struct dt_info *dti)
 
 struct dt_info *build_dt_info(unsigned int dtsflags,
 			      struct reserve_info *reservelist,
-			      struct node *tree, uint32_t boot_cpuid_phys)
+			      struct node *tree, uint32_t boot_cpuid_phys,
+			      struct symbol *importsymlist)
 {
 	struct dt_info *dti;
 
@@ -644,6 +645,7 @@ struct dt_info *build_dt_info(unsigned int dtsflags,
 	dti->reservelist = reservelist;
 	dti->dt = tree;
 	dti->boot_cpuid_phys = boot_cpuid_phys;
+	dti->importsymlist = importsymlist;
 
 	fill_fullpaths(dti->dt, "");
 
-- 
2.55.0

