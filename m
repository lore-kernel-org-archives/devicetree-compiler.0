Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792918531;
	b=gR++g+TxjmydcUGIrROnCHnjYSiQSVmfIjaVnEhNxJ4RYA+6bbtKRZR0zrVTycl67HGP
	 Z+Lkkq/eKtbptfgX/AEekXmWNz2ZIlnjHbw7pGaH6c/l7RBrsl2p/++KT1MdphYQ/R69K
	 j5wRhhW6Ff04elCTcg5AE2JMK5RtSHZjsCiar1SsHp+064CiPTPFjS8apaBO87vTbLISa
	 zDH5qFKM8wyZgJUKlv+pdwS1Rjs3yBS5eLdgurCu9Ogep1cj08h+85h6gL76ERxHF830g
	 M1pjO+SWfd5tQ+6Pcqwds9xifOM9CV0QWbcvMLGvypl3pB4sx90/CbUklVj10LCpufg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792918531;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WlCojinrZW6xqwtaYAKDiKp2cofFem5q82TSvf8+aQg=;
	b=uR/5t1QhIoDZod+K/FnJcvJoe/oCZiGU/rShyJCdDYbl7Vj+KHar8UaIBQrty0TbOZg7
	 Z12TkEA9I7yf6bY+FISbW9EYYN5Njv/C3l1U4uOJLmCxvdJeLuafR24JTrU2eZFHA4IoF
	 OUyVgn0GIBprzS1jZdWi4puq2QKvsdNHME+2Xu+Je7xqWbbfFujeAbd9dseRDaQhox79o
	 BiQx9YzL0joIimhpVzU4JLYj2UXLLLi/wY1aW9BgDhgAJpf3HX/jd3Rw8nVDR2lUXL65U
	 u4d83eyeJdBYgcL22hGCqyJ7qrZ/Cw/XhXIAzJqQkeNrlRHsp5QViNPL4c7ZynOA4Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=bzUBiXXO;
	arc=none smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A33606A31A
	for <devicetree-compiler@vger.kernel.org>; Sun, 25 Oct 2026 08:55:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57A33606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=bzUBiXXO
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-705cb6cedd5so2123286eaf.1
        for <devicetree-compiler@vger.kernel.org>; Sun, 25 Oct 2026 01:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792918530; x=1793523330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WlCojinrZW6xqwtaYAKDiKp2cofFem5q82TSvf8+aQg=;
        b=bzUBiXXOu2kufga9PAYT50qkccmZMWrpLbnS9vpugUDW1YdSpMOeRUcV2KcJQQHuDj
         ToZ7QoYDHkZwvPrnja62+6QkfeVDFB4dOgg5r2KAfPzeN5+0O3L88y0ZmZEGqBYxfdxi
         igwmxhLs5qXyViMjgTddDoK5RKwNjjSNur+fc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792918530; x=1793523330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WlCojinrZW6xqwtaYAKDiKp2cofFem5q82TSvf8+aQg=;
        b=Nc2quamLOPLq2kge6+sd0f5GxAcASyC3JpvKosakHs7MQtpPcn6djL7XCjeG1AW4+x
         OLtC9S7CspKE++/N9I13RWiZJjCHCiGdvSUDb68WOMoG7Ner3ZECcBGiYkqn5H4o/b3t
         53Sjadzgn3aMg7cQqsgtzb6oGhTgVgaiDBWxcpQ7ayXSND+OBek2W5/VWv4l2jXTruw0
         MVGtqBFLvmXyUDX/+p3uOf6AxmXq6s7BHuEY1fPKcu1asUztnxLIaoX6zhu1q812xxIJ
         PS9OLhBhyVGfaNn3Hvk7UDosMllmOqnVTYWwnS8T18mX078nAJ5eBgaa/7dNjxkKpkfO
         QuqQ==
X-Gm-Message-State: AFq9FYJ1DzLakYlSbis3mIiQDXi3GdSEqaglQMgEZJxu+IINlGgXpzy2
	Vk2/PRZqLpTMqptO4sPiui4VyxqyrS01NgZi0Go5CVKKFpTRYq1qp+j0mooqdOnznvtiDNymsd2
	6BOg=
X-Gm-Gg: AYBFou018oDsTml7jLm4QJ3qDs7KwdgRWfFbdngMXDsPyPeOuEs/DxFpZQyEV49uwp5
	ycJXgYgLwLAdPDxCXxAI5MA6T6IZYad2qYKBOmmmCfW73Zb8uBIP7z9n3Hn08bOoOv1uqwPlzI2
	lRec8CgEMg/BGo+FpAyp35qWdOM28VubQ4OLKtIamRnmJD8M7YFsAhRGuix/pdcFJsD/bWOpwkm
	TMnfUlN0dSI3jAQTbHNkxFUmGhpbZK9hQRtGHLk+99rkm5fm2bnJDRng85CRlU77UpwSfAAii8k
	rsu0ZHbVJ13DoRYDM2CHBK5qLe8UtjtyaeMWcGDIwjz4PbDHHlK/2QiWoq7TzeSadV2cW9IsvRN
	K3yy1aNnJwMpaKQnTmgiCxcHBZiaULfuSvCEyefxmXR1z95CP10BbxF6hp9bTPavV8jz3z9GyrN
	QEqKHBOgN7b383d8RBW/BzFayXRvlJWKBuGWVXWOcBqPFrLtYOm2+bzngaVuxoQfNaZ8cpOklVe
	I3mDn66MCDXcYkDBda4uKFeEYRmiHvYHUl4aRphOL+dFMKS3cj4fkcqZbzMAcCFgU8NnkOeg3aM
	899VLbzRODUP
X-Received: by 2002:a05:6820:151a:b0:6d9:bad0:837c with SMTP id 006d021491bc7-70ba14afc6dmr1151237eaf.40.1792918530128;
        Sun, 25 Oct 2026 01:55:30 -0700 (PDT)
Received: from chromium.org (c-75-70-42-118.hsd1.co.comcast.net. [75.70.42.118])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70b9e163a5dsm3904045eaf.8.2026.10.25.01.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 01:55:28 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Cc: Herve Codina <herve.codina@bootlin.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Simon Glass <sjg@chromium.org>
Subject: [PATCH v2 1/2] libfdt: Find a node's parent in a single pass
Date: Sun, 25 Oct 2026 02:55:04 -0600
Message-ID: <20261025085508.1622340-2-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261025085508.1622340-1-sjg@chromium.org>
References: <20261025085508.1622340-1-sjg@chromium.org>
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

Walk the tree once instead, remembering the most recent node seen at
each depth. On reaching the target node its parent is the last node seen
one level up. A node deeper than the tracked limit falls back to the
existing code.

The single pass needs an int per level of depth, so it costs that much
stack. FDT_PARENT_MAX_DEPTH sets the limit when libfdt is built: 32 by
default, which no real tree approaches, and lower where stack is tight.
Setting it to 0 leaves the single-pass code out altogether, for callers
who would rather have the smaller build.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v2:
- Explain in the cover letter where the cost of finding a parent matters
- Only fall back when the node itself is deeper than the limit
- Drop the comparison with FDT_ASSUME_MASK, which has a build option
- Give the deep test tree several nodes at each level
- Take the expected parent from the node's path in the deep test

 libfdt/fdt_ro.c          | 38 +++++++++++++++-
 libfdt/libfdt_internal.h | 14 ++++++
 tests/parent_offset.c    | 94 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 145 insertions(+), 1 deletion(-)

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
-- 
2.43.0

