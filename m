Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A683BFAF7;
	Wed, 26 Aug 2026 09:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787737852; cv=none; b=Xq6CZqGDwIr80xSdeT66U02gPq1F28elwupnkCf8T8TNywIsFbpypwH2rZkfz0FWSfzydbBRh47t9lExf/t9RtqXKO5k76yeAC0l3swyDImu6CM7M/7EI8b+akOxj9Ryva8/5e3l+ELePLc62ZhMwKHmyP6CB58GBY7DipoyJaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787737852; c=relaxed/simple;
	bh=5Gxcw4rep+TXz2WVH77ceRmT6PRWg8TLiOnUDvMzg+M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OkBEML1CbSAm7m2CBiqEW0J57trz6EET1XhyfYHCTiN7LZmYz5guL2DDeCnbgWoAdwXp8KxERL1lKwVdBoleqpIIotpy/3rvUjQuyC30b4Jys66CDgFzDoQWjB8f9S+pj4ljyFMiYm5e6+oXg3ksVFFlggbiYQ0s/BsN/XjknCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=FPij+mON; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="FPij+mON"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3E7E81A1840;
	Wed, 26 Aug 2026 09:50:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 12E8B604EC;
	Wed, 26 Aug 2026 09:50:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A654811C7AD57;
	Wed, 26 Aug 2026 11:50:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787737843; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=2Mh4nOQ6ZnAJl7S7+DsN1StmummKBipg0KObR3fPfSE=;
	b=FPij+mONcmwnhDJz8SZqSQUPYvejdi/UCwdEFNkiIZq90Ay338vMMLzmn6st7K1a2ocVMX
	PcR8aErMy2dlfpw8bq86QnBu0H2bfPIfAvVKAmXPZRK4nirO7pldJi/X9c9hbsIVMIElbS
	EPNXz2bBOOWo1RE4vArNZyluQ4dCGP2qIRPheXOzIS2gWMn/D/8ODiZPoQ1GA8wBnrdOvZ
	UTG+xBC3Z+SjeVd3TjaMOw8DTAhjCtGBAzCHWf6ORlJphKuJ3rqCYlZP22iilCYSCS7tB5
	BOb4yFcyOrKpukP8Tim7ui67+hqwcVnUvs5sH9ar1ieWGujZB8YTKP9iY2zgow==
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
Subject: [RFC PATCH v2 05/74] libfdt: Prepare for metadata tag support
Date: Wed, 26 Aug 2026 11:48:34 +0200
Message-ID: <20260826094950.1088288-6-herve.codina@bootlin.com>
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

Metadata tags are tags carrying extra information, either global to
the DTB, specific to a node, or specific to a property.

In several places (e.g. node/property iterators), these tags just need
to be skipped. Introduce fdt_next_tag_filter() which wraps
fdt_next_tag() and uses a user-supplied filter function to decide
whether a tag should be hidden from the caller. Filtered-out tags are
returned as FDT_NOP.

Introduce fdt_tag_filter_skip_metadata() a filter function whose purpose
is to filter metadata tags; actual metadata tag filtering will be added
when metadata tags are defined.

Metadata tags must also be handled when a DTB is modified. They have to
be removed or skipped depending on the modification.

Here also, introduce fdt_tag_is_property_metadata() to provide a central
check for whether a tag is a property metadata tag; actual metadata
check will be added when metadata tags are defined.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 libfdt/fdt.c             | 34 +++++++++++++--
 libfdt/fdt_ro.c          |  3 +-
 libfdt/fdt_rw.c          | 90 +++++++++++++++++++++++++++++++++-------
 libfdt/fdt_wip.c         | 23 +++++++++-
 libfdt/libfdt_internal.h | 10 +++++
 5 files changed, 140 insertions(+), 20 deletions(-)

diff --git a/libfdt/fdt.c b/libfdt/fdt.c
index 7941632f..8c026f26 100644
--- a/libfdt/fdt.c
+++ b/libfdt/fdt.c
@@ -323,6 +323,33 @@ uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
 	return fdt_next_tag_(fdt, startoffset, nextoffset, NULL);
 }
 
