Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692283;
	b=zOWnp1gQyfWLVIYSotTFt+WbVoyP3tTV0Z3OcFW18D2Nfq2qjHWf7V2IfswOHWiJxDZK
	 WHSvhwN7DhToTDXCoHVQ0SkcHBMna9gdpRLiMIisFQjhP02M9SNjAFLzOks2b4hcI9nEs
	 AYHXk8/ED3Gi/bFmpN9VaE+hIU5CKwf70v5TUxuvaoAihPAm1BcTno1hWf7ZKbaCaB3SS
	 eeL/ZtXUCWvSXIy3FP+zoAGjjuQbx+t8STwDEBILQ0XK0lY3G08hvzrXBfrFXWOL0HIaR
	 mUS4dkSSNjG5vxijp0YuWdkgaQYEX9lG96xcacT+h6tupPNfW5TCK9xjifXG4f5gqFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692283;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=fmOCBn8xEVIjs5aJ8J4Zaw7Ett/3XskeCn9tB7ZV//M=;
	b=aFKx5ryjSq896P62abn+MHeNJcI6x63hUXNtQy75JRpgb/1Z67nZktOPzyM+gV6MR/hI
	 VYGVzboUVP19fHuHOwPYYzds6baysY2Jt4JNxkus6qsqxTjYdxxWZsKq55kE6WGRPrwKk
	 0/vpObXT1fuCmL1G4dwuDsKsmmYu3uFkNGcPnT4eZhPzJwktc2XpEicvcveK6vk6LIFxm
	 20NkcCBt2xHbXSUCl3I4MNMUAnkNRqIPw1FQOwcgeawEyd+klwFddujlwBuU6miJIaSXG
	 LBbbwEID6eXO3ZKaieYrOseBaEFzYppidl6vo9KWmlAVfiRquGmGay+L9LZs4Sxz6rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=vvl5fpK9;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D4360A2617;
	Thu, 26 Nov 2026 11:24:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70D4360A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=vvl5fpK9
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 30BEA4E417A0;
	Thu, 26 Nov 2026 11:24:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EF26B60237;
	Thu, 26 Nov 2026 11:24:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 33A6311E6B324;
	Thu, 26 Nov 2026 12:24:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795692279; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=fmOCBn8xEVIjs5aJ8J4Zaw7Ett/3XskeCn9tB7ZV//M=;
	b=vvl5fpK9CE9GA+CniH9VbudHEwoIA8lFUH4e4ejHhnj40V5va5vGrYjXsv/a34zqar34QV
	Lcb+C0qPpnSgffRYjPn9HyQC5J3OP+QD6IU16oJDXfddfR9t+QNYZOKp39MJZJYIw+o1YH
	uk3aSONk1myr78Pu1LvuVFVaTaY4vbYk8LAMusaGSTke+CrGQDhmjZjcmmuGlTZ57ZduZP
	sohYaYMMxjck+ZQyDq9iLjQmngE8STuJSKZY6Ijk6t+KSEGq7zAlzrfJ6J+KHhQadkFWLJ
	p83gNMFmxAGAeSIqD/KfQC8DfL7Z6PPTKVElfvuAnilTLqc66ErXq/RgZ+UIpg==
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
Subject: [PATCH v4 19/22] libfdt: Introduce fdt_getprop_by_offset_w()
Date: Thu, 26 Nov 2026 12:22:36 +0100
Message-ID: <20261126112239.636284-20-herve.codina@bootlin.com>
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

Future operations, such as handling unknown tags on dtb modifications,
need to modify properties retrieved by their offset.

fdt_getprop_by_offset() already exists to get a property by its offset
but the property returned is read-only. A writable returned property is
needed.

Fill the gap and introduce fdt_getprop_by_offset_w(), the write enabled
variant of fdt_getprop_by_offset().

Also add its related test.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 libfdt/libfdt.h           |  6 +++
 tests/.gitignore          |  1 +
 tests/Makefile.tests      |  2 +-
 tests/get_prop_offset_w.c | 78 +++++++++++++++++++++++++++++++++++++++
 tests/meson.build         |  1 +
 tests/run_tests.sh        |  1 +
 6 files changed, 88 insertions(+), 1 deletion(-)
 create mode 100644 tests/get_prop_offset_w.c

diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index 7a1915a5..82965e32 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -856,6 +856,12 @@ static inline struct fdt_property *fdt_get_property_w(void *fdt, int nodeoffset,
 #ifndef SWIG /* This function is not useful in Python */
 const void *fdt_getprop_by_offset(const void *fdt, int offset,
 				  const char **namep, int *lenp);
+static inline void *fdt_getprop_by_offset_w(const void *fdt, int offset,
+					    const char **namep, int *lenp)
+{
+	return (void *)(uintptr_t)fdt_getprop_by_offset(fdt, offset, namep,
+							lenp);
+}
 #endif
 
 /**
diff --git a/tests/.gitignore b/tests/.gitignore
index 914699be..6fd6cb97 100644
--- a/tests/.gitignore
+++ b/tests/.gitignore
@@ -30,6 +30,7 @@ tmp.*
 /get_phandle
 /getprop
 /get_prop_offset
+/get_prop_offset_w
 /incbin
 /integer-expressions
 /fs_tree1
diff --git a/tests/Makefile.tests b/tests/Makefile.tests
index 30452d05..ddfe317e 100644
--- a/tests/Makefile.tests
+++ b/tests/Makefile.tests
@@ -16,7 +16,7 @@ LIB_TESTS_L = get_mem_rsv \
 	sw_tree1 sw_states \
 	move_and_save mangle-layout nopulate \
 	open_pack rw_tree1 rw_oom set_name setprop del_property del_node \
-	appendprop1 appendprop2 propname_escapes \
+	appendprop1 appendprop2 propname_escapes get_prop_offset_w \
 	string_escapes references path-references phandle_format \
 	boot-cpuid incbin relref_merge \
 	extra-terminating-null \
diff --git a/tests/get_prop_offset_w.c b/tests/get_prop_offset_w.c
new file mode 100644
index 00000000..be31744c
--- /dev/null
+++ b/tests/get_prop_offset_w.c
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+/*
+ * libfdt - Flat Device Tree manipulation
+ *	Testcase for fdt_getprop_by_offset_w()
+ * Copyright (C) 2026 Bootlin.
+ */
+
+#include <stdlib.h>
+#include <stdio.h>
+#include <string.h>
+#include <stdint.h>
+
+#include <libfdt.h>
+
+#include "tests.h"
+#include "testdata.h"
+#include "util.h"
+
+int main(int argc, char *argv[])
+{
+	const char *name, *name_w;
+	const void *propval;
+	char *modif_val;
+	void *propval_w;
+	int proplen_w;
+	int exp_len;
+	int poffset;
+	void *fdt;
+
+	test_init(argc, argv);
+	fdt = load_blob_arg(argc, argv);
+
+	/* Retrieve the offset of the 'prop-str' property */
+	fdt_for_each_property_offset(poffset, fdt, 0) {
+		propval = fdt_getprop_by_offset(fdt, poffset, &name, NULL);
+		if (propval) {
+			if (!strcmp(name, "prop-str"))
+				break;
+		}
+	}
+	if (poffset < 0)
+		FAIL("Property 'prop-str' not found");
+
+	/* Get the property value for modification */
+	propval_w = fdt_getprop_by_offset_w(fdt, poffset, &name_w, &proplen_w);
+	if (!propval_w)
+		FAIL("fdt_getprop_by_offset_w(%d): %s", poffset,
+		     fdt_strerror(proplen_w));
+
+	/* Check original values */
+	if (name_w != name)
+		FAIL("Name pointers mismatch : %p instead %p", name_w, name);
+
+	/* Check that returned pointers for read-only and write are the same */
+	if (propval_w != propval)
+		FAIL("Data pointers mismatch : %p instead %p", propval_w, propval);
+
+	/* Check length of the property */
+	exp_len = strlen(TEST_STRING_1) + 1;
+	if (exp_len < 4)
+		CONFIG("Property \"%s\" should be at least 4 bytes", name);
+	if (proplen_w != exp_len)
+		FAIL("Original size mismatch on property \"%s\": %d instead of %d",
+		     name, proplen_w, exp_len);
+
+	/* Modify the property value */
+	modif_val = xmalloc(proplen_w);
+	memcpy(modif_val, propval_w, proplen_w);
+	modif_val[1] = (modif_val[1] != 'A') ? 'A' : 'a';
+	modif_val[3] = (modif_val[3] != 'B') ? 'B' : 'b';
+	memcpy(propval_w, modif_val, proplen_w);
+
+	/* Check that the modified value is taken into account */
+	if (!check_get_prop_offset(fdt, poffset, "prop-str", proplen_w, modif_val))
+		FAIL("Modified property 'prop-str' not found");
+
+	PASS();
+}
diff --git a/tests/meson.build b/tests/meson.build
index 89c6a75a..59264262 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -284,6 +284,7 @@ tests = [
   'get_path',
   'get_phandle',
   'get_prop_offset',
+  'get_prop_offset_w',
   'get_next_tag_invalid_prop_len',
   'getprop',
   'incbin',
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 5334a9b4..06f6188a 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -445,6 +445,7 @@ tree1_tests () {
     run_test setprop_inplace $TREE
     run_test nop_property $TREE
     run_test nop_node $TREE
+    run_test get_prop_offset_w $TREE
 }
 
 tree1_tests_rw () {
-- 
2.56.1

