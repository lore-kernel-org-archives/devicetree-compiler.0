Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D283B71CE;
	Wed, 26 Aug 2026 08:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787733181; cv=none; b=Jvn/EcohLloC0g0T1jy7iAksaDRgsarIbnz/np5RMdw+ii8JJGJkJIAJU6xwlSMsNfdVrtiFeI+oE66bvyz0U96OS4ElM2s448VMCT8vzItQaPXdGD1Io9Yvo3g2opLKJcKJUsZ/ax1Wvj+pz0TIS8RAzm4oxSwm2Mcv7C/nY40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787733181; c=relaxed/simple;
	bh=ryj6qtC+rieClZ3/ur+Ak/VqTR1urmgK0jCffZjuyz8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZBQp3C2Z6CQeWsesrJQtMkGn+zPpnGdP++kKzliWoKMfIOnfomC0iLx2RyMQs4lHvUyR7RJvFaabEaL1BQLmP/aBVhkVfHsLKs+P4jb1Utr/gn+XsO2JlwDawV9NhBKg4zaGG1KaLcG//QtDg6JCNfpI7ydwPY/XrqtPjxh2gMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=boas6wea; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="boas6wea"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 92FBE1A1844;
	Wed, 26 Aug 2026 08:32:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 67BBA604EC;
	Wed, 26 Aug 2026 08:32:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D8C6811C7AC4A;
	Wed, 26 Aug 2026 10:32:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787733177; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=t87Xr7v6Qr55Y1xfzRrTbV4rvY3L3qyedBD8I8H65Hc=;
	b=boas6weaJXVkiMVNkq0z/TXWKJyq9tROa07RhEVafPtuejLCPiFrQffJLu1GA/74A7l1yq
	mrBagvnPKrZR6wMFnOy80kPzN48oCfkoNkkaTpXuiOc3QLH1NcMRI+JrhUZxp7BXmF4bew
	YK4StO4XvfdYzFeWWCXlX7tI3BBCP5FaroXvnxQo5oz/DtKHkAXWJX6KPq4ujgGdO2KrYS
	9twPPBqCcIN1tCfx8ZZcL16IV8aL2tzlguL+pUwtJiVWyrUpUSrMQT49WuoBrUgqJOfIED
	FDopYgfR97BDcphz+B9Ap8gozi2TV2eBQiEDRpGpMNucnwNCQEuxZFafaM/84A==
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
	Herve Codina <herve.codina@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v3 09/15] libfdt: Handle unknown tags in fdt_next_tag()
Date: Wed, 26 Aug 2026 10:31:40 +0200
Message-ID: <20260826083146.304291-10-herve.codina@bootlin.com>
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

The structured tag value definition introduced recently gives the
ability to ignore unknown tags without any error when they are read.

libfdt uses fdt_next_tag() to get a tag.

Filtering out tags that should be ignored in fdt_next_tag() allows to
have the filtering done globally and allows, in future releases, to have
a central place to add new known tags that should not be filtered out.

An already known tag exists with the meaning of "just ignore". This tag
is FDT_NOP. fdt_next_tag() callers already handle the FDT_NOP tag.

Avoid unneeded modification at callers side and use a fake FDT_NOP tag
when an unknown tag that should be ignored is encountered.

Add also fdt_next_tag_() internal function for callers who need to know
if the FDT_NOP tag returned is a real FDT_NOP or a fake FDT_NOP due to
an unknown tag.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 libfdt/fdt.c             | 75 ++++++++++++++++++++++++++++++++++++++--
 libfdt/libfdt_internal.h |  3 ++
 tests/run_tests.sh       |  9 +++--
 3 files changed, 83 insertions(+), 4 deletions(-)

diff --git a/libfdt/fdt.c b/libfdt/fdt.c
index eb803e8a..506e0dd3 100644
--- a/libfdt/fdt.c
+++ b/libfdt/fdt.c
@@ -167,7 +167,7 @@ const void *fdt_offset_ptr(const void *fdt, int offset, unsigned int len)
 	return fdt_offset_ptr_(fdt, offset);
 }
 
-uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
+static uint32_t fdt_next_tag_all(const void *fdt, int startoffset, int *nextoffset)
 {
 	const fdt32_t *tagp, *lenp;
 	uint32_t tag, len, sum;
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
@@ -228,6 +258,47 @@ uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
 	return tag;
 }
 
+static bool fdt_tag_is_unknown(uint32_t tag)
+{
+	switch (tag) {
+	case FDT_BEGIN_NODE:
+	case FDT_END_NODE:
+	case FDT_PROP:
+	case FDT_NOP:
+	case FDT_END:
+		return false;
+	default:
+		break;
+	}
+	return true;
+}
+
+uint32_t fdt_next_tag_(const void *fdt, int startoffset, int *nextoffset, bool *is_unknown)
+{
+	uint32_t tag;
+	bool unknown = false;
+
+	/* Retrieve next tag */
+	tag = fdt_next_tag_all(fdt, startoffset, nextoffset);
+	if (tag == FDT_END)
+		goto end;
+
+	if (fdt_tag_is_unknown(tag)) {
+		unknown = true;
+		/* Use a known tag that should be skipped by the caller */
+		tag = FDT_NOP;
+	}
+end:
+	if (is_unknown)
+		*is_unknown = unknown;
+	return tag;
+}
+
+uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
+{
+	return fdt_next_tag_(fdt, startoffset, nextoffset, NULL);
+}
+
 int fdt_check_node_offset_(const void *fdt, int offset)
 {
 	if (!can_assume(VALID_INPUT)
diff --git a/libfdt/libfdt_internal.h b/libfdt/libfdt_internal.h
index 0e103caf..f2e30ce8 100644
--- a/libfdt/libfdt_internal.h
+++ b/libfdt/libfdt_internal.h
@@ -20,6 +20,9 @@ int32_t fdt_ro_probe_(const void *fdt);
 		}							\
 	}
 
+uint32_t fdt_next_tag_(const void *fdt, int startoffset, int *nextoffset,
+		       bool *is_unknown);
+
 int fdt_check_node_offset_(const void *fdt, int offset);
 int fdt_check_prop_offset_(const void *fdt, int offset);
 
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
-- 
2.55.0

