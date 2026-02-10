Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212113A1E63;
	Tue, 10 Feb 2026 17:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770744882; cv=none; b=tvNbG8awisOrQGqulVRKiFhTlejf07UNeDVFrZqSEye8mhN5zZaZChCttMo4RnzOoF3h0Q1O80tP5dchrrws6vzOuYiNic+xjw8uJHJEzOC815UorXlLpFeBfNAv5Vy4uPxzUF+2GyKMAYCwaKhVPUBZ2UxJ8nQ+vNjSmIz57ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770744882; c=relaxed/simple;
	bh=BUK2NieV3t+PRz1JGkcE3kPYIyTQYMide+st0mYdSB4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g06bzeIKQ8u7bgNbQhMLiuvUUuCedT2Si+fP/G/4DzFhIdxtcQ85FwWrDO6FoZIlG2gmjrvzeWrLTfE7kvMSuIk7ncYXsmSujdQ0rgsEEQ0Qnwhtye/spCk+DEoWz0Ewgv2cXe5/5jXEhf0uCRSaMy2RVlPxq+Iylk5PTqQJKEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=24vaG7TL; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="24vaG7TL"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 38298C8F450;
	Tue, 10 Feb 2026 17:34:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CC622606BD;
	Tue, 10 Feb 2026 17:34:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C56A710B92227;
	Tue, 10 Feb 2026 18:34:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770744877; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=ykwVwiDzTEMjCwJf+cPIkHgzhvZz+yEanxd5gh8w6+w=;
	b=24vaG7TLLfBFX9aGf389bG13gCJoebnmvbTPEbpRZyJQ3fZ08WlEThd/0EQGPk9BhCSUfh
	mc0+tlxbPhxUlovC59O6RPbtn8Nb+UqFazqsjR71cRJ+XnovrJ6xuM1UhBGVW2afTjGvMa
	Fn7ov9scfVYrUTBsi+2jl9EWrBuen9Y193YXVPLMSAuWo/gz9WeQ/yQ61Zt5AyxlXRCXJk
	+wEvi0iQ755fCHu563QXBb4QMpSZfqChF6tQ8cDmvP0zW4iJiLR7bzVujnz2GHfncdhI74
	dqxzbv94/UTncOfVATrf2ZIo7ngy5Mq1hKtOIkoPyDAjO8nbr2zEbmFmCNn0Wg==
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Ayush Singh <ayush@beagleboard.org>,
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
Subject: [RFC PATCH 12/15] libfdt: Handle unknown tags in fdt_get_next()
Date: Tue, 10 Feb 2026 18:33:40 +0100
Message-ID: <20260210173349.636766-13-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260210173349.636766-1-herve.codina@bootlin.com>
References: <20260210173349.636766-1-herve.codina@bootlin.com>
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

libfdt uses fdt_get_next() to get a tag.

Filtering out tags that should be ignored in fdt_get_next() allows to
have the filtering done globally and allows, in future release, to have
a central place to add new known tags that should not be filtered out.

An already known tag exists with the meaning of "just ignore". This tag
is FDT_NOP. fdt_get_next() callers already handle the FDT_NOP tag.

Avoid unneeded modification at callers side and use a fake FDT_NOP tag
when an unknown tag that should be ignored is encountered.

Add also fdt_get_next_() internal function for callers who need to know
if the FDT_NOP tag returned is a real FDT_NOP or a fake FDT_NOP due to
an unknown tag.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 libfdt/fdt.c             | 75 ++++++++++++++++++++++++++++++++++++++--
 libfdt/libfdt_internal.h |  3 ++
 tests/run_tests.sh       |  9 +++--
 3 files changed, 83 insertions(+), 4 deletions(-)

diff --git a/libfdt/fdt.c b/libfdt/fdt.c
index ff2fa6c..790cbbd 100644
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
+		case FDT_TAG_DATA_LNG:
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
 
+static bool fdt_is_unknown_tag(uint32_t tag)
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
+	if (fdt_is_unknown_tag(tag)) {
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
index 4c15264..c1ae306 100644
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
index 98fa4f4..690a141 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -576,11 +576,12 @@ libfdt_tests () {
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
@@ -961,6 +962,10 @@ fdtget_tests () {
     run_fdtget_test "<the dead silence>" -tx \
 	-d "<the dead silence>" $dtb /randomnode doctor-who
     run_fdtget_test "<blink>" -tx -d "<blink>" $dtb /memory doctor-who
+
+    # test with unknown tags involved
+    run_fdtget_test "1 2" unknown_tags_can_skip.dtb /subnode1 prop-int
+    run_wrap_error_test $DTGET unknown_tags_no_skip.dtb /subnode1 prop-int
 }
 
 fdtput_tests () {
-- 
2.52.0

