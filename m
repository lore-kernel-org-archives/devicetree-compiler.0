Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D93213E77
	for <devicetree-compiler@vger.kernel.org>; Fri, 10 Jan 2025 17:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736531357; cv=none; b=cb41cg2pbyTzpwmm5eEXbUv2ifIXt1z4YCG8mc50Dw6eMIo20l/BrKB7eCdt01vcWrZTdmryFxF7ueN/UxbIGHNcftArGzSgoS1mf+neAoPaxkaxjsIdXLyC8wsxHZ1hSxvv7V9kfvo88pfVs6fmpEScJEGJdIU9yFdpmfzXods=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736531357; c=relaxed/simple;
	bh=p6pKfXFdccLQIPb3E7Lhc75aSmliq1YMf7I3L4juIvA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hqd3a6eDdBYtnkdBdU+2tGSL/pPhUz4GpFONlhh+RNkI9Rs6deDU+PJpirPVnkM5CkkoERQN4jOJ/T0TVZyVyEMaNV9YMESXP68jVxyh76x6mcjj+yeAJprs1kwbhkfynciufIo2McY+1UxdZOyFZ7NRVloed4mb34Jg6I3jIZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=ERuADTaD; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="ERuADTaD"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2ee76befe58so3844530a91.2
        for <devicetree-compiler@vger.kernel.org>; Fri, 10 Jan 2025 09:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1736531354; x=1737136154; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wVJvovo8q692xcWQql8S0zLB65EmH8ogjBGFzi+weh0=;
        b=ERuADTaD8u7EBHECQtZIaL1ljntbv/IdFrd53YU4gc9sGyrkDWil+Ipl8+Gx2Z83Vk
         3NfdRZf8bYcwFjFnEDFkKvwu2dE5em775Riz3F1+zRYaCp+iNAqTsMKs94pGi1+9W8Fq
         gmKeS0wv2AiA6t1/sfgH3om/CrnfphZRnou3nXPOr0o49FGJapPdb/VIGVx2e9ohc4sz
         hncNpMLi2smCz+8FbT1fgvcigkEGFY6PeV4gjSnAudhO6NNmFlE3MTCypmO9A1SbI7TA
         WdIJMNk88cCnd3kHmZN5ac1xxxhm0nRMvoebujNUYbjoRKv+1BEnB6q+gbcl8NUcNtY3
         RX8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736531354; x=1737136154;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wVJvovo8q692xcWQql8S0zLB65EmH8ogjBGFzi+weh0=;
        b=VWiDH9r6+DhL+aCYjzAC4bB8ASFPo27lKqyJatPJjKXbScDgsvGj6U1P99rOU2qGe9
         UjucLkslKexVjUWgJ5y3ACESz5geGH4HIyBEEBRlqDmRb8iSBpi1IXalVkHT5kjm78II
         JYYNWEhMFQHfaZaKEauKzukQN+B2RmaBKOKDhcPF00bmlnQanwJQ4qzuE/lXmH8iEtQk
         EMbYSKXqw2FZpXaU4rwZrtVPrKXm9OoKkhtx07hkBWyShf22e6z7qk1HhpdhmS0VS2ly
         sSY9bfm3T0ZSX1++ELvaOe/NokaQ+xQysbEQ86fUeOoGx2xfv+b2s8KUetmO4zFiASSX
         cI5g==
X-Gm-Message-State: AOJu0YxSQUwGH/HWaryUetufGds5+/3jUDn205RAMMiiFVbPGlcpGfgM
	ZpwviNvA09lnHO0dL8dLKIex0Y+d5Oet9pNSmjQj375FdMVkmxwZ6Ft2AsjHfQ==
