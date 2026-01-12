Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1F82EB859;
	Mon, 12 Jan 2026 14:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227728; cv=none; b=HkBQDeEZH3VjF5h+iEF7ilY/6CpZAaJmfWNXa0ilM86tU4CgfMub3ufE5A85c1R4AV5ShtCiy9o2SBIQczzECMdMmLGxuALRGgu4LNAUF24GI92ZFCSj3u4tg6o8gqY2kOk35LAyBwniU9aiOmmL79nbU3nxw63r+Tkf+5JZFf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227728; c=relaxed/simple;
	bh=EtANzcsF/O/2N5SLag/+pz1k0e53qUoqWM+zsTEUjow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qYVavabPKAnRPs9E0CkepYwKXUOcGuMOcYU2FLiCgnKe2pqKUubv40Rt63gqHHvngUrvJ+2locJBLYWntPokZh3rWG1EtF8Q5+4edHp46cUfGVjEum9l71IoItbIN/luTYVudTmTiUW1YckIWL/cnB8+MkFXPl5Xu1AF1QREhmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=b8PgCqiU; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="b8PgCqiU"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3291CC20868;
	Mon, 12 Jan 2026 14:21:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A9322606FA;
	Mon, 12 Jan 2026 14:22:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 84BFF103C8CD8;
	Mon, 12 Jan 2026 15:22:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227724; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=s4b4iORTYC9hNJsnJAA2UlqWslsOWy9woQFtPV4DXtQ=;
	b=b8PgCqiUSbJRdvrnhV5mLwXdSlnlOmIECE/PC/8W3D9cPuR2Fy3b52oi8VUesswcubVheX
	RZKleOjfjI0M2jK0yW3sUBAtpSfJNdAqgdKKBjSLwRBiISraqX27xHtSI8GC2honylOFBL
	jk1ZM2HRIEAh6WNxcSdbCiGzf9rWSyjdmoKsJvEFbWEzeR2cjhE0o30YOTDz4/xc/dgI2B
	YDoVNcSTO3rDtM7Ouj+uLeh4LXUiO2nfF8uGFIczXjXG7yO3n31av2ClaPatQSnTEw/WoT
	oCZ4nvrpSpDodPYBEpeJdp1gY/zlmcijnY5nKbWEjhD2FZBP7ZFgRhtPBm5P1g==
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
Subject: [RFC PATCH 68/77] libfdt: Introduce fdt_getprop_by_offset_w()
Date: Mon, 12 Jan 2026 15:19:58 +0100
Message-ID: <20260112142009.1006236-69-herve.codina@bootlin.com>
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

The future support for applying a addon on a base device-tree needs to
modify properties retrieved by their offset.

fdt_getprop_by_offset() already exists to get a preperty by its offset
but the property returned is read-only. A writable returned property is
needed.

Fill the lack and introduce fdt_getprop_by_offset_w(), the write enabled
variant of fdt_getprop_by_offset().

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 libfdt/libfdt.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index 37459a6..0c654b1 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -858,6 +858,12 @@ static inline struct fdt_property *fdt_get_property_w(void *fdt, int nodeoffset,
 #ifndef SWIG /* This function is not useful in Python */
 const void *fdt_getprop_by_offset(const void *fdt, int offset,
 				  const char **namep, int *lenp);
+static inline void *fdt_getprop_by_offset_w(const void *fdt, int offset,
+					    const char **namep, int *lenp)
+{
+	return (void *)(uintptr_t)fdt_getprop_by_offset(fdt, offset, namep,
+							lenp);
+}
 #endif
 
 /**
-- 
2.52.0

