Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB11F1E832A;
	Tue, 10 Feb 2026 17:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770744865; cv=none; b=AZpmexG2gqendKXm3MDiuGkTIdHNLZUPHZQyhkCewsTJAKcmxRPpX5bqWwl0HbhPO3KZDkBOQeg6oa6J1iJQOUBbOFLi5q0LJP3UoepNtccxaZHiR/EpHMqG2ys5GUdLgTio1zZbVJEPFkWV5qE45ArDu+NmgnAmAPjFPphBMzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770744865; c=relaxed/simple;
	bh=/CPOb5wezrA1J+WyG49Si3hqreflaqzMwMHgrNQDD/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EicdJL4Arl+DoJ9z/2in0REXLc8R8pufPuGdlTu3wJQbQIm5w3iyAAjRfIHYYTiZ9pLK/wAtqqGLGAjydzPt8zV6Ha6bJg2Y/LcOwMoM7NPoWTnVQpJGKjR5gl24fKFgGPY4ad3oRE58bIEdgkUm+pQyERqbzA5zzfHRMVLEeuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Ym8NiQ3P; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Ym8NiQ3P"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7F7984E40BFD;
	Tue, 10 Feb 2026 17:34:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 54222606BD;
	Tue, 10 Feb 2026 17:34:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5819B10B91B35;
	Tue, 10 Feb 2026 18:34:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770744861; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=7+ALKX18P777BGJJpM5hpvhIjeNnWAA1h7zd2J24J8c=;
	b=Ym8NiQ3PxoXUjn2OhBvPJba/5od0kUFXl69/owDv0oszIHwF25NaodfWU8QYfHGwaGW5C1
	DZLj4F+FhAm10SHVNh7snvkD9dSsOC8AzIPmY81oMoYVt42dKkoKG2YAZAoJsqNCL2Wm7F
	Ta1libKI15YFqdHIdMTIPmyJT1+P7Mrv0mNrMMVCWuM9X91PlDTCj0/qY1tz2gcEIujM0R
	kMgYc+vGA7RbtHlX0Q/lROqc0gTAM99HQV1CzWLnbH+RQ54gcmyOMEyI0GJ9+Ce9Iukb3u
	Kp7pfcD0OHCjcqdtJO1XJMMq3S2z9g/KDsw540cgqJT0mVoqQs3kgJYCQiR7zg==
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
Subject: [RFC PATCH 01/15] dtc: Use a consistent type for basenamelen
Date: Tue, 10 Feb 2026 18:33:29 +0100
Message-ID: <20260210173349.636766-2-herve.codina@bootlin.com>
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

The basenamelen member in the node structure is set in all cases to
a positive value, the length of the basename string. Also it is used as
parameters on function expecting a size_t type.

Further more an implicit cast of strspn() returned value from size_t to
int is needed in checks.c to avoid a signed/unsigned compilation warning
when this value is checked.

This member has no reason to be a signed integer and its obvious type is
size_t.

Be consistent and fix its type.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 checks.c | 2 +-
 dtc.h    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/checks.c b/checks.c
index 45d0213..946c142 100644
--- a/checks.c
+++ b/checks.c
@@ -324,7 +324,7 @@ ERROR(node_name_chars, check_node_name_chars, NODECHARS);
 static void check_node_name_chars_strict(struct check *c, struct dt_info *dti,
 					 struct node *node)
 {
-	int n = strspn(node->name, c->data);
+	size_t n = strspn(node->name, c->data);
 
 	if (n < node->basenamelen)
 		FAIL(c, dti, node, "Character '%c' not recommended in node name",
diff --git a/dtc.h b/dtc.h
index 7231200..473552e 100644
--- a/dtc.h
+++ b/dtc.h
@@ -227,7 +227,7 @@ struct node {
 	struct node *next_sibling;
 
 	char *fullpath;
-	int basenamelen;
+	size_t basenamelen;
 
 	cell_t phandle;
 	int addr_cells, size_cells;
-- 
2.52.0

