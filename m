Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008245;
	b=EzVMcwQaCkpuG3q9kyplc1wV//IPbAA28+bTLBQxy0eVEBQoC5ACBxkpIr43e2KFs/+C
	 cORgNBPk8dDcYYccnwex6Cfo6QlBggfzLds8kj0JEn7Kuv9prcTGqhGCJK/hkuDz26c6x
	 ga/s9xXm7zcCGIN2d04N0Lj85jYtPklAY9F6hM/8yMy5jU3fnbWPzCDbToR4L2d7qjqOK
	 iefqpUbgbaseWKUiEk4WsFrVunDCaJKaqMv2K2qh1kPGtFBWGe0AHIS86+ROuHDGx4q1Q
	 tza5UAWaKGdHv9uRFL8GKbyP54NFpN744GZQ0oAz9iFb/5LPIIvaFA759xB/PNn3b9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008245;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=7gO8PSGEWD+jOaZBULoagLeeyKHrNqziapjg6hL6ad0=;
	b=GJkBQA8V07h+8WQyF+/uSIRTwWzH3v2t6m3o4fmS9N1H//qkAkmepRmHO5D4V5zFGKxW
	 7CBph8csfKk1MnpBPtHrpq8pKpbxbxqWH2eOYR7KcaHKFlw/xBLHCHDQKLS01pgKjKBFn
	 UvEdPTSZivnw8UNG0Ecyha8x9I3Gh8sIOu/yZCPvga9vNTukgpqFLCG4V/8BJQqRPcQq6
	 6eybmVtLlT08L/QxQJaYAmai75XgudY/sUWcKl9Y0LqCWu2Mlnu2AOWL5qAVzwLHpOxEq
	 y7cWUXQI2RAGFw0qdgZ1Rs/ujctinA3qgTVcWMfNI13fmiutfCF2AekdhrjfsRQgZMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Cr3I+oCA;
	arc=none smtp.remote-ip=209.85.210.54
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A7D60A2615
	for <devicetree-compiler@vger.kernel.org>; Mon, 26 Oct 2026 09:50:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74A7D60A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Cr3I+oCA
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-84a2bea315dso1842816a34.1
        for <devicetree-compiler@vger.kernel.org>; Mon, 26 Oct 2026 02:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793008243; x=1793613043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7gO8PSGEWD+jOaZBULoagLeeyKHrNqziapjg6hL6ad0=;
        b=Cr3I+oCApCoYx0y4G9CgZImdV7pGA9wKYSqvTpxMv/AGHDthtRNJvxXZZM8RTmPKRe
         x1sM5+frvfmFibhtY9Nr+i9eCydALN4EaijBHwtpyzCrUwJCH2zCgBzRxiRj37B7AaNx
         P2tW4uloz17UyxPZwTuh4pUBdqXt4t53/u3U4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008243; x=1793613043;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7gO8PSGEWD+jOaZBULoagLeeyKHrNqziapjg6hL6ad0=;
        b=c1ZQApLAUUaBrvhhBz6slUtM1GuKdgpiCyzu86ndHU8/szJpaNqwGOQdKekvoem3B/
         WHO93ff5oTUCPBJIiZPBWXvHufwroJCIdj1zK4lnOsCRmSB0oK/+kEWCzSVN8K5505ld
         zvxjd8fFHViNJ3d6CRM8IzPxp8/91O4dTqMObLHpWIK7sBS1h2AoSXi4FcGBNJjNoB8G
         33j+ifFOJWeWYyNMxDvd3XnSxIMhQ7WBd8CVbqBbRwrCVJmqIWu7ogZ5LCMm5ZSs2Vy3
         2cd0joME8f/XFC8eZS11fdre+TqQfZNPbe8RI3lqvVM1NAEitB7GyaBENyBkoUsXbV2Z
         eqOQ==
X-Gm-Message-State: AFq9FYKcAVKnYhfyep3qk1cjy64YxW273TjdklRVYLKxfafeEbYKdTN8
	/YtcogRGfplCA9pbSx0mQI3atOZFDfKSD6x0IEmm8MizYqzRxZqB458yxZDA7mKyPrvq4ziaLdI
	87a/yjA==
