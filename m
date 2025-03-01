Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCAC41C5D67
	for <devicetree-compiler@vger.kernel.org>; Sat,  1 Mar 2025 13:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740835570; cv=none; b=i4yatsCz5ibA8FP/3jagJh0RfGQZhyXTpmEprOUqdlyVRcItBdSywC4eQ30xb2A67hgWO1CZFAx7MobMBab231hbBhPe7Hl08OuVihWq1ByQ6nS35uqLxG94IrKfzB8GGWKGVgtUSXR8+rIKH5dvsoIWOr0iD+gZi+/CgO00OY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740835570; c=relaxed/simple;
	bh=yrm0+goN35EIKqaMEzQNAyxa/Kp/Pmma42CxySCu07w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tbjNx3M88Q+q7H9EkGPyEqD+0Z2IiwzMFh4byix9sw5ec/+3jjH8oqwatvs3GTcXpe8G8uZND1qr1uEKf7fXAM3ygzGsG/nFk90WX1g5QVe9IB75DSxqS0yR6hWu+Ojqqt3T4UEF1m5qC/E85qYqvv3rb3hABRyTSyu6mJcV3jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=HK0Up4wB; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="HK0Up4wB"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2235c5818a3so13670575ad.1
        for <devicetree-compiler@vger.kernel.org>; Sat, 01 Mar 2025 05:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1740835566; x=1741440366; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W8pI2KsJ1DSl0y7hXjZn0QKUfIbJ0kkbHnCOhP6DfHk=;
        b=HK0Up4wBmoXNudSjp6/8ASadMhyA42c8c6+GEDqSelL3LrZ7LXLztLZKQF+NWa4ZeF
         JdUGPB8HR6b2a1h7RiwBeJwrQ5BtoxqlrsV2t8nD7gtReDLIEiFLWJn2aUV0LLTAS2RR
         aHpnQA1f1LmU1z4sk+Km6VXlfk6mshLJ7vnYaw9FPKwAdhO8Thtc8hSCRNCWciEajYGO
         R1W0MTKzlmxGjze8wPdMFvgx9jAFL2if7F42moa+AQmlRFL+257alB1LWO1XStoFVZvi
         R5LlX28j8QQ/nyQhu1EEk+2CQ00awmV9eJ2FhIMyo6LkCnXgad9kR/neBNI8FyuzCWCi
         kNxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740835566; x=1741440366;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W8pI2KsJ1DSl0y7hXjZn0QKUfIbJ0kkbHnCOhP6DfHk=;
        b=PrLKOtLBRVVDWniFh9lkJKL/nGEKPDb8MtKH8sJ0a97hVTIUdMVEQCrxtegd941qHq
         9/UpigwXnjosNTjAA3tzyVB2MX1O1ln/QQOb9HpkKsiW9tLAUgjqMhOvoRODBd2P12+U
         ZwVNawRsi/ZWI2me4657PZ7vF7XSL6M+Sp1TqQTp2Tba+/jcbbIbzHi8yi6Q6ZiYP5uo
         BpEnWRiYhWTQqvo8JBZRFyKXPXPUOyGrKno2HPOg7qBp3tBpQZEIUKB37CRY3mvH4b/W
         KVTJsTOTecHLreNVmX5XGOFl9b0Ojvb7sl982jNUenZqyYB+tlvMwL29vqUwDRaeBWIe
         ld4g==
X-Gm-Message-State: AOJu0YzF3ddUk6o0AW2m96EEnGA5uJQXB4vsQzFGNGcKsCzN/aqTxiGl
	+1vEha1VwCElVl6hzS/z8deXM3buXaaJ9N1mBz1EGCoidIusYOGu16fMmroekw==
X-Gm-Gg: ASbGnctta27pAFIegL9K0lbPpmPlnoUBMKvl0KexvDyuBxNslDGDEyMa7pMlbZBy/z9
	3XFnQFpKAKOCt/XhS4WLSuM1OZtI4fqkdsbLT9hnJ7YBLBuch2q63EHLEcfkI+he5LpdmTp+qr1
	tzIU9GxPOZYzBX5SugYe2dKk6x7TbPPBq3evarMHczCu0D0FEUe32CfJFSTP6c88rqeJNVIfJ06
	pnF1F0KOw7asXmlyEYXY3Zp6wJv43RYOpPs5aDx5K1kjK8Adztp4cWam9myWWf2zcvmk/nMYXq9
	qJ+U2Oyc9+OyK9rnFmPSVLwoKWwjVmkTs5FDyTPaAVhPIAkHyLUA
X-Google-Smtp-Source: AGHT+IFrd1WicC60eZeADezQsZSUDVWWBk4KX49Ux4fBLqI8o/RdF57hqRIvO+XUilMDRkip+90MqA==
X-Received: by 2002:a05:6a00:1395:b0:736:34a2:8a18 with SMTP id d2e1a72fcca58-73634a28a41mr4492987b3a.24.1740835566117;
        Sat, 01 Mar 2025 05:26:06 -0800 (PST)
