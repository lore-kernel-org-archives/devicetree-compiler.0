Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD9D35FF76
	for <devicetree-compiler@vger.kernel.org>; Mon, 12 Jan 2026 14:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227684; cv=none; b=L6J9bkFBzVmTIlz116Z2BcFYsNEKDffG79bStWBEz+zVxQiC93na0QrtTKzEkq3/1jnWSE3NdrizmjAzp2rbGgjglzulWxo9xE/nbnTjoep+Zb9d9PMwmM/7NE5ERx2XZy4zqDRIGMFxaEcClDGaOkxS6l7f196B9b3cc2wBTLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227684; c=relaxed/simple;
	bh=XK4Qj6dGI5I2sDXHvTeRuRbmQgbqoVznNYSvAZEruGo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mjy3IXWdHpCOjqBuih1hQKVoiyj4jwNnGoIzUu8y4OqLRdrFDH6jPol/38lpc0EHivOvqVVPGqq9xAZ6PHL0tahh/pqNx5VjGACEKHxS44S7hsOPCBSRmW6qZT09eqRsazO2Nb+HnHgaRVjG0K/8LihIBXGECgHVLagBHIp7IBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=moT0VZQz; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="moT0VZQz"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C3E61C20869;
	Mon, 12 Jan 2026 14:20:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4777B606FA;
	Mon, 12 Jan 2026 14:21:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7F841103C9265;
	Mon, 12 Jan 2026 15:21:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227679; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=cMv+eZ8iw4zoGhMV/2Bi24IbtrvJT0jIrX504J92XpU=;
	b=moT0VZQzfgkdFfoX+lfDgOhh5TnP4T4fQBKTfYyzzRvpVlU0f46/BdEuS6Y37jW9ai+1Il
	Qrz80CDiHS56tdLu6d/XallPpb3EWXKTFrmzfAK6uLhJ4FTZo7YPscL0mW013dfdQ5P+o4
	+62PpGXr1tnaY9PbMguOong5cVeRicEpjNOMSnBNNUX48DzDuaV3mZBMt7KbWIcEeUNJkM
	ht/pKy5L39NabintnXFZvr6SlhFsfKX44rCrxMFXWQ6An52fxRINBun3cJ9ZERA/HP27dr
	T8WWRWMubHbI9b+TaheBBFq0F4LinfTl0wwNBB3BF/I042LUh2D5uQyhP7qptw==
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
Subject: [RFC PATCH 38/77] tests: metadata: Improve sort test to check for import symbols sorting
Date: Mon, 12 Jan 2026 15:19:28 +0100
Message-ID: <20260112142009.1006236-39-herve.codina@bootlin.com>
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

dtc is able to sort the import symbols list when the --sort option is
used.

Improve the metadata sort test to perform a check for this feature.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 tests/metadata_sort.dtb.dts.expect | 4 ++++
 tests/metadata_sort.dtb.expect     | 3 +++
 tests/metadata_sort.dts            | 4 ++++
 tests/run_tests.sh                 | 4 ++--
 4 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/tests/metadata_sort.dtb.dts.expect b/tests/metadata_sort.dtb.dts.expect
index f07a42b..270c06d 100644
--- a/tests/metadata_sort.dtb.dts.expect
+++ b/tests/metadata_sort.dtb.dts.expect
@@ -1,6 +1,10 @@
 /dts-v1/;
 /addon/;
 
+/import/ abc: "foo,bar";
+/import/ de1: "foo,bar";
+/import/ de2: "foo,bar";
+
 / {
 
 	node-a {
diff --git a/tests/metadata_sort.dtb.expect b/tests/metadata_sort.dtb.expect
index 7856894..0dacab7 100644
--- a/tests/metadata_sort.dtb.expect
+++ b/tests/metadata_sort.dtb.expect
@@ -13,3 +13,6 @@
         phandle = <0x00000001>;
     };
 };
+// [FDT_IMPORT_SYM] 'abc' (foo,bar)
+// [FDT_IMPORT_SYM] 'de1' (foo,bar)
+// [FDT_IMPORT_SYM] 'de2' (foo,bar)
diff --git a/tests/metadata_sort.dts b/tests/metadata_sort.dts
index 7d1cca7..e523e20 100644
--- a/tests/metadata_sort.dts
+++ b/tests/metadata_sort.dts
@@ -6,6 +6,10 @@
 /dts-v1/;
 /addon/;
 
+/import/ de1: "foo,bar";
+/import/ abc: "foo,bar";
+/import/ de2: "foo,bar";
+
 / {
 	node_b: node-b {
 	};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 5368db9..a5e31df 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -1158,8 +1158,8 @@ metadata_tests() {
 
 	run_dtc_test -I dts -O dtb -s -o metadata_sort.dtb "$SRCDIR/metadata_sort.dts"
 	base_run_test wrap_fdtdump metadata_sort.dtb metadata_sort.dtb.out
-	# Remove unneeded comments
-	sed -i '/^\/\/ /d' metadata_sort.dtb.out
+	# Remove unneeded comments, keep comments in the form '// [xxxx'
+	sed -i '/^\/\/ [^\[]/d' metadata_sort.dtb.out
 	base_run_test check_diff metadata_sort.dtb.out "$SRCDIR/metadata_sort.dtb.expect"
 	run_dtc_test -I dtb -O dts -o metadata_sort.dtb.dts metadata_sort.dtb
 	base_run_test check_diff metadata_sort.dtb.dts "$SRCDIR/metadata_sort.dtb.dts.expect"
-- 
2.52.0

