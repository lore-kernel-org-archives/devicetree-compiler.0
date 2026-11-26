Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692286;
	b=Qhv8PmVeSu53yaC6A+Grhkb7wwl3mAvb9MTu19Z47Q4BpbvTl+9vpCEAPHCiGDXZJewI
	 XYoO04SqExFCMBXzMGPTq7MU0bXeaeWAKWRpBGSsSi+jmASlN0KfIu3kmx3M1fBZoODmD
	 zk7i0XmAgRzl/S/FAB+opmaEx8HyWGCS179Tn37U7lPeD0MHVX4dqSsTtilepIL+KrVYh
	 75qZGlWcMw6c4WJ5hlitBrnCCi9Pve6E34y6PkVGr6y/j495KpRfkXY/DqbfJMtOcYW9w
	 O6Qv1w8mKvRP9WP4zwZaKdbsVf5JKKlGIA+Q8gcUuvGmlBT6tDmrC/EMqsJObVbY+PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692286;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=01qj3qeB1GhNEvM0FpiKnvyh2yp68/C0i7Y1F8wnc7I=;
	b=jXfA6PbxdyMz1U/Gi+cwiGblvo5Raxxnd0/Sh4gHduvlURlwEkpWEUEAjzn5Lgqi9O8f
	 /Sgmsa1RrRDZ7pa3sHZyy7T/LqkLO95Te9jw0FA8DzQpXQZhlebShcKkg8J/2Pypr2d5B
	 KSN+pGyu2D+WbJGoBYdwBCZWzZdiA2iAn1/RYd33iU9bmajq2j7mTLBBNnIpGRJDwKkcD
	 /3NC8c1tb33W1kgFYaPv+89gYe2dpEML91yp4wbXFStMdN0uBBX8dJncVI4M5jU4bHEfh
	 kVRJrZxbGb4D+ioc2qxIilAskfIPjf6hG9I98WWrZwfO9Ho4F/rJoUcXPyzYiopxjyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=N9ZeeYrP;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2564606A338;
	Thu, 26 Nov 2026 11:24:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2564606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=N9ZeeYrP
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 002B7C2B9C9;
	Thu, 26 Nov 2026 11:24:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AF3D660237;
	Thu, 26 Nov 2026 11:24:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BBCAB11E6B361;
	Thu, 26 Nov 2026 12:24:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795692283; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=01qj3qeB1GhNEvM0FpiKnvyh2yp68/C0i7Y1F8wnc7I=;
	b=N9ZeeYrPtG4cUEHJBt+2AoPkSLpzBXloKMqt6BSBwzcfarNv2BPM257246hiF0VTMAYhxf
	AL3/UltHpCba7Pl224iUv4nhtOn/JG8GFRpT2J/Bjq0X8IO+alUG43fHVCc0WguFcG/A5Q
	+UbC4fD7vujr8I06ddXiw3Er88jj6USzQsCA32Luk0FkiWtMjyN9OvY4UGnkT6LqyONMo7
	S5Z6wX68epQBhqfwrIg+zZAW8re+0Uzc7UnJoJHIp9/AqdKHckz9py/J9QgzS0aV4UT6tl
	RmwW4fWPOboeoNGTqtzJSL9pt/+7aXP9KD21rMsl+9RvaXUCRicKPXTlcuFxsg==
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
Subject: [PATCH v4 20/22] tests: Add wip_func utility
Date: Thu, 26 Nov 2026 12:22:37 +0100
Message-ID: <20261126112239.636284-21-herve.codina@bootlin.com>
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

wip_func is a test utility allowing to wrap the write-in-place
functions.

It allows creating tests with a custom write-in-place sequence.

Also, the modified dtb is saved, allowing later checks on it.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 tests/.gitignore     |   1 +
 tests/Makefile.tests |   3 +-
 tests/meson.build    |   1 +
 tests/wip_func.c     | 127 +++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 131 insertions(+), 1 deletion(-)
 create mode 100644 tests/wip_func.c

diff --git a/tests/.gitignore b/tests/.gitignore
index 6fd6cb97..c11ae90d 100644
--- a/tests/.gitignore
+++ b/tests/.gitignore
@@ -78,4 +78,5 @@ tmp.*
 /unterminated_memrsv
 /utilfdt_test
 /value-labels
+/wip_func
 /get_next_tag_invalid_prop_len
diff --git a/tests/Makefile.tests b/tests/Makefile.tests
index ddfe317e..f22e26b4 100644
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
index 59264262..c68f43bd 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -331,6 +331,7 @@ tests = [
   'truncated_string',
   'unterminated_memrsv',
   'utilfdt_test',
+  'wip_func',
 ]
 
 test_deps = [testutil_dep, util_dep, libfdt_dep]
diff --git a/tests/wip_func.c b/tests/wip_func.c
new file mode 100644
index 00000000..45a173b9
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
+			FAIL("fdt_nop_property('%s', '%s'): %s", args.node_path,
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
2.56.1

