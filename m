Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4AA25DCFA
	for <devicetree-compiler@vger.kernel.org>; Tue, 11 Mar 2025 15:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741707364; cv=none; b=gKGBDLt+8U5VUWs682rsYszKisL/qXkwROu6kSmb6DxuBqYVLy6WUarVIe58v6GoQh7AdHtjBslJHnQmcVD3XJoDugawkLOlYZo1nyLu7eNbp2bG56sLA+die5d0fn+cteIUzJHHA/Yf5El4EBZOFw4Xo0LUo4YsehdNxws8+qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741707364; c=relaxed/simple;
	bh=oatAJlLi3xVeyVmHjwTYijGlSRIQ/zw46snCDKSxgIw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XpH2aaIznJHsDq9xWzZd22TnXBpSyTslzwrZUzR2t4yGx99vxngiN0zVxQDbA59jYLdA5jHHCIvmEOpjONnr4aLxH4e/SxaYHtke+2QcDhFzTLTwt3tJkwOMbdhW6TzfPQDbIpAQMxkzFJCKm45pZpCSWl559CUg4otGb81UWYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=1zMcDu9U; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="1zMcDu9U"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2ff69365e1dso8340125a91.3
        for <devicetree-compiler@vger.kernel.org>; Tue, 11 Mar 2025 08:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1741707362; x=1742312162; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xtqSlcGHkdFkx5Le8uNvIL9wgryxbeGhrIhD33c99wo=;
        b=1zMcDu9UnpOU6Em13eRo03gOqZXD+KD6f2MTW9BEmA1xnLsu8Gmy8DwKbA5+HCdeBA
         AqxpnQZvhTEmHFfOoBB0N2Y0RlSO36+HVfFcACzBJe2bvbF4TE7Wt3PijksQC5OoloAy
         2tRLSL7HRO0u9GYIMYGJNM8IzDYcamEfhz2mEnZc4zGnHaft3qygntedz7DsQSgwUQHH
         0b02eK3rSNJYzxFICP9nFp44mDBgIrne/qhMiJ/YI/jFz61ENKy9slw4El8feHxZoa77
         BxJRZ3swc6wCAsNmHORMRHnhkFaFaEv4IxV55ZXE1TNUX1PqupJpIu9GHWOWIBpDDKGp
         X2TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741707362; x=1742312162;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xtqSlcGHkdFkx5Le8uNvIL9wgryxbeGhrIhD33c99wo=;
        b=GOStD3fDVaZnPd4fRSgdso1wiu2tYvTq+ceBU1VNgpm5c/kWl5Ec5TAoe1283Yv/f2
         yTo+pABfZUNp150t1VwZZ96ApDd1YAPaTU1Oue33BzUlOPy7mPF8gS9EtJ4ubLpL/YDQ
         jIiozkyGWqiwQ3V1HiV7nBNvL9DJlGZg3gsQRK7sdNaajAZuVgG/jHRvgMP8aDk7l/c5
         BWQZ1V52CmDFLtIlhhIGahFt5xyDNoZM8fdhh5sj887OcMVFkQ5mVezQZiNGwWW1Q0Zu
         MYb9hjFz5/z8PASxbxIpTUxWfsuxcVSfJJnTTZVkrcNvVqc0tCsQEPFEPZtSuDnZWx7w
         vDSA==
X-Gm-Message-State: AOJu0YxVLhaPto7cvqgQOc7VYOrEd2OZmUSkKGvUFBZ5mxktKjc+Yn6i
	L/3z+x0voB1V7LabpEHLxVMsaHNJLtSwLFSOxWw8isxMsySqYQNKqGUtuUotxg==
X-Gm-Gg: ASbGncuFKSEsB57kVFBlZC6/SdVhRMGu2fM1Zq9LYQOdzOt1GqqeFoE/0GQd8TPNMkg
	DKdY3cClR44vw7GF6MmyBbbn/5egmqU3arI2Imz4qByg1rpDdiGfAOzj1CsLETrAoolbPNVii2U
	HJ6u1u+F2LIfx7MMsazX5A4SKs+A0T/vkfv4RntDkc+RudN08ovPxYvTJn0Wu9CwfSlMLlUjBNi
	l8S1sPpgLEZFZlqrJSyGTdXgfMZyXJ7YczQFsFs44J93Z0Bf3vtUeHXaR+5i7zUZN6GEWONbGWa
	x+ZRiDs9umpj/YM5ayPMC/6/0O2ohHDyX9891iwi2hUqwdzuJbqVZuUyvMhS4w==
