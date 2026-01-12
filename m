Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A8B2E093B;
	Mon, 12 Jan 2026 14:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227647; cv=none; b=CYR15Uk8NK4dc/mlbEh/SxvH0xegZooDkhoPJUoVDsmuOMFTTAD+8MKi8y4eNXdgFMfpFYUK8AeomJ2YJL0MubZcmGEMpnG1SNOVbV172eSCUqRozhJDL+bm3a2Ty+1i/H7vApNpf6joDI3w9nTssjSAxCI9Qfh9y3s6kYcPVd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227647; c=relaxed/simple;
	bh=XvLIFqpeEbLFADaL5p0Q+qHRNYTX/5GQLS/+uAVdZa0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DSb7x2mvsOBYxtvZbDdrGg6If5oudscyGWGmZHsEFdw6jyC40u6JQK2AzBrAXJHlYHuvrxENmdtJEUE+YLF7tjHseSzeF7x6npne5UsYnQHuLZNQtXe5glliw7fW4n+1ldu4/18/We6vlNE4FtaPdS0UeevkLjzRkKDW+ZcY5rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=RkrDBzSL; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="RkrDBzSL"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 06A6D1A27F9;
	Mon, 12 Jan 2026 14:20:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C85D8606FA;
	Mon, 12 Jan 2026 14:20:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E03A5103C9267;
	Mon, 12 Jan 2026 15:20:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227643; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=1W7eqtIgrJuKdFP3qxsLYlClLy4pTWcfAqfQQTtlhuw=;
	b=RkrDBzSLeRIUdNv0q8NELu34XbmtHQFzIlfVsbqH8F+qbBFGMZB6Tg46V/FqFDwr52uLpu
	u0pMQPxZ4nL1Bfav57Ow2afnuR6P3c7jFD1BrBdaw1q0r/iXe9cSnzXCJ04iB12ryUWp/D
	ujf9LqtkPAXyQDdGoY5mHWgK1NlGrxx1iFu/Nn1p9XGxpjwm9wK/fUNLmc/Q7oq4khmlwQ
	fE3vYaBxAPFh+rYSYFVw/b+plra4igT47uKdUfkD8M+vNi+MzY62KR/NXQHiOOzHWLzkcG
	iItkINEz4ybdCA5uygVJqc/d4VnxYUdIJniNk+ceZU7AOKJhMYWfFUlx0cWLTw==
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
Subject: [RFC PATCH 14/77] tests: metadata: Add a first test related to the dt_flags header field
Date: Mon, 12 Jan 2026 15:19:04 +0100
Message-ID: <20260112142009.1006236-15-herve.codina@bootlin.com>
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

A new field has been recently added to the dtb header: dt_flags.

Even if this field is not yet used to encode meaningful information,
add a basic test related to this field (presence and its 0 default
value).

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 tests/metadata_dtflags0.dtb.expect |  1 +
 tests/metadata_dtflags0.dts        | 10 ++++++++++
 tests/run_tests.sh                 |  6 ++++++
 3 files changed, 17 insertions(+)
 create mode 100644 tests/metadata_dtflags0.dtb.expect
 create mode 100644 tests/metadata_dtflags0.dts

diff --git a/tests/metadata_dtflags0.dtb.expect b/tests/metadata_dtflags0.dtb.expect
new file mode 100644
index 0000000..cefed4d
--- /dev/null
+++ b/tests/metadata_dtflags0.dtb.expect
@@ -0,0 +1 @@
+// dt_flags:		0x0
diff --git a/tests/metadata_dtflags0.dts b/tests/metadata_dtflags0.dts
new file mode 100644
index 0000000..3ef867e
--- /dev/null
+++ b/tests/metadata_dtflags0.dts
@@ -0,0 +1,10 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+/*
+ * Copyright (C) 2026 Bootlin
+ */
+
+/dts-v1/;
+
+/ {
+	prop = <1>;
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 423812e..496fcb9 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -1141,6 +1141,12 @@ metadata_tests() {
 		sed -i '/^\/\/ /d' $dt.dtb.dts.dtb.out
 		base_run_test check_diff $dt.dtb.dts.dtb.out "$SRCDIR/$dt.dtb.expect"
 	done
+
+	run_dtc_test -I dts -O dtb -o metadata_dtflags0.dtb "$SRCDIR/metadata_dtflags0.dts"
+	base_run_test wrap_fdtdump metadata_dtflags0.dtb metadata_dtflags0.dtb.out
+	# Keep only lines containing 'dt_flags'
+	sed -i '/dt_flags/!d' metadata_dtflags0.dtb.out
+	base_run_test check_diff metadata_dtflags0.dtb.out "$SRCDIR/metadata_dtflags0.dtb.expect"
 }
 
 pylibfdt_tests () {
-- 
2.52.0

