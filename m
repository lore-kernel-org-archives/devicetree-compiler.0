Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692197;
	b=Ahdw8NEx04z3usDdHybT2QrWsHnVXybRrMWxiaFUTe+ICG+6rIEIZ3iRFprgPN6SQJoi
	 MKkyp4jlqMvg6rjcrG4ZaGlWco7kH9DUlYEKo+p9g3beyVOLWsykxLKfO/mCWOsbN1tH6
	 GEhrQ2VflQLGPhfE7PMCy7+y0twmKyItl48E3mVSZEgOvDS6Mf6J6psfq3lOuzRNUYSeI
	 S0CHba5M5QmE7Ej4AoKorWbeU3RsKpnplAdr5AFpAA/OLBvHkcYo5dGswiu29vYVgQNqq
	 aVuNLim3G2/BKaTaEOgWlelWa/IxFkqyMJdugXyL3gSmjS7MimuBESX1p/mDKmmIP0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692197;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=4czkjQp1yb4FQmISqfXg0AHOdrF4VgNaliAeYiiFirM=;
	b=SKLbonm6PZk1DUvSctU3wcmOm5+9dia6vYB9u2k8JBzNSxnW5rpyBJksiWChhY6yPcDo
	 d/8Jqsd9xO5jyx4VkoOXPTeMz8YJZHOeHWPPoec4gHLQRhovNIiuyH0uKgCJXQSakARXN
	 fyQFOtzZPbuMvjVTYtul1JqlYlp0XgK42T043R1yokDG2Hi5a6zResG3JbQ55qe2DoYcM
	 bhp+WyLEs+L+flKoATwyvcGMTV+7Wom8oESCYWtCln3qy5Seb6zlBsRijWA3QvmBGquUD
	 ohFD4Czh8Oa/ISzlU5UyPsO9J2J+SEhyShsKO3PHDxHWbtiu7Np8CxfDeXOh1IhciOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=glz6r9aN;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA3C606A6A8;
	Thu, 26 Nov 2026 11:23:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBA3C606A6A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=glz6r9aN
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 901A61A1808;
	Thu, 26 Nov 2026 11:23:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5E10060237;
	Thu, 26 Nov 2026 11:23:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 70E8811E6B324;
	Thu, 26 Nov 2026 12:23:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795692193; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4czkjQp1yb4FQmISqfXg0AHOdrF4VgNaliAeYiiFirM=;
	b=glz6r9aNXNyu3Nyt2zAPccT9CPBqx66ue77xuWU2ce6pTl1HD2zmYAFqwMx4rIqKGt40X2
	9lslQ9weSuMqaYBQzbLY9v8Slf7x3tp05+kNqPrW5YrRGn0kpWxLSZoPatNyMhUKMTrIK6
	PPIwb7HshfafRuJO1UJJlLGVykfh8GK/dLwSzhBJN+y8n198c7O0YkEyCjjuUuBCa9+07f
	CYy014NSCa5HuZKbgdzz93AQVS7yWRz1j1X1IolnXNmOOgZ43pm6iKPsZO2jLSeKfeU0bW
	lUlDNoAwFLu5WIQFUVdoMHRyta+mVbC9FHLySRNn0K10TKoA/EQDfAAHqeCdPA==
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
Subject: [PATCH v4 01/22] libfdt: Don't assume the root node is available at offset 0
Date: Thu, 26 Nov 2026 12:22:18 +0100
Message-ID: <20261126112239.636284-2-herve.codina@bootlin.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

In several places, libfdt assumes that the root offset (i.e. the first
FDT_BEGIN_NODE tag) is present at offset 0 of the structure block.

This assumption is not correct. An FDT_NOP tag can be present at offset
0 and this is a legitimate case. Indeed, the device-tree specification
[0] defines the FDT_NOP tag as follows:

   The FDT_NOP token will be ignored by any program parsing the device
   tree. This token has no extra data; so it is followed immediately by
   the next token, which can be any valid token. A property or node
   definition in the tree can be overwritten with FDT_NOP tokens to
   remove it from the tree without needing to move other sections of
   the tree’s representation in the devicetree blob.

Nothing specifies a location for this tag, so it has to be simply
ignored. Having this tag at offset 0 doesn't make an exception; the tag
has to be ignored.

Introduce fdt_root_offset() in order to get the offset of the root node
(first FDT_BEGIN_NODE tag) available in an FDT blob taking care of
FDT_NOP tags.

