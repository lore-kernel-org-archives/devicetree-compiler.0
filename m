Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87ED737D11F;
	Wed, 26 Aug 2026 09:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787737928; cv=none; b=YSV1lB/wjGTfBgMPf9UrlNmVwNKZ/sVqtusFgEuFztibkaNTURigZyG/IFd5pCDuon8fIOjQjy4nGwKWDPdGCiUvRQTTGyq/KEjv7Vpj1NgqIyFd3OOun5E4zlUKHBMkpPt0n0dMt3zFeeZNZDp6SseDJT6oS8ChmitQnzzycHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787737928; c=relaxed/simple;
	bh=IDL8S9arxDp+eFsP3awElt8B4Ute9+D8mp9mKr5e6VM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pVxaOEd6fIdV5NuzUtkfJLwj5C/C1zvh5hErbM0QBHKV/6aW1O8iAaZn31gPsqL5QXZYBPK4ojh4vxiG7rIlR7u22aYShA4QOgQtDYjvzZu9mdCBk8Ifjyt8afSx0xZ45om7L/LEmZ+hlytF8tPQbafPIHhDdYEkJ0+pVbTM0Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mQtHIAOT; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mQtHIAOT"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4F4A84E413C1;
	Wed, 26 Aug 2026 09:52:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 247C6604EC;
	Wed, 26 Aug 2026 09:52:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EB72011C7AD67;
	Wed, 26 Aug 2026 11:52:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787737922; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=0MEIiww7ZG8Q9mriq6yTwWHecJWVxx5LBg4A6l0T8/4=;
	b=mQtHIAOTv6CkgvZYacZeLaHm1dJmOYvm3OB+ZmCTKkqbeXf740QHYr9n5AwFceJwbioJUo
	CFdYWqm4tGaundfYmZYyY98guQWmiwFU4Tc/naWR4jldc9wrVV6ytre1LQQuvmXF5a5y61
	wvut2fAFTsY7neIS1Cr5gqBEupJH75s4mrV9LILp77WWJh0BJWawYtPqTQ5QY6aakJjK3o
	ZU9VJrF8slQKXpsQIsoWLzQbPV9vJWzs1HnttfiYiAqkDQcX4FB1Kul2PLxvP1mbY75Fzm
	I09ruH+14nR2/CcuS0OkFxR0VB9SE9J9DV+sYOfwHbAOZesKVVloD0B5piKDnw==
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
Subject: [RFC PATCH v2 29/74] dtc: Add support for /import/ dts keyword parsing
Date: Wed, 26 Aug 2026 11:48:58 +0200
Message-ID: <20260826094950.1088288-30-herve.codina@bootlin.com>
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

The /import/ dts keyword is the keyword used to define an imported
symbol used by an addon device-tree.

An imported symbol is not related to a specific node and it is global to
a whole addon. It can be present after the header definition (and the
possible memreserves definition) and before the devicetree nodes
definition.

If several symbols are imported, several /import/ keyword are present.

The syntax used is the following:
  /import/ name: compatible;

with:
  name: The name of the imported symbol
  compatible: a string indicating the kind of symbol is expected. This
              compatible string can be used when the addon is applied in
              order to help the symbol resolution.

For instance:
  /import/ foo: "bar, foo";

  The foo symbol is expected by the addon and should be "bar, foo"
  compatible.

  The addon uses this symbol (i.e. it references it) but it doesn't
  define the symbol itself.

  From the addon point of view, foo is an unresolved symbol and it will
  be resolved when the addon is applied.

Add support for /import/ dts keyword.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 dtc-lexer.l  |  6 ++++++
 dtc-parser.y | 45 +++++++++++++++++++++++++++++++++++++++++++++
 dtc.h        |  3 +++
 livetree.c   | 13 +++++++++++++
 4 files changed, 67 insertions(+)

diff --git a/dtc-lexer.l b/dtc-lexer.l
index 3c3f3413..f21ae00d 100644
--- a/dtc-lexer.l
+++ b/dtc-lexer.l
@@ -152,6 +152,12 @@ static void PRINTF(1, 2) lexical_error(const char *fmt, ...);
 			return DT_EXPORT;
 		}
 
