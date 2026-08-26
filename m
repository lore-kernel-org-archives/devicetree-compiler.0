Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0EE93E0C77
	for <devicetree-compiler@vger.kernel.org>; Wed, 26 Aug 2026 09:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787738091; cv=none; b=NChxDB9RkFc0uCWA2z1m5rQB4mEEN4a1bHFcPz+DB4wrgEZi8WJ/diFiIBVr3Q0vw8O3VuugKm14L0cVhFF4g4c68pNODdGb+Bm9Sy47wdQaYddeshwM1BxDo0DVAOow+caF3usaJ2wyvlA7eJYSro+7XHfq8MwK78MNzt/ljIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787738091; c=relaxed/simple;
	bh=08K8z7E2qT/i37KcXePY4tvqCh0QxUUtG1GgEWhELc4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IbEo4NwLh5G9pGdHskvCejP205TqSQ3UAV4IZl1MfqJeX9/hOOy13OQFnaFzFJc5gxhSnOUQwRfE0zTd8YeJYA6S0qAWw2m7ryyay7yy3Eut6CdUkAtJZ54WtafvEMxBVIrjGo/6FE/8wbAP7IrLKcvVyOLFap2nAMN56dA/WHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=K2y2+lAe; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="K2y2+lAe"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7928A1A183E;
	Wed, 26 Aug 2026 09:54:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4D72B604EC;
	Wed, 26 Aug 2026 09:54:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B896611C7AD70;
	Wed, 26 Aug 2026 11:54:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787738086; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=7VoJl6dLG+BIoVyuXucMhaeyw2jV/tYSa8t+aTz27nM=;
	b=K2y2+lAepwZ31AggaRYfOaKyUH8LqSWz5D0EE+xpUGpJSrdirwDvtUOLhureYujtVbY1YM
	+TeNgDu6mvcGyr24X4OWkdLipkhULFEf3XzM4wPLgrbls3EY5OIxNN8kg6zfNMzGAhZLTL
	r2dbsmZCbew4RpFIIUuRWorsCgudi/Y0Vzapm6T9mqYDDSg+q/WIA+EQbdgDbogxkL3wJK
	ruq4Z7+lVCZOWHiMiIB5L635eMzOIRWqa5c10AHPcXnwcpvTMSw9IX6oI1tOxBkFGykGym
	8Y9dt9xVOmQlCCulc/RtOIudl5fajqU7wUqj2aQhYU7QkhvZj3wsdIKXwAiE1w==
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
Subject: [RFC PATCH v2 74/74] fdtaddon: Add a simple external resolver
Date: Wed, 26 Aug 2026 11:49:43 +0200
Message-ID: <20260826094950.1088288-75-herve.codina@bootlin.com>
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

libfdt allows to use an external resolver to resolve import symbols when
an addon is applied.

Add a simple external resolver in fdtaddon based on export symbols given
on the tool command line (-e or --export). Those export symbols are used
to mach import symbols (match by names) in order to resolved them.

