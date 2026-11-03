Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793722490;
	b=XKfIXRKtCjDNQVu6n0TE2AWUtxaf8t5zVDDg1PnKV4rHo+/KmGTLhanzFZL3JXNaR/P7
	 kwGQttcWhbrUqaxl/925gKedR3yICUvzg7CvegPrHxLjf7EHd9zAZ5x/jhnIb7bUX1aV/
	 9ZxqwddsfzDHPn3IaH4sAwjdctf5S1tMDsy4aZdgwysCaPu135fXm23pR/FV60rcdSTlE
	 pUkNLJcepSgxStMS3O7qa6SatE8g5tps5445OIDQVH6/t486K6h68Rh4g0KLkrKa6RFau
	 q9kNxWHcEZXiYIqqpex85SoWK8iEcEegY04MHMdXF5+Leb5vlsXoN6MPLC6YbZVRHiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793722490;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-TM-AS-GCONF:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=E6kjG+gzjJweE1HCiaegIfQRaTzy27A106XqlkAkgxE=;
	b=4aIFii6C7bUkWhyimbOjOAa4Xvyqt03x3/Se5ReWnobQjzTlINY9WfDByju3VecDliuh
	 WVjTOmGUfbaQbXM3yfx1FNZVI2+KKn2LW92bZ2oAJHtIXstpqQgQG7y86lCtOENapEbd2
	 qSlWaV7filc+EW0rzn8qsAVuMYFTTbPtrQPWOAgT1eocGMdcJAAYX88xbO/mt2QPxOJLU
	 BrcJxBDSPS7MGxAYzkKDOXHPFXZl/lua+bVLhM6C9RX/mkjk+7+WGLbJe1A1unTE0u4FJ
	 ZcjOI47UtJhZNk4gWJt8613BrJtFh/EdHs4MYWx747epoi+tZSmf5e5XyYdGxGw/KQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b="sf116/EI";
	arc=none smtp.remote-ip=148.163.158.5
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EC1606A33A
	for <devicetree-compiler@vger.kernel.org>; Tue,  3 Nov 2026 16:14:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84EC1606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sf116/EI
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3EECRr2025832;
	Tue, 3 Nov 2026 16:14:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=E6kjG+gzjJweE1HCiaegIfQRaTzy27A106XqlkAkg
	xE=; b=sf116/EIWiH2OO76pyyYcLXEp9/WF25JjF9v6/SoMDzE9EYg4twPwUwtj
	3E7+38aPmlJnq0q4hkIiU5yrg164xw5UMsooLS/LEnyKKHIkd2WZAsKuUSh6WEQB
	Vhf/Butd9ibscZisBzf40thHHEOFbRJKqPnhtA6GBakT+QZJKxurMofEpklim4iQ
	lKbK4KOmmGvAu98Dp40seytlGvE8eKo9olGZQ7w+xjmfGVQe91L0DIZLkp1LyB9x
	TUqPrvuAgEVuJJIy1xXas7Zxrzqy3lbl6pZ4LjkvP+B/tonM6QbavndZngETNGP4
	tYPudz5v9lCHw1fGgl81YmRn6FYSg==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4hn7yrxkcc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 03 Nov 2026 16:14:42 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3EZ1Rs2652725;
	Tue, 3 Nov 2026 16:14:41 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4hnu1vkdnx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Nov 2026 16:14:41 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6A3GEb0C44630474
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 3 Nov 2026 16:14:37 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5DA672004E;
	Tue,  3 Nov 2026 16:14:37 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A60A52004B;
	Tue,  3 Nov 2026 16:14:34 +0000 (GMT)
Received: from vishalc-ibm.ibmuc.com (unknown [9.43.119.203])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  3 Nov 2026 16:14:34 +0000 (GMT)
From: Vishal Chourasia <vishalc@linux.ibm.com>
To: devicetree-compiler@vger.kernel.org
Cc: david@gibson.dropbear.id.au, sourabhjain@linux.ibm.com,
        Vishal Chourasia <vishalc@linux.ibm.com>
