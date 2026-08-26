Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8078B3B71B8;
	Wed, 26 Aug 2026 08:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787733165; cv=none; b=O+1rQ8xehUDplMWmr5NcV+cW+55L6w7h6+xA/43E2jUWvv2+b5mIa264OO6rprqWP+6p4O1+0OHjGsjtg2rkquc9v1X4CCrWsoBqImeIl6E5ZiLD9aZVh6peD/piA7qj1+NvsURMmmZHvZXgUleIBLgIfHy7yAZCa8EWdIUqIpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787733165; c=relaxed/simple;
	bh=0Ef+lXz7IkIPu46bk8IFoiO7dhr/2JMnSVJ4jZIoLls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tr9Jq9gGmbYzP5oWdM3e5IxRnwaY09qBl/y9OM8bMk0gkn97ynir2xWPJT5+y2l2PYwjycMTkgoztRsemUABH8iB369pNl/36XmSHLFPq7TASfahW1ZsAfFXv7OHZhDoF+PKi4wab+FaSvuJQ9uAkd076oxVyTzGUlXgnki33Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=FhRn+df8; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="FhRn+df8"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C0DB91A183F;
	Wed, 26 Aug 2026 08:32:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8DDFC604EC;
	Wed, 26 Aug 2026 08:32:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AC4F711C7AC7C;
	Wed, 26 Aug 2026 10:32:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787733156; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=z47qAnB4rUFVZ7n66ZHWLESpHAxKpy2FC2IRGf+1VRU=;
	b=FhRn+df8m62N4RNNxbtEkF05qgDYqgghzuQbmYJUnGJVNUv5cpjFx3M+CRZ3LY/l4/v1i5
	oxcUTJoJnHiTa8avAqMXcwu3/3OqjPRQGZg/TUSr8xBAJTRfqGtO32yAZ4r1cQAOgDDHBJ
	1BiwISvDtrpiYJWh/8+yeTVKudqdnAtCBwPwnTMjo2uZN1J4R/Hn4GrvJMTQFGQLeY+/6h
	VfQWyHqbrsUEwzbehd1//R/s34qY9dhTXvnAwyKIwvnJo0TcdfJEKEHCKlXHr7K2XsxGIr
	E2XsazqOkRfFFWkhipexCJ8Q8GyA6I1jSy0peV83Ek5xYXf9JPgYlHxbMpwDCQ==
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
	Herve Codina <herve.codina@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v3 02/15] libfdt: Don't assume the root node is available at offset 0
Date: Wed, 26 Aug 2026 10:31:33 +0200
Message-ID: <20260826083146.304291-3-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826083146.304291-1-herve.codina@bootlin.com>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

In several places, libfdt assumes that the root offset (i.e. the first
FDT_BEGIN_NODE tag) is present at the offset 0 of the structure block.

This assumption is not correct. A FDT_NOP can be present at the offset 0
and this is a legit case. Indeed, the device-tree specification [0]
defines the FDT_NOP tag as follow:

   The FDT_NOP token will be ignored by any program parsing the device
   tree. This token has no extra data; so it is followed immediately by
   the next token, which can be any valid token. A property or node
   definition in the tree can be overwritten with FDT_NOP tokens to
   remove it from the tree without needing to move other sections of
   the tree’s representation in the devicetree blob.

Nothing refers to any location for this tag and it has to be simply
ignored. Having this tag at offset 0 doesn't make an exception, the tag
has to be ignored.

Introduce fdt_root_offset() in order to get the offset of the root
node (first FDT_BEGIN_NODE tag) available in a fdt blob taking care of
FDT_NOP tags.

Use this function to get the root node offset instead of looking for
this node at offset 0.

[0] https://github.com/devicetree-org/devicetree-specification/blob/main/source/chapter5-flattened-format.rst?plain=1#L317

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 libfdt/fdt.c       | 39 +++++++++++++++++++++++++++++--
 libfdt/fdt_ro.c    | 57 ++++++++++++++++++++++++++++++++++++++--------
 libfdt/fdt_rw.c    | 12 ++++++++++
 libfdt/libfdt.h    | 15 +++++++++++-
 libfdt/version.lds |  1 +
 5 files changed, 111 insertions(+), 13 deletions(-)

diff --git a/libfdt/fdt.c b/libfdt/fdt.c
index 56d4dcb2..eb803e8a 100644
--- a/libfdt/fdt.c
+++ b/libfdt/fdt.c
@@ -252,13 +252,48 @@ int fdt_check_prop_offset_(const void *fdt, int offset)
 	return offset;
 }
 