Two syntaxes are available for the -e or --export option:

  - Export by symbol (--export '<name>=&<symbol>')
    The export symbol <name> is created an reference the node identified
    by <symbol>. This <symbol> has to be an exported symbol available at
    the node the addon is applied to. For instance, assuming this base
    device-tree fragment in the base device-tree:
       target {
	  /export/ bar: &{/somewhere/bar-node};
       }
    The '--target "/target" --export "foo=&bar"' will export foo as an
    exported symbol pointing to /somewhere/bar-node. An addon can import
    the foo symbol an it will be resolved to /somewhere/bar-node.

  - Export by path (--export '<name>=&{<path>}')
    The export symbol <name> is created and reference the node available
    at the given <path>. This path must be an absolute path.
    The '--target "/target" --export "foo=&{/somewhere/baz-node}"'
    export the symbol 'foo' referencing the node at /somewhere/baz-node.
    Here again, an addon importing the foo symbol will see this foo symbol
    resolved to /somewhere/baz-node.
    It is worth noting that /somewhere/baz-node may not be referenced in
    the base device-tree. Indeed, /export/ could not be present to
    reference this node. If the node is not referenced, dtc will not
    create its phandle value and the resolution will failed. For this
    reason having a /export/ keyword at the target node pointing to the
    /somewhere/baz-node node is still recommended. This will
    ensure that dtc will create the needed phandle.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 fdtaddon.c                                    | 232 +++++++++++++++++-
 ...n_custom_resolver_node_a-merged.dtb.expect |  39 +++
 ...n_addon_custom_resolver_node_a.dtba.expect |  15 ++
 ...fdtaddon_addon_custom_resolver_node_a.dtsa |  22 ++
 ..._custom_resolver_node_ab-merged.dtb.expect |  42 ++++
 ..._addon_custom_resolver_node_ab.dtba.expect |  21 ++
 ...dtaddon_addon_custom_resolver_node_ab.dtsa |  29 +++
 .../fdtaddon_base_custom_resolver.dtb.expect  |  33 +++
 tests/fdtaddon_base_custom_resolver.dts       |  52 ++++
 tests/run_tests.sh                            |  25 ++
 10 files changed, 503 insertions(+), 7 deletions(-)
 create mode 100644 tests/fdtaddon_addon_custom_resolver_node_a-merged.dtb.expect
 create mode 100644 tests/fdtaddon_addon_custom_resolver_node_a.dtba.expect
 create mode 100644 tests/fdtaddon_addon_custom_resolver_node_a.dtsa
 create mode 100644 tests/fdtaddon_addon_custom_resolver_node_ab-merged.dtb.expect
 create mode 100644 tests/fdtaddon_addon_custom_resolver_node_ab.dtba.expect
 create mode 100644 tests/fdtaddon_addon_custom_resolver_node_ab.dtsa
 create mode 100644 tests/fdtaddon_base_custom_resolver.dtb.expect
 create mode 100644 tests/fdtaddon_base_custom_resolver.dts

diff --git a/fdtaddon.c b/fdtaddon.c
index 037851d9..80073860 100644
--- a/fdtaddon.c
+++ b/fdtaddon.c
@@ -22,20 +22,215 @@
 static const char usage_synopsis[] =
 	"apply an addon to a base blob\n"
 	"	fdtaddon <options> <addon.dtba>";
-static const char usage_short_opts[] = "i:o:t:v" USAGE_COMMON_SHORT_OPTS;
+static const char usage_short_opts[] = "i:o:t:e:v" USAGE_COMMON_SHORT_OPTS;
 static const struct option usage_long_opts[] = {
 	{ "input", required_argument, NULL, 'i' },
 	{ "output", required_argument, NULL, 'o' },
 	{ "target", required_argument, NULL, 't' },
+	{ "export", required_argument, NULL, 'e' },
 	{ "verbose", no_argument, NULL, 'v' },
 	USAGE_COMMON_LONG_OPTS,
 };
 static const char *const usage_opts_help[] = { "Input base DT blob",
-					       "Output DT blob", "Target node",
+					       "Output DT blob",
+					       "Target node",
+					       "Custom export symbol"
+					       "\n\tMultiple --export or -e can be present in order to export multiple symbols."
+					       "\n\tThe following syntaxes are supported:"
+					       "\n\t  - Defines a export symbol pointing to a node using its symbol"
+					       "\n\t      --export '<export_name>=&<symbol>'"
+					       "\n\t  - Defines a export symbol pointing to a node by path"
+					       "\n\t      --export '<export_name>=&{path_to_node}'",
 					       "Verbose messages",
 					       USAGE_COMMON_OPTS_HELP };
 