Received: from [172.16.119.211] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7363cd5c39bsm764618b3a.174.2025.03.01.05.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 05:26:05 -0800 (PST)
From: Ayush Singh <ayush@beagleboard.org>
Date: Sat, 01 Mar 2025 18:55:03 +0530
Subject: [PATCH 2/3] dtc: Add /./
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250301-previous-value-v1-2-71d612eb0ea9@beagleboard.org>
References: <20250301-previous-value-v1-0-71d612eb0ea9@beagleboard.org>
In-Reply-To: <20250301-previous-value-v1-0-71d612eb0ea9@beagleboard.org>
To: David Gibson <david@gibson.dropbear.id.au>, 
 Andreas Gnau <andreas.gnau@iopsys.eu>, d-gole@ti.com, 
 lorforlinux@beagleboard.org, jkridner@beagleboard.org, 
 robertcnelson@beagleboard.org, Andrew Davis <afd@ti.com>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Simon Glass <sjg@chromium.org>
Cc: devicetree-compiler@vger.kernel.org, 
 Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3863; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=yrm0+goN35EIKqaMEzQNAyxa/Kp/Pmma42CxySCu07w=;
 b=owEBbQKS/ZANAwAIAQXO9ceJ5Vp0AcsmYgBnwwrevUBqTYlRno5NrkLSMIWysWsdNDp59PQGt
 lACnAOFZOyJAjMEAAEIAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCZ8MK3gAKCRAFzvXHieVa
 dClTEADR/l/lJ58jMMxtw3+itfTg3T989T5MbTudEOB7FXj4hdLRQQw2Yb+tTLqQIaKNdiBD1W9
 Rcirp2WYtp7gRgpx9B5wLMlris+K5irgl2AWqSOTk/RUTizhhEXxS2D+zMsOWaMXCf8UkCsWUda
 CkNse/CNER1a7K3ur/VDPoR11IEDDPiKfeMpP0D9Sm0qHpgIUv4UD/GKDdgfsTuL/QMShq0OEWX
 IRS9X+JEG6WU5ZBFwnbgKCWjwRCkchS1VEJeKvO/wVSsbg6naL3ZAVCcDsyV7miLF1TB0w9i/pl
 XnscMk6yhGI6tPGLt+9ebDfBICSyjtLhi9D8wt6A7VNyGgd89wVkAx3JtKqSXduOx16FfwKVXqh
 mzndHrvQKCnAwhYGkawWOZQWA0M5vflKrcI9xjnrN3QqtSREtdcrcFmQWgPi/1VT6bbGIf93NIm
 2CIYnJ8XaBVhv69+0hyNh8MgJNQk8ba0n6DnIMXiRZBDEhK7jKmEIyWXrnilcI2MhS0XW69dJ7S
 qSx/FNl4u+xIcK3SGPhlpDbxEQGpuoc0K5nJG9ivPUHB+r8WXibGjmKnK6DPXtFM9218wtZdFfj
 Qa9kRy33kUQTltNZbvZwJwXcajZ+SK1YzqgHjxzAUHTF3wNNnVfbRVk+RoPyVqDazI49WI396X1
 aciQXgSlGiLMCew==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

Allow construction new values for a property using old property values.
Can be used to append, pre-append, duplicate, etc.

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
 dtc-lexer.l  |  5 +++++
 dtc-parser.y |  5 +++++
 dtc.h        |  1 +
 livetree.c   | 44 ++++++++++++++++++++++++++++++++++++++++++--
 4 files changed, 53 insertions(+), 2 deletions(-)

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
index 93c77d95a320ec05aa355e12920cef9e1c91c26a..89e15c39e9eadb87cf8376fe167a4d9c6002031a 100644
--- a/livetree.c
+++ b/livetree.c
@@ -139,10 +139,34 @@ struct node *reference_node(struct node *node)
 	return node;
 }
 
+static struct data data_insert_old_value(struct data d, struct marker *m,
+					 const struct data *old)
+{
+	unsigned int offset = m->offset;
+	struct marker *next = m->next;
+	struct marker *marker = m;
+	struct data new_data;
+
+	new_data = data_insert_at_marker(d, marker, old->val, old->len);
+
+	/* Copy all markers from old value */
+	marker = old->markers;
+	for_each_marker(marker) {
+		m->next = alloc_marker(marker->offset + offset, marker->type,
+				       marker->ref);
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
@@ -172,10 +196,26 @@ struct node *merge_nodes(struct node *old_node, struct node *new_node)
 				for_each_label_withdel(new_prop->labels, l)
 					add_label(&old_prop->labels, l->label);
 
+				marker = new_prop->val.markers;
+				for_each_marker_of_type(marker, PREV_VALUE) {
+					new_prop->val = data_insert_old_value(
+						new_prop->val, marker,
+						&old_prop->val);
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
+					free(old_prop->srcpos);
+					old_prop->srcpos = new_prop->srcpos;
+				}
+
 				free(new_prop);
 				new_prop = NULL;
 				break;

-- 
2.48.1

