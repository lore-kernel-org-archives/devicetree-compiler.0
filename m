Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E393A9633;
	Tue, 10 Feb 2026 17:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770744885; cv=none; b=V0qDh8woqrBI3Og39kFl7a409/qGjcnmhvJ+hrtApHKCpV7DMAGXznEimwfh5rBxqVtJt8puNXdxBoKyHaFEVnw8q9xj66U9Kb1p6BZn4X5AbnPUybYsUbHX5iMsz7pWpi63NVMlR22UMA9xb7khwXlcT9V3j2mEKJH7w31NHqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770744885; c=relaxed/simple;
	bh=jCd7W0+SwrS40OVE3WgQZooVnxYlDbJH/cd1M/t/csw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JwNSF9ud6jQYQVwDV8swb3AHOI52lhnpUpa0qMWAzT8PMv+GEmBDjZT61fAD6fYp5LaSZHDxYOG/SUXoyzxChpIg2BP7pbmY2Ggo0q1OcLPPXEo5f4Dnb9CvTAOwgCWcOO4Solh/V6BlV/kDcvri9rnMRHKe4I4pbxQR2bMJdBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=wUv+52Es; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="wUv+52Es"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 27E861A0D9C;
	Tue, 10 Feb 2026 17:34:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EB975606BD;
	Tue, 10 Feb 2026 17:34:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E400110B92226;
	Tue, 10 Feb 2026 18:34:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770744881; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Cey6txh3ecv9PyGNUxnI7vsqR6x5ql89oT71DjSD+2g=;
	b=wUv+52EsUgZECDSWlHL2N5xB7ObjTaOzA1gzVCDCTXPDnlS/9oeB0ZYgbdPxc3NMJDk9xp
	LLMbu7q9c/5mcWpFkAV2yDVvUycmf3ePwpagRvvNFDIjGjVUvHuoIenrjS7nCcCvhzDp9K
	FB+KLSr263NRxiPsSqU5N+0IdJXI5mNNKqaj0awAxTlxkhPNa9eVOtodmrJIvydixHSEFn
	nzJ8EAPQdQf3M3GGXV1YkU+D1xQkHF34s2sXp4b39iXRMqgxuvWsKANk0AB3+sffH/LD4Y
	HBEOpJIqfDuND2TzTnjGot/wzFu5P15chn63hxRb54V6Wz50UF2BeZYnJx6gKw==
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
Subject: [RFC PATCH 14/15] libfdt: Handle unknown tags on dtb modifications
Date: Tue, 10 Feb 2026 18:33:42 +0100
Message-ID: <20260210173349.636766-15-herve.codina@bootlin.com>
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
ability to ignore unknown tags without any error.

When the dtb is modified those unknown tags have to be taken into
account.

