Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB66D3C1983
	for <devicetree-compiler@vger.kernel.org>; Wed, 26 Aug 2026 09:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787737883; cv=none; b=ST3oOafT3HskKE+yC4b6KC1LAiVu9+P2A2zZtDalCIePM8f+RqK5MqUEB2Ho6p2fKHJ1bi9VmFJ1+riXqACCWxC/25Ftl/UMt/hGKOv+TTzNJxU86aTrF0qtHkINavWUUgKbiEEKMGIYa6oBw2tzmduaVieUOK2UV/YiqJGt+Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787737883; c=relaxed/simple;
	bh=5Jnp6ycGza3DttBOq1zB8qyIYV+6XCsMJQfRrvSngjA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DQLOpn1fxqP5yx07t1f5U2TzyMhuro2DWBSOBMce09PH89EZ7hQxClgFha8JZO1X3SA0/bWvvgrBBaVcRbRfGJW9YCOs2mmYCEugUe1R6s167toRB3p3yIZ05Fqn51YBaLzKA9V4icmrVuq7kbv7O2FLB5txvPKSiWQzEQkrRlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=lEBYK4Iy; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="lEBYK4Iy"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0A7564E413BC;
	Wed, 26 Aug 2026 09:51:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D23FC604EC;
	Wed, 26 Aug 2026 09:51:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3185811C7AD5C;
	Wed, 26 Aug 2026 11:51:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787737873; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Zg4wutgCKtLkDUoNdaHBA97fW+9AdhMaGs/wxn7cDXc=;
	b=lEBYK4IyRscKrx7ujEWAoFPnvtyJ+wUOn6Vmb45nvZJwAVNad1xxmL9PaEK4xhOvznrzDw
	Xo1dQWfSCxS0lJfErQqv9a3SxLTa1YQb3rOJrPwckShO8nxOCbNXi6Ui0wAfsCg9sVgAQm
	Xz86P4/goJ1KfUTz6R8sztg4e06hM5QLcWYc8iCOwPZfVLBYvzrKiSZa6/b8huzS9CFAM3
	GF8Sm9rM7lUBkY79CGEx0kyaC36XMKJYUAt+IAh4A7o0OFAIVxEDlupPhzC5GZ6T5ebmAI
	mzGhn9bjsQHZJL6LDhW6YTJXxf7dKcwrga2IHopymCAmQ9XdltHTnXFeoCBJzA==
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
Subject: [RFC PATCH v2 13/74] Add support for /addon/ keyword
Date: Wed, 26 Aug 2026 11:48:42 +0200
Message-ID: <20260826094950.1088288-14-herve.codina@bootlin.com>
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

The dts /addon/ keyword allows to mark a dts as an addon dts.

This is similar to /plugin/ used for overlay dts but specific to addon
dts.

It is also worth noting that a dts tagged with /addon/ will lead to a
dtb with the dt_flags set to FDT_FLAG_ADDON (0x1).

This allows to identify without any ambiguity an addon dts and an addon
dtb.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 checks.c     | 36 +++++++++++++++++++++++-------------
 dtc-lexer.l  |  5 +++++
 dtc-parser.y |  5 +++++
 dtc.h        |  1 +
 fdtdump.c    |  4 ++++
 flattree.c   | 15 ++++++++++++---
 libfdt/fdt.h |  1 +
 treesource.c |  6 ++++++
 8 files changed, 57 insertions(+), 16 deletions(-)

