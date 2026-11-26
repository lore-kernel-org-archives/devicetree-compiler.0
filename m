Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692219;
	b=eIU0pL7puwut0qmE2Jv2jgCdbTn2ByhXSFnXUHVEDQHxBdRlU29JS2Y+5QRIeruDLkcy
	 Gv/b3rWbiIxuppwGAfwP8oHjdJCobNZqMzZUzgwOGultavElfwkd1hSXARXZHtAME84NU
	 xoO0rbb+q+uhyf/x97K7STc5ZuaUgnVOJaixXTbKO4QqCoEIqhjmHzAxO40Y37A6UmDA4
	 8SOV2D2ezRMZruHgeT9IG6lYshxJMecxPHXw8kfPWrH5bnpOVE86jwHivEsZTfWLDnkqj
	 qALl8F3eZWBDY0G+lktpaQxbqhm54EoOWXqSPVP2czmm9xJuhxsf7QS5329MjBqOaug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692219;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=lL+MhpygV/AydnxeUSShOtnbHS5X/LG0roQREDIX3nU=;
	b=hbJAmKsWwrNxuhF2qRzPC4LCMJB0LY/RBDZur194azLpMZ+m6ZNEYfb9XFSyWnWoT6SU
	 NkDo8Yre3r7UuXf1TaQqtH+s5I8TZ/iuk2dpA/yX41FIHHq/aExL0R5x+qO1jJDHFludY
	 FkcdnLXqMG9Wp/yCQ4pOSG5ReXJG5FcdurDBZTxyZlZOPrV/hyK+MEvlZd1RAwntWYELI
	 fiAXJXIvXX+dGsCjZbAG+MWLK/4/hIPrN4qMEQ6xcrwIbtV7kboQTYU+0J4bbRAiirCG4
	 f2RdeKx6WRy5qOSn1W+N9xvCS76dsRsgWD7wdtYlbYT9EoZtaiAkY8v2PKrTyXRbHtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=zNuiyw3E;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0295606A323
	for <devicetree-compiler@vger.kernel.org>; Thu, 26 Nov 2026 11:23:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0295606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=zNuiyw3E
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9B6081A1810;
	Thu, 26 Nov 2026 11:23:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6FA6260237;
	Thu, 26 Nov 2026 11:23:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DF94911E6B367;
	Thu, 26 Nov 2026 12:23:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795692212; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=lL+MhpygV/AydnxeUSShOtnbHS5X/LG0roQREDIX3nU=;
	b=zNuiyw3EAelwbPFH3lGcsUhGebQF9yu3cZKviLQ+7T2YdqwWDPPGBMJgqk1wkyq49BOP+C
	uhAYiH2K9wqPi7v0SWIUw8Tp1VRJaZf45Q1r7ApjcmOZyzBHP1geYnpS+JMKR5QC+ObXmA
	miDavW8JTD6vSQz3vByfJ+Ft1HG5JsgkgHNTxEcsffCNfH/6MjnR1GCJEWvQJK5X3NdWaf
	ZKdkF1P3IhhhjFrENG4rAvvSsTN4/95A0cF1IvHp4+ibPeYcRhv1tpRyliRBQTTvlSUmdT
	pSqddo5njTX5u7J0VthLg4amGD44VVjiOQCY4f6V5XS6j83d05/MjndpT+k6RA==
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
Subject: [PATCH v4 06/22] dtc: Skip possible FDT_NOP before the root node and before FDT_END tag
Date: Thu, 26 Nov 2026 12:22:23 +0100
Message-ID: <20261126112239.636284-7-herve.codina@bootlin.com>
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

dtc assumes that the root offset (i.e. the first FDT_BEGIN_NODE tag) is
present at offset 0 of the structure block.

This assumption is not correct. FDT_NOP tags can be present at offset 0
and this is a legitimate case.

Also it assumes that the FDT_END tag is present right after the last
FDT_END_NODE tag. Here also FDT_NOP tags can be present after the last
FDT_END_NODE tag and before the FDT_END tag.

Handle those possible FDT_NOP tags.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 flattree.c         | 11 ++++++++---
 tests/run_tests.sh |  5 +++++
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/flattree.c b/flattree.c
index 14546f96..b7d81d60 100644
--- a/flattree.c
+++ b/flattree.c
@@ -909,14 +909,19 @@ struct dt_info *dt_from_blob(const char *fname)
 
 	reservelist = flat_read_mem_reserve(&memresvbuf);
 
-	val = flat_read_word(&dtbuf);
-
+	/* Skip possible FDT_NOP available before the root node */
+	do {
+		val = flat_read_word(&dtbuf);
+	} while (val == FDT_NOP);
 	if (val != FDT_BEGIN_NODE)
 		die("Device tree blob doesn't begin with FDT_BEGIN_NODE (begins with 0x%08x)\n", val);
 
 	tree = unflatten_tree(&dtbuf, &strbuf, "", flags);
 
-	val = flat_read_word(&dtbuf);
+	/* Skip possible FDT_NOP available before FDT_END */
+	do {
+		val = flat_read_word(&dtbuf);
+	} while (val == FDT_NOP);
 	if (val != FDT_END)
 		die("Device tree blob doesn't end with FDT_END\n");
 
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 65ea5894..a9be92a9 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -597,6 +597,11 @@ dtc_tests () {
     tree1_tests_rw dtc_tree1.test.dtb
     run_test dtbs_equal_ordered dtc_tree1.test.dtb test_tree1.dtb
 
+    # Check that FDT_NOP are well skipped and not present in the generated dtb
+    run_test nopulate dtc_tree1.test.dtb
+    run_dtc_test -I dtb -O dtb -o dtc_out_noppy.dtc_tree1.test.dtb  noppy.dtc_tree1.test.dtb
+    run_test dtbs_equal_ordered --noskip-nop dtc_out_noppy.dtc_tree1.test.dtb dtc_tree1.test.dtb
+
     run_dtc_test -I dts -O dtb -o dtc_escapes.test.dtb "$SRCDIR/propname_escapes.dts"
     run_test propname_escapes dtc_escapes.test.dtb
 
-- 
2.56.1

