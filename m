Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8541B6D1F
	for <devicetree-compiler@vger.kernel.org>; Sat, 11 Jan 2025 19:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736623762; cv=none; b=EK3nwVFcjpjDMJT7ITclGtkPe1Ai6IgWIIv4lc+5EdA1Aqms1rqe5q2BAdEhNDvGnznFuDQyy3vK49ejPO4efFAzvOzaoSaHu+zmnj9+FbiovNrFgld+/ibggxDOubHZwaOFA7+AhdidsYvU2Sg4j8Ad5YHl3KdbfhVCUaHZOqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736623762; c=relaxed/simple;
	bh=D1xmYb+xoY1KbuGb09cTUgObryqWUVkpIPglHl3t8lc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Bto0c/xCVCvxiRYcH2JmhCBUSkKCHRACqGCHfkPi4mdgJANZTR2X7P7LWIaB6RoiUnSqHFcC2cB1dFweZa0NrDjNgoc57HJeLds2dW5xnnwRYfcF1Xl2QtLd+bmPVMAu5t3U3KHsM4yEud6JDI0Ay8F7qUF9rrEUFjyjoOb13VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=t3tfPGSz; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="t3tfPGSz"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-21669fd5c7cso53632865ad.3
        for <devicetree-compiler@vger.kernel.org>; Sat, 11 Jan 2025 11:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1736623760; x=1737228560; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9MpSNK07QU1pxIhuGvoOaIJWxXG6fPWaUP+PezLSoxM=;
        b=t3tfPGSziodblVZO7mMoEl7mBNuwdrpj4hGp3Lm42OXVUhpBJeT0Hti61T8NFPDqc9
         HJW9rL7EmQx9Q7WnRNDyR3autLkgK+WxLt+T2BdePDWngE5Jpge7fZNWIaSCKrG0l2As
         ZjLhjsG8e4v925ULcNSjUBy+VRE1fXpVSWDKF2kj7Yfg9QcPeQi+qyzGwGTtuuL9/l8u
         f7641leMeKJVdtJmYWX1FN8J9i23BHAPYQCYnlg8wc6hb0qa0OzJBzfPIVDaI/M8aknU
         uZuO8nQXvz/uxdnEPgl0eOTHm3NzqA5pdXKbH7u42uQeWb6SQu05C6BeI/IDPb5l85Eb
         h6fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736623760; x=1737228560;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9MpSNK07QU1pxIhuGvoOaIJWxXG6fPWaUP+PezLSoxM=;
        b=GPTWMPAYlRNTOaor3I1PRUhXxNC4JxieJRtZreRqIsanp2ZO8zKPESGyD9o2IkOPCo
         MdkQ1D5sXMeOIVFZKk/xWgQgYkhUApHLZy1y5GQd0kKSFvqnefWxzJd+NWRrNfRm8OKQ
         I6ZXoUMy3Q0E68gvgAJJ/osU0OufV5eiKvR3ftt5JKzip87mNDXMYHRRWSatMpNYNVMi
         Z4X9Hwxi+OATXxHELtW8VAna4ki9O68QE9FdSxu2/H/aPGbZ9pJzJtw9FAH1FSdbuuSp
         zzN2gdAnHAWUrXXI+wCyJrodtPJtk3vDnW9wJ05SZrmWkOsTXIXj+DtE107DDJfvHqwV
         gRIg==
X-Gm-Message-State: AOJu0YyCaMNtBZ3QuiiLN09jI4tHQ7Vkqs5GV+J2lhLKiK6e/h40adLS
	jWNnRKdX2wIZWL1fuhNiWdK/PYZtSA3rJgfLGs8xZuTQm9g7xpbOdHu9Bmi+OA==
X-Gm-Gg: ASbGncsaHmG3dsFo1DTB1ahmMyxLmDHQ8ktmiZw/AqP+fX7lwpbQ+bpm4Inus6c4cTA
	pH3OqRFYZQx3jEOnNAZrdC1bPXBKcj+c/y3J/IR2V4f6ww4HJefQhM7SzfqYmUajUZCQe5R0gkW
	D4e3Z24kVupcOIMR3I0N7Iv5x9e8ajcXO+Ad8sd/vHc04wZnwShojaRZvP7HkFwMQk99+qYLsxA
	D/LlIARMqGBVlWh2DdBJ74Li5m/I8Jge9qZz+rC9mSc2sY+QOk1PBRl2E9gHNw=
