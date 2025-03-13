Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A211F12F9
	for <devicetree-compiler@vger.kernel.org>; Thu, 13 Mar 2025 19:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741893375; cv=none; b=JpQ8P7MZNyMlztN8pJhN24gJOlpyzjuKnuuBnqivniH+A8dxqKEDw4Dt4dWDqnKiPjkRU+Nd2iWAzghCK/4kQ7oQbECqFPE05yyX2QZ/oC6nq1tUKcAr94inDZqqw3fgXyC2ykOjwP499ablke6KWRu+Q59Z0zuWin+hHy8peS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741893375; c=relaxed/simple;
	bh=dWnAxgtIgN+udZ6Vb/Cm3DsLqrHl6Dj60Yu9qII1FCY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=BehHoI/DTLATeJIe4P4iMWvkQ2kYKJGfDhymqxND6eNWWtHLfg+YHVj4HggSrupypDgxO6bDtSTcJEr/yQ9pdW0vA9W1WlcrH7upMDYfBkhnM/G0ZCmJb1eBHAiREfSPKZCnAZ2Oa9LO57L/0Msu9MxfTCbvSj2vD/FKjBTqZh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A2SADtbO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A2SADtbO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741893372;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=evCpHrLkLOdEZwO7R/owadsNgt7PlPYKyJ4TUTwfNVI=;
	b=A2SADtbOXnUPcEJH1K/zp54vjZPfemVCeVAo8ZA436xWx33MyU6inOdrIPjTewMOo+91yt
	KicPOUVmc4ERexaqiTU/eH54CDYQpFAEe0hI+/xyvXcg/57MDx6tTYSzz/VN6DgcJoP2jT
	QPNa8i89Ydc/EmlhuzRzIT/jnwx0TOI=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-112-TWPQs3BbOrK9DNMSE_O5GQ-1; Thu,
 13 Mar 2025 15:16:11 -0400
X-MC-Unique: TWPQs3BbOrK9DNMSE_O5GQ-1
X-Mimecast-MFC-AGG-ID: TWPQs3BbOrK9DNMSE_O5GQ_1741893370
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8453D1800260
	for <devicetree-compiler@vger.kernel.org>; Thu, 13 Mar 2025 19:16:10 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.45.224.26])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 74A821944EAA
	for <devicetree-compiler@vger.kernel.org>; Thu, 13 Mar 2025 19:16:09 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: devicetree-compiler@vger.kernel.org
Subject: [PATCH] Fix some typos
Date: Thu, 13 Mar 2025 20:16:07 +0100
Message-ID: <20250313191607.1556384-1-thuth@redhat.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Discovered with the "codespell" utility.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 README.license           | 2 +-
 dtc.c                    | 2 +-
 dtc.h                    | 2 +-
 flattree.c               | 2 +-
 libfdt/libfdt_internal.h | 4 ++--
 pylibfdt/libfdt.i        | 2 +-
 tests/comments.dts       | 2 +-
 tests/nopulate.c         | 2 +-
 tests/run_tests.sh       | 2 +-
 tests/testutils.c        | 6 +++---
 tests/utilfdt_test.c     | 2 +-
 11 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/README.license b/README.license
index 102b004..a4edc2b 100644
--- a/README.license
+++ b/README.license
@@ -28,7 +28,7 @@ tools.  Allowing libfdt to be used under the terms of the BSD license
 makes that it easier for vendors or authors of such software to do so.
 
 This does mean that libfdt code could be "stolen" - say, included in a
-proprietary fimware and extended without contributing those extensions
+proprietary firmware and extended without contributing those extensions
 back to the libfdt mainline.  While I hope that doesn't happen, I
 believe the goal of allowing libfdt to be widely used is more
 important than avoiding that.  libfdt is quite small, and hardly
diff --git a/dtc.c b/dtc.c
index beda8d5..b3445b7 100644
--- a/dtc.c
+++ b/dtc.c
@@ -15,7 +15,7 @@ int quiet;		/* Level of quietness */
 unsigned int reservenum;/* Number of memory reservation slots */
 int minsize;		/* Minimum blob size */
 int padsize;		/* Additional padding to blob */
-int alignsize;		/* Additional padding to blob accroding to the alignsize */
+int alignsize;		/* Additional padding to blob according to the alignsize */
 int phandle_format = PHANDLE_EPAPR;	/* Use linux,phandle or phandle properties */
 int generate_symbols;	/* enable symbols & fixup support */
 int generate_fixups;		/* suppress generation of fixups on symbol support */
diff --git a/dtc.h b/dtc.h
index 4c4aaca..9acf071 100644
--- a/dtc.h
+++ b/dtc.h
@@ -38,7 +38,7 @@ extern int quiet;		/* Level of quietness */
 extern unsigned int reservenum;	/* Number of memory reservation slots */
 extern int minsize;		/* Minimum blob size */
 extern int padsize;		/* Additional padding to blob */
-extern int alignsize;		/* Additional padding to blob accroding to the alignsize */
+extern int alignsize;		/* Additional padding to blob according to the alignsize */
 extern int phandle_format;	/* Use linux,phandle or phandle properties */
 extern int generate_symbols;	/* generate symbols for nodes with labels */
 extern int generate_fixups;	/* generate fixups */