X-Google-Smtp-Source: AGHT+IFmCYbbIeoZ6leoaG7NcQ3M5qfCjEgLHc5Nd1j42FEJIRSiuKtInrVU0Q+XrBPWwPj68mvHmg==
X-Received: by 2002:a17:90a:e7ce:b0:2ff:58a4:9db3 with SMTP id 98e67ed59e1d1-2ff7cf25652mr27141668a91.35.1741707362237;
        Tue, 11 Mar 2025 08:36:02 -0700 (PDT)
Received: from [172.16.118.31] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff4e822bd2sm12030413a91.41.2025.03.11.08.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 08:36:01 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
Date: Tue, 11 Mar 2025 21:05:39 +0530
Subject: [PATCH v2 3/4] dtc: Add /./
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250311-previous-value-v2-3-e4a8611e956f@beagleboard.org>
References: <20250311-previous-value-v2-0-e4a8611e956f@beagleboard.org>
In-Reply-To: <20250311-previous-value-v2-0-e4a8611e956f@beagleboard.org>
To: David Gibson <david@gibson.dropbear.id.au>, 
 Andreas Gnau <andreas.gnau@iopsys.eu>, d-gole@ti.com, 
 lorforlinux@beagleboard.org, jkridner@beagleboard.org, 
 robertcnelson@beagleboard.org, Andrew Davis <afd@ti.com>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Simon Glass <sjg@chromium.org>
Cc: devicetree-compiler@vger.kernel.org, 
 Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4368; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=oatAJlLi3xVeyVmHjwTYijGlSRIQ/zw46snCDKSxgIw=;
 b=owEBbQKS/ZANAwAIAQXO9ceJ5Vp0AcsmYgBn0FhLWpm098zkTOkqOjW3i9Pm924ZumOScFxTm
 w2JYBFdPneJAjMEAAEIAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCZ9BYSwAKCRAFzvXHieVa
 dH0mEADnTIm8vibtxVFGfpiBfoYfGPI2bnUO/nrE6+QtTp0nywJ/NUyH495oIvFifBswQNg7iyo
 BvzGMwlRetq2UofhQyPwhTPM18z7Q5S3t6PKdrew4PTTQmll/FhqjbgpYU0wVL2mFJN+HeZU5TH
 3slxVh83CSW83iMZb+Hg1BAflwwMIAjmZyD633RSl0p23uz5QkMoh6A1U9GQyARuC7+lib7o2aV
 wDp6w/eGivfYWGv8r5R3lly92BQMPF7swDlHeeQMcuj9s3EFNO6za+tVfbfrY0lUKg6w82tWc1b
 RA4vzgwbx+UuDQ8IPA8z4Pkq1PlYQcQJkYXSGenoB7NbMnJ9xvhVYBaXNmR3BiWYigk7pJAaanz
 Pycp3i2vY78L/8vML/IeShNzP8FwsHTrqRuT56o/gglwQEcVFnt8rXyOzE2HyVLZfq3PPJ8H5uP
 R3YCiwXy8T05rlzStNpUZ8yOnxW7I6GRSscHz+4Wn/BFBJ8R3OtIPn7fCcY8yJWXS3LvaUsrA3l
 zSO2eKPXB2b3uLGhYDROIYehEvaDsKCLLUonHOhFkcx25F5XLRZezCr1Vvq2mqyUk+LYbW+FHJG
 NJwJSqW35MMkTY9CwxQZWJHNMSusZPxYgFIgNp8/CK5/RYw4/5zeSH86rRahDQI0GN6pPgK03GQ
 R/U01i5xazpotkg==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

Allow constructing new values for a property using old property values.
Can be used to append, pre-append, duplicate, etc.

In practice, it looks as follows:

dts-v1/;

/ {
	str-prop = "0";
	int-prop = <0>;
};

/ {
	str-prop = /./, "1", /./;
	int-prop = /./, <1>, /./;
};

dts to source output with -T -T also works as expected:

/dts-v1/;

/ { /* base.dts:3:3-5:3, base.dts:7:3-9:3 */
        int-prop = <0x00 0x01>, <0x02 0x03>, <0x00 0x01>; /* base.dts:4:9-4:26, base.dts:8:9-8:36 */
}; /* base.dts:3:3-5:3, base.dts:7:3-9:3 */

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
 dtc-lexer.l  |  5 +++++
 dtc-parser.y |  5 +++++
 dtc.h        |  1 +
 livetree.c   | 50 ++++++++++++++++++++++++++++++++++++++++++++++++--
 4 files changed, 59 insertions(+), 2 deletions(-)