X-Google-Smtp-Source: AGHT+IG2O4zqVBV+2L8NMadi4Z8JD4jTbz/JHgGY8xwH68+3xQ1odV4o4nc9hMXJyyidi7KOxPeyNg==
X-Received: by 2002:a17:902:d2d2:b0:215:b9a6:5cb9 with SMTP id d9443c01a7336-21a83f439b0mr234316175ad.5.1736623759687;
        Sat, 11 Jan 2025 11:29:19 -0800 (PST)
Received: from [172.16.116.58] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f10e3fasm30604865ad.45.2025.01.11.11.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 11:29:19 -0800 (PST)
From: Ayush Singh <ayush@beagleboard.org>
Date: Sun, 12 Jan 2025 00:58:52 +0530
Subject: [PATCH] libfdt: overlay: Add export-symbols support
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250112-export-symbols-overlay-v1-1-e94526d349ef@beagleboard.org>
X-B4-Tracking: v=1; b=H4sIAHPGgmcC/x3M3QpAQBBA4VfRXJva3fzEq8jFYjCF1YxE8u42l
 9/FOQ8oCZNCnTwgdLJy2CJsmkA/+20i5CEanHG5sdYiXXuQA/Veu7AohpNk8Tf6rCJT9G4ouxx
 ivAuNfP3jpn3fD6KqKXxoAAAA
X-Change-ID: 20250111-export-symbols-overlay-a49e06c2d7b5
To: d-gole@ti.com, lorforlinux@beagleboard.org, jkridner@beagleboard.org, 
 robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com, 
 Andrew Davis <afd@ti.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Robert Nelson <robertcnelson@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Saravana Kannan <saravanak@google.com>, 
 Herve Codina <herve.codina@bootlin.com>, 
 David Gibson <david@gibson.dropbear.id.au>
Cc: devicetree-compiler@vger.kernel.org, 
 Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=12616;
 i=ayush@beagleboard.org; h=from:subject:message-id;
 bh=D1xmYb+xoY1KbuGb09cTUgObryqWUVkpIPglHl3t8lc=;
 b=owEBbQKS/ZANAwAIAQXO9ceJ5Vp0AcsmYgBngsaBBtBjq47a29BUTMzGjhtDsQEaA/LYhd1W7
 IyBaR9PZpqJAjMEAAEIAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCZ4LGgQAKCRAFzvXHieVa
 dJ4nD/wP+1W7LGAdK7kdyAJE0joIyCAO32pPNQlxYGTJfxNGYktpCmgJXq4u+Vj9RSBC+6aWzO/
 wLDpni1p28H06syhyA9K8KLGxpnQEPjW/9Lrqf/oIJljaafBpEwKU+5CqjxOJ9NjgFCSW60MDvM
 O7IuGzEI+FOdedS5OFttvV4X5w7ZU0nZsFiY1WGIAAE6O4xoKYFdfwGCASmZQJz79MtwSj+01co
 J+Evgl6eFqU5O2uIueBB1OigWuRf3LmHEoA6p1s26vfky1On+Ptv8y2u+aY/rVRsCjOAjZoQinA
 R4QYixKp9SoveqPWKNVYAoV7D3jnNU0khNDgmqniFD5FRJ0Al1dzet8ExE0F19eGdqauMzmuOEv
 U1rUrWnLHgKhmIn60FWNuJV+tmQcRoucwvZkehe4WJkWeEdj5R0W+HnafGik6VinLL95MB/PJu2
 Sdom80SAg+hxCoLc9gEnj5sUatQ1U1iE+50CCpUbe/sRvxD3y2AqQFEpC9x7TDQA3yC8uszjNdo
 cvD8MeawO7ksrOP28ahX8ncWpDXF65ZCP5fVYRbdJsrnzY+f+2Hr+3d6j/mOnNIDIOzhnYFcanv
 Ja4SiCaHQvRp+uNxP4+S6RIiotXhYC2uAz2p+GyWzt1kLFECFssnw7kqTIZxCasepey/YYVD3Ms
 jS+2xZFRm0RLguA==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

The export symbols node adds some additional symbols that can be used
in the symbols resolution. The resolver tries to match unresolved
symbols first using the export symbols node and, if a match is not
found, it tries the normal route and searches the __symbols__ node.

Contrary to symbols available in the global __symbols__ node, symbols
listed in the export symbols node can be considered as local symbols.
Indeed, they can be changed depending on the node the overlay is going
to be applied to and are only visible from the current node properties.