-int fdt_next_node(const void *fdt, int offset, int *depth)
+int fdt_root_offset(const void *fdt)
 {
 	int nextoffset = 0;
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
+	return (nextoffset < 0) ? nextoffset : -FDT_ERR_NOTFOUND;
+}
+
+int fdt_next_node(const void *fdt, int offset, int *depth)
+{
+	int nextoffset = offset;
 	uint32_t tag;
 
+	/*
+	 * Get the root node if asked for next node from the root node
+	 * (offset == 0) or if the given offset is not valid (negative).
+	 */
+	if (offset <= 0) {
+		nextoffset = fdt_root_offset(fdt);
+		if (nextoffset < 0)
+			return nextoffset;
+	}
+
 	if (offset >= 0)
-		if ((nextoffset = fdt_check_node_offset_(fdt, offset)) < 0)
+		if ((nextoffset = fdt_check_node_offset_(fdt, nextoffset)) < 0)
 			return nextoffset;
 
 	do {
diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
index 11f2e2ee..856c62f1 100644
--- a/libfdt/fdt_ro.c
+++ b/libfdt/fdt_ro.c
@@ -231,6 +231,12 @@ int fdt_subnode_offset_namelen(const void *fdt, int offset,
 
 	FDT_RO_PROBE(fdt);
 
+	if (!offset) {
+		offset = fdt_root_offset(fdt);
+		if (offset < 0)
+			return offset;
+	}
+
 	for (depth = 0;
 	     (offset >= 0) && (depth >= 0);
 	     offset = fdt_next_node(fdt, offset, &depth))
@@ -253,13 +259,17 @@ int fdt_path_offset_namelen(const void *fdt, const char *path, int namelen)
 {
 	const char *end = path + namelen;
 	const char *p = path;
-	int offset = 0;
+	int offset;
 
 	FDT_RO_PROBE(fdt);
 
 	if (!can_assume(VALID_INPUT) && namelen <= 0)
 		return -FDT_ERR_BADPATH;
 
+	offset = fdt_root_offset(fdt);
+	if (offset < 0)
+		return offset;
+
 	/* see if we have an alias */
 	if (*path != '/') {
 		const char *q = memchr(path, '/', end - p);
@@ -304,14 +314,24 @@ int fdt_path_offset(const void *fdt, const char *path)
 
 const char *fdt_get_name(const void *fdt, int nodeoffset, int *len)
 {
-	const struct fdt_node_header *nh = fdt_offset_ptr_(fdt, nodeoffset);
+	const struct fdt_node_header *nh;
 	const char *nameptr;
 	int err;
 
+	if (!nodeoffset) {
+		nodeoffset = fdt_root_offset(fdt);
+		if (nodeoffset < 0) {
+			err = nodeoffset;
+			goto fail;
+		}
+	}
+
+
 	if (!can_assume(VALID_DTB) && (((err = fdt_ro_probe_(fdt)) < 0)
 	    || ((err = fdt_check_node_offset_(fdt, nodeoffset)) < 0)))
 			goto fail;
 
+	nh = fdt_offset_ptr_(fdt, nodeoffset);
 	nameptr = nh->name;
 
 	if (!can_assume(LATEST) && fdt_version(fdt) < 0x10) {
@@ -344,6 +364,12 @@ int fdt_first_property_offset(const void *fdt, int nodeoffset)
 {
 	int offset;
 
+	if (!nodeoffset) {
+		nodeoffset = fdt_root_offset(fdt);
+		if (nodeoffset < 0)
+			return nodeoffset;
+	}
+
 	if ((offset = fdt_check_node_offset_(fdt, nodeoffset)) < 0)
 		return offset;
 
@@ -581,7 +607,7 @@ int fdt_get_path(const void *fdt, int nodeoffset, char *buf, int buflen)
 	if (buflen < 2)
 		return -FDT_ERR_NOSPACE;
 
-	for (offset = 0, depth = 0;
+	for (offset = fdt_root_offset(fdt), depth = 0;
 	     (offset >= 0) && (offset <= nodeoffset);
 	     offset = fdt_next_node(fdt, offset, &depth)) {
 		while (pdepth > depth) {
@@ -619,7 +645,7 @@ int fdt_get_path(const void *fdt, int nodeoffset, char *buf, int buflen)
 	else if (offset == -FDT_ERR_BADOFFSET)
 		return -FDT_ERR_BADSTRUCTURE;
 
-	return offset; /* error from fdt_next_node() */
+	return offset; /* error from fdt_next_node() or fdt_root_offset() */
 }
 
 int fdt_supernode_atdepth_offset(const void *fdt, int nodeoffset,
@@ -627,13 +653,21 @@ int fdt_supernode_atdepth_offset(const void *fdt, int nodeoffset,
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
@@ -663,12 +697,15 @@ int fdt_supernode_atdepth_offset(const void *fdt, int nodeoffset,
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
 
diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
index 850aafe4..ceef49b8 100644
--- a/libfdt/fdt_rw.c
+++ b/libfdt/fdt_rw.c
@@ -226,6 +226,12 @@ static int fdt_add_property_(void *fdt, int nodeoffset, const char *name,
 	int err;
 	int allocated;
 
+	if (!nodeoffset) {
+		nodeoffset = fdt_root_offset(fdt);
+		if (nodeoffset < 0)
+			return nodeoffset;
+	}
+
 	if ((nextoffset = fdt_check_node_offset_(fdt, nodeoffset)) < 0)
 		return nextoffset;
 
@@ -377,6 +383,12 @@ int fdt_add_subnode_namelen(void *fdt, int parentoffset,
 
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
2.55.0