Subject: [PATCH] libfdt: Add fdt_add_subnode_tail()
Date: Tue,  3 Nov 2026 21:44:25 +0530
Message-ID: <20261103161425.1258558-1-vishalc@linux.ibm.com>
X-Mailer: git-send-email 2.54.0
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
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=Mcr5KJ/f c=1 sm=1 tr=0 ts=6aea0872 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=RzCfie-kr_QcCd8fBx8p:22 a=VnNF1IyMAAAA:8 a=9VeLIyocTKYkulp_5sEA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA2NCBTYWx0ZWRfX4ZtRi5zZYgdE
 DHfa6HMuOETwidgKqnK8nrcUihjhkAQO9CqIPrJAA7LXKP4hQDEFL2E+PcJXRyyiTFkVMhrBBam
 DpWeO75iAxoGwJIS3FLsdH5MZSfFCXs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA2NCBTYWx0ZWRfXxpyWXfEUIfPM
 q1YivKPwyeWQCvn0r97V3jMCRWJzz6VVdRIaGZ22LTAKu1kQADclS+5qwGTZzJACq3/P0HIW0HD
 N0DnTFAvPTnt69Bh6paJXGFhO1VQI0IdXndNQajDLR8E8P/8yOHDzUdR1kF2daaBejEbbznOiwS
 N0bC/QEQ3Bg8WbUknl3bCWFD5NT0+0sqvnYEDJp36KLSC7XqitJiDmFxd4Dk7Ap/A73LKzTbFgX
 mjvut+VgOOyaS//U1+hqE6E+5GclQHa0C5rl8w/wdAUSG9N/YsclQVbC2+evsIyKBTiMI0vVUH2
 IOLDvmKVSxE7f/ja6y5u59uUj/0Use4mC389Ko4xhJVI8TQmd6MbiXRFcyvRnk0y2ujZUspjKvQ
 kkbmoAGen9e7LTcND6yUBLCodYaUkwNHSWP94OHmVx+PEk6w/ERH67wZ01931zAQ9nY1PDQTFvJ
 YsvzvSbs1V9jlu2sSiA==
X-Proofpoint-GUID: d2H9qG9CA-vAhFgFP4rFTQOXVcwDfg5g
X-Proofpoint-ORIG-GUID: d2H9qG9CA-vAhFgFP4rFTQOXVcwDfg5g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 clxscore=1011 impostorscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030064

fdt_add_subnode() always inserts the new node as the first child of its
parent, after the parent's properties. Code that builds a list of nodes
by adding them one at a time therefore ends up with the nodes in reverse
order. That matters when the order is significant, e.g. when a blob is
rebuilt from a live tree.

Add fdt_add_subnode_tail() and fdt_add_subnode_namelen_tail(), which
insert the new node right before the closing tag of the parent, so that
nodes added in sequence keep that sequence. Like fdt_add_subnode(), they
use fdt_splice_struct_() and so leave the blob unmodified if there is
not enough room.

Also add an Fdt.add_subnode_tail() method to pylibfdt.

Add tests for both: a C testcase covering ordering, parents with and
without existing children, the root node, duplicate names and running
out of space, and a short pylibfdt test of the wrapper.

Signed-off-by: Vishal Chourasia <vishalc@linux.ibm.com>
---
 libfdt/fdt_rw.c          |  57 ++++++++++++++++++
 libfdt/libfdt.h          |  37 ++++++++++++
 libfdt/version.lds       |   2 +
 pylibfdt/libfdt.i        |  19 ++++++
 tests/.gitignore         |   1 +
 tests/Makefile.tests     |   2 +-
 tests/add_subnode_tail.c | 123 +++++++++++++++++++++++++++++++++++++++
 tests/meson.build        |   1 +
 tests/pylibfdt_tests.py  |  17 ++++++
 tests/run_tests.sh       |   1 +
 10 files changed, 259 insertions(+), 1 deletion(-)
 create mode 100644 tests/add_subnode_tail.c

diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
index 850aafe..a5a6f2a 100644
--- a/libfdt/fdt_rw.c
+++ b/libfdt/fdt_rw.c
@@ -414,6 +414,63 @@ int fdt_add_subnode(void *fdt, int parentoffset, const char *name)
 	return fdt_add_subnode_namelen(fdt, parentoffset, name, strlen(name));
 }
 
