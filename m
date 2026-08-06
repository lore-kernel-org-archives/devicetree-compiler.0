Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710A5371877
	for <devicetree-compiler@vger.kernel.org>; Thu,  6 Aug 2026 19:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786043612; cv=none; b=cO3OfFS/JvlAh1EyrOB4C5B11GgXEbSNoNcQR6MFmjAuLDMO8HZIs/Qqae1kAoy6xcU7UG8qopdn2wIExS23WAAJndP+Rj31lVFoUGVfy+Sal40dbD3NvuaWTdznfZK2s4gYT2/GQ/1e/HAez3s96rm2Rmu1sbTkQvyQcQ1Zb9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786043612; c=relaxed/simple;
	bh=PHYT2ms2ZfaXiG8Jn7Q7mHDQfAwg6lk4fQWY6PdT27k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gVdzVwG0O8ZbnRTQxuE+9RLC5gCr6+/i23Lrd1Z6p0G/q6OtjWtcHN9t5VQb63xYxhLKMGdvEYQrHBLMj3IvPc+bcqPcNNidp5pgHSY7uGj6ZWw26BeObtmmGrFgcOVCxrF+qrUazjrZm/wMUXG46rdDJGndEwqIssouNB1EXdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OqZMU6Wk; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OqZMU6Wk"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-4a40bcc8d69so1648785b6e.3
        for <devicetree-compiler@vger.kernel.org>; Thu, 06 Aug 2026 12:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786043609; x=1786648409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UOKqMcq7l3wA+x9zRQzhp4SSaqtoc5tcUA5omD7Yac4=;
        b=OqZMU6WklPFKC/5NMxcKbbnGDucc4ZtBEJmafxY183VLFLubGXJK1m4xv/Dn0cGiQk
         pHy1HR09MQqKBVDlplI3UfqtLcQMr0ZtFEdQSGfXz4BKpJVeoHAqqpTjx4Sw3VKJiZBz
         vxVHXjJHezlx6jLEXG36P50VabRW36cd1a8as=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786043609; x=1786648409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UOKqMcq7l3wA+x9zRQzhp4SSaqtoc5tcUA5omD7Yac4=;
        b=mc/+C9K/feqF8Fv6M6E+a3B76DPslNaMw0w7jqMdW+qGYM6x4W4hxgCOAKMHjubx0S
         Iv/uzi6QTER6U4c4jmhkGcBgQLy8bYR6gSrPBst6k+LaT/ffR27tpe/qXMVHrWKGuZlh
         VOBESWELemSKJU1QTVMh2zJN+KRaCLgFTsUPBLSa2+QrIjC79ABdG192KFPFYDIQBYDr
         sB/HxczNNZaqleYGbZTJamcve9KCmiHxgxh1Ls2sCdaVOJoQHsH3evRa8XLPUhWfKoAu
         eGYLLp4uwjgKuPRD7QttrPMlP8z4dS9Wt0ultMmSO6SJW+/jf6Z7x8z2UiGGd5EvY1eX
         QH9A==
X-Gm-Message-State: AOJu0YzjKJdrq9WZGa343wi/Y1lXG6iyeYCQObLsFAv5FQ5XnWQtzreC
	G8Trnq99T6blp3m8u8HGAPZIwsq+lWZlpTbJ63sal3rw2gf7GUm0MAs/HxYfRwN+MROZ8lHQYsv
	IajM=
X-Gm-Gg: AR+sD11TRS6Ea85i88oCM9LcV1wNNFRKokOVwV481iMfEoEElsckEil/X+kS9yZKSVT
	6vzeJivIklTMRgG4JSQZVaNyIn0gupwfCVq99GM8MS1L3nwCSOKkcb4RRUC0BGAa3S4ckQC03OG
	w7Q187Pav7tUuv7RmSqt459ZDYs/0gAdVouU1VUwSH6OyEMQLUByD7dEG1yHB+EpkvWSuCAquYi
	64cFiD2nt/J3PFO5OGsKxzTPPbTsDeZ+Mx0I1eOea6SrtJniNhQNAJUNCBWeaAcYyozP09yH+nr
	RRgN43kCmaG75pwUYuuPXwpxZnjWp64dAe7/S4MDHsKnwJOWx2+6PYokEw3vsBTjpLNzEnvzUll
	9PQm1niR0v2NDD8UheKB9n4U1X83t1qHdPyjWJ//DwTW86Y1FbCuoBTKnp7db8GIX53rL/8tIEb
	c5JYsOTqHFw6OGnn21zO/puBCFExrDbJ45zplx0aurJOFvaEMs5f4H/vo=
