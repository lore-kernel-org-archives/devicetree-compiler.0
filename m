Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653FF36A00F
	for <devicetree-compiler@vger.kernel.org>; Mon, 12 Jan 2026 14:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227716; cv=none; b=D8WNzpiEg9h7awS8erfYaF2vhWIM6dAbtixvy4vYs8NUwrAFOelIl8zPmT8pnj63l5HUNURvE4/quia2w+nphS2LY+eBkv6P6KKRtn94NU55qIwSdz0fq3fRTkUXAaOmT6k2tahu/KuNpou/qRN3pSwp9y/DPKiNlHVYecFYrl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227716; c=relaxed/simple;
	bh=ibv3HHQTg3l8cK9tjTVarw5d8EPr7Emhbn4fChGR3ck=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K0xSa0W5son2x9YNHdVMYn4ZUyR/2tBHmeJ1aHKBNDV+nTweP4SqcRj2Y3wKc2UHFrdeZIjxEFmhv2OKaLHzTE0CFaQJ3DaD3XwdN/89oIgXhhtm8he501BmNPdbOT/mf7jJ+IyviZOSt/CeaHKuhP7uWbON2JRa0MiAWx4vQ0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=OuQBhuG6; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="OuQBhuG6"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3696E1A281A;
	Mon, 12 Jan 2026 14:21:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0BD6B606FA;
	Mon, 12 Jan 2026 14:21:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 323E3103C9260;
	Mon, 12 Jan 2026 15:21:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227712; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=rhQymJfoeWjEmMGqd2fwO2nktZgpHgpUm58z5wMqPwA=;
	b=OuQBhuG6ey3VKxa2AYudHEJHnIBxhHVfN3iASa1rTO5sV81T9UYR+b+Uz8MB0o5EIiFO5e
	Md6dJjgaxr5KCc+Q3znuYDxJIg/MCnfAf5wk2UwiQtjr9RZK25MvSj1xjhPwHDsZWnzwcE
	tLFcTcOL5enFZ/C0AGEq9P77KWtltXT+fQOhVLd8/9DZpmnDsNMzi9UdISSXWhXsATOovx
	/ZBPXqdIi+f3wGVmKAs7ktRdmWw1QrcewcsCju2dZ5oCrVu1M4CCRVzk/rZ4M1AqdCtFYr
	byTjJdxsuD/0zpU/ZwpU8OexhL43UbrtMKDkig3EOBXrSdm/atElnrR8owJSiA==
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
Subject: [RFC PATCH 60/77] dtc: Allow parser_get_node_by_ref() to return an orphan node for merging purpose
Date: Mon, 12 Jan 2026 15:19:50 +0100
Message-ID: <20260112142009.1006236-61-herve.codina@bootlin.com>
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

When the same orphan node is described multiple times in an addon dts,
those multiple descriptions should be merged.

For instance, in the following snippet:
    --- 8< ---
    /addon/;

    &foo {
        prop1 = <1>;
    };

    &foo {
        prop2 = <2>;
    };
    --- 8< ---

The foo orphan node is described twice and should be merged in only one
instance:
    --- 8< ---
    &foo {
        prop1 = <1>;
        prop2 = <2>;
    };
    --- 8< ---

The current mecanisme used to find a node for merging is based on label.
Indeed, without orphan nodes, '&foo' is a reference to a node with the
label 'foo'. This node labeled foo is the node found for merging.

With addons and orphan nodes, '&foo' is not a reference to an existing
node. Indeed, this node is an orphan one because the node referenced by
foo is an external node (i.e. not available in the addon itself).

The label 'foo' doesn't exist. No node in the addon are defined with a
foo label attached.

Take this orphan nodes specificity into account in order to find a
possible orphan node candidate for merging.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 dtc-parser.y | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index cf5447a..7f8c294 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -39,11 +39,32 @@ static struct node *parser_get_node_by_ref(struct node *dt, struct node *orphanl
 	 * Use a temporary dt_info in order to use dti_get_node_by_ref()
 	 */
 	struct dt_info dti = {};
+	struct node *target;
+	struct node *orphan;
 
 	dti.dt = dt;
 	dti.orphanlist = orphanlist;
 
-	return dti_get_node_by_ref(&dti, ref);
+	target = dti_get_node_by_ref(&dti, ref);
+	if (target)
+		return target;
+
+	/*
+	 * No node were found by dti_get_node_by_ref().
+	 *
+	 * parser_get_node_by_ref() is called by the parser only to get a node
+	 * in order to perform a possible merge.
+	 *
+	 * The referenced used can be a label matching an orphan node. In this
+	 * merge context, returning a matching orphan node makes sense even if
+	 * no label are defined for the orphan node.
+	 */
+	for_each_orphan(orphanlist, orphan) {
+		if (streq(orphan->ref, ref))
+			return orphan;
+	}
+
+	return NULL;
 }
 
 %}
-- 
2.52.0

