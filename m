Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692272;
	b=aIPXocv7SMeJtwqET+2lohPYwLaF4xG27U74HR/Js1UjStpUQ1wRl9XJJEOwNr7Vr4ol
	 IUbplwMAIjniPsKYObZONsUxGBm1JvEUsk70YmcgqQJ62XYyTML0y9RzsltgedLqvwPEN
	 OIy/xe4KqoGgpcw2jSpljuZFZJhuUAyGeHW94M/2h7fqOzyip7zqCKgEjSRQcXEclDSQP
	 r7LbXR9Xn50DpKNooikrYnThttH0WXi4m5cPKq8kZKHwTaQojz+VIbTgGqZ2/T8z+6yDL
	 DN51z7xEXrRa+tBDMMNfePnFIF6qQwW8eXz+IsGuUUYvUwXVYb7iNVX77DsLFJmuqsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692272;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=DDcYOhcxhmy9toIO9KVNIg6nkSO7atBXYjzxAVl9omI=;
	b=SUQGQqycTCdCWyuMXiroHCBzQfgR0dkpZOzYFa3WNCRcWGKturlQnfBIGUQnbsKjnsuq
	 NfXN+BugSChRt9mImXyCbxcTEOcrPXePwGxRDdo4P0yc9lAfvZDwnjqRquyza75qN2pic
	 G8otIcVEp6Tat4Mx6FaBE8mOJW5dwW/CB+rK3MJLV7bfvP6NFoM1Ja5MSKsdXCYzMwTuc
	 8OVkYI7YMXV0l920eCLaqdsjCoSfQAwZWZovJClsWfPPe4Ob0zEhXpV5FTu1QOtNDJTeF
	 ZkHXM3boyCQ4yJFKEBTsLCdxMpnz2/A2lUn6vTawwqbc6sIXzswGMVrMcNLZpXSE7XQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=u2vpQfpu;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D20606A692
	for <devicetree-compiler@vger.kernel.org>; Thu, 26 Nov 2026 11:24:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11D20606A692
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=u2vpQfpu
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id EE8C2C2B9C9;
	Thu, 26 Nov 2026 11:24:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AA3B460237;
	Thu, 26 Nov 2026 11:24:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E758911E6B361;
	Thu, 26 Nov 2026 12:24:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795692269; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=DDcYOhcxhmy9toIO9KVNIg6nkSO7atBXYjzxAVl9omI=;
	b=u2vpQfpuI4E5vBKEvFZy6qhd9MYz+aYGQnQXJKkzp9QWqP+uPLjtdX3i2a09G7TXgl9D9K
	HGpv+YsDDWLFMk7Wrx88D2+u5Lp5L6M6O61jYXO0fwGcxvHs9MzrxdD55aJoYX4XmvtvZt
	9Vo8NKJzRaOZh0LbkuPaHs8V6Nh39T2r0ZXiifnnxmq3ctHFBoYeJX8OLqjrj1rjJwCSS9
	vF6SsS2zKsEwcu2d+0ktEQO4vwsUaaPi9b0wBXc0mbrSvdqFwaiqSuhFvL5sfse01ixPIn
	Wu0egWmga5LAQ4EX33uAHS1pMd914y+MezvjUq2jhD5l0ik2Vjkb4GnEPO3Jhw==
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Frank Li <Frank.Li@nxp.com>,
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
Subject: [PATCH v4 16/22] libfdt: Handle unknown tags in fdt_next_tag()
Date: Thu, 26 Nov 2026 12:22:33 +0100
Message-ID: <20261126112239.636284-17-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126112239.636284-1-herve.codina@bootlin.com>
References: <20261126112239.636284-1-herve.codina@bootlin.com>
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The structured tag value definition introduced recently gives the
ability to ignore unknown tags without any error when they are read.

libfdt uses the low-level function fdt_next_tag() to get a tag.

Make fdt_next_tag() return those unknown tags which can be skipped,
and update callers to skip them.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 libfdt/fdt.c               | 46 +++++++++++++++++++++++++++++++++++-
 libfdt/fdt_check.c         |  6 +++--
 libfdt/fdt_ro.c            |  2 +-
 tests/dtbs_equal_ordered.c | 48 +++++++++++++++++++++++++++++++++++---
 tests/run_tests.sh         | 36 +++++++++++++++++++++++++++-
 5 files changed, 130 insertions(+), 8 deletions(-)

diff --git a/libfdt/fdt.c b/libfdt/fdt.c
index a5ec7f95..44bf0e26 100644
--- a/libfdt/fdt.c
+++ b/libfdt/fdt.c
@@ -188,6 +188,37 @@ const void *fdt_offset_ptr(const void *fdt, int offset, unsigned int len)
 	return fdt_offset_ptr_limit_(fdt, fdt_struct_limit_(fdt), offset, len);
 }
 
