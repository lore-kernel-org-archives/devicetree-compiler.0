Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE542135A0
	for <devicetree-compiler@vger.kernel.org>; Thu,  5 Jun 2025 10:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749120561; cv=none; b=TYOwdkxzlXwBYwwUPmA40r2f1/2L2EmeTtwQE24yRlsy0aU0igSDyEXO5SRCN3WfoilbHtVxL6gO/uy56ZlVk1U7EQkkt8n5ggWhVyoyAA52pC7bkiZgJTzYhQHiMk3msySN42O9uVQGUAm7JsR06ilR3rpRCObsffjYhry1WuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749120561; c=relaxed/simple;
	bh=DfxHRfwhTpXXFdzutf32/QHKeygGr/uzaG/TRBLiMRU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UuLWTKI3yXc6h3G7teZNQS4PlW26WvH0tQjcnu14oD+A28jo6sY3SpuD7Z2ewzj62AgCMep8qDVFaNeoXVHwgcpm5h57Afnfps787jm7zeFHVdMQLlm5d3K35iMj/zln5dsQFl+H+q1qY7q8BBAX4x0zq67HQFKJs+pU6WXY7UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=PEsRzuvx; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="PEsRzuvx"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7426c44e014so826240b3a.3
        for <devicetree-compiler@vger.kernel.org>; Thu, 05 Jun 2025 03:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1749120559; x=1749725359; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H3MioLMQoNTMprRB3UHhKeQkgGxYeI6koKOIT2iOkh0=;
        b=PEsRzuvxkEBkC9GrVi31SR2DnfrCr/kUwLr+m2M991s/IR+u1FvGyRdNsqcvw9/btw
         +R4fjRZmumVDN7Rrccx0Bul1i+mgOae2GHEmGmg2D2lpen30TxMQ2k7mOOt5E8FpUJJB
         oZm6fgSP1cFxFjPvm5WsUrHyD5AdfWMhqN8XEw0OrWaYASg2f2X4Gtml2YbgmHMYbkrM
         FJFRY1nZms8gpkzKNp5z3sEkF5wZ8dqxIm166LY4EtZShuWxPe9ozdh8KA6bVPk8KM3m
         qOGDsiqXJrTakro80J4OQks32wC3Q2GZIkwDcNAvx3vGn9RQOpJY9SwG2RSNSLy5YKht
         Rkbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749120559; x=1749725359;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H3MioLMQoNTMprRB3UHhKeQkgGxYeI6koKOIT2iOkh0=;
        b=SEJg8xvPj5g9AF88/rkJ6QndDi3aZB3HxEpLNENSHoDqVLHEAIzoPSTiTB0wJ4+4Ho
         CmRTFk+vMISPweNaH2t6ZbRn+DoEP9VGh+g2Si8wPXQ/DY5QMgLIWjaCnrt7aGZf1TE4
         6SM3V1qry6g06N+GZRyubpLv6FqbLOa4CdIeHoVzXUya048OZKWiSl6GZGJWigJ9xL/M
         8b1H5F2Ce+UyiKjrogGnO8QEznpqmp2qxDLAVRKL2W+svGv5/fXUyNACdroRWLM4cPfr
         CW9NdwvbnpWpgEbvkzg31mKmm1Kp7Q/dMHiFY0hXEN901il1GXS/VkEoQpButD5yVUAc
         SDlw==
X-Gm-Message-State: AOJu0Yz7zeIOU6b+xFeyHNi/Xdp40gepkkIriyFqngmOoQ66CNFw03bF
	SDzjkELfbU+gFEigWAzOtXifzVpIPGcxhWlXwlOEKX6FT4+sppsCJeKctH6DaHMUhA==
X-Gm-Gg: ASbGnctYAIex4/Xv8LMGYSH6p9jVPpneaEW1Vlq8CNmclmRtrI6zKYkkb7yva6mfFac
	wDgJRISLxUirMK8TTGzjIxtF9dmECtnKlzs5G3eHNrn7ctS+HvCJUX/oIO/aK8sDHEnqBql8CpM
	SleO5LFB0or374HhJlDSMS8ya45SKENFnvM5FdP6UB/9ODpIEcGi86+WZKr0YOvf0/N3J7LnQXG
	lzymlZ7vXsQntK5YzST2azu1fGL/OuGaPrWl9+DWc/KJniIABqYNTfAS3pQxaEblPVwSPCQDQ6A
	EYzuBZRozdwj/cAGavE7rA/r2q95jBtoPolijIY05r1gn9ekPbaioMCsiEO1JNjrlkkHK8HU