-static void *do_apply(void *base, const void *addon, const char *target)
+struct export_symbol {
+	char *name;
+	char *ref;
+	struct export_symbol *next;
+};
+
+struct resolver {
+	struct export_symbol *export_list;
+	int verbose;
+};
+
+static void resolver_init(struct resolver *resolver)
+{
+	memset(resolver, 0, sizeof(*resolver));
+}
+
+static void resolver_exit(struct resolver *resolver)
+{
+	struct export_symbol *e, *next;
+
+	e = resolver->export_list;
+	while (e) {
+		free(e->name);
+		free(e->ref);
+		next = e->next;
+		free(e);
+		e = next;
+	}
+}
+
+static char *str_strip_spaces(char *str)
+{
+	char *strip, *tmp;
+
+	tmp = str;
+	strip = str;
+	while (*tmp != '\0') {
+		if (*tmp != ' ' && *tmp != '\t')
+			*(strip++) = *tmp;
+		tmp++;
+	}
+	*strip = *tmp;
+	return str;
+}
+
+static char *str_split(char *str, char token, char **remaining)
+{
+	char *tmp;
+
+	tmp = strchr(str, token);
+	if (!tmp)
+		return NULL;
+	*(tmp++) = '\0'; /* Split the string at token char */
+
+	*remaining = tmp;
+	return str;
+}
+
+static int resolver_parse_export(struct resolver *resolver, const char *arg)
+{
+	struct export_symbol *export_symbol;
+	const char *name, *ref;
+	char *tmp, *strip;
+
+	strip = xstrdup(arg);
+	strip = str_strip_spaces(strip);
+
+	tmp = strip;
+
+	name = str_split(tmp, '=', &tmp);
+	if (!name || !strlen(name))
+		goto fail;
+
+	if (*(tmp++) != '&')
+		goto fail;
+	if (*tmp == '\0')
+		goto fail;
+
+	if (*tmp == '{') {
+		/* ref by path : &{/xxxx/yyyy} */
+		tmp++;
+		if (*(tmp) != '/')
+			goto fail;
+
+		ref = str_split(tmp, '}', &tmp);
+		if (!ref || !strlen(ref))
+			goto fail;
+		if (*tmp != '\0')
+			goto fail;
+	} else {
+		/* ref by symbol : &xxxx */
+		ref = tmp;
+		if (!strlen(ref))
+			goto fail;
+	}
+
+	export_symbol = xmalloc(sizeof(*export_symbol));
+	export_symbol->name = xstrdup(name);
+	export_symbol->ref = xstrdup(ref);
+	free(strip);
+
+	export_symbol->next = resolver->export_list;
+	resolver->export_list = export_symbol;
+	return 0;
+fail:
+	free(strip);
+	return -1;
+}
+
+static int resolver_resolve(void *priv, const void *fdt, int target_node,
+			    const char *importsym_name,
+			    const char *importsym_compatible)
+{
+	struct resolver *resolver = priv;
+	int node = -FDT_ERR_NOTFOUND;
+	struct export_symbol *e;
+
+	e = resolver->export_list;
+	while (e) {
+		if (strcmp(importsym_name, e->name)) {
+			e = e->next;
+			continue;
+		}
+
+		if (e->ref[0] == '/')
+			node = fdt_path_offset(fdt, e->ref);
+		else
+			node = fdt_addon_resolve_default(fdt, target_node, e->ref,
+							 NULL);
+
+		return node;
+	}
+	return -FDT_ERR_NOTFOUND;
+}
+
+static int resolver_validate(void *priv, const void *fdt, int target_node)
+{
+	struct resolver *resolver = priv;
+	struct export_symbol *e;
+	uint32_t phandle;
+	int node;
+
+	/*
+	 * Check the export_symbol list. The related node must exist in the fdt
+	 * blob and must have a valid phandle value.
+	 *
+	 * Simply revolve all export symbols available in the list to validate
+	 * that they can be resolved.
+	 */
+
+	e = resolver->export_list;
+	while (e) {
+		node = resolver_resolve(resolver, fdt, target_node, e->name,
+					NULL);
+		if (node < 0) {
+			fprintf(stderr,
+				"\nExport symbol '%s': Cannot find reference '%s'\n",
+				e->name, e->ref);
+			return node;
+		}
+
+		phandle = fdt_get_phandle(fdt, node);
+		if ((phandle == 0) || (phandle == ~0U)) {
+			fprintf(stderr,
+				"\nExport symbol '%s', reference '%s': Invalid phandle\n",
+				e->name, e->ref);
+			return -FDT_ERR_BADPHANDLE;
+		}
+
+		if (resolver->verbose) {
+			printf("Export symbol '%s', ref '%s' -> node at 0x%x, phandle 0x%"PRIx32"\n",
+				e->name, e->ref, node, phandle);
+		}
+
+		e = e->next;
+	}
+	return 0;
+}
+
+static const struct fdt_addon_resolver_ops resolver_ops = {
+	.validate = resolver_validate,
+	.resolve = resolver_resolve,
+};
+
+
+static void *do_apply(void *base, const void *addon, const char *target,
+		      struct resolver *resolver)
 {
 	void *tmp_merged;
 	void *tmp_addon;
@@ -72,7 +267,12 @@ static void *do_apply(void *base, const void *addon, const char *target)
 		goto fail;
 	}
 