+int fdt_add_subnode_namelen_tail(void *fdt, int parentoffset,
+				 const char *name, int namelen)
+{
+	struct fdt_node_header *nh;
+	int offset, nextoffset;
+	int depth = 0;
+	int nodelen;
+	int err;
+	uint32_t tag;
+	fdt32_t *endtag;
+
+	FDT_RW_PROBE(fdt);
+
+	offset = fdt_subnode_offset_namelen(fdt, parentoffset, name, namelen);
+	if (offset >= 0)
+		return -FDT_ERR_EXISTS;
+	else if (offset != -FDT_ERR_NOTFOUND)
+		return offset;
+
+	/* Place the new node right before the parent's closing tag */
+	offset = parentoffset;
+	for (;;) {
+		tag = fdt_next_tag(fdt, offset, &nextoffset);
+		if (tag == FDT_BEGIN_NODE)
+			depth++;
+		else if (tag == FDT_END_NODE)
+			depth--;
+		else if (tag == FDT_END)
+			return -FDT_ERR_BADSTRUCTURE;
+
+		if (!depth)
+			break;
+		offset = nextoffset;
+	}
+
+	nh = fdt_offset_ptr_w_(fdt, offset);
+	nodelen = sizeof(*nh) + FDT_TAGALIGN(namelen+1) + FDT_TAGSIZE;
+
+	err = fdt_splice_struct_(fdt, nh, 0, nodelen);
+	if (err)
+		return err;
+
+	nh->tag = cpu_to_fdt32(FDT_BEGIN_NODE);
+	memset(nh->name, 0, FDT_TAGALIGN(namelen+1));
+	memcpy(nh->name, name, namelen);
+	endtag = (fdt32_t *)((char *)nh + nodelen - FDT_TAGSIZE);
+	*endtag = cpu_to_fdt32(FDT_END_NODE);
+
+	return offset;
+}
+
+int fdt_add_subnode_tail(void *fdt, int parentoffset, const char *name)
+{
+	return fdt_add_subnode_namelen_tail(fdt, parentoffset, name,
+					    strlen(name));
+}
+
 int fdt_del_node(void *fdt, int nodeoffset)
 {
 	int endoffset;
diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index c69a18e..f78966f 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -2441,6 +2441,43 @@ int fdt_add_subnode_namelen(void *fdt, int parentoffset,
  */
 int fdt_add_subnode(void *fdt, int parentoffset, const char *name);
 
+/**
+ * fdt_add_subnode_namelen_tail - creates a new node as the last child
+ * @fdt: pointer to the device tree blob
+ * @parentoffset: structure block offset of a node
+ * @name: name of the subnode to create
+ * @namelen: number of characters of name to consider
+ *
+ * Identical to fdt_add_subnode_tail(), but use only the first @namelen
+ * characters of @name as the name of the new node.  This is useful for
+ * creating subnodes based on a portion of a larger string, such as a
+ * full path.
+ *
+ * Returns: structure block offset of the created subnode (>=0), or a
+ * negative error code, see fdt_add_subnode()
+ */
+int fdt_add_subnode_namelen_tail(void *fdt, int parentoffset,
+				 const char *name, int namelen);
+
+/**
+ * fdt_add_subnode_tail - creates a new node as the last child
+ * @fdt: pointer to the device tree blob
+ * @parentoffset: structure block offset of a node
+ * @name: name of the subnode to create
+ *
+ * fdt_add_subnode() inserts the new node as the first child of the parent,
+ * so nodes added one by one end up in reverse order.
+ * fdt_add_subnode_tail() inserts the new node right before the closing tag
+ * of the parent instead, so nodes added in sequence keep that sequence.
+ *
+ * This function will insert data into the blob, and will therefore
+ * change the offsets of some existing nodes.
+ *
+ * Returns: structure block offset of the created subnode (>=0), or a
+ * negative error code, see fdt_add_subnode()
+ */
+int fdt_add_subnode_tail(void *fdt, int parentoffset, const char *name);
+
 /**
  * fdt_del_node - delete a node (subtree)
  * @fdt: pointer to the device tree blob
diff --git a/libfdt/version.lds b/libfdt/version.lds
index cbfef54..daee653 100644
--- a/libfdt/version.lds
+++ b/libfdt/version.lds
@@ -48,6 +48,8 @@ LIBFDT_1.2 {
 		fdt_delprop;
 		fdt_add_subnode_namelen;
 		fdt_add_subnode;
+		fdt_add_subnode_namelen_tail;
+		fdt_add_subnode_tail;
 		fdt_del_node;
 		fdt_strerror;
 		fdt_offset_ptr;
diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
index fa5f499..8db7b47 100644
--- a/pylibfdt/libfdt.i
+++ b/pylibfdt/libfdt.i
@@ -878,6 +878,25 @@ class Fdt(FdtRo):
         """
         return check_err(fdt_add_subnode(self._fdt, parentoffset, name), quiet)
 
+    def add_subnode_tail(self, parentoffset, name, quiet=()):
+        """Add a new subnode to a node, as its last child
+
+        Unlike add_subnode(), which makes the new node the first child,
+        nodes added with this method keep the order in which they were added.
+
+        Args:
+            parentoffset: Parent offset to add the subnode to
+            name: Name of node to add
+
+        Returns:
+            offset of the node created, or negative error code on failure
+
+        Raises:
+            FdtError if there is not enough space, or another error occurs
+        """
+        return check_err(fdt_add_subnode_tail(self._fdt, parentoffset, name),
+                         quiet)
+
     def del_node(self, nodeoffset, quiet=()):
         """Delete a node
 
diff --git a/tests/.gitignore b/tests/.gitignore
index 6969312..103e455 100644
--- a/tests/.gitignore
+++ b/tests/.gitignore
@@ -5,6 +5,7 @@
 tmp.*
 /fs/
 /add_subnode_with_nops
+/add_subnode_tail
 /addr_size_cells
 /addr_size_cells2
 /appendprop[12]
diff --git a/tests/Makefile.tests b/tests/Makefile.tests
index af5d309..a84edd3 100644
--- a/tests/Makefile.tests
+++ b/tests/Makefile.tests
@@ -22,7 +22,7 @@ LIB_TESTS_L = get_mem_rsv \
 	extra-terminating-null \
 	dtbs_equal_ordered \
 	dtb_reverse dtbs_equal_unordered \
-	add_subnode_with_nops path_offset_aliases \
+	add_subnode_with_nops add_subnode_tail path_offset_aliases \
 	utilfdt_test \
 	integer-expressions \
 	property_iterate \
diff --git a/tests/add_subnode_tail.c b/tests/add_subnode_tail.c
new file mode 100644
index 0000000..8aa499a
--- /dev/null
+++ b/tests/add_subnode_tail.c
@@ -0,0 +1,123 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+/*
+ * libfdt - Flat Device Tree manipulation
+ *	Testcase for fdt_add_subnode_tail()
+ */
+
+#include <stdlib.h>
+#include <stdio.h>
+#include <string.h>
+#include <stdint.h>
+
+#include <libfdt.h>
+
+#include "tests.h"
+#include "testdata.h"
+
+#define SPACE	65536
+
+#define CHECK(code) \
+	{ \
+		err = (code); \
+		if (err) \
+			FAIL(#code ": %s", fdt_strerror(err)); \
+	}
+
+#define OFF_CHECK(off, code) \
+	{ \
+		(off) = (code); \
+		if (off < 0) \
+			FAIL(#code ": %s", fdt_strerror(off)); \
+	}
+
+static void check_children(const void *fdt, int parent, int n,
+			   const char * const *names)
+{
+	int i = 0, off;
+
+	fdt_for_each_subnode(off, fdt, parent) {
+		const char *name = fdt_get_name(fdt, off, NULL);
+
+		if (i >= n)
+			FAIL("Too many subnodes, extra \"%s\"", name);
+		if (!name || strcmp(name, names[i]))
+			FAIL("Subnode %d is \"%s\", expected \"%s\"", i,
+			     name ? name : "(null)", names[i]);
+		i++;
+	}
+	if (i != n)
+		FAIL("Found %d subnodes, expected %d", i, n);
+}
+
+int main(int argc, char *argv[])
+{
+	static const char * const order[] = { "a", "b", "c", "d" };
+	void *fdt;
+	int err;
+	int parent, off, child;
+
+	test_init(argc, argv);
+
+	fdt = xmalloc(SPACE);
+
+	CHECK(fdt_create(fdt, SPACE));
+	CHECK(fdt_finish_reservemap(fdt));
+	CHECK(fdt_begin_node(fdt, ""));
+	CHECK(fdt_property_cell(fdt, "prop", TEST_VALUE_1));
+	CHECK(fdt_begin_node(fdt, "parent"));
+	CHECK(fdt_property_cell(fdt, "pprop", TEST_VALUE_2));
+	CHECK(fdt_begin_node(fdt, "a"));
+	CHECK(fdt_property_cell(fdt, "aprop", TEST_VALUE_1));
+	CHECK(fdt_begin_node(fdt, "grandchild"));
+	CHECK(fdt_end_node(fdt));
+	CHECK(fdt_end_node(fdt));
+	CHECK(fdt_end_node(fdt));
+	CHECK(fdt_begin_node(fdt, "sibling"));
+	CHECK(fdt_end_node(fdt));
+	CHECK(fdt_end_node(fdt));
+	CHECK(fdt_finish(fdt));
+
+	CHECK(fdt_open_into(fdt, fdt, SPACE));
+
+	OFF_CHECK(parent, fdt_path_offset(fdt, "/parent"));
+
+	/* Nodes added in sequence must keep that sequence */
+	OFF_CHECK(off, fdt_add_subnode_tail(fdt, parent, "b"));
+	OFF_CHECK(off, fdt_add_subnode_tail(fdt, parent, "c"));
+	OFF_CHECK(off, fdt_add_subnode_namelen_tail(fdt, parent, "dxx", 1));
+
+	OFF_CHECK(parent, fdt_path_offset(fdt, "/parent"));
+	check_children(fdt, parent, 4, order);
+	check_getprop_cell(fdt, parent, "pprop", TEST_VALUE_2);
+
+	/* Existing children are left untouched */
+	OFF_CHECK(child, fdt_path_offset(fdt, "/parent/a"));
+	check_getprop_cell(fdt, child, "aprop", TEST_VALUE_1);
+	OFF_CHECK(child, fdt_path_offset(fdt, "/parent/a/grandchild"));
+	OFF_CHECK(child, fdt_path_offset(fdt, "/sibling"));
+	check_getprop_cell(fdt, 0, "prop", TEST_VALUE_1);
+
+	/* A new node can be added to a node without any children */
+	OFF_CHECK(off, fdt_path_offset(fdt, "/sibling"));
+	OFF_CHECK(child, fdt_add_subnode_tail(fdt, off, "x"));
+	OFF_CHECK(off, fdt_path_offset(fdt, "/sibling/x"));
+
+	/* ... and to the root node */
+	OFF_CHECK(child, fdt_add_subnode_tail(fdt, 0, "last"));
+	OFF_CHECK(off, fdt_path_offset(fdt, "/last"));
+
+	/* Duplicates are rejected */
+	err = fdt_add_subnode_tail(fdt, parent, "a");
+	if (err != -FDT_ERR_EXISTS)
+		FAIL("fdt_add_subnode_tail() of existing node returned %d",
+		     err);
+
+	/* Running out of space must fail without damaging the tree */
+	CHECK(fdt_pack(fdt));
+	err = fdt_add_subnode_tail(fdt, parent, "nospace");
+	if (err != -FDT_ERR_NOSPACE)
+		FAIL("fdt_add_subnode_tail() without space returned %d", err);
+	CHECK(fdt_check_full(fdt, fdt_totalsize(fdt)));
+
+	PASS();
+}
diff --git a/tests/meson.build b/tests/meson.build
index c255006..84eb829 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -24,6 +24,7 @@ testutil_dep = declare_dependency(sources: ['testutils.c'])
 
 tests = [
   'add_subnode_with_nops',
+  'add_subnode_tail',
   'addr_size_cells',
   'addr_size_cells2',
   'appendprop1',
diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
index ae46b29..d0f6d4a 100644
--- a/tests/pylibfdt_tests.py
+++ b/tests/pylibfdt_tests.py
@@ -613,6 +613,23 @@ class PyLibfdtBasicTests(unittest.TestCase):
         self.assertTrue(offset > 0)
         self.assertEqual(self.GetSubnodes(node_name), ['more', 'ss1'])
 
+    def testAddSubnodeTail(self):
+        """Test that add_subnode_tail() appends nodes in order"""
+        node_name = '/subnode@1'
+        self.fdt.resize(self.fdt.totalsize() + 128)
+        node = self.fdt.path_offset(node_name)
+        self.assertEqual(self.GetSubnodes(node_name), ['subsubnode', 'ss1'])
+        for name in ('x', 'y', 'z'):
+            self.assertTrue(self.fdt.add_subnode_tail(node, name) > 0)
+            node = self.fdt.path_offset(node_name)
+        self.assertEqual(self.GetSubnodes(node_name),
+                         ['subsubnode', 'ss1', 'x', 'y', 'z'])
+
+        with self.assertRaisesRegex(FdtException, get_err(libfdt.EXISTS)):
+            self.fdt.add_subnode_tail(node, 'x')
+        self.assertEqual(self.fdt.add_subnode_tail(node, 'x', (libfdt.EXISTS,)),
+                         -libfdt.EXISTS)
+
 
 class PyLibfdtSwTests(unittest.TestCase):
     """Test class for pylibfdt sequential-write DT creation
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 0d815e3..3698832 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -537,6 +537,7 @@ libfdt_tests () {
 
     # Specific bug tests
     run_test add_subnode_with_nops
+    run_test add_subnode_tail
     run_dtc_test -I dts -O dts -o sourceoutput.test.dts "$SRCDIR/sourceoutput.dts"
     run_dtc_test -I dts -O dtb -o sourceoutput.test.dtb "$SRCDIR/sourceoutput.dts"
     run_dtc_test -I dts -O dtb -o sourceoutput.test.dts.test.dtb sourceoutput.test.dts
-- 
2.54.0

