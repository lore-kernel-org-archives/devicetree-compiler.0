Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA42E3128A3;
	Tue, 10 Feb 2026 17:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770744869; cv=none; b=kkPqwY+2q3j+gJ/7gR1kfWGk4Auoq4z8GFrtp5OHqH20Rxl6PcpiqH00o0E6nJJTcxB8C5FXbZUkZ6DGUSm2lW2ltffI3ARjS/CY6uc/NyBmE/1PDQx+TgEb7yrnelOQ3CyNyjcfHtkvJ8y7zY0UB/bsjJsZKSxwXIYJAGUqoxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770744869; c=relaxed/simple;
	bh=zYENmNeoK50FAEN/MLEGVot7VFgpGQ/IT83bdETLvKc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eYEFuneXczWZgTNNMNOZ3R/pVBF6n75f+P/YLxsCDMdb+IfbR1HixycTqb+KbEdtswhUrJa5pzj1KYtEt/WSDzLpcDTsW9fAQ7DEO+IxpyLKITgxh56eyT3pfG9gE5zljz7UKmsECOwd8GCryF637wIj7K0/kdgmEhEpCGkrDh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ArA5Y/d5; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ArA5Y/d5"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D0C22C8F456;
	Tue, 10 Feb 2026 17:34:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 71698606BD;
	Tue, 10 Feb 2026 17:34:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 898F010B92227;
	Tue, 10 Feb 2026 18:34:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770744865; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=wExgBnhPT8Yp1uOS4Aujf9960S3oyDSX7kIazJEW+VM=;
	b=ArA5Y/d5CuD9se5qO4fTdM0mGZhUxHPaWjS2z3ptBTIm7T9lqQY179GQqXAmF0YBZuUgfM
	U0UC/NQlheM8rDEIYSg810KALGVUXOc2RvVSKoL0X42fxSQd5SLMm5drdcLXjCVJb1orVL
	XfxMwb9rh+XvO1P0cnK7GKr3JpK9Ot3TVlY+G3vQUkx5LUN1yvLKbUyMK7SsG7Vi5haFfm
	vbY3kXbwU2JxEdGfcvRMQLhPyNNVWhuqGZXERSLJ9ouuIpLjjRPbMaH6h7CFBPY3zc3xdH
	ckksJxhzf4oYK7pVkRp/nfguPAjh2ihPYXAJwTwc7sDxl9hbaSsPRzvjKHDk4w==
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
Subject: [RFC PATCH 04/15] libfdt: fdt_rw: Introduce fdt_downgrade_version()
Date: Tue, 10 Feb 2026 18:33:32 +0100
Message-ID: <20260210173349.636766-5-herve.codina@bootlin.com>
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

Current code perform a version downgrade at one place only, the end of
fdt_rw_probe_().

In order to offer a finer grain and choose to downgrade or not depending
on the exact writes done, introduce fdt_downgrade_version() to perform
the downgrade operation.

The modification doesn't introduce any functional changes.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 libfdt/fdt_rw.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
index 7475caf..90ea14e 100644
--- a/libfdt/fdt_rw.c
+++ b/libfdt/fdt_rw.c
@@ -22,6 +22,12 @@ static int fdt_blocks_misordered_(const void *fdt,
 		    (fdt_off_dt_strings(fdt) + fdt_size_dt_strings(fdt)));
 }
 
+static void fdt_downgrade_version(void *fdt)
+{
+	if (!can_assume(LATEST) && fdt_version(fdt) > FDT_LAST_SUPPORTED_VERSION)
+		fdt_set_version(fdt, FDT_LAST_SUPPORTED_VERSION);
+}
+
 static int fdt_rw_probe_(void *fdt)
 {
 	if (can_assume(VALID_DTB))
@@ -33,9 +39,8 @@ static int fdt_rw_probe_(void *fdt)
 	if (fdt_blocks_misordered_(fdt, sizeof(struct fdt_reserve_entry),
 				   fdt_size_dt_struct(fdt)))
 		return -FDT_ERR_BADLAYOUT;
-	if (!can_assume(LATEST) && fdt_version(fdt) > 17)
-		fdt_set_version(fdt, 17);
 
+	fdt_downgrade_version(fdt);
 	return 0;
 }
 
-- 
2.52.0

