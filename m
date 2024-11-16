Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA757D51C
	for <devicetree-compiler@vger.kernel.org>; Sat, 16 Nov 2024 15:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731769267; cv=none; b=UYx8AWhzcXuvnFu7m9eVlKlBerNh/XywZi8pw/G8Cq3YStlvgFyq09b9am1l6s8KVVMKRP499FxuKz/Wy+jSjw/8NCkTXcBCPuT+jet5JLSyAP/hOBKaMWP+9cFDMCJNxM6MuS5cwkAKTA1/lqWF7c0NjPnLoET71aznSoYRVQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731769267; c=relaxed/simple;
	bh=fMrpxUphYbuj4wfzI8uHLdTF3jdxhPdZv5WAfsV3krM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HGA8YkoofDnYPT8mN002+uOk/AuMc7xSPWwQfWT2dcX1XF7FRnQ9QAooSO/KoFkmivl8nui/jeEnYVxWw7am9vz3R5goTlRTLAe54u1rsV0mTLG8H0xgom8mO/qji/N7k/CMYaqCQss/+F6RRtRnvs9r3pvxEVcP7N3pIz48u2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=aIssQTL/; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="aIssQTL/"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-20c714cd9c8so3992285ad.0
        for <devicetree-compiler@vger.kernel.org>; Sat, 16 Nov 2024 07:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1731769265; x=1732374065; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KcK0Rgw9Mm3mHhcF0IMFkhtaWspddwMoIqOY8bsx6rM=;
        b=aIssQTL/3KlF/8PgxWNs6ltwX3Og35mfXB2rot0IKhfp9102OXyQypVpJgKIn0fSkI
         mzKcCutjBDlt/rvUF5taxvJRPwPcjYSKZ5hNlok7gSY39MpbSdZDIlr4QVQbOqb4SnP3
         /cyYQjV7TLSF1gO9RtUVTvhkeXVdnQv4OOikj3KW58qGWRn3U/KGKJ4sHyVoq3qk+yqU
         b/g8njD4McwjnlU86uf+95/lQb8nESux5Daf8tg+n4NkzmF/NgVlZF0ONX5gHkiN1qiE
         PP5m5TOI4xMEembRCqW1OcsneLXWTWYYdD5vqIgj1F5zXjqsY/u3in759uJ30yhRCMd1
         fdIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731769265; x=1732374065;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KcK0Rgw9Mm3mHhcF0IMFkhtaWspddwMoIqOY8bsx6rM=;
        b=hhQmka6j7ViWzAnoy3QEaBPzleEY4TWv3YauXfPLqJBSz/18s+FCW2f3Y6dR0i0iOA
         rmORcsfWg1n0VZr5R3yGC1MYrQIuwwWZwyy5v9ZUHHZM5mV/rxxKhmia1Opfvdh62igv
         58ISCpUobM1y1+yQBuJGXi2ivow4eTAoKgpVKB5JInqsBxqI28s4MUK90habFNi1OEyQ
         Hk+RFpGxP6pw898tIOXheD3ImlFN0kepo28IiW8RXRS654oufSEfMAcrEGFftUcfTaYJ
         +imvHCBWcN9JdVf4czN08jhEuTSO8pCkaE0X/tiMpdtEL3CKUDFHhW/44taG74hN8VnP
         uPlw==
X-Gm-Message-State: AOJu0YxmPfmivuBWcq4AuNeFphijuhHLZBF+L/K/tqoC0YLfOeuD2vGM
	n2Wts1yGIvJlYV3aBIRjW/XrI24KifpgG046qKSPIBetc7WIn4CH6omTDHzYpQ==
X-Google-Smtp-Source: AGHT+IHUX6bm+K60flVzLFZpYI5tbB8QLai4vQdfh2G3VhQVwgsV4ITY2VgNxD23eLh9nE8Te8RDvA==
X-Received: by 2002:a17:902:d4cd:b0:211:fb9c:b1ce with SMTP id d9443c01a7336-211fb9cb652mr18721935ad.17.1731769264990;
        Sat, 16 Nov 2024 07:01:04 -0800 (PST)
