Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5DF3DAABF
	for <devicetree-compiler@vger.kernel.org>; Wed, 26 Aug 2026 09:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787738037; cv=none; b=lqdFg2F5dHsTU68C4O04myRPEUJjeQTXfTPsHBqNB6/q78m46FN3fqmEpg750bD6lJ6oRo6E0dsvKzIz5uKnixSeM+T7BMYpsmAEiYkJNsjQvaXgg8q/So8ZrR/A5oalqY86Hx+BVN/b0HraefgS1n7ZI5x1l71WsE30AzE4FSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787738037; c=relaxed/simple;
	bh=rVP9lH04r7+ZI+x7f09H/c8hrugI0UMNoajcpdk0xQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Md2ocdkSBVQAu5bNLL4mrLkg34Ufk4jqfx0pEJOK3KU6392DmyvGVsESVGM8dIpxePkbEmEmH2NLUxPmK7UoTFThICeVSrm/15S4ZIDlbJWHYzShfEl0A9ibwnetT47IXvzb7nVWzBSqlIGeOx01LLymYOWkWh89HRO0wPMgCxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YAmGzPvX; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YAmGzPvX"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E926A4E413BC;
	Wed, 26 Aug 2026 09:53:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BDA9F604EC;
	Wed, 26 Aug 2026 09:53:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E138C11C7ACD5;
	Wed, 26 Aug 2026 11:53:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787738030; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=n163j0JJkv2/HlZShFYjce2tC1Ng0Jua0VmfrejqQXo=;
	b=YAmGzPvX7AOikBOwdti5tC2ta7wkclHFNz6EjYDVU7d8B7aqhQQ8P3SyX8HT0zUFC/7qyj
	2CcWwdBZqFuNg9KsNt0ifORKUYlbtyfoCASwtLiFxfWpQShfPNygMxFk45bpzYUeoImZvu
	eF+PeiTAZdGS4DW8ULYj01T+oBEaJdEBks+4KMNEXjF9Y5se3iHFffZEHDMVj6TIj3ZkoP
	Z75sUN7kczUvbBFfChdrmUw0tF58Ad/wFZS8bBbxiuvlW3eCS2/jRJzu+9FA8LteOkIgJN
	Z5CVMaXoUth9qyi6xoh7fEOeUmTl+sejsbs3jW+hOz0yCCZKiA4CkMnzz3w6Qw==
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
Subject: [RFC PATCH v2 64/74] Add fdtaddon tool to apply an addon
Date: Wed, 26 Aug 2026 11:49:33 +0200
Message-ID: <20260826094950.1088288-65-herve.codina@bootlin.com>
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

libfdt has support for applying an addon on top of a base device-tree.
This is provided by the libfdt fdt_addon_apply() function.

The fdtaddon tool is command line tool which allows to apply addon dtb
file to a base device-tree dtb file. It relies on fdt_addon_apply().

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 Makefile       |   5 ++
 Makefile.utils |   6 ++
 fdtaddon.c     | 197 +++++++++++++++++++++++++++++++++++++++++++++++++
 meson.build    |   2 +-
 4 files changed, 209 insertions(+), 1 deletion(-)
 create mode 100644 fdtaddon.c

diff --git a/Makefile b/Makefile
index 9110d177..175c400b 100644
--- a/Makefile
+++ b/Makefile
@@ -164,6 +164,7 @@ BIN += fdtdump
 BIN += fdtget
 BIN += fdtput
 BIN += fdtoverlay
+BIN += fdtaddon
 
 SCRIPTS = dtdiff
 
@@ -177,6 +178,7 @@ ifneq ($(MAKECMDGOALS),libfdt)
 -include $(FDTGET_OBJS:%.o=%.d)
 -include $(FDTPUT_OBJS:%.o=%.d)
 -include $(FDTOVERLAY_OBJS:%.o=%.d)
+-include $(FDTADDON_OBJS:%.o=%.d)
 endif
 endif
 
