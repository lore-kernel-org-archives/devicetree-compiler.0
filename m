Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692209;
	b=qsuH8t/FNxzeNcns27q04/OwdQ0lYW/p3l4y4MiCfc/wXU0zAl09VCFYyUSyXp0vXTXK
	 6jIEmJOKP6/0j9rceKI8yCHx/KFXj1StBznjnv6vb5vWk4eh0V/ijQ1+0wO9sis3IlPgy
	 772QirHmpbKFSv2F8/xNnb0I7D671h2XqK+L90tnJNnTm0TRKQ/FZVeWNcRkO5Bd57sgH
	 mNvRSL1Nu0fhvMJgM2waVQ0cQrAahMRGhDcvkEw12lJ0LMyJI6k+/8DBWvZ44Zp18WtQ0
	 y+QTTz7W5MYjgaofcGloHFpLq4ePQdCvtAqtEFodzSQQY5c8Cso4/vLBUxVKMS4FTSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692209;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=7vXlSRXuLLmD/e6VWvr8dD+6KNmhy5l5OvwMf0QWBaA=;
	b=4nxnVvmvMcxQ3T/Nh3fPr9H1N5YcOTX0DuBxFs8tukFesweTWqRKcoLyOB4GfU1+w9ad
	 WSz1Y85WhzMKkadwLAzLOZq/VBMJxi9pwU73sEG1Ltln76z0mVntYDyIuxXI7tDudNLTM
	 uCFJMCGp+JOfCUs8D+QGUgMwYbDcUeyFOo6/qaHWg9wZWN3OkUSoRBKEsq+BYbT24Xk2o
	 rzg6eqfH9OUGjxIJk+MgXf5ky80ky79tAAkEbXB/AzapQwB0MCgaFnp619C9QACcccaYZ
	 Vtz9LRDs6PVNNB+N2cX/O7DnCD/OprjsfU5w+TLPepkvesUjapwvIJev9zvnV6PBfqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=pWvlthHI;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A717160A260E;
	Thu, 26 Nov 2026 11:23:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A717160A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=pWvlthHI
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 550D61A1807;
	Thu, 26 Nov 2026 11:23:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 218E660237;
	Thu, 26 Nov 2026 11:23:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7E04B11E6B361;
	Thu, 26 Nov 2026 12:23:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795692205; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=7vXlSRXuLLmD/e6VWvr8dD+6KNmhy5l5OvwMf0QWBaA=;
	b=pWvlthHIjB2HS9ck1O98NTeJGisl7Hdxjnr0itRStgV0sngcKMyTEFtYQy+3M3rebr1DNu
	pldS1qVHYnn0a84rAm6M71dNt5QjBaxV7QIojS1YbBzZFXO3eCXVNo+UhNq3lH+J5PTTlP
	j63/uOODSCWofxoblLbrn/YLxztlvvn0JKimnFUPVujsZkGOgZi3x/GVBybnBnGM8kzynn
	2ueMZUxEkbfynuA+7w+lXft+0Pz6xKAmVkEey/HAMQKyuTsUxnXCK7irhgrZO0db+Fk/ot
	R5+oEg5kuwpZMP74eOrjswdrg1UgtDKTMWmO65+oz4DGsH115KRA6Z8DcoPdOw==
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
Subject: [PATCH v4 04/22] tests/nopulate: Add an FDT_NOP before the root node
Date: Thu, 26 Nov 2026 12:22:21 +0100
Message-ID: <20261126112239.636284-5-herve.codina@bootlin.com>
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

An FDT_NOP tag can be present at offset 0 and so before the root node.
This is a legitimate case.

The nopulate tool adds an FDT_NOP tag after each tag encountered but it
doesn't add an FDT_NOP tag at offset 0.

Improve nopulate to fix this gap and add an FDT_NOP tag at offset 0.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
---
 tests/nopulate.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/nopulate.c b/tests/nopulate.c
index 32624a7b..b3a7184a 100644
--- a/tests/nopulate.c
+++ b/tests/nopulate.c
@@ -23,7 +23,10 @@ static int nopulate_struct(char *buf, const char *fdt)
 	uint32_t tag;
 	char *p;
 
+	/* Add a FDT_NOP before the root node (first node) */
 	p = buf;
+	*((fdt32_t *)p) = cpu_to_fdt32(FDT_NOP);
+	p += FDT_TAGSIZE;
 
 	do {
 		offset = nextoffset;
-- 
2.56.1

