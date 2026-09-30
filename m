Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30016515978;
	Wed, 30 Sep 2026 16:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790786840; cv=none; b=QRgvibQL9Ug2LhhlwXfLuc7ejl/EbuX50z5mmEOUNrUrzaDO2xSpy2AkdaaZbHNTATDz32CiikNtTqKv1qLahCQK3Gsx9Rn0QyVjNH90HWf3vGaft1Hfp+jiOh8351/1TbT18yulo7tPTg+ardn0f5su8jrxi6RX3Mv9csxhsEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790786840; c=relaxed/simple;
	bh=mkW6/8LCc/Izgi2Dw5pCkU6CNJhvmnNMLYgJp8vBy/E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lvz3ZOXw6JidrcK81ZO5soIGbNR2gNQx/EGYaX0IwzBmVJSK1h4+blFJyVcipKP2qNX4cNUTrRJ4FA8AvJ5GWGNA+aGMBtBaGRijNKOa3h1tDqsr+E0k6KaW/uza2LDqaQSCO2/xW/NJNc3uL/JgbAso93E+HpqToO3lb9XZbDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Uxlpkpaj; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Uxlpkpaj"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 44C1F4E40DA3;
	Wed, 30 Sep 2026 16:47:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F38D660749;
	Wed, 30 Sep 2026 16:47:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 32A9B103298C9;
	Wed, 30 Sep 2026 18:47:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790786832; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=OzQzY1R+QY2s6NU7xiciX3MK78mpVBEyGls/yLx1+JE=;
	b=UxlpkpajxqqeCW2rtBavdyCRkxfJqRWbBcCtfbsmcklaFKE8t4tyOp+ccRkIFKWB4wkreS
	mESz8EpfZXnp61j2yZ5OVSyKGgP/69Mt+ACFmU01sEJXK7puailttkeAfhLoUeIsSkU3zu
	ycW7nU8ItO49XoiBzsKHoJslikQpOdCPswvDNYLeGqGfi9fbEX7nHCCcREepOcy+exUVmw
	OSlG7kVB6Iztr4ZXXlOxla8Ae2nSracsILu8lqNZ88gz0uiyrnq3b4he1MYULiNwRWHaFt
	QeTzVd+kfc7YEZwLwAUqoCpODM5qOFgsvZFqdQOIft+XYmFWAWNXq6hxOUbKsg==
Date: Wed, 30 Sep 2026 18:47:08 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, David Lechner <dlechner@baylibre.com>,
 Ayush Singh <ayush@beagleboard.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, devicetree-compiler@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree-spec@vger.kernel.org, Hui Pu <hui.pu@gehealthcare.com>, Ian Ray
 <ian.ray@gehealthcare.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Frank Li
 <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 09/15] libfdt: Handle unknown tags in fdt_next_tag()
Message-ID: <20260930183949.3f1b2fd2@bootlin.com>
In-Reply-To: <aq4Tg0cAD8z6IL9Q@gractus.seuss>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
	<20260826083146.304291-10-herve.codina@bootlin.com>
	<aqpc9HZ2T74Q2lYs@gractus.seuss>
	<20260917103410.1fcfe0f1@bootlin.com>
	<aqu0c3qMJOLoD0Ho@gractus.seuss>
	<20260917192814.70cbecbb@bootlin.com>
	<aq4Tg0cAD8z6IL9Q@gractus.seuss>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi David,

On Sat, 19 Sep 2026 14:46:05 +1000
David Gibson <david@gibson.dropbear.id.au> wrote:

...

> 
> > Upper layer using fdt_next_tag() should not handle this tag skipping the
> > general case and let fdt_next_tag() do this job.
> > 
> > Got the feeling that we are going to add complexity at upper layer to handle
> > a feature that should be handled at low level.
> >   
> > >   
> > > > Ok, we can have a wrapper on top of
> > > > fdt_next_tag() to skip unknown tags.
> > > > 
> > > > fdt_next_tag() is a low level function but the rule related to skipping
> > > > unknown tags is also a low level rule.
> > > > 
> > > > We have to choose:
> > > > a) fdt_next_tag() as I proposed
> > > >    Of course ok for me
> > > > 
> > > > b) fdt_next_tag() returns all tags -> Full handling at caller side
> > > >    Ok, we can go in that direction but it will bring quite a lot of
> > > >    code duplication.    
> > > 
> > > I'm not sure it's that bad, since fdt_next_tag() loops will typically
> > > already have a 'default' case for irrelevant tags, which will
> > > generally be handled the same as unknown tags.  
> > 
> > Well as we did for "offset 0 vs real root node offset", I think the best way
> > to known if it's bad or not is to try.  
> 
> Agreed.
> 
> > I will not have time this week to propose something and I have a training
> > next week.
> > 
> > If you're ok for a try, I will do it but not as quickly as I did for the
> > "offset 0 vs real root node offset" topic.
> >   