diff --git a/flattree.c b/flattree.c
index 1bcd808..30e6de2 100644
--- a/flattree.c
+++ b/flattree.c
@@ -503,7 +503,7 @@ void dt_to_asm(FILE *f, struct dt_info *dti, int version)
 	 * Reserve map entries.
 	 * Align the reserve map to a doubleword boundary.
 	 * Each entry is an (address, size) pair of u64 values.
-	 * Always supply a zero-sized temination entry.
+	 * Always supply a zero-sized termination entry.
 	 */
 	asm_emit_align(f, 8);
 	emit_label(f, symprefix, "reserve_map");
diff --git a/libfdt/libfdt_internal.h b/libfdt/libfdt_internal.h
index 1fd35f3..773bba8 100644
--- a/libfdt/libfdt_internal.h
+++ b/libfdt/libfdt_internal.h
@@ -56,8 +56,8 @@ static inline struct fdt_reserve_entry *fdt_mem_rsv_w_(void *fdt, int n)
 }
 
 /*
- * Internal helpers to access tructural elements of the device tree
- * blob (rather than for exaple reading integers from within property
+ * Internal helpers to access structural elements of the device tree
+ * blob (rather than for example reading integers from within property
  * values).  We assume that we are either given a naturally aligned
  * address for the platform or if we are not, we are on a platform
  * where unaligned memory reads will be handled in a graceful manner.
diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
index bb9985c..1f9c047 100644
--- a/pylibfdt/libfdt.i
+++ b/pylibfdt/libfdt.i
@@ -162,7 +162,7 @@ class FdtRo(object):
             quiet: Errors to ignore (empty to raise on all errors)
 
         Returns:
-            Typle:
+            Tuple:
                 Offset of the next node, if any, else a -ve error
                 Depth of the returned node, if any, else undefined
 
diff --git a/tests/comments.dts b/tests/comments.dts
index 0b04b6b..d315d7f 100644
--- a/tests/comments.dts
+++ b/tests/comments.dts
@@ -25,7 +25,7 @@
 	prop7;
 	/* yet
 	 * another
-	 * multline
+	 * multiline
 	 * comment
 	 */
 	prop8;
diff --git a/tests/nopulate.c b/tests/nopulate.c
index e06a0b3..06f8369 100644
--- a/tests/nopulate.c
+++ b/tests/nopulate.c
@@ -65,7 +65,7 @@ int main(int argc, char *argv[])
 
 	verbose_printf("Nopulated structure block has new size %d\n", newsize);
 
-	/* Replace old strcutre block with the new */
+	/* Replace old structure block with the new */
 
 	fdt2 = xmalloc(fdt_totalsize(fdt) + newsize);
 
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index f0b51c0..fecfe7c 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -805,7 +805,7 @@ dtc_tests () {
     run_dtc_test -I dtb -O dts -o stdin_odts_test_tree1.dtb.test.dts - < test_tree1.dtb
     run_wrap_test cmp stdin_odts_test_tree1.dtb.test.dts odts_test_tree1.dtb.test.dts
 
-    # Check integer expresisons
+    # Check integer expressions
     run_test integer-expressions -g integer-expressions.test.dts
     run_dtc_test -I dts -O dtb -o integer-expressions.test.dtb integer-expressions.test.dts
     run_test integer-expressions integer-expressions.test.dtb
diff --git a/tests/testutils.c b/tests/testutils.c
index 4c85111..54da2e4 100644
--- a/tests/testutils.c
+++ b/tests/testutils.c
@@ -131,7 +131,7 @@ void check_property(void *fdt, int nodeoffset, const char *name,
 		     " differs from stored length (%d != %d)",
 		     name, retlen, proplen);
 	if (proplen != len)
-		FAIL("Size mismatch on property \"%s\": %d insead of %d",
+		FAIL("Size mismatch on property \"%s\": %d instead of %d",
 		     name, proplen, len);
 	if (len && memcmp(val, prop->data, len) != 0)
 		FAIL("Data mismatch on property \"%s\"", name);
@@ -148,7 +148,7 @@ const void *check_getprop(void *fdt, int nodeoffset, const char *name,
 		FAIL("fdt_getprop(\"%s\"): %s", name, fdt_strerror(proplen));
 
 	if (proplen != len)
-		FAIL("Size mismatch on property \"%s\": %d insead of %d",
+		FAIL("Size mismatch on property \"%s\": %d instead of %d",
 		     name, proplen, len);
 	if (len && memcmp(val, propval, len) != 0)
 		FAIL("Data mismatch on property \"%s\"", name);
@@ -172,7 +172,7 @@ const void *check_get_prop_offset(void *fdt, int poffset, const char *exp_name,
 		return NULL;
 
 	if (proplen != exp_len)
-		FAIL("Size mismatch on property \"%s\": %d insead of %d",
+		FAIL("Size mismatch on property \"%s\": %d instead of %d",
 		     name, proplen, exp_len);
 	if (exp_len && memcmp(exp_val, propval, exp_len))
 		FAIL("Data mismatch on property \"%s\"", name);
diff --git a/tests/utilfdt_test.c b/tests/utilfdt_test.c
index f62341c..992807d 100644
--- a/tests/utilfdt_test.c
+++ b/tests/utilfdt_test.c
@@ -46,7 +46,7 @@ static void checkfail(const char *fmt)
  * Add the given modifier to each of the valid sizes, and check that we get
  * correct values.
  *
- * \param modifier	Modifer string to use as a prefix
+ * \param modifier	Modifier string to use as a prefix
  * \param expected_size	The size (in bytes) that we expect (ignored for
  *			strings)
  */
-- 
2.48.1

