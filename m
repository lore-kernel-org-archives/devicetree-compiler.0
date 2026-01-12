Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7A52E62C0;
	Mon, 12 Jan 2026 14:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227653; cv=none; b=PQepVdqa9b4b8w72umJj69vkrNM93BL/XAfsWES3OWyFnttMz0MaJ86U1mqN1w+tlCwwPMPkAPS6YCoE5XM0b51EGw4WhlhHP+kWZj70SBNPx8qapwxvlAj8bOpkQzKdyrjhSE7oVuiDKdcOs9sS2trcYVM2VHHmRdbeweh32yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227653; c=relaxed/simple;
	bh=Kjz3gjhhnUhEGWpZM8tXvNG5FsPtVoun+2NKgHFSZMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q0vHQH6I5uEJpqmsZxSeg5ZEvGZ7UBMwC9RX1399FyK8ScZLnr9FczT/7cMm3qSEeYdLTf34i434b7D4+xyA4oEZQb3+iGIh4yXTctdOD6PvxP4LYgLVuNdzAdkKmX95CfbGIgXKvGmYUSuEQnoXXGZSy2DhrBukNsXo74YAARQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=l0wbZbYf; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="l0wbZbYf"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id EAAA7C2086B;
	Mon, 12 Jan 2026 14:20:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6D91F606FA;
	Mon, 12 Jan 2026 14:20:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A5E1B103C8C61;
	Mon, 12 Jan 2026 15:20:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227648; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=YDM7nARSEOyxMicRBpgb4TUpIk9yqVSL2vsEwrm/mwU=;
	b=l0wbZbYfxtJ777ZbGpZg3Obid8ro7EG5Rcd5qaLTQxFEWOmQLE7/MTat2JkgCjzYShZbDp
	+l70dkvH/9aqOEeXk6J4GVpIhRVZOfbCKr3rB0iK93K8E9HWlzrgQgXUOwC4i7UKlhuIvJ
	IWuL4NQNHV9wVcM2IctqaMZIvSnDnZqzkbcrJmiZfXuW4rURbDIZb2g8RkxDSRFt7r1WM5
	iOYNCR0kpIPVEU6h2wp0neJfL3BSc1kpsNldh2ALd7T175ny/S0V8bQdNJtvBV1uGTqjwa
	g7kxCtX//H3aPWQNbT+naK7ISRCcBrmNRXVi4RawnfYkIySzHepxyM43lvzTyg==
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
Subject: [RFC PATCH 18/77] dtc-parser.y: Avoid an empty proplist
Date: Mon, 12 Jan 2026 15:19:08 +0100
Message-ID: <20260112142009.1006236-19-herve.codina@bootlin.com>
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

In the dts parser grammar, a nodedef is defined by
  '{' proplist subnodes '}' ';'
with both proplist and subnodes that can be empty lists.

Soon a new list will be added in the nodedef related to export symbol
list.

Having all those lists with support for empty lists will lead to some
Bison warnings:
  warning: 4 shift/reduce conflicts [-Wconflicts-sr]
  warning: 1 reduce/reduce conflict [-Wconflicts-rr]

The simpler way to remove those warning and thus have a robust parsing
is to avoid those empty lists.

Update the proplist definition and nodedef definition to avoid those
multiple empty lists. Instead of allowing a proplist to be an empty
list, force the list to be a non empty one and update the nodedef to
handle explicitly the absence of the proplist to support the case where
no properties are available, i.e. the case of a node composed only of
sub-nodes.

This doesn't change the functional behavior.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 dtc-parser.y | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index d8914d2..2e152b0 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -272,12 +272,16 @@ nodedef:
 		{
 			$$ = build_node($2, $3, &@$);
 		}
+	| '{' subnodes '}' ';'
+		{
+			$$ = build_node(NULL, $2, &@$);
+		}
 	;
 
 proplist:
-	  /* empty */
+	  propdef
 		{
-			$$ = NULL;
+			$$ = chain_property($1, NULL);
 		}
 	| proplist propdef
 		{
-- 
2.52.0