+<*>"/import/" 	{
+			DPRINT("Keyword: /import/\n");
+			BEGIN_DEFAULT();
+			return DT_IMPORT;
+		}
+
 <*>{LABEL}:	{
 			DPRINT("Label: %s\n", yytext);
 			yylval.labelref = xstrdup(yytext);
diff --git a/dtc-parser.y b/dtc-parser.y
index 48c40e81..61ebde2d 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -50,6 +50,7 @@ static bool is_ref_relative(const char *ref)
 	struct node *nodelist;
 	struct symbol *symbol;
 	struct symbol *exportlist;
+	struct symbol *importlist;
 	struct reserve_info *re;
 	uint64_t integer;
 	unsigned int flags;
@@ -65,6 +66,7 @@ static bool is_ref_relative(const char *ref)
 %token DT_DEL_NODE
 %token DT_OMIT_NO_REF
 %token DT_EXPORT
+%token DT_IMPORT
 %token <propnodename> DT_PROPNODENAME
 %token <integer> DT_LITERAL
 %token <integer> DT_CHAR_LITERAL
@@ -87,6 +89,8 @@ static bool is_ref_relative(const char *ref)
 %type <proplist> proplist
 %type <symbol> exportdef
 %type <exportlist> exportlist
+%type <symbol> importdef
+%type <exportlist> importlist
 %type <labelref> dt_ref
 
 %type <node> devicetree
@@ -118,6 +122,17 @@ sourcefile:
 			                              guess_boot_cpuid($3),
 						      NULL);
 		}
+	|  headers memreserves importlist devicetree
+		{
+			/*
+			 * importlist is created with chain_symbol() and so it
+			 * is created in reverse order. Reverse it now to have
+			 * it in correct order
+			 */
+			parser_output = build_dt_info($1, $2, $4,
+			                              $4 ? guess_boot_cpuid($4) : 0,
+			                              reverse_symbol($3));
+		}
 	;
 
 header:
@@ -171,6 +186,36 @@ memreserve:
 		}
 	;
 
+importlist:
+	  importdef
+		{
+			$$ = chain_symbol($1, NULL);
+		}
+	| importlist importdef
+		{
+			$$ = chain_symbol($2, $1);
+		}
+	| importlist memreserve
+		{
+			ERROR(&@2, "Mem reserve must precede imports");
+			YYERROR;
+		}
+	;
+
+importdef:
+	DT_IMPORT DT_LABEL DT_STRING ';'
+		{
+			struct data d = $3;
+
+			if (!(last_header_flags & DTSF_ADDON))
+				ERROR(&@2, "Import symbols supported only in addon");
+
+			$$ = build_importsym($2, d.val, &@$);
+			free($2);
+			data_free($3);
+		}
+	;
+
 dt_ref: DT_LABEL_REF | DT_PATH_REF;
 
 devicetree:
diff --git a/dtc.h b/dtc.h
index 63fe4dc1..61521329 100644
--- a/dtc.h
+++ b/dtc.h
@@ -207,6 +207,7 @@ struct label {
 struct symbol {
 	bool is_local;
 	char *name;
+	char *compatible;
 	char *ref;
 	cell_t phandle;
 	char *fullpath;
@@ -287,6 +288,8 @@ struct property *reverse_properties(struct property *first);
 
 struct symbol *build_exportsym(const char *name, const char *ref, cell_t phandle,
 			       struct srcpos *srcpos);
+struct symbol *build_importsym(const char *name, const char *compatible,
+			       struct srcpos *srcpos);
 struct symbol *chain_symbol(struct symbol *first, struct symbol *list);
 struct symbol *reverse_symbol(struct symbol *list);
 void add_symbol(struct symbol **list, struct symbol *new);
diff --git a/livetree.c b/livetree.c
index a6c40642..30344fb8 100644
--- a/livetree.c
+++ b/livetree.c
@@ -51,6 +51,19 @@ struct symbol *build_exportsym(const char *name, const char *ref, cell_t phandle
 	return new;
 }
 
+struct symbol *build_importsym(const char *name, const char *compatible, struct srcpos *srcpos)
+{
+	struct symbol *new = xmalloc(sizeof(*new));
+
+	memset(new, 0, sizeof(*new));
+
+	new->name = xstrdup(name);
+	new->compatible = xstrdup(compatible);
+	new->srcpos = srcpos_copy(srcpos);
+
+	return new;
+}
+
 struct symbol *chain_symbol(struct symbol *first, struct symbol *list)
 {
 	assert(first->next == NULL);
-- 
2.55.0

