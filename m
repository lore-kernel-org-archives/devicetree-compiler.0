Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40E13C9457;
	Thu,  9 Apr 2026 11:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775735710; cv=none; b=cXeKXSDLebuA3RMRuqNZRGIR4E8CVhJUvDnljRfLJ7zeYMastrX6hF7yREHYQh1/wvIFf7kZ4wg0P51q4Q/3qDkXq6yQrqFlgrK1oVKJbvvrn0chChnqrERbzDQ7iYaOXzAz03LbG2olmLLi0Wc7jAfkYxBMCjofQTW/HOSgHRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775735710; c=relaxed/simple;
	bh=L82W4Eu6y6lDE5s18WGDfIcF+aCDv+5DNDlRoAhPXqg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZqvDA+NPpXBhw33+WR8gF8GISYHr3ZBzsY75xFZcG9c97pf10/D7s8bHO5CNChKwPN18BL/QgmSaTi6AmKcqA4KyR3ZJrdBzElks42tK02g5ssRrx6nbH138r8rvTQC4cYu6kjWzGE4/OxCrdMvzgtsJE1nQ9acaNOjelJZ1qlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=atCjt5Fx; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="atCjt5Fx"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 265C8C5996A;
	Thu,  9 Apr 2026 11:55:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 757045FDEB;
	Thu,  9 Apr 2026 11:55:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8AE5B104500B4;
	Thu,  9 Apr 2026 13:55:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775735706; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=up54uMduW4UjR6tPSbc9Ao5p34Yq/yxwDEzy0yOQ85Q=;
	b=atCjt5FxOvO7N7p0tXLUSlDkMW5/zw4GzmpGNnWlt+xCQxFOdl7U7w7Ed7X1bB4kd1uF7r
	4VC/FTNVBm+OSA/vXKNsPT7s9UKimGpx0PAB3Blkm/VuaiD6/fJxpAchL9Zy1Croz2djWn
	F2fl2dKM+rfmuxUQr3EUueS/3XeKH6tj58RQwedN8Q/Ma/lzR0kDwWmXTtTD5DDPrLbeAU
	nYZaQjm9JdAozqaQ2dIhaYnE5JZ0PyMPnut6cXRJCbSS0c5E14Qt7yI1kNAGxrdMTJ+tgB
	zQlXnfD1/yE8RIxDzEybc/NOKNaEhs1ufWT/OeRMINhKcqlYzpQKvqgo8fvDOg==
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
Subject: [PATCH v2 09/10] libfdt: Handle unknown tags on dtb modifications
Date: Thu,  9 Apr 2026 13:54:25 +0200
Message-ID: <20260409115426.352214-10-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260409115426.352214-1-herve.codina@bootlin.com>
References: <20260409115426.352214-1-herve.codina@bootlin.com>
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
    FDT_BEGIN_NODE or after the last FDT_END_NODE) is a global tag
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
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
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
index 48ac6fa..1ba937d 100755
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
index 0000000..3cdf448
--- /dev/null
+++ b/tests/unknown_tags_can_skip.fdtput.test.dtb.0.expect
@@ -0,0 +1,31 @@
+/dts-v1/;
+// version:		4294967295
+// last_comp_version:	16
+
+// Unknown tag ignored: 0xd0000000, data len 4 00000001
+/ {
+    // Unknown tag ignored: 0xc0000000, data len 0
+    prop-int = <0x00003201>;
+    // Unknown tag ignored: 0xd0000000, data len 4 00000110
+    prop-str = "abcd";
+    // Unknown tag ignored: 0xe0000000, data len 8 0000012000000121
+    // Unknown tag ignored: 0xf0000000, data len 3 101112
+    subnode1 {
+        prop-int = <0x00006401 0x00006402>;
+        // Unknown tag ignored: 0xc0000000, data len 0
+    };
+    subnode2 {
+        // Unknown tag ignored: 0xd0000000, data len 4 00000121
+        prop-int1 = <0x00064020 0x00064021>;
+        // Unknown tag ignored: 0xe0000000, data len 8 0000122000001221
+        prop-int2 = <0x00032022>;
+        subsubnode {
+            // Unknown tag ignored: 0xe0000000, data len 8 0000123000001231
+            prop-int = <0x00064023 0x00064024>;
+        };
+        // Unknown tag ignored: 0xf0000000, data len 3 212223
+    };
+    // Unknown tag ignored: 0xf0000000, data len 5 3132333435
+};
+// Unknown tag ignored: 0xd0000000, data len 4 00000002
+// Unknown tag ignored: 0xf0000000, data len 2 4041
diff --git a/tests/unknown_tags_can_skip.fdtput.test.dtb.1.expect b/tests/unknown_tags_can_skip.fdtput.test.dtb.1.expect
new file mode 100644
index 0000000..71f2d1c
--- /dev/null
+++ b/tests/unknown_tags_can_skip.fdtput.test.dtb.1.expect
@@ -0,0 +1,35 @@
+/dts-v1/;
+// version:		17
+// last_comp_version:	16
+
+// Unknown tag ignored: 0xd0000000, data len 4 00000001
+/ {
+    // Unknown tag ignored: 0xc0000000, data len 0
+    prop-int = <0x00003201>;
+    // Unknown tag ignored: 0xd0000000, data len 4 00000110
+    prop-str = "vwxyz";
+    // [NOP]
+    // [NOP]
+    // [NOP]
+    // [NOP]
+    // [NOP]
+    // [NOP]
+    subnode1 {
+        prop-int = <0x00006401 0x00006402>;
+        // Unknown tag ignored: 0xc0000000, data len 0
+    };
+    subnode2 {
+        // Unknown tag ignored: 0xd0000000, data len 4 00000121
+        prop-int1 = <0x00064020 0x00064021>;
+        // Unknown tag ignored: 0xe0000000, data len 8 0000122000001221
+        prop-int2 = <0x00032022>;
+        subsubnode {
+            // Unknown tag ignored: 0xe0000000, data len 8 0000123000001231
+            prop-int = <0x00064023 0x00064024>;
+        };
+        // Unknown tag ignored: 0xf0000000, data len 3 212223
+    };
+    // Unknown tag ignored: 0xf0000000, data len 5 3132333435
+};
+// Unknown tag ignored: 0xd0000000, data len 4 00000002
+// Unknown tag ignored: 0xf0000000, data len 2 4041
diff --git a/tests/unknown_tags_can_skip.fdtput.test.dtb.2.expect b/tests/unknown_tags_can_skip.fdtput.test.dtb.2.expect
new file mode 100644
index 0000000..bd3a13b
--- /dev/null
+++ b/tests/unknown_tags_can_skip.fdtput.test.dtb.2.expect
@@ -0,0 +1,33 @@
+/dts-v1/;
+// version:		17
+// last_comp_version:	16
+
+// Unknown tag ignored: 0xd0000000, data len 4 00000001
+/ {
+    // Unknown tag ignored: 0xc0000000, data len 0
+    prop-int = <0x00003201>;
+    // Unknown tag ignored: 0xd0000000, data len 4 00000110
+    prop-str = "abcd";
+    // Unknown tag ignored: 0xe0000000, data len 8 0000012000000121
+    // Unknown tag ignored: 0xf0000000, data len 3 101112
+    tst-fdtput {
+    };
+    subnode1 {
+        prop-int = <0x00006401 0x00006402>;
+        // Unknown tag ignored: 0xc0000000, data len 0
+    };
+    subnode2 {
+        // Unknown tag ignored: 0xd0000000, data len 4 00000121
+        prop-int1 = <0x00064020 0x00064021>;
+        // Unknown tag ignored: 0xe0000000, data len 8 0000122000001221
+        prop-int2 = <0x00032022>;
+        subsubnode {
+            // Unknown tag ignored: 0xe0000000, data len 8 0000123000001231
+            prop-int = <0x00064023 0x00064024>;
+        };
+        // Unknown tag ignored: 0xf0000000, data len 3 212223
+    };
+    // Unknown tag ignored: 0xf0000000, data len 5 3132333435
+};
+// Unknown tag ignored: 0xd0000000, data len 4 00000002
+// Unknown tag ignored: 0xf0000000, data len 2 4041
diff --git a/tests/unknown_tags_can_skip.fdtput.test.dtb.3.expect b/tests/unknown_tags_can_skip.fdtput.test.dtb.3.expect
new file mode 100644
index 0000000..237eb95
--- /dev/null
+++ b/tests/unknown_tags_can_skip.fdtput.test.dtb.3.expect
@@ -0,0 +1,35 @@
+/dts-v1/;
+// version:		17
+// last_comp_version:	16
+
+// Unknown tag ignored: 0xd0000000, data len 4 00000001
+/ {
+    // Unknown tag ignored: 0xc0000000, data len 0
+    prop-int = <0x00003201>;
+    // Unknown tag ignored: 0xd0000000, data len 4 00000110
+    prop-str = "abcd";
+    // Unknown tag ignored: 0xe0000000, data len 8 0000012000000121
+    // Unknown tag ignored: 0xf0000000, data len 3 101112
+    tst-fdtput {
+        n2 {
+        };
+    };
+    subnode1 {
+        prop-int = <0x00006401 0x00006402>;
+        // Unknown tag ignored: 0xc0000000, data len 0
+    };
+    subnode2 {
+        // Unknown tag ignored: 0xd0000000, data len 4 00000121
+        prop-int1 = <0x00064020 0x00064021>;
+        // Unknown tag ignored: 0xe0000000, data len 8 0000122000001221
+        prop-int2 = <0x00032022>;
+        subsubnode {
+            // Unknown tag ignored: 0xe0000000, data len 8 0000123000001231
+            prop-int = <0x00064023 0x00064024>;
+        };
+        // Unknown tag ignored: 0xf0000000, data len 3 212223
+    };
+    // Unknown tag ignored: 0xf0000000, data len 5 3132333435
+};
+// Unknown tag ignored: 0xd0000000, data len 4 00000002
+// Unknown tag ignored: 0xf0000000, data len 2 4041
diff --git a/tests/unknown_tags_can_skip.fdtput.test.dtb.4.expect b/tests/unknown_tags_can_skip.fdtput.test.dtb.4.expect
new file mode 100644
index 0000000..8473040
--- /dev/null
+++ b/tests/unknown_tags_can_skip.fdtput.test.dtb.4.expect
@@ -0,0 +1,34 @@
+/dts-v1/;
+// version:		17
+// last_comp_version:	16
+
+// Unknown tag ignored: 0xd0000000, data len 4 00000001
+/ {
+    // Unknown tag ignored: 0xc0000000, data len 0
+    prop-int = <0x00003201>;
+    // Unknown tag ignored: 0xd0000000, data len 4 00000110
+    // [NOP]
+    // [NOP]
+    // [NOP]
+    // [NOP]
+    // [NOP]
+    // [NOP]
+    subnode1 {
+        prop-int = <0x00006401 0x00006402>;
+        // Unknown tag ignored: 0xc0000000, data len 0
+    };
+    subnode2 {
+        // Unknown tag ignored: 0xd0000000, data len 4 00000121
+        prop-int1 = <0x00064020 0x00064021>;
+        // Unknown tag ignored: 0xe0000000, data len 8 0000122000001221
+        prop-int2 = <0x00032022>;
+        subsubnode {
+            // Unknown tag ignored: 0xe0000000, data len 8 0000123000001231
+            prop-int = <0x00064023 0x00064024>;
+        };
+        // Unknown tag ignored: 0xf0000000, data len 3 212223
+    };
+    // Unknown tag ignored: 0xf0000000, data len 5 3132333435
+};
+// Unknown tag ignored: 0xd0000000, data len 4 00000002
+// Unknown tag ignored: 0xf0000000, data len 2 4041
diff --git a/tests/unknown_tags_can_skip.fdtput.test.dtb.5.expect b/tests/unknown_tags_can_skip.fdtput.test.dtb.5.expect
new file mode 100644
index 0000000..f7806f4
--- /dev/null
+++ b/tests/unknown_tags_can_skip.fdtput.test.dtb.5.expect
@@ -0,0 +1,32 @@
+/dts-v1/;
+// version:		17
+// last_comp_version:	16
+
+// Unknown tag ignored: 0xd0000000, data len 4 00000001
+/ {
+    // Unknown tag ignored: 0xc0000000, data len 0
+    prop-int = <0x00003201>;
+    // Unknown tag ignored: 0xd0000000, data len 4 00000110
+    prop-str = "abcd";
+    // Unknown tag ignored: 0xe0000000, data len 8 0000012000000121
+    // Unknown tag ignored: 0xf0000000, data len 3 101112
+    subnode1 {
+        prop-int = <0x00006401 0x00006402>;
+        // Unknown tag ignored: 0xc0000000, data len 0
+    };
+    subnode2 {
+        // Unknown tag ignored: 0xd0000000, data len 4 00000121
+        prop-tst-fdtput = "Test fdtput";
+        prop-int1 = <0x00064020 0x00064021>;
+        // Unknown tag ignored: 0xe0000000, data len 8 0000122000001221
+        prop-int2 = <0x00032022>;
+        subsubnode {
+            // Unknown tag ignored: 0xe0000000, data len 8 0000123000001231
+            prop-int = <0x00064023 0x00064024>;
+        };
+        // Unknown tag ignored: 0xf0000000, data len 3 212223
+    };
+    // Unknown tag ignored: 0xf0000000, data len 5 3132333435
+};
+// Unknown tag ignored: 0xd0000000, data len 4 00000002
+// Unknown tag ignored: 0xf0000000, data len 2 4041
diff --git a/tests/unknown_tags_can_skip.fdtput.test.dtb.6.expect b/tests/unknown_tags_can_skip.fdtput.test.dtb.6.expect
new file mode 100644
index 0000000..029f3b4
--- /dev/null
+++ b/tests/unknown_tags_can_skip.fdtput.test.dtb.6.expect
@@ -0,0 +1,27 @@
+/dts-v1/;
+// version:		17
+// last_comp_version:	16
+
+// Unknown tag ignored: 0xd0000000, data len 4 00000001
+/ {
+    // Unknown tag ignored: 0xc0000000, data len 0
+    prop-int = <0x00003201>;
+    // Unknown tag ignored: 0xd0000000, data len 4 00000110
+    prop-str = "abcd";
+    // Unknown tag ignored: 0xe0000000, data len 8 0000012000000121
+    // Unknown tag ignored: 0xf0000000, data len 3 101112
+    subnode1 {
+        prop-int = <0x00006401 0x00006402>;
+        // Unknown tag ignored: 0xc0000000, data len 0
+    };
+    subnode2 {
+        // Unknown tag ignored: 0xd0000000, data len 4 00000121
+        prop-int1 = <0x00064020 0x00064021>;
+        // Unknown tag ignored: 0xe0000000, data len 8 0000122000001221
+        prop-int2 = <0x00032022>;
+        // Unknown tag ignored: 0xf0000000, data len 3 212223
+    };
+    // Unknown tag ignored: 0xf0000000, data len 5 3132333435
+};
+// Unknown tag ignored: 0xd0000000, data len 4 00000002
+// Unknown tag ignored: 0xf0000000, data len 2 4041
-- 
2.53.0