-	ret = fdt_addon_apply(tmp_merged, tmp_addon, target);
+	if (resolver)
+		ret = fdt_addon_apply_resolver(tmp_merged, tmp_addon, target,
+					       &resolver_ops, resolver);
+	else
+		ret = fdt_addon_apply(tmp_merged, tmp_addon, target);
+
 	if (ret) {
 		fprintf(stderr, "\nFailed to apply %s\n", fdt_strerror(ret));
 		goto fail;
@@ -88,7 +288,8 @@ fail:
 }
 
 static int do_fdtaddon(const char *input_filename, const char *output_filename,
-		       const char *addon_filename, const char *target)
+		       const char *addon_filename, const char *target,
+		       struct resolver *resolver)
 {
 	void *base_blob = NULL;
 	void *addon_blob = NULL;
@@ -122,7 +323,7 @@ static int do_fdtaddon(const char *input_filename, const char *output_filename,
 	}
 
 	/* apply the addon  */
-	merged_blob = do_apply(base_blob, addon_blob, target);
+	merged_blob = do_apply(base_blob, addon_blob, target, resolver);
 	if (!merged_blob)
 		goto out_err;
 
@@ -146,7 +347,12 @@ int main(int argc, char *argv[])
 	char *addon_filename = NULL;
 	const char *target = NULL;
 	int verbose;
+	bool use_resolver = false;
+	struct resolver resolver;
 	int opt;
+	int ret;
+
+	resolver_init(&resolver);
 
 	while ((opt = util_getopt_long()) != EOF) {
 		switch (opt) {
@@ -164,6 +370,13 @@ int main(int argc, char *argv[])
 		case 't':
 			target = optarg;
 			break;
+		case 'e':
+			if (resolver_parse_export(&resolver, optarg) < 0) {
+				resolver_exit(&resolver);
+				return 1;
+			}
+			use_resolver = true;
+			break;
 		}
 	}
 
@@ -190,7 +403,12 @@ int main(int argc, char *argv[])
 		printf("addon = %s\n", addon_filename);
 	}
 
-	if (do_fdtaddon(input_filename, output_filename, addon_filename, target))
+	resolver.verbose = verbose;
+
+	ret = do_fdtaddon(input_filename, output_filename, addon_filename, target,
+			  use_resolver ? &resolver : NULL);
+	resolver_exit(&resolver);
+	if (ret)
 		return 1;
 
 	return 0;