export-symbols are phandle based as opposed to global __symbols__. This
allows for much simpler use with overlays as opposed to __symbols__
where paths require resizing of overlays as show in [0].

The phandle resolution in overlay is now broken into 2 steps:
- fragment target phandles
- All other phandles

The reason this is required is because to find the export-symbols node
in the target node, we first need to resolve the target phandles. Here
is an example of overlay that will generate the target __fixup__ after
the property fixup, and thus fail without this 2 step resolution.

```
/dts-v1/;
/plugin/;

&connectora {
  prop = <&gpio_connector>;
};

&connectorb {
  prop = <&gpio_connector>;
};
```

Using fdtdump, we get the following:

```
**** fdtdump is a low-level debugging tool, not meant for general use.
**** If you want to decompile a dtb, you probably want
****     dtc -I dtb -O dts <filename>

/dts-v1/;
// magic:               0xd00dfeed
// totalsize:           0x1b1 (433)
// off_dt_struct:       0x38
// off_dt_strings:      0x180
// off_mem_rsvmap:      0x28
// version:             17
// last_comp_version:   16
// boot_cpuid_phys:     0x0
// size_dt_strings:     0x31
// size_dt_struct:      0x148

/ {
    fragment@0 {
        target = <0xffffffff>;
        __overlay__ {
            prop = <0xffffffff>;
        };
    };
    fragment@1 {
        target = <0xffffffff>;
        __overlay__ {
            prop = <0xffffffff>;
        };
    };
    __fixups__ {
        connectora = "/fragment@0:target:0";
        gpio_connector = "/fragment@0/__overlay__:prop:0", "/fragment@1/__overlay__:prop:0";
        connectorb = "/fragment@1:target:0";
    };
};
```

[0]: https://lore.kernel.org/devicetree-compiler/6b2dba90-3c52-4933-88f3-b47f96dc7710@beagleboard.org/T/#m8259c8754f680b9da7b91f7b7dd89f10da91d8ed

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
As discussed in the export-symbols kernel patch series [0] and [1], the
following patch series adds support for export-symbols in fdtoverlay.

This patch series is mostly a prototype for the functionality. Depending
on the direction, next revision of the patch will add tests.

[0]: https://lore.kernel.org/all/20241209151830.95723-1-herve.codina@bootlin.com/
[1]: https://lore.kernel.org/r/20250110-export-symbols-v1-1-b6213fcd6c82@beagleboard.org
---
 libfdt/fdt_overlay.c | 245 ++++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 222 insertions(+), 23 deletions(-)

diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
index e6b9eb6439585364ff4e84eecacea7a61bcc67eb..7cb22308d524244fef1b1700c116a2284cb5d840 100644
--- a/libfdt/fdt_overlay.c
+++ b/libfdt/fdt_overlay.c
@@ -352,26 +352,58 @@ static int overlay_fixup_one_phandle(void *fdto, int symbols_off,
 }
 
 /**
- * overlay_fixup_phandle - Set an overlay phandle to the base one
+ * is_fragment_target - Check if fixup entry is fragment target.
+ * @fixup_str: fixup string
+ * @fixup_len: fixup string length
+ * returns:
+ *      0 on is not fragment target
+ *      1 on is fragment target
+ *      Negative error code on failure
+ */
+static int is_fragment_target(const char *fixup_str, uint32_t fixup_len,
+			      uint32_t *flen)
+{
+	const char *sep;
+	char *endptr;
+
+	sep = memchr(fixup_str, '@', fixup_len);
+	if (!sep || *sep != '@')
+		return -FDT_ERR_BADOVERLAY;
+
+	strtoul(sep + 1, &endptr, 10);
+	if (endptr <= (sep + 1))
+		return -FDT_ERR_BADOVERLAY;
+
+	*flen = endptr - fixup_str;
+
+	if (*endptr == '/' || strcmp(endptr, ":target:0") != 0)
+		return 0;
+
+	return 1;
+}
+
+/**
+ * overlay_fixup_target_phandle - Set an overlay phandle to the base one for 
+ *                                fragment targets.
  * @fdt: Base Device Tree blob
  * @fdto: Device tree overlay blob
  * @symbols_off: Node offset of the symbols node in the base device tree
  * @property: Property offset in the overlay holding the list of fixups
  *
- * overlay_fixup_phandle() resolves all the overlay phandles pointed
- * to in a __fixups__ property, and updates them to match the phandles
+ * overlay_fixup_target_phandle() resolves overlay fragment target phandles
+ * pointed to in a __fixups__ property, and updates them to match the phandles
  * in use in the base device tree.
  *
  * This is part of the device tree overlay application process, when
- * you want all the phandles in the overlay to point to the actual
+ * you want all the target phandles in the overlay to point to the actual
  * base dt nodes.
  *
  * returns:
  *      0 on success
  *      Negative error code on failure
  */
