Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692202;
	b=rv/yfLIeBzEOR8ZQycmPpdPXgIhiLr4e1KCu8dntpjdr5w5W0/fy2H0f1tFrq2K5PZPB
	 ajzaQx4kGMxvB/cBxacKzbJ8DFCEl8DfWSL060Ra2ykF+n0vbyRgghqzmJHLF3fRt9e3w
	 tx6mL4bXsDMIN4vWm/0eUhvfsCs5hENoNZ1m4HYwhZCw4i0cQwCBNHBr5iTtc9uN6JULG
	 kKUG4kv5p80jFbpiykFE+FqKmARDNzbP+QXYxlTUaTBQVDDeCZ5Z5uOodADCk0Fp33PzD
	 Xt7ovxWUXMz1zIwpXf/AJ0pbXLWBz3dZm1mYc/UdPJ8tA1O+s1Gob9nUdsW+W7StZwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692202;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=aaXBpVUsxWks4S8WneNNxsk86aDtwl54ji96E5mQoy8=;
	b=ZIRjCA9qbuO0hCfte8x2am6EbC4WwDxp+FSAsiT6JPALSWEXeYzIPdmtE/z8s/3ji1Rj
	 wK5DcETI5sXA7PxE6x/zzpxeeFMU1SyNEubkQru4JVjGY6hX0gTLZw12JX146gldggtL/
	 ZjuUCCMU38jMr1xPoVjNHMG+4LTlr0GBNwNvopbzpKiESSzsoiiT4wTAEJ+3SswW6p7nN
	 xdrdEXKP+2oux1G8mCMhMkk3eedzkNWe31lqbXeudQ1533AX+I9xm+JEYPeVaSx7rTI0K
	 JgqqQj/kpfepT5XPJYOiBLUDfsjxsq4qcnnAahXLBBJCL+LMEFwsJ+S/u6QY2KKKRXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=LAg0mqpY;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9C8606A681;
	Thu, 26 Nov 2026 11:23:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A9C8606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=LAg0mqpY
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1B97C4E4179E;
	Thu, 26 Nov 2026 11:23:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DC6C860237;
	Thu, 26 Nov 2026 11:23:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D901B11E6B367;
	Thu, 26 Nov 2026 12:23:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795692197; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=aaXBpVUsxWks4S8WneNNxsk86aDtwl54ji96E5mQoy8=;
	b=LAg0mqpYS037Dxvw5vx2d6QJjX48nCEylBE0GXhR6byM0pM5Yw68ajHjHIbxd7NCwUXhot
	l7m/7pr6V6E2fUxIAgWUnXOk5RMf2EujBZiUVGGmSZeglSIo2Mw3Kfc0dbpwf/NEVF9poj
	ylrFYPXxwFFMuHF1E8Y+vqjPFe/EuSLLqAKSQJ99RT+3GJ5nRIQ1XWajvxpZuSaaaex95O
	HxSZ8oOjhH1dtcwZeAmC6udJJ2Z2nJl4uijJsxXeRSvNa9zE+ZAWdMvAsg5Rjagzc5IPRa
	h3euDRZt0cexb9rV/xUZZd9Hib6H+6xAMTTEuyRNsuBiMlID2mAUXl9stJ4SlA==
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
Subject: [PATCH v4 02/22] tests: Add a test for fdt_root_offset()
Date: Thu, 26 Nov 2026 12:22:19 +0100
Message-ID: <20261126112239.636284-3-herve.codina@bootlin.com>
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

The fdt_root_offset() function has been recently introduced.

Add a specific test for this function.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 tests/.gitignore     |  1 +
 tests/Makefile.tests |  4 ++--
 tests/meson.build    |  2 ++
 tests/root_offset.c  | 45 +++++++++++++++++++++++++++++++++++++++++
 tests/run_tests.sh   |  3 +++
 tests/treegen.c      | 48 ++++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 101 insertions(+), 2 deletions(-)
 create mode 100644 tests/root_offset.c

diff --git a/tests/.gitignore b/tests/.gitignore
index 69693129..914699be 100644
--- a/tests/.gitignore
+++ b/tests/.gitignore
@@ -56,6 +56,7 @@ tmp.*
 /references
 /relref_merge
 /root_node
+/root_offset
 /rw_tree1
 /rw_oom
 /set_name
diff --git a/tests/Makefile.tests b/tests/Makefile.tests
index dfb2fe52..f6b22fbd 100644
--- a/tests/Makefile.tests
+++ b/tests/Makefile.tests
@@ -1,5 +1,5 @@
 LIB_TESTS_L = get_mem_rsv \
-	root_node find_property subnode_offset path_offset \
+	root_node root_offset find_property subnode_offset path_offset \
 	get_name getprop get_prop_offset get_phandle \
 	get_path supernode_atdepth_offset parent_offset \
 	node_offset_by_prop_value node_offset_by_phandle \