First, depending on the unknown tag location, the item associated with
the tag is identified:
  - An unknown tag located just after a FDT_BEGIN_NODE is related to the
    node.

  - An unknown tag located just after a FDT_PROP is related to the
    property.

  - An unknown tag out of any node (i.e located before the first
    FDT_BEGIN_NODE or after the last FDT_END_NODE is a global tag
    related to the dtb itself.

Then, if we are allowed to write a dtb containing unknown tags, the
following rules are used:
  - When a property is modified, tags related to this property are
    removed and the dtb version is downgraded.

  - When a property is removed, tags related to this property are
    obviously removed. The dtb version is kept unchanged.

  - When a property or a node is added, obviously no unknown tags are
    added and the dtb version is kept unchanged.

  - When a node is removed, tags related to this node are obviously
    removed. The dtb version is kept unchanged.

  - Adding, removing or modifying a property is not considered as a node
    modification and so, those operations have no impacts on unknown
    tags related to the node. Those node related tags are kept unchanged.

  - The only modification considered as a node modification is setting
    its name. We consider that this operation has no impact on tags
    related to the node. Here also, those node related tags and the
    dtb version are kept unchanged.

  - Global (dtb related) unknown tags are kept unchanged regardless the
    modification done.

Implement those rules when a dtb is modified.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 libfdt/fdt_rw.c                               | 118 +++++++++++++++++-
 tests/run_tests.sh                            |  50 ++++++++
 ...own_tags_can_skip.fdtput.test.dtb.0.expect |  31 +++++
 ...own_tags_can_skip.fdtput.test.dtb.1.expect |  35 ++++++
 ...own_tags_can_skip.fdtput.test.dtb.2.expect |  33 +++++
 ...own_tags_can_skip.fdtput.test.dtb.3.expect |  35 ++++++
 ...own_tags_can_skip.fdtput.test.dtb.4.expect |  34 +++++
 ...own_tags_can_skip.fdtput.test.dtb.5.expect |  32 +++++
 ...own_tags_can_skip.fdtput.test.dtb.6.expect |  27 ++++
 9 files changed, 394 insertions(+), 1 deletion(-)
 create mode 100644 tests/unknown_tags_can_skip.fdtput.test.dtb.0.expect
 create mode 100644 tests/unknown_tags_can_skip.fdtput.test.dtb.1.expect
 create mode 100644 tests/unknown_tags_can_skip.fdtput.test.dtb.2.expect
 create mode 100644 tests/unknown_tags_can_skip.fdtput.test.dtb.3.expect
 create mode 100644 tests/unknown_tags_can_skip.fdtput.test.dtb.4.expect
 create mode 100644 tests/unknown_tags_can_skip.fdtput.test.dtb.5.expect
 create mode 100644 tests/unknown_tags_can_skip.fdtput.test.dtb.6.expect

diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
index f5c28fc..a8f53b4 100644
--- a/libfdt/fdt_rw.c
+++ b/libfdt/fdt_rw.c
@@ -188,6 +188,60 @@ int fdt_del_mem_rsv(void *fdt, int n)
 	return fdt_splice_mem_rsv_(fdt, re, 1, 0);
 }
 
+static void fdt_nopify_area(void *fdt, int start_offset, int next_offset)
+{
+	int count = (next_offset - start_offset) / sizeof(fdt32_t);
+	fdt32_t fdt32_nop = cpu_to_fdt32(FDT_NOP);
+	fdt32_t *ptr;
+
+	ptr = fdt_offset_ptr_w_(fdt, start_offset);
+	while (count--)
+		*(ptr++) = fdt32_nop;
+};
+
+static int fdt_property_remove_unknown_tags(void *fdt,
+					    const struct fdt_property *prop,
+					    bool downgrade_version)
+{
+	int nextoffset, offset;
+	bool is_unknown;
+	uint32_t tag;
+
+	tag = fdt_next_tag(fdt, fdt_ptr_offset_(fdt, prop), &nextoffset);
+	if (tag == FDT_END)
+		return nextoffset;
+
+	/*
+	 * Look at all tags related to the current property. I.e. tags after the
+	 * current property and before either the next property, a sub-node  or
+	 * the end of current node
+	 */
+	do {
+		offset = nextoffset;
+		tag = fdt_next_tag_(fdt, offset, &nextoffset, &is_unknown);
+		if (tag == FDT_END)
+			return nextoffset;
+
+		/*
+		 * Unknown tags are returned as NOP. Force FDT_NOP to be really
+		 * present in the area to remove the unknown tag and its related
+		 * data. Also, as a tag is removed, downgrade the dtb version
+		 * if asked for.
+		 */
+		if (tag == FDT_NOP) {
+			if (is_unknown) {
+				if (downgrade_version)
+					fdt_downgrade_version(fdt);
+				fdt_nopify_area(fdt, offset, nextoffset);
+			}
+		}
+
+	} while ((tag != FDT_PROP) && (tag != FDT_BEGIN_NODE) &&
+		 (tag != FDT_END_NODE));
+
+	return 0;
+}
+
 static int fdt_resize_property_(void *fdt, int nodeoffset,
 				const char *name, int namelen,
 				int len, struct fdt_property **prop)