+static int fdt_get_structured_tag_data(uint32_t tag, const void *fdt, int limit,
+				       int offset, uint32_t *data_len)
+{
+	int data_offset = offset;
+	uint32_t len = 0;
+	const fdt32_t *lenp;
+
+	len = FDT_TAG_DLEN_GET(tag);
+	if (len != FDT_TAG_DLEN_VARLEN) {
+		len *= sizeof(fdt32_t);
+	} else {
+		/* Get the length */
+		lenp = fdt_offset_ptr_limit_(fdt, limit, offset, sizeof(*lenp));
+		if (!can_assume(VALID_DTB) && !lenp)
+			return -FDT_ERR_BADSTRUCTURE;
+		len = fdt32_to_cpu(*lenp);
+
+		/* Skip the cell encoding the length */
+		data_offset += sizeof(*lenp);
+	}
+
+	if ((data_offset < 0) || (data_offset > limit)
+	    || (len > (uint32_t)(limit - data_offset)))
+		return -FDT_ERR_BADSTRUCTURE;
+
+	if (data_len)
+		*data_len = len;
+
+	return data_offset;
+}
+
 uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
 {
 	const fdt32_t *tagp, *lenp;
@@ -195,6 +226,7 @@ uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
 	int limit = fdt_struct_limit_(fdt);
 	int offset = startoffset;
 	const char *p, *nul;
+	int data_offset;
 
 	*nextoffset = -FDT_ERR_TRUNCATED;
 	tagp = fdt_offset_ptr_limit_(fdt, limit, offset, FDT_TAGSIZE);
@@ -242,7 +274,18 @@ uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
 		break;
 
 	default:
-		return FDT_END;
+		if (!FDT_TAG_IS_SKIPPABLE(tag))
+			return FDT_END;
+
+		/* Retrieve the data block */
+		data_offset = fdt_get_structured_tag_data(tag, fdt, limit,
+							  offset, &len);
+		if (data_offset < 0)
+			return FDT_END; /* premature end */
+
+		/* Skip the whole data bloc */
+		offset = data_offset + len;
+		break;
 	}
 
 	if (!fdt_offset_ptr_limit_(fdt, limit, startoffset,
@@ -326,6 +369,7 @@ int fdt_next_node(const void *fdt, int offset, int *depth)
 		switch (tag) {
 		case FDT_PROP:
 		case FDT_NOP:
+		default: /* All skippable tags */
 			break;
 
 		case FDT_BEGIN_NODE:
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
index 1a4b3aec..2cca6fd7 100644
--- a/libfdt/fdt_ro.c
+++ b/libfdt/fdt_ro.c
@@ -229,7 +229,7 @@ static int nextprop_(const void *fdt, int offset)
 			return offset;
 		}
 		offset = nextoffset;
-	} while (tag == FDT_NOP);
+	} while (tag == FDT_NOP || FDT_TAG_IS_SKIPPABLE(tag));
 
 	return -FDT_ERR_NOTFOUND;
 }
diff --git a/tests/dtbs_equal_ordered.c b/tests/dtbs_equal_ordered.c
index 488e08b8..d3502278 100644
--- a/tests/dtbs_equal_ordered.c
+++ b/tests/dtbs_equal_ordered.c
@@ -16,6 +16,7 @@
 #include "testdata.h"
 
 static int notequal; /* = 0 */
+static int ignore_skippable; /* = 0 */
 static int ignore_nop = 1;
 
 #define MISMATCH(fmt, ...)			\
@@ -72,16 +73,19 @@ static void compare_structure(const void *fdt1, const void *fdt2)
 	int err;
 	const struct fdt_property *prop1, *prop2;
 	int len1, len2;
+	const void *raw1, *raw2;
 
 	while (1) {
 		do {
 			offset1 = nextoffset1;
 			tag1 = fdt_next_tag(fdt1, offset1, &nextoffset1);
-		} while (ignore_nop && (tag1 == FDT_NOP));
+		} while ((ignore_nop && (tag1 == FDT_NOP)) ||
+			 (ignore_skippable && FDT_TAG_IS_SKIPPABLE(tag1)));
 		do {
 			offset2 = nextoffset2;
 			tag2 = fdt_next_tag(fdt2, offset2, &nextoffset2);
-		} while (ignore_nop && (tag2 == FDT_NOP));
+		} while ((ignore_nop && (tag2 == FDT_NOP)) ||
+			 (ignore_skippable && FDT_TAG_IS_SKIPPABLE(tag2)));
 
 		if (tag1 != tag2)
 			MISMATCH("Tag mismatch (%d != %d) at (%d, %d)",
@@ -103,6 +107,9 @@ static void compare_structure(const void *fdt1, const void *fdt2)
 				     name1, name2, offset1, offset2);
 			break;
 
+		case FDT_END_NODE:
+			break;
+
 		case FDT_PROP:
 			prop1 = fdt_offset_ptr(fdt1, offset1, sizeof(*prop1));
 			if (!prop1)
