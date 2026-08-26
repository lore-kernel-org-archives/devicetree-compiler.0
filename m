Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAED041D20D;
	Wed, 26 Aug 2026 09:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787738035; cv=none; b=CklZiCuiU+nw9k5cLhNcQ2IEqAej6tUbTDNHIe3T+nQa5E68II0sHDB0wX4xuvOVnAX+YxpW2vYtryf9ZsQrRDsKa/2DAK2fBNggk0joiOVDMaUXMZW8dWIa7fdd6FMHxCGDy7FFsIAyVhGpWV0xGIlkQMNyhAXYdOEKbitlqiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787738035; c=relaxed/simple;
	bh=CrY3X4e16edH1lpROp9ugrA1jcTNkDYIdyZSwwA/kTU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e79qSCA9Y5qTGCiGZOps3CxGjUPu/UejSEV/pw9uMAn26U/cASueoyLyWA5RBzf3UXTBI8TZeWm3UFNC8WklsdtU72PQTcArakIGICNf7gY2pVLN4Dzy69bAhyPdMxVWWILqFipNDn89qg1sC6jOnq11kFzX1E12G7aa8LonSPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=TErXn3b/; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="TErXn3b/"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 74BE31A183E;
	Wed, 26 Aug 2026 09:53:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 41BD6604EC;
	Wed, 26 Aug 2026 09:53:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9A94B11C7AD6E;
	Wed, 26 Aug 2026 11:53:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787738028; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=uA7SKRvMKnN25iH1hS2pi/D4C8lxGeWYDGFLjyPdLyc=;
	b=TErXn3b/gi6TXE9AdiwYVEM4rP96fn27Q6FX1JS42Oj5qI9aSIejzKyozjkBsIOZqb+02z
	zTktGiw+qojgYOi+f2j1CqlRWEEnCXrYNZbNQYTq9iOCLOEA3+nfXRJ0ByQX/8Nf+BJzQp
	PuekmFOCbRwF2WXS3fcPMnBB5Xo9krWHxLwVo0wPtLKxY3hzkCMDhkqpfewi/ut0D0ioHP
	PLwkb0ASKQ0kv+4hKoQKa7vvs4savfM3FpYq92KrHta1pE7tqot2C8sllDTCbit2XQlQs8
	cj2FDAZkU4xBeUyuyBU1xun5BoR+SEzRd72MuqE825RtfcSWZ0ZFlV8DTfbZ9A==
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
Subject: [RFC PATCH v2 63/74] libfdt: Add support for applying an addon on a base device-tree blob
Date: Wed, 26 Aug 2026 11:49:32 +0200
Message-ID: <20260826094950.1088288-64-herve.codina@bootlin.com>
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

Addon dtbs have been recently supported. The missing part is having some
support for addon usage.

The goal of addons is to extend a base device-tree. This feature is
similar to the overlay feature but addons and recent modifications
offer metadata and import/export symbol mechanism.

This import/export symbol mechanism allow a fine tuning of symbols
exported (i.e. symbol seen from the addon).

To extend the base device-tree, an addon needs to be applied to this
base device-tree at a specific node. The specific node, target node of
the addon, is not encoded in the addon dtb.

Indeed, addons do not depends on the exact base device tree structure.
An addon can be applied on top of any base device tree as soon as the
target node matches expectations of the addon. Exported symbols at
this target node has to match imported symbols defined in the addon.

When the addon is applied three macro operations have to be done:

  - Avoid phandle conflict

    The conflict avoidance consists in fixing local phandle to avoid
    conflict with already existing phandle available in the base
    device-tree. This operation involved metadata recently added in dtb
    format.

  - Resolve unresolved symbols

    The symbol resolution consists in replacing unresolved symbol
    references present in the addon dtb by a reference to an existing
    node in the base device tree. This operation involved metadata and
    import/export symbols.

  - Merge addon nodes into base device-tree

    This merging consists in adding additional nodes described in the
    addon into the base device-tree.

fdt_addon_apply() allows to apply an addon on a base device-tree and
performs internally all the needed operations.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 libfdt/Makefile.libfdt   |    2 +-
 libfdt/fdt_addon.c       | 1741 ++++++++++++++++++++++++++++++++++++++
 libfdt/fdt_rw.c          |   69 ++
 libfdt/libfdt.h          |   32 +
 libfdt/libfdt_internal.h |    5 +
 libfdt/meson.build       |    1 +
 libfdt/version.lds       |    1 +
 7 files changed, 1850 insertions(+), 1 deletion(-)
 create mode 100644 libfdt/fdt_addon.c

diff --git a/libfdt/Makefile.libfdt b/libfdt/Makefile.libfdt
index b763b2ec..437d5b54 100644
--- a/libfdt/Makefile.libfdt
+++ b/libfdt/Makefile.libfdt
@@ -10,7 +10,7 @@ LIBFDT_soname = libfdt.$(SHAREDLIB_EXT).1
 LIBFDT_INCLUDES = fdt.h libfdt.h libfdt_env.h
 LIBFDT_VERSION = version.lds
 LIBFDT_SRCS = fdt.c fdt_ro.c fdt_wip.c fdt_sw.c fdt_rw.c fdt_strerror.c fdt_empty_tree.c \
-	fdt_addresses.c fdt_overlay.c fdt_check.c
+	fdt_addresses.c fdt_overlay.c fdt_addon.c fdt_check.c
 LIBFDT_OBJS = $(LIBFDT_SRCS:%.c=%.o)
 LIBFDT_LIB = libfdt.$(SHAREDLIB_EXT).$(DTC_VERSION)
 
