Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E3E3A6403;
	Tue, 10 Feb 2026 17:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770744884; cv=none; b=DI2v6nb1G/aIOkV7Bhqp4x3dqDWatBWRfgOBIFZ8AvzsVo7nImp3PMwW1g+xDDaliI3UfwYclV1l5O+jOPC6ZmPyLseCbJyN8jGFsUXx3VCtNl5dBCP9rULArI8C1Dw1WHf3/EWwFQk9OKfO84JE5zkM4Iv4CHvK+vP9vf9MmeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770744884; c=relaxed/simple;
	bh=HQ4pWzYerX30F4hSO8byThnhG2+VNt8BytSWSpIE4eQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cl6zeTuIuS06Z2P5X8U5mMymcRX6KZC4H4TUhBCB8AYjRhJ/+iPXNx0wjxkiez3U0oFwPdDeXu+guMbSjnnWubB0Iwbb+ALnCJvQAUucyoXpXx+iPONqjBbhoAZKlAmsT2rLa0atMr1z+XqX2qYOM9b51Ai98Q4WcD61cw+0X0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=sNCt7FYF; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="sNCt7FYF"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8AC851A0D81;
	Tue, 10 Feb 2026 17:34:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5FE4C606BD;
	Tue, 10 Feb 2026 17:34:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3620410B9221F;
	Tue, 10 Feb 2026 18:34:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770744879; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=DSVj63KfoDkgV6+eP5+RXnlkCT5AQSLoR9qU3u9WU6U=;
	b=sNCt7FYFHAWlf40+DTFC2iwkyQlwkKO2wxHX3hNsYhc1Gtmokza/UWXLftKjlcfxi2QB0c
	Zt7rGKrlzDEhYq8Kk4Dm4Xy+X/XvN1xNSXiBhEo6LaJyiDr9Tb594B3ASRaMi+5V5QTZ9r
	X6qW4YvE5nvOI6YKkJK/U0RA1xWgUrgrhmPAkOcF3iqh2m6ZGPwBdHuOZdbEGVp+YQk/XO
	CY0rGlDPyXN0tZgYCIhJ23iBAQvZNMd71wfr5Iwsrvnr6N67ygk1dVH9WZ+jXC2GTWs9Ze
	zb5UCv43mGK4OYKJnY6oR09L0Uwpbr36ppk8wF/k+R+ysqLcwuo3/Nqg+M1EIw==
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
Subject: [RFC PATCH 13/15] libfdt: Introduce fdt_ptr_offset_
Date: Tue, 10 Feb 2026 18:33:41 +0100
Message-ID: <20260210173349.636766-14-herve.codina@bootlin.com>
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

libfdt provides internal used helpers to convert an offset to a pointer
but nothing to do the reverse operation.

Fill this lack and introduce the fdt_ptr_offset_() internal helper to
convert a pointer to an offset.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
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
2.52.0

