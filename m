Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1233B7776;
	Wed, 26 Aug 2026 08:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787733189; cv=none; b=YObUEHR8mZps2w960WTbncmXTzeEuJihiayqqWmaVmoDRZOYiPv/A4ox56MLDHqcliaxMc27QLQX5aY0pKcxngOiBIJX/OnreWTZFRn5yplW7t1PwFKh3NeW+VL6cteGXdQLXpQnEn/3CgGnMw354i2dJ5NriaAdORepwaPdlHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787733189; c=relaxed/simple;
	bh=l5aizd0aNPlQXbHAGyKGkXH/oCilS0i0zb3Qqb0JRBU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XOgF5Y0D1A9gNf6ORkx41FwnRuq9bwzNw7sWElLZNnY3Hf/gfC28NO0IIFqToO/Oo7nNBcWM3U/avI6Se83Q8XMxj7zL6PJMJIX2EvUvfjN0Kvk3fjAdLTB0kRuW4x7TPoU/OTbLI0ovBulTPvg31giThlsNrgI2WQCljK3bpC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=vczcrhIR; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="vczcrhIR"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9EDF74E413C6;
	Wed, 26 Aug 2026 08:33:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 72842604EC;
	Wed, 26 Aug 2026 08:33:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D222411C7AC82;
	Wed, 26 Aug 2026 10:33:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787733185; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Pb7tD7MCAsE6s+ppctJ9MSYDTHi603VmMwnW5c1tQJk=;
	b=vczcrhIR/oux8dWgctN6CQQwHni80XqH4l8jE/DgZ/+WnwvzqPPrlCzSM9sDjnhRYBp7wb
	zxcnjEd5dg4eqU4zJCtc6gYHwtqkdz1q9vdJAEjGx5ZtALUw/f4tNQckR/b4dL7ggVZtjY
	rT5PVZ1JmZqjMuve4BEJdDic/EVkb+YJIk9PSFeULJE3DLEhIQoR5DngT/Aoes28r8RK1B
	5zKrrr1IBhXWMyDBxyc8C+/njpcenkYMHHz3zHSHZT5vfmoaqjnTSlDkXiaW7xWfRoE9ie
	QOFL8Daa+pDKGNMuvaLPGVimY92oKqBlJPq/sYLZn0dqa2Dzck8V2Ak1mpvHww==
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
Subject: [PATCH v3 13/15] tests: Add wip_func utility
Date: Wed, 26 Aug 2026 10:31:44 +0200
Message-ID: <20260826083146.304291-14-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826083146.304291-1-herve.codina@bootlin.com>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

wip_func is a test utility allowing to wrap the write inplace functions.

It allows to create tests with custom wip write sequence.

Also the modified dtb is saved allowing to perform later checks on this
modified dtb.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 tests/Makefile.tests |   3 +-
 tests/meson.build    |   1 +
 tests/wip_func.c     | 127 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 130 insertions(+), 1 deletion(-)
 create mode 100644 tests/wip_func.c

diff --git a/tests/Makefile.tests b/tests/Makefile.tests
index 0d4d399f..a71c4cbf 100644
--- a/tests/Makefile.tests
+++ b/tests/Makefile.tests
@@ -31,7 +31,8 @@ LIB_TESTS_L = get_mem_rsv \
 	check_path check_header check_full \
 	fs_tree1 \
 	truncated_property truncated_string \
-	truncated_memrsv unterminated_memrsv
+	truncated_memrsv unterminated_memrsv \
+	wip_func
 LIB_TESTS = $(LIB_TESTS_L:%=$(TESTS_PREFIX)%)
 
 ifneq ($(STATIC_BUILD),1)
diff --git a/tests/meson.build b/tests/meson.build
index dae6a941..e7a88936 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -96,6 +96,7 @@ tests = [
   'truncated_string',
   'unterminated_memrsv',
   'utilfdt_test',
+  'wip_func',
 ]
 
 test_deps = [testutil_dep, util_dep, libfdt_dep]
