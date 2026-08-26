Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A1D3B8921;
	Wed, 26 Aug 2026 08:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787733172; cv=none; b=jsV7/TLwhKkkzfSe+ZCfShs+34ouDIPVpUBMZATTDNgsaAl9SzkAqYqYSpcan+pbI39jFiUIFjrOIEYFQOzZgdsxTzQltEnq+y2DW9QLtcPGVUFKf+5d+kuNY8tpdNjrdrB+AgBcbCvpnldp6MKGfqa2OeAWZ1LnUXkqcgsgSoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787733172; c=relaxed/simple;
	bh=aSuaLD5lGVPIQ5nEqA0ifxuQjZLrDQZvJUNjMVnDt6w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pWMKus1pru3z8hN8dqL0cbYXBjUdyYTuF0fikhUP1MYGWayE+dLHjF2z6Eoivk6iaI68KiDnicv/c+4hPu4+pzp1i28ViQSuXQF11yGsOWZaqRmRtUxdcobEkHpiZIoh5gBoTGIGXcFmRDpBbdoWrB8xNl1gAlO3t7569Xe75XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Hhgi/Uc2; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Hhgi/Uc2"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B5F744E413C2;
	Wed, 26 Aug 2026 08:32:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 823F4604EC;
	Wed, 26 Aug 2026 08:32:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CD66911C7AC7E;
	Wed, 26 Aug 2026 10:32:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787733167; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=EVK9O7k92JFDWFYqEVYeBihhFb83QRpRZVBQqv6qGW8=;
	b=Hhgi/Uc2FrjTRVxGiekdd1OeiuQBg05VU8VHz7NatLn7XNQBST3UpxLXHq0yYSq8yPxYXt
	kbPAnPeJ6gq51Gqpkflz2K0KM55H5qtyh51JUIPrMM4S40FEJ7mZknzMAdq+/H6JDeT+YR
	QRzeAQz+a6SlOGXGUt2adfH8GGVsrUC5RmpbvL+8MkoP/b93R9OLB237TEs4L1+iZVV/n9
	Fdb5z5JG7iwCv5NkHVUmV6QSA9QP1pWDlKgxY5+ghTl5ArSDUNwKc/Z+9Z7BlEinV6Z97b
	UQkbr2thxgl2qc+6k7oNslRRAPOHnOmgoIeii5Nzc4DmkW1bj2y3Of+Pd6nOAA==
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
	Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH v3 05/15] tests: treegen: Introduce emit_fdt_header_vers()
Date: Wed, 26 Aug 2026 10:31:36 +0200
Message-ID: <20260826083146.304291-6-herve.codina@bootlin.com>
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

treegen is used to generate custom dtbs. It uses emit_fdt_header()
to generate the header part.

The current definition of this function doesn't allow to set custom
settings related to version fields.

In order to easily generate some dtb with custom version values,
introduce emit_fdt_header_vers().

The modification doesn't introduce any functional changes.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 tests/treegen.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/tests/treegen.c b/tests/treegen.c
index 6891bfd6..28943d43 100644
--- a/tests/treegen.c
+++ b/tests/treegen.c
@@ -105,7 +105,8 @@ static void fill_prop_name(struct buf *b, size_t strs, size_t prop, size_t strof
 
 /* FDT structure helpers */
 
-static size_t emit_fdt_header(struct buf *b)
+static size_t emit_fdt_header_vers(struct buf *b, uint32_t version,
+				   uint32_t last_comp_version)
 {
 	size_t off = emit_u32(b, FDT_MAGIC);
 
@@ -113,14 +114,19 @@ static size_t emit_fdt_header(struct buf *b)
 	emit_u32(b, 0);	/* off_dt_struct */
 	emit_u32(b, 0);	/* off_dt_strings */
 	emit_u32(b, 0);	/* off_mem_rsvmap */
-	emit_u32(b, 0x11);	/* version */
-	emit_u32(b, 0x10);	/* last_comp_version */
+	emit_u32(b, version);	/* version */
+	emit_u32(b, last_comp_version);	/* last_comp_version */
 	emit_u32(b, 0);	/* boot_cpuid_phys */
 	emit_u32(b, 0);	/* size_dt_strings */
 	emit_u32(b, 0);	/* size_dt_struct */
 	return off;
 }
 
+static size_t emit_fdt_header(struct buf *b)
+{
+	return emit_fdt_header_vers(b, 0x11, 0x10);
+}
+
 static void finish_rsvmap(struct buf *b, size_t hdr, size_t rsvmap)
 {
 	struct fdt_header *fh = (struct fdt_header *)(b->data + hdr);
-- 
2.55.0

