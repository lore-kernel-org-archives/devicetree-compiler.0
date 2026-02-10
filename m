Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40EC638A705
	for <devicetree-compiler@vger.kernel.org>; Tue, 10 Feb 2026 17:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770744866; cv=none; b=ljYSSDZGYY2y2OFrHEKvjI597Wg1RIOovGKF9E3kMT019SWUnN6uzFZGQyOcsplDuUNLQzIMl/y3IPNTc/8FZ36XVov593w9vv6M1bkA/oYYFVIqixkOuTWPQmFg4U1HOd4b1q5sEVWhglAWW2m/Owa5h3ksXTK93u7puxFHSKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770744866; c=relaxed/simple;
	bh=WtKphMCsjPcCVX5VwtmFrAns3o9ylLtWGgEPh01Qm1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MWN842WEJ+mVHvr4VZxxo+GZ4+ek4LG93mBFdgqT5ASrYVHY9iEkUIghaLUJuEc2iGwF8uc4Icy5QmuzF+41fgFFzF66jEVgwEsY+G/1fWD5l/2oMhCosPtsY3azWrIDtJ3fmHmTnXtujrnZ90Zrhlb+YlNGleSFf6ouFRKBqzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ta2DXNjz; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ta2DXNjz"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2CFD8C8F452;
	Tue, 10 Feb 2026 17:34:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C0A8B606BD;
	Tue, 10 Feb 2026 17:34:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B445710B9221F;
	Tue, 10 Feb 2026 18:34:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770744862; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Vj+nbmbL/ubeh6lBT2UK7368Bw4bAaxwTg/HQfQrIks=;
	b=ta2DXNjztKdSya0GuB61Wd5PsVWIW7Dhi3eUXS0hnngmoC5WKlB2kxmF4aP8oHX+kZ/E95
	vsP9ZpW8Dxhg5hmaDLFoF9QUO5ZmwqwLnF8V7L/o6IXrTmR54YspwK1UyXaFTscMf2Epbs
	qvi/1Z6MnP+YXqFD106AwshVSfpkwQ0bBCncjB2KeWUMAYDhXthhMGkoydwuwj2yyNHERO
	RhnCQ6xus8GfsBUQV8yqL35wNTt7D7IPfq2VcmfHRZbp+RJyB8CKHColii108SJrIZeqTF
	D1WUH9F4E91a8oSfZMKbUPjeEjnVBJN2kt0S85apVPNFbFF8BO0WPNxAWV8Gfw==
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
Subject: [RFC PATCH 02/15] fdtdump: Remove dtb version check
Date: Tue, 10 Feb 2026 18:33:30 +0100
Message-ID: <20260210173349.636766-3-herve.codina@bootlin.com>
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

fdtdump checks the dtb version and simply failed if the dtb version is
newer than the last version supported by fdtdump.

This check is not needed and too restrictive. Indeed, fdtdump does
read-only operations on the dtb provided and should rely only the
last_comp_version header field to know whether or not it can read the
dtb.

The current check also avoid the use of fdtdump in tests checking for
the libfdt behavior when an new (future) dtb version is used.

Relax fdtdump checks removing the check of the dtb version header field.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 fdtdump.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fdtdump.c b/fdtdump.c
index 0260609..6c9ad90 100644
--- a/fdtdump.c
+++ b/fdtdump.c
@@ -169,7 +169,6 @@ static bool valid_header(char *p, size_t len)
 {
 	if (len < sizeof(struct fdt_header) ||
 	    fdt_magic(p) != FDT_MAGIC ||
-	    fdt_version(p) > MAX_VERSION ||
 	    fdt_last_comp_version(p) > MAX_VERSION ||
 	    fdt_totalsize(p) >= len ||
 	    fdt_off_dt_struct(p) >= len ||
-- 
2.52.0