diff --git a/tests/fdtaddon_addon_custom_resolver_node_a-merged.dtb.expect b/tests/fdtaddon_addon_custom_resolver_node_a-merged.dtb.expect
new file mode 100644
index 00000000..637387a7
--- /dev/null
+++ b/tests/fdtaddon_addon_custom_resolver_node_a-merged.dtb.expect
@@ -0,0 +1,39 @@
+/dts-v1/;
+
+/ {
+    base-node {
+        sub-node {
+            prop = <0x00000000>;
+            phandle = <0x00000003>;
+            addon-node {
+                prop = "other";
+            };
+        };
+    };
+    somewhere {
+        // [FDT_EXPORT_SYM] 'node_a1' -> phandle 0x00000001
+        // [FDT_EXPORT_SYM] 'node_a2' -> phandle 0x00000002
+        // [FDT_EXPORT_SYM] 'sub_node' -> phandle 0x00000003
+        // [FDT_EXPORT_SYM] 'node_b1' -> phandle 0x00000004
+        // [FDT_EXPORT_SYM] 'node_b2' -> phandle 0x00000005
+        node-a1 {
+            compatible = "abc,aaa";
+            phandle = <0x00000001>;
+            addon-node {
+                prop = "node_a";
+            };
+        };
+        node-a2 {
+            compatible = "abc,aaa";
+            phandle = <0x00000002>;
+        };
+        node-b1 {
+            compatible = "abc,bbb";
+            phandle = <0x00000004>;
+        };
+        node-b2 {
+            compatible = "abc,bbb";
+            phandle = <0x00000005>;
+        };
+    };
+};
diff --git a/tests/fdtaddon_addon_custom_resolver_node_a.dtba.expect b/tests/fdtaddon_addon_custom_resolver_node_a.dtba.expect
new file mode 100644
index 00000000..60104190
--- /dev/null
+++ b/tests/fdtaddon_addon_custom_resolver_node_a.dtba.expect
@@ -0,0 +1,15 @@
+/dts-v1/;
+/addon/;
+
+// [FDT_IMPORT_SYM] 'node_a' (abc,aaa)
+// [FDT_IMPORT_SYM] 'other' ()
+&node_a {
+    addon-node {
+        prop = "node_a";
+    };
+};
+&other {
+    addon-node {
+        prop = "other";
+    };
+};
diff --git a/tests/fdtaddon_addon_custom_resolver_node_a.dtsa b/tests/fdtaddon_addon_custom_resolver_node_a.dtsa
new file mode 100644
index 00000000..d400c4f2
--- /dev/null
+++ b/tests/fdtaddon_addon_custom_resolver_node_a.dtsa
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+/*
+ * Copyright (C) 2026 Bootlin
+ */
+
+/dts-v1/;
+/addon/;
+
+/import/ node_a: "abc,aaa";
+/import/ other: "";
+
+&node_a {
+	addon-node {
+		prop = "node_a";
+	};
+};
+
+&other {
+	addon-node {
+		prop = "other";
+	};
+};
diff --git a/tests/fdtaddon_addon_custom_resolver_node_ab-merged.dtb.expect b/tests/fdtaddon_addon_custom_resolver_node_ab-merged.dtb.expect
new file mode 100644
index 00000000..40678266
--- /dev/null
+++ b/tests/fdtaddon_addon_custom_resolver_node_ab-merged.dtb.expect
@@ -0,0 +1,42 @@
+/dts-v1/;
+
+/ {
+    base-node {
+        sub-node {
+            prop = <0x00000000>;
+            phandle = <0x00000003>;
+            addon-node {
+                prop = "other";
+            };
+        };
+    };
+    somewhere {
+        // [FDT_EXPORT_SYM] 'node_a1' -> phandle 0x00000001
+        // [FDT_EXPORT_SYM] 'node_a2' -> phandle 0x00000002
+        // [FDT_EXPORT_SYM] 'sub_node' -> phandle 0x00000003
+        // [FDT_EXPORT_SYM] 'node_b1' -> phandle 0x00000004
+        // [FDT_EXPORT_SYM] 'node_b2' -> phandle 0x00000005
+        node-a1 {
+            compatible = "abc,aaa";
+            phandle = <0x00000001>;
+        };
+        node-a2 {
+            compatible = "abc,aaa";
+            phandle = <0x00000002>;
+            addon-node {
+                prop = "node_a";
+            };
+        };
+        node-b1 {
+            compatible = "abc,bbb";
+            phandle = <0x00000004>;
+            addon-node {
+                prop = "node_b";
+            };
+        };
+        node-b2 {
+            compatible = "abc,bbb";
+            phandle = <0x00000005>;
+        };
+    };
+};
diff --git a/tests/fdtaddon_addon_custom_resolver_node_ab.dtba.expect b/tests/fdtaddon_addon_custom_resolver_node_ab.dtba.expect
new file mode 100644
index 00000000..04116f47
--- /dev/null
+++ b/tests/fdtaddon_addon_custom_resolver_node_ab.dtba.expect
@@ -0,0 +1,21 @@
+/dts-v1/;
+/addon/;
+
+// [FDT_IMPORT_SYM] 'node_a' (abc,aaa)
+// [FDT_IMPORT_SYM] 'node_b' (abc,bbb)
+// [FDT_IMPORT_SYM] 'other' ()
+&node_a {
+    addon-node {
+        prop = "node_a";
+    };
+};
+&node_b {
+    addon-node {
+        prop = "node_b";
+    };
+};
+&other {
+    addon-node {
+        prop = "other";
+    };
+};
diff --git a/tests/fdtaddon_addon_custom_resolver_node_ab.dtsa b/tests/fdtaddon_addon_custom_resolver_node_ab.dtsa
new file mode 100644
index 00000000..74a9cab3
--- /dev/null
+++ b/tests/fdtaddon_addon_custom_resolver_node_ab.dtsa
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+/*
+ * Copyright (C) 2026 Bootlin
+ */
+
+/dts-v1/;
+/addon/;
+
+/import/ node_a: "abc,aaa";
+/import/ node_b: "abc,bbb";
+/import/ other: "";
+
+&node_a {
+	addon-node {
+		prop = "node_a";
+	};
+};
+
+&node_b {
+	addon-node {
+		prop = "node_b";
+	};
+};
+
+&other {
+	addon-node {
+		prop = "other";
+	};
+};
diff --git a/tests/fdtaddon_base_custom_resolver.dtb.expect b/tests/fdtaddon_base_custom_resolver.dtb.expect
new file mode 100644
index 00000000..4a76672f
--- /dev/null
+++ b/tests/fdtaddon_base_custom_resolver.dtb.expect
@@ -0,0 +1,33 @@
+/dts-v1/;
+
+/ {
+    base-node {
+        sub-node {
+            prop = <0x00000000>;
+            phandle = <0x00000003>;
+        };
+    };
+    somewhere {
+        // [FDT_EXPORT_SYM] 'node_a1' -> phandle 0x00000001
+        // [FDT_EXPORT_SYM] 'node_a2' -> phandle 0x00000002
+        // [FDT_EXPORT_SYM] 'sub_node' -> phandle 0x00000003
+        // [FDT_EXPORT_SYM] 'node_b1' -> phandle 0x00000004
+        // [FDT_EXPORT_SYM] 'node_b2' -> phandle 0x00000005
+        node-a1 {
+            compatible = "abc,aaa";
+            phandle = <0x00000001>;
+        };
+        node-a2 {
+            compatible = "abc,aaa";
+            phandle = <0x00000002>;
+        };
+        node-b1 {
+            compatible = "abc,bbb";
+            phandle = <0x00000004>;
+        };
+        node-b2 {
+            compatible = "abc,bbb";
+            phandle = <0x00000005>;
+        };
+    };
+};
diff --git a/tests/fdtaddon_base_custom_resolver.dts b/tests/fdtaddon_base_custom_resolver.dts
new file mode 100644
index 00000000..b92475b2
--- /dev/null
+++ b/tests/fdtaddon_base_custom_resolver.dts
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+/*
+ * Copyright (C) 2026 Bootlin
+ */
+
+/dts-v1/;
+
+/ {
+	base-node {
+		sub_node: sub-node {
+			prop = <0>;
+		};
+	};
+
+	somewhere {
+		/*
+		 * Nodes are referenced, either by path or by symbol, by the
+		 * custom resolver available in the fdt_addon tool.
+		 *
+		 * Nodes referenced by symbols need to have the symbol exported
+		 * here (i.e. in the node where the addon is applied to).
+		 *
+		 * For nodes referenced by path by the custom resolver, this is
+		 * not strictly necessary but we need to ensure that DTC will
+		 * create the phandle property for those nodes.
+		 *
+		 * DTC creates phandles when a node is referenced in the dts
+		 * compiled by DTC. Using the /export/ keyword is a good way
+		 * to ensure this reference and so to have the phandle created.
+		 * Even if the exported symbol is not used (path instead of
+		 * symbol), this ensures the phandle creation by DTC.
+		 */
+		/export/ node_a1: &node_a1;
+		/export/ node_a2: &node_a2;
+		/export/ sub_node: &sub_node;
+		/export/ node_b1: &node_b1;
+		/export/ node_b2: &node_b2;
+
+		node_a1: node-a1 {
+			compatible = "abc,aaa";
+		};
+		node_a2: node-a2 {
+			compatible = "abc,aaa";
+		};
+		node_b1: node-b1 {
+			compatible = "abc,bbb";
+		};
+		node_b2: node-b2 {
+			compatible = "abc,bbb";
+		};
+	};
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 664ebf5d..6f4f8386 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -1369,6 +1369,31 @@ fdtaddon_tests() {
 	run_dtc_test -I dtb -O dts -o fdtaddon_stack_2nd-merged.dtb.dts fdtaddon_stack_2nd-merged.dtb
 	check_dts fdtaddon_stack_2nd-merged.dtb.dts
 
+	# Custom resolver
+	run_dtc_test -I dts -O dtb -o fdtaddon_base_custom_resolver.dtb "$SRCDIR/fdtaddon_base_custom_resolver.dts"
+	check_dtb fdtaddon_base_custom_resolver.dtb
+
+	run_dtc_test -I dts -O dtb -o fdtaddon_addon_custom_resolver_node_a.dtba "$SRCDIR/fdtaddon_addon_custom_resolver_node_a.dtsa"
+	check_dtb fdtaddon_addon_custom_resolver_node_a.dtba
+
+	run_fdtaddon_test -i fdtaddon_base_custom_resolver.dtb -o fdtaddon_addon_custom_resolver_node_a-merged.dtb \
+			  -t "/somewhere" \
+			  -e "node_a=&node_a1" \
+			  -e "other=&{/base-node/sub-node}" \
+			  fdtaddon_addon_custom_resolver_node_a.dtba
+	check_dtb fdtaddon_addon_custom_resolver_node_a-merged.dtb
+
+	run_dtc_test -I dts -O dtb -o fdtaddon_addon_custom_resolver_node_ab.dtba "$SRCDIR/fdtaddon_addon_custom_resolver_node_ab.dtsa"
+	check_dtb fdtaddon_addon_custom_resolver_node_ab.dtba
+
+	run_fdtaddon_test -i fdtaddon_base_custom_resolver.dtb -o fdtaddon_addon_custom_resolver_node_ab-merged.dtb \
+			  -t "/somewhere" \
+			  -e "node_a=&{/somewhere/node-a2}" \
+			  -e "node_b=&node_b1" \
+			  -e "other=&sub_node" \
+			  fdtaddon_addon_custom_resolver_node_ab.dtba
+	check_dtb fdtaddon_addon_custom_resolver_node_ab-merged.dtb
+
 	# More realistic dts and dtsa input files
 	run_dtc_test -I dts -O dtb -o fdtaddon_realistic_base.dtb "$SRCDIR/fdtaddon_realistic_base.dts"
 	check_dtb fdtaddon_realistic_base.dtb
-- 
2.55.0

