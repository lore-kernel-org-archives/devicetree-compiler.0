Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8DD44071E5;
	Wed, 26 Aug 2026 09:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787738011; cv=none; b=Prtz+JwILb3lBlIufCinrcut0j5HBdRVHe7nnaC0AgqeYCKIdzFXQdzGdZDXaYWCZqVV5y/gj69znb66uoQmIz/JK7BbDUZ1Spi0GdDlu8eTX+1q3i0TMkpftVHMMPVHFrnqcfLCAE0AyKtx//whgpJAXTrPn5olBJqJjcnnkTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787738011; c=relaxed/simple;
	bh=IaUg5BeyJfPvX6fljByZEXZb8D6ZyRUhQPDAJPhYxLc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RE9WlxgoPDVjGxanfDLPL1QRFia8xLw5i7mb9+8qD6UqbbXzq7VJCdFmtJMfo98Eh/Il+pjBxWSwoPo7ExhcJbAkt+ZoXy0MueRhQY1uyBklG5VpSGkQBI5SoYfK2YTsHnHyuMnNKnJzRm+tdPnK72faxPgASvFcUNX5kizVq9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=v3RReRnV; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="v3RReRnV"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 82E5F4E413BC;
	Wed, 26 Aug 2026 09:53:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 572F7604EC;
	Wed, 26 Aug 2026 09:53:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 267D911C7AD65;
	Wed, 26 Aug 2026 11:53:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787738007; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=kM0QWQRS6/0weW+j97TLc6mGgKU5/5L+AcqkH6EFFeE=;
	b=v3RReRnV2yLKVmkOmNGVUxcwS813M7j0xo1DkrZs0OqDj+aNgSP0+IKNB6F9rfYHgoH4WD
	j+W+Ny6iwK1yNw52GgSoRd9Jlq0RfrfgwwSTY8TDP3EzwxOrqXIjv6U1wJp+imyoaO70sZ
	IyNzYQOKjaWdMZ4HOCtZ/lEdBwEobsggHeGvYzcn0TZJLnPee6A6JbR/+hd7GPGt99DMH4
	YCe3B+rg8Zf96ufncS/XOUh6cmH7wlfA1isCA7KJB+xJCfyIQ3oarCBLiZqa98+qPRx07E
	dUVQjG4843Qp/4TaSqBvjkY4i8Pinb8CMtib/HyERrUqxi8pCTzK6gj6o7EXnA==
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
Subject: [RFC PATCH v2 55/74] dtc: Allow parser_get_node_by_ref() to return an orphan node for merging purpose
Date: Wed, 26 Aug 2026 11:49:24 +0200
Message-ID: <20260826094950.1088288-56-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826094950.1088288-1-herve.codina@bootlin.com>
References: <20260826094950.1088288-1-herve.codina@bootlin.com>
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
index 8d43cc4e..6bf6bb50 100644
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
 
-	return get_node_by_ref(&dti, ref);
+	target = get_node_by_ref(&dti, ref);
+	if (target)
+		return target;
+
+	/*
+	 * No node were found by get_node_by_ref().
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
2.55.0