diff --git a/libfdt/fdt_addon.c b/libfdt/fdt_addon.c
new file mode 100644
index 00000000..54e71cbd
--- /dev/null
+++ b/libfdt/fdt_addon.c
@@ -0,0 +1,1741 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+/*
+ * libfdt - Flat Device Tree manipulation
+ * Copyright (C) 2025 Bootlin
+ */
+#include "libfdt_env.h"
+
+#include <fdt.h>
+#include <libfdt.h>
+
+#include "libfdt_internal.h"
+
+/**
+ * fdt_skip_string - Skip a string
+ * @fdt: device tree blob
+ * @offset: Offset of the string to skip
+ *
+ * fdt_skip_string() returns the offset of the first byte after the skipped
+ * string.
+ *
+ * returns:
+ *      offset of the first byte after the skipped string
+ */
+static int fdt_skip_string(const void *fdt, int offset)
+{
+	const char *p;
+	int next;
+
+	next = offset;
+	do {
+		p = fdt_offset_ptr(fdt, next++, 1);
+	} while (p && (*p != '\0'));
+
+	return next;
+}
+
+/**
+ * addon_phandle_add_offset - Increases a phandle by an offset
+ * @fdta: Addon device tree blob
+ * @node: Device tree addon blob
+ * @name: Name of the property to modify (phandle or linux,phandle)
+ * @delta: offset to apply
+ *
+ * addon_phandle_add_offset() increments a node phandle by a given
+ * offset.
+ *
+ * returns:
+ *      0 on success.
+ *      Negative error code on error
+ */
+static int addon_phandle_add_offset(void *fdta, int node, const char *name,
+				    uint32_t delta)
+{
+	fdt32_t *valp, val;
+	int len;
+
+	valp = fdt_getprop_w(fdta, node, name, &len);
+	if (!valp)
+		return len;
+	if (len != sizeof(val))
+		return -FDT_ERR_BADPHANDLE;
+
+	val = fdt32_ld(valp);
+	if (val + delta < val || val + delta == (uint32_t)-1)
+		return -FDT_ERR_NOPHANDLES;
+	fdt32_st(valp, val + delta);
+	return 0;
+}
+
+/**
+ * addon_phandle_set_val - Set a phandle value
+ * @fdt: Addon device tree blob
+ * @node: Device tree addon blob
+ * @name: Name of the property to modify (phandle or linux,phandle)
+ * @val: Value to set
+ *
+ * addon_phandle_set_val() set a node phandle to a given offset.
+ *
+ * returns:
+ *      0 on success.
+ *      Negative error code on error
+ */
+static int addon_phandle_set_val(void *fdta, int node, const char *name,
+				 uint32_t val)
+{
+	fdt32_t *valp;
+	int len;
+
+	valp = fdt_getprop_w(fdta, node, name, &len);
+	if (!valp)
+		return len;
+	if (len != sizeof(val))
+		return -FDT_ERR_BADPHANDLE;
+
+	fdt32_st(valp, val);
+	return 0;
+}
+
+/**
+ * addon_property_add_offset - Increases a property value (a phandle reference)
+ *                             by an offset
+ * @fdta: Addon device tree blob
+ * @prop_offset: Property to update
+ * @data_offset: Offset in the property data to update
+ * @delta: Offset to apply
+ *
+ * returns:
+ *      0 on success.
+ *      Negative error code on error
+ */
+static int addon_property_add_offset(void *fdta, int prop_offset,
+				     unsigned int data_offset, uint32_t delta)
+{
+	unsigned int proplen;
+	char *propval;
+	uint32_t val;
+	fdt32_t *p;
+	int tmp;
+
+	propval = fdt_getprop_by_offset_w(fdta, prop_offset, NULL, &tmp);
+	if (!propval)
+		return tmp;
+
+	proplen = tmp;
+	if (proplen < data_offset + sizeof(fdt32_t))
+		return -FDT_ERR_BADSTRUCTURE;
+
+	/* Get the phandle pointer */
+	p = (fdt32_t *)(propval + data_offset);
+
+	/* Update the phandle value */
+	val = fdt32_ld(p);
+	if (val + delta < val || val + delta == (uint32_t)-1)
+		return -FDT_ERR_NOPHANDLES;
+	fdt32_st(p, val + delta);
+	return 0;
+}
+
+/**
+ * addon_property_set_val - Set a property value (a phandle reference)
+ * @fdta: Addon device tree blob
+ * @prop_offset: Property to update
+ * @data_offset: Offset in the property data to update
+ * @value: Value to set
+ *
+ * returns:
+ *      0 on success.
+ *      Negative error code on error
+ */
+static int addon_property_set_val(void *fdta, int prop_offset,
+				  unsigned int data_offset, uint32_t val)
+{
+	unsigned int proplen;
+	char *propval;
+	fdt32_t *p;
+	int tmp;
+
+	propval = fdt_getprop_by_offset_w(fdta, prop_offset, NULL, &tmp);
+	if (!propval)
+		return tmp;
+
+	proplen = tmp;
+	if (proplen < data_offset + sizeof(fdt32_t))
+		return -FDT_ERR_BADSTRUCTURE;
+
+	/* Get the phandle pointer and update it */
+	p = (fdt32_t *)(propval + data_offset);
+	fdt32_st(p, val);
+	return 0;
+}
+
+/**
+ * addon_property_replace - Replace a property value (a phandle reference) if
+ *                          the old value matches the current value.
+ * @fdta: Addon device tree blob
+ * @prop_offset: Property to update
+ * @data_offset: Offset in the property data to update
+ * @old_val: Old value
+ * @new_val: New value to set if the @old_val matches
+ *
+ * returns:
+ *      0 on success.
+ *      Negative error code on error
+ */
+static int addon_property_replace(void *fdt, int prop_offset,
+				  unsigned int data_offset, uint32_t old_val,
+				  uint32_t new_val)
+{
+	unsigned int proplen;
+	char *propval;
+	uint32_t val;
+	fdt32_t *p;
+	int tmp;
+
+	propval = fdt_getprop_by_offset_w(fdt, prop_offset, NULL, &tmp);
+	if (!propval)
+		return tmp;
+
+	proplen = tmp;
+	if (proplen < data_offset + sizeof(fdt32_t))
+		return -FDT_ERR_BADSTRUCTURE;
+
+	/* Get the phandle pointer */
+	p = (fdt32_t *)(propval + data_offset);
+
+	val = fdt32_ld(p);
+	if (val == old_val)
+		fdt32_st(p, new_val);
+
+	return 0;
+}
+
+/**
+ * addon_adjust_local_phandles - Adjust the local phandles of a whole addon blob
+ * @fdta: Addon device tree blob
+ * @delta: Offset to shift the phandles of
+ *
+ * addon_adjust_local_phandles() adds a constant to all the local phandles of
+ * an addon. This is mainly use as part of the addon application process, when
+ * we want to update all the local phandles of the addon to not conflict with
+ * phandles of the base device tree.
+ *
+ * returns:
+ *      0 on success
+ *      Negative error code on failure
+ */
+static int addon_adjust_local_phandles(void *fdta, uint32_t delta)
+{
+	int offset, next_offset, d;
+	int last_prop_offset = -1;
+	int prop_phandle_offset;
+	const fdt32_t *pfdt32;
+	fdt32_t *pfdt32w;
+	uint32_t tag;
+	uint32_t val;
+	int ret;
+
+	/*
+	 * phandles that need to be updated are:
+	 *   - phandles properties in nodes
+	 *   - phandles in properties where a FDT_PROPDATA_PHANDLE tag is
+	 *     available
+	 *   - phandles in FDT_EXPORT_SYM tags
+	 */
+
+	next_offset = 0;
+	do {
+		offset = next_offset;
+		tag = fdt_next_tag(fdta, offset, &next_offset);
+		switch (tag) {
+		case FDT_BEGIN_NODE:
+			last_prop_offset = -1;
+
+			ret = addon_phandle_add_offset(fdta, offset, "phandle", delta);
+			if (ret && ret != -FDT_ERR_NOTFOUND)
+				return ret;
+
+			ret = addon_phandle_add_offset(fdta, offset, "linux,phandle", delta);
+			if (ret && ret != -FDT_ERR_NOTFOUND)
+				return ret;
+			break;
+
+		case FDT_END_NODE:
+			last_prop_offset = -1;
+			break;
+
+		case FDT_PROP:
+			last_prop_offset = offset;
+			break;
+
+		case FDT_NOP:
+			break;
+
+		case FDT_PROPDATA_PHANDLE:
+			d = fdt_get_structured_tag_data(tag, fdta,
+							offset + FDT_TAGSIZE, NULL);
+			if (d < 0)
+				return d;
+			/*
+			 * The property references a phandle. Get the offset
+			 * of this phandle reference in the property data area.
+			 */
+			pfdt32 = fdt_offset_ptr(fdta, d, sizeof(*pfdt32));
+			prop_phandle_offset = fdt32_to_cpu(*pfdt32);
+			if (prop_phandle_offset % sizeof(fdt32_t))
+				return -FDT_ERR_BADVALUE;
+
+			if (last_prop_offset == -1)
+				return -FDT_ERR_BADSTRUCTURE;
+
+			/* Update the phandle reference */
+			ret = addon_property_add_offset(fdta, last_prop_offset,
+							prop_phandle_offset,
+							delta);
+			if (ret)
+				return ret;
+			break;
+
+		case FDT_PROPDATA_PHANDLE_REF:
+			break;
+
+		case FDT_BEGIN_NODE_REF:
+			last_prop_offset = -1;
+			break;
+
+		case FDT_END:
+			ret = (next_offset < 0) ? next_offset : 0;
+			break;
+
+		case FDT_EXPORT_SYM:
+			d = fdt_get_structured_tag_data(tag, fdta,
+							offset + FDT_TAGSIZE, NULL);
+			if (d < 0)
+				return d;
+
+			/* Get phandle pointer */
+			pfdt32w = fdt_offset_ptr_w(fdta, d, sizeof(*pfdt32));
+
+			/* Update the phandle value */
+			val = fdt32_ld(pfdt32w);
+			if (val + delta < val || val + delta == (uint32_t)-1)
+				return -FDT_ERR_NOPHANDLES;
+
+			fdt32_st(pfdt32w, val + delta);
+			break;
+
+		case FDT_EXPORT_SYM_REF:
+			break;
+		case FDT_IMPORT_SYM:
+			break;
+
+		default:
+			return -FDT_ERR_BADSTRUCTURE;
+		}
+	} while (tag != FDT_END);
+
+	return ret;
+}
+
+static int fdt_check_exportsym_offset(const void *fdt, int offset,
+				      uint32_t *exportsym_tag, int *data_offset)
+{
+	int nextoffset, d;
+	uint32_t tag;
+
+	tag = fdt_next_tag(fdt, offset, &nextoffset);
+	switch (tag) {
+	case FDT_EXPORT_SYM:
+	case FDT_EXPORT_SYM_REF:
+		if (data_offset) {
+			d = fdt_get_structured_tag_data(tag, fdt,
+							offset + FDT_TAGSIZE,
+							NULL);
+			if (d < 0)
+				return d;
+			*data_offset = d;
+		}
+		break;
+	default:
+		return -FDT_ERR_BADOFFSET;
+	}
+
+	if (exportsym_tag)
+		*exportsym_tag = tag;
+
+	return nextoffset;
+}
+
+static int fdt_next_exportsym_nextoffset_(const void *fdt, int nextoffset)
+{
+	uint32_t tag;
+	int offset;
+
+	do {
+		offset = nextoffset;
+		tag = fdt_next_tag(fdt, offset, &nextoffset);
+		switch (tag) {
+		case FDT_EXPORT_SYM:
+			return offset;
+
+		case FDT_EXPORT_SYM_REF:
+			return offset;
+
+		case FDT_BEGIN_NODE:
+			/* We are going to leave the current node (sub-node) */
+			return -FDT_ERR_NOTFOUND;
+
+		case FDT_BEGIN_NODE_REF:
+			/* We cannot have a node ref inside an other node */
+			return -FDT_ERR_BADSTRUCTURE;
+
+		case FDT_END_NODE:
+			/* We are going to leave the current node (parent node) */
+			return -FDT_ERR_NOTFOUND;
+
+		case FDT_END:
+			if (nextoffset < 0)
+				return nextoffset;
+
+			return -FDT_ERR_NOTFOUND;
+		}
+	} while (tag != FDT_END);
+
+	return offset;
+}
+
+static int fdt_next_exportsym_offset(const void *fdt, int offset)
+{
+	int nextoffset;
+
+	if (offset < 0)
+		return offset;
+
+	nextoffset = fdt_check_exportsym_offset(fdt, offset, NULL, NULL);
+	if (nextoffset < 0)
+		return nextoffset;
+
+	return fdt_next_exportsym_nextoffset_(fdt, nextoffset);
+}
+
+static int fdt_first_exportsym_offset(const void *fdt, int node_offset)
+{
+	int nextoffset;
+
+	if (node_offset < 0)
+		return node_offset;
+
+	nextoffset = fdt_check_node_offset_(fdt, node_offset);
+	if (nextoffset < 0)
+		return nextoffset;
+
+	return fdt_next_exportsym_nextoffset_(fdt, nextoffset);
+}
+
+static bool fdt_exportsym_is_ref(const void *fdt, int offset)
+{
+	uint32_t tag;
+
+	/* A exportsym ref has to be an exportsym ... */
+	if (fdt_check_exportsym_offset(fdt, offset, &tag, NULL) < 0)
+		return false;
+
+	if (tag != FDT_EXPORT_SYM_REF)
+		return false;
+
+	return true;
+}
+
+static const char *fdt_exportsym_get_name(const void *fdt, int offset)
+{
+	int data_offset;
+	uint32_t tag;
+
+	if (fdt_check_exportsym_offset(fdt, offset, &tag, &data_offset) < 0)
+		return NULL;
+
+	switch (tag) {
+	case FDT_EXPORT_SYM:
+		data_offset += FDT_CELLSIZE; /* Skip phandle value */
+		break;
+
+	case FDT_EXPORT_SYM_REF:
+		data_offset = fdt_skip_string(fdt, data_offset); /* Skip ref */
+		break;
+
+	default:
+		return NULL;
+	}
+
+	return fdt_offset_ptr(fdt, data_offset, 1);
+}
+
+static uint32_t fdt_exportsym_get_phandle(const void *fdt, int offset)
+{
+	const fdt32_t *pfdt32;
+	int data_offset;
+	uint32_t tag;
+
+	if (fdt_check_exportsym_offset(fdt, offset, &tag, &data_offset) < 0)
+		return 0;
+
+	/* Only FDT_EXPORT_SYM tag has a phandle in its data */
+	if (tag != FDT_EXPORT_SYM)
+		return 0;
+
+	pfdt32 = fdt_offset_ptr(fdt, data_offset, sizeof(*pfdt32));
+	if (!pfdt32)
+		return 0;
+
+	return fdt32_ld_(pfdt32);
+}
+
+static const char *fdt_exportsym_get_ref(const void *fdt, int offset)
+{
+	int data_offset;
+	uint32_t tag;
+
+	if (fdt_check_exportsym_offset(fdt, offset, &tag, &data_offset) < 0)
+		return NULL;
+
+	/* Only FDT_EXPORT_SYM_REF tag has a ref in its data */
+	if (tag != FDT_EXPORT_SYM_REF)
+		return NULL;
+
+	/* Get the reference */
+	return fdt_offset_ptr(fdt, data_offset, 1);
+}
+
+#define fdt_for_each_exportsym(exportsym, fdt, node)			\
+	for (exportsym = fdt_first_exportsym_offset(fdt, node);		\
+	     exportsym >= 0;						\
+	     exportsym = fdt_next_exportsym_offset(fdt, exportsym))
+
+/**
+ * fdt_resolve_symbol - Resolve a symbol
+ * @fdt: base device tree blob
+ * @target_node: Target node offset in the base device tree blob containing
+ *               the exported symbols used for the resolution.
+ * @sym_name: Symbol name
+ * @sym_namelen: Length of the symbol name
+ *
+ * fdt_resolve_symbol() searches for a matching export symbol exported by the
+ * @target_node. It returns the node offset in @fdt referenced by the matching
+ * export symbol.
+ *
+ * returns:
+ *      offset of the node matching the symbol after the resolution on success.
+ *      Negative error code on failure
+ */
+static int fdt_resolve_symbol(const void *fdt, int target_node,
+			      const char *sym_name, size_t sym_namelen)
+{
+	const char *exportsym_name;
+	uint32_t phandle;
+	int exportsym;
+	int ref_node;
+
+	/* Look at export available at the target node */
+	fdt_for_each_exportsym(exportsym, fdt, target_node) {
+
+		/*
+		 * Export symbols at target node cannot be reference ones.
+		 * Indeed, those export symbols are all resolved symbols. They
+		 * must point to a local node using a valid phandle.
+		 */
+		if (fdt_exportsym_is_ref(fdt, exportsym))
+			return -FDT_ERR_BADSTRUCTURE;
+
+		exportsym_name = fdt_exportsym_get_name(fdt, exportsym);
+		if (!exportsym_name)
+			return -FDT_ERR_BADSTRUCTURE;
+
+		phandle = fdt_exportsym_get_phandle(fdt, exportsym);
+		if ((phandle == 0) || (phandle == ~0U))
+			return -FDT_ERR_BADPHANDLE;
+
+		if ((strlen(exportsym_name) != sym_namelen) ||
+		    (memcmp(exportsym_name, sym_name, sym_namelen) != 0))
+			continue;
+
+		ref_node = fdt_node_offset_by_phandle(fdt, phandle);
+		if (ref_node < 0)
+			return -FDT_ERR_NOTFOUND;
+
+		return ref_node;
+	}
+
+	return -FDT_ERR_NOTFOUND;
+}
+
+/**
+ * fdt_resolve_import - Resolve an imported symbol
+ * @fdt: base device tree blob
+ * @target_node: Target node offset in the base device tree blob containing
+ *               the exported symbols used for the resolution.
+ * @importsym_name: Import symbol name
+ * @importsym_compatible: Import symbol compatible string
+ *
+ * returns:
+ *      offset of the node matching the symbol after the resolution on success.
+ *      Negative error code on failure.
+ */
+static int fdt_resolve_import(const void *fdt, int target_node,
+				const char *importsym_name,
+				const char *importsym_compatible)
+{
+	/*
+	 * Do not check the import symbol compatible string against the found
+	 * node. Indeed, the found node can be a node without any compatible
+	 * string and this is perfectly legit.
+	 *
+	 * The purpose of the import symbol compatible string is to give
+	 * information related to the symbol imported.
+	 *
+	 * This can be use by a driver when it wants to dynamically resolve
+	 * imported symbols based on some specific criteria. In that case, the
+	 * compatible string helps the driver to identify the kind of symbol
+	 * expected by the addon.
+	 *
+	 * Here, in libfdt, no driver are available to perform this dynamic
+	 * resolution. Resolve the symbol using only its name.
+	 */
+	return fdt_resolve_symbol(fdt, target_node, importsym_name,
+				  strlen(importsym_name));
+}
+
+static int fdt_check_importsym_offset(const void *fdt, int offset, int *data_offset)
+{
+	int nextoffset, d;
+	uint32_t tag;
+
+	tag = fdt_next_tag(fdt, offset, &nextoffset);
+	switch (tag) {
+	case FDT_IMPORT_SYM:
+		if (data_offset) {
+			d = fdt_get_structured_tag_data(tag, fdt,
+							offset + FDT_TAGSIZE,
+							NULL);
+			if (d < 0)
+				return d;
+			*data_offset = d;
+		}
+		break;
+	default:
+		return -FDT_ERR_BADOFFSET;
+	}
+
+	return nextoffset;
+}
+
+static int fdt_next_importsym_nextoffset_(const void *fdt, int nextoffset)
+{
+	uint32_t tag;
+	int offset;
+
+	do {
+		offset = nextoffset;
+		tag = fdt_next_tag(fdt, offset, &nextoffset);
+
+		switch (tag) {
+		case FDT_IMPORT_SYM:
+			return offset;
+
+		case FDT_END:
+			if (nextoffset < 0)
+				return nextoffset;
+
+			return -FDT_ERR_NOTFOUND;
+		}
+	} while (tag != FDT_IMPORT_SYM);
+
+	return offset;
+}
+
+static int fdt_next_importsym_offset(const void *fdt, int offset)
+{
+	int nextoffset;
+
+	if (offset < 0)
+		return offset;
+
+	nextoffset = fdt_check_importsym_offset(fdt, offset, NULL);
+	if (nextoffset < 0)
+		return nextoffset;
+
+	return fdt_next_importsym_nextoffset_(fdt, nextoffset);
+}
+
+static int fdt_first_importsym_offset(const void *fdt)
+{
+	return fdt_next_importsym_nextoffset_(fdt, 0);
+}
+
+
+static const char *fdt_importsym_get_name(const void *fdt, int offset)
+{
+	int data_offset;
+
+	if (fdt_check_importsym_offset(fdt, offset, &data_offset) < 0)
+		return NULL;
+
+	return fdt_offset_ptr(fdt, data_offset, 1);
+}
+
+static const char *fdt_importsym_get_compatible(const void *fdt, int offset)
+{
+	int data_offset;
+
+	if (fdt_check_importsym_offset(fdt, offset, &data_offset) < 0)
+		return NULL;
+
+	/* Skip name */
+	data_offset = fdt_skip_string(fdt, data_offset);
+
+	return fdt_offset_ptr(fdt, data_offset, 1);
+}
+
+#define fdt_for_each_importsym(importsym, fdt)				\
+	for (importsym = fdt_first_importsym_offset(fdt);		\
+	     importsym >= 0;						\
+	     importsym = fdt_next_importsym_offset(fdt, importsym))
+
+/**
+ * addon_resolve_symbol - Resolve a symbol from an addon
+ * @fdta: Addon device tree blob.
+ * @fdt: base device tree blob
+ * @target_node: Target node the addon is applied to. This node, in the base
+ *               device tree blob, must have exported symbols needed for the
+ *               resolution.
+ * @sym_name: Symbol name
+ * @sym_namelen: Length of the symbol name
+ *
+ * addon_resolve_symbol() resolved a symbol used by an addon using the import
+ * symbol table available in the addon device tree blob.
+ *
+ * returns:
+ *      offset (in the fdt device tree blob) of the node matching the symbol
+ *      after the resolution on success.
+ *      Negative error code on failure.
+ */
+static int addon_resolve_symbol(const void *fdta, const void *fdt, int target_node,
+				const char *sym_name, size_t sym_namelen)
+{
+	const char *importsym_compat;
+	const char *importsym_name;
+	int importsym;
+
+	/* Look at imported symbols */
+	fdt_for_each_importsym(importsym, fdta) {
+		importsym_name = fdt_importsym_get_name(fdta, importsym);
+		if (!importsym_name)
+			return -FDT_ERR_BADSTRUCTURE;
+		importsym_compat = fdt_importsym_get_compatible(fdta, importsym);
+		if (!importsym_compat)
+			return -FDT_ERR_BADSTRUCTURE;
+
+		if ((strlen(importsym_name) != sym_namelen) ||
+		    (memcmp(importsym_name, sym_name, sym_namelen) != 0))
+			continue;
+
+		return fdt_resolve_import(fdt, target_node, importsym_name,
+					  importsym_compat);
+	}
+	/* Not found ... */
+	return -FDT_ERR_NOTFOUND;
+}
+
+/**
+ * addon_resolve_ref - Resolve a reference from an addon
+ * @fdta: Addon device tree blob.
+ * @fdt: base device tree blob
+ * @target_node: Target node the addon is applied to. This node, in the base
+ *               device tree blob, must have exported symbols needed for the
+ *               resolution.
+ * @ref: The reference to resolve
+ *
+ * addon_resolve_ref() resolves a reference used by an addon.
+ * A reference can be composed of several symbols separated by a '.' char.
+ * For instance "foo.bar.baz". To resolve this reference, addon_resolve_ref()
+ * resolves the "foo" symbol the based on node retrieve from this resolution,
+ * it resolves "bar" and so on up to the last symbol available on the reference.
+ *
+ * This last symbol resolution leads to the node offset returned by
+ * addon_resolve_ref().
+ *
+ * returns:
+ *      offset (in the fdt device tree blob) of the node matching the reference
+ *      after the resolution on success.
+ *      Negative error code on failure.
+ */
+static int addon_resolve_ref(const void *fdta, const void *fdt, int target_node,
+			     const char *ref)
+{
+	const char *end = ref + strlen(ref);
+	const char *r = ref;
+	const char *d;
+	int tmp_node;
+
+	/*
+	 * A reference can be "foo.bar.baz" for instance.
+	 * In that case, we need to resolve foo from the target_node exported
+	 * symbols then bar from exported symbols defined in the node retrieve
+	 * from foo resolution and so on to resolve the given reference.
+	 *
+	 * The first symbol (foo in the previous example reference) need to be
+	 * resolved through import symbols to "jump" from the addon to the base
+	 * device tree. The other ones are "jumps" in the base device tree
+	 * without leaving it and so, import symbols are not involved for them.
+	 */
+	tmp_node = target_node;
+	while (r < end) {
+		d = memchr(r, '.', end - r);
+		if (!d)
+			d = end;
+
+		if (r == ref)
+			tmp_node = addon_resolve_symbol(fdta, fdt, tmp_node, r, d-r);
+		else
+			tmp_node = fdt_resolve_symbol(fdt, tmp_node, r, d-r);
+
+		if (tmp_node < 0)
+			return tmp_node;
+
+		r = d + 1;
+	}
+
+	return tmp_node;
+}
+
+/**
+ * addon_resolve_phandles - Resolve addon external references
+ * @fdta: Addon device tree blob
+ * @fdt: Device tree blob the addon is going to be applied to
+ * @target_node: Offset of the node in fdt the addon is going to be applied to
+ *
+ * addon_resolve_phandles() resolved unresolved phandle symbols available in
+ * the addon.
+ *
+ * returns:
+ *      0 on success
+ *      Negative error code on failure
+ */
+static int addon_resolve_phandles(void *fdta, const void *fdt, int target_node)
+{
+	int offset, next_offset, d;
+	int last_prop_offset = -1;
+	int prop_phandle_offset;
+	const fdt32_t *pfdt32;
+	uint32_t phandle;
+	const char *ref;
+	uint32_t tag;
+	int ref_node;
+	int ret;
+
+	/*
+	 * phandles symbols that need to be resolved are:
+	 *   - reference in properties where a FDT_PROPDATA_PHANDLE_REF tag is
+	 *     available
+	 *   - reference in export symbols
+	 */
+
+	next_offset = 0;
+	do {
+		offset = next_offset;
+		tag = fdt_next_tag(fdta, offset, &next_offset);
+		switch (tag) {
+		case FDT_BEGIN_NODE:
+			last_prop_offset = -1;
+			break;
+
+		case FDT_END_NODE:
+			last_prop_offset = -1;
+			break;
+
+		case FDT_PROP:
+			last_prop_offset = offset;
+			break;
+
+		case FDT_NOP:
+			break;
+
+		case FDT_PROPDATA_PHANDLE:
+			break;
+
+		case FDT_PROPDATA_PHANDLE_REF:
+			/*
+			 * A property references an unresolved phandle. Get
+			 * the offset of this phandle in the property data area
+			 * and the reference of the phandle
+			 */
+			d = fdt_get_structured_tag_data(tag, fdta,
+							offset + FDT_TAGSIZE, NULL);
+			if (d < 0)
+				return d;
+
+			pfdt32 = fdt_offset_ptr(fdta, d, sizeof(*pfdt32));
+			prop_phandle_offset = fdt32_to_cpu(*pfdt32);
+
+			d += sizeof(*pfdt32);
+			ref = fdt_offset_ptr(fdta, d, 1);
+
+			/* Resolve this phandle */
+			ref_node = addon_resolve_ref(fdta, fdt, target_node, ref);
+			if (ref_node < 0)
+				return ref_node;
+
+			phandle = fdt_get_phandle(fdt, ref_node);
+			if ((phandle == 0) || (phandle == ~0U))
+				return -FDT_ERR_BADPHANDLE;
+
+			if (last_prop_offset == -1)
+				return -FDT_ERR_BADSTRUCTURE;
+
+			/* Update property value */
+			ret = addon_property_set_val(fdta, last_prop_offset,
+						     prop_phandle_offset,
+						     phandle);
+			if (ret)
+				return ret;
+
+			break;
+
+		case FDT_BEGIN_NODE_REF:
+			last_prop_offset = -1;
+			break;
+
+		case FDT_END:
+			ret = (next_offset < 0) ? next_offset : 0;
+			break;
+
+		case FDT_EXPORT_SYM:
+			break;
+
+		case FDT_EXPORT_SYM_REF:
+			d = fdt_get_structured_tag_data(tag, fdta,
+							offset + FDT_TAGSIZE, NULL);
+			if (d < 0)
+				return d;
+
+			/*
+			 * The export symbol references an unresolved phandle.
+			 * Check that this reference can be resolved correctly.
+			 * Even if there is no simple way to store the resolved
+			 * phandle (resolution will be done again later when
+			 * those export symbols are merged in the base device
+			 * tree), it is consistent to check this resolution now
+			 * in this function.
+			 */
+
+			/* Get the reference */
+			ref = fdt_offset_ptr(fdta, d, 1);
+
+			/* Resolve the phandle */
+			ref_node = addon_resolve_ref(fdta, fdt, target_node, ref);
+			if (ref_node < 0)
+				return ref_node;
+
+			phandle = fdt_get_phandle(fdt, ref_node);
+			if ((phandle == 0) || (phandle == ~0U))
+				return -FDT_ERR_BADPHANDLE;
+
+			break;
+
+		case FDT_IMPORT_SYM:
+			break;
+
+		default:
+			return -FDT_ERR_BADSTRUCTURE;
+		}
+	} while (tag != FDT_END);
+
+	return ret;
+}
+
+/**
+ * addon_replace_local_phandles - Replace the old value of phandles by a new one
+ *				  for a whole addon
+ * @fdta: Device tree addon blob
+ * @old_phandle: Old phandle value
+ * @new_phandle: New phandle value
+ *
+ * addon_replace_local_phandles() replaces phandle values only if the
+ * old_phandle_value matches the current phandle value.
+ *
+ * returns:
+ *      0 on success
+ *      Negative error code on failure
+ */
+static int addon_replace_local_phandles(void *fdta, uint32_t old_phandle,
+					uint32_t new_phandle)
+{
+	int offset, next_offset, d;
+	int last_prop_offset = -1;
+	int prop_phandle_offset;
+	const fdt32_t *pfdt32;
+	fdt32_t *pfdt32w;
+	uint32_t tag;
+	uint32_t val;
+	int ret;
+
+	/*
+	 * phandles that need to be updated are:
+	 *   - phandles in properties where a FDT_PROPDATA_PHANDLE tag is
+	 *     available
+	 *   - phandles in FDT_EXPORT_SYM tags
+	 *
+	 * phandles properties in nodes are replace by
+	 * addon_prevent_phandle_overwrite_node()
+	 */
+
+	next_offset = 0;
+	do {
+		offset = next_offset;
+		tag = fdt_next_tag(fdta, offset, &next_offset);
+		switch (tag) {
+		case FDT_BEGIN_NODE:
+			/*
+			 * "phandle" and/of "linux,phandle" properties are
+			 * already updated by addon_prevent_phandle_overwrite_node()
+			 * Nothing more to update here.
+			 */
+			last_prop_offset = -1;
+			break;
+
+		case FDT_END_NODE:
+			last_prop_offset = -1;
+			break;
+
+		case FDT_PROP:
+			last_prop_offset = offset;
+			break;
+
+		case FDT_NOP:
+			break;
+
+		case FDT_PROPDATA_PHANDLE:
+			/*
+			 * The property references a phandle. Get the offset
+			 * of this phandle in the property data area.
+			 */
+			d = fdt_get_structured_tag_data(tag, fdta,
+							offset + FDT_TAGSIZE, NULL);
+			if (d < 0)
+				return d;
+
+			pfdt32 = fdt_offset_ptr(fdta, d, sizeof(*pfdt32));
+			prop_phandle_offset = fdt32_to_cpu(*pfdt32);
+
+			if (last_prop_offset == -1)
+				return -FDT_ERR_BADSTRUCTURE;
+
+			/* Update the phandle value */
+			ret = addon_property_replace(fdta, last_prop_offset,
+						     prop_phandle_offset,
+						     old_phandle, new_phandle);
+			if (ret)
+				return ret;
+			break;
+
+		case FDT_PROPDATA_PHANDLE_REF:
+			break;
+
+		case FDT_BEGIN_NODE_REF:
+			last_prop_offset = -1;
+			break;
+
+		case FDT_END:
+			ret = (next_offset < 0) ? next_offset : 0;
+			break;
+
+		case FDT_EXPORT_SYM:
+			d = fdt_get_structured_tag_data(tag, fdta,
+							offset + FDT_TAGSIZE, NULL);
+			if (d < 0)
+				return d;
+
+			/* Get phandle pointer */
+			pfdt32w = fdt_offset_ptr_w(fdta, d, sizeof(*pfdt32));
+
+			/* Update the phandle value */
+			val = fdt32_ld(pfdt32w);
+			if (val == old_phandle)
+				fdt32_st(pfdt32w, new_phandle);
+			break;
+
+		case FDT_EXPORT_SYM_REF:
+			break;
+		case FDT_IMPORT_SYM:
+			break;
+
+		default:
+			return -FDT_ERR_BADSTRUCTURE;
+		}
+	} while (tag != FDT_END);
+
+	return ret;
+}
+
+/**
+ * addon_prevent_phandle_overwrite_node - Prevents phandle overwrite for a given
+ *                                        addon node.
+ * @fdta: Addon Device tree blob
+ * @fdta_node: Node in fdta
+ * @fdt: Base device tree blob
+ * @fdt_node: Node in fdt that could be overwrite by the fdta_node
+ *
+ * returns:
+ *      0 on success
+ *      Negative error code on failure
+ */
+static int addon_prevent_phandle_overwrite_node(void *fdta, int fdta_node,
+						const void *fdt, int fdt_node)
+{
+	uint32_t fdta_phandle, fdt_phandle;
+	int fdta_child, fdt_child;
+	const char *name;
+	int ret;
+
+	fdta_phandle = fdt_get_phandle(fdta, fdta_node);
+	fdt_phandle = fdt_get_phandle(fdt, fdt_node);
+
+	if (fdta_phandle && fdt_phandle) {
+		ret = addon_phandle_set_val(fdta, fdta_node, "phandle", fdt_phandle);
+		if (ret && ret != -FDT_ERR_NOTFOUND)
+			return ret;
+
+		ret = addon_phandle_set_val(fdta, fdta_node, "linux,phandle", fdt_phandle);
+		if (ret && ret != -FDT_ERR_NOTFOUND)
+			return ret;
+
+		ret = addon_replace_local_phandles(fdta, fdta_phandle, fdt_phandle);
+		if (ret)
+			return ret;
+	}
+
+	fdt_for_each_subnode(fdta_child, fdta, fdta_node) {
+		name = fdt_get_name(fdta, fdta_child, NULL);
+		if (!name)
+			return -FDT_ERR_BADSTRUCTURE;
+
+		fdt_child = fdt_subnode_offset(fdt, fdt_node, name);
+		if (fdt_child == -FDT_ERR_NOTFOUND) {
+			/*
+			 * No further overwrites possible here as the addon node
+			 * is new node.
+			 */
+			continue;
+		}
+
+		ret = addon_prevent_phandle_overwrite_node(fdta, fdta_child,
+							   fdt, fdt_child);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static const char *fdt_orphan_get_ref(const void *fdt, int offset)
+{
+	int data_offset;
+
+	if (fdt_check_orphan_offset(fdt, offset, &data_offset) < 0)
+		return NULL;
+
+	return fdt_offset_ptr(fdt, data_offset, 1);
+}
+
+/**
+ * addon_prevent_phandles_overwrite - Fixes addon phandles to not overwrite base
+ * phandles
+ * @fdta Addon Device tree blob
+ * @fdt: Base Device Tree blob
+ * @target_node: Target node in the base device tree the addon is going to be
+ *               applied to
+ *
+ * Checks recursively if applying fdta overwrites phandle values in the base
+ * fdt. When such a phandle is found, the fdta is changed to use the fdt's
+ * phandle value to not break references in the base.
+ *
+ * returns:
+ *      0 on success
+ *      Negative error code on failure
+ */
+static int addon_prevent_phandles_overwrite(void *fdta, const void *fdt,
+					    int target_node)
+{
+	int fdt_orphan_target;
+	int addon_root_node;
+	const char *ref;
+	int fdta_orphan;
+	int ret;
+
+	addon_root_node = fdt_root_offset(fdta);
+	if (addon_root_node < 0 && addon_root_node != -FDT_ERR_NOTFOUND)
+		return addon_root_node;
+
+	if (addon_root_node >= 0) {
+		ret = addon_prevent_phandle_overwrite_node(fdta, addon_root_node,
+							   fdt, target_node);
+		if (ret < 0)
+			return ret;
+	}
+
+	fdt_for_each_orphan(fdta_orphan, fdta) {
+		ref = fdt_orphan_get_ref(fdta, fdta_orphan);
+		if (!ref)
+			return -FDT_ERR_BADSTRUCTURE;
+
+		fdt_orphan_target = addon_resolve_ref(fdta, fdt, target_node, ref);
+		if (fdt_orphan_target < 0)
+			return fdt_orphan_target;
+
+		ret = addon_prevent_phandle_overwrite_node(fdta, fdta_orphan,
+							   fdt, fdt_orphan_target);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int fdt_check_propmarker_offset(const void *fdt, int offset,
+				       uint32_t *propmarker_tag, int *data_offset)
+{
+	int nextoffset, d;
+	uint32_t tag;
+
+	tag = fdt_next_tag(fdt, offset, &nextoffset);
+	switch (tag) {
+	case FDT_PROPDATA_PHANDLE:
+	case FDT_PROPDATA_PHANDLE_REF:
+		if (data_offset) {
+			d = fdt_get_structured_tag_data(tag, fdt,
+							offset + FDT_TAGSIZE,
+							NULL);
+			if (d < 0)
+				return d;
+			*data_offset = d;
+		}
+		break;
+	default:
+		return -FDT_ERR_BADOFFSET;
+	}
+
+	if (propmarker_tag)
+		*propmarker_tag = tag;
+
+	return nextoffset;
+}
+
+static int fdt_next_propmarker_nextoffset_(const void *fdt, int nextoffset)
+{
+	uint32_t tag;
+	int offset;
+
+	do {
+		offset = nextoffset;
+		tag = fdt_next_tag(fdt, offset, &nextoffset);
+		switch (tag) {
+		case FDT_EXPORT_SYM:
+			/* We are going to leave the current property (enter an export symbol) */
+			return -FDT_ERR_NOTFOUND;
+
+		case FDT_EXPORT_SYM_REF:
+			/* We are going to leave the current property (enter an export symbol) */
+			return -FDT_ERR_NOTFOUND;
+
+		case FDT_BEGIN_NODE:
+			/* We are going to leave the current property (new sub-node) */
+			return -FDT_ERR_NOTFOUND;
+
+		case FDT_BEGIN_NODE_REF:
+			/* We cannot have a node ref inside an other node */
+			return -FDT_ERR_BADSTRUCTURE;
+
+		case FDT_END_NODE:
+			/* We are going to leave the current node (parent node) */
+			return -FDT_ERR_NOTFOUND;
+
+		case FDT_PROP:
+			/* We are going to leave the current property (enter a new property) */
+			return -FDT_ERR_NOTFOUND;
+
+		case FDT_PROPDATA_PHANDLE:
+			return offset;
+
+		case FDT_PROPDATA_PHANDLE_REF:
+			return offset;
+
+		case FDT_END:
+			if (nextoffset < 0)
+				return nextoffset;
+
+			return -FDT_ERR_NOTFOUND;
+		}
+	} while (tag != FDT_END);
+
+	return offset;
+}
+
+static int fdt_next_propmarker_offset(const void *fdt, int offset)
+{
+	int nextoffset;
+
+	if (offset < 0)
+		return offset;
+
+	nextoffset = fdt_check_propmarker_offset(fdt, offset, NULL, NULL);
+	if (nextoffset < 0)
+		return nextoffset;
+
+	return fdt_next_propmarker_nextoffset_(fdt, nextoffset);
+}
+
+static int fdt_first_propmarker_offset(const void *fdt, int prop_offset)
+{
+	int nextoffset;
+
+	if (prop_offset < 0)
+		return prop_offset;
+
+	nextoffset = fdt_check_prop_offset_(fdt, prop_offset);
+	if (nextoffset < 0)
+		return nextoffset;
+
+	return fdt_next_propmarker_nextoffset_(fdt, nextoffset);
+
+}
+
+static int fdt_propmarker_is_phandle(const void *fdt, int offset)
+{
+	uint32_t tag;
+
+	/*
+	 * Only property 'phandle' markers are currently supported but well,
+	 * prevent some issue that would happen if some other markers are
+	 * added in the future.
+	 */
+
+	/* A propmarker phandle has to be propmarker ... */
+	if (fdt_check_propmarker_offset(fdt, offset, &tag, NULL) < 0)
+		return false;
+
+	/* ... and a 'phandle' */
+	if ((tag != FDT_PROPDATA_PHANDLE) && (tag != FDT_PROPDATA_PHANDLE_REF))
+		return false;
+
+	return true;
+}
+
+static uint32_t fdt_propmarker_phandle_get_propoffset(const void *fdt,
+						      int offset)
+{
+	const fdt32_t *pfdt32;
+	int data_offset;
+
+	if (fdt_check_propmarker_offset(fdt, offset, NULL, &data_offset) < 0)
+		return ~0U;
+
+	pfdt32 = fdt_offset_ptr(fdt, data_offset, sizeof(*pfdt32));
+	if (!pfdt32)
+		return ~0U;
+
+	return fdt32_ld_(pfdt32);
+}
+
+#define fdt_for_each_propmarker(propmarker, fdt, prop)			\
+	for (propmarker = fdt_first_propmarker_offset(fdt, prop);		\
+	     propmarker >= 0;						\
+	     propmarker = fdt_next_propmarker_offset(fdt, propmarker))
+
+static int fdt_mark_property_phandle(void *fdt, int fdt_property,
+				    uint32_t propoffset)
+{
+	int propmarker;
+	uint32_t tmp;
+
+	fdt_for_each_propmarker(propmarker, fdt, fdt_property) {
+		if (!fdt_propmarker_is_phandle(fdt, propmarker))
+			continue;
+
+		tmp = fdt_propmarker_phandle_get_propoffset(fdt, propmarker);
+		if (tmp == ~0U)
+			return -FDT_ERR_BADSTRUCTURE;
+
+		if (tmp == propoffset)
+			return -FDT_ERR_EXISTS;
+	}
+
+	return fdt_mark_property_phandle_(fdt, fdt_property, propoffset);
+}
+
+static int fdt_add_exportsym(void *fdt, int fdt_node,
+			     const char *exportsym_name, uint32_t phandle)
+{
+	const char *tmp;
+	int exportsym;
+
+	fdt_for_each_exportsym(exportsym, fdt, fdt_node) {
+		tmp = fdt_exportsym_get_name(fdt, exportsym);
+		if (!tmp)
+			return -FDT_ERR_BADSTRUCTURE;
+
+		if (!strcmp(tmp, exportsym_name))
+			return -FDT_ERR_EXISTS;
+	}
+
+	return fdt_add_exportsym_(fdt, fdt_node, exportsym_name, phandle);
+}
+
+/**
+ * addon_merge_node_properties - Merges properties available in an addon node
+ *				 into the base device tree node
+ * @fdta: Addon Device Tree blob
+ * @fdta_node: Addon node whose properties have to be merged
+ * @fdt: Base Device Tree blob
+ * @fdt_node: Base node the addon node properties have to be merged into
+ * @is_existing_node: True if the node was already existing in the base device
+ *		      tree blob.
+ *
+ * returns:
+ *      0 on success
+ *      Negative error code on failure
+ */
+static int addon_merge_node_properties(const void *fdta, int fdta_node,
+				       void *fdt, int fdt_node,
+				       bool is_existing_node)
+{
+	const void *prop, *prop2;
+	int prop_len, prop2_len;
+	uint32_t propoffset;
+	int fdta_property;
+	int fdt_property;
+	const char *name;
+	int propmarker;
+	int ret;
+
+	fdt_for_each_property_offset(fdta_property, fdta, fdta_node) {
+		prop = fdt_getprop_by_offset(fdta, fdta_property, &name,
+					     &prop_len);
+		if (prop_len == -FDT_ERR_NOTFOUND)
+			return -FDT_ERR_INTERNAL;
+		if (prop_len < 0)
+			return prop_len;
+
+		if (is_existing_node) {
+			if (!strcmp(name, "phandle") ||
+			    !strcmp(name, "linux,phandle")) {
+				/*
+				 * phandles available in both addon and base dtb
+				 * have the same values. This is ensured by
+				 * previous operation related to phandle
+				 * resolution done in addon_prevent_phandles_overwrite().
+				 * Just skip the property merge.
+				 */
+				continue;
+			}
+
+			/*
+			 * It is not allowed to add or modify a property in an
+			 * existing node.
+			 */
+			prop2 = fdt_getprop(fdt, fdt_node, name, &prop2_len);
+			if (prop2_len == -FDT_ERR_NOTFOUND)
+				return -FDT_ERR_EXISTS; /* Cannot add a property */
+			if (prop2_len < 0)
+				return prop2_len;
+
+			if (prop_len != prop2_len)
+				return -FDT_ERR_EXISTS; /* Cannot modify a property */
+
+			if (memcmp(prop, prop2, prop_len) != 0)
+				return -FDT_ERR_EXISTS; /* Cannot modify a property */
+
+			/*
+			 * The property is already present but it has the exact
+			 * same value. Ok, just skip the property merge.
+			 */
+			continue;
+		}
+
+		ret = fdt_setprop(fdt, fdt_node, name, prop, prop_len);
+		if (ret)
+			return ret;
+
+		/* Retrieve the newly created fdt property offset */
+		fdt_property = fdt_getprop_offset(fdt, fdt_node, name);
+		if (fdt_property < 0)
+			return -FDT_ERR_INTERNAL;
+
+		fdt_for_each_propmarker(propmarker, fdta, fdta_property) {
+			if (!fdt_propmarker_is_phandle(fdta, propmarker))
+				continue;
+
+			propoffset = fdt_propmarker_phandle_get_propoffset(fdta,
+					propmarker);
+			/*
+			 * Mark the property as a local phandle reference.
+			 * Either it was already a local phandle reference in
+			 * the addon or it was an external phandle reference in
+			 * the addon and has been resolved.
+			 * In all cases it is local in the merged device tree
+			 * blob.
+			 */
+			ret = fdt_mark_property_phandle(fdt, fdt_property,
+							propoffset);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+
+/**
+ * addon_merge_node_exports - Merges exported symbols in an addon node
+ *			      into the base device tree node
+ * @fdta: Addon Device Tree blob
+ * @fdta_node: Addon node whose exported symbols have to be merged
+ * @fdt: Base Device Tree blob
+ * @fdt_node: Base node the addon node exported symbols have to be merged into
+ * @is_existing_node: True if the node was already existing in the base device
+ *		      tree blob.
+ * @target_path: Path in the base Device Tree to the node where the addon is
+ *		 applied to. This is the node where export symbols used for symbol
+ *		 resolution are present.
+ *
+ * returns:
+ *      0 on success
+ *      Negative error code on failure
+ */
+static int addon_merge_node_exports(const void *fdta, int fdta_node,
+				    void *fdt, int fdt_node,
+				    bool is_existing_node, const char *target_path)
+{
+	const char *exportsym_name;
+	const char *exportsym_ref;
+	uint32_t phandle;
+	int target_node;
+	int exportsym;
+	int ref_node;
+	int ret;
+
+	fdt_for_each_exportsym(exportsym, fdta, fdta_node) {
+
+		if (is_existing_node) {
+			/*
+			 * It is not allowed to add or modify export symbols in
+			 * existing nodes.
+			 */
+			return -FDT_ERR_EXISTS;
+		}
+
+		exportsym_name = fdt_exportsym_get_name(fdta, exportsym);
+		if (!exportsym_name)
+			return -FDT_ERR_BADSTRUCTURE;
+
+		if (fdt_exportsym_is_ref(fdta, exportsym)) {
+			/*
+			 * The export symbol is a reference one.
+			 * Get the phandle from the node referenced by the
+			 * export symbol reference.
+			 */
+
+			/* Get the reference */
+			exportsym_ref = fdt_exportsym_get_ref(fdta, exportsym);
+			if (!exportsym_ref)
+				return FDT_ERR_BADSTRUCTURE;
+
+			/* Get the target node */
+			target_node = fdt_path_offset(fdt, target_path);
+			if (target_node < 0)
+				return target_node;
+
+			/* Resolve the reference */
+			ref_node = addon_resolve_ref(fdta, fdt, target_node, exportsym_ref);
+			if (ref_node < 0)
+				return ref_node;
+
+			/* Finally get the phandle */
+			phandle = fdt_get_phandle(fdt, ref_node);
+		} else {
+			/*
+			 * The export symbol is not a reference one.
+			 * Get directly the phandle attached the symbol.
+			 */
+			phandle = fdt_exportsym_get_phandle(fdta, exportsym);
+		}
+
+		if ((phandle == 0) || (phandle == ~0U))
+			return -FDT_ERR_BADPHANDLE;
+
+		ret = fdt_add_exportsym(fdt, fdt_node, exportsym_name, phandle);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * addon_merge_node - Merges an addon node and its sub-nodes into the base
+ *                    device tree
+ * @fdta: Addon Device Tree blob
+ * @fdta_node: Addon node to be merged
+ * @fdt: Base Device Tree blob
+ * @fdt_node: Base node the addon node has to be merged into
+ * @is_existing_node: Flag set to true if the node already exist in the Base
+ *                    Device Tree blob
+ * @target_path: Path in the base Device Tree to the node where the addon is
+ *		 applied to. This is the node where export symbols used for symbol
+ *		 resolution are present.
+ *
+ * returns:
+ *      0 on success
+ *      Negative error code on failure
+ */
+static int addon_merge_node(const void *fdta, int fdta_node, void *fdt,
+			    int fdt_node, bool is_existing_node,
+			    const char *target_path)
+{
+	bool is_existing;
+	int fdta_subnode;
+	const char *name;
+	int fdt_subnode;
+	int ret;
+
+	ret = addon_merge_node_exports(fdta, fdta_node, fdt, fdt_node,
+				       is_existing_node, target_path);
+	if (ret)
+		return ret;
+
+	ret = addon_merge_node_properties(fdta, fdta_node, fdt, fdt_node,
+					  is_existing_node);
+	if (ret)
+		return ret;
+
+	fdt_for_each_subnode(fdta_subnode, fdta, fdta_node) {
+		name = fdt_get_name(fdta, fdta_subnode, NULL);
+
+		is_existing = false;
+		fdt_subnode = fdt_add_subnode(fdt, fdt_node, name);
+		if (fdt_subnode == -FDT_ERR_EXISTS) {
+			is_existing = true;
+			fdt_subnode = fdt_subnode_offset(fdt, fdt_node, name);
+			if (fdt_subnode == -FDT_ERR_NOTFOUND)
+				return -FDT_ERR_INTERNAL;
+		}
+
+		if (fdt_subnode < 0)
+			return fdt_subnode;
+
+		ret = addon_merge_node(fdta, fdta_subnode, fdt, fdt_subnode,
+				       is_existing, target_path);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int addon_merge(void *fdta, void *fdt, const char *target_path)
+{
+	int fdt_orphan_target;
+	int fdta_orphan;
+	const char *ref;
+	int target_node;
+	int ret;
+
+	/* Get the target node from its path */
+	target_node = fdt_path_offset(fdt, target_path);
+	if (target_node < 0)
+		return target_node;
+
+	/* Merge the addon root node into the base target_node */
+	ret = addon_merge_node(fdta, 0, fdt, target_node, true, target_path);
+	if (ret < 0)
+		return ret;
+
+	fdt_for_each_orphan(fdta_orphan, fdta) {
+		ref = fdt_orphan_get_ref(fdta, fdta_orphan);
+		if (!ref)
+			return -FDT_ERR_BADSTRUCTURE;
+
+		fdt_orphan_target = addon_resolve_ref(fdta, fdt, target_node, ref);
+		if (fdt_orphan_target < 0)
+			return fdt_orphan_target;
+
+		ret = addon_merge_node(fdta, fdta_orphan, fdt, fdt_orphan_target,
+				       true, target_path);
+		if (ret < 0)
+			return ret;
+
+		/*
+		 * An orphan node has been merged. The merged node can be
+		 * anywhere in the fdt. Depending on the location of the merged
+		 * node in the fdt, the target node offset can be no longer
+		 * valid.
+		 *
+		 * Reload the offset from the target path to have a valid value.
+		 */
+		target_node = fdt_path_offset(fdt, target_path);
+		if (target_node < 0)
+			return target_node;
+	}
+
+	return 0;
+}
+
+int fdt_addon_apply(void *fdt, void *fdta, const char *target)
+{
+	int target_node;
+	uint32_t delta;
+	int ret;
+
+	FDT_RO_PROBE(fdt);
+	FDT_RO_PROBE(fdta);
+
+	/* Get the target node */
+	target_node = fdt_path_offset(fdt, target);
+	if (target_node < 0)
+		return target_node;
+
+	ret = fdt_find_max_phandle(fdt, &delta);
+	if (ret)
+		return ret;
+
+	/* Increase all phandles in the fdta by delta */
+	ret = addon_adjust_local_phandles(fdta, delta);
+	if (ret)
+		goto err;
+
+	/* Resolve phandles */
+	ret = addon_resolve_phandles(fdta, fdt, target_node);
+	if (ret < 0)
+		goto err;
+
+	/* Don't overwrite phandles in fdt */
+	ret = addon_prevent_phandles_overwrite(fdta, fdt, target_node);
+	if (ret < 0)
+		goto err;
+
+	ret = addon_merge(fdta, fdt, target);
+	if (ret < 0)
+		goto err;
+
+	/* The addon has been damaged, erase its magic */
+	fdt_set_magic(fdta, ~0);
+
+	return 0;
+
+err:
+	/* The addon might have been damaged, erase its magic */
+	fdt_set_magic(fdta, ~0);
+
+	/* The base device tree might have been damaged, erase its magic */
+	fdt_set_magic(fdt, ~0);
+
+	return ret;
+}
diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
index 30f3da40..e0c01af5 100644
--- a/libfdt/fdt_rw.c
+++ b/libfdt/fdt_rw.c
@@ -553,6 +553,75 @@ int fdt_delprop(void *fdt, int nodeoffset, const char *name)
 	return fdt_splice_struct_(fdt, prop, proplen, 0);
 }
 
+int fdt_mark_property_phandle_(void *fdt, int fdt_property, uint32_t propoffset)
+{
+	fdt32_t *markerp;
+	int nextoffset;
+	int err;
+
+	FDT_RW_PROBE(fdt);
+
+	nextoffset = fdt_check_prop_offset_(fdt, fdt_property);
+	if (nextoffset < 0)
+		return nextoffset;
+
+	/* Insert the marker at next_offset, i.e. right after the property */
+	markerp = fdt_offset_ptr_w_(fdt, nextoffset);
+	err = fdt_splice_struct_(fdt, markerp, 0, FDT_TAGSIZE + FDT_CELLSIZE);
+	if (err)
+		return err;
+
+	*(markerp++) = cpu_to_fdt32(FDT_PROPDATA_PHANDLE);
+	*markerp = cpu_to_fdt32(propoffset);
+
+	return 0;
+}
+
+int fdt_add_exportsym_(void *fdt, int nodeoffset, const char *name,
+		       uint32_t phandle)
+{
+	int namelen, exportlen, datalen;
+	int nextoffset;
+	char *p;
+	int err;
+
+	FDT_RW_PROBE(fdt);
+
+	nextoffset = fdt_check_node_offset_(fdt, nodeoffset);
+	if (nextoffset < 0)
+		return nextoffset;
+
+	/*
+	 * nextoffset it at the first tag after the node.
+	 * Skip possible unknown tags and metadata tags related to the node in
+	 * order to add the new export sym tag after those tags.
+	 */
+	nextoffset = fdt_node_skip_unknown_and_metadata_tags(fdt, nextoffset);
+	if (nextoffset < 0)
+		return nextoffset;
+
+
+	p = fdt_offset_ptr_w_(fdt, nextoffset);
+	namelen = strlen(name);
+	datalen = FDT_CELLSIZE + namelen + 1;
+	exportlen = FDT_TAGSIZE + FDT_CELLSIZE + FDT_CELLALIGN(datalen);
+
+	err = fdt_splice_struct_(fdt, p, 0, exportlen);
+	if (err)
+		return err;
+
+	*((fdt32_t *)p) = cpu_to_fdt32(FDT_EXPORT_SYM);
+	p += FDT_TAGSIZE;
+	*((fdt32_t *)p) = cpu_to_fdt32(datalen);
+	p += FDT_CELLSIZE;
+	*((fdt32_t *)p) = cpu_to_fdt32(phandle);
+	p += FDT_CELLSIZE;
+	memset(p, 0, FDT_CELLALIGN(namelen+1));
+	memcpy(p, name, namelen);
+
+	return 0;
+}
+
 int fdt_add_subnode_namelen(void *fdt, int parentoffset,
 			    const char *name, int namelen)
 {
diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index ee811266..3ef29beb 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -2538,6 +2538,38 @@ int fdt_overlay_apply(void *fdt, void *fdto);
 int fdt_overlay_target_offset(const void *fdt, const void *fdto,
 			      int fragment_offset, char const **pathp);
 
+/**
+ * fdt_addon_apply - Applies a DT addon on a base DT
+ * @fdt: pointer to the base device tree blob
+ * @fdta: pointer to the device tree addon blob
+ * @target: target node path
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
+int fdt_addon_apply(void *fdt, void *fdta, const char *target);
+
 /**********************************************************************/
 /* Debugging / informational functions                                */
 /**********************************************************************/
diff --git a/libfdt/libfdt_internal.h b/libfdt/libfdt_internal.h
index be47639d..9379a510 100644
--- a/libfdt/libfdt_internal.h
+++ b/libfdt/libfdt_internal.h
@@ -51,6 +51,11 @@ static inline int fdt_getprop_offset(const void *fdt, int nodeoffset,
 	return fdt_getprop_offset_namelen(fdt, nodeoffset, name, strlen(name));
 }
 
+int fdt_mark_property_phandle_(void *fdt, int fdt_property,
+			       uint32_t propoffset);
+int fdt_add_exportsym_(void *fdt, int nodeoffset, const char *name,
+		       uint32_t phandle);
+
 const char *fdt_find_string_len_(const char *strtab, int tabsize, const char *s,
 				 int s_len);
 static inline const char *fdt_find_string_(const char *strtab, int tabsize,
diff --git a/libfdt/meson.build b/libfdt/meson.build
index 68d4c1d1..a6e875f4 100644
--- a/libfdt/meson.build
+++ b/libfdt/meson.build
@@ -9,6 +9,7 @@ sources = files(
   'fdt_check.c',
   'fdt_empty_tree.c',
   'fdt_overlay.c',
+  'fdt_addon.c',
   'fdt_ro.c',
   'fdt_rw.c',
   'fdt_strerror.c',
diff --git a/libfdt/version.lds b/libfdt/version.lds
index d0b71669..74925ac0 100644
--- a/libfdt/version.lds
+++ b/libfdt/version.lds
@@ -83,6 +83,7 @@ LIBFDT_1.2 {
 		fdt_overlay_target_offset;
 		fdt_get_symbol;
 		fdt_get_symbol_namelen;
+		fdt_addon_apply;
 	local:
 		*;
 };
-- 
2.55.0