I did my homework and I think I was wrong. fdt_next_tag() can return all tags
without adding too much complexity in current code.

Here is the diff to consider that fully replaces this current patch.

You can note that I've added the FDT_TAG_IS_SKIPPABLE() macro. This macro
should be added in a previous commit introducing structured tag (or skippable
if renamed). According to discussion we've already had related to "structure"
tag format, the FDT_TAG_IS_SKIPPABLE() macro content will not be that one but
you've got the idea of its usage in the diff.

--- 8< ---
diff --git a/libfdt/fdt.c b/libfdt/fdt.c
index eb803e8a..e426414b 100644
--- a/libfdt/fdt.c
+++ b/libfdt/fdt.c
@@ -218,7 +218,37 @@ uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
 		break;
 
 	default:
-		return FDT_END;
+		if (!(tag & FDT_TAG_STRUCTURED) || !(tag & FDT_TAG_SKIP_SAFE))
+			return FDT_END;
+
+		switch (tag & FDT_TAG_DATA_MASK) {
+		case FDT_TAG_DATA_NONE:
+			break;
+		case FDT_TAG_DATA_1CELL:
+			offset += FDT_CELLSIZE;
+			break;
+		case FDT_TAG_DATA_2CELLS:
+			offset += 2 * FDT_CELLSIZE;
+			break;
+		case FDT_TAG_DATA_VARLEN:
+			/* Get the length */
+			lenp = fdt_offset_ptr(fdt, offset, sizeof(*lenp));
+			if (!can_assume(VALID_DTB) && !lenp)
+				return FDT_END; /* premature end */
+			len = fdt32_to_cpu(*lenp);
+			/*
+			 * Skip the cell encoding the length and the
+			 * following length bytes
+			 */
+			len += sizeof(*lenp);
+			sum = len + offset;
+			if (!can_assume(VALID_DTB) &&
+			    (sum >= INT_MAX || sum < (uint32_t) offset))
+				return FDT_END; /* premature end */
+
+			offset += len;
+			break;
+		}
 	}
 
 	if (!fdt_offset_ptr(fdt, startoffset, offset - startoffset))
@@ -303,6 +333,7 @@ int fdt_next_node(const void *fdt, int offset, int *depth)
 		switch (tag) {
 		case FDT_PROP:
 		case FDT_NOP:
+		default: /* All Skippable tags */
 			break;
 
 		case FDT_BEGIN_NODE:
diff --git a/libfdt/fdt.h b/libfdt/fdt.h
index f41a355f..55138261 100644
--- a/libfdt/fdt.h
+++ b/libfdt/fdt.h
@@ -73,6 +73,8 @@ struct fdt_property {
 #define FDT_TAG_CAN_SKIP(tag_data, tag_id) \
 		(FDT_TAG_STRUCTURED | FDT_TAG_SKIP_SAFE | tag_data | tag_id)
 
+#define FDT_TAG_IS_SKIPPABLE(_tag) (((_tag) & (FDT_TAG_STRUCTURED | FDT_TAG_SKIP_SAFE)) == (FDT_TAG_STRUCTURED | FDT_TAG_SKIP_SAFE))
+
 /* Tests reserved tags */
 #define FDT_TEST_NONE_CAN_SKIP		FDT_TAG_CAN_SKIP(FDT_TAG_DATA_NONE, 0)
 #define FDT_TEST_1CELL_CAN_SKIP		FDT_TAG_CAN_SKIP(FDT_TAG_DATA_1CELL, 0)
diff --git a/libfdt/fdt_check.c b/libfdt/fdt_check.c
index 2fd5b61d..8bd9b252 100644
--- a/libfdt/fdt_check.c
+++ b/libfdt/fdt_check.c
@@ -45,7 +45,8 @@ int fdt_check_full(const void *fdt, size_t bufsize)
 			return nextoffset;
 
 		/* If we see two root nodes, something is wrong */
-		if (expect_end && tag != FDT_END && tag != FDT_NOP)
+		if (expect_end && tag != FDT_END && tag != FDT_NOP &&
+			!FDT_TAG_IS_SKIPPABLE(tag))
 			return -FDT_ERR_BADSTRUCTURE;
 
 		switch (tag) {
@@ -92,7 +93,8 @@ int fdt_check_full(const void *fdt, size_t bufsize)
 			break;
 
 		default:
-			return -FDT_ERR_INTERNAL;
+			/* Skippable tags -> Skip them */
+			break;
 		}
 	}
 }
diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
index 856c62f1..3cc0435c 100644
--- a/libfdt/fdt_ro.c
+++ b/libfdt/fdt_ro.c
@@ -219,7 +219,7 @@ static int nextprop_(const void *fdt, int offset)
 			return offset;
 		}
 		offset = nextoffset;
-	} while (tag == FDT_NOP);
+	} while (tag == FDT_NOP || FDT_TAG_IS_SKIPPABLE(tag));
 
 	return -FDT_ERR_NOTFOUND;
 }
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 8fc23cb7..225c22f8 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -577,11 +577,12 @@ libfdt_tests () {
     run_test dtbs_equal_ordered cell-overflow.test.dtb cell-overflow-results.test.dtb
 
     # check full tests
-    for good in test_tree1.dtb; do
+    for good in test_tree1.dtb unknown_tags_can_skip.dtb; do
 	run_test check_full $good
     done
     for bad in truncated_property.dtb truncated_string.dtb \
-		truncated_memrsv.dtb two_roots.dtb named_root.dtb; do
+		truncated_memrsv.dtb two_roots.dtb named_root.dtb \
+		unknown_tags_no_skip.dtb; do
 	run_test check_full -n $bad
     done
 }
@@ -962,6 +963,10 @@ fdtget_tests () {
     run_fdtget_test "<the dead silence>" -tx \
 	-d "<the dead silence>" $dtb /randomnode doctor-who
     run_fdtget_test "<blink>" -tx -d "<blink>" $dtb /memory doctor-who
+
+    # test with unknown tags involved
+    run_fdtget_test "25601 25602" unknown_tags_can_skip.dtb /subnode1 prop-int
+    run_wrap_error_test $DTGET unknown_tags_no_skip.dtb /subnode1 prop-int
 }
 
 fdtput_tests () {
--- 8< ---

Also I've modified tests/dtbs_equal_ordered.c but I am not sure that the
modification I did is a modification you will accept.

We could just ignore skippable tags but I choose to test data when such an
skippable tag is encoutered.

This leads to the following modification:
--- 8< ---
--- a/tests/dtbs_equal_ordered.c
+++ b/tests/dtbs_equal_ordered.c
@@ -71,6 +71,7 @@ static void compare_structure(const void *fdt1, const void *fdt2)
 	int err;
 	const struct fdt_property *prop1, *prop2;
 	int len1, len2;
+	const void *raw1, *raw2;
 
 	while (1) {
 		do {
@@ -102,6 +103,9 @@ static void compare_structure(const void *fdt1, const void *fdt2)
 				     name1, name2, offset1, offset2);
 			break;
 
+		case FDT_END_NODE:
+			break;
+
 		case FDT_PROP:
 			prop1 = fdt_offset_ptr(fdt1, offset1, sizeof(*prop1));
 			if (!prop1)
@@ -128,6 +132,36 @@ static void compare_structure(const void *fdt1, const void *fdt2)
 
 		case FDT_END:
 			return;
+
+		default:
+			if (!FDT_TAG_IS_SKIPPABLE(tag1))
+				FAIL("Cannot check tag data at (%d, %d)",
+					offset1, offset2);
+
+			/*
+			 * Even if we don't known the meaning of data,
+			 * we can check that raw data are the same.
+			 */
+			len1 = nextoffset1 - offset1;
+			len2 = nextoffset2 - offset2;
+
+			if (len1 != len2) {
+				MISMATCH("tag data length mismatch at (%d, %d)",
+					offset1, offset2);
+			}
+
+			raw1 = fdt_offset_ptr(fdt1, offset1, len1);
+			if (!raw1)
+				FAIL("Could get fdt1 raw buffer at %d", offset1);
+
+			raw2 = fdt_offset_ptr(fdt2, offset2, len2);
+			if (!raw1)
+				FAIL("Could get fdt1 raw buffer at %d", offset2);
+
+			if (memcmp(raw1, raw2, len1) != 0)
+				MISMATCH("Tag data value mismatch at (%d, %d)",
+					 offset1, offset2);
+			break;
 		}
 	}
 }
--- 8< ---

With that done, my conclusion is: Yes we can return all tags in fdt_next_tag().
I think you will agree this conclusion.

For dtbs_equal_ordered.c, should we compare skippable tags and related data as
I did (diff above) or should we just skip them? what is your opinion?

For the next patch ("libfdt: Handle unknown tags on dtb modifications")
returning all tags from fdt_next_tag() has also some impacts but nothing more
complex than modification provided here. I can provide the full diff if you
want. Let me know.

Best regards,
Hervé
