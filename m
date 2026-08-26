Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F833BBFDD;
	Wed, 26 Aug 2026 08:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787733183; cv=none; b=Zx2vvxeI7aUOH9aSJkcMe6DJwCqV3DiuyL5P35x8k7OdyLO+UxpF4Tw3rW4Vm3S3edLzSjQZhK+SKlGbt49ytlnCFUfGXvUHWYjTnYMtdFe0XBAplva8wyIKPZ/odsgrUDFHU8tCOxxaBaEjDL7aE6ybJoyl4Kj38XeTpNIlyHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787733183; c=relaxed/simple;
	bh=P+chBaix+UggPJ8LbDsepISCksiwwTbW55SAZCgR8oU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rHlbSLoO69np4uMNrXzOyB91EfrhqbvIUfNXe6UakWSFyOR/Xc1p7RSFAKbE9EoJZykeaKuXzE4yj7WXLU5laC0rH0/hm8bCpZZQwxhAoS5S96FzV83ww6DWaSLrUIUZfmFFdb/99qj/cOaVkae16z5I25frlT6VAmNQBl5q3kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=byKANWwQ; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="byKANWwQ"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id AB7471A1848;
	Wed, 26 Aug 2026 08:33:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 77886604EC;
	Wed, 26 Aug 2026 08:33:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 06E0211C7AC7C;
	Wed, 26 Aug 2026 10:32:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787733179; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=mU6cOuGSCvhMuDVdjXkVf3OutlhHj+8iM1DPGXph9Lc=;
	b=byKANWwQfgQKvHLLTgf7iO6sG2Lq+eys3hpUS9xb172vDMXk9THOvEjQpFR48ShjReYT/M
	cjXQcdQnjgXy6DZesfsuPdnzajTdIft/EH/lKUdZ9DVLPwXw88PfHdbef6aJ/DohN0W0Mw
	giWaOvqQeOiW3w5PrbkQRwo4Z+u01dxY/uM2KcQdurW2FEZQNNyh5nqRFEKD379cXoD8lw
	QiGRiB3/dRxcV8fL/dbICRhffMBbTiine1yzpzS/Hr4TQpyjJNBv+iOigxDgu8Au010VWu
	bX+ur0FIPCTWTd08pp03+/au0rC/V+mibpm1DKr7VuZ4AIqVVCBGjM7/zPLYCw==
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
	Herve Codina <herve.codina@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v3 10/15] libfdt: Introduce fdt_ptr_offset_()
Date: Wed, 26 Aug 2026 10:31:41 +0200
Message-ID: <20260826083146.304291-11-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826083146.304291-1-herve.codina@bootlin.com>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

libfdt provides internal helpers to convert an offset to a pointer but
nothing to do the reverse operation.

Introduce the fdt_ptr_offset_() internal helper to convert a pointer to
an offset.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 libfdt/libfdt_internal.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/libfdt/libfdt_internal.h b/libfdt/libfdt_internal.h
index f2e30ce8..3c83d9a7 100644
--- a/libfdt/libfdt_internal.h
+++ b/libfdt/libfdt_internal.h
@@ -46,6 +46,11 @@ static inline void *fdt_offset_ptr_w_(void *fdt, int offset)
 	return (void *)(uintptr_t)fdt_offset_ptr_(fdt, offset);
 }
 
+static inline int fdt_ptr_offset_(const void *fdt, const void *ptr)
+{
+	return (const char *)ptr - (const char *)fdt_offset_ptr_(fdt, 0);
+}
+
 static inline const struct fdt_reserve_entry *fdt_mem_rsv_(const void *fdt, int n)
 {
 	const struct fdt_reserve_entry *rsv_table =
-- 
2.55.0

