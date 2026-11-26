Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692291;
	b=lFFpqCUlGXXnVKiy40qBDPqRdqhNEwp0keV+dYfc7VjPb9OeRd3BXOsABNXOTW+yMmlJ
	 gyb+nDYisajWfthEX/rEr+OC9rXdNu6DNaOmI0rXy+VNMQsRCZPGfuuShDPfgsw9u2QV5
	 517AnOSTvaAyo6WELFc0h74XRxdeXxFxSOMvdtzTsA+KVA/bf3efGQ2tO7UpquaysnEKR
	 +Q2TFQtsyRD8E++E6MFsUoDlPiF16cw4wMQpSeoVqS0r5fw0lkBB/771Gtswc75o4uLll
	 qQg+kPBcAVoWtrjNRES1e9BVZOpX5vKMH43uRrlZj26cyFsYoK4CEO0XPISZkqpobUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692291;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=Zmxi3izWpU5P9zIGouh09jWIh5s5eRx4mEYSijOeY8E=;
	b=UADvX3JGPiSOH/Dol2hkC+Av6Yciq2BSNdQlwPOVGEkhVYO30FsvSO0swAewJ5oQBOb2
	 PTZzaTL1bOkG9Bcdmx70m0uMzPgOuTtP9VlzMGsfnMiQYMbj9SWXMP8SDQmLgNbYSmm6A
	 xYrrYue5FlBVAyZY7gWe12Zqx35tQZN6Wu2yT1cOBL1IPTLCbVSzOqpp+kNKrjw6QfKSs
	 Dsl+etMgx6HzimxPMHiF1fwr/yX3csE884eaiMlEYwzd2thmNnU5CdOQkNX0F2+BDqljs
	 fh+EjmsdcvH/tM+3/R0uwAzSXt10QjIApZCqW9pTKwIE0Pv91BYXW9YEH1TfpBezRxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=CzknH08A;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CEB660A262C;
	Thu, 26 Nov 2026 11:24:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CEB660A262C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=CzknH08A
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C92D21A1812;
	Thu, 26 Nov 2026 11:24:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9F9C260237;
	Thu, 26 Nov 2026 11:24:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 90E7411E6B363;
	Thu, 26 Nov 2026 12:24:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795692286; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Zmxi3izWpU5P9zIGouh09jWIh5s5eRx4mEYSijOeY8E=;
	b=CzknH08ALIbRYEzHFHEW/keOYPq72rFZihd8YgIE+DNvPAdeEsmA61fjPejxmFBxtQqtu3
	rspfEDq/7eCdarRVkCmHYLgmIlWy6N2JVVHOFtD4T/Q7Q6BNPCNcrf+Mds6/7Qyy9++qbu
	AT3Z+k6hqtO2yuBeV6j6cYx4j5JryLYbG8T6ZPO9t24G9GHzAn/ovY+dSwmiVgUB4HNAeI
	KiMm/1OYNIsLDKrd40xSh1F6VY+hSxcSMROee6Vag2NrNuSmvdt0l8lsJIMbeEYkAFbafo
	aouMQ4O2MVIFAmwl5bvIfFpiPywdUvZN6LTJ2nmSZPNG3XUjpQAwJ5N6QJ4lYw==
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
Subject: [PATCH v4 21/22] libfdt: Handle unknown tags on dtb modifications
Date: Thu, 26 Nov 2026 12:22:38 +0100
Message-ID: <20261126112239.636284-22-herve.codina@bootlin.com>
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

The structured tag value definition introduced recently gives the
ability to ignore unknown tags without any error.

When the dtb is modified, those unknown tags have to be taken into
account.

First, depending on the unknown tag location, the item associated with
the tag is identified:
  - An unknown tag located just after an FDT_BEGIN_NODE is related to
    the node.

  - An unknown tag located just after an FDT_PROP is related to the
    property.

  - An unknown tag outside any node (i.e. located before the first
    FDT_BEGIN_NODE or after the last FDT_END_NODE) is a global tag
    related to the dtb itself.