diff --git a/checks.c b/checks.c
index a6037ed0..cb3b4b16 100644
--- a/checks.c
+++ b/checks.c
@@ -624,7 +624,7 @@ static void fixup_phandle_references(struct check *c, struct dt_info *dti,
 
 			refnode = get_node_by_ref(dt, m->ref);
 			if (! refnode) {
-				if (!(dti->dtsflags & DTSF_PLUGIN))
+				if (!(dti->dtsflags & (DTSF_PLUGIN | DTSF_ADDON)))
 					FAIL(c, dti, node, "Reference to non-existent node or "
 							"label \"%s\"\n", m->ref);
 				else /* mark the entry as unresolved */
@@ -726,8 +726,8 @@ static void check_alias_paths(struct check *c, struct dt_info *dti,
 			continue;
 		}
 
-		/* This check does not work for overlays with external paths */
-		if (!(dti->dtsflags & DTSF_PLUGIN) &&
+		/* This check does not work for overlays nor addons with external paths */
+		if (!(dti->dtsflags & (DTSF_PLUGIN | DTSF_ADDON)) &&
 		    (!prop->val.val || !get_node_by_path(dti->dt, prop->val.val))) {
 			FAIL_PROP(c, dti, node, prop, "aliases property is not a valid node (%s)",
 				  prop->val.val);
@@ -1425,8 +1425,8 @@ static void check_property_phandle_args(struct check *c,
 		 * entries when each index position has a specific definition.
 		 */
 		if (!phandle_is_valid(phandle)) {
-			/* Give up if this is an overlay with external references */
-			if (dti->dtsflags & DTSF_PLUGIN)
+			/* Give up if this is an overlay or addon with external references */
+			if (dti->dtsflags & (DTSF_PLUGIN | DTSF_ADDON))
 				break;
 
 			cellsize = 0;
@@ -1659,8 +1659,8 @@ static void check_interrupt_map(struct check *c,
 
 		phandle = propval_cell_n(irq_map_prop, cell);
 		if (!phandle_is_valid(phandle)) {
-			/* Give up if this is an overlay with external references */
-			if (!(dti->dtsflags & DTSF_PLUGIN))
+			/* Give up if this is an overlay or an addon with external references */
+			if (!(dti->dtsflags & (DTSF_PLUGIN | DTSF_ADDON)))
 				FAIL_PROP(c, dti, node, irq_map_prop,
 					  "Cell %zu is not a phandle(%d)",
 					  cell, phandle);
@@ -1728,9 +1728,9 @@ static void check_interrupts_property(struct check *c,
 		if (prop) {
 			phandle = propval_cell(prop);
 			if (!phandle_is_valid(phandle)) {
-				/* Give up if this is an overlay with
+				/* Give up if this is an overlay with or an addon
 				 * external references */
-				if (dti->dtsflags & DTSF_PLUGIN)
+				if (dti->dtsflags & (DTSF_PLUGIN | DTSF_ADDON))
 					return;
 				FAIL_PROP(c, dti, parent, prop, "Invalid phandle");
 				continue;
@@ -1846,8 +1846,8 @@ static void check_graph_port(struct check *c, struct dt_info *dti,
 
 	check_graph_reg(c, dti, node);
 
-	/* skip checks below for overlays */
-	if (dti->dtsflags & DTSF_PLUGIN)
+	/* skip checks below for overlays or addons */
+	if (dti->dtsflags & (DTSF_PLUGIN | DTSF_ADDON))
 		return;
 
 	if (!strprefixeq(node->name, node->basenamelen, "port"))
@@ -1888,8 +1888,8 @@ static void check_graph_endpoint(struct check *c, struct dt_info *dti,
 
 	check_graph_reg(c, dti, node);
 
-	/* skip checks below for overlays */
-	if (dti->dtsflags & DTSF_PLUGIN)
+	/* skip checks below for overlays or addons */
+	if (dti->dtsflags & (DTSF_PLUGIN | DTSF_ADDON))
 		return;
 
 	if (!strprefixeq(node->name, node->basenamelen, "endpoint"))
@@ -2062,6 +2062,16 @@ void process_checks(bool force, struct dt_info *dti)
 	unsigned int i;
 	int error = 0;
 
+	if ((dti->dtsflags & (DTSF_ADDON | DTSF_PLUGIN)) == (DTSF_ADDON | DTSF_PLUGIN)) {
+		/*
+		 * Addons and overlays are mutually exclusive. The same input
+		 * cannot be both.
+		 */
+		fprintf(stderr,
+			"ERROR: Input tree cannot be both an addon and an overlay\n");
+		exit(2);
+	}
+
 	for (i = 0; i < ARRAY_SIZE(check_table); i++) {
 		struct check *c = check_table[i];
 
diff --git a/dtc-lexer.l b/dtc-lexer.l
index 1b129b11..7e9b6796 100644
--- a/dtc-lexer.l
+++ b/dtc-lexer.l
@@ -108,6 +108,11 @@ static void PRINTF(1, 2) lexical_error(const char *fmt, ...);
 			return DT_PLUGIN;
 		}
 
+<*>"/addon/"	{
+			DPRINT("Keyword: /addon/\n");
+			return DT_ADDON;
+		}
+
 <*>"/memreserve/"	{
 			DPRINT("Keyword: /memreserve/\n");
 			BEGIN_DEFAULT();
diff --git a/dtc-parser.y b/dtc-parser.y
index e47f80d4..2e152b0e 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -53,6 +53,7 @@ static bool is_ref_relative(const char *ref)
 
 %token DT_V1
 %token DT_PLUGIN
+%token DT_ADDON
 %token DT_MEMRESERVE
 %token DT_LSHIFT DT_RSHIFT DT_LE DT_GE DT_EQ DT_NE DT_AND DT_OR
 %token DT_BITS
@@ -120,6 +121,10 @@ header:
 		{
 			$$ = DTSF_V1 | DTSF_PLUGIN;
 		}
+	| DT_V1 ';' DT_ADDON ';'
+		{
+			$$ = DTSF_V1 | DTSF_ADDON;
+		}
 	;
 
 headers:
diff --git a/dtc.h b/dtc.h
index 64eaffde..40aab572 100644
--- a/dtc.h
+++ b/dtc.h
@@ -336,6 +336,7 @@ struct dt_info {
 /* DTS version flags definitions */
 #define DTSF_V1		0x0001	/* /dts-v1/ */
 #define DTSF_PLUGIN	0x0002	/* /plugin/ */
+#define DTSF_ADDON	0x0004	/* /addon/ */
 
 struct dt_info *build_dt_info(unsigned int dtsflags,
 			      struct reserve_info *reservelist,
diff --git a/fdtdump.c b/fdtdump.c
index 2acf3210..370db848 100644
--- a/fdtdump.c
+++ b/fdtdump.c
@@ -120,6 +120,10 @@ static void dump_blob(void *blob, bool debug, int dump_unknown)
 		printf("// last_comp_version_w:\t%"PRIu32"\n",
 		       fdt32_to_cpu(bph->last_comp_version_w));
 	}
+	if (version >= 18) {
+		if (fdt32_to_cpu(bph->dt_flags) & FDT_FLAG_ADDON)
+			printf("/addon/;\n");
+	}
 	printf("\n");
 
 	for (i = 0; ; i++) {
diff --git a/flattree.c b/flattree.c
index abc50873..004119c4 100644
--- a/flattree.c
+++ b/flattree.c
@@ -420,6 +420,7 @@ void dt_to_blob(FILE *f, struct dt_info *dti, int version)
 	struct data dtbuf      = empty_data;
 	struct data strbuf     = empty_data;
 	struct fdt_header fdt;
+	uint32_t dt_flags = 0;
 	int padlen = 0;
 
 	for (i = 0; i < ARRAY_SIZE(version_table); i++) {
@@ -429,6 +430,8 @@ void dt_to_blob(FILE *f, struct dt_info *dti, int version)
 	if (!vi)
 		die("Unknown device tree blob version %d\n", version);
 
+	dt_flags |= dti->dtsflags & DTSF_ADDON ? FDT_FLAG_ADDON : 0;
+
 	flatten_tree(dti->dt, &bin_emitter, &dtbuf, &strbuf, vi);
 	bin_emit_cell(&dtbuf, FDT_END);
 
@@ -436,7 +439,7 @@ void dt_to_blob(FILE *f, struct dt_info *dti, int version)
 
 	/* Make header */
 	make_fdt_header(&fdt, vi, reservebuf.len, dtbuf.len, strbuf.len,
-			dti->boot_cpuid_phys, 0);
+			dti->boot_cpuid_phys, dt_flags);
 
 	/*
 	 * If the user asked for more space than is used, adjust the totalsize.
@@ -519,6 +522,7 @@ void dt_to_asm(FILE *f, struct dt_info *dti, int version)
 	struct data strbuf = empty_data;
 	struct reserve_info *re;
 	const char *symprefix = "dt";
+	uint32_t dt_flags = 0;
 
 	for (i = 0; i < ARRAY_SIZE(version_table); i++) {
 		if (version_table[i].version == version)
@@ -527,6 +531,8 @@ void dt_to_asm(FILE *f, struct dt_info *dti, int version)
 	if (!vi)
 		die("Unknown device tree blob version %d\n", version);
 
+	dt_flags |= dti->dtsflags & DTSF_ADDON ? FDT_FLAG_ADDON : 0;
+
 	fprintf(f, "/* autogenerated by dtc, do not edit */\n\n");
 
 	emit_label(f, symprefix, "blob_start");
@@ -569,7 +575,7 @@ void dt_to_asm(FILE *f, struct dt_info *dti, int version)
 
 	if (vi->flags & FTF_DTFLAGS) {
 		fprintf(f, "\t/* dt_flags */\n");
-		asm_emit_cell(f, 0);
+		asm_emit_cell(f, dt_flags);
 	}
 
 	if (vi->flags & FTF_LCVERSW) {
@@ -1113,8 +1119,11 @@ struct dt_info *dt_from_blob(const char *fname)
 	if (version >= 18)
 		flags |= FTF_DTFLAGS | FTF_LCVERSW;
 
-	if (version >= 20)
+	if (version >= 20) {
 		flags |= FTF_PROPDATA_PHANDLE;
+		dtsflags |= fdt32_to_cpu(fdt->dt_flags) & FDT_FLAG_ADDON ?
+				DTSF_ADDON : 0;
+	}
 
 	inbuf_init(&memresvbuf,
 		   blob + off_mem_rsvmap, blob + totalsize);
diff --git a/libfdt/fdt.h b/libfdt/fdt.h
index c151aa2b..255e9447 100644
--- a/libfdt/fdt.h
+++ b/libfdt/fdt.h
@@ -52,6 +52,7 @@ struct fdt_property {
 #endif /* !__ASSEMBLER__ */
 
 #define FDT_MAGIC	0xd00dfeed	/* 4: version, 4: total size */
+#define FDT_FLAG_ADDON  0x1
 #define FDT_TAGSIZE	sizeof(fdt32_t)
 #define FDT_CELLSIZE	sizeof(fdt32_t)
 
diff --git a/treesource.c b/treesource.c
index 0e33e3e1..9f6cf92d 100644
--- a/treesource.c
+++ b/treesource.c
@@ -420,8 +420,14 @@ void dt_to_source(FILE *f, struct dt_info *dti)
 	struct reserve_info *re;
 
 	fprintf(f, "/dts-v1/;\n");
+	/*
+	 * DTSF_PLUGIN and DTSF_ADDON are mutually exclusive. This has been
+	 * already checked.
+	 */
 	if (dti->dtsflags & DTSF_PLUGIN)
 		fprintf(f, "/plugin/;\n");
+	if (dti->dtsflags & DTSF_ADDON)
+		fprintf(f, "/addon/;\n");
 	fprintf(f, "\n");
 
 	for (re = dti->reservelist; re; re = re->next) {
-- 
2.55.0

