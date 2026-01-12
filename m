Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69EF2C026C;
	Mon, 12 Jan 2026 14:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227641; cv=none; b=alM+jWBN0iVwt2OfFmrl6nykZaghDAxoHa64cGj8YSRALWerQpODRVIIrZ9iSCjCjEFU5yNrH6rNweH2A9VXQk2S86h6nn/JnU9iJCgOq2W3OjkyovXTa6wS5zvg6YbwLJgesROS9LYgmSZhy/x4oITN70rqYCv/lwIQ/xrzsjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227641; c=relaxed/simple;
	bh=Q7d+N+qaxCS1cL3oXzPN5kKvGycb5yJI0kIRov0CX3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=esKNXmus7/pp15R9lrCATY6lqbEL9MVtdD3IPlmtRTJZMs081wuSpRSyF6+VDUpK6jRrdyBDb7lxvju5e5zCXmHuM1iAenaNnsw28NefLIhK/73ruicS7L/i1G9bhvDBssWHMZA0sZvoECm4XcRkGfKSdiL+7L6mJyHK2g3V++g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=TVl3VYYO; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="TVl3VYYO"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E546E4E42088;
	Mon, 12 Jan 2026 14:20:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BBA1C606FA;
	Mon, 12 Jan 2026 14:20:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C0690103C9260;
	Mon, 12 Jan 2026 15:20:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227635; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=R0j2VCBhRwI5mPHPNv3oVXmquGF1BZdBGvded0qwW+M=;
	b=TVl3VYYO2PeZfexko6SRu6Nw/Ycm7ksufavfAQTxnxIK42vK0+DO07XgkeIwA0EIVu/Akk
	i06lXDtoIgdiwd8hiFvmJ6ZZf805Ast6ZgJ5vrhsNuj6aNx/bG+Ja+lfZ2r7JDcsmHI66a
	BAhSOjzIh4n1Gk0lMhVlmS4o2mlnnbzLjJ9PLhtDOhdmq1UFIIEpcK4dd+gUwxllMt+DUW
	3iqBe8RJ2ga1OJrD0FhzLCuDQcmZPssDKXO8rcf2KDd/wFOP+BflkiSVJVEGBnDpdS4TKa
	oJpaGD3JuDAxPVipah8u/Ay5c0N86RQXvv+GYEP4J1NQ6WireXL7cd2ouCTUxA==
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
Subject: [RFC PATCH 09/77] dtc: Introduce mark_local_phandles()
Date: Mon, 12 Jan 2026 15:18:59 +0100
Message-ID: <20260112142009.1006236-10-herve.codina@bootlin.com>
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

In order to have the new FDT_REF_LOCAL tag present in a dtb, the phandle
reference needs to be identify as a local reference.

This is the purpose of mark_local_phandles().

It identifies a phandle reference as a local reference when this
reference points to a local node.

With that node, the related FDT_REF_LOCAL tag is set in the dtb.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 dtc.c      |  1 +
 dtc.h      |  1 +
 livetree.c | 26 ++++++++++++++++++++++++++
 3 files changed, 28 insertions(+)

diff --git a/dtc.c b/dtc.c
index 88f03ff..d0b4de3 100644
--- a/dtc.c
+++ b/dtc.c
@@ -334,6 +334,7 @@ int main(int argc, char *argv[])
 	}
 
 	update_phandles_ref(dti);
+	mark_local_phandles(dti);
 
 	process_checks(force, dti);
 
diff --git a/dtc.h b/dtc.h
index 351fe41..08c9f07 100644
--- a/dtc.h
+++ b/dtc.h
@@ -346,6 +346,7 @@ void generate_fixups_tree(struct dt_info *dti, const char *name);
 void generate_local_fixups_tree(struct dt_info *dti, const char *name);
 
 void update_phandles_ref(struct dt_info *dti);
+void mark_local_phandles(struct dt_info *dti);
 
 /* Checks */
 
diff --git a/livetree.c b/livetree.c
index 9e30a63..2a0a7ed 100644
--- a/livetree.c
+++ b/livetree.c
@@ -1196,3 +1196,29 @@ void update_phandles_ref(struct dt_info *dti)
 {
 	update_phandles_ref_internal(dti, dti->dt);
 }
+
+static void mark_local_phandles_internal(struct dt_info *dti,
+					 struct node *node)
+{
+	struct node *c;
+	struct property *prop;
+	struct marker *m;
+	struct node *refnode;
+
+	for_each_property(node, prop) {
+		m = prop->val.markers;
+		for_each_marker_of_type(m, REF_PHANDLE) {
+			refnode = get_node_by_ref(dti->dt, m->ref);
+			if (refnode)
+				m->is_local = true;
+		}
+	}
+
+	for_each_child(node, c)
+		mark_local_phandles_internal(dti, c);
+}
+
+void mark_local_phandles(struct dt_info *dti)
+{
+	mark_local_phandles_internal(dti, dti->dt);
+}
-- 
2.52.0