X-Gm-Gg: AYBFou3mttiYeGDzSYYqeXk1COH19h4T6nshisNDI9Ihpt9sqTz4VqayxEi542Pv+aE
	edZsezxSUhG/yeuKBYMq9qeXrDnoNloPebyWJFcsQ/nMb/UGjpyTrvRcRDdbXEr7fVf6IpK+Cpg
	yWSspXQUIHmLOgERs0h6npc36HDzG4nY/P4sxH2m3/ucBcx0aQ3Be+Wp/YJ3LSLxEbWOTGb9vj8
	fsYhJ95VOV1qJeaO2YvUTMdLlOdWmabahEDt7BD+cIpBcgID7iplSGpng5mwEFCGvHY+AWM4bQZ
	6UWixocK+Owq+PYbFutjdme0UeHb4yBBJ+8AtWBPMAf6gTpQpwH/1B9+ghD68/N74ueDLED1LGq
	erogRO2Ef65NLwcPg1/cheMNGFIFt35LIRlcf5/MipsmE6c7dEBrBTKCwShjjhw/ir1f9FXnvsc
	IApZafXeHsp67dklJtXGOmfat5cgt5m7lQm094HlIM7Yq48IXpJvwqWKI6icF8I++kVsjGWIhVz
	aOzAyGCrObBT5ohfyj6+l5GF/XoeK/qSPRbFokaeoYAz2O2k4zn68LbcO6Jo9TnGk2tCuLLcFxS
	mQ7CXgBDjYQC
X-Received: by 2002:a05:6820:3407:20b0:70a:2478:f607 with SMTP id 006d021491bc7-70ba0e314b4mr2059972eaf.46.1793008243309;
        Mon, 26 Oct 2026 02:50:43 -0700 (PDT)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70b9e28ac91sm6647973eaf.13.2026.10.26.02.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:50:41 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Herve Codina <herve.codina@bootlin.com>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v3] libfdt: Find a node's parent in a single pass
Date: Mon, 26 Oct 2026 03:50:18 -0600
Message-ID: <20261026095020.1760446-1-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
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

fdt_parent_offset() walks the whole tree from the root twice: once
inside fdt_node_depth() to discover the node's depth, then again in
fdt_supernode_atdepth_offset() to find the ancestor one level up. Both
walks are O(nodes before the target), so a parent lookup costs twice
what it needs to.

This matters in U-Boot, which looks up a node's parent before
relocation, for example to find the cell sizes for a device's address,
and may be reading the devicetree with the caches off at that point. On
a Firefly-RK3399, with a 564-node devicetree, the 17 lookups made before
relocation take about 7.1ms each, 121ms in all. With this change each
takes about 4.3ms, for a total of 73ms.

Walk the tree once instead, remembering the most recent node seen at
each depth. On reaching the target node its parent is the last node seen
one level up. A node deeper than the tracked limit falls back to the
existing code.

The single pass needs an int per level of depth, so it costs that much
stack. FDT_PARENT_MAX_DEPTH sets the limit when libfdt is built: 32 by
default, which no real tree approaches, and lower where stack is tight.
Setting it to 0 leaves the single-pass code out altogether, for callers
who would rather have the smaller build.

Nothing builds libfdt with FDT_PARENT_MAX_DEPTH set to 0, so the
fallback only runs for the deep tree in the parent_offset test. Add a
step to the Meson CI builds which leaves out the single-pass lookup and
runs the libfdt tests, so that every parent lookup there takes the
fallback, including those from fdt_overlay.c

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v3:
- Explain in the commit message where a parent lookup's cost matters
- Fold in the CI patch
- Run the CI check on every Linux distro, not just Ubuntu
- Run only the libfdt tests in the CI check, without Python

Changes in v2:
- Explain in the cover letter where the cost of finding a parent matters
- Only fall back when the node itself is deeper than the limit
- Drop the comparison with FDT_ASSUME_MASK, which has a build option
- Give the deep test tree several nodes at each level
- Take the expected parent from the node's path in the deep test
- Add a CI build which runs the tests with the single-pass code left out

 .github/workflows/build.yml |  7 +++
 libfdt/fdt_ro.c             | 38 ++++++++++++++-
 libfdt/libfdt_internal.h    | 14 ++++++
 tests/parent_offset.c       | 94 +++++++++++++++++++++++++++++++++++++
 4 files changed, 152 insertions(+), 1 deletion(-)

