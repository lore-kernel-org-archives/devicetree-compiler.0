Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D0A2EC54A;
	Mon, 12 Jan 2026 14:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227666; cv=none; b=UwQbzMAwRK2lhyYijsYtepd5KAaMwTTJFqP2HQU6mpmhqyUxewHZDZpEJYUuHPML54+/w8XYq27OeQqCBlCcpHkSwjqJsWPW5dwu1b2/OZVoBmLLuzuPxLiMtA5+T3z+gtzUx7Bb/VnEXxG7vXv9Ey/RzVmy/pY8rXNFSHmeaeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227666; c=relaxed/simple;
	bh=JFhL71ct8SrjrJ//e/l5+RKzOUHWDU5KI0MGy1DmXy0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bQvOtxOyrgEPY7izL3aXb82SzW3gd5VZzWuGARkbZDd3ZW0UF/MnRNB3mDP1x5HATaB/YWozkpbGrgzNBiGu9Ua53Ck7+2PA2QyYsvZt7uqmjk2k7MgXyQwbU9bMulojNzyzy5+oFUdJ9eOSNWgCoNoNnGaV1zXfFpy3z1mbOrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=yPpHocEr; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="yPpHocEr"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 419E11A2803;
	Mon, 12 Jan 2026 14:20:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 17B8F606FA;
	Mon, 12 Jan 2026 14:20:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 86C5D103C9262;
	Mon, 12 Jan 2026 15:20:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227656; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=mcrxp0ApOG//BK1b6uSdhxWShcoQ7CdeHdkSNR4OcZk=;
	b=yPpHocErfgxeG2bCDXSAtRXWFwSpOxsQjGA+qDGXv1k68HeZGO4cEDnFMYIlkeACxqyCsN
	uBG5NX5QdQjxWfg3vQUmIRUZnf7vgMErqvd4hxuwQFLQtmiba7C8TqP8fJk9Lm+3LFxj+G
	s2QZOfuBTgqAXuXf0rOxJxK1xfkbiRCQsfLQORc3aaCx+P9hctR3qqWurp5DLKdlAy/Ub6
	MgiVl+f38enIwyz9TG6FJJAo9iyHIQJp1ui7t9IvVZJsjOfJReu+9Q44Cg0Per6ALonWSw
	Vm8Xy0uRtz4R65YZ98QTjyOvrGHjMRTqBLScsp44p+VuY70sSL549dY/SBqe8g==
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
Subject: [RFC PATCH 23/77] dtc: Introduce mark_local_exports()
Date: Mon, 12 Jan 2026 15:19:13 +0100
Message-ID: <20260112142009.1006236-24-herve.codina@bootlin.com>
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

In order to have correct tags set in dtb, an export symbol has to
be identified as a "local" export symbol when it references a local
node.

This is done for phandles used by properties in mark_local_phandles().

The same operation is needed for export symbols. This is the purpose of
mark_local_exports().

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 dtc.c      |  2 ++
 dtc.h      |  2 ++
 livetree.c | 23 +++++++++++++++++++++++
 3 files changed, 27 insertions(+)

diff --git a/dtc.c b/dtc.c
index fe8e8e4..030bfa2 100644
--- a/dtc.c
+++ b/dtc.c
@@ -336,6 +336,8 @@ int main(int argc, char *argv[])
 	update_phandles_ref(dti);
 	mark_local_phandles(dti);
 
+	mark_local_exports(dti);
+
 	/*
 	 * With FDT_REF_PHANDLE added in dtbs, we need to identified
 	 * if some unresolved phandle references are allowed in the dtb
diff --git a/dtc.h b/dtc.h
index 0bf5ba5..ea073c2 100644
--- a/dtc.h
+++ b/dtc.h
@@ -368,6 +368,8 @@ void generate_local_fixups_tree(struct dt_info *dti, const char *name);
 void update_phandles_ref(struct dt_info *dti);
 void mark_local_phandles(struct dt_info *dti);
 
+void mark_local_exports(struct dt_info *dti);
+
 /* Checks */
 
 void parse_checks_option(bool warn, bool error, const char *arg);
diff --git a/livetree.c b/livetree.c
index 4458437..0e756b8 100644
--- a/livetree.c
+++ b/livetree.c
@@ -1303,3 +1303,26 @@ void mark_local_phandles(struct dt_info *dti)
 {
 	mark_local_phandles_internal(dti, dti->dt);
 }
+
+static void mark_local_exports_internal(struct dt_info *dti,
+					struct node *node)
+{
+	struct node *c;
+	struct symbol *exportsym;
+	struct node *refnode;
+
+	for_each_symbol(node->exportsymlist, exportsym) {
+		refnode = get_node_by_ref(dti->dt, exportsym->ref);
+		if (refnode)
+			exportsym->is_local = true;
+	}
+
+	for_each_child(node, c)
+		mark_local_exports_internal(dti, c);
+}
+
+void mark_local_exports(struct dt_info *dti)
+{
+	mark_local_exports_internal(dti, dti->dt);
+
+}
-- 
2.52.0