@@ -132,13 +139,46 @@ static void compare_structure(const void *fdt1, const void *fdt2)
 
 		case FDT_END:
 			return;
+
+		default:
+			if (!FDT_TAG_IS_SKIPPABLE(tag1))
+				FAIL("Cannot check tag data at (%d, %d)",
+					offset1, offset2);
+
+			if (ignore_skippable)
+				break;
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
+				FAIL("Couldn't get fdt1 raw buffer at %d", offset1);
+
+			raw2 = fdt_offset_ptr(fdt2, offset2, len2);
+			if (!raw2)
+				FAIL("Couldn't get fdt2 raw buffer at %d", offset2);
+
+			if (memcmp(raw1, raw2, len1) != 0)
+				MISMATCH("Tag data value mismatch at (%d, %d)",
+					 offset1, offset2);
+			break;
 		}
 	}
 }
 
 static void badargs(char **argv)
 {
-	CONFIG("Usage: %s [-n] --noskip-nop <dtb file> <dtb file>", argv[0]);
+	CONFIG("Usage: %s [-n] [-s] --noskip-nop <dtb file> <dtb file>", argv[0]);
 }
 
 int main(int argc, char *argv[])
@@ -156,6 +196,8 @@ int main(int argc, char *argv[])
 	while (argsleft > 2) {
 		if (streq(args[0], "-n"))
 			notequal = 1;
+		else if (streq(args[0], "-s"))
+			ignore_skippable = 1;
 		else if (streq(args[0], "--noskip-nop"))
 			ignore_nop = 0;
 		else
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 6472c86d..97f5a50e 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -471,6 +471,7 @@ ALL_LAYOUTS="mts mst tms tsm smt stm"
 libfdt_tests () {
     run_test root_offset 0 test_tree1.dtb
     run_test root_offset 12 root_offset_12.dtb
+    run_test root_offset 8 unknown_tags_can_skip.dtb
 
     tree1_tests test_tree1.dtb
 
@@ -616,13 +617,43 @@ libfdt_tests () {
     run_test dtbs_equal_ordered cell-overflow.test.dtb cell-overflow-results.test.dtb
 
     # check full tests
-    for good in test_tree1.dtb; do
+    for good in test_tree1.dtb unknown_tags_can_skip.dtb unknown_tags_removed.dtb; do
 	run_test check_full $good
     done
     for bad in truncated_property.dtb truncated_string.dtb \
 		truncated_memrsv.dtb two_roots.dtb named_root.dtb; do
 	run_test check_full -n $bad
     done
+
+    for n in "node1" "node2" "node3" "node4" "node5" "node6" "node7" "node8" "node9"; do
+        # node8 is a subnodes-only node, node9 is an empty node
+        if [ "$n" != "node8" ] && [ "$n" != "node9" ]; then
+            for p in "prop1" "prop2" "prop3"; do
+                run_test check_full unknown_tags_rw_${n}_${p}_modified_ab.dtb
+                run_test check_full unknown_tags_rw_${n}_${p}_modified_abcdefgh.dtb
+                run_test check_full unknown_tags_rw_${n}_${p}_modified_abcdefghi.dtb
+                run_test check_full unknown_tags_rw_${n}_${p}_modified_abcdefghij.dtb
+                run_test check_full unknown_tags_rw_${n}_${p}_modified_abcdefghijklmnop.dtb
+                run_test check_full unknown_tags_rw_${n}_${p}_removed.dtb
+
+                #run_test check_full unknown_tags_wip_${n}_${p}_modified_ab.dtb
+                #run_test check_full unknown_tags_wip_${n}_${p}_modified_abcdefgh.dtb
+                run_test check_full unknown_tags_wip_${n}_${p}_modified_abcdefghi.dtb
+                run_test check_full unknown_tags_wip_${n}_${p}_removed.dtb
+            done
+        fi
+
+        # node7 is a properties-only node, node9 is an empty node
+        if [ "$n" != "node7" ] && [ "$n" != "node9" ]; then
+            for sn in "subnode1" "subnode2" "subnode3"; do
+                run_test check_full unknown_tags_rw_${n}_${sn}_removed.dtb
+                run_test check_full unknown_tags_wip_${n}_${sn}_removed.dtb
+            done
+        fi
+
+        run_test check_full unknown_tags_rw_${n}_propnew_added.dtb
+        run_test check_full unknown_tags_rw_${n}_subnodenew_added.dtb
+    done
 }
 
 dtc_tests () {
@@ -1055,6 +1086,9 @@ fdtget_tests () {
     run_fdtget_test "<the dead silence>" -tx \
 	-d "<the dead silence>" $dtb /randomnode doctor-who
     run_fdtget_test "<blink>" -tx -d "<blink>" $dtb /memory doctor-who
+
+    # test with unknown tags involved
+    run_fdtget_test "123456789" unknown_tags_can_skip.dtb /node4 prop2
 }
 
 fdtput_tests () {
-- 
2.56.1