diff --git a/.github/workflows/build.yml b/.github/workflows/build.yml
index d5704d7..c432315 100644
--- a/.github/workflows/build.yml
+++ b/.github/workflows/build.yml
@@ -57,6 +57,13 @@ jobs:
         if: matrix.build == 'meson'
         run: if ! meson test -C build; then cat build/meson-logs/testlog.txt; false; fi
 
+      - name: Check without the single-pass parent lookup (Meson)
+        if: matrix.build == 'meson'
+        run: |
+          meson setup -D c_args=-DFDT_PARENT_MAX_DEPTH=0 -D python=disabled build-depth0
+          meson compile -C build-depth0
+          if ! meson test -C build-depth0 libfdt; then cat build-depth0/meson-logs/testlog.txt; false; fi
+
   build-macos:
     runs-on: macos-latest
 
diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
index 11f2e2e..ddfb8b9 100644
--- a/libfdt/fdt_ro.c
+++ b/libfdt/fdt_ro.c
@@ -674,7 +674,43 @@ int fdt_node_depth(const void *fdt, int nodeoffset)
 
 int fdt_parent_offset(const void *fdt, int nodeoffset)
 {
-	int nodedepth = fdt_node_depth(fdt, nodeoffset);
+#if FDT_PARENT_MAX_DEPTH
+	int supernode[FDT_PARENT_MAX_DEPTH];
+	int offset, depth;
+#endif
+	int nodedepth;
+
+#if FDT_PARENT_MAX_DEPTH
+	FDT_RO_PROBE(fdt);
+
+	/*
+	 * Walk the tree once, remembering the most recent node seen at each
+	 * depth. On reaching the target node, its parent is the last node
+	 * seen one level up. Nodes deeper than the limit are not remembered,
+	 * since they never hold a shallower node's parent, so only a target
+	 * which is itself too deep needs the fallback
+	 *
+	 * The depth goes negative once the walk moves past the root, which
+	 * happens when nodeoffset does not name a node. Fall back in that
+	 * case, so that the checks below reject it
+	 */
+	for (offset = 0, depth = 0;
+	     offset >= 0 && offset <= nodeoffset;
+	     offset = fdt_next_node(fdt, offset, &depth)) {
+		if (depth < 0)
+			break;
+		if (offset == nodeoffset) {
+			if (depth > FDT_PARENT_MAX_DEPTH)
+				break;
+			return depth ? supernode[depth - 1] :
+				-FDT_ERR_NOTFOUND;
+		}
+		if (depth < FDT_PARENT_MAX_DEPTH)
+			supernode[depth] = offset;
+	}
+#endif /* FDT_PARENT_MAX_DEPTH */
+
+	nodedepth = fdt_node_depth(fdt, nodeoffset);
 
 	if (nodedepth < 0)
 		return nodedepth;
diff --git a/libfdt/libfdt_internal.h b/libfdt/libfdt_internal.h
index 0e103ca..eefea2a 100644
--- a/libfdt/libfdt_internal.h
+++ b/libfdt/libfdt_internal.h
@@ -85,6 +85,20 @@ static inline uint64_t fdt64_ld_(const fdt64_t *p)
 #define FDT_ASSUME_MASK 0
 #endif
 
+/*
+ * Maximum node depth for which fdt_parent_offset() finds a node's parent in
+ * a single pass over the tree. Deeper nodes fall back to walking the tree
+ * twice, which is correct but slower.
+ *
+ * The single pass needs an int for each level, so this costs that much
+ * stack. Reduce it if that matters more than the speed; no real device tree
+ * comes close to the default. Set it to 0 to leave out the single-pass code
+ * altogether, for the smallest build.
+ */
+#ifndef FDT_PARENT_MAX_DEPTH
+#define FDT_PARENT_MAX_DEPTH 32
+#endif
+
 /*
  * Defines assumptions which can be enabled. Each of these can be enabled
  * individually. For maximum safety, don't enable any assumptions!
diff --git a/tests/parent_offset.c b/tests/parent_offset.c
index a935a53..382d431 100644
--- a/tests/parent_offset.c
+++ b/tests/parent_offset.c
@@ -56,6 +56,97 @@ static void check_path(struct fdt_header *fdt, const char *path)
 		     parentoffset, parentpathoffset);
 }
 
+/*
+ * Check that an offset which does not name a node never yields a parent.
+ * Sweep the whole blob, plus a little either side of it
+ */
+static void check_bad_offsets(struct fdt_header *fdt)
+{
+	int offset, size = fdt_totalsize(fdt);
+
+	for (offset = -8; offset < size + 64; offset++) {
+		int parentoffset;
+
+		if (fdt_get_name(fdt, offset, NULL))
+			continue;	/* a real node, checked elsewhere */
+
+		parentoffset = fdt_parent_offset(fdt, offset);
+		if (parentoffset >= 0)
+			FAIL("fdt_parent_offset(%d) returns %d for an offset "
+			     "which is not a node", offset, parentoffset);
+	}
+}
+
+#define DEEP_SPACE	65536
+#define DEEP_LEVELS	40
+
+#define CHECK(code) \
+	do { \
+		int err_ = (code); \
+		if (err_) \
+			FAIL(#code ": %s", fdt_strerror(err_)); \
+	} while (0)
+
+/* Add a node holding a single subnode, as a side branch of the deep tree */
+static void add_branch(void *fdt, const char *name, const char *child)
+{
+	CHECK(fdt_begin_node(fdt, name));
+	CHECK(fdt_begin_node(fdt, child));
+	CHECK(fdt_end_node(fdt));
+	CHECK(fdt_end_node(fdt));
+}
+
+/*
+ * Check a tree deeper than fdt_parent_offset() may track in one pass, so
+ * that both it and the fallback for deeper nodes are covered
+ *
+ * Each level has three nodes: 'a' and 'c' each hold one subnode and 'b'
+ * holds the next level. So nodes at the same depth have different parents,
+ * and the walk passes whole subtrees both before and after the node being
+ * looked up. The expected parent comes from the node's path, so it does not
+ * depend on walking the tree
+ */
+static void check_deep_tree(void)
+{
+	int offset, depth, level, maxdepth = 0;
+	char path[256];
+	void *fdt = malloc(DEEP_SPACE);
+
+	if (!fdt)
+		FAIL("malloc()");
+
+	CHECK(fdt_create(fdt, DEEP_SPACE));
+	CHECK(fdt_finish_reservemap(fdt));
+	CHECK(fdt_begin_node(fdt, ""));
+	for (level = 0; level < DEEP_LEVELS; level++) {
+		add_branch(fdt, "a", "x");
+		CHECK(fdt_begin_node(fdt, "b"));
+	}
+	for (level = 0; level < DEEP_LEVELS; level++) {
+		CHECK(fdt_end_node(fdt));
+		add_branch(fdt, "c", "y");
+	}
+	CHECK(fdt_end_node(fdt));
+	CHECK(fdt_finish(fdt));
+
+	for (offset = 0, depth = 0; offset >= 0;
+	     offset = fdt_next_node(fdt, offset, &depth)) {
+		if (depth < 0)
+			break;
+		if (depth > maxdepth)
+			maxdepth = depth;
+		if (!depth)
+			continue;
+
+		CHECK(fdt_get_path(fdt, offset, path, sizeof(path)));
+		check_path(fdt, path);
+	}
+	if (maxdepth != DEEP_LEVELS + 1)
+		FAIL("tree is %d deep, expected %d", maxdepth,
+		     DEEP_LEVELS + 1);
+	free(fdt);
+}
+
 int main(int argc, char *argv[])
 {
 	void *fdt;
@@ -73,5 +164,8 @@ int main(int argc, char *argv[])
 		FAIL("fdt_parent_offset(/) returns %d instead of "
 		     "-FDT_ERR_NOTFOUND", err);
 
+	check_bad_offsets(fdt);
+	check_deep_tree();
+
 	PASS();
 }
---
base-commit: f99e3af0ecb67a9085478a9b8ddbcc25aa64931d
branch: parent-onepass3

-- 
2.43.0

