Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537C22DAFAF;
	Mon, 12 Jan 2026 14:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227681; cv=none; b=NAHm7H6MAozDinHB+pt1LVlx85iuBKaD2DinSULz9GGyWpSmETlDFmS4J0W4k4/hMSx+Nj8AGimdCrVV9vmtRzbyN36pYoyH24hVF088zYBD2YJQMQdQ6DamgWUmqngfUM6Cqzexj3LYCw5NuWs+Qov61eZOuQ3rQ4/3V4iZo2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227681; c=relaxed/simple;
	bh=mxWyWe+6tgliFAK69mK8yOaUcXsCwF4dxGaUJaHzMos=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U0FGGnagQbmXbM0S+PyqGBAHQrFsDNwg8EnVXNFT+hffL9nGekB+WAAOBYRyNGnorT4i9PyDhYvQ3O4v6oOds85giv9bRGo3uyFgCa383n/53toagSNx8NVwynWjBWqLhewiRyTy95xFMrKsokUasX1RiWwUQM2LgvpfEUT/0hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=wx3Zg2C4; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="wx3Zg2C4"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id F26171A280E;
	Mon, 12 Jan 2026 14:21:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C17EC606FA;
	Mon, 12 Jan 2026 14:21:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DFDD6103C8C61;
	Mon, 12 Jan 2026 15:21:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227671; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=27qw+iXgw5tUODAIs2DRLVPxR66zdH5GPz2Pg0sn2oM=;
	b=wx3Zg2C4KiweI+Knojw+OGPZjGWF9POGhOctyFnzT+3QY8ve4I2MFuOkJcumn94NyXNVqB
	lftZKZeVEkzrdas/nxs6x3gZ3XDarFBYfYQU8qZyjrCK8wq5B7HyEqSIrZvV4QGxsLbu3x
	XcUOlHaiJzgtmjqfuc5ahfv7MFoMMRRfK66F1FnYIyK9SSK0MgAVsY/LjQBH2DwvmQkX2h
	L8om/pNpBLHX4C3qq2k85Z57C1pX70sqSaSOD7VZvifqX32DGnKGhlz9bSxgLjmRuSo4iq
	xcp1+tPlCSzjFKF1K0LHwe6jbnjsK/Rt2L8NLD7PND96fyX3KNCrmjw9fiY5pQ==
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
Subject: [RFC PATCH 32/77] dtc-parser: Introduce last_header_flags
Date: Mon, 12 Jan 2026 15:19:22 +0100
Message-ID: <20260112142009.1006236-33-herve.codina@bootlin.com>
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

The parser needs to get header flags value in different places.

It relies on the fact that the rule used to parse the dts file is always
  headers memreserves devicetree

With that only rule to parse the file, it uses '$<flags>-1' construct to
get the flags value.

With the future introduction of import symbols parsing, this rule will
change and the parser couldn't rely anymore on '$<flags>-1' to get flags
value. Indeed, import symbols parsing will add a new optional symbol in
this rule leading to two possible rules (with and without the new
symbol) to parse the source file.

Introduce the last_header_flags variable to explicitly keep track of
flags while also being agnostic of the rule structure and use this new
variable instead of '$<flags>-1'.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 dtc-parser.y | 28 +++++++++-------------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index 4e46e9d..48c40e8 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -24,6 +24,8 @@ extern void yyerror(char const *s);
 extern struct dt_info *parser_output;
 extern bool treesource_error;
 
+unsigned int last_header_flags;
+
 static bool is_ref_relative(const char *ref)
 {
 	return ref[0] != '/' && strchr(&ref[1], '/');
@@ -122,14 +124,17 @@ header:
 	  DT_V1 ';'
 		{
 			$$ = DTSF_V1;
+			last_header_flags = $$;
 		}
 	| DT_V1 ';' DT_PLUGIN ';'
 		{
 			$$ = DTSF_V1 | DTSF_PLUGIN;
+			last_header_flags = $$;
 		}
 	| DT_V1 ';' DT_ADDON ';'
 		{
 			$$ = DTSF_V1 | DTSF_ADDON;
+			last_header_flags = $$;
 		}
 	;
 
@@ -179,12 +184,7 @@ devicetree:
 		}
 	| dt_ref nodedef
 		{
-			/*
-			 * We rely on the rule being always:
-			 *   versioninfo plugindecl memreserves devicetree
-			 * so $-1 is what we want (plugindecl)
-			 */
-			if (!($<flags>-1 & DTSF_PLUGIN))
+			if (!(last_header_flags & DTSF_PLUGIN))
 				ERROR(&@2, "Label or path %s not found", $1);
 			else if (is_ref_relative($1))
 				ERROR(&@2, "Label-relative reference %s not supported in plugin", $1);
@@ -197,7 +197,7 @@ devicetree:
 		{
 			struct node *target = get_node_by_ref($1, $3);
 
-			if (($<flags>-1 & DTSF_PLUGIN) && is_ref_relative($3))
+			if ((last_header_flags & DTSF_PLUGIN) && is_ref_relative($3))
 				ERROR(&@2, "Label-relative reference %s not supported in plugin", $3);
 
 			if (target) {
@@ -209,12 +209,7 @@ devicetree:
 		}
 	| devicetree DT_PATH_REF nodedef
 		{
-			/*
-			 * We rely on the rule being always:
-			 *   versioninfo plugindecl memreserves devicetree
-			 * so $-1 is what we want (plugindecl)
-			 */
-			if ($<flags>-1 & DTSF_PLUGIN) {
+			if (last_header_flags & DTSF_PLUGIN) {
 				if (is_ref_relative($2))
 					ERROR(&@2, "Label-relative reference %s not supported in plugin", $2);
 				add_orphan_node($1, $3, $2);
@@ -235,12 +230,7 @@ devicetree:
 			if (target) {
 				merge_nodes(target, $3);
 			} else {
-				/*
-				 * We rely on the rule being always:
-				 *   versioninfo plugindecl memreserves devicetree
-				 * so $-1 is what we want (plugindecl)
-				 */
-				if ($<flags>-1 & DTSF_PLUGIN)
+				if (last_header_flags & DTSF_PLUGIN)
 					add_orphan_node($1, $3, $2);
 				else
 					ERROR(&@2, "Label or path %s not found", $2);
-- 
2.52.0