+uint32_t fdt_next_tag_filter(const void *fdt, int offset, int *nextoffset,
+			     bool (*tag_filter)(void *priv, uint32_t tag),
+			     void *priv)
+{
+	int startoffset = offset;
+	uint32_t tag;
+
+	tag = fdt_next_tag_(fdt, startoffset, nextoffset, NULL);
+	if (tag == FDT_END)
+		return tag;
+
+	if (tag_filter(priv, tag))
+		return FDT_NOP;
+
+	return tag;
+}
+
+bool fdt_tag_filter_skip_metadata(void *data, uint32_t tag)
+{
+	return false;
+}
+
+bool fdt_tag_is_property_metadata(uint32_t tag)
+{
+	return false;
+}
+
 int fdt_check_node_offset_(const void *fdt, int offset)
 {
 	if (!can_assume(VALID_INPUT)
@@ -355,7 +382,8 @@ int fdt_root_offset(const void *fdt)
 
 	do {
 		offset = nextoffset;
-		tag = fdt_next_tag(fdt, offset, &nextoffset);
+		tag = fdt_next_tag_filter(fdt, offset, &nextoffset,
+					  fdt_tag_filter_skip_metadata, NULL);
 		switch (tag) {
 		case FDT_END_NODE:
 		case FDT_PROP:
@@ -393,8 +421,8 @@ int fdt_next_node(const void *fdt, int offset, int *depth)
 
 	do {
 		offset = nextoffset;
-		tag = fdt_next_tag(fdt, offset, &nextoffset);
-
+		tag = fdt_next_tag_filter(fdt, offset, &nextoffset,
+					  fdt_tag_filter_skip_metadata, NULL);
 		switch (tag) {
 		case FDT_PROP:
 		case FDT_NOP:
diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
index 50c0a8bc..ea6a540d 100644
--- a/libfdt/fdt_ro.c
+++ b/libfdt/fdt_ro.c
@@ -206,7 +206,8 @@ static int nextprop_(const void *fdt, int offset)
 	int nextoffset;
 
 	do {
-		tag = fdt_next_tag(fdt, offset, &nextoffset);
+		tag = fdt_next_tag_filter(fdt, offset, &nextoffset,
+					  fdt_tag_filter_skip_metadata, NULL);
 
 		switch (tag) {
 		case FDT_END:
diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
index 1c6ce0a3..30f3da40 100644
--- a/libfdt/fdt_rw.c
+++ b/libfdt/fdt_rw.c
@@ -259,6 +259,42 @@ int fdt_prop_remove_unknown_tags(void *fdt, bool force_inplace,
 	return 0;
 }
 
+int fdt_prop_remove_metadata_tags(void *fdt, bool force_inplace,
+				  int prop_offset)
+{
+	int nextoffset, offset;
+	uint32_t tag;
+
+	/*
+	 * Only inplace using nopify is supported even if we could use an other
+	 * method involving splices if force_inplace is set to false.
+	 */
+
+	tag = fdt_next_tag(fdt, prop_offset, &nextoffset);
+	if (tag == FDT_END)
+		return nextoffset;
+
+	/*
+	 * Look at all tags related to the current property. I.e. tags after the
+	 * current property and before either the next property, a sub-node  or
+	 * the end of current node
+	 */
+	do {
+		offset = nextoffset;
+		tag = fdt_next_tag(fdt, offset, &nextoffset);
+		if (tag == FDT_END)
+			return nextoffset;
+
+		/* Remove metadata tags related to the property */
+		if (fdt_tag_is_property_metadata(tag))
+			fdt_nopify_area(fdt, offset, nextoffset);
+
+	} while ((tag != FDT_PROP) && (tag != FDT_BEGIN_NODE) &&
+		 (tag != FDT_END_NODE));
+
+	return 0;
+}
+
 static int fdt_resize_property_(void *fdt, int nodeoffset,
 				const char *name, int namelen,
 				int len, struct fdt_property **prop)
@@ -273,10 +309,18 @@ static int fdt_resize_property_(void *fdt, int nodeoffset,
 		return oldlen;
 
 	/*
-	 * The property is resized. Remove possible unknown tags related to the
-	 * property downgrading the dtb version.
+	 * The property is resized and data are going to be modified. Remove
+	 * property metadata tags
 	 */
 	prop_offset = fdt_ptr_offset_(fdt, *prop);
+	err = fdt_prop_remove_metadata_tags(fdt, false, prop_offset);
+	if (err)
+		return err;
+
+	/*
+	 * Remove also possible unknown tags related to the property downgrading
+	 * the dtb version.
+	 */
 	err = fdt_prop_remove_unknown_tags(fdt, false, prop_offset, true);
 	if (err)
 		return err;
@@ -289,7 +333,7 @@ static int fdt_resize_property_(void *fdt, int nodeoffset,
 	return 0;
 }
 
-static int fdt_node_skip_unknown_tags(void *fdt, int next)
+static int fdt_node_skip_unknown_and_metadata_tags(void *fdt, int next)
 {
 	int nextoffset = next;
 	int offset;
@@ -299,6 +343,7 @@ static int fdt_node_skip_unknown_tags(void *fdt, int next)
 	 * Skip all tags related to the current node. I.e. tags after the
 	 * current node and before either the next property, a sub-node or the
 	 * end of current node.
+	 * FDT_NOP, unknown tags and potential node metadata tags are skipped.
 	 */
 	do {
 		offset = nextoffset;
@@ -332,10 +377,10 @@ static int fdt_add_property_(void *fdt, int nodeoffset, const char *name,
 
 	/*
 	 * nextoffset it at the first tag after the node.
-	 * Skip possible unknown tags related to the node in order to add the
-	 * property after those tags.
+	 * Skip possible unknown tags and metadata tags related to the node in
+	 * order to add the property after those tags.
 	 */
-	nextoffset = fdt_node_skip_unknown_tags(fdt, nextoffset);
+	nextoffset = fdt_node_skip_unknown_and_metadata_tags(fdt, nextoffset);
 	if (nextoffset < 0)
 		return nextoffset;
 
@@ -453,6 +498,12 @@ int fdt_appendprop(void *fdt, int nodeoffset, const char *name,
 		if (err)
 			return err;
 
+		/*
+		 * We append data to the property. If known metadata tags are
+		 * present, they are related to existing data and not impacted
+		 * by data added. No need to remove them.
+		 */
+
 		newlen = len + oldlen;
 		err = fdt_splice_struct_(fdt, prop->data,
 					 FDT_TAGALIGN(oldlen),
@@ -484,11 +535,16 @@ int fdt_delprop(void *fdt, int nodeoffset, const char *name)
 	if (!prop)
 		return len;
 
+	/* The property is going to be removed. Remove its metadata tags */
+	prop_offset = fdt_ptr_offset_(fdt, prop);
+	err = fdt_prop_remove_metadata_tags(fdt, false, prop_offset);
+	if (err)
+		return err;
+
 	/*
-	 * The property is going to be removed. Remove also possible unknown
-	 * tags related to this property. Keep the dtb version unchanged.
+	 * Remove also possible unknown tags related to this property.
+	 * Keep the dtb version unchanged.
 	 */
-	prop_offset = fdt_ptr_offset_(fdt, prop);
 	err = fdt_prop_remove_unknown_tags(fdt, false, prop_offset, false);
 	if (err)
 		return err;
@@ -522,10 +578,15 @@ int fdt_add_subnode_namelen(void *fdt, int parentoffset,
 		return offset;
 
 	/*
-	 * Try to place the new node after the parent's properties and unknown
-	 * tags related to those properties.
-	 * Unknown tags are reported as FDT_NOP tags by fdt_next_tag.
-	 * Skipping FDT_NOP tags will correctly skip unknown tags.
+	 * Try to place the new node after:
+	 *  - the parent's properties
+	 *  - the metadata tags related to those properties
+	 *  - unknown tags related to those properties.
+	 * Unknown tags are reported as FDT_NOP tags by fdt_next_tag_filter.
+	 * metadata tags are also reported as FDT_NOP by fdt_next_tag_filter
+	 * thanks to the filter function used.
+	 * Skipping FDT_NOP tags will correctly skip unknown tags and metadata
+	 * tags.
 	 */
 	tag = fdt_next_tag(fdt, parentoffset, &nextoffset);
 	/* the fdt_subnode_offset_namelen() should ensure this never hits */
@@ -533,7 +594,8 @@ int fdt_add_subnode_namelen(void *fdt, int parentoffset,
 		return -FDT_ERR_INTERNAL;
 	do {
 		offset = nextoffset;
-		tag = fdt_next_tag(fdt, offset, &nextoffset);
+		tag = fdt_next_tag_filter(fdt, offset, &nextoffset,
+					  fdt_tag_filter_skip_metadata, NULL);
 	} while ((tag == FDT_PROP) || (tag == FDT_NOP));
 
 	nh = fdt_offset_ptr_w_(fdt, offset);
diff --git a/libfdt/fdt_wip.c b/libfdt/fdt_wip.c
index 7ca3ffbc..b2f9f8d1 100644
--- a/libfdt/fdt_wip.c
+++ b/libfdt/fdt_wip.c
@@ -31,6 +31,17 @@ int fdt_setprop_inplace_namelen_partial(void *fdt, int nodeoffset,
 	if ((unsigned)proplen < (len + idx))
 		return -FDT_ERR_NOSPACE;
 
+	if (idx < (unsigned)proplen) {
+		/*
+		 * The property existing data are going to be modified.
+		 * The property metadata tags are related to the property
+		 * data. Remove them.
+		 */
+		err = fdt_prop_remove_metadata_tags(fdt, true, prop_offset);
+		if (err)
+			return err;
+	}
+
 	/*
 	 * Remove unknown tags related to the property downgrading the dtb
 	 * version.
@@ -81,10 +92,18 @@ int fdt_nop_property(void *fdt, int nodeoffset, const char *name)
 		return len;
 
 	/*
-	 * The property is going to be removed (nopified). Remove unknown tags
-	 * related to this property. Keep the dtb version unchanged.
+	 * The property is going to be removed (nopified). Remove its metadata
+	 * tags
 	 */
 	prop_offset = fdt_ptr_offset_(fdt, prop);
+	err = fdt_prop_remove_metadata_tags(fdt, true, prop_offset);
+	if (err)
+		return err;
+
+	/*
+	 * Remove also possible unknown tags related to this property.
+	 * Keep the dtb version unchanged.
+	 */
 	err = fdt_prop_remove_unknown_tags(fdt, true, prop_offset, false);
 	if (err)
 		return err;
diff --git a/libfdt/libfdt_internal.h b/libfdt/libfdt_internal.h
index d4154119..47dfc0d4 100644
--- a/libfdt/libfdt_internal.h
+++ b/libfdt/libfdt_internal.h
@@ -23,6 +23,14 @@ int32_t fdt_ro_probe_(const void *fdt);
 uint32_t fdt_next_tag_(const void *fdt, int startoffset, int *nextoffset,
 		       bool *is_unknown);
 
+uint32_t fdt_next_tag_filter(const void *fdt, int offset, int *nextoffset,
+			     bool (*tag_filter)(void *priv, uint32_t tag),
+			     void *priv);
+
+bool fdt_tag_filter_skip_metadata(void *data, uint32_t tag);
+
+bool fdt_tag_is_property_metadata(uint32_t tag);
+
 int fdt_get_structured_tag_data(uint32_t tag, const void *fdt, int offset,
 				uint32_t *data_len);
 
@@ -31,6 +39,8 @@ int fdt_check_prop_offset_(const void *fdt, int offset);
 
 int fdt_prop_remove_unknown_tags(void *fdt, bool force_inplace,
 				 int prop_offset, bool downgrade_version);
+int fdt_prop_remove_metadata_tags(void *fdt, bool force_inplace,
+				  int prop_offset);
 
 int fdt_getprop_offset_namelen(const void *fdt, int nodeoffset,
 			       const char *name, int namelen);
-- 
2.55.0

