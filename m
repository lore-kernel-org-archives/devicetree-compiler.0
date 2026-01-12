Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B053624A5;
	Mon, 12 Jan 2026 14:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227695; cv=none; b=mH1ApkGRngs1j14amH3FiHWdMGKPkYHZ71tibP2ceqPByxSsV4t4MGw8vEMWCHzW4UhPA9i/KURa11ORhWTSpXoqIG6aAEj3J2hCZIsbrxnii6t4ocwK46MO88Ax8iwPfCLmpVIqdcarC3wa4tmkg8kU0LsnhZlOq9ufHrpZRKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227695; c=relaxed/simple;
	bh=zA9I0cK5eNnHIPe3u7Byxko5th3j/+EPsblx2R/GH+I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u660D1rRJikhroiUp6oqrLI7LGoP3g16SwILWQueTtCkk9bXfVdNiyyf/No7586wc5qs5Iikwm3ecH/TMruNXJMRMXPd5WJk99lPVG6UeFRvlVxHYwWv43DjnA955fmDWraSARySR2wtVewbahD9RKrJhjCes2QMSPkGnhSy0s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LgAx6Gh+; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LgAx6Gh+"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 19E2B1A2814;
	Mon, 12 Jan 2026 14:21:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E4B91606FA;
	Mon, 12 Jan 2026 14:21:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E861E103C8CD8;
	Mon, 12 Jan 2026 15:21:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227692; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=uzCy+w7Ql4bGyUjuL6W7OYetqStlfivDtS8ed9Atdc4=;
	b=LgAx6Gh+sb8snu+Txj4ablt1MQtpGDgACxQmQ3hHkA1PnYbtPTFYG2cl8NOyNoSnr/SfR5
	YG2gkWmJFzknntuZzqvbsRAS2oZlglljBX+gp3/cMfyl94gtT1NsxEqny5ddNmiSliZ+Rg
	1h8Iiga7t/l8braGcO92z5QK9hNGHQ0jj37XkVBpjVjJPZioXpgvZhOC6eftTQpvgEIqBD
	6fB+DRSP0u/I8fDpSMJqILr+8b99vai0mcfwQDbgQiq5gluCdrjO4QV++rNb0di9Fpa7uc
	mxMmjQsWqilnGOQG7e6sQF/Xlt4s1vimfTLXYIBRuYv8wuu4gLif4oBvhfPA9Q==
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
Subject: [RFC PATCH 47/77] dtc: Introduce dti_fill_fullpaths()
Date: Mon, 12 Jan 2026 15:19:37 +0100
Message-ID: <20260112142009.1006236-48-herve.codina@bootlin.com>
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

The future introduction of orphan nodes for addons device-tree will lead
to more than one tree in the addons data. Those trees will be:
  - the classical root tree starting at the root node
  - trees related to orphan nodes

Also, an addon device-tree can have only trees based on orphan nodes. In
other words an addon device-tree is valid without having the classical
'root' tree.

To prepare this change, introduce and use dti_fill_fullpaths().

dti_fill_fullpaths() builds fullpaths of nodes available in a
tree like fill_fullpaths() but it works at the struct dt_info level.

It handles the case where a 'root' device-tree is not present and will
handle orphan nodes trees as soon as they will be introduced.

This introduction doesn't lead to any functional changes.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 dtc.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/dtc.c b/dtc.c
index e0a0b54..59f4d77 100644
--- a/dtc.c
+++ b/dtc.c
@@ -45,6 +45,13 @@ static void fill_fullpaths(struct node *tree, const char *prefix)
 		fill_fullpaths(child, tree->fullpath);
 }
 
+static void dti_fill_fullpaths(struct dt_info *dti)
+{
+	/* Fill fullpaths for the root node */
+	if (dti->dt)
+		fill_fullpaths(dti->dt, "");
+}
+
 /* Usage related data. */
 static const char usage_synopsis[] = "dtc [options] <input file>";
 static const char usage_short_opts[] = "qI:O:o:V:d:R:S:p:a:fb:i:H:sW:E:@LAThv";
@@ -326,7 +333,7 @@ int main(int argc, char *argv[])
 	if (cmdline_boot_cpuid != -1)
 		dti->boot_cpuid_phys = cmdline_boot_cpuid;
 
-	fill_fullpaths(dti->dt, "");
+	dti_fill_fullpaths(dti);
 
 	/* on a plugin, generate by default */
 	if (dti->dtsflags & DTSF_PLUGIN) {
-- 
2.52.0