@@ -260,6 +262,8 @@ fdtput:	$(FDTPUT_OBJS) $(LIBFDT_dep)
 
 fdtoverlay: $(FDTOVERLAY_OBJS) $(LIBFDT_dep)
 
+fdtaddon: $(FDTADDON_OBJS) $(LIBFDT_dep)
+
 tags: FORCE
 	rm -f tags
 	find . \( -name tests -type d -prune \) -o \
@@ -277,6 +281,7 @@ TESTS_BIN += fdtput
 TESTS_BIN += fdtget
 TESTS_BIN += fdtdump
 TESTS_BIN += fdtoverlay
+TESTS_BIN += fdtaddon
 
 ifneq ($(MAKECMDGOALS),libfdt)
 include tests/Makefile.tests
diff --git a/Makefile.utils b/Makefile.utils
index 9436b34d..eae9222b 100644
--- a/Makefile.utils
+++ b/Makefile.utils
@@ -29,3 +29,9 @@ FDTOVERLAY_SRCS = \
 	util.c
 
 FDTOVERLAY_OBJS = $(FDTOVERLAY_SRCS:%.c=%.o)
+
+FDTADDON_SRCS = \
+	fdtaddon.c \
+	util.c
+
+FDTADDON_OBJS = $(FDTADDON_SRCS:%.c=%.o)
diff --git a/fdtaddon.c b/fdtaddon.c
new file mode 100644
index 00000000..037851d9
--- /dev/null
+++ b/fdtaddon.c
@@ -0,0 +1,197 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2025 Bootlin. All rights reserved.
+ *
+ * Author:
+ *	 Herve Codina <herve.codina@bootlin.com>
+ */
+
+#include <assert.h>
+#include <ctype.h>
+#include <getopt.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <inttypes.h>
+
+#include <libfdt.h>
+
+#include "util.h"
+
+/* Usage related data. */
+static const char usage_synopsis[] =
+	"apply an addon to a base blob\n"
+	"	fdtaddon <options> <addon.dtba>";
+static const char usage_short_opts[] = "i:o:t:v" USAGE_COMMON_SHORT_OPTS;
+static const struct option usage_long_opts[] = {
+	{ "input", required_argument, NULL, 'i' },
+	{ "output", required_argument, NULL, 'o' },
+	{ "target", required_argument, NULL, 't' },
+	{ "verbose", no_argument, NULL, 'v' },
+	USAGE_COMMON_LONG_OPTS,
+};
+static const char *const usage_opts_help[] = { "Input base DT blob",
+					       "Output DT blob", "Target node",
+					       "Verbose messages",
+					       USAGE_COMMON_OPTS_HELP };
+
+static void *do_apply(void *base, const void *addon, const char *target)
+{
+	void *tmp_merged;
+	void *tmp_addon;
+	size_t max_merged_size;
+	int ret;
+
+	/*
+	 * We take copies first, because a failed apply can trash
+	 * both the base blob and the overlay.
+	 */
+
+	/*
+	 * The merged size should not be greater than the sum of the size of
+	 * individual items.
+	 */
+	max_merged_size = fdt_totalsize(base) + fdt_totalsize(addon);
+
+	tmp_merged = xmalloc(max_merged_size);
+	ret = fdt_open_into(base, tmp_merged, max_merged_size);
+	if (ret) {
+		fprintf(stderr,
+			"\nFailed to make temporary copy: %s\n",
+			fdt_strerror(ret));
+		free(tmp_merged);
+		return NULL;
+	}
+
+	tmp_addon = xmalloc(fdt_totalsize(addon));
+	memcpy(tmp_addon, addon, fdt_totalsize(addon));
+
+	if (!(fdt_dt_flags(tmp_addon) & FDT_FLAG_ADDON)) {
+		fprintf(stderr,
+			"\nAddon dtb is not an 'addon'\n");
+		goto fail;
+	}
+
+	ret = fdt_addon_apply(tmp_merged, tmp_addon, target);
+	if (ret) {
+		fprintf(stderr, "\nFailed to apply %s\n", fdt_strerror(ret));
+		goto fail;
+	}
+
+	free(tmp_addon);
+	return tmp_merged;
+
+fail:
+	free(tmp_merged);
+	free(tmp_addon);
+	return NULL;
+}
+
+static int do_fdtaddon(const char *input_filename, const char *output_filename,
+		       const char *addon_filename, const char *target)
+{
+	void *base_blob = NULL;
+	void *addon_blob = NULL;
+	void *merged_blob = NULL;
+	size_t base_buflen;
+	size_t addon_buflen;
+	int ret = -1;
+
+	base_blob = utilfdt_read(input_filename, &base_buflen);
+	if (!base_blob) {
+		fprintf(stderr, "\nFailed to read '%s'\n", input_filename);
+		goto out_err;
+	}
+	if (fdt_totalsize(base_blob) > base_buflen) {
+		fprintf(stderr,
+			"\nBase blob is incomplete (%zu / %"PRIu32" bytes read)\n",
+			base_buflen, fdt_totalsize(base_blob));
+		goto out_err;
+	}
+
+	addon_blob = utilfdt_read(addon_filename, &addon_buflen);
+	if (!addon_blob) {
+		fprintf(stderr, "\nFailed to read '%s'\n", addon_filename);
+		goto out_err;
+	}
+	if (fdt_totalsize(addon_blob) > addon_buflen) {
+		fprintf(stderr,
+			"\nAddon blob is incomplete (%zu / %"PRIu32" bytes read)\n",
+			addon_buflen, fdt_totalsize(addon_blob));
+		goto out_err;
+	}
+
+	/* apply the addon  */
+	merged_blob = do_apply(base_blob, addon_blob, target);
+	if (!merged_blob)
+		goto out_err;
+
+	fdt_pack(merged_blob);
+	ret = utilfdt_write(output_filename, merged_blob);
+	if (ret)
+		fprintf(stderr, "\nFailed to write '%s'\n", output_filename);
+
+out_err:
+	free(merged_blob);
+	free(addon_blob);
+	free(base_blob);
+
+	return ret;
+}
+
+int main(int argc, char *argv[])
+{
+	char *input_filename = NULL;
+	char *output_filename = NULL;
+	char *addon_filename = NULL;
+	const char *target = NULL;
+	int verbose;
+	int opt;
+
+	while ((opt = util_getopt_long()) != EOF) {
+		switch (opt) {
+		case_USAGE_COMMON_FLAGS
+
+		case 'i':
+			input_filename = optarg;
+			break;
+		case 'o':
+			output_filename = optarg;
+			break;
+		case 'v':
+			verbose = 1;
+			break;
+		case 't':
+			target = optarg;
+			break;
+		}
+	}
+
+	if (!input_filename)
+		usage("missing input file");
+
+	if (!output_filename)
+		usage("missing output file");
+
+	if (!target)
+		usage("missing target");
+
+	argv += optind;
+	argc -= optind;
+
+	if (argc != 1)
+		usage("missing addon file");
+
+	addon_filename = argv[0];
+
+	if (verbose) {
+		printf("input  = %s\n", input_filename);
+		printf("output = %s\n", output_filename);
+		printf("addon = %s\n", addon_filename);
+	}
+
+	if (do_fdtaddon(input_filename, output_filename, addon_filename, target))
+		return 1;
+
+	return 0;
+}
diff --git a/meson.build b/meson.build
index 501b706c..7f7e83b4 100644
--- a/meson.build
+++ b/meson.build
@@ -108,7 +108,7 @@ if get_option('tools') and not wheel_only
     install: true,
   )
 
-  foreach e: ['fdtdump', 'fdtget', 'fdtput', 'fdtoverlay']
+  foreach e: ['fdtdump', 'fdtget', 'fdtput', 'fdtoverlay', 'fdtaddon']
     dtc_tools += executable(e, files(e + '.c'), dependencies: util_dep, install: true)
   endforeach
 
-- 
2.55.0