Then, when we perform modifications in a dtb containing unknown tags,
the following rules apply:

                       | existing prop | existing node (1) | Downgrade
                       | unknown tag   | unknown tag       | version (2)
 ----------------------+---------------+-------------------+-----------
 Modify a property (4) |    Remove     | Keep (3)          | Yes
 Add a property        |    NA         | Remove            | Yes
 Delete a property     |    Remove     | Remove            | Yes
 Add a sub-node        |    NA         | Remove            | Yes
 Delete a sub-node     |    NA         | Remove            | Yes
 ----------------------+---------------+-------------------+-----------

  (1) The existing node is the node where the property or sub-node
      involved is present. Not all nodes, not the parent node but the
      node directly impacted by the modification.

  (2) The version is always downgraded on any change (modification,
      addition, deletion of a property or a sub-node) even if no tags
      are removed.

  (3) Removing unknown tags in the node when a property is modified will
      change the property offset. Avoid this property offset change and
      so keep node related unknown tags in that case.

  (4) All property modifications done outside libfdt using the property
      data pointer directly will not lead to any unknown tag removal.
      Some libfdt API functions allow getting a pointer to property
      data. Property data modification using this pointer directly is
      considered a modification outside libfdt.

Implement those rules when a dtb is modified.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 libfdt/fdt.c             |  73 +++++++++++++++++
 libfdt/fdt_ro.c          |  12 +--
 libfdt/fdt_rw.c          | 173 ++++++++++++++++++++++++++++++++++++---
 libfdt/fdt_wip.c         | 115 +++++++++++++++++++++++---
 libfdt/libfdt_internal.h |  19 +++++
 tests/run_tests.sh       |  86 +++++++++++++++++++
 6 files changed, 451 insertions(+), 27 deletions(-)

diff --git a/libfdt/fdt.c b/libfdt/fdt.c
index 44bf0e26..cce37c23 100644
--- a/libfdt/fdt.c
+++ b/libfdt/fdt.c
@@ -296,6 +296,21 @@ uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
 	return tag;
 }
 
+static bool fdt_tag_is_unknown(uint32_t tag)
+{
+	switch (tag) {
+	case FDT_BEGIN_NODE:
+	case FDT_END_NODE:
+	case FDT_PROP:
+	case FDT_NOP:
+	case FDT_END:
+		return false;
+	default:
+		break;
+	}
+	return true;
+}
+
 int fdt_root_offset(const void *fdt)
 {
 	int nextoffset = 0;
@@ -455,3 +470,61 @@ int fdt_move(const void *fdt, void *buf, int bufsize)
 	memmove(buf, fdt, fdt_totalsize(fdt));
 	return 0;
 }
+
+void fdt_downgrade_version(void *fdt)
+{
+	/*
+	 * Don't use can_assume(LATEST) to conditionally perform the operation.
+	 *
+	 * The version must be downgraded if we encounter a future dtb not yet
+	 * known. In that case even if compiled with ASSUME_LATEST, this
+	 * future dtb proves that we are no more the latest version.
+	 */
+	if (fdt_version(fdt) > FDT_LAST_SUPPORTED_VERSION)
+		fdt_set_version(fdt, FDT_LAST_SUPPORTED_VERSION);
+}
+
+int fdt_remove_unknown_tags_at(void *fdt, int start_offset,
+			       int (*eraser)(void *fdt, int offset, int len))
+{
+	int nextoffset = start_offset;
+	uint32_t tag;
+	int offset;
+
+	/* Look at unknown tags starting at start_offset */
+	do {
+		offset = nextoffset;
+		tag = fdt_next_tag(fdt, offset, &nextoffset);
+		if (tag == FDT_END) {
+			/*
+			 * We can remove unknown tags after a node, FDT_END can
+			 * be found.
+			 */
+			return nextoffset < 0 ? nextoffset : 0;
+		}
+
+		/* Remove unknown tag */
+		if (FDT_TAG_IS_SKIPPABLE(tag) && fdt_tag_is_unknown(tag)) {
+			nextoffset = (*eraser)(fdt, offset, nextoffset - offset);
+			if (nextoffset < 0)
+				return nextoffset;
+		}
+
+	} while ((tag != FDT_PROP) && (tag != FDT_BEGIN_NODE) &&
+		 (tag != FDT_END_NODE));
+
+	return 0;
+}
+
+int fdt_remove_unknown_tags_after(void *fdt, int offset,
+				  int (*eraser)(void *fdt, int offset, int len))
+{
+	int nextoffset;
+	uint32_t tag;
+
+	tag = fdt_next_tag(fdt, offset, &nextoffset);
+	if (tag == FDT_END)
+		return nextoffset < 0 ? nextoffset : 0;
+
+	return fdt_remove_unknown_tags_at(fdt, nextoffset, eraser);
+}
diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
index 2cca6fd7..6fd44a45 100644
--- a/libfdt/fdt_ro.c
+++ b/libfdt/fdt_ro.c
@@ -415,12 +415,12 @@ const struct fdt_property *fdt_get_property_by_offset(const void *fdt,
 	return fdt_get_property_by_offset_(fdt, offset, lenp);
 }
 