X-Gm-Gg: ASbGncswtpBgaN0szo9Id4F+Um/x9Uwv68ZAyzeAJi/L4ZKqvfVM0L2sE6WABjpwZKZ
	QxwuN+mwRNoxnfjuqOk42tAE8OWAegb6RRPvY+cz3pp/ervvXp3ITEil4tMDTib/2C/xNKT1Sh8
	HNAhQHHj5AtxCVhL1qaWWsJQPE5JjCvKYtTAcyzFDphEDtGbZ8UKaWAKJIF1uXHZDkZeV+ui4/V
	4YXXZ/uBIgNxPzi6vnyxWSp0cuNYjHSGa0/Txc0TIn9Ab4UIS2RWfzZW6TcbB0=
X-Google-Smtp-Source: AGHT+IGrEWW8NHZR/ofOd5qeZ2pHxqsSZ4oy0LOngIL2E1C1hIEMNT6YFP5SOsU7bOGHCcnwhizyiA==
X-Received: by 2002:a17:90b:37c5:b0:2ea:3f34:f18d with SMTP id 98e67ed59e1d1-2f548eae685mr18117121a91.10.1736531354351;
        Fri, 10 Jan 2025 09:49:14 -0800 (PST)
Received: from [172.16.116.58] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f5592c112asm3589918a91.0.2025.01.10.09.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 09:49:13 -0800 (PST)
From: Ayush Singh <ayush@beagleboard.org>
Date: Fri, 10 Jan 2025 23:18:55 +0530
Subject: [PATCH] checks: Add support for export-symbols
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-export-symbols-v1-1-b6213fcd6c82@beagleboard.org>
X-B4-Tracking: v=1; b=H4sIAIZdgWcC/x3MQQ5AMBBG4avIrDVpKxZcRSyKH5PQSkeENO6us
 fwW7yUSRIZQWySKuFg4+AxTFjSuzi9QPGWT1bbWxmiF+wjxVPLsQ9hEwcJV06wNXEM5OiJmvv9
 h17/vByF8dG9gAAAA
X-Change-ID: 20250110-export-symbols-e2ea3df01ea9
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3768; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=p6pKfXFdccLQIPb3E7Lhc75aSmliq1YMf7I3L4juIvA=;
 b=owEBbQKS/ZANAwAIAQXO9ceJ5Vp0AcsmYgBngV2TzgPsG5X+1S9C4DZFNtJfeEMwo7cLFqoxK
 kcwzz68/sWJAjMEAAEIAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCZ4FdkwAKCRAFzvXHieVa
 dCuZD/4//CJJ7nZj1XQXg8oRSca6joNjXMpmDOP8oL06HA4ICMadTrfj8O+46f5/orjKBslnnwU
 9306///r4pTkeJPykLeHRxkP9n3N+iI9qz88ispO/juh7RFYM5A5dBIud346+IbgJQKlGp9oRqx
 8FPH2IBOiZzDLyIv3NNSH0LD/poMnjKmK2sQZzHcDWTZnEHL39+pkJGLJybG+yObezCy08Psr9Y
 eEm4SrZ0Kyi/9AhdTLAMn0vRG8Y7VV4Z9I6RZEMX2GmrfxN1jLfWGaPANlZNBO6pBf7gH9hVaT6
 LzSrpZ2SQH+d6WU+hxQmr153xY7LflpONthGiaUTQxeHnZZsAsoEG5S+r/Q49RN8QulKf4R76Lp
 5dYU3cxUl8U2XQJyJSxcJ0NpVsgyzqqfC8l9Sb55Mtc/BrtCSh1A3zqIn8r2EILaey4aBh74etT
 K6HIR212bxcHuTqmTbgGYx+BEUGN5f89hjRnUcIt02G+qQsOA8jBdUV19apwwULGf+vwnXnEMwN
 X106xqVilcY/SLJpnRzPucdfJ5+iJRREaLyuV8NPud7NFplVJtjhynqWCfRdxOQ/75+ATZOCCed
 aYqGOCnL+X1pRQqKOASqMAB0lxB3/uPmgSexXtsfNjup4wZKsBvJCVvXpGuxTAMDJ7ABG5cvutr
 ueU3vbdwF0JiVrA==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