@@ -200,6 +254,14 @@ static int fdt_resize_property_(void *fdt, int nodeoffset,
 	if (!*prop)
 		return oldlen;
 
+	/*
+	 * The property is resized. Remove possible unknown tags related to the
+	 * property downgrading the dtb version.
+	 */
+	err = fdt_property_remove_unknown_tags(fdt, *prop, true);
+	if (err)
+		return err;
+
 	if ((err = fdt_splice_struct_(fdt, (*prop)->data, FDT_TAGALIGN(oldlen),
 				      FDT_TAGALIGN(len))))
 		return err;
@@ -208,6 +270,29 @@ static int fdt_resize_property_(void *fdt, int nodeoffset,
 	return 0;
 }
 
+static int fdt_node_skip_unknown_tags(void *fdt, int next)
+{
+	int nextoffset = next;
+	int offset;
+	uint32_t tag;
+
+	/*
+	 * Skip all tags related to the current node. I.e. tags after the
+	 * current node and before either the next property, a sub-node or the
+	 * end of current node.
+	 */
+	do {
+		offset = nextoffset;
+		tag = fdt_next_tag(fdt, offset, &nextoffset);
+		if (tag == FDT_END)
+			return nextoffset;
+
+	} while ((tag != FDT_PROP) && (tag != FDT_BEGIN_NODE) &&
+		 (tag != FDT_END_NODE));
+
+	return offset;
+}
+
 static int fdt_add_property_(void *fdt, int nodeoffset, const char *name,
 			     int namelen, int len, struct fdt_property **prop)
 {
@@ -220,6 +305,15 @@ static int fdt_add_property_(void *fdt, int nodeoffset, const char *name,
 	if ((nextoffset = fdt_check_node_offset_(fdt, nodeoffset)) < 0)
 		return nextoffset;
 
+	/*
+	 * nextoffset it at the first tag after the node.
+	 * Skip possible unknown tags related to the node in order to add the
+	 * property after those tags.
+	 */
+	nextoffset = fdt_node_skip_unknown_tags(fdt, nextoffset);
+	if (nextoffset < 0)
+		return nextoffset;
+
 	namestroff = fdt_find_add_string_(fdt, name, namelen, &allocated);
 	if (namestroff < 0)
 		return namestroff;
@@ -309,6 +403,14 @@ int fdt_appendprop(void *fdt, int nodeoffset, const char *name,
 
 	prop = fdt_get_property_w(fdt, nodeoffset, name, &oldlen);
 	if (prop) {
+		/*
+		 * The property is going to be modified. Remove possible unknown
+		 * tags related to this property downgrading the dtb version.
+		 */
+		err = fdt_property_remove_unknown_tags(fdt, prop, true);
+		if (err)
+			return err;
+
 		newlen = len + oldlen;
 		err = fdt_splice_struct_(fdt, prop->data,
 					 FDT_TAGALIGN(oldlen),
@@ -331,6 +433,7 @@ int fdt_delprop(void *fdt, int nodeoffset, const char *name)
 {
 	struct fdt_property *prop;
 	int len, proplen;
+	int err;
 
 	FDT_RW_PROBE(fdt);
 
@@ -338,6 +441,14 @@ int fdt_delprop(void *fdt, int nodeoffset, const char *name)
 	if (!prop)
 		return len;
 
+	/*
+	 * The property is going to be removed. Remove also possible unknown
+	 * tags related to this property. Keep the dtb version unchanged.
+	 */
+	err = fdt_property_remove_unknown_tags(fdt, prop, false);
+	if (err)
+		return err;
+
 	proplen = sizeof(*prop) + FDT_TAGALIGN(len);
 	return fdt_splice_struct_(fdt, prop, proplen, 0);
 }
@@ -366,7 +477,12 @@ int fdt_add_subnode_namelen(void *fdt, int parentoffset,
 	else if (offset != -FDT_ERR_NOTFOUND)
 		return offset;
 
-	/* Try to place the new node after the parent's properties */
+	/*
+	 * Try to place the new node after the parent's properties and unknown
+	 * tags related to those properties.
+	 * Unknown tags are reported as FDT_NOP tags by fdt_next_tag.
+	 * Skipping FDT_NOP tags will correctly skip unknown tags.
+	 */
 	tag = fdt_next_tag(fdt, parentoffset, &nextoffset);
 	/* the fdt_subnode_offset_namelen() should ensure this never hits */
 	if (!can_assume(LIBFDT_FLAWLESS) && (tag != FDT_BEGIN_NODE))
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 690a141..e88f641 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -1043,6 +1043,56 @@ fdtput_tests () {
     run_wrap_error_test $DTPUT $dtb -d /chosen   non-existent-prop
 
     # TODO: Add tests for verbose mode?
+
+    # Modify a dtb containing some "unknown" tags that can be skipped
+    dtb=unknown_tags_can_skip.fdtput.test.dtb
+    cp unknown_tags_can_skip.dtb $dtb
+    base_run_test wrap_fdtdump $dtb $dtb.0.out
+    # Remove unneeded header fields (keep those related to versions)
+    sed -i '/^\/.*\(magic\|off\|size\|cpu\)/d' $dtb.0.out
+    base_run_test check_diff $dtb.0.out "$SRCDIR/$dtb.0.expect"
+
+    run_fdtput_test "vwxyz" $dtb / prop-str -ts "vwxyz"
+    base_run_test wrap_fdtdump $dtb $dtb.1.out
+    # Remove unneeded header fields (keep those related to versions)
+    sed -i '/^\/.*\(magic\|off\|size\|cpu\)/d' $dtb.1.out
+    base_run_test check_diff $dtb.1.out "$SRCDIR/$dtb.1.expect"
+
+    cp unknown_tags_can_skip.dtb $dtb
+    run_wrap_test $DTPUT $dtb -c /tst-fdtput
+    base_run_test wrap_fdtdump $dtb $dtb.2.out
+    # Remove unneeded header fields (keep those related to versions)
+    sed -i '/^\/.*\(magic\|off\|size\|cpu\)/d' $dtb.2.out
+    base_run_test check_diff $dtb.2.out "$SRCDIR/$dtb.2.expect"
+    run_wrap_test $DTPUT $dtb -c /tst-fdtput/n1 /tst-fdtput/n2 /tst-fdtput/n3
+    run_wrap_test $DTPUT $dtb -r /tst-fdtput/n1 /tst-fdtput/n3
+    run_fdtget_test "n2" $dtb -l  /tst-fdtput
+    base_run_test wrap_fdtdump $dtb $dtb.3.out
+    # Remove unneeded header fields (keep those related to versions)
+    sed -i '/^\/.*\(magic\|off\|size\|cpu\)/d' $dtb.3.out
+    base_run_test check_diff $dtb.3.out "$SRCDIR/$dtb.3.expect"
+
+    cp unknown_tags_can_skip.dtb $dtb
+    run_wrap_test $DTPUT $dtb -d / prop-str
+    run_fdtget_test "prop-int" $dtb -p  /
+    base_run_test wrap_fdtdump $dtb $dtb.4.out
+    # Remove unneeded header fields (keep those related to versions)
+    sed -i '/^\/.*\(magic\|off\|size\|cpu\)/d' $dtb.4.out
+    base_run_test check_diff $dtb.4.out "$SRCDIR/$dtb.4.expect"
+
+    cp unknown_tags_can_skip.dtb $dtb
+    run_wrap_test $DTPUT $dtb /subnode2 prop-tst-fdtput -ts "Test fdtput"
+    base_run_test wrap_fdtdump $dtb $dtb.5.out
+    # Remove unneeded header fields (keep those related to versions)
+    sed -i '/^\/.*\(magic\|off\|size\|cpu\)/d' $dtb.5.out
+    base_run_test check_diff $dtb.5.out "$SRCDIR/$dtb.5.expect"
+
+    cp unknown_tags_can_skip.dtb $dtb
+    run_wrap_test $DTPUT $dtb -r /subnode2/subsubnode
+    base_run_test wrap_fdtdump $dtb $dtb.6.out
+    # Remove unneeded header fields (keep those related to versions)
+    sed -i '/^\/.*\(magic\|off\|size\|cpu\)/d' $dtb.6.out
+    base_run_test check_diff $dtb.6.out "$SRCDIR/$dtb.6.expect"
 }
 
 utilfdt_tests () {
diff --git a/tests/unknown_tags_can_skip.fdtput.test.dtb.0.expect b/tests/unknown_tags_can_skip.fdtput.test.dtb.0.expect
new file mode 100644
index 0000000..b611a87
--- /dev/null
+++ b/tests/unknown_tags_can_skip.fdtput.test.dtb.0.expect
@@ -0,0 +1,31 @@
+/dts-v1/;
+// version:		4294967295
+// last_comp_version:	16
+
+// Unknown tag ignored: 0xd0000000, data lng 4 00000001
+/ {
+    // Unknown tag ignored: 0xc0000000, data lng 0
+    prop-int = <0x00000001>;
+    // Unknown tag ignored: 0xd0000000, data lng 4 00000011
+    prop-str = "abcd";
+    // Unknown tag ignored: 0xe0000000, data lng 8 0000001200000012
+    // Unknown tag ignored: 0xf0000000, data lng 3 131313
+    subnode1 {
+        prop-int = <0x00000001 0x00000002>;
+        // Unknown tag ignored: 0xc0000000, data lng 0
+    };
+    subnode2 {
+        // Unknown tag ignored: 0xd0000000, data lng 4 00000121
+        prop-int1 = <0x00000001 0x00000002>;
+        // Unknown tag ignored: 0xd0000000, data lng 4 00000122
+        prop-int2 = <0x00000001 0x00000002>;
+        subsubnode {
+            // Unknown tag ignored: 0xd0000000, data lng 4 00000123
+            prop-int = <0x00000001 0x00000002>;
+        };
+        // Unknown tag ignored: 0xd0000000, data lng 4 00000124
+    };
+    // Unknown tag ignored: 0xf0000000, data lng 5 1414141414
+};
+// Unknown tag ignored: 0xd0000000, data lng 4 00000002
+// Unknown tag ignored: 0xf0000000, data lng 2 0303
diff --git a/tests/unknown_tags_can_skip.fdtput.test.dtb.1.expect b/tests/unknown_tags_can_skip.fdtput.test.dtb.1.expect
new file mode 100644
index 0000000..8b331f3
--- /dev/null
+++ b/tests/unknown_tags_can_skip.fdtput.test.dtb.1.expect
@@ -0,0 +1,35 @@
+/dts-v1/;
+// version:		17
+// last_comp_version:	16
+
+// Unknown tag ignored: 0xd0000000, data lng 4 00000001
+/ {
+    // Unknown tag ignored: 0xc0000000, data lng 0
+    prop-int = <0x00000001>;
+    // Unknown tag ignored: 0xd0000000, data lng 4 00000011
+    prop-str = "vwxyz";
+    // [NOP]
+    // [NOP]
+    // [NOP]
+    // [NOP]
+    // [NOP]
+    // [NOP]
+    subnode1 {
+        prop-int = <0x00000001 0x00000002>;
+        // Unknown tag ignored: 0xc0000000, data lng 0
+    };
+    subnode2 {
+        // Unknown tag ignored: 0xd0000000, data lng 4 00000121
+        prop-int1 = <0x00000001 0x00000002>;
+        // Unknown tag ignored: 0xd0000000, data lng 4 00000122
+        prop-int2 = <0x00000001 0x00000002>;
+        subsubnode {
+            // Unknown tag ignored: 0xd0000000, data lng 4 00000123
+            prop-int = <0x00000001 0x00000002>;
+        };
+        // Unknown tag ignored: 0xd0000000, data lng 4 00000124
+    };
+    // Unknown tag ignored: 0xf0000000, data lng 5 1414141414
+};
+// Unknown tag ignored: 0xd0000000, data lng 4 00000002
+// Unknown tag ignored: 0xf0000000, data lng 2 0303
diff --git a/tests/unknown_tags_can_skip.fdtput.test.dtb.2.expect b/tests/unknown_tags_can_skip.fdtput.test.dtb.2.expect
new file mode 100644
index 0000000..e2dfe91
--- /dev/null
+++ b/tests/unknown_tags_can_skip.fdtput.test.dtb.2.expect
@@ -0,0 +1,33 @@
+/dts-v1/;
+// version:		17
+// last_comp_version:	16
+
+// Unknown tag ignored: 0xd0000000, data lng 4 00000001
+/ {
+    // Unknown tag ignored: 0xc0000000, data lng 0
+    prop-int = <0x00000001>;
+    // Unknown tag ignored: 0xd0000000, data lng 4 00000011
+    prop-str = "abcd";
+    // Unknown tag ignored: 0xe0000000, data lng 8 0000001200000012
+    // Unknown tag ignored: 0xf0000000, data lng 3 131313
+    tst-fdtput {
+    };
+    subnode1 {
+        prop-int = <0x00000001 0x00000002>;
+        // Unknown tag ignored: 0xc0000000, data lng 0
+    };
+    subnode2 {
+        // Unknown tag ignored: 0xd0000000, data lng 4 00000121
+        prop-int1 = <0x00000001 0x00000002>;
+        // Unknown tag ignored: 0xd0000000, data lng 4 00000122
+        prop-int2 = <0x00000001 0x00000002>;
+        subsubnode {
+            // Unknown tag ignored: 0xd0000000, data lng 4 00000123
+            prop-int = <0x00000001 0x00000002>;
+        };
+        // Unknown tag ignored: 0xd0000000, data lng 4 00000124
+    };
+    // Unknown tag ignored: 0xf0000000, data lng 5 1414141414
+};
+// Unknown tag ignored: 0xd0000000, data lng 4 00000002
+// Unknown tag ignored: 0xf0000000, data lng 2 0303
diff --git a/tests/unknown_tags_can_skip.fdtput.test.dtb.3.expect b/tests/unknown_tags_can_skip.fdtput.test.dtb.3.expect
new file mode 100644
index 0000000..d12ce6f
--- /dev/null
+++ b/tests/unknown_tags_can_skip.fdtput.test.dtb.3.expect
@@ -0,0 +1,35 @@
+/dts-v1/;
+// version:		17
+// last_comp_version:	16
+
+// Unknown tag ignored: 0xd0000000, data lng 4 00000001
+/ {
+    // Unknown tag ignored: 0xc0000000, data lng 0
+    prop-int = <0x00000001>;
+    // Unknown tag ignored: 0xd0000000, data lng 4 00000011
+    prop-str = "abcd";
+    // Unknown tag ignored: 0xe0000000, data lng 8 0000001200000012
+    // Unknown tag ignored: 0xf0000000, data lng 3 131313
+    tst-fdtput {
+        n2 {
+        };
+    };
+    subnode1 {
+        prop-int = <0x00000001 0x00000002>;
+        // Unknown tag ignored: 0xc0000000, data lng 0
+    };
+    subnode2 {
+        // Unknown tag ignored: 0xd0000000, data lng 4 00000121
+        prop-int1 = <0x00000001 0x00000002>;
+        // Unknown tag ignored: 0xd0000000, data lng 4 00000122
+        prop-int2 = <0x00000001 0x00000002>;
+        subsubnode {
+            // Unknown tag ignored: 0xd0000000, data lng 4 00000123
+            prop-int = <0x00000001 0x00000002>;
+        };
+        // Unknown tag ignored: 0xd0000000, data lng 4 00000124
+    };
+    // Unknown tag ignored: 0xf0000000, data lng 5 1414141414
+};
+// Unknown tag ignored: 0xd0000000, data lng 4 00000002
+// Unknown tag ignored: 0xf0000000, data lng 2 0303
diff --git a/tests/unknown_tags_can_skip.fdtput.test.dtb.4.expect b/tests/unknown_tags_can_skip.fdtput.test.dtb.4.expect
new file mode 100644
index 0000000..bb40346
--- /dev/null
+++ b/tests/unknown_tags_can_skip.fdtput.test.dtb.4.expect
@@ -0,0 +1,34 @@
+/dts-v1/;
+// version:		17
+// last_comp_version:	16
+
+// Unknown tag ignored: 0xd0000000, data lng 4 00000001
+/ {
+    // Unknown tag ignored: 0xc0000000, data lng 0
+    prop-int = <0x00000001>;
+    // Unknown tag ignored: 0xd0000000, data lng 4 00000011
+    // [NOP]
+    // [NOP]
+    // [NOP]
+    // [NOP]
+    // [NOP]
+    // [NOP]
+    subnode1 {
+        prop-int = <0x00000001 0x00000002>;
+        // Unknown tag ignored: 0xc0000000, data lng 0
+    };
+    subnode2 {
+        // Unknown tag ignored: 0xd0000000, data lng 4 00000121
+        prop-int1 = <0x00000001 0x00000002>;
+        // Unknown tag ignored: 0xd0000000, data lng 4 00000122
+        prop-int2 = <0x00000001 0x00000002>;
+        subsubnode {
+            // Unknown tag ignored: 0xd0000000, data lng 4 00000123
+            prop-int = <0x00000001 0x00000002>;
+        };
+        // Unknown tag ignored: 0xd0000000, data lng 4 00000124
+    };
+    // Unknown tag ignored: 0xf0000000, data lng 5 1414141414
+};
+// Unknown tag ignored: 0xd0000000, data lng 4 00000002
+// Unknown tag ignored: 0xf0000000, data lng 2 0303
diff --git a/tests/unknown_tags_can_skip.fdtput.test.dtb.5.expect b/tests/unknown_tags_can_skip.fdtput.test.dtb.5.expect
new file mode 100644
index 0000000..5a5e574
--- /dev/null
+++ b/tests/unknown_tags_can_skip.fdtput.test.dtb.5.expect
@@ -0,0 +1,32 @@
+/dts-v1/;
+// version:		17
+// last_comp_version:	16
+
+// Unknown tag ignored: 0xd0000000, data lng 4 00000001
+/ {
+    // Unknown tag ignored: 0xc0000000, data lng 0
+    prop-int = <0x00000001>;
+    // Unknown tag ignored: 0xd0000000, data lng 4 00000011
+    prop-str = "abcd";
+    // Unknown tag ignored: 0xe0000000, data lng 8 0000001200000012
+    // Unknown tag ignored: 0xf0000000, data lng 3 131313
+    subnode1 {
+        prop-int = <0x00000001 0x00000002>;
+        // Unknown tag ignored: 0xc0000000, data lng 0
+    };
+    subnode2 {
+        // Unknown tag ignored: 0xd0000000, data lng 4 00000121
+        prop-tst-fdtput = "Test fdtput";
+        prop-int1 = <0x00000001 0x00000002>;
+        // Unknown tag ignored: 0xd0000000, data lng 4 00000122
+        prop-int2 = <0x00000001 0x00000002>;
+        subsubnode {
+            // Unknown tag ignored: 0xd0000000, data lng 4 00000123
+            prop-int = <0x00000001 0x00000002>;
+        };
+        // Unknown tag ignored: 0xd0000000, data lng 4 00000124
+    };
+    // Unknown tag ignored: 0xf0000000, data lng 5 1414141414
+};
+// Unknown tag ignored: 0xd0000000, data lng 4 00000002
+// Unknown tag ignored: 0xf0000000, data lng 2 0303
diff --git a/tests/unknown_tags_can_skip.fdtput.test.dtb.6.expect b/tests/unknown_tags_can_skip.fdtput.test.dtb.6.expect
new file mode 100644
index 0000000..f62c1e1
--- /dev/null
+++ b/tests/unknown_tags_can_skip.fdtput.test.dtb.6.expect
@@ -0,0 +1,27 @@
+/dts-v1/;
+// version:		17
+// last_comp_version:	16
+
+// Unknown tag ignored: 0xd0000000, data lng 4 00000001
+/ {
+    // Unknown tag ignored: 0xc0000000, data lng 0
+    prop-int = <0x00000001>;
+    // Unknown tag ignored: 0xd0000000, data lng 4 00000011
+    prop-str = "abcd";
+    // Unknown tag ignored: 0xe0000000, data lng 8 0000001200000012
+    // Unknown tag ignored: 0xf0000000, data lng 3 131313
+    subnode1 {
+        prop-int = <0x00000001 0x00000002>;
+        // Unknown tag ignored: 0xc0000000, data lng 0
+    };
+    subnode2 {
+        // Unknown tag ignored: 0xd0000000, data lng 4 00000121
+        prop-int1 = <0x00000001 0x00000002>;
+        // Unknown tag ignored: 0xd0000000, data lng 4 00000122
+        prop-int2 = <0x00000001 0x00000002>;
+        // Unknown tag ignored: 0xd0000000, data lng 4 00000124
+    };
+    // Unknown tag ignored: 0xf0000000, data lng 5 1414141414
+};
+// Unknown tag ignored: 0xd0000000, data lng 4 00000002
+// Unknown tag ignored: 0xf0000000, data lng 2 0303
-- 
2.52.0