diff --git a/dtc-lexer.l b/dtc-lexer.l
index de60a70b6bdbcb5ae4336ea4171ad6f645e91b36..5efeca10363e0c9c338b6578be9240c3f42249f0 100644
--- a/dtc-lexer.l
+++ b/dtc-lexer.l
@@ -144,6 +144,11 @@ static void PRINTF(1, 2) lexical_error(const char *fmt, ...);
 			return DT_OMIT_NO_REF;
 		}
 
+<*>"/./" {
+			DPRINT("Keyword: /./\n");
+			return DT_PREV_PROP;
+		}
+
 <*>{LABEL}:	{
 			DPRINT("Label: %s\n", yytext);
 			yylval.labelref = xstrdup(yytext);
diff --git a/dtc-parser.y b/dtc-parser.y
index 4d5eece526243460203157464e3cd75f781e50e7..c34eb10a1068b5eb6a0f08e5a1db8066217b16bf 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -57,6 +57,7 @@ static bool is_ref_relative(const char *ref)
 %token DT_LSHIFT DT_RSHIFT DT_LE DT_GE DT_EQ DT_NE DT_AND DT_OR
 %token DT_BITS
 %token DT_DEL_PROP
+%token DT_PREV_PROP
 %token DT_DEL_NODE
 %token DT_OMIT_NO_REF
 %token <propnodename> DT_PROPNODENAME
@@ -308,6 +309,10 @@ propdata:
 		{
 			$$ = data_merge($1, $2);
 		}
+        | propdataprefix DT_PREV_PROP
+                {
+                        $$ = data_add_marker($1, PREV_VALUE, NULL);
+                }
 	| propdataprefix arrayprefix '>'
 		{
 			$$ = data_merge($1, $2.data);
diff --git a/dtc.h b/dtc.h
index 86928e1eea9764fe5d74d6dbb987589d65d54b66..175fe3637a31cc28453dc27980f315a171763b49 100644
--- a/dtc.h
+++ b/dtc.h
@@ -110,6 +110,7 @@ enum markertype {
 	REF_PHANDLE,
 	REF_PATH,
 	LABEL,
+	PREV_VALUE,
 	TYPE_UINT8,
 	TYPE_UINT16,
 	TYPE_UINT32,
diff --git a/livetree.c b/livetree.c
index 93c77d95a320ec05aa355e12920cef9e1c91c26a..22d45ca90bec8971d02231787217deb7caf53310 100644
--- a/livetree.c
+++ b/livetree.c
@@ -139,10 +139,40 @@ struct node *reference_node(struct node *node)
 	return node;
 }
 
+static struct data data_insert_old_value(struct data d, struct marker *m,
+					 struct data old)
+{
+	unsigned int offset = m->offset;
+	struct marker *next = m->next;
+	struct marker *marker;
+	struct data new_data;
+	char *ref;
+
+	new_data = data_insert_at_marker(d, m, old.val, old.len);
+
+	/* Copy all markers from old value */
+	marker = old.markers;
+	for_each_marker(marker) {
+		ref = NULL;
+
+		if (marker->ref)
+			ref = xstrdup(marker->ref);
+
+		m->next = alloc_marker(marker->offset + offset, marker->type,
+				       ref);
+		m = m->next;
+	}
+	m->next = next;
+
+	return new_data;
+}
+
 struct node *merge_nodes(struct node *old_node, struct node *new_node)
 {
 	struct property *new_prop, *old_prop;
 	struct node *new_child, *old_child;
+	bool prev_value_used = false;
+	struct marker *marker;
 	struct label *l;
 
 	old_node->deleted = 0;
@@ -172,10 +202,26 @@ struct node *merge_nodes(struct node *old_node, struct node *new_node)
 				for_each_label_withdel(new_prop->labels, l)
 					add_label(&old_prop->labels, l->label);
 
+				marker = new_prop->val.markers;
+				for_each_marker_of_type(marker, PREV_VALUE) {
+					new_prop->val = data_insert_old_value(
+						new_prop->val, marker,
+						old_prop->val);
+					prev_value_used = true;
+				}
+
 				old_prop->val = new_prop->val;
 				old_prop->deleted = 0;
-				free(old_prop->srcpos);
-				old_prop->srcpos = new_prop->srcpos;
+
+				if (prev_value_used) {
+					old_prop->srcpos =
+						srcpos_extend(old_prop->srcpos,
+							      new_prop->srcpos);
+				} else {
+					srcpos_free(old_prop->srcpos);
+					old_prop->srcpos = new_prop->srcpos;
+				}
+
 				free(new_prop);
 				new_prop = NULL;
 				break;

-- 
2.48.1

