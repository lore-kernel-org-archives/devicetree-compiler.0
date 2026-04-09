Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573713C8733;
	Thu,  9 Apr 2026 11:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775735707; cv=none; b=T/L3UH9AkCeQA4nnfh8MVXQFticwaXPPmJhXCbwZKQR+pmkGy/uiIjgh71n5WgSgyKCOthkJpb1ziq/gl9slrV5sSRByombX4HXRl14FehsaQtARm07/THqTqmPWFOtydu8pMe6a6/W1bCEonS5UDi7HwRWmZURHRqnA77frQAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775735707; c=relaxed/simple;
	bh=Ag+hwuuKrqzhDk6bKvhYRze9FxR8VFJRq3NYpSQv4vA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FLapgWiuqlQ6AGqzCKnpjnSEhuBVeNU+kX+BS+slpJDE2sS8+bCP5gZtAKRBft3kYeVYNJoSA16k9LrLAT/Ap21wkdrt2WnscDWM0TDsC3WndaQZbwYYM/ZQbLMZlwA4pPsr2QyClbyiXteamwjcMH3E5/N6DekO7IJkxhhwKNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LmQlrgR8; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LmQlrgR8"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1D54A4E42985;
	Thu,  9 Apr 2026 11:55:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E0EAE5FDEB;
	Thu,  9 Apr 2026 11:55:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7CF07104500BF;
	Thu,  9 Apr 2026 13:55:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775735704; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=c81HbqAWb/HL00Wrcu0MQjDwfvjjhS+WoAvaoL1KECA=;
	b=LmQlrgR8XuTdK+/jnDKT5hBGgPp8RXUsDRMrgwgXPrtFsJgj2xhrxtuYIc+sJWmh7+cJ6T
	QrlvNs3jlDqUATWJ17gKnHYtagZz0kmsOeMmUaC7nWGu5Gz6mppf6TKUSbDvqeEpFKk59S
	wj6GzB6rkajOXZFSo2i1tfIXCe+rSYYuleOXRskyC60xPh/lzDqipYOGrThtokOkke1/fV
	2pQ7ojdyeYTln5Pv4i5GzQrA5XRXen9stUNrlcEyh5MwC8uC28JbLaIXbVtBzLu7Oyl9bD
	mYARcRRyhKtrdWfRzaT5qlx+0stlUz+F1/IFXVwmNFGycbmGfdjhEhnyaN1Tig==
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
Subject: [PATCH v2 08/10] libfdt: Introduce fdt_ptr_offset_
Date: Thu,  9 Apr 2026 13:54:24 +0200
Message-ID: <20260409115426.352214-9-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260409115426.352214-1-herve.codina@bootlin.com>
References: <20260409115426.352214-1-herve.codina@bootlin.com>
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
---
 libfdt/libfdt_internal.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/libfdt/libfdt_internal.h b/libfdt/libfdt_internal.h
index c1ae306..9fd0012 100644
--- a/libfdt/libfdt_internal.h
+++ b/libfdt/libfdt_internal.h
@@ -47,6 +47,11 @@ static inline void *fdt_offset_ptr_w_(void *fdt, int offset)
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
2.53.0