X-Received: by 2002:a05:6808:c40a:b0:495:e1b6:2c5 with SMTP id 5614622812f47-4afadd36ea4mr8593020b6e.1.1786043609143;
        Thu, 06 Aug 2026 12:13:29 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f1df346a8bsm4912746a34.11.2026.08.06.12.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 12:13:27 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH] libfdt: Find a node's parent in a single pass
Date: Thu,  6 Aug 2026 13:13:14 -0600
Message-ID: <20260806191321.2476810-1-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fdt_parent_offset() walks the whole tree from the root twice: once
inside fdt_node_depth() to discover the node's depth, then again in
fdt_supernode_atdepth_offset() to find the ancestor one level up.
Both walks are O(nodes before the target), so a parent lookup costs
twice what it needs to.

Walk the tree once instead, remembering the most recent node seen at
each depth. On reaching the target node its parent is the last node
seen one level up. Trees deeper than the tracked limit fall back to
the existing code.

The single pass needs an int per level of depth, so it costs that
much stack. FDT_PARENT_MAX_DEPTH sets the limit, in the same way as
FDT_ASSUME_MASK: 32 by default, which no real tree approaches, and
lower where stack is tight. Setting it to 0 leaves the single-pass
code out altogether, for callers who would rather have the smaller
build.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 libfdt/fdt_ro.c          | 32 +++++++++++++++-
 libfdt/libfdt_internal.h | 14 +++++++
 tests/parent_offset.c    | 79 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 124 insertions(+), 1 deletion(-)

diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
index 11f2e2e..b84669a 100644
--- a/libfdt/fdt_ro.c
+++ b/libfdt/fdt_ro.c
@@ -674,7 +674,37 @@ int fdt_node_depth(const void *fdt, int nodeoffset)
 
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
+	 * seen one level up
+	 *
+	 * The depth goes negative once the walk moves past the root, which
+	 * happens when nodeoffset does not name a node. Fall back in that
+	 * case, so that the checks below reject it
+	 */
+	for (offset = 0, depth = 0;
+	     offset >= 0 && offset <= nodeoffset;
+	     offset = fdt_next_node(fdt, offset, &depth)) {
+		if (depth < 0 || depth >= FDT_PARENT_MAX_DEPTH)
+			break;
+		supernode[depth] = offset;
+		if (offset == nodeoffset)
+			return depth ? supernode[depth - 1] :
+				-FDT_ERR_NOTFOUND;
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
index a935a53..9850f31 100644
--- a/tests/parent_offset.c
+++ b/tests/parent_offset.c
@@ -56,6 +56,82 @@ static void check_path(struct fdt_header *fdt, const char *path)
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
+/*
+ * Check a tree deeper than fdt_parent_offset() may track in one pass, so
+ * that both it and the fallback for deeper nodes are covered
+ */
+static void check_deep_tree(void)
+{
+	int seen[DEEP_LEVELS + 1];
+	int offset, depth, level;
+	void *fdt = malloc(DEEP_SPACE);
+
+	if (!fdt)
+		FAIL("malloc()");
+
+	CHECK(fdt_create(fdt, DEEP_SPACE));
+	CHECK(fdt_finish_reservemap(fdt));
+	CHECK(fdt_begin_node(fdt, ""));
+	for (level = 0; level < DEEP_LEVELS; level++)
+		CHECK(fdt_begin_node(fdt, "node"));
+	for (level = 0; level < DEEP_LEVELS; level++)
+		CHECK(fdt_end_node(fdt));
+	CHECK(fdt_end_node(fdt));
+	CHECK(fdt_finish(fdt));
+
+	for (offset = 0, depth = 0; offset >= 0;
+	     offset = fdt_next_node(fdt, offset, &depth)) {
+		int parentoffset;
+
+		if (depth < 0)
+			break;
+		if (depth > DEEP_LEVELS)
+			FAIL("tree is %d deep, expected %d", depth,
+			     DEEP_LEVELS);
+		seen[depth] = offset;
+		if (!depth)
+			continue;
+
+		parentoffset = fdt_parent_offset(fdt, offset);
+		if (parentoffset != seen[depth - 1])
+			FAIL("fdt_parent_offset() returns %d instead of %d "
+			     "at depth %d", parentoffset, seen[depth - 1],
+			     depth);
+	}
+	free(fdt);
+}
+
 int main(int argc, char *argv[])
 {
 	void *fdt;
@@ -73,5 +149,8 @@ int main(int argc, char *argv[])
 		FAIL("fdt_parent_offset(/) returns %d instead of "
 		     "-FDT_ERR_NOTFOUND", err);
 
+	check_bad_offsets(fdt);
+	check_deep_tree();
+
 	PASS();
 }
---
base-commit: 66e1201c3775716607c28afd2bbb2b3afb08b695
branch: parent-onepass

-- 
2.43.0