@@ -44,7 +44,7 @@ TESTS = $(LIB_TESTS) $(DL_LIB_TESTS)
 TESTS_TREES_L = test_tree1.dtb bad_node_char.dtb bad_node_format.dtb \
 	bad_prop_char.dtb ovf_size_strings.dtb truncated_property.dtb \
 	truncated_string.dtb truncated_memrsv.dtb unterminated_memrsv.dtb \
-	two_roots.dtb named_root.dtb bad_proplen.dtb
+	two_roots.dtb named_root.dtb root_offset_12.dtb bad_proplen.dtb
 TESTS_TREES = $(TESTS_TREES_L:%=$(TESTS_PREFIX)%)
 
 TESTS_TARGETS = $(TESTS) $(TESTS_TREES)
diff --git a/tests/meson.build b/tests/meson.build
index 97fb15a6..3d16ae23 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -17,6 +17,7 @@ treegen_dtb = custom_target(
     'unterminated_memrsv.dtb',
     'two_roots.dtb',
     'named_root.dtb',
+    'root_offset_12.dtb',
     'bad_proplen.dtb',
   ]
 )
@@ -76,6 +77,7 @@ tests = [
   'references',
   'relref_merge',
   'root_node',
+  'root_offset',
   'rw_oom',
   'rw_tree1',
   'set_name',
diff --git a/tests/root_offset.c b/tests/root_offset.c
new file mode 100644
index 00000000..029f84b6
--- /dev/null
+++ b/tests/root_offset.c
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+/*
+ * libfdt - Flat Device Tree manipulation
+ *	Basic testcase for fdt_root_offset()
+ *
+ * Copyright (C) 2026 Bootlin.
+ *
+ * Authors:
+ *   Herve Codina <herve.codina@bootlin.com>
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
+
+int main(int argc, char *argv[])
+{
+	int expected_root_offset;
+	int root_offset;
+	void *fdt;
+
+	if (argc != 3)
+		CONFIG("Usage: %s <expected root offset> <dtb file>", argv[0]);
+
+	test_init(argc, argv);
+	expected_root_offset = strtol(argv[1], NULL, 0);
+	fdt = load_blob(argv[2]);
+
+	root_offset = fdt_root_offset(fdt);
+	if (root_offset < 0)
+		FAIL("fdt_root_offset() fails (%d - %s)",
+		     root_offset, fdt_strerror(root_offset));
+
+	if (root_offset != expected_root_offset)
+		FAIL("fdt_root_offset() returns %d, expected %d",
+		     root_offset, expected_root_offset);
+
+	PASS();
+}
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 1d3e79ac..65ea5894 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -435,6 +435,9 @@ check_tests () {
 ALL_LAYOUTS="mts mst tms tsm smt stm"
 
 libfdt_tests () {
+    run_test root_offset 0 test_tree1.dtb
+    run_test root_offset 12 root_offset_12.dtb
+
     tree1_tests test_tree1.dtb
 
     run_dtc_test -I dts -O dtb -o addresses.test.dtb "$SRCDIR/addresses.dts"
diff --git a/tests/treegen.c b/tests/treegen.c
index 3e7a6f24..c9bf5711 100644
--- a/tests/treegen.c
+++ b/tests/treegen.c
@@ -701,6 +701,53 @@ static struct buf make_named_root(void)
 	return b;
 }
 
+/* Tree with the root node at the offset 12 */
+static struct buf make_root_offset_12(void)
+{
+	struct buf b = buf_init();
+	size_t hdr;
+	size_t p_int, p_sn_int;
+
+	hdr = emit_fdt_header(&b);
+	emit_align(&b, 8);
+
+	emit_rsvmap_empty(&b, hdr);
+	emit_rsvmap_empty(&b, hdr);
+
+	{
+		size_t ss = start_block(&b);
+
+		emit_u32(&b, FDT_NOP);
+		emit_u32(&b, FDT_NOP);
+		emit_u32(&b, FDT_NOP);
+
+		emit_begin_node(&b, "");
+			p_int = emit_prop_u32(&b, 0, 0x1);
+
+			emit_begin_node(&b, "subnode");
+				p_sn_int = emit_prop_u32(&b, 0, 0x2);
+			emit_end_node(&b);
+		emit_end_node(&b);
+
+		finish_struct_block(&b, hdr, ss);
+	}
+
+	{
+		size_t strs = start_block(&b);
+		size_t s;
+
+		s = emit_string(&b, "prop-int");
+		fill_prop_name(&b, strs, p_int, s);
+		fill_prop_name(&b, strs, p_sn_int, s);
+
+		finish_strings_block(&b, hdr, strs);
+	}
+
+	finish_totalsize(&b, hdr);
+
+	return b;
+}
+
 static struct buf make_bad_proplen(void)
 {
 	struct buf b = buf_init();
@@ -751,6 +798,7 @@ static struct {
 	TREE(unterminated_memrsv),
 	TREE(two_roots),
 	TREE(named_root),
+	TREE(root_offset_12),
 	TREE(bad_proplen),
 };
 
-- 
2.56.1

