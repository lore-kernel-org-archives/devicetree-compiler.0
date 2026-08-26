Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1EF3BD638;
	Wed, 26 Aug 2026 09:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787737868; cv=none; b=qD3tyEmfyo8oK58jcDnJh2TRib1bj8nIfJyQlfKfbFymJqeN4xCut6CFKL7R/QC6UjG+WcfYkHd323tNimCndTCA3e13HTJbk+kcByygT7EX9tTpmxg5GeizP5Doz8u5iIsdG/f2vAn8kGKicHKGPEGV2rsbLNWIIbBTQj4I7S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787737868; c=relaxed/simple;
	bh=OSkeY49k2KlTNyWcWpeZ9nLjye2bfNs0OFn7IHaXvDM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i8SsT2sIh8CCQ+IaQ6r4PkePVFt2sb7sH1Wy+y06UsEqToPZv252r63HLqLeP0dyeWKUhXtSMryUhgiwFcGQZacx606pQgRmUghWJXTLpmYX94MvuJYdPzwS8Dnuw8M0ThDj5jPSwPGAmCuw/tSTT5ZzEh85INNRXfVAiq9TOiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=iqIQxSwq; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="iqIQxSwq"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5ED2D1A183A;
	Wed, 26 Aug 2026 09:51:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2B34E604EC;
	Wed, 26 Aug 2026 09:51:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2BCEA11C7AD61;
	Wed, 26 Aug 2026 11:50:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787737856; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=f6y/P7CZOWm5zA57Sd5S8uAf7L/L4YoA6b7jKbkk6fo=;
	b=iqIQxSwqV7NKJ075Y7P1WyA+xiljOgqluXP7muLs27LGf+Xw+ukAnEH+CKUtUEgaNJFS2J
	bpoFqpVZIc06ePOxO5EZeViWDoTEpsgiV9iZaZuBhrzW6tfH4MabIXfnBvQ2jqVfdkninQ
	AtdQS4ZLYAxiLK3+0BQ+OKphbQe0j2knofsdHnAHX7dkYxt69DLdgtgBYT+FV1eS54gIIt
	VwBmjTmwU/0epZdgTFM4aIcaX8I6naUCRSIXT9ls1QgK8x7ZAnE7XuXOd/wKJBkuuu4XF3
	oX70qqt62mngGZw1+pC06u24gLH7D3hKbGB3KUywENupieOoDA50QN4kx5BYiw==
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
Subject: [RFC PATCH v2 09/74] dtc: Complete REF_PHANDLE markers with ref strings and is_local flags
Date: Wed, 26 Aug 2026 11:48:38 +0200
Message-ID: <20260826094950.1088288-10-herve.codina@bootlin.com>
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

REF_PHANDLE markers lack either the ref string or the is_local flag
depending on the device-tree input format used.

When the marker is created from a dtb blob (via FDT_PROPDATA_PHANDLE),
only the raw phandle value is available. When created from dts source,
the ref string is present but the is_local flag is not set.

Add complete_references() to fill in the missing information.

Call the new function from build_dt_info() in order ensure that a
dt_info is always fully complete and consistent.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 livetree.c | 82 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/livetree.c b/livetree.c
index a9f8c5d2..2ad7fd09 100644
--- a/livetree.c
+++ b/livetree.c
@@ -465,6 +465,82 @@ static void fill_fullpaths(struct node *tree, const char *prefix)
 		fill_fullpaths(child, tree->fullpath);
 }
 
+static void complete_ref_and_is_local(struct dt_info *dti, char **ref,
+				      bool *is_local, cell_t phandle)
+{
+	struct node *refnode;
+
+	/*
+	 * When created from a dts, the reference is available but the is_local
+	 * flag is not set.
+	 *
+	 * When created from a dtb, the is_local flag is set (and a valid
+	 * phandle value is available) but not the reference.
+	 *
+	 * Complete both ref and is_local based on existing values.
+	 */
+
+	if (*ref) {
+		refnode = get_node_by_ref(dti->dt, *ref);
+		if (refnode)
+			*is_local = true;
+		else
+			*is_local = false;
+		return;
+	}
+
+	if (*is_local) {
+		refnode = get_node_by_phandle(dti->dt, phandle);
+		if (!refnode)
+			die("Node not found for phandle 0x%"PRIx32"\n", phandle);
+
+		*ref = refnode->fullpath;
+		return;
+	}
+
+	die("Cannot have a non local reference without a reference\n");
+}
+
+static void complete_references_internal(struct dt_info *dti, struct node *node)
+{
+	struct property *prop;
+	struct marker *m;
+	struct node *c;
+	cell_t phandle;
+
+	/*
+	 * In order to have a complete state, a REF_PHANDLE marker needs to
+	 * have a reference set (either a label or a path) and the is_local
+	 * flag must be also correctly set.
+	 *
+	 * When created from dtb, references are not present in REF_PHANDLE
+	 * markers created from the FDT_PROPDATA_PHANDLE tag. Indeed, only a
+	 * phandle value is available with this tag.
+	 *
+	 * When created from dts, references are available for REF_PHANDLE
+	 * markers but 'is_local' flag is not set.
+	 *
+	 * Completing a REF_PHANDLE marker consists in setting those fields.
+	 */
+	for_each_property(node, prop) {
+		m = prop->val.markers;
+		for_each_marker_of_type(m, REF_PHANDLE) {
+			phandle = propval_cell_n(prop,
+						 m->offset / sizeof(cell_t));
+			complete_ref_and_is_local(dti, &m->ref, &m->is_local,
+						  phandle);
+		}
+	}
+
+	for_each_child(node, c)
+		complete_references_internal(dti, c);
+}
+
+static void complete_references(struct dt_info *dti)
+{
+	complete_references_internal(dti, dti->dt);
+}
+
 struct dt_info *build_dt_info(unsigned int dtsflags,
 			      struct reserve_info *reservelist,
 			      struct node *tree, uint32_t boot_cpuid_phys)
@@ -479,6 +555,12 @@ struct dt_info *build_dt_info(unsigned int dtsflags,
 
 	fill_fullpaths(dti->dt, "");
 
+	/*
+	 * Complete references (REF_PHANDLE).
+	 * Set ref strings and set is_local flags
+	 */
+	complete_references(dti);
+
 	return dti;
 }
 
-- 
2.55.0

