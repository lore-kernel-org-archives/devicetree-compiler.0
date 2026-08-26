Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7EE23E1680
	for <devicetree-compiler@vger.kernel.org>; Wed, 26 Aug 2026 09:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787738088; cv=none; b=OuHYQ773TsIDKxjh8cGBV5sgv7vnE4iwotScpWRrN1az631bkwFSgIAPil1q6ujY+fwO0vM4meUEQGDf61ZRm9THpGlVV0Gnhfw3fkoIxVEcU4iURiVm1Og96t/f+Ay8WanNiPCNG6tbxyiRFBk6/gy5hK3MhmS41BzcrET9SOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787738088; c=relaxed/simple;
	bh=1SX7I+mNBJ264w2nmavu8MDlPskUkfu+5vJhwf/E+fU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hbk+JcKLR/p8vnqieCGer3bFGl45FIgjbymfNSRULG9BKDNp8Y8DafrnNcN7p9kqJ1Aa8xf/oioiQmIZxPie4n1mP2yJOWCZgHH8TPOQlT6pGClZeL4iaXKzVg/CujdReL3xkSSI1JkMAL2sAVNx5CxVGDilF5iAJjPG3Pf4dNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YpujNEIf; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YpujNEIf"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 40B8F4E413BC;
	Wed, 26 Aug 2026 09:54:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 15CDE604EC;
	Wed, 26 Aug 2026 09:54:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B40EC11C7AD72;
	Wed, 26 Aug 2026 11:54:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787738080; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=IOlJxADsKv2rEvlqPqIn/xFOwUgnW9qq8lcD9Dv1i0I=;
	b=YpujNEIfUlXKKw1xir5xMn2imGgppiKhu5Aby28//K3jitZcRH062lcTokmTO0B2XIUc9G
	PrpOzAIUZdiq9pCMaktn0SPzSYEVe2SlhFVTqkEk6u1XBwwB78bSaWjAvnNFHy22hxyFcz
	C1b7JK21os9CrwE5gEHvi2ygfSTrvXCiVBR9O/huFSEve3XtO73V/1f8VOUJwpccqYJnt2
	nGTtxuAVL9lQIPYY6STd+T6uTorZpnVnkyCbh+AcXnaK9dHVGWPus5q82Ir7gLm1inDtfv
	a8CW7RBlZWOeOA/nObQ+tvD9gsnC1JCIT7ha+zye0twxOkaawKo7cHiNmj6L+Q==
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
Subject: [RFC PATCH v2 73/74] libfdt/fdt_addon.c: Add support for an external resolver
Date: Wed, 26 Aug 2026 11:49:42 +0200
Message-ID: <20260826094950.1088288-74-herve.codina@bootlin.com>
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

fdt_addon.c uses its own default resolver to resolve import symbols.

It expects a matching between the name of the import symbol to resolve
and the name of export symbols available in the addon target node (node
in the base dtb).

In some cases, it makes sense to have a resolver that could choose the
right export symbol to match based on some other criteria.

The external resolver allows the user of libfdt to provide its own
resolver and so match an import symbol based on its own criteria.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 libfdt/fdt_addon.c | 138 +++++++++++++++++++++++++++++++++------------
 libfdt/libfdt.h    |  98 +++++++++++++++++++++++++++++++-
 libfdt/version.lds |   2 +
 3 files changed, 200 insertions(+), 38 deletions(-)

diff --git a/libfdt/fdt_addon.c b/libfdt/fdt_addon.c
index 54e71cbd..99d9c10a 100644
--- a/libfdt/fdt_addon.c
+++ b/libfdt/fdt_addon.c
@@ -10,6 +10,11 @@
 
 #include "libfdt_internal.h"
 