Use this function to get the root node offset instead of looking for
this node at offset 0.

[0] https://github.com/devicetree-org/devicetree-specification/blob/main/source/chapter5-flattened-format.rst?plain=1#L317

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 libfdt/fdt.c             | 43 ++++++++++++++++++++++---
 libfdt/fdt_ro.c          | 69 ++++++++++++++++++++++++++++++----------
 libfdt/fdt_rw.c          |  8 ++++-
 libfdt/libfdt.h          | 15 ++++++++-
 libfdt/libfdt_internal.h |  2 +-
 libfdt/version.lds       |  1 +
 6 files changed, 113 insertions(+), 25 deletions(-)

diff --git a/libfdt/fdt.c b/libfdt/fdt.c
index c7cedfba..a5ec7f95 100644
--- a/libfdt/fdt.c
+++ b/libfdt/fdt.c
@@ -253,16 +253,49 @@ uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
 	return tag;
 }
 
-int fdt_check_node_offset_(const void *fdt, int offset)
+int fdt_root_offset(const void *fdt)
 {
+	int nextoffset = 0;
+	int offset;
+	uint32_t tag;
+
+	do {
+		offset = nextoffset;
+		tag = fdt_next_tag(fdt, offset, &nextoffset);
+		switch (tag) {
+		case FDT_END_NODE:
+		case FDT_PROP:
+			return -FDT_ERR_BADSTRUCTURE;
+
+		case FDT_BEGIN_NODE:
+			return offset;
+
+		default:
+			break;
+		}
+	} while (tag != FDT_END);
+
+	return (nextoffset < 0) ? nextoffset : -FDT_ERR_BADSTRUCTURE;
+}
+
+int fdt_check_node_offset_(const void *fdt, int *offset)
+{
+	int nextoffset;
+
 	if (!can_assume(VALID_INPUT)
-	    && ((offset < 0) || (offset % FDT_TAGSIZE)))
+	    && ((*offset < 0) || (*offset % FDT_TAGSIZE)))
 		return -FDT_ERR_BADOFFSET;
 
-	if (fdt_next_tag(fdt, offset, &offset) != FDT_BEGIN_NODE)
+	if (*offset == 0) {
+		*offset = fdt_root_offset(fdt);
+		if (*offset < 0)
+			return *offset;
+	}
+
+	if (fdt_next_tag(fdt, *offset, &nextoffset) != FDT_BEGIN_NODE)
 		return -FDT_ERR_BADOFFSET;
 
-	return offset;
+	return nextoffset;
 }
 
 int fdt_check_prop_offset_(const void *fdt, int offset)
@@ -283,7 +316,7 @@ int fdt_next_node(const void *fdt, int offset, int *depth)
 	uint32_t tag;
 
 	if (offset >= 0)
-		if ((nextoffset = fdt_check_node_offset_(fdt, offset)) < 0)
+		if ((nextoffset = fdt_check_node_offset_(fdt, &offset)) < 0)
 			return nextoffset;
 
 	do {
diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
index 05903e39..1a4b3aec 100644
--- a/libfdt/fdt_ro.c
+++ b/libfdt/fdt_ro.c
@@ -291,7 +291,7 @@ int fdt_path_offset_namelen(const void *fdt, const char *path, int namelen)
 		while (*p == '/') {
 			p++;
 			if (p == end)
-				return offset;
+				goto terminate;
 		}
 		q = memchr(p, '/', end - p);
 		if (! q)
@@ -304,7 +304,13 @@ int fdt_path_offset_namelen(const void *fdt, const char *path, int namelen)
 		p = q;
 	}
 
-	return offset;
+terminate:
+	/*
+	 * Return a single canonical offset for the root node: if the path
+	 * resolved to offset 0 but the blob has FDT_NOP tags before the root,
+	 * report the real root offset instead.
+	 */
+	return offset ? offset : fdt_root_offset(fdt);
 }
 
 int fdt_path_offset(const void *fdt, const char *path)