diff --git a/tests/wip_func.c b/tests/wip_func.c
new file mode 100644
index 00000000..3becc4f1
--- /dev/null
+++ b/tests/wip_func.c
@@ -0,0 +1,127 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+/*
+ * libfdt - Flat Device Tree manipulation
+ *	Wrapper wip functions family
+ * Copyright (C) 2026 Herve Codina, Bootlin.
+ */
+
+#include <inttypes.h>
+#include <stdlib.h>
+#include <stdio.h>
+#include <string.h>
+#include <ctype.h>
+#include <stdint.h>
+#include <errno.h>
+
+#include <libfdt.h>
+
+#include "tests.h"
+
+struct args {
+	char *dtb_path;
+	enum {
+		NOP_NODE,
+		NOP_PROP,
+		SET_PROP,
+	} op;
+	char *node_path;
+	char *prop_name;
+	int index;
+	char *value;
+};
+
+const char *usage_txt = "Usage:\n"
+	"  - wip_func <dtb> nop_node <node_path>\n"
+	"  - wip_func <dtb> nop_prop <node_path> <prop_name>\n"
+	"  - wip_func <dtb> set_prop <node_path> <prop_name> <index> <str>\n"
+	;
+
+static void parse_args(struct args *args, int argc, char *argv[])
+{
+	char *endptr;
+
+	memset(args, 0, sizeof(*args));
+
+	if (argc < 3)
+		goto fail;
+
+	args->dtb_path = argv[1];
+
+	if (!strcmp(argv[2], "nop_node")) {
+		args->op = NOP_NODE;
+		if (argc != 4)
+			goto fail;
+		args->node_path = argv[3];
+	} else if (!strcmp(argv[2], "nop_prop")) {
+		args->op = NOP_PROP;
+		if (argc != 5)
+			goto fail;
+		args->node_path = argv[3];
+		args->prop_name = argv[4];
+	} else if (!strcmp(argv[2], "set_prop")) {
+		args->op = SET_PROP;
+		if (argc != 7)
+			goto fail;
+		args->node_path = argv[3];
+		args->prop_name = argv[4];
+		errno = 0;
+		args->index = strtol(argv[5], &endptr, 0);
+		if (*endptr != '\0' || errno)
+			goto fail;
+		args->value = argv[6];
+	} else {
+		goto fail;
+	}
+
+	return;
+
+fail:
+	CONFIG("%s\n", usage_txt);
+}
+
+int main(int argc, char *argv[])
+{
+	struct args args;
+	void *fdt;
+	int node;
+	int err;
+
+	test_init(argc, argv);
+
+	parse_args(&args, argc, argv);
+
+	fdt = load_blob(args.dtb_path);
+
+	node = fdt_path_offset(fdt, args.node_path);
+	if (node < 0)
+		FAIL("Fail to get '%s': %s", args.node_path, fdt_strerror(node));
+
+	switch (args.op) {
+	case NOP_NODE:
+		err = fdt_nop_node(fdt, node);
+		if (err)
+			FAIL("fdt_nop_node('%s'): %s", args.node_path, fdt_strerror(err));
+		break;
+
+	case NOP_PROP:
+		err = fdt_nop_property(fdt, node, args.prop_name);
+		if (err)
+			FAIL("fdt_nop_node('%s', '%s'): %s", args.node_path,
+			     args.prop_name, fdt_strerror(err));
+		break;
+
+	case SET_PROP:
+		err = fdt_setprop_inplace_namelen_partial(fdt, node,
+			args.prop_name, strlen(args.prop_name), args.index,
+			args.value, strlen(args.value) + 1);
+		if (err)
+			FAIL("fdt_setprop_inplace_namelen_partial('%s', '%s', %d, \"%s\"): %s",
+			     args.node_path, args.prop_name, args.index,
+			     args.value, fdt_strerror(err));
+		break;
+	}
+
+	save_blob(args.dtb_path, fdt);
+
+	PASS();
+}
-- 
2.55.0