X-Google-Smtp-Source: AGHT+IEPDKF6kohSqmyOYrRzo2TjBI9wyrwfOpvVyNF68sadoYxIkMABl1KlwXHv/iZ88Gsja35MQQ==
X-Received: by 2002:a05:6a00:13a2:b0:736:5e28:cfba with SMTP id d2e1a72fcca58-7480d023dc6mr8123286b3a.18.1749120558737;
        Thu, 05 Jun 2025 03:49:18 -0700 (PDT)
Received: from [192.168.1.11] ([2401:4900:8899:bab8:9a99:8bde:e080:9339])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affd41edsm12997594b3a.146.2025.06.05.03.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 03:49:18 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
Date: Thu, 05 Jun 2025 16:18:08 +0530
Subject: [PATCH v3 3/4] dtc: Add /./
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-previous-value-v3-3-0983d0733a07@beagleboard.org>
References: <20250605-previous-value-v3-0-0983d0733a07@beagleboard.org>
In-Reply-To: <20250605-previous-value-v3-0-0983d0733a07@beagleboard.org>
To: David Gibson <david@gibson.dropbear.id.au>, 
 Andreas Gnau <andreas.gnau@iopsys.eu>, d-gole@ti.com, 
 lorforlinux@beagleboard.org, jkridner@beagleboard.org, 
 robertcnelson@beagleboard.org, Andrew Davis <afd@ti.com>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Simon Glass <sjg@chromium.org>
Cc: devicetree-compiler@vger.kernel.org, 
 Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4079; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=DfxHRfwhTpXXFdzutf32/QHKeygGr/uzaG/TRBLiMRU=;
 b=owEBbQKS/ZANAwAKAQXO9ceJ5Vp0AcsmYgBoQXYdIB7AAFJxKOO5ejwQjCQXmqUkqKEeYTcrb
 e7maIwepPOJAjMEAAEKAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCaEF2HQAKCRAFzvXHieVa
 dLoaD/9O8IjDK+0qU4Z6jw7Nt6Qgc+w+0YjDtx8KMpr6mtozfSO9arI/jnbNX1mkI+pkM8pnpUM
 BcgG129jDZKnSwKATVXwjMkFj6O1HbYhw+5R7JCoa94USb/YjUm67qSDBPr+mwEbgP2SOM19D2p
 unj+tKc/KICf0GqhqnePCkCugnbbuN6dAh/AqYu3UEc0y65EqIjZCH+h2ZRnm6HysxwdwpMMGR/
 w4W1jEeq9F5J3Rm2u4IOIfG79uxpA0mw2QejpuNCfZ4fhH8ojHvenp4gXR2zbYVZ3yyGSqvajtU
 EjdMutGUXErrbpklX49HFawogYjUR/p4bqGUy/QHhQI7gQJnBendE4vvvV+/o2E5xaUa5JfTYuR
 yzhnK87M7KrTo/+ownLX68kCzLXMLS7s94bOYEv1C2qtKKCKg06DWkH86dMbSNlCAtIQu5EsLU0
 toaqyy+DjoFOxnxCB2JZtS5/OM5kwIlStCmyPVBY/sUdCy6mLJav7mQjHHb8ifsc4ifkoh5rRu3
 bzSMZDriIZ5bCjVDUxgxuH9ggCts1iayQCkJbhaQNh8MkdP0JPlr7bulFwhKFzSc4USwzqCsfRP
 1gZda6AAju0nPiECYWoNitTtmIRe32lpBxhZdHYjGNUzQlMfILGT3AIdimMQ35Ukz2bUC5XDnOm
 SZDib3ID9ymWIig==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

Allow constructing new values for a property using old property values.
Can be used to append, pre-append, duplicate, etc.

In practice, it looks as follows:

