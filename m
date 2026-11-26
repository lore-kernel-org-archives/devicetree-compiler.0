Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692212;
	b=VgnCCIfodY491hGedZoB42AzLGB5dQXzEbQlGy/Ftsa+hiHoHmcpWZ5iHZ2Ti/FsU56V
	 0+NVv7duEQV6T5VQuAFSuFR8tmg0AwQmA3nzvHThvIJd0rNgTQNvgoMfEZjWfcQC1it6E
	 2HezvIcuWEyTkhv6f7L2pehuG8PPBJGNv4gbgA0OYWDF426xsZzrJnlrd4gO1Lo+c31if
	 QBqHngkNkl8WSlib8EPG88Q6i81ZYdFaQSb+SB5uxe4dylMZ9DK6fdgftzasW/Vt3BtIw
	 8qC4Wo/8sQvOgZm3f21/L1R1Of87Bo8H3JoDkwWcmy7mnY5l/zFFJGDpDXAduYu947w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692212;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=IAYrY00zEa8fJNaul9FWej9b698lYsbtVQJkZQbyH1U=;
	b=K4rS/+a5K1p20vyrp4MHSyiubD1nv5agkVK3YmqOk2Oyg9en1Cjgn+mHOI9A4Xi4Tp55
	 3sbxx48T6iecZO1Ux4Asxbcvgv+wOWShPUHupgylJhv1pAUhHCeVObjFavsCPlkZzdzIn
	 7AzJ2BoEr/+Xxx+IYVvW3f++DuAUPGZLZYmseavYh3okWgOBWTaon1gAW/nR+l3DsqnYA
	 8bxrtz9Bs6LOs7Sdn5s3ENae/luPmwvHke+jRMktMSI8yel3Nu0et3FFGvM5KjHb2dZiJ
	 ljz0r+TXW7YAH5i+I0TutgELCgOb4GgOygA4LStR72VeOvW3VkDOruigGsefpydL2Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Grvo6Qvw;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA9060A2611;
	Thu, 26 Nov 2026 11:23:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAA9060A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Grvo6Qvw
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 52ECE1A1813;
	Thu, 26 Nov 2026 11:23:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2762B60237;
	Thu, 26 Nov 2026 11:23:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C8AF311E6B363;
	Thu, 26 Nov 2026 12:23:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795692208; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=IAYrY00zEa8fJNaul9FWej9b698lYsbtVQJkZQbyH1U=;
	b=Grvo6Qvw13/wH2ChMXTnAqTxAZa1ZR40jzEXxwaaBd61ufdfhwNileelf1HvFRW55vU0Gu
	P30AUlgR/UphrIPYdYxdLUF3z+YQJUWPAM1I2akEWnvqCodj1Da/dD62IB9EdGygrxBSk4
	cGQlq7Z2PsonrPKiOEcke8UQoIRGZuYF2/sUClkqnfIX3lbzeklKEXHwb5YU7nIddRRuRc
	ztGjy6oV21MgW7skj/ZgXClfXLFAIpRiSdbsZwsq7gR7Sr97dyUHBN+uCDoEbrinYv1LYv
	FmdzoVBqAeZEyVxcLMI4s0wCJC1z+lrs6PzDQY1JlTUNH8l+ENwvk6N40vwREA==
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
Subject: [PATCH v4 05/22] tests: dtbs_equal_ordered: Add --noskip-nop option
Date: Thu, 26 Nov 2026 12:22:22 +0100
Message-ID: <20261126112239.636284-6-herve.codina@bootlin.com>
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

dtbs_equal_ordered skips FDT_NOP tags by default when it compares dtbs.

Add an option to override this behavior and take into account FDT_NOP
tags in dtbs comparison.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 tests/dtbs_equal_ordered.c | 42 +++++++++++++++++++++++++++++---------
 1 file changed, 32 insertions(+), 10 deletions(-)

diff --git a/tests/dtbs_equal_ordered.c b/tests/dtbs_equal_ordered.c
index 90c7344d..488e08b8 100644
--- a/tests/dtbs_equal_ordered.c
+++ b/tests/dtbs_equal_ordered.c
@@ -16,6 +16,7 @@
 #include "testdata.h"
 
 static int notequal; /* = 0 */
+static int ignore_nop = 1;
 
 #define MISMATCH(fmt, ...)			\
 	do { \
@@ -76,11 +77,11 @@ static void compare_structure(const void *fdt1, const void *fdt2)
 		do {
 			offset1 = nextoffset1;
 			tag1 = fdt_next_tag(fdt1, offset1, &nextoffset1);
-		} while (tag1 == FDT_NOP);
+		} while (ignore_nop && (tag1 == FDT_NOP));
 		do {
 			offset2 = nextoffset2;
 			tag2 = fdt_next_tag(fdt2, offset2, &nextoffset2);
-		} while (tag2 == FDT_NOP);
+		} while (ignore_nop && (tag2 == FDT_NOP));
 
 		if (tag1 != tag2)
 			MISMATCH("Tag mismatch (%d != %d) at (%d, %d)",
@@ -126,26 +127,47 @@ static void compare_structure(const void *fdt1, const void *fdt2)
 					 offset1, offset2);
 			break;
 
+		case FDT_NOP:
+			break;
+
 		case FDT_END:
 			return;
 		}
 	}
 }
 
+static void badargs(char **argv)
+{
+	CONFIG("Usage: %s [-n] --noskip-nop <dtb file> <dtb file>", argv[0]);
+}
+
 int main(int argc, char *argv[])
 {
 	void *fdt1, *fdt2;
 	uint32_t cpuid1, cpuid2;
+	char **args;
+	int argsleft;
 
 	test_init(argc, argv);
-	if ((argc != 3)
-	    && ((argc != 4) || !streq(argv[1], "-n")))
-		CONFIG("Usage: %s [-n] <dtb file> <dtb file>", argv[0]);
-	if (argc == 4)
-		notequal = 1;
-
-	fdt1 = load_blob(argv[argc-2]);
-	fdt2 = load_blob(argv[argc-1]);
+
+	args = &argv[1];
+	argsleft = argc - 1;
+
+	while (argsleft > 2) {
+		if (streq(args[0], "-n"))
+			notequal = 1;
+		else if (streq(args[0], "--noskip-nop"))
+			ignore_nop = 0;
+		else
+			badargs(argv);
+		args++;
+		argsleft--;
+	}
+	if (argsleft != 2)
+		badargs(argv);
+
+	fdt1 = load_blob(args[0]);
+	fdt2 = load_blob(args[1]);
 
 	compare_mem_rsv(fdt1, fdt2);
 	compare_structure(fdt1, fdt2);
-- 
2.56.1