The export symbols node adds some additional symbols that can be used
in the symbols resolution. The resolver tries to match unresolved
symbols first using the export symbols node and, if a match is not
found, it tries the normal route and walks the tree.

Contrary to symbols available in the global __symbols__ node, symbols
listed in the export symbols node can be considered as local symbols.
Indeed, they can be changed depending on the node the overlay is going
to be applied to and are only visible from the current node properties.

export-symbols are phandle based as opposed to global __symbols__. This
allows for much simpler use with overlays as opposed to __symbols__
where paths require resizing of overlays as show in [0].

[0]: https://lore.kernel.org/devicetree-compiler/6b2dba90-3c52-4933-88f3-b47f96dc7710@beagleboard.org/T/#m8259c8754f680b9da7b91f7b7dd89f10da91d8ed

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
As discussed in the export-symbols kernel patch series [0], the
following patch series adds support for export-symbols in the base
devicetree compiler.

This patch series is mostly a prototype for the functionality. Depending
on the direction, next revision of the patch will add tests.

Support for export-symbols in overlays will be part of a seperate patch
series.

[0]: https://lore.kernel.org/all/20241209151830.95723-1-herve.codina@bootlin.com/
---
 checks.c | 42 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 40 insertions(+), 2 deletions(-)

diff --git a/checks.c b/checks.c
index 123f2eb425f4a2f8ac22bfe10a842bf08e296ba1..e577f30a3ed9b762aee073fa1ff9d866f5de60b6 100644
--- a/checks.c
+++ b/checks.c
@@ -600,11 +600,37 @@ ERROR(name_properties, check_name_properties, NULL, &name_is_string);
  * Reference fixup functions
  */
 
+static const char *fixup_export_symbol(struct node *export_symbols,
+				       struct marker *m)
+{
+	struct property *prop;
+	struct marker *em;
+
+	for_each_property(export_symbols, prop) {
+		if (streq(m->ref, prop->name)) {
+			em = prop->val.markers;
+			for_each_marker_of_type(em, REF_PHANDLE) {
+				return em->ref;
+			}
+		}
+	}
+
+	return NULL;
+}
+
 static void fixup_phandle_references(struct check *c, struct dt_info *dti,
 				     struct node *node)
 {
 	struct node *dt = dti->dt;
 	struct property *prop;
+	struct node *child, *export_symbols = NULL;
+
+	for_each_child(node, child) {
+		if (streq(child->name, "export-symbols")) {
+			export_symbols = child;
+			break;
+		}
+	}
 
 	for_each_property(node, prop) {
 		struct marker *m = prop->val.markers;
@@ -612,13 +638,25 @@ static void fixup_phandle_references(struct check *c, struct dt_info *dti,
 		cell_t phandle;
 
 		for_each_marker_of_type(m, REF_PHANDLE) {
+			const char *ref = NULL;
+
 			assert(m->offset + sizeof(cell_t) <= prop->val.len);
 
-			refnode = get_node_by_ref(dt, m->ref);
+			/* Check export-symbols if present */
+			if (export_symbols)
+				ref = fixup_export_symbol(export_symbols, m);
+
+			/* If entry not found in export-symbols (or export-symbols not present), 
+			 * search the normal way.
+			 */
+			if (!ref)
+				ref = m->ref;
+
+			refnode = get_node_by_ref(dt, ref);
 			if (! refnode) {
 				if (!(dti->dtsflags & DTSF_PLUGIN))
 					FAIL(c, dti, node, "Reference to non-existent node or "
-							"label \"%s\"\n", m->ref);
+							"label \"%s\"\n", ref);
 				else /* mark the entry as unresolved */
 					*((fdt32_t *)(prop->val.val + m->offset)) =
 						cpu_to_fdt32(0xffffffff);

---
base-commit: 18f4f305fdd7e14c8941658a29c7b85c27d41de4
change-id: 20250110-export-symbols-e2ea3df01ea9

Best regards,
-- 
Ayush Singh <ayush@beagleboard.org>