-static const struct fdt_property *fdt_get_property_namelen_(const void *fdt,
-						            int offset,
-						            const char *name,
-						            int namelen,
-							    int *lenp,
-							    int *poffset)
+const struct fdt_property *fdt_get_property_namelen_(const void *fdt,
+						     int offset,
+						     const char *name,
+						     int namelen,
+						     int *lenp,
+						     int *poffset)
 {
 	for (offset = fdt_first_property_offset(fdt, offset);
 	     (offset >= 0);
diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
index ee1e94e6..110e27d9 100644
--- a/libfdt/fdt_rw.c
+++ b/libfdt/fdt_rw.c
@@ -22,12 +22,6 @@ static int fdt_blocks_misordered_(const void *fdt,
 		    (fdt_off_dt_strings(fdt) + fdt_size_dt_strings(fdt)));
 }
 
-static void fdt_downgrade_version(void *fdt)
-{
-	if (!can_assume(LATEST) && fdt_version(fdt) > FDT_LAST_SUPPORTED_VERSION)
-		fdt_set_version(fdt, FDT_LAST_SUPPORTED_VERSION);
-}
-
 static int fdt_rw_probe_(void *fdt)
 {
 	if (can_assume(VALID_DTB))
@@ -40,7 +34,6 @@ static int fdt_rw_probe_(void *fdt)
 				   fdt_size_dt_struct(fdt)))
 		return -FDT_ERR_BADLAYOUT;
 
-	fdt_downgrade_version(fdt);
 	return 0;
 }
 
@@ -197,10 +190,22 @@ int fdt_del_mem_rsv(void *fdt, int n)
 	return fdt_splice_mem_rsv_(fdt, re, 1, 0);
 }
 