+struct fdt_addon_resolver {
+	const struct fdt_addon_resolver_ops *ops;
+	void *priv;
+};
+
 /**
  * fdt_skip_string - Skip a string
  * @fdt: device tree blob
@@ -568,21 +573,9 @@ static int fdt_resolve_symbol(const void *fdt, int target_node,
 	return -FDT_ERR_NOTFOUND;
 }
 
-/**
- * fdt_resolve_import - Resolve an imported symbol
- * @fdt: base device tree blob
- * @target_node: Target node offset in the base device tree blob containing
- *               the exported symbols used for the resolution.
- * @importsym_name: Import symbol name
- * @importsym_compatible: Import symbol compatible string
- *
- * returns:
- *      offset of the node matching the symbol after the resolution on success.
- *      Negative error code on failure.
- */
-static int fdt_resolve_import(const void *fdt, int target_node,
-				const char *importsym_name,
-				const char *importsym_compatible)
+int fdt_addon_resolve_default(const void *fdt, int target_node,
+			      const char *importsym_name,
+			      const char *importsym_compatible)
 {
 	/*
 	 * Do not check the import symbol compatible string against the found
@@ -604,6 +597,33 @@ static int fdt_resolve_import(const void *fdt, int target_node,
 				  strlen(importsym_name));
 }
 
+/**
+ * fdt_resolve_import - Resolve an imported symbol
+ * @fdt: base device tree blob
+ * @target_node: Target node offset in the base device tree blob containing
+ *               the exported symbols used for the resolution.
+ * @importsym_name: Import symbol name
+ * @importsym_compatible: Import symbol compatible string
+ * @resolver: Custom resolver. If NULL, the default resolver is used.
+ *
+ * returns:
+ *      offset of the node matching the symbol after the resolution on success.
+ *      Negative error code on failure.
+ */
+static int fdt_resolve_import(const void *fdt, int target_node,
+			      const char *importsym_name,
+			      const char *importsym_compatible,
+			      const struct fdt_addon_resolver *resolver)
+{
+	if (resolver)
+		return resolver->ops->resolve(resolver->priv, fdt, target_node,
+					      importsym_name,
+					      importsym_compatible);
+
+	return fdt_addon_resolve_default(fdt, target_node, importsym_name,
+					 importsym_compatible);
+}
+
 static int fdt_check_importsym_offset(const void *fdt, int offset, int *data_offset)
 {
 	int nextoffset, d;
@@ -709,6 +729,7 @@ static const char *fdt_importsym_get_compatible(const void *fdt, int offset)
  *               resolution.
  * @sym_name: Symbol name
  * @sym_namelen: Length of the symbol name
+ * @resolver: Custom resolver, NULL to use the default resolver.
  *
  * addon_resolve_symbol() resolved a symbol used by an addon using the import
  * symbol table available in the addon device tree blob.
@@ -719,7 +740,8 @@ static const char *fdt_importsym_get_compatible(const void *fdt, int offset)
  *      Negative error code on failure.
  */
 static int addon_resolve_symbol(const void *fdta, const void *fdt, int target_node,
-				const char *sym_name, size_t sym_namelen)
+				const char *sym_name, size_t sym_namelen,
+				const struct fdt_addon_resolver *resolver)
 {
 	const char *importsym_compat;
 	const char *importsym_name;
@@ -739,7 +761,7 @@ static int addon_resolve_symbol(const void *fdta, const void *fdt, int target_no
 			continue;
 
 		return fdt_resolve_import(fdt, target_node, importsym_name,
-					  importsym_compat);
+					  importsym_compat, resolver);
 	}
 	/* Not found ... */
 	return -FDT_ERR_NOTFOUND;
@@ -753,6 +775,7 @@ static int addon_resolve_symbol(const void *fdta, const void *fdt, int target_no
  *               device tree blob, must have exported symbols needed for the
  *               resolution.
  * @ref: The reference to resolve
+ * @resolver: Custom resolver, NULL to use the default resolver
  *
  * addon_resolve_ref() resolves a reference used by an addon.
  * A reference can be composed of several symbols separated by a '.' char.
@@ -769,7 +792,8 @@ static int addon_resolve_symbol(const void *fdta, const void *fdt, int target_no
  *      Negative error code on failure.
  */
 static int addon_resolve_ref(const void *fdta, const void *fdt, int target_node,
-			     const char *ref)
+			     const char *ref,
+			     const struct fdt_addon_resolver *resolver)
 {
 	const char *end = ref + strlen(ref);
 	const char *r = ref;
@@ -794,7 +818,8 @@ static int addon_resolve_ref(const void *fdta, const void *fdt, int target_node,
 			d = end;
 
 		if (r == ref)
-			tmp_node = addon_resolve_symbol(fdta, fdt, tmp_node, r, d-r);
+			tmp_node = addon_resolve_symbol(fdta, fdt, tmp_node, r, d-r,
+				   resolver);
 		else
 			tmp_node = fdt_resolve_symbol(fdt, tmp_node, r, d-r);
 
@@ -812,6 +837,7 @@ static int addon_resolve_ref(const void *fdta, const void *fdt, int target_node,
  * @fdta: Addon device tree blob
  * @fdt: Device tree blob the addon is going to be applied to
  * @target_node: Offset of the node in fdt the addon is going to be applied to
+ * @resolver: Custom resolver. NULL to use the default resolver
  *
  * addon_resolve_phandles() resolved unresolved phandle symbols available in
  * the addon.
@@ -820,7 +846,8 @@ static int addon_resolve_ref(const void *fdta, const void *fdt, int target_node,
  *      0 on success
  *      Negative error code on failure
  */
-static int addon_resolve_phandles(void *fdta, const void *fdt, int target_node)
+static int addon_resolve_phandles(void *fdta, const void *fdt, int target_node,
+				  const struct fdt_addon_resolver *resolver)
 {
 	int offset, next_offset, d;
 	int last_prop_offset = -1;
@@ -880,7 +907,8 @@ static int addon_resolve_phandles(void *fdta, const void *fdt, int target_node)
 			ref = fdt_offset_ptr(fdta, d, 1);
 
 			/* Resolve this phandle */
-			ref_node = addon_resolve_ref(fdta, fdt, target_node, ref);
+			ref_node = addon_resolve_ref(fdta, fdt, target_node, ref,
+						     resolver);
 			if (ref_node < 0)
 				return ref_node;
 
@@ -931,7 +959,8 @@ static int addon_resolve_phandles(void *fdta, const void *fdt, int target_node)
 			ref = fdt_offset_ptr(fdta, d, 1);
 
 			/* Resolve the phandle */
-			ref_node = addon_resolve_ref(fdta, fdt, target_node, ref);
+			ref_node = addon_resolve_ref(fdta, fdt, target_node,
+						     ref, resolver);
 			if (ref_node < 0)
 				return ref_node;
 
@@ -1153,6 +1182,7 @@ static const char *fdt_orphan_get_ref(const void *fdt, int offset)
  * @fdt: Base Device Tree blob
  * @target_node: Target node in the base device tree the addon is going to be
  *               applied to
+ * @resolver: Custom resolver, NULL to use the default resolver
  *
  * Checks recursively if applying fdta overwrites phandle values in the base
  * fdt. When such a phandle is found, the fdta is changed to use the fdt's
@@ -1163,7 +1193,8 @@ static const char *fdt_orphan_get_ref(const void *fdt, int offset)
  *      Negative error code on failure
  */
 static int addon_prevent_phandles_overwrite(void *fdta, const void *fdt,
-					    int target_node)
+					    int target_node,
+					    const struct fdt_addon_resolver *resolver)
 {
 	int fdt_orphan_target;
 	int addon_root_node;
@@ -1187,7 +1218,8 @@ static int addon_prevent_phandles_overwrite(void *fdta, const void *fdt,
 		if (!ref)
 			return -FDT_ERR_BADSTRUCTURE;
 
-		fdt_orphan_target = addon_resolve_ref(fdta, fdt, target_node, ref);
+		fdt_orphan_target = addon_resolve_ref(fdta, fdt, target_node,
+						      ref, resolver);
 		if (fdt_orphan_target < 0)
 			return fdt_orphan_target;
 
@@ -1505,6 +1537,7 @@ static int addon_merge_node_properties(const void *fdta, int fdta_node,
  * @target_path: Path in the base Device Tree to the node where the addon is
  *		 applied to. This is the node where export symbols used for symbol
  *		 resolution are present.
+ * @resolver: Custom resolver. NULL to use the default resolver.
  *
  * returns:
  *      0 on success
@@ -1512,7 +1545,8 @@ static int addon_merge_node_properties(const void *fdta, int fdta_node,
  */
 static int addon_merge_node_exports(const void *fdta, int fdta_node,
 				    void *fdt, int fdt_node,
-				    bool is_existing_node, const char *target_path)
+				    bool is_existing_node, const char *target_path,
+				    const struct fdt_addon_resolver *resolver)
 {
 	const char *exportsym_name;
 	const char *exportsym_ref;
@@ -1554,7 +1588,8 @@ static int addon_merge_node_exports(const void *fdta, int fdta_node,
 				return target_node;
 
 			/* Resolve the reference */
-			ref_node = addon_resolve_ref(fdta, fdt, target_node, exportsym_ref);
+			ref_node = addon_resolve_ref(fdta, fdt, target_node,
+						     exportsym_ref, resolver);
 			if (ref_node < 0)
 				return ref_node;
 
@@ -1591,6 +1626,7 @@ static int addon_merge_node_exports(const void *fdta, int fdta_node,
  * @target_path: Path in the base Device Tree to the node where the addon is
  *		 applied to. This is the node where export symbols used for symbol
  *		 resolution are present.
+ * @resolver: Custom resolver, NULL to use the default resolver.
  *
  * returns:
  *      0 on success
@@ -1598,7 +1634,8 @@ static int addon_merge_node_exports(const void *fdta, int fdta_node,
  */
 static int addon_merge_node(const void *fdta, int fdta_node, void *fdt,
 			    int fdt_node, bool is_existing_node,
-			    const char *target_path)
+			    const char *target_path,
+			    const struct fdt_addon_resolver *resolver)
 {
 	bool is_existing;
 	int fdta_subnode;
@@ -1607,7 +1644,8 @@ static int addon_merge_node(const void *fdta, int fdta_node, void *fdt,
 	int ret;
 
 	ret = addon_merge_node_exports(fdta, fdta_node, fdt, fdt_node,
-				       is_existing_node, target_path);
+				       is_existing_node, target_path,
+				       resolver);
 	if (ret)
 		return ret;
 
@@ -1632,7 +1670,7 @@ static int addon_merge_node(const void *fdta, int fdta_node, void *fdt,
 			return fdt_subnode;
 
 		ret = addon_merge_node(fdta, fdta_subnode, fdt, fdt_subnode,
-				       is_existing, target_path);
+				       is_existing, target_path, resolver);
 		if (ret)
 			return ret;
 	}
@@ -1640,7 +1678,8 @@ static int addon_merge_node(const void *fdta, int fdta_node, void *fdt,
 	return 0;
 }
 
-static int addon_merge(void *fdta, void *fdt, const char *target_path)
+static int addon_merge(void *fdta, void *fdt, const char *target_path,
+		       const struct fdt_addon_resolver *resolver)
 {
 	int fdt_orphan_target;
 	int fdta_orphan;
@@ -1654,7 +1693,8 @@ static int addon_merge(void *fdta, void *fdt, const char *target_path)
 		return target_node;
 
 	/* Merge the addon root node into the base target_node */
-	ret = addon_merge_node(fdta, 0, fdt, target_node, true, target_path);
+	ret = addon_merge_node(fdta, 0, fdt, target_node, true, target_path,
+			       resolver);
 	if (ret < 0)
 		return ret;
 
@@ -1663,12 +1703,13 @@ static int addon_merge(void *fdta, void *fdt, const char *target_path)
 		if (!ref)
 			return -FDT_ERR_BADSTRUCTURE;
 
-		fdt_orphan_target = addon_resolve_ref(fdta, fdt, target_node, ref);
+		fdt_orphan_target = addon_resolve_ref(fdta, fdt, target_node,
+						      ref, resolver);
 		if (fdt_orphan_target < 0)
 			return fdt_orphan_target;
 
 		ret = addon_merge_node(fdta, fdta_orphan, fdt, fdt_orphan_target,
-				       true, target_path);
+				       true, target_path, resolver);
 		if (ret < 0)
 			return ret;
 
@@ -1688,8 +1729,12 @@ static int addon_merge(void *fdta, void *fdt, const char *target_path)
 	return 0;
 }
 
-int fdt_addon_apply(void *fdt, void *fdta, const char *target)
+int fdt_addon_apply_resolver(void *fdt, void *fdta, const char *target,
+			     const struct fdt_addon_resolver_ops *resolver_ops,
+			     void *resolver_priv)
 {
+	struct fdt_addon_resolver *resolver = NULL;
+	struct fdt_addon_resolver custom_resolver;
 	int target_node;
 	uint32_t delta;
 	int ret;
@@ -1697,11 +1742,25 @@ int fdt_addon_apply(void *fdt, void *fdta, const char *target)
 	FDT_RO_PROBE(fdt);
 	FDT_RO_PROBE(fdta);
 
+	if (resolver_ops) {
+		/* Initialize the custom resolver */
+		custom_resolver.ops = resolver_ops;
+		custom_resolver.priv = resolver_priv;
+		/* This custom resolver is the resolver used */
+		resolver = &custom_resolver;
+	}
+
 	/* Get the target node */
 	target_node = fdt_path_offset(fdt, target);
 	if (target_node < 0)
 		return target_node;
 
+	if (resolver && resolver->ops->validate) {
+		ret = resolver->ops->validate(resolver->priv, fdt, target_node);
+		if (ret < 0)
+			return ret;
+	}
+
 	ret = fdt_find_max_phandle(fdt, &delta);
 	if (ret)
 		return ret;
@@ -1712,16 +1771,16 @@ int fdt_addon_apply(void *fdt, void *fdta, const char *target)
 		goto err;
 
 	/* Resolve phandles */
-	ret = addon_resolve_phandles(fdta, fdt, target_node);
+	ret = addon_resolve_phandles(fdta, fdt, target_node, resolver);
 	if (ret < 0)
 		goto err;
 
 	/* Don't overwrite phandles in fdt */
-	ret = addon_prevent_phandles_overwrite(fdta, fdt, target_node);
+	ret = addon_prevent_phandles_overwrite(fdta, fdt, target_node, resolver);
 	if (ret < 0)
 		goto err;
 
-	ret = addon_merge(fdta, fdt, target);
+	ret = addon_merge(fdta, fdt, target, resolver);
 	if (ret < 0)
 		goto err;
 
@@ -1739,3 +1798,8 @@ err:
 
 	return ret;
 }
+
+int fdt_addon_apply(void *fdt, void *fdta, const char *target)
+{
+	return fdt_addon_apply_resolver(fdt, fdta, target, NULL, NULL);
+}
diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index 3ef29beb..5df115b7 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -2545,7 +2545,8 @@ int fdt_overlay_target_offset(const void *fdt, const void *fdto,
  * @target: target node path
  *
  * fdt_addon_apply() will apply the given device tree addon on the given target
- * node in base device tree.
+ * node in base device tree. fdt_addon_apply() uses the default resolver to
+ * resolve symbols.
  *
  * Expect the base device tree to be modified, even if the function
  * returns an error.
@@ -2570,6 +2571,101 @@ int fdt_overlay_target_offset(const void *fdt, const void *fdto,
  */
 int fdt_addon_apply(void *fdt, void *fdta, const char *target);
 
+#ifndef SWIG /* Not available in Python */
+struct fdt_addon_resolver_ops {
+	/**
+	 * Validate function (optional)
+	 * @priv: Private data
+	 * @fdt: fdt blob to look for validation
+	 * @target_node: Target node offset the addon is applied to
+	 *
+	 * If non NULL, this function is called soon when an addon is applied
+	 * and allows the resolver to perform some internal checks. If NULL,
+	 * no resolver validation takes place and the applying process continues
+	 * its operations.
+	 *
+	 * Return 0 if the validation of the resolver succeed. Negative error
+	 * code on failure. On failure, the addon applying process is aborted.
+	 * and the negative error code returned by this function is returned from
+	 * the function applying the addon.
+	 */
+	int (*validate)(void *priv, const void *fdt, int target_node);
+
+	/**
+	 * Resolve function (mandatory)
+	 * @priv: Private data
+	 * @fdt: fdt blob to look for importsym matching node
+	 * @target_node: Target node offset the addon is applied to
+	 * @importsym_name: Import symbol name
+	 * @importsym_compatible: Import symbol compatible string
+	 *
+	 * Return the node offset in fdt blob of the node matching the import
+	 * symbol (identified by its name and compatible string) after the
+	 * resolution on success. Negative error code on failure.
+	 */
+	int (*resolve)(void *priv, const void *fdt, int target_node,
+		       const char *importsym_name,
+		       const char *importsym_compatible);
+};
+
+/**
+ * fdt_resolve_default - Default libfdt resolver.
+ * @fdt: base device tree blob
+ * @target_node: Target node offset in the base device tree blob containing
+ *               the exported symbols used for the resolution.
+ * @importsym_name: Import symbol name
+ * @importsym_compatible: Import symbol compatible string
+ *
+ * The default libfdt resolver search for a matching node in export symbols
+ * available at the @target_node. The @importsym_compatible string is not used.
+ *
+ * returns:
+ *      offset of the node matching the symbol after the resolution on success.
+ *      Negative error code on failure.
+ */
+int fdt_addon_resolve_default(const void *fdt, int target_node,
+			      const char *importsym_name,
+			      const char *importsym_compatible);
+
+
+/**
+ * fdt_addon_apply_resolver - Applies a DT addon on a base DT using the provided
+ * revolver.
+ * @fdt: pointer to the base device tree blob
+ * @fdta: pointer to the device tree addon blob
+ * @target: target node path
+ * @resolver_ops: Resolver operations to use, NULL to use the default resolver.
+ * @resolver_priv: Private data passed to function provided by resolver_ops
+ *
+ * fdt_addon_apply() will apply the given device tree addon on the given target
+ * node in base device tree.
+ *
+ * Expect the base device tree to be modified, even if the function
+ * returns an error.
+ *
+ * returns:
+ *	0, on success
+ *	-FDT_ERR_NOSPACE, there's not enough space in the base device tree
+ *	-FDT_ERR_NOTFOUND, the overlay points to some nonexistent nodes or
+ *		properties in the base DT
+ *	-FDT_ERR_BADPHANDLE,
+ *	-FDT_ERR_BADOVERLAY,
+ *	-FDT_ERR_NOPHANDLES,
+ *	-FDT_ERR_INTERNAL,
+ *	-FDT_ERR_BADLAYOUT,
+ *	-FDT_ERR_BADMAGIC,
+ *	-FDT_ERR_BADOFFSET,
+ *	-FDT_ERR_BADPATH,
+ *	-FDT_ERR_BADVERSION,
+ *	-FDT_ERR_BADSTRUCTURE,
+ *	-FDT_ERR_BADSTATE,
+ *	-FDT_ERR_TRUNCATED, standard meanings
+ */
+int fdt_addon_apply_resolver(void *fdt, void *fdta, const char *target,
+			     const struct fdt_addon_resolver_ops *resolver_ops,
+			     void *resolver_priv);
+#endif /* SWIG */
+
 /**********************************************************************/
 /* Debugging / informational functions                                */
 /**********************************************************************/
diff --git a/libfdt/version.lds b/libfdt/version.lds
index 74925ac0..0fa3490c 100644
--- a/libfdt/version.lds
+++ b/libfdt/version.lds
@@ -84,6 +84,8 @@ LIBFDT_1.2 {
 		fdt_get_symbol;
 		fdt_get_symbol_namelen;
 		fdt_addon_apply;
+		fdt_addon_apply_resolver;
+		fdt_addon_resolve_default;
 	local:
 		*;
 };
-- 
2.55.0