Received: from [172.16.118.100] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f4694bsm28492305ad.196.2024.11.16.07.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Nov 2024 07:01:04 -0800 (PST)
From: Ayush Singh <ayush@beagleboard.org>
Date: Sat, 16 Nov 2024 20:30:21 +0530
Subject: [PATCH 3/5] fdtoverlay: Implement resolving path references
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241116-overlay-path-v1-3-ac3e121359e9@beagleboard.org>
References: <20241116-overlay-path-v1-0-ac3e121359e9@beagleboard.org>
In-Reply-To: <20241116-overlay-path-v1-0-ac3e121359e9@beagleboard.org>
To: d-gole@ti.com, lorforlinux@beagleboard.org, jkridner@beagleboard.org, 
 robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com, 
 Andrew Davis <afd@ti.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Robert Nelson <robertcnelson@gmail.com>
Cc: devicetree-compiler@vger.kernel.org, 
 Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=16264;
 i=ayush@beagleboard.org; h=from:subject:message-id;
 bh=fMrpxUphYbuj4wfzI8uHLdTF3jdxhPdZv5WAfsV3krM=;
 b=owEBbQKS/ZANAwAIAQXO9ceJ5Vp0AcsmYgBnOLOhtjdfk+xl6dZA6iUoDStJ9cXg9C9VZhMod
 rYCjdUWeb+JAjMEAAEIAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCZzizoQAKCRAFzvXHieVa
 dMKFD/4glj5M5rnA+d/JwWLe4jRFqxlX7e2suuQsm23nM7AYQsiWDNlU8g3RevvlhtYOK0AY40g
 fV8ilIk9ZpaHEFZvXXbbp+Fhy1KE8IaqKHe1G7o1PJPboEdjs0Z5MrG4ff6ZE/+RzCwfvxwmZgR
 lFn+S/wdeSGrD6LU/jrAOut10E7PzjRrMgKVH0Hl6euotJGLbPj7FuVHB99dy8QIzmADDQau5uM
 ybB9NjF5G92yL05pyPxl4RTauxgcRWt+VjjShF7jMel5u21sktVsIJDjfPQIkayAcJyz2asvUdL
 kPS4CKeZZvTOZU3H65GnUFG44/50rmKQHZv0vxLjRERfNHnhk47wmg0SyQZPajIMOeeiBQktKZi
 ROpsb9f7DAFbAeZV0822Tz8AIbDp7V2rXHo2i0EFMlNerax1R1ihdGz/ReFf6kozMFscjng+gfS
 L2ZiCuLg9KVsChdXcXxjP2lmfghaOAIfr+Y1hsv9vllZHxPkhZC9iETjUYh7uf0ZBsyqI7ukR8W
 JOq/yzG72vKt1EaO6cV1y/D75he7ZI+P7ueSUhvbEGB+zQvC3b1XdI6wkDC4O/b5EJocRo5goiK
 jEp86DNVSyR8wWlDyYQ7JuwPmbIgiE3dpY1SFrnFBlzo6XjEBpe/uAtbrinr2Z1fdEuCDqwDVFf
 tQ4UX5/7PZ/FFAw==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

dts allows references both in integer context:
	foo = <&bar>;
in which case it resolves to a phandle, but also in string/bytestring
context:
	foo = &bar;
In which case it resolves to a path.

Runtime overlays, only support the former, but not the latter.

This patch implements resolving path references when applying overlays.

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
 fdtoverlay.c         |  34 +++++++---
 libfdt/fdt_overlay.c | 174 ++++++++++++++++++++++++++++++---------------------
 libfdt/libfdt.h      |  30 ++++++++-
 libfdt/version.lds   |   1 +
 4 files changed, 160 insertions(+), 79 deletions(-)