+static int fdt_eraser_splice(void *fdt, int offset, int len)
+{
+	int err;
+
+	err = fdt_splice_struct_(fdt, fdt_offset_ptr_w_(fdt, offset), len, 0);
+	if (err)
+		return err;
+
+	return offset;
+}
+
 static int fdt_resize_property_(void *fdt, int nodeoffset,
 				const char *name, int namelen,
 				int len, struct fdt_property **prop)
 {
+	int prop_offset;
 	int oldlen;
 	int err;
 
@@ -209,6 +214,16 @@ static int fdt_resize_property_(void *fdt, int nodeoffset,
 	if (!*prop)
 		return oldlen;
 
+	/*
+	 * The property is going to be resized.
+	 * -> Remove unknown tags related to the property.
+	 *    Keep unknown tags related to the node.
+	 */
+	prop_offset = fdt_ptr_offset_(fdt, *prop);
+	err = fdt_remove_unknown_tags_after(fdt, prop_offset, fdt_eraser_splice);
+	if (err)
+		return err;
+
 	if ((err = fdt_splice_struct_(fdt, (*prop)->data, FDT_TAGALIGN(oldlen),
 				      FDT_TAGALIGN(len))))
 		return err;
@@ -223,12 +238,31 @@ static int fdt_add_property_(void *fdt, int nodeoffset, const char *name,
 	int proplen;
 	int nextoffset;
 	int namestroff;
+	int offset;
+	int tag;
 	int err;
 	int allocated;
 
 	if ((nextoffset = fdt_check_node_offset_(fdt, &nodeoffset)) < 0)
 		return nextoffset;
 
+	/*
+	 * A property is going to be added.
+	 * -> Remove unknown tags related to the node.
+	 */
+	err = fdt_remove_unknown_tags_at(fdt, nextoffset, fdt_eraser_splice);
+	if (err)
+		return err;
+
+	/* Skip possible FDT_NOP */
+	do {
+		offset = nextoffset;
+		tag = fdt_next_tag(fdt, offset, &nextoffset);
+		if (tag == FDT_END)
+			return nextoffset;
+	} while (tag == FDT_NOP);
+	nextoffset = offset;
+
 	namestroff = fdt_find_add_string_(fdt, name, namelen, &allocated);
 	if (namestroff < 0)
 		return namestroff;
@@ -300,6 +334,12 @@ int fdt_setprop_placeholder_namelen(void *fdt, int nodeoffset, const char *name,
 	if (FDT_TAGALIGN(ulen) > ulen)
 		memset(prop->data + ulen, 0, FDT_TAGALIGN(ulen) - ulen);
 	*prop_data = prop->data;
+
+	/*
+	 * An existing property has been resized or a new one has been added
+	 * -> Downgrade the version
+	 */
+	fdt_downgrade_version(fdt);
 	return 0;
 }
 
@@ -338,11 +378,23 @@ int fdt_appendprop(void *fdt, int nodeoffset, const char *name,
 {
 	struct fdt_property *prop;
 	int err, oldlen, newlen;
+	int prop_offset;
 
 	FDT_RW_PROBE(fdt);
 
 	prop = fdt_get_property_w(fdt, nodeoffset, name, &oldlen);
 	if (prop) {
+		/*
+		 * The property is going to be modified.
+		 * -> Remove unknown tags related to the property
+		 *    Keep unknown tags related to the node.
+		 */
+		prop_offset = fdt_ptr_offset_(fdt, prop);
+		err = fdt_remove_unknown_tags_after(fdt, prop_offset,
+						    fdt_eraser_splice);
+		if (err)
+			return err;
+
 		newlen = len + oldlen;
 		err = fdt_splice_struct_(fdt, prop->data,
 					 FDT_TAGALIGN(oldlen),
@@ -360,6 +412,12 @@ int fdt_appendprop(void *fdt, int nodeoffset, const char *name,
 		memcpy(prop->data, val, len);
 		memset(prop->data + len, 0, FDT_TAGALIGN(len) - len);
 	}
+
+	/*
+	 * An existing property has been modified or a new one has been added
+	 * -> Downgrade the version
+	 */
+	fdt_downgrade_version(fdt);
 	return 0;
 }
 
@@ -367,15 +425,45 @@ int fdt_delprop(void *fdt, int nodeoffset, const char *name)
 {
 	struct fdt_property *prop;
 	int len, proplen;
+	int prop_offset;
+	int nextoffset;
+	int err;
 
 	FDT_RW_PROBE(fdt);
 
+	/*
+	 * A property is going to be removed.
+	 * -> Remove unknown tags related to the node.
+	 */
+	nextoffset = fdt_check_node_offset_(fdt, &nodeoffset);
+	if (nextoffset < 0)
+		return nextoffset;
+
+	err = fdt_remove_unknown_tags_at(fdt, nextoffset, fdt_eraser_splice);
+	if (err)
+		return err;
+
 	prop = fdt_get_property_w(fdt, nodeoffset, name, &len);
 	if (!prop)
 		return len;
 
+	/*
+	 * The property is going to be removed.
+	 * -> Remove unknown tags related to the property.
+	 */
+	prop_offset = fdt_ptr_offset_(fdt, prop);
+	err = fdt_remove_unknown_tags_after(fdt, prop_offset, fdt_eraser_splice);
+	if (err)
+		return err;
+
 	proplen = sizeof(*prop) + FDT_TAGALIGN(len);
-	return fdt_splice_struct_(fdt, prop, proplen, 0);
+	err = fdt_splice_struct_(fdt, prop, proplen, 0);
+	if (err)
+		return err;
+
+	/* The property has been deleted -> Downgrade the version */
+	fdt_downgrade_version(fdt);
+	return 0;
 }
 
 int fdt_add_subnode_namelen(void *fdt, int parentoffset,
@@ -402,7 +490,20 @@ int fdt_add_subnode_namelen(void *fdt, int parentoffset,
 	else if (offset != -FDT_ERR_NOTFOUND)
 		return offset;
 
-	/* Try to place the new node after the parent's properties */
+	/*
+	 * A sub-node is going to be added
+	 * -> Remove unknown tags related to the parent node
+	 */
+	err = fdt_remove_unknown_tags_after(fdt, parentoffset,
+					    fdt_eraser_splice);
+	if (err)
+		return err;
+
+	/*
+	 * Try to place the new node after the parent's properties and unknown
+	 * tags related to those properties. In other words, before the first
+	 * subnode or before the end of node if no subnodes are already present.
+	 */
 	tag = fdt_next_tag(fdt, parentoffset, &nextoffset);
 	/* the fdt_subnode_offset_namelen() should ensure this never hits */
 	if (!can_assume(LIBFDT_FLAWLESS) && (tag != FDT_BEGIN_NODE))
@@ -410,7 +511,9 @@ int fdt_add_subnode_namelen(void *fdt, int parentoffset,
 	do {
 		offset = nextoffset;
 		tag = fdt_next_tag(fdt, offset, &nextoffset);
-	} while ((tag == FDT_PROP) || (tag == FDT_NOP));
+		if (tag == FDT_END)
+			return -FDT_ERR_BADSTRUCTURE;
+	} while ((tag != FDT_BEGIN_NODE) && (tag != FDT_END_NODE));
 
 	nh = fdt_offset_ptr_w_(fdt, offset);
 	nodelen = sizeof(*nh) + FDT_TAGALIGN(namelen+1) + FDT_TAGSIZE;
@@ -425,6 +528,8 @@ int fdt_add_subnode_namelen(void *fdt, int parentoffset,
 	endtag = (fdt32_t *)((char *)nh + nodelen - FDT_TAGSIZE);
 	*endtag = cpu_to_fdt32(FDT_END_NODE);
 
+	/* A node has been added -> Downgrade version */
+	fdt_downgrade_version(fdt);
 	return offset;
 }
 
@@ -435,16 +540,62 @@ int fdt_add_subnode(void *fdt, int parentoffset, const char *name)
 
 int fdt_del_node(void *fdt, int nodeoffset)
 {
+	int parentoffset, rootoffset;
 	int endoffset;
+	int err;
 
 	FDT_RW_PROBE(fdt);
 
+	rootoffset = fdt_root_offset(fdt);
+	if (rootoffset < 0)
+		return rootoffset;
+
+	if (nodeoffset == 0 || nodeoffset == rootoffset) {
+		/* We are going to remove the root node */
+		parentoffset = -1;
+	} else {
+		parentoffset = fdt_parent_offset(fdt, nodeoffset);
+		if (parentoffset < 0)
+			return parentoffset;
+	}
+
 	endoffset = fdt_node_end_offset_(fdt, nodeoffset);
 	if (endoffset < 0)
 		return endoffset;
 
-	return fdt_splice_struct_(fdt, fdt_offset_ptr_w_(fdt, nodeoffset),
+	err = fdt_splice_struct_(fdt, fdt_offset_ptr_w_(fdt, nodeoffset),
 				  endoffset - nodeoffset, 0);
+	if (err)
+		return err;
+
+	/*
+	 * Unknown tags can be present after the node deleted. Even if those
+	 * tags should not be there, nothing prevent them to be physically
+	 * there.
+	 *
+	 * In order to avoid them to be attached to any items (either a
+	 * property, an other sub-node or the parent node itself) available
+	 * before this deleted node. Remove them and downgrade the version
+	 */
+	err = fdt_remove_unknown_tags_at(fdt, nodeoffset, fdt_eraser_splice);
+	if (err)
+		return err;
+
+	/*
+	 * A node has been deleted
+	 * -> Remove parent node unknown tags if the node deleted was not the
+	 *    root node.
+	 */
+	if (parentoffset != -1) {
+		err = fdt_remove_unknown_tags_after(fdt, parentoffset,
+						    fdt_eraser_splice);
+		if (err)
+			return err;
+	}
+
+	/* A node has been deleted -> Downgrade version */
+	fdt_downgrade_version(fdt);
+	return 0;
 }
 
 static void fdt_packblocks_(const char *old, char *new,
diff --git a/libfdt/fdt_wip.c b/libfdt/fdt_wip.c
index dd163d91..5da955f4 100644
--- a/libfdt/fdt_wip.c
+++ b/libfdt/fdt_wip.c
@@ -10,16 +10,38 @@
 
 #include "libfdt_internal.h"
 
+static void fdt_nop_region_(void *start, int len)
+{
+	fdt32_t *p;
+
+	for (p = start; (char *)p < ((char *)start + len); p++)
+		*p = cpu_to_fdt32(FDT_NOP);
+}
+
+static int fdt_eraser_nopify(void *fdt, int offset, int len)
+{
+	fdt_nop_region_(fdt_offset_ptr_w_(fdt, offset), len);
+
+	return offset + len;
+}
+
 int fdt_setprop_inplace_namelen_partial(void *fdt, int nodeoffset,
 					const char *name, int namelen,
 					uint32_t idx, const void *val,
 					int len)
 {
+	const struct fdt_property *property;
+	int prop_offset;
 	void *propval;
 	int proplen;
+	int err;
+
+	property = fdt_get_property_namelen_(fdt, nodeoffset, name, namelen,
+					     &proplen, &prop_offset);
+	if (!property)
+		return proplen;
 
-	propval = fdt_getprop_namelen_w(fdt, nodeoffset, name, namelen,
-					&proplen);
+	propval = fdt_getprop_by_offset_w(fdt, prop_offset, NULL, &proplen);
 	if (!propval)
 		return proplen;
 
@@ -31,7 +53,19 @@ int fdt_setprop_inplace_namelen_partial(void *fdt, int nodeoffset,
 	if (idx > (unsigned)proplen || (unsigned)len > (unsigned)proplen - idx)
 		return -FDT_ERR_NOSPACE;
 
+	/*
+	 * The property is going to be modified.
+	 * -> Remove unknown tags related to the property.
+	 *    Keep unknown tags related to the node.
+	 */
+	err = fdt_remove_unknown_tags_after(fdt, prop_offset, fdt_eraser_nopify);
+	if (err)
+		return err;
+
 	memcpy((char *)propval + idx, val, len);
+
+	/* The property has been modified -> Downgrade the version */
+	fdt_downgrade_version(fdt);
 	return 0;
 }
 
@@ -53,25 +87,43 @@ int fdt_setprop_inplace(void *fdt, int nodeoffset, const char *name,
 						   val, len);
 }
 
-static void fdt_nop_region_(void *start, int len)
-{
-	fdt32_t *p;
-
-	for (p = start; (char *)p < ((char *)start + len); p++)
-		*p = cpu_to_fdt32(FDT_NOP);
-}
-
 int fdt_nop_property(void *fdt, int nodeoffset, const char *name)
 {
 	struct fdt_property *prop;
+	int prop_offset;
+	int nextoffset;
 	int len;
+	int err;
+
+	/*
+	 * A property is going to be removed (nopified).
+	 * -> Remove unknown tags related to the node.
+	 */
+	nextoffset = fdt_check_node_offset_(fdt, &nodeoffset);
+	if (nextoffset < 0)
+		return nextoffset;
+
+	err = fdt_remove_unknown_tags_at(fdt, nextoffset, fdt_eraser_nopify);
+	if (err)
+		return err;
 
 	prop = fdt_get_property_w(fdt, nodeoffset, name, &len);
 	if (!prop)
 		return len;
 
+	/*
+	 * The property is going to be removed (nopified).
+	 * -> Remove unknown tags related to the property
+	 */
+	prop_offset = fdt_ptr_offset_(fdt, prop);
+	err = fdt_remove_unknown_tags_after(fdt, prop_offset, fdt_eraser_nopify);
+	if (err)
+		return err;
+
 	fdt_nop_region_(prop, len + sizeof(*prop));
 
+	/* The property has been removed -> Downgrade the version */
+	fdt_downgrade_version(fdt);
 	return 0;
 }
 
@@ -87,7 +139,22 @@ int fdt_node_end_offset_(void *fdt, int offset)
 
 int fdt_nop_node(void *fdt, int nodeoffset)
 {
+	int parentoffset, rootoffset;
 	int endoffset;
+	int err;
+
+	rootoffset = fdt_root_offset(fdt);
+	if (rootoffset < 0)
+		return rootoffset;
+
+	if (nodeoffset == 0 || nodeoffset == rootoffset) {
+		/* We are going to remove the root node */
+		parentoffset = -1;
+	} else {
+		parentoffset = fdt_parent_offset(fdt, nodeoffset);
+		if (parentoffset < 0)
+			return parentoffset;
+	}
 
 	endoffset = fdt_node_end_offset_(fdt, nodeoffset);
 	if (endoffset < 0)
@@ -95,5 +162,33 @@ int fdt_nop_node(void *fdt, int nodeoffset)
 
 	fdt_nop_region_(fdt_offset_ptr_w(fdt, nodeoffset, 0),
 			endoffset - nodeoffset);
+
+	/*
+	 * Unknown tags can be present after the node deleted. Even if those
+	 * tags should not be there, nothing prevent them to be physically
+	 * there.
+	 *
+	 * In order to avoid them to be attached to any items (either a
+	 * property, an other sub-node or the parent node itself) available
+	 * before this deleted node. Remove them and downgrade the version
+	 */
+	err = fdt_remove_unknown_tags_at(fdt, endoffset, fdt_eraser_nopify);
+	if (err)
+		return err;
+
+	/*
+	 * A node has been deleted
+	 * -> Remove parent node unknown tags if the node deleted was not the
+	 *    root node.
+	 */
+	if (parentoffset != -1) {
+		err = fdt_remove_unknown_tags_after(fdt, parentoffset,
+						    fdt_eraser_nopify);
+		if (err)
+			return err;
+	}
+
+	/* The node has been removed -> Downgrade the version */
+	fdt_downgrade_version(fdt);
 	return 0;
 }
diff --git a/libfdt/libfdt_internal.h b/libfdt/libfdt_internal.h
index 83e296b1..eafad714 100644
--- a/libfdt/libfdt_internal.h
+++ b/libfdt/libfdt_internal.h
@@ -23,6 +23,25 @@ int32_t fdt_ro_probe_(const void *fdt);
 int fdt_check_node_offset_(const void *fdt, int *offset);
 int fdt_check_prop_offset_(const void *fdt, int offset);
 
+const struct fdt_property *fdt_get_property_namelen_(const void *fdt,
+						     int offset,
+						     const char *name,
+						     int namelen,
+						     int *lenp,
+						     int *poffset);
+
+/*
+ * The 'eraser' have to erase the area of length @len starting at the given
+ * @offset. It must returns the offset pointing right after the area erased.
+ * or a negative error code value.
+ */
+int fdt_remove_unknown_tags_at(void *fdt, int offset,
+			       int (*eraser)(void *fdt, int offset, int len));
+int fdt_remove_unknown_tags_after(void *fdt, int offset,
+			       int (*eraser)(void *fdt, int offset, int len));
+
+void fdt_downgrade_version(void *fdt);
+
 const char *fdt_find_string_len_(const char *strtab, int tabsize, const char *s,
 				 int s_len);
 static inline const char *fdt_find_string_(const char *strtab, int tabsize,
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 06f6188a..431d45b8 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -655,6 +655,43 @@ libfdt_tests () {
         run_test check_full unknown_tags_rw_${n}_propnew_added.dtb
         run_test check_full unknown_tags_rw_${n}_subnodenew_added.dtb
     done
+
+    dtb=unknown_tags_can_skip.wip.test.dtb
+    for n in "node1" "node2" "node3" "node4" "node5" "node6" "node7" "node8"; do
+        if [ "$n" != "node8" ]; then # node8 is a subnodes-only node
+            for p in "prop1" "prop2" "prop3"; do
+                # write-in-place could support reducing a property data by
+                # replacing existing data with padding bytes and/or, once
+                # alignment is reached, using FDT_NOPs.
+                #
+                # cp unknown_tags_can_skip.dtb $dtb
+                # run_test wip_func $dtb set_prop /$n $p 0 "ab"
+                # run_test dtbs_equal_ordered $dtb unknown_tags_wip_${n}_${p}_modified_ab.dtb
+                #
+                # cp unknown_tags_can_skip.dtb $dtb
+                # run_test wip_func $dtb set_prop /$n $p 0 "abcdefgh"
+                # run_test dtbs_equal_ordered $dtb unknown_tags_wip_${n}_${p}_modified_abcdefgh.dtb
+                #
+                # Also, those expected dtbs are not generated
+
+                cp unknown_tags_can_skip.dtb $dtb
+                run_test wip_func $dtb set_prop /$n $p 0 "abcdefghi"
+                run_test dtbs_equal_ordered --noskip-nop $dtb unknown_tags_wip_${n}_${p}_modified_abcdefghi.dtb
+
+                cp unknown_tags_can_skip.dtb $dtb
+                run_test wip_func $dtb nop_prop /$n $p
+                run_test dtbs_equal_ordered --noskip-nop $dtb unknown_tags_wip_${n}_${p}_removed.dtb
+            done
+        fi
+
+        if [ "$n" != "node7" ]; then # node7 is a properties-only node
+            for sn in "subnode1" "subnode2" "subnode3"; do
+                cp unknown_tags_can_skip.dtb $dtb
+                run_test wip_func $dtb nop_node /$n/$sn
+                run_test dtbs_equal_ordered --noskip-nop $dtb unknown_tags_wip_${n}_${sn}_removed.dtb
+            done
+        fi
+    done
 }
 
 dtc_tests () {
@@ -1190,6 +1227,55 @@ fdtput_tests () {
 	$DTPUT $dtb -d /chosen non-existent-prop
 
     # TODO: Add tests for verbose mode?
+
+    dtb=unknown_tags_can_skip.fdtput.test.dtb
+    for n in "node1" "node2" "node3" "node4" "node5" "node6" "node7" "node8" "node9"; do
+         # node8 is a subnodes-only node, node9 is an empty node
+        if [ "$n" != "node8" ] && [ "$n" != "node9" ]; then
+            for p in "prop1" "prop2" "prop3"; do
+                cp unknown_tags_can_skip.dtb $dtb
+                run_wrap_test $DTPUT $dtb -ts /$n $p "ab"
+                run_test dtbs_equal_ordered --noskip-nop $dtb unknown_tags_rw_${n}_${p}_modified_ab.dtb
+
+                cp unknown_tags_can_skip.dtb $dtb
+                run_wrap_test $DTPUT $dtb -ts /$n $p "abcdefgh"
+                run_test dtbs_equal_ordered --noskip-nop $dtb unknown_tags_rw_${n}_${p}_modified_abcdefgh.dtb
+
+                cp unknown_tags_can_skip.dtb $dtb
+                run_wrap_test $DTPUT $dtb -ts /$n $p "abcdefghi"
+                run_test dtbs_equal_ordered --noskip-nop $dtb unknown_tags_rw_${n}_${p}_modified_abcdefghi.dtb
+
+                cp unknown_tags_can_skip.dtb $dtb
+                run_wrap_test $DTPUT $dtb -ts /$n $p "abcdefghij"
+                run_test dtbs_equal_ordered --noskip-nop $dtb unknown_tags_rw_${n}_${p}_modified_abcdefghij.dtb
+
+                cp unknown_tags_can_skip.dtb $dtb
+                run_wrap_test $DTPUT $dtb -ts /$n $p "abcdefghijklmnop"
+                run_test dtbs_equal_ordered --noskip-nop $dtb unknown_tags_rw_${n}_${p}_modified_abcdefghijklmnop.dtb
+
+                cp unknown_tags_can_skip.dtb $dtb
+                run_wrap_test $DTPUT $dtb -d /$n $p
+                run_test dtbs_equal_ordered --noskip-nop $dtb unknown_tags_rw_${n}_${p}_removed.dtb
+            done
+        fi
+
+        # node7 is a properties-only node, node9 is an empty node
+        if [ "$n" != "node7" ] && [ "$n" != "node9" ]; then
+            for sn in "subnode1" "subnode2" "subnode3"; do
+                cp unknown_tags_can_skip.dtb $dtb
+                run_wrap_test $DTPUT $dtb -r /$n/$sn
+                run_test dtbs_equal_ordered --noskip-nop $dtb unknown_tags_rw_${n}_${sn}_removed.dtb
+            done
+        fi
+
+        cp unknown_tags_can_skip.dtb $dtb
+        run_wrap_test $DTPUT $dtb -ts /$n propnew "added"
+        run_test dtbs_equal_ordered --noskip-nop $dtb unknown_tags_rw_${n}_propnew_added.dtb
+
+        cp unknown_tags_can_skip.dtb $dtb
+        run_wrap_test $DTPUT $dtb -c /$n/subnodenew
+        run_test dtbs_equal_ordered --noskip-nop $dtb unknown_tags_rw_${n}_subnodenew_added.dtb
+    done
 }
 
 utilfdt_tests () {
-- 
2.56.1

