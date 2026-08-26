Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D2B3BED11;
	Wed, 26 Aug 2026 08:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787733193; cv=none; b=toB3FVZzuWZg2omBOpQ4Pn3Ys54G6ixjnR+DRPXbdRRB08Axg9/QXXNWXwMI3dEHQuh7LKKqBMg6TKISg6s2kjhHvtj2rNarV+VKx7PxeWWc8VLmI0e6s5rIe7gK2fBy1vgRv9hx8TIJb+KQxC/xefmTlQqOWdaBuowo46fLi/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787733193; c=relaxed/simple;
	bh=Y45M0QfxTOT6Od7P03ZxgLhowajbdMXNWUmNq65PXtM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KqOLfNMItO/Q+cRX8SLmxbV2cUyT65Dtv0uhgAgjCbMimfUmqCSPdehX2bGBHVVUGdD7cTKCdiupXizL39HT5RuUwqKN2lbmPzX8nE/dZOnwhWJT09B2xssb4NqTxpLHErGYoyGmFuJz1Ip6BMd8zFKwcomeUHigFpBPF7MIuXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=pNRNZ0HS; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="pNRNZ0HS"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B02A01A184E;
	Wed, 26 Aug 2026 08:33:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 840B1604EC;
	Wed, 26 Aug 2026 08:33:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D022711C7AC83;
	Wed, 26 Aug 2026 10:33:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787733187; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=df6wW/P50wnQy16r3BTZ8VpoEcM/jXRMcu40sgw4tww=;
	b=pNRNZ0HSmpKB5UYtayvFIo4jPh9f90aqbxuslWrYFYZVYe0g1L44ARvgpDl5zB8WuN+Y9H
	x/tQ3gotyMfqzpKZj0O3jP37JAuY2+tsedxJkRmCzOADPZKgh77RZe/ZmQBPOBWlEvmTGh
	nPYjf8enSggZP47TvK94WNu9InJtnjEvVYM8ZJyB+YHOty09jr1NZuL9Z257Je7CYsUee9
	2xeYSkepHhPs5AV+jxzdpt3dTxbuI4n7aaOw1PjZTjTZwHF0Q4lwVBU5/rcy8Fv2Zw5YZN
	iouuWiJhC/4y7YPwqFEP8f2EYaG/iNvgPuM2xkPUojBJN58ZTl50nBGunux4CQ==
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
	Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH v3 14/15] libfdt: Handle unknown tags on dtb modifications
Date: Wed, 26 Aug 2026 10:31:45 +0200
Message-ID: <20260826083146.304291-15-herve.codina@bootlin.com>
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
 libfdt/fdt_rw.c                               | 129 +++++++++++++++++-
 libfdt/fdt_wip.c                              |  28 +++-
 libfdt/libfdt_internal.h                      |   3 +
 tests/run_tests.sh                            |  78 +++++++++++
 ...own_tags_can_skip.fdtput.test.dtb.0.expect |  31 +++++
 ...own_tags_can_skip.fdtput.test.dtb.1.expect |  35 +++++
 ...own_tags_can_skip.fdtput.test.dtb.2.expect |  33 +++++
 ...own_tags_can_skip.fdtput.test.dtb.3.expect |  35 +++++
 ...own_tags_can_skip.fdtput.test.dtb.4.expect |  34 +++++
 ...own_tags_can_skip.fdtput.test.dtb.5.expect |  32 +++++
 ...own_tags_can_skip.fdtput.test.dtb.6.expect |  27 ++++
 ...nknown_tags_can_skip.wip.test.dtb.0.expect |  31 +++++
 ...nknown_tags_can_skip.wip.test.dtb.1.expect |  35 +++++
 ...nknown_tags_can_skip.wip.test.dtb.2.expect |  37 +++++
 ...nknown_tags_can_skip.wip.test.dtb.3.expect |  38 ++++++
 15 files changed, 603 insertions(+), 3 deletions(-)
 create mode 100644 tests/unknown_tags_can_skip.fdtput.test.dtb.0.expect
 create mode 100644 tests/unknown_tags_can_skip.fdtput.test.dtb.1.expect
 create mode 100644 tests/unknown_tags_can_skip.fdtput.test.dtb.2.expect
 create mode 100644 tests/unknown_tags_can_skip.fdtput.test.dtb.3.expect
 create mode 100644 tests/unknown_tags_can_skip.fdtput.test.dtb.4.expect
 create mode 100644 tests/unknown_tags_can_skip.fdtput.test.dtb.5.expect
 create mode 100644 tests/unknown_tags_can_skip.fdtput.test.dtb.6.expect
 create mode 100644 tests/unknown_tags_can_skip.wip.test.dtb.0.expect
 create mode 100644 tests/unknown_tags_can_skip.wip.test.dtb.1.expect
 create mode 100644 tests/unknown_tags_can_skip.wip.test.dtb.2.expect
 create mode 100644 tests/unknown_tags_can_skip.wip.test.dtb.3.expect

diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
index ceef49b8..87776609 100644
--- a/libfdt/fdt_rw.c
+++ b/libfdt/fdt_rw.c
@@ -197,10 +197,69 @@ int fdt_del_mem_rsv(void *fdt, int n)
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
+int fdt_prop_remove_unknown_tags(void *fdt, bool force_inplace,
+				 int prop_offset, bool downgrade_version)
+{
+	int nextoffset, offset;
+	bool is_unknown;
+	uint32_t tag;
+
+	/*
+	 * Only inplace using nopify is supported even if we could use an other
+	 * method involving splices if force_inplace is set to false.
+	 */
+
+	tag = fdt_next_tag(fdt, prop_offset, &nextoffset);
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
 {
+	int prop_offset;
 	int oldlen;
 	int err;
 
@@ -209,6 +268,15 @@ static int fdt_resize_property_(void *fdt, int nodeoffset,
 	if (!*prop)
 		return oldlen;
 
+	/*
+	 * The property is resized. Remove possible unknown tags related to the
+	 * property downgrading the dtb version.
+	 */
+	prop_offset = fdt_ptr_offset_(fdt, *prop);
+	err = fdt_prop_remove_unknown_tags(fdt, false, prop_offset, true);
+	if (err)
+		return err;
+
 	if ((err = fdt_splice_struct_(fdt, (*prop)->data, FDT_TAGALIGN(oldlen),
 				      FDT_TAGALIGN(len))))
 		return err;
@@ -217,6 +285,29 @@ static int fdt_resize_property_(void *fdt, int nodeoffset,
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
@@ -235,6 +326,15 @@ static int fdt_add_property_(void *fdt, int nodeoffset, const char *name,
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
@@ -333,11 +433,22 @@ int fdt_appendprop(void *fdt, int nodeoffset, const char *name,
 {
 	struct fdt_property *prop;
 	int err, oldlen, newlen;
+	int prop_offset;
 
 	FDT_RW_PROBE(fdt);
 
 	prop = fdt_get_property_w(fdt, nodeoffset, name, &oldlen);
 	if (prop) {
+		/*
+		 * The property is going to be modified. Remove possible unknown
+		 * tags related to this property downgrading the dtb version.
+		 */
+		prop_offset = fdt_ptr_offset_(fdt, prop);
+		err = fdt_prop_remove_unknown_tags(fdt, false, prop_offset,
+						   true);
+		if (err)
+			return err;
+
 		newlen = len + oldlen;
 		err = fdt_splice_struct_(fdt, prop->data,
 					 FDT_TAGALIGN(oldlen),
@@ -360,6 +471,8 @@ int fdt_delprop(void *fdt, int nodeoffset, const char *name)
 {
 	struct fdt_property *prop;
 	int len, proplen;
+	int prop_offset;
+	int err;
 
 	FDT_RW_PROBE(fdt);
 
@@ -367,6 +480,15 @@ int fdt_delprop(void *fdt, int nodeoffset, const char *name)
 	if (!prop)
 		return len;
 
+	/*
+	 * The property is going to be removed. Remove also possible unknown
+	 * tags related to this property. Keep the dtb version unchanged.
+	 */
+	prop_offset = fdt_ptr_offset_(fdt, prop);
+	err = fdt_prop_remove_unknown_tags(fdt, false, prop_offset, false);
+	if (err)
+		return err;
+
 	proplen = sizeof(*prop) + FDT_TAGALIGN(len);
 	return fdt_splice_struct_(fdt, prop, proplen, 0);
 }
@@ -395,7 +517,12 @@ int fdt_add_subnode_namelen(void *fdt, int parentoffset,
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
diff --git a/libfdt/fdt_wip.c b/libfdt/fdt_wip.c
index c2d7566a..7ca3ffbc 100644
--- a/libfdt/fdt_wip.c
+++ b/libfdt/fdt_wip.c
@@ -15,17 +15,30 @@ int fdt_setprop_inplace_namelen_partial(void *fdt, int nodeoffset,
 					uint32_t idx, const void *val,
 					int len)
 {
+	int prop_offset;
 	void *propval;
 	int proplen;
+	int err;
 
-	propval = fdt_getprop_namelen_w(fdt, nodeoffset, name, namelen,
-					&proplen);
+	prop_offset = fdt_getprop_offset_namelen(fdt, nodeoffset, name, namelen);
+	if (prop_offset < 0)
+		return prop_offset;
+
+	propval = fdt_getprop_by_offset_w(fdt, prop_offset, NULL, &proplen);
 	if (!propval)
 		return proplen;
 
 	if ((unsigned)proplen < (len + idx))
 		return -FDT_ERR_NOSPACE;
 
+	/*
+	 * Remove unknown tags related to the property downgrading the dtb
+	 * version.
+	 */
+	err = fdt_prop_remove_unknown_tags(fdt, true, prop_offset, true);
+	if (err)
+		return err;
+
 	memcpy((char *)propval + idx, val, len);
 	return 0;
 }
@@ -59,12 +72,23 @@ static void fdt_nop_region_(void *start, int len)
 int fdt_nop_property(void *fdt, int nodeoffset, const char *name)
 {
 	struct fdt_property *prop;
+	int prop_offset;
 	int len;
+	int err;
 
 	prop = fdt_get_property_w(fdt, nodeoffset, name, &len);
 	if (!prop)
 		return len;
 
+	/*
+	 * The property is going to be removed (nopified). Remove unknown tags
+	 * related to this property. Keep the dtb version unchanged.
+	 */
+	prop_offset = fdt_ptr_offset_(fdt, prop);
+	err = fdt_prop_remove_unknown_tags(fdt, true, prop_offset, false);
+	if (err)
+		return err;
+
 	fdt_nop_region_(prop, len + sizeof(*prop));
 
 	return 0;
diff --git a/libfdt/libfdt_internal.h b/libfdt/libfdt_internal.h
index e3923629..ce128fda 100644
--- a/libfdt/libfdt_internal.h
+++ b/libfdt/libfdt_internal.h
@@ -26,6 +26,9 @@ uint32_t fdt_next_tag_(const void *fdt, int startoffset, int *nextoffset,
 int fdt_check_node_offset_(const void *fdt, int offset);
 int fdt_check_prop_offset_(const void *fdt, int offset);
 
+int fdt_prop_remove_unknown_tags(void *fdt, bool force_inplace,
+				 int prop_offset, bool downgrade_version);
+
 int fdt_getprop_offset_namelen(const void *fdt, int nodeoffset,
 			       const char *name, int namelen);
 static inline int fdt_getprop_offset(const void *fdt, int nodeoffset,
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 419a24d8..980ed6a0 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -586,6 +586,34 @@ libfdt_tests () {
 		unknown_tags_no_skip.dtb; do
 	run_test check_full -n $bad
     done
+
+    # Check inplace modification with "unknown" tags that can be skipped
+    dtb=unknown_tags_can_skip.wip.test.dtb
+    cp unknown_tags_can_skip.dtb $dtb
+    base_run_test wrap_fdtdump $dtb $dtb.0.out
+    # Remove unneeded header fields (keep those related to versions)
+    sed -i '/^\/.*\(magic\|off\|size\|cpu\)/d' $dtb.0.out
+    base_run_test check_diff $dtb.0.out "$SRCDIR/$dtb.0.expect"
+
+    run_test wip_func $dtb set_prop / prop-str 0 "vwxy"
+    base_run_test wrap_fdtdump $dtb $dtb.1.out
+    # Remove unneeded header fields (keep those related to versions)
+    sed -i '/^\/.*\(magic\|off\|size\|cpu\)/d' $dtb.1.out
+    base_run_test check_diff $dtb.1.out "$SRCDIR/$dtb.1.expect"
+
+    cp unknown_tags_can_skip.dtb $dtb
+    run_test wip_func $dtb nop_prop /subnode2 prop-int1
+    base_run_test wrap_fdtdump $dtb $dtb.2.out
+    # Remove unneeded header fields (keep those related to versions)
+    sed -i '/^\/.*\(magic\|off\|size\|cpu\)/d' $dtb.2.out
+    base_run_test check_diff $dtb.2.out "$SRCDIR/$dtb.2.expect"
+
+    cp unknown_tags_can_skip.dtb $dtb
+    run_test wip_func $dtb nop_node /subnode2/subsubnode
+    base_run_test wrap_fdtdump $dtb $dtb.3.out
+    # Remove unneeded header fields (keep those related to versions)
+    sed -i '/^\/.*\(magic\|off\|size\|cpu\)/d' $dtb.3.out
+    base_run_test check_diff $dtb.3.out "$SRCDIR/$dtb.3.expect"
 }
 
 dtc_tests () {
@@ -1045,6 +1073,56 @@ fdtput_tests () {
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
index 00000000..75883593
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
+            prop-bool;
+        };
+        // Unknown tag ignored: 0xf0000000, data len 3 212223
+    };
+    // Unknown tag ignored: 0xf0000000, data len 4 31323334
+};
+// Unknown tag ignored: 0xd0000000, data len 4 00000002
+// Unknown tag ignored: 0xf0000000, data len 2 4041
diff --git a/tests/unknown_tags_can_skip.fdtput.test.dtb.1.expect b/tests/unknown_tags_can_skip.fdtput.test.dtb.1.expect
new file mode 100644
index 00000000..b4d3ae29
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
+            prop-bool;
+        };
+        // Unknown tag ignored: 0xf0000000, data len 3 212223
+    };
+    // Unknown tag ignored: 0xf0000000, data len 4 31323334
+};
+// Unknown tag ignored: 0xd0000000, data len 4 00000002
+// Unknown tag ignored: 0xf0000000, data len 2 4041
diff --git a/tests/unknown_tags_can_skip.fdtput.test.dtb.2.expect b/tests/unknown_tags_can_skip.fdtput.test.dtb.2.expect
new file mode 100644
index 00000000..a196bed3
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
+            prop-bool;
+        };
+        // Unknown tag ignored: 0xf0000000, data len 3 212223
+    };
+    // Unknown tag ignored: 0xf0000000, data len 4 31323334
+};
+// Unknown tag ignored: 0xd0000000, data len 4 00000002
+// Unknown tag ignored: 0xf0000000, data len 2 4041
diff --git a/tests/unknown_tags_can_skip.fdtput.test.dtb.3.expect b/tests/unknown_tags_can_skip.fdtput.test.dtb.3.expect
new file mode 100644
index 00000000..52faa1dd
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
+            prop-bool;
+        };
+        // Unknown tag ignored: 0xf0000000, data len 3 212223
+    };
+    // Unknown tag ignored: 0xf0000000, data len 4 31323334
+};
+// Unknown tag ignored: 0xd0000000, data len 4 00000002
+// Unknown tag ignored: 0xf0000000, data len 2 4041
diff --git a/tests/unknown_tags_can_skip.fdtput.test.dtb.4.expect b/tests/unknown_tags_can_skip.fdtput.test.dtb.4.expect
new file mode 100644
index 00000000..1ddc694b
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
+            prop-bool;
+        };
+        // Unknown tag ignored: 0xf0000000, data len 3 212223
+    };
+    // Unknown tag ignored: 0xf0000000, data len 4 31323334
+};
+// Unknown tag ignored: 0xd0000000, data len 4 00000002
+// Unknown tag ignored: 0xf0000000, data len 2 4041
diff --git a/tests/unknown_tags_can_skip.fdtput.test.dtb.5.expect b/tests/unknown_tags_can_skip.fdtput.test.dtb.5.expect
new file mode 100644
index 00000000..f955ac1c
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
+            prop-bool;
+        };
+        // Unknown tag ignored: 0xf0000000, data len 3 212223
+    };
+    // Unknown tag ignored: 0xf0000000, data len 4 31323334
+};
+// Unknown tag ignored: 0xd0000000, data len 4 00000002
+// Unknown tag ignored: 0xf0000000, data len 2 4041
diff --git a/tests/unknown_tags_can_skip.fdtput.test.dtb.6.expect b/tests/unknown_tags_can_skip.fdtput.test.dtb.6.expect
new file mode 100644
index 00000000..59247478
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
+    // Unknown tag ignored: 0xf0000000, data len 4 31323334
+};
+// Unknown tag ignored: 0xd0000000, data len 4 00000002
+// Unknown tag ignored: 0xf0000000, data len 2 4041
diff --git a/tests/unknown_tags_can_skip.wip.test.dtb.0.expect b/tests/unknown_tags_can_skip.wip.test.dtb.0.expect
new file mode 100644
index 00000000..75883593
--- /dev/null
+++ b/tests/unknown_tags_can_skip.wip.test.dtb.0.expect
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
+            prop-bool;
+        };
+        // Unknown tag ignored: 0xf0000000, data len 3 212223
+    };
+    // Unknown tag ignored: 0xf0000000, data len 4 31323334
+};
+// Unknown tag ignored: 0xd0000000, data len 4 00000002
+// Unknown tag ignored: 0xf0000000, data len 2 4041
diff --git a/tests/unknown_tags_can_skip.wip.test.dtb.1.expect b/tests/unknown_tags_can_skip.wip.test.dtb.1.expect
new file mode 100644
index 00000000..2a0dd4a0
--- /dev/null
+++ b/tests/unknown_tags_can_skip.wip.test.dtb.1.expect
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
+    prop-str = "vwxy";
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
+            prop-bool;
+        };
+        // Unknown tag ignored: 0xf0000000, data len 3 212223
+    };
+    // Unknown tag ignored: 0xf0000000, data len 4 31323334
+};
+// Unknown tag ignored: 0xd0000000, data len 4 00000002
+// Unknown tag ignored: 0xf0000000, data len 2 4041
diff --git a/tests/unknown_tags_can_skip.wip.test.dtb.2.expect b/tests/unknown_tags_can_skip.wip.test.dtb.2.expect
new file mode 100644
index 00000000..bc08885b
--- /dev/null
+++ b/tests/unknown_tags_can_skip.wip.test.dtb.2.expect
@@ -0,0 +1,37 @@
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
+        // [NOP]
+        // [NOP]
+        // [NOP]
+        // [NOP]
+        // [NOP]
+        // [NOP]
+        // [NOP]
+        // [NOP]
+        prop-int2 = <0x00032022>;
+        subsubnode {
+            // Unknown tag ignored: 0xe0000000, data len 8 0000123000001231
+            prop-bool;
+        };
+        // Unknown tag ignored: 0xf0000000, data len 3 212223
+    };
+    // Unknown tag ignored: 0xf0000000, data len 4 31323334
+};
+// Unknown tag ignored: 0xd0000000, data len 4 00000002
+// Unknown tag ignored: 0xf0000000, data len 2 4041
diff --git a/tests/unknown_tags_can_skip.wip.test.dtb.3.expect b/tests/unknown_tags_can_skip.wip.test.dtb.3.expect
new file mode 100644
index 00000000..aa6e9394
--- /dev/null
+++ b/tests/unknown_tags_can_skip.wip.test.dtb.3.expect
@@ -0,0 +1,38 @@
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
+        // [NOP]
+        // [NOP]
+        // [NOP]
+        // [NOP]
+        // [NOP]
+        // [NOP]
+        // [NOP]
+        // [NOP]
+        // [NOP]
+        // [NOP]
+        // [NOP]
+        // Unknown tag ignored: 0xf0000000, data len 3 212223
+    };
+    // Unknown tag ignored: 0xf0000000, data len 4 31323334
+};
+// Unknown tag ignored: 0xd0000000, data len 4 00000002
+// Unknown tag ignored: 0xf0000000, data len 2 4041
-- 
2.55.0