diff --git a/fdtoverlay.c b/fdtoverlay.c
index ee1eb8f3ad28b14762aca9ab5c8a4e36aac967d8..3b6e666212f7c6742ab1e7897c5a0288ff4049ac 100644
--- a/fdtoverlay.c
+++ b/fdtoverlay.c
@@ -44,16 +44,36 @@ static void *apply_one(char *base, const char *overlay, size_t *buf_len,
 		       const char *name)
 {
 	char *tmp = NULL;
-	char *tmpo;
+	char *tmpo = NULL;
 	int ret;
 	bool has_symbols;
+	size_t tmpo_len = fdt_totalsize(overlay);
 
-	/*
-	 * We take copies first, because a failed apply can trash
-	 * both the base blob and the overlay
-	 */
-	tmpo = xmalloc(fdt_totalsize(overlay));
+	/* Prepare DT overlay */
+	do {
+		tmpo = xrealloc(tmpo, tmpo_len);
+
+		ret = fdt_open_into(overlay, tmpo, tmpo_len);
+		if (ret) {
+			fprintf(stderr,
+				"\nFailed to make temporary copy of overlay: %s\n",
+				fdt_strerror(ret));
+			goto fail;
+		}
+
+		ret = fdt_overlay_prepare(base, tmpo);
+		if (ret == -FDT_ERR_NOSPACE) {
+			tmpo_len += BUF_INCREMENT;
+		}
+	} while (ret == -FDT_ERR_NOSPACE);
+
+	if (ret) {
+		fprintf(stderr, "\nFailed to prepare overlay '%s': %s\n", name,
+			fdt_strerror(ret));
+		goto fail;
+	}
 
+	/* Apply DT overlay to base tree */
 	do {
 		tmp = xrealloc(tmp, *buf_len);
 		ret = fdt_open_into(base, tmp, *buf_len);
@@ -66,8 +86,6 @@ static void *apply_one(char *base, const char *overlay, size_t *buf_len,
 		ret = fdt_path_offset(tmp, "/__symbols__");
 		has_symbols = ret >= 0;
 
-		memcpy(tmpo, overlay, fdt_totalsize(overlay));
-
 		ret = fdt_overlay_apply(tmp, tmpo);
 		if (ret == -FDT_ERR_NOSPACE) {
 			*buf_len += BUF_INCREMENT;
diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
index 28b667ffc490e5a24a2b116714eb218d8d16a995..a912bfc580363b5a1376a2b89397db0e7e93a7df 100644
--- a/libfdt/fdt_overlay.c
+++ b/libfdt/fdt_overlay.c
@@ -10,6 +10,7 @@
 #include <libfdt.h>
 
 #include "libfdt_internal.h"
+#include "../util.h"
 
 /**
  * overlay_get_target_phandle - retrieves the target phandle of a fragment
@@ -306,7 +307,7 @@ static int overlay_update_local_references(void *fdto, uint32_t delta)
 }
 
 /**
- * overlay_fixup_one_phandle - Set an overlay phandle to the base one
+ * overlay_fixup_one_path_or_phandle - Set an overlay path/phandle to the base one
  * @fdt: Base Device Tree blob
  * @fdto: Device tree overlay blob
  * @symbols_off: Node offset of the symbols node in the base device tree
@@ -315,27 +316,30 @@ static int overlay_update_local_references(void *fdto, uint32_t delta)
  * @name: Name of the property holding the phandle reference in the overlay
  * @name_len: number of name characters to consider
  * @poffset: Offset within the overlay property where the phandle is stored
- * @phandle: Phandle referencing the node
+ * @symbol_path: path of the pointed node
  *
- * overlay_fixup_one_phandle() resolves an overlay phandle pointing to
- * a node in the base device tree.
+ * overlay_fixup_one_path_or_phandle() resolves an overlay path/phandle pointing 
+ * to a node in the base device tree.
  *
  * This is part of the device tree overlay application process, when
- * you want all the phandles in the overlay to point to the actual
+ * you want all the paths/phandles in the overlay to point to the actual
  * base dt nodes.
  *
  * returns:
  *      0 on success
  *      Negative error code on failure
  */
-static int overlay_fixup_one_phandle(void *fdt, void *fdto,
-				     int symbols_off,
-				     const char *path, uint32_t path_len,
-				     const char *name, uint32_t name_len,
-				     int poffset, uint32_t phandle)
+static int overlay_fixup_one_path_or_phandle(const void *fdt, void *fdto,
+					     int symbols_off, const char *path,
+					     uint32_t path_len,
+					     const char *name,
+					     uint32_t name_len, int poffset,
+					     const char *symbol_path)
 {
+	const void *prop;
+	int fixup_off, prop_len, symbol_off;
+	uint32_t phandle;
 	fdt32_t phandle_prop;
-	int fixup_off;
 
 	if (symbols_off < 0)
 		return symbols_off;
@@ -346,45 +350,60 @@ static int overlay_fixup_one_phandle(void *fdt, void *fdto,
 	if (fixup_off < 0)
 		return fixup_off;
 
-	phandle_prop = cpu_to_fdt32(phandle);
-	return fdt_setprop_inplace_namelen_partial(fdto, fixup_off,
-						   name, name_len, poffset,
-						   &phandle_prop,
-						   sizeof(phandle_prop));
+	prop = fdt_getprop_namelen(fdto, fixup_off, name, name_len, &prop_len);
+	if (!prop)
+		return -FDT_ERR_BADOVERLAY;
+
+	/* path references are empty dt properties in overlay */
+	if (prop_len == 0) {
+		return fdt_setprop_namelen_string(fdto, fixup_off, name,
+						  name_len, symbol_path);
+	} else {
+		symbol_off = fdt_path_offset(fdt, symbol_path);
+		if (symbol_off < 0)
+			return symbol_off;
+
+		phandle = fdt_get_phandle(fdt, symbol_off);
+		if (!phandle)
+			return -FDT_ERR_NOTFOUND;
+		phandle_prop = cpu_to_fdt32(phandle);
+		return fdt_setprop_inplace_namelen_partial(
+			fdto, fixup_off, name, name_len, poffset, &phandle_prop,
+			sizeof(phandle_prop));
+	}
 };
 
 /**
- * overlay_fixup_phandle - Set an overlay phandle to the base one
+ * overlay_fixup_path_or_phandle - Set an overlay path/phandle to the base one
  * @fdt: Base Device Tree blob
  * @fdto: Device tree overlay blob
+ * @fixups: Device tree overlay ro copy
  * @symbols_off: Node offset of the symbols node in the base device tree
  * @property: Property offset in the overlay holding the list of fixups
  *
- * overlay_fixup_phandle() resolves all the overlay phandles pointed
- * to in a __fixups__ property, and updates them to match the phandles
- * in use in the base device tree.
+ * overlay_fixup_path_or_phandle() resolves all the overlay paths/phandles
+ * pointed to in a __fixups__ property, and updates them to match the
+ * paths/phandles in use in the base device tree.
  *
  * This is part of the device tree overlay application process, when
- * you want all the phandles in the overlay to point to the actual
+ * you want all the paths/phandles in the overlay to point to the actual
  * base dt nodes.
  *
  * returns:
  *      0 on success
  *      Negative error code on failure
  */
-static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
-				 int property)
+static int overlay_fixup_path_or_phandle(const void *fdt, void *fdto,
+					 const void *fixups, int symbols_off,
+					 int property)
 {
 	const char *value;
 	const char *label;
 	int len;
 	const char *symbol_path;
 	int prop_len;
-	int symbol_off;
-	uint32_t phandle;
 
-	value = fdt_getprop_by_offset(fdto, property,
-				      &label, &len);
+	value = fdt_getprop_by_offset(fixups, property, &label, &len);
 	if (!value) {
 		if (len == -FDT_ERR_NOTFOUND)
 			return -FDT_ERR_INTERNAL;
@@ -395,14 +414,6 @@ static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
 	symbol_path = fdt_getprop(fdt, symbols_off, label, &prop_len);
 	if (!symbol_path)
 		return prop_len;
-	
-	symbol_off = fdt_path_offset(fdt, symbol_path);
-	if (symbol_off < 0)
-		return symbol_off;
-	
-	phandle = fdt_get_phandle(fdt, symbol_off);
-	if (!phandle)
-		return -FDT_ERR_NOTFOUND;
 
 	do {
 		const char *path, *name, *fixup_end;
@@ -415,6 +426,7 @@ static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
 		fixup_end = memchr(value, '\0', len);
 		if (!fixup_end)
 			return -FDT_ERR_BADOVERLAY;
+
 		fixup_len = fixup_end - fixup_str;
 
 		len -= fixup_len + 1;
@@ -443,9 +455,10 @@ static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
 		if ((*endptr != '\0') || (endptr <= (sep + 1)))
 			return -FDT_ERR_BADOVERLAY;
 
-		ret = overlay_fixup_one_phandle(fdt, fdto, symbols_off,
-						path, path_len, name, name_len,
-						poffset, phandle);
+		ret = overlay_fixup_one_path_or_phandle(fdt, fdto, symbols_off,
+							path, path_len, name,
+							name_len, poffset,
+							symbol_path);
 		if (ret)
 			return ret;
 	} while (len > 0);
@@ -454,26 +467,26 @@ static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
 }
 
 /**
- * overlay_fixup_phandles - Resolve the overlay phandles to the base
- *                          device tree
+ * overlay_fixup_paths_or_phandles - Resolve the overlay paths/phandles to the
+ *                                   base device tree
  * @fdt: Base Device Tree blob
  * @fdto: Device tree overlay blob
  *
- * overlay_fixup_phandles() resolves all the overlay phandles pointing
- * to nodes in the base device tree.
+ * overlay_fixup_paths_or_phandles() resolves all the overlay paths/phandles
+ * pointing to nodes in the base device tree.
  *
  * This is one of the steps of the device tree overlay application
- * process, when you want all the phandles in the overlay to point to
+ * process, when you want all the paths/phandles in the overlay to point to
  * the actual base dt nodes.
  *
  * returns:
  *      0 on success
  *      Negative error code on failure
  */
-static int overlay_fixup_phandles(void *fdt, void *fdto)
+static int overlay_fixup_paths_or_phandles(const void *fdt, void *fdto)
 {
-	int fixups_off, symbols_off;
-	int property;
+	void *tmp = NULL;
+	int fixups_off, symbols_off, property, depth = 0, ret;
 
 	/* We can have overlays without any fixups */
 	fixups_off = fdt_path_offset(fdto, "/__fixups__");
@@ -487,15 +500,30 @@ static int overlay_fixup_phandles(void *fdt, void *fdto)
 	if ((symbols_off < 0 && (symbols_off != -FDT_ERR_NOTFOUND)))
 		return symbols_off;
 
-	fdt_for_each_property_offset(property, fdto, fixups_off) {
-		int ret;
+	ret = fdt_next_node(fdto, fixups_off, &depth);
+	if (ret < 0)
+		return ret;
 
-		ret = overlay_fixup_phandle(fdt, fdto, symbols_off, property);
+	/* resolving path references will resize the overlay and make fixup references
+	 * invalid. So use a ro copy for reading fixups.
+	 */
+	tmp = xmalloc(fdt_totalsize(fdto));
+	memcpy(tmp, fdto, fdt_totalsize(fdto));
+
+	fdt_for_each_property_offset(property, tmp, fixups_off)
+	{
+		ret = overlay_fixup_path_or_phandle(fdt, fdto, tmp, symbols_off,
+						    property);
 		if (ret)
-			return ret;
+			goto cleanup;
 	}
 
-	return 0;
+	ret = 0;
+
+cleanup:
+	free(tmp);
+
+	return ret;
 }
 
 /**
@@ -653,7 +681,7 @@ static int overlay_update_local_conflicting_references(void *fdto,
  *      0 on success
  *      Negative error code on failure
  */
-static int overlay_prevent_phandle_overwrite_node(void *fdt, int fdtnode,
+static int overlay_prevent_phandle_overwrite_node(const void *fdt, int fdtnode,
 						  void *fdto, int fdtonode)
 {
 	uint32_t fdt_phandle, fdto_phandle;
@@ -712,7 +740,7 @@ static int overlay_prevent_phandle_overwrite_node(void *fdt, int fdtnode,
  *      0 on success
  *      Negative error code on failure
  */
-static int overlay_prevent_phandle_overwrite(void *fdt, void *fdto)
+static int overlay_prevent_phandle_overwrite(const void *fdt, void *fdto)
 {
 	int fragment;
 
@@ -766,8 +794,7 @@ static int overlay_prevent_phandle_overwrite(void *fdt, void *fdto)
  *      0 on success
  *      Negative error code on failure
  */
-static int overlay_apply_node(void *fdt, int target,
-			      void *fdto, int node)
+static int overlay_apply_node(void *fdt, int target, const void *fdto, int node)
 {
 	int property;
 	int subnode;
@@ -828,7 +855,7 @@ static int overlay_apply_node(void *fdt, int target,
  *      0 on success
  *      Negative error code on failure
  */
-static int overlay_merge(void *fdt, void *fdto)
+static int overlay_merge(void *fdt, const void *fdto)
 {
 	int fragment;
 
@@ -904,7 +931,7 @@ static int get_path_len(const void *fdt, int nodeoffset)
  *      0 on success
  *      Negative error code on failure
  */
-static int overlay_symbol_update(void *fdt, void *fdto)
+static int overlay_symbol_update(void *fdt, const void *fdto)
 {
 	int root_sym, ov_sym, prop, path_len, fragment, target;
 	int len, frag_name_len, ret, rel_path_len;
@@ -1039,7 +1066,7 @@ static int overlay_symbol_update(void *fdt, void *fdto)
 	return 0;
 }
 
-int fdt_overlay_apply(void *fdt, void *fdto)
+int fdt_overlay_prepare(const void *fdt, void *fdto)
 {
 	uint32_t delta;
 	int ret;
@@ -1061,8 +1088,8 @@ int fdt_overlay_apply(void *fdt, void *fdto)
 	if (ret)
 		goto err;
 
-	/* Update fdto's phandles using symbols from fdt */
-	ret = overlay_fixup_phandles(fdt, fdto);
+	/* Update fdto's paths and phandles using symbols from fdt */
+	ret = overlay_fixup_paths_or_phandles(fdt, fdto);
 	if (ret)
 		goto err;
 
@@ -1071,6 +1098,23 @@ int fdt_overlay_apply(void *fdt, void *fdto)
 	if (ret)
 		goto err;
 
+	return 0;
+err:
+	/*
+	 * The overlay might have been damaged, erase its magic.
+	 */
+	fdt_set_magic(fdto, ~0);
+
+	return ret;
+}
+
+int fdt_overlay_apply(void *fdt, const void *fdto)
+{
+	int ret = 0;
+
+	FDT_RO_PROBE(fdt);
+	FDT_RO_PROBE(fdto);
+
 	ret = overlay_merge(fdt, fdto);
 	if (ret)
 		goto err;
@@ -1079,19 +1123,9 @@ int fdt_overlay_apply(void *fdt, void *fdto)
 	if (ret)
 		goto err;
 
-	/*
-	 * The overlay has been damaged, erase its magic.
-	 */
-	fdt_set_magic(fdto, ~0);
-
 	return 0;
 
 err:
-	/*
-	 * The overlay might have been damaged, erase its magic.
-	 */
-	fdt_set_magic(fdto, ~0);
-
 	/*
 	 * The base device tree might have been damaged, erase its
 	 * magic.
diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index 999b3800dff5c001b9c1babf370d45024c81a9aa..c14b778108427d0d578b86bc79f18dc88be05524 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -2215,6 +2215,34 @@ int fdt_add_subnode(void *fdt, int parentoffset, const char *name);
  */
 int fdt_del_node(void *fdt, int nodeoffset);
 
+/**
+ * fdt_overlay_prepare - Prepares DT overlay for merging with base DT
+ * @fdt: const pointer to the base device tree blob
+ * @fdto: pointer to the device tree overlay blob
+ *
+ * fdt_overlay_prepare() will take care of any resizing/prepartion of the
+ * given device tree overlay.
+ *
+ * returns:
+ *	0, on success
+ *	-FDT_ERR_NOSPACE, there's not enough space in the device tree overlay
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
+int fdt_overlay_prepare(const void *fdt, void *fdto);
+
 /**
  * fdt_overlay_apply - Applies a DT overlay on a base DT
  * @fdt: pointer to the base device tree blob
@@ -2244,7 +2272,7 @@ int fdt_del_node(void *fdt, int nodeoffset);
  *	-FDT_ERR_BADSTATE,
  *	-FDT_ERR_TRUNCATED, standard meanings
  */
-int fdt_overlay_apply(void *fdt, void *fdto);
+int fdt_overlay_apply(void *fdt, const void *fdto);
 
 /**
  * fdt_overlay_target_offset - retrieves the offset of a fragment's target
diff --git a/libfdt/version.lds b/libfdt/version.lds
index 989cd89f1051ce59255a3b3e60493be4e5e985cc..88ef44bb19ec69aabac61a1254264966e0a9d668 100644
--- a/libfdt/version.lds
+++ b/libfdt/version.lds
@@ -66,6 +66,7 @@ LIBFDT_1.2 {
 		fdt_stringlist_search;
 		fdt_stringlist_get;
 		fdt_resize;
+		fdt_overlay_prepare;
 		fdt_overlay_apply;
 		fdt_get_string;
 		fdt_find_max_phandle;

-- 
2.47.0