/dts-v1/;

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

/ { /* temp/a.dts:3:3-6:3, temp/a.dts:8:3-11:3 */
	str-prop = "0", "1", "0"; /* temp/a.dts:4:5-4:20, temp/a.dts:9:5-9:30 */
	int-prop = <0x00>, <0x01>, <0x00>; /* temp/a.dts:5:5-5:20, temp/a.dts:10:5-10:30 */
}; /* temp/a.dts:3:3-6:3, temp/a.dts:8:3-11:3 */

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
 dtc-lexer.l  |  5 +++++
 dtc-parser.y |  5 +++++
 dtc.h        |  1 +
 livetree.c   | 23 +++++++++++++++++++++--
 4 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/dtc-lexer.l b/dtc-lexer.l
index de60a70b6bdbcb5ae4336ea4171ad6f645e91b36..7ad98b3c5d1fa24dda04731a64d18ecc6ec1e448 100644
--- a/dtc-lexer.l
+++ b/dtc-lexer.l
@@ -144,6 +144,11 @@ static void PRINTF(1, 2) lexical_error(const char *fmt, ...);
 			return DT_OMIT_NO_REF;
 		}
 
+<*>"/./" {
+			DPRINT("Keyword: /./\n");
+			return DT_PREV_VALUE;
+		}
+
 <*>{LABEL}:	{
 			DPRINT("Label: %s\n", yytext);
 			yylval.labelref = xstrdup(yytext);
diff --git a/dtc-parser.y b/dtc-parser.y
index 4d5eece526243460203157464e3cd75f781e50e7..0b7932d4172f30f1c45a9f521dc43a2fae1692b8 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -57,6 +57,7 @@ static bool is_ref_relative(const char *ref)
 %token DT_LSHIFT DT_RSHIFT DT_LE DT_GE DT_EQ DT_NE DT_AND DT_OR
 %token DT_BITS
 %token DT_DEL_PROP
+%token DT_PREV_VALUE
 %token DT_DEL_NODE
 %token DT_OMIT_NO_REF
 %token <propnodename> DT_PROPNODENAME
@@ -308,6 +309,10 @@ propdata:
 		{
 			$$ = data_merge($1, $2);
 		}
+        | propdataprefix DT_PREV_VALUE
+                {
+                        $$ = data_add_marker($1, PREV_VALUE, NULL);
+                }
 	| propdataprefix arrayprefix '>'
 		{
 			$$ = data_merge($1, $2.data);
diff --git a/dtc.h b/dtc.h
index 3a220b9afc99f92ea57d50d348eb0872bc779818..f9bdf1d117f8a70d168243129db8f8d940de8064 100644
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
index d51d05830b181476ddbab878ef8b556230b58e2b..11c40724c7a8c8b429230f211455f7bcbdc050ec 100644
--- a/livetree.c
+++ b/livetree.c
@@ -143,6 +143,7 @@ struct node *merge_nodes(struct node *old_node, struct node *new_node)
 {
 	struct property *new_prop, *old_prop;
 	struct node *new_child, *old_child;
+	struct marker *marker;
 	struct label *l;
 
 	old_node->deleted = 0;
@@ -154,6 +155,8 @@ struct node *merge_nodes(struct node *old_node, struct node *new_node)
 	/* Move properties from the new node to the old node.  If there
 	 * is a collision, replace the old value with the new */
 	while (new_node->proplist) {
+		bool prev_value_used = false;
+
 		/* Pop the property off the list */
 		new_prop = new_node->proplist;
 		new_node->proplist = new_prop->next;
@@ -172,10 +175,26 @@ struct node *merge_nodes(struct node *old_node, struct node *new_node)
 				for_each_label_withdel(new_prop->labels, l)
 					add_label(&old_prop->labels, l->label);
 
+				marker = new_prop->val.markers;
+				for_each_marker_of_type(marker, PREV_VALUE) {
+					new_prop->val = data_insert_data(
+						new_prop->val, marker,
+						old_prop->val);
+					prev_value_used = true;
+				}
+
 				old_prop->val = new_prop->val;
 				old_prop->deleted = 0;
-				srcpos_free(old_prop->srcpos);
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
2.49.0