-static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
-				 int property)
+static int overlay_fixup_target_phandle(void *fdt, void *fdto, int symbols_off,
+					int property)
 {
 	const char *value;
 	const char *label;
@@ -390,23 +422,155 @@ static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
 		return len;
 	}
 
+	/* symbol_path should not be NULL for target phandles, but we cannot find out
+	 * if the fixup has any fragment targets in advance.
+	 */
 	symbol_path = fdt_getprop(fdt, symbols_off, label, &prop_len);
-	if (!symbol_path)
-		return prop_len;
-	
-	symbol_off = fdt_path_offset(fdt, symbol_path);
-	if (symbol_off < 0)
-		return symbol_off;
-	
-	phandle = fdt_get_phandle(fdt, symbol_off);
-	if (!phandle)
-		return -FDT_ERR_NOTFOUND;
+	if (symbol_path) {
+		symbol_off = fdt_path_offset(fdt, symbol_path);
+		if (symbol_off < 0)
+			return symbol_off;
+
+		phandle = fdt_get_phandle(fdt, symbol_off);
+		if (!phandle)
+			return -FDT_ERR_NOTFOUND;
+	}
 
+	/* Fragment targets have a format of `/fragment@{num}:target:0` while all
+	 * other nodes will have a format
+	 * `/fragment@{num}/__overlay__{optional_subnode}:{property}:{offset}`
+	 */
 	do {
-		const char *path, *name, *fixup_end;
+		const char *path, *fixup_end;
 		const char *fixup_str = value;
-		uint32_t path_len, name_len;
-		uint32_t fixup_len;
+		uint32_t path_len, fixup_len;
+		int ret;
+
+		fixup_end = memchr(value, '\0', len);
+		if (!fixup_end)
+			return -FDT_ERR_BADOVERLAY;
+		fixup_len = fixup_end - fixup_str;
+
+		len -= fixup_len + 1;
+		value += fixup_len + 1;
+
+		ret = is_fragment_target(fixup_str, fixup_len, &path_len);
+		if (ret < 0)
+			return ret;
+		else if (ret == 0)
+			continue;
+
+		/* Since found a target property, check that symbol_path is not empty */
+		if (!symbol_path)
+			return -FDT_ERR_NOTFOUND;
+
+		path = fixup_str;
+		if (path_len == (fixup_len - 1))
+			return -FDT_ERR_BADOVERLAY;
+
+		ret = overlay_fixup_one_phandle(fdto, symbols_off, path,
+						path_len, "target",
+						sizeof("target") - 1, 0,
+						phandle);
+		if (ret)
+			return ret;
+	} while (len > 0);
+
+	return 0;
+}
+
+/*
+ * find_export_symbol - retrieves the phandle to a symbol from export-symbols
+ *                      in a node in the base devicetreee.
+ * @fdt: pointer to base devicetreee blob
+ * @parent: base node offset
+ * @symbol: symbol name
+ *
+ * returns:
+ *      the phandle pointed by the target property
+ *      0, if the phandle was not found
+ */
+static fdt32_t find_export_symbol(void *fdt, int parent, const char *symbol)
+{
+	int child;
+	int property;
+	int lenp;
+	const char *value;
+	const char *label;
+
+	fdt_for_each_subnode(child, fdt, parent) {
+		const char *node_name = fdt_get_name(fdt, child, NULL);
+		if (strcmp(node_name, "export-symbols") == 0) {
+			fdt_for_each_property_offset(property, fdt, child) {
+				value = fdt_getprop_by_offset(fdt, property,
+							      &label, &lenp);
+
+				if (strcmp(label, symbol) == 0) {
+					return fdt32_ld((const fdt32_t *)value);
+				}
+			}
+		}
+	}
+
+	return 0;
+}
+
+/**
+ * overlay_fixup_non_target_phandle - Set an overlay phandle to the base one for
+ *                                    phandles other than fragment targets.
+ * @fdt: Base Device Tree blob
+ * @fdto: Device tree overlay blob
+ * @symbols_off: Node offset of the symbols node in the base device tree
+ * @property: Property offset in the overlay holding the list of fixups
+ *
+ * overlay_fixup_non_target_phandle() resolves all overlay phandles except
+ * fragment targets pointed to in a __fixups__ property, and updates them to
+ * match the phandles in use in the base device tree.
+ *
+ * This is part of the device tree overlay application process, when
+ * you want all the phandles in the overlay to point to the actual
+ * base dt nodes.
+ *
+ * returns:
+ *      0 on success
+ *      Negative error code on failure
+ */
+static int overlay_fixup_non_target_phandle(void *fdt, void *fdto,
+					    int symbols_off, int property)
+{
+	const char *value;
+	const char *label;
+	int len;
+	const char *symbol_path;
+	int prop_len;
+	int symbol_off;
+	uint32_t symbol_phandle;
+
+	value = fdt_getprop_by_offset(fdto, property, &label, &len);
+	if (!value) {
+		if (len == -FDT_ERR_NOTFOUND)
+			return -FDT_ERR_INTERNAL;
+
+		return len;
+	}
+
+	/* The node can still be present in export-symbols */
+	symbol_path = fdt_getprop(fdt, symbols_off, label, &prop_len);
+	if (symbol_path) {
+		symbol_off = fdt_path_offset(fdt, symbol_path);
+		if (symbol_off < 0)
+			return symbol_off;
+
+		symbol_phandle = fdt_get_phandle(fdt, symbol_off);
+		if (!symbol_phandle)
+			return -FDT_ERR_NOTFOUND;
+	}
+
+	do {
+		const char *path, *name, *fixup_end, *target_path;
+		const char *fixup_str = value;
+		uint32_t path_len, name_len, fixup_len, fragment_len,
+			target_phandle;
 		char *sep, *endptr;
 		int poffset, ret;
 
@@ -418,7 +582,14 @@ static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
 		len -= fixup_len + 1;
 		value += fixup_len + 1;
 
+		ret = is_fragment_target(fixup_str, fixup_len, &fragment_len);
+		if (ret < 0)
+			return ret;
+		else if (ret == 1)
+			continue;
+
 		path = fixup_str;
+
 		sep = memchr(fixup_str, ':', fixup_len);
 		if (!sep || *sep != ':')
 			return -FDT_ERR_BADOVERLAY;
@@ -441,9 +612,25 @@ static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
 		if ((*endptr != '\0') || (endptr <= (sep + 1)))
 			return -FDT_ERR_BADOVERLAY;
 
-		ret = overlay_fixup_one_phandle(fdto, symbols_off,
-						path, path_len, name, name_len,
-						poffset, phandle);
+		ret = fdt_path_offset_namelen(fdto, path, fragment_len);
+		if (ret < 0)
+			return -FDT_ERR_BADOVERLAY;
+
+		ret = fdt_overlay_target_offset(fdt, fdto, ret, &target_path);
+		if (ret < 0)
+			return ret;
+
+		target_phandle = find_export_symbol(fdt, ret, label);
+		if (!target_phandle) {
+			if (!symbol_path)
+				return -FDT_ERR_NOTFOUND;
+
+			target_phandle = symbol_phandle;
+		}
+
+		ret = overlay_fixup_one_phandle(fdto, symbols_off, path,
+						path_len, name, name_len,
+						poffset, target_phandle);
 		if (ret)
 			return ret;
 	} while (len > 0);
@@ -485,10 +672,22 @@ static int overlay_fixup_phandles(void *fdt, void *fdto)
 	if ((symbols_off < 0 && (symbols_off != -FDT_ERR_NOTFOUND)))
 		return symbols_off;
 
+	/* Resolve all target phandles */
+	fdt_for_each_property_offset(property, fdto, fixups_off) {
+		int ret;
+
+		ret = overlay_fixup_target_phandle(fdt, fdto, symbols_off,
+						   property);
+		if (ret)
+			return ret;
+	}
+
+	/* Resolve all other phandles */
 	fdt_for_each_property_offset(property, fdto, fixups_off) {
 		int ret;
 
-		ret = overlay_fixup_phandle(fdt, fdto, symbols_off, property);
+		ret = overlay_fixup_non_target_phandle(fdt, fdto, symbols_off,
+						       property);
 		if (ret)
 			return ret;
 	}

---
base-commit: 18f4f305fdd7e14c8941658a29c7b85c27d41de4
change-id: 20250111-export-symbols-overlay-a49e06c2d7b5

Best regards,
-- 
Ayush Singh <ayush@beagleboard.org>

