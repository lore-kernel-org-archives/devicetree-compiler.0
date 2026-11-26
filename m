Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692280;
	b=d6rTcDGQ5YW3fAZsG/kTxYQwZjWO06PXIzI+befeGw7XGiVIqAr6bbBAYY39f1m0Qd9l
	 fjw+2OU3aetj89P5KIoJBkp7xL9UUOAzxyLW4RBjIrEUd75bpeFOWW8pX5fYOiR3kXtdB
	 uLkcaMUD8PYGn55bzOzmjLn1ubfJhOMeZnkZHDPox7g5CxksJbA00OLjkR021MPQvkB6D
	 RXgPNOQPXby1nuywYEpemNJhZmQvxkBdhxW50KhAY9CpavGBzGgmgz5m7qqJb0Dr+LPza
	 R/LBljSSZC8BpvZbuAFu4weiDn6AwkutSrlqVUCNFO3KYBaoZawc9PtQ0okFRns3sJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692280;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=RtGBYdm/FUjYm4MBKMDUIIQ/5FtiMze/DG46bNNvRwA=;
	b=j5tTXCiUo+tPRmKJKZj0ojqaF/JFrR+l4ct/yrsbYvi4wU2zE8EP8SSkQCNoes3tBSwU
	 1CNr2/EfDu21ZC/Q+QNIcb7YnXqCXWb++fstaLU80w6mEmo/sNTabepiXI6mt1odXhu0C
	 2/8QPL0PQHJvaq4nJFicnAXNaDw08Y4NHI/T3keGvTX2ZC9QDmLqsh3YHo3+KN56KYkJF
	 dcj4i6P5GwVeka0d9HNAJcz7xYIn1UPPZdXaReXMNuUDvqQCnXOqaS9pQsmMup2kugaOO
	 YLbok/WdCYdvkrLcsdaYWyIPvgs4Xi3mmBrwuSr33oHzuhBS4urqsSSstZYtXG4pUMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="KLZT/4/H";
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F054606A6A4;
	Thu, 26 Nov 2026 11:24:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F054606A6A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=KLZT/4/H
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 45DE14E4179C;
	Thu, 26 Nov 2026 11:24:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 14DF560237;
	Thu, 26 Nov 2026 11:24:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8333711E6B371;
	Thu, 26 Nov 2026 12:24:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795692276; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=RtGBYdm/FUjYm4MBKMDUIIQ/5FtiMze/DG46bNNvRwA=;
	b=KLZT/4/HFIBLzrjv6M1Zx3INZt6xexXndLt3GviwSuRe2EijQLbuZPhVgGN3gHxL43Qd0o
	ObTCQfa30a1r0Il6c8aOWvdWIcSp9EFkNaSIH+A7pusxTpFqiexMClS6gEInlaGpFfCMK8
	7ms4UYMk1gYRRc7fJLx84OBqQ8KYJdp70MZKed+w5dDbVXN8OViJYVFQcD9MsyphKN5n3s
	O3fdOopNJfE5QXAZcKk0UpWsAODgLIzl38aGLPFXlP9nnL60uSFq9QpOPOUmPzbJS8IlfL
	Zj9B4IjMNrAO2xOLqc1FNsAcL6AOU3s2eeIN1T2b8z7EKiaRoeHYS1WGn0ndvA==
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Frank Li <Frank.Li@nxp.com>,
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
Subject: [PATCH v4 18/22] libfdt: Introduce fdt_ptr_offset_()
Date: Thu, 26 Nov 2026 12:22:35 +0100
Message-ID: <20261126112239.636284-19-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126112239.636284-1-herve.codina@bootlin.com>
References: <20261126112239.636284-1-herve.codina@bootlin.com>
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

libfdt provides internal helpers to convert an offset to a pointer but
nothing to perform the reverse operation.

Introduce the fdt_ptr_offset_() internal helper to convert a pointer to
an offset.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 libfdt/libfdt_internal.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/libfdt/libfdt_internal.h b/libfdt/libfdt_internal.h
index 8df9ffba..83e296b1 100644
--- a/libfdt/libfdt_internal.h
+++ b/libfdt/libfdt_internal.h
@@ -43,6 +43,11 @@ static inline void *fdt_offset_ptr_w_(void *fdt, int offset)
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
2.56.1