@@ -314,14 +320,17 @@ int fdt_path_offset(const void *fdt, const char *path)
 
 const char *fdt_get_name(const void *fdt, int nodeoffset, int *len)
 {
-	const struct fdt_node_header *nh = fdt_offset_ptr_(fdt, nodeoffset);
+	const struct fdt_node_header *nh;
 	const char *nameptr;
 	int err;
 
-	if (!can_assume(VALID_DTB) && (((err = fdt_ro_probe_(fdt)) < 0)
-	    || ((err = fdt_check_node_offset_(fdt, nodeoffset)) < 0)))
-			goto fail;
+	if (!can_assume(VALID_DTB) && (err = fdt_ro_probe_(fdt)) < 0)
+		goto fail;
+
+	if ((err = fdt_check_node_offset_(fdt, &nodeoffset)) < 0)
+		goto fail;
 
+	nh = fdt_offset_ptr_(fdt, nodeoffset);
 	nameptr = nh->name;
 
 	if (!can_assume(LATEST) && fdt_version(fdt) < 0x10) {
@@ -354,7 +363,7 @@ int fdt_first_property_offset(const void *fdt, int nodeoffset)
 {
 	int offset;
 
-	if ((offset = fdt_check_node_offset_(fdt, nodeoffset)) < 0)
+	if ((offset = fdt_check_node_offset_(fdt, &nodeoffset)) < 0)
 		return offset;
 
 	return nextprop_(fdt, offset);
@@ -584,6 +593,7 @@ int fdt_get_path(const void *fdt, int nodeoffset, char *buf, int buflen)
 {
 	int pdepth = 0, p = 0;
 	int offset, depth, namelen, err;
+	int root_offset;
 	const char *name;
 
 	FDT_RO_PROBE(fdt);
@@ -592,10 +602,17 @@ int fdt_get_path(const void *fdt, int nodeoffset, char *buf, int buflen)
 		return -FDT_ERR_NOSPACE;
 
 	if (!can_assume(VALID_INPUT)
-	    && ((err = fdt_check_node_offset_(fdt, nodeoffset)) < 0))
+	    && ((err = fdt_check_node_offset_(fdt, &nodeoffset)) < 0))
 		return err;
 
-	for (offset = 0, depth = 0;
+	root_offset = fdt_root_offset(fdt);
+	if (root_offset < 0)
+		return root_offset;
+
+	if (!nodeoffset)
+		nodeoffset = root_offset;
+
+	for (offset = root_offset, depth = 0;
 	     (offset >= 0) && (depth >= 0) && (offset <= nodeoffset);
 	     offset = fdt_next_node(fdt, offset, &depth)) {
 		while (pdepth > depth) {
@@ -641,13 +658,21 @@ int fdt_supernode_atdepth_offset(const void *fdt, int nodeoffset,
 {
 	int offset, depth;
 	int supernodeoffset = -FDT_ERR_INTERNAL;
+	int root_offset;
 
 	FDT_RO_PROBE(fdt);
 
 	if (supernodedepth < 0)
 		return -FDT_ERR_NOTFOUND;
 
-	for (offset = 0, depth = 0;
+	root_offset = fdt_root_offset(fdt);
+	if (root_offset < 0)
+		return root_offset;
+
+	if (!nodeoffset)
+		nodeoffset = root_offset;
+
+	for (offset = root_offset, depth = 0;
 	     (offset >= 0) && (offset <= nodeoffset);
 	     offset = fdt_next_node(fdt, offset, &depth)) {
 		if (depth == supernodedepth)
@@ -677,12 +702,15 @@ int fdt_supernode_atdepth_offset(const void *fdt, int nodeoffset,
 int fdt_node_depth(const void *fdt, int nodeoffset)
 {
 	int nodedepth;
-	int err;
+	int offset;
+
+	offset = fdt_supernode_atdepth_offset(fdt, nodeoffset, 0, &nodedepth);
+	if (offset < 0)
+		return offset;
+
+	if (!can_assume(LIBFDT_FLAWLESS) && offset != fdt_root_offset(fdt))
+		return -FDT_ERR_INTERNAL;
 
-	err = fdt_supernode_atdepth_offset(fdt, nodeoffset, 0, &nodedepth);
-	if (err)
-		return (can_assume(LIBFDT_FLAWLESS) || err < 0) ? err :
-			-FDT_ERR_INTERNAL;
 	return nodedepth;
 }
 
@@ -690,13 +718,20 @@ int fdt_parent_offset(const void *fdt, int nodeoffset)
 {
 #if FDT_PARENT_MAX_DEPTH
 	int supernode[FDT_PARENT_MAX_DEPTH];
-	int offset, depth;
+	int root_offset, offset, depth;
 #endif
 	int nodedepth;
 
 #if FDT_PARENT_MAX_DEPTH
 	FDT_RO_PROBE(fdt);
 
+	root_offset = fdt_root_offset(fdt);
+	if (root_offset < 0)
+		return root_offset;
+
+	if (!nodeoffset)
+		nodeoffset = root_offset;
+
 	/*
 	 * Walk the tree once, remembering the most recent node seen at each
 	 * depth. On reaching the target node, its parent is the last node
@@ -708,7 +743,7 @@ int fdt_parent_offset(const void *fdt, int nodeoffset)
 	 * happens when nodeoffset does not name a node. Fall back in that
 	 * case, so that the checks below reject it
 	 */
-	for (offset = 0, depth = 0;
+	for (offset = root_offset, depth = 0;
 	     offset >= 0 && offset <= nodeoffset;
 	     offset = fdt_next_node(fdt, offset, &depth)) {
 		if (depth < 0)
diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
index 1f2c56f4..ee1e94e6 100644
--- a/libfdt/fdt_rw.c
+++ b/libfdt/fdt_rw.c
@@ -226,7 +226,7 @@ static int fdt_add_property_(void *fdt, int nodeoffset, const char *name,
 	int err;
 	int allocated;
 
-	if ((nextoffset = fdt_check_node_offset_(fdt, nodeoffset)) < 0)
+	if ((nextoffset = fdt_check_node_offset_(fdt, &nodeoffset)) < 0)
 		return nextoffset;
 
 	namestroff = fdt_find_add_string_(fdt, name, namelen, &allocated);
@@ -390,6 +390,12 @@ int fdt_add_subnode_namelen(void *fdt, int parentoffset,
 
 	FDT_RW_PROBE(fdt);
 
+	if (!parentoffset) {
+		parentoffset = fdt_root_offset(fdt);
+		if (parentoffset < 0)
+			return parentoffset;
+	}
+
 	offset = fdt_subnode_offset_namelen(fdt, parentoffset, name, namelen);
 	if (offset >= 0)
 		return -FDT_ERR_EXISTS;
diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index c69a18ed..7a1915a5 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -503,6 +503,19 @@ int fdt_num_mem_rsv(const void *fdt);
  */
 int fdt_get_mem_rsv(const void *fdt, int n, uint64_t *address, uint64_t *size);
 
+/**
+ * fdt_root_offset - Get the offset of the root node
+ * @fdt: pointer to the device tree blob
+ *
+ * The root node can be located after the offset 0. Indeed FDT_NOP tags can be
+ * present at offset 0. fdt_root_offset() takes care of those possible FDT_NOP
+ * tags.
+ *
+ * returns: offset of the root node or negative libfdt error value otherwise
+ */
+int fdt_root_offset(const void *fdt);
+
+
 /**
  * fdt_subnode_offset_namelen - find a subnode based on substring
  * @fdt: pointer to the device tree blob
@@ -1025,7 +1038,7 @@ int fdt_get_path(const void *fdt, int nodeoffset, char *buf, int buflen);
  * at a specific depth from the root (where the root itself has depth
  * 0, its immediate subnodes depth 1 and so forth).  So
  *	fdt_supernode_atdepth_offset(fdt, nodeoffset, 0, NULL);
- * will always return 0, the offset of the root node.  If the node at
+ * will always return the offset of the root node.  If the node at
  * nodeoffset has depth D, then:
  *	fdt_supernode_atdepth_offset(fdt, nodeoffset, D, NULL);
  * will return nodeoffset itself.
diff --git a/libfdt/libfdt_internal.h b/libfdt/libfdt_internal.h
index eefea2a3..8df9ffba 100644
--- a/libfdt/libfdt_internal.h
+++ b/libfdt/libfdt_internal.h
@@ -20,7 +20,7 @@ int32_t fdt_ro_probe_(const void *fdt);
 		}							\
 	}
 
-int fdt_check_node_offset_(const void *fdt, int offset);
+int fdt_check_node_offset_(const void *fdt, int *offset);
 int fdt_check_prop_offset_(const void *fdt, int offset);
 
 const char *fdt_find_string_len_(const char *strtab, int tabsize, const char *s,
diff --git a/libfdt/version.lds b/libfdt/version.lds
index cbfef546..d0b71669 100644
--- a/libfdt/version.lds
+++ b/libfdt/version.lds
@@ -7,6 +7,7 @@ LIBFDT_1.2 {
 		fdt_string;
 		fdt_num_mem_rsv;
 		fdt_get_mem_rsv;
+		fdt_root_offset;
 		fdt_subnode_offset_namelen;
 		fdt_subnode_offset;
 		fdt_path_offset_namelen;
-- 
2.56.1

