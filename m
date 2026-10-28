Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793224604;
	b=JRCbPvN6ljgqxTexrPGxwvaUVgD93vhoIcQ3itkNizZnSRJOb6jfWqU98KyX5OIBPk9e
	 lQ2cm1z3p77PNdhO2yRuFvJkvDUMJr6cyXlM9rrP66gBtMYyuBK77ib+6EPAamaVFyuIv
	 yBTLV6ZHeDXOoo37P4e34Y/KovjDFI297RltrGtc9iqib+JujO+FD+WDMPQwM1UkCYMHQ
	 jTbOUGmbuVzihGgTa6fIpjS7+MzYVxg1JiOS5hBhq1uaghaPlYwkGIt9R3DDojfvW3eeV
	 wyBprMDeINoQGoyyrkETwbi1gfPG95aM0KNc01NUPomouKPVFloypTrDrVaEKousaGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793224604;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ho5bx6JnvFfAC51qrZ3dBeEPSfq4H5fUqOy5Yvej6rA=;
	b=wGsDup2pah96KJtjRhp05T5Jq2Y15Fa2kx5DL76b4wYGEPbD8VQIJlbfJWv5KYzKjD33
	 +T9ien2IUSbghzOcWtUh5bpeSbJE1glsixvvdYuWqGvGT7DmFSy9CIbvm6bMykWNPTjBJ
	 qUZtkAvcU9SSYUqMMNDPN7qGk/LyAWTw+LrJdzu9+KI3zFInS2oe1ljwjfB+cB3DqxJjz
	 BaCApKIu0ukOl24q5cjz+NNNCQ+KgNUJNUBzeSDf2hYHu6nSDShPDM78FFBCHpV/uMz+b
	 jZs7ob6CGkYE8cj9hy++FAfWVN6VBdot74OjxfNoI6QB0zyz8UaSr8vjz+3oUY3bFlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=YIgMjtIb;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98F8606A321
	for <Devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 21:56:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A98F8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=YIgMjtIb
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso1753048eec.1
        for <Devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 14:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793224603; x=1793829403; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ho5bx6JnvFfAC51qrZ3dBeEPSfq4H5fUqOy5Yvej6rA=;
        b=YIgMjtIbOtuNx/TY6vkeljcJOkY6o/bsQGRmw3xFFic31e9jfXqXTEKzFmwT5XQRJb
         /YwRE87uw+KsLYk3Jz+UzVFCGbCaqktVGaFsciU2GgN2JnmZotyIg5aBagex+yLWhPsp
         4QxeMugn2wReefTujBraubGzPFXrsnTxFHBN0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793224603; x=1793829403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ho5bx6JnvFfAC51qrZ3dBeEPSfq4H5fUqOy5Yvej6rA=;
        b=0CstKooTyRQw/Flj6zy1xFBkJLjsIRBaa/RFd//g8xxAa8gnDsblcaZeWnHvKnKfMV
         ngg9l2jkVcz/I3/Ca+LkREtsrXqgDt9ocy05/WXpn31TUtNsoB8IbKOFscvVOmzwww59
         VaR/xUSUWHnPAnFc/cb+1ac7zqjlN/rl9i2VxYUwJ4gP7kb9JYLNVrFjFfDDMnPGiU8s
         gpMD2oOsGqdIRRlbx/wMIdR+HjqL/AnHTQ4r56EcuMFCLfne/IPWUVbMD4Htw+t+iIXx
         PDsV4oxOTMinQVv+GHlhN6agr4Hz6HxURBfuPXLmQM4hvHUKOOmvuTWzenc2dQvdYbEh
         LDXw==
X-Gm-Message-State: AFq9FYIipcJPmybZmb4ftY6R9YeAyjk0njMwKthrZBQ/iNAprdRBUxMO
	WyZQOB4OQBx+Z1zh4ocEZCsPC7adFM60hhWzd+R0O3Ng6sfWd9KFRFtSf1kLe9yRet5xY2x/zMd
	LBB9OFrHV
X-Gm-Gg: AYBFou0WIXweiC57ZEGfhjAK8+3Y7rnFEn23FMKwH8j82Qs+SXas3BbZvuHYdBjoX/l
	8VDSlV+hEx/UxcQLzGTdWcgc7cIuVxWH1ZsjKe9ue8xYLiE8Zqj70KGJ9D6X+r2nxWiRWLbEUVN
	aSDr7S/r39HmB1pC61Jri/koy3p2H5n21CT19Zvy+fzga2q10DBbnxesAIEDCOZnlm4TxERiHL1
	9y5MOkLYPORiBTOTvMm8+fnLP2UQFfcNkR92TW0clsbtWpbf1p8XbEWiyodAzQdMBpmu0Ew47bu
	Yf2Bj+MqBdFP1ELybv6DH45IVX7zF78sjiCdGXPsN5TqVmY8u47aRW5znf6avTNoI93hRWwEAUo
	FgRwhSBvzeZCO8NV/MRzW+beeLTQ0xVYTYzaNNS9UtSzuAd/00hJAJ511qki3Mdy/MBT1vDxZ3P
	S8wthHpccokYTOa5RyXdYW8ZASw82HT/huTBQPbNiAxOFfKSb0kmF59kKJFSiQ/AV5xtSXAV9Sp
	8lHrh3OD2BwwvLG/bHdJBbJpanOyYTXi3zPRG5G87eft4gAyP9EhqqGNptB+Z2h49P6DH2jMFNa
	h+zdomFax8GERTeBF7fKWYrkehJYtXBxGIQtsfZIjlG5K8U2WyKjW+DOyXYYKBIgNiscVHqSrwV
	lJIBdLS0Zlw2e
X-Received: by 2002:a05:693c:8944:10b0:369:2f25:33a7 with SMTP id 5a478bee46e88-36a200beec9mr4858415eec.15.1793224602753;
        Wed, 28 Oct 2026 14:56:42 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:19e7:c87:2527:4e12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2393cc86sm8845224eec.19.2026.10.28.14.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 14:56:40 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Brian Norris <briannorris@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Devicetree@vger.kernel.org,
	Simon Glass <sjg@chromium.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	linux-kernel@vger.kernel.org,
	Julius Werner <jwerner@chromium.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v2 06/10] libfdt: overlay: Update base /__local_fixups__ on apply
Date: Wed, 28 Oct 2026 14:46:55 -0700
Message-ID: <20261028215600.1713475-7-dianders@chromium.org>
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
In-Reply-To: <20261028215600.1713475-1-dianders@chromium.org>
References: <20261028215600.1713475-1-dianders@chromium.org>
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

When a base device tree is compiled with `dtc -L` (`--local-fixups`), it
contains a root `/__local_fixups__` node recording the byte offsets of
all phandle references in its properties.

Previously, `fdt_overlay_apply()` updated the base tree's `/__symbols__`
via `overlay_symbol_update()`, but left the base tree's
`/__local_fixups__` untouched. As a result, applying an overlay to a
base tree with `/__local_fixups__` left `/__local_fixups__` missing the
phandle references introduced by the overlay (both from the overlay's
`/__local_fixups__` and from its resolved `/__fixups__`), and left stale
offsets if the overlay overwrote a base property that previously had
phandle references.

Add `overlay_local_fixups_update()` to update the base tree's
`/__local_fixups__` whenever `/__local_fixups__` is present in the base
tree:

- Remove pre-existing `/__local_fixups__` properties for any base
  properties overwritten by overlay fragments.
- Merge the overlay's `/__local_fixups__` and `/__fixups__` offsets into
  the base tree's `/__local_fixups__` in sorted ascending order.
- Prune any subnodes under `/__local_fixups__` that become empty after
  overwriting properties.

When the base tree does not have a `/__local_fixups__` node,
`overlay_local_fixups_update()` is a no-op.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- New patch updating base /__local_fixups__ in libfdt
  fdt_overlay_apply() instead of stripping /__local_fixups__ by default
  (David Gibson)

 libfdt/fdt_overlay.c | 621 ++++++++++++++++++++++++++++++++++++++++++-
 tests/run_tests.sh   |  19 ++
 2 files changed, 636 insertions(+), 4 deletions(-)

diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
index eb87b356145f..47acab15041d 100644
--- a/libfdt/fdt_overlay.c
+++ b/libfdt/fdt_overlay.c
@@ -804,7 +804,7 @@ static int overlay_prevent_phandle_overwrite(void *fdt, void *fdto)
  *      Negative error code on failure
  */
 static int overlay_apply_node(void *fdt, int target,
-			      void *fdto, int node)
+			      const void *fdto, int node)
 {
 	int property;
 	int subnode;
@@ -1003,9 +1003,8 @@ static int overlay_split_fragment_path(const char *path, int path_len,
  * overlay_symbol_update() updates the symbols of the base tree with the
  * symbols of the applied overlay
  *
- * This is the last step in the device tree overlay application
- * process, allowing the reference of overlay symbols by subsequent
- * overlay operations.
+ * This step in the device tree overlay application process allows
+ * the reference of overlay symbols by subsequent overlay operations.
  *
  * returns:
  *      0 on success
@@ -1122,6 +1121,616 @@ static int overlay_symbol_update(void *fdt, void *fdto)
 	return 0;
 }
 
+/**
+ * overlay_create_path - Create a relative path under a parent node
+ * @fdt: Base Device Tree blob
+ * @parent: Node offset of the starting parent node
+ * @path: Relative or slash-prefixed path to traverse
+ * @path_len: Length of @path in bytes
+ *
+ * overlay_create_path() walks the slash-separated path components in @path
+ * starting at @parent, creating any missing intermediate subnodes along the
+ * way.
+ *
+ * returns:
+ *      Node offset of the resolved or created subnode on success
+ *      Negative error code on failure
+ */
+static int overlay_create_path(void *fdt, int parent, const char *path,
+			       int path_len)
+{
+	const char *sep;
+	int node = parent;
+
+	while (path_len > 0 && *path == '/') {
+		path++;
+		path_len--;
+	}
+
+	while (path_len > 0) {
+		int comp_len;
+		int next;
+
+		sep = memchr(path, '/', path_len);
+		comp_len = sep ? (sep - path) : path_len;
+
+		if (comp_len > 0) {
+			next = fdt_subnode_offset_namelen(fdt, node, path,
+							  comp_len);
+			if (next == -FDT_ERR_NOTFOUND)
+				next = fdt_add_subnode_namelen(fdt, node, path,
+							       comp_len);
+			if (next < 0)
+				return next;
+			node = next;
+		}
+
+		path += comp_len;
+		path_len -= comp_len;
+		while (path_len > 0 && *path == '/') {
+			path++;
+			path_len--;
+		}
+	}
+
+	return node;
+}
+
+/**
+ * overlay_fragment_local_fixups - Find or create a fragment's target under /__local_fixups__
+ * @fdt: Base Device Tree blob
+ * @fdto: Device tree overlay blob
+ * @fragment: Node offset of the fragment in @fdto
+ * @create: Whether to create missing subnodes under /__local_fixups__
+ *
+ * overlay_fragment_local_fixups() resolves the target of @fragment in @fdt and
+ * locates (or creates, when @create is true) the corresponding node at the
+ * same path under @fdt's /__local_fixups__ subtree.
+ *
+ * returns:
+ *      Node offset of the corresponding /__local_fixups__ node on success
+ *      Negative error code on failure
+ */
+static int overlay_fragment_local_fixups(void *fdt, const void *fdto,
+					 int fragment, bool create)
+{
+	int root_lf, target, cur_fdt, node;
+
+	root_lf = fdt_subnode_offset(fdt, 0, "__local_fixups__");
+	if (root_lf < 0)
+		return root_lf;
+
+	target = fdt_overlay_target_offset(fdt, fdto, fragment, NULL);
+	if (target < 0)
+		return target;
+
+	cur_fdt = 0;
+	node = root_lf;
+	while (cur_fdt != target) {
+		int subnode, ancestor = -FDT_ERR_INTERNAL;
+		const char *name;
+		int namelen, next_lf;
+
+		fdt_for_each_subnode(subnode, fdt, cur_fdt) {
+			if (subnode <= target)
+				ancestor = subnode;
+			else
+				break;
+		}
+		if (ancestor < 0)
+			return ancestor;
+
+		name = fdt_get_name(fdt, ancestor, &namelen);
+		if (!name)
+			return namelen;
+
+		next_lf = fdt_subnode_offset_namelen(fdt, node, name, namelen);
+		if (next_lf == -FDT_ERR_NOTFOUND && create) {
+			char namebuf[256];
+			int old_struct_size = fdt_size_dt_struct(fdt);
+
+			if ((size_t)namelen >= sizeof(namebuf))
+				return -FDT_ERR_INTERNAL;
+			memcpy(namebuf, name, namelen);
+			next_lf = fdt_add_subnode_namelen(fdt, node, namebuf,
+							  namelen);
+			if (next_lf < 0)
+				return next_lf;
+			if (next_lf <= ancestor) {
+				int delta = fdt_size_dt_struct(fdt) -
+					    old_struct_size;
+				target += delta;
+				ancestor += delta;
+			}
+		} else if (next_lf < 0) {
+			return next_lf;
+		}
+
+		cur_fdt = ancestor;
+		node = next_lf;
+	}
+
+	return node;
+}
+
+/**
+ * overlay_clear_overwritten_local_fixups - Remove local fixups for overwritten properties
+ * @fdt: Base Device Tree blob
+ * @target_lf: Node offset in @fdt's /__local_fixups__ subtree
+ * @fdto: Device tree overlay blob
+ * @overlay: Node offset in @fdto's __overlay__ subtree
+ *
+ * overlay_clear_overwritten_local_fixups() recursively deletes properties under
+ * @target_lf that correspond to properties overwritten by @overlay in @fdto.
+ *
+ * returns:
+ *      0 on success
+ *      Negative error code on failure
+ */
+static int overlay_clear_overwritten_local_fixups(void *fdt, int target_lf,
+						  const void *fdto, int overlay)
+{
+	int prop, subnode;
+
+	fdt_for_each_property_offset(prop, fdto, overlay) {
+		const char *name;
+		const void *val;
+		int len, ret;
+
+		val = fdt_getprop_by_offset(fdto, prop, &name, &len);
+		if (!val)
+			return len;
+
+		ret = fdt_delprop(fdt, target_lf, name);
+		if (ret && ret != -FDT_ERR_NOTFOUND)
+			return ret;
+	}
+
+	fdt_for_each_subnode(subnode, fdto, overlay) {
+		const char *name;
+		int namelen, sub_lf, ret;
+
+		name = fdt_get_name(fdto, subnode, &namelen);
+		if (!name)
+			return namelen;
+
+		sub_lf = fdt_subnode_offset_namelen(fdt, target_lf, name,
+						    namelen);
+		if (sub_lf == -FDT_ERR_NOTFOUND)
+			continue;
+		if (sub_lf < 0)
+			return sub_lf;
+
+		ret = overlay_clear_overwritten_local_fixups(fdt, sub_lf,
+							     fdto, subnode);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * overlay_add_local_fixup_offset - Insert a sorted u32 offset into a local fixup property
+ * @fdt: Base Device Tree blob
+ * @lf_node: Node offset in @fdt's /__local_fixups__ subtree
+ * @name: Property name to update
+ * @name_len: Length of @name in bytes
+ * @poffset: Byte offset of the phandle reference within the target property
+ *
+ * overlay_add_local_fixup_offset() inserts @poffset in ascending sorted order
+ * (ignoring duplicates) into the u32 array property @name on @lf_node.
+ *
+ * returns:
+ *      0 on success
+ *      Negative error code on failure
+ */
+static int overlay_add_local_fixup_offset(void *fdt, int lf_node,
+					  const char *name, int name_len,
+					  uint32_t poffset)
+{
+	const fdt32_t *old_val;
+	fdt32_t *vals;
+	void *prop_data;
+	int old_len, count, i, idx, ret;
+
+	old_val = fdt_getprop_namelen(fdt, lf_node, name, name_len, &old_len);
+	if (!old_val && old_len != -FDT_ERR_NOTFOUND)
+		return old_len;
+
+	if (!old_val) {
+		old_len = 0;
+		count = 0;
+		idx = 0;
+	} else {
+		if (old_len % sizeof(uint32_t))
+			return -FDT_ERR_BADSTRUCTURE;
+		count = old_len / sizeof(uint32_t);
+		idx = count;
+		for (i = 0; i < count; i++) {
+			uint32_t cur = fdt32_ld(old_val + i);
+
+			if (cur == poffset)
+				return 0;
+			if (cur > poffset) {
+				idx = i;
+				break;
+			}
+		}
+	}
+
+	ret = fdt_setprop_placeholder_namelen(fdt, lf_node, name, name_len,
+					      old_len + sizeof(uint32_t),
+					      &prop_data);
+	if (ret)
+		return ret;
+
+	vals = prop_data;
+	if (idx < count)
+		memmove(vals + idx + 1, vals + idx,
+			(count - idx) * sizeof(uint32_t));
+	fdt32_st(vals + idx, poffset);
+
+	return 0;
+}
+
+/**
+ * overlay_merge_fixup_into_local_fixups - Record one /__fixups__ property for a fragment
+ * @fdt: Base Device Tree blob
+ * @fdto: Device tree overlay blob
+ * @property: Property offset in @fdto's /__fixups__ node
+ * @fragment: Node offset of the current fragment in @fdto
+ * @target_frag_name: Name of @fragment
+ * @target_frag_len: Length of @target_frag_name in bytes
+ * @target_lfp: In/out cached node offset of @fragment under @fdt's /__local_fixups__
+ *
+ * overlay_merge_fixup_into_local_fixups() parses all "path:prop:offset" entries
+ * in a single /__fixups__ property of @fdto and adds the resolved property
+ * byte offsets belonging to @fragment into @fdt's /__local_fixups__ subtree.
+ *
+ * returns:
+ *      0 on success
+ *      Negative error code on failure
+ */
+static int overlay_merge_fixup_into_local_fixups(void *fdt, const void *fdto,
+						 int property, int fragment,
+						 const char *target_frag_name,
+						 int target_frag_len,
+						 int *target_lfp)
+{
+	const char *value, *label;
+	int len;
+
+	value = fdt_getprop_by_offset(fdto, property, &label, &len);
+	if (!value)
+		return len;
+
+	do {
+		const char *path, *name, *frag_name, *rel_path;
+		uint32_t path_len, name_len, poffset;
+		int frag_name_len, rel_path_len, lf_node, ret;
+		bool is_overlay;
+
+		ret = overlay_parse_fixup_entry(&value, &len, &path, &path_len,
+						&name, &name_len, &poffset);
+		if (ret)
+			return ret;
+
+		ret = overlay_split_fragment_path(path, path_len,
+						  &frag_name, &frag_name_len,
+						  &rel_path, &rel_path_len,
+						  &is_overlay);
+		if (ret)
+			return ret;
+		if (!is_overlay)
+			continue;
+
+		if (frag_name_len != target_frag_len ||
+		    memcmp(frag_name, target_frag_name, frag_name_len) != 0)
+			continue;
+
+		if (*target_lfp < 0) {
+			*target_lfp = overlay_fragment_local_fixups(
+				fdt, fdto, fragment, true);
+			if (*target_lfp < 0)
+				return *target_lfp;
+		}
+
+		lf_node = overlay_create_path(fdt, *target_lfp, rel_path,
+					      rel_path_len);
+		if (lf_node < 0)
+			return lf_node;
+
+		ret = overlay_add_local_fixup_offset(fdt, lf_node, name,
+						     name_len, poffset);
+		if (ret)
+			return ret;
+	} while (len > 0);
+
+	return 0;
+}
+
+/**
+ * overlay_merge_fixups_into_local_fixups - Record resolved /__fixups__ for a fragment
+ * @fdt: Base Device Tree blob
+ * @fdto: Device tree overlay blob
+ * @fragment: Node offset of the current fragment in @fdto
+ * @frag_name: Name of @fragment
+ * @frag_name_len: Length of @frag_name in bytes
+ * @target_lfp: In/out cached node offset of @fragment under @fdt's /__local_fixups__
+ *
+ * overlay_merge_fixups_into_local_fixups() parses external phandle references
+ * belonging to @fragment in @fdto's /__fixups__ node and records their resolved
+ * property byte offsets in @fdt's /__local_fixups__ subtree.
+ *
+ * returns:
+ *      0 on success
+ *      Negative error code on failure
+ */
+static int overlay_merge_fixups_into_local_fixups(void *fdt, const void *fdto,
+						  int fragment,
+						  const char *frag_name,
+						  int frag_name_len,
+						  int *target_lfp)
+{
+	int fixups_off, prop;
+
+	fixups_off = fdt_subnode_offset(fdto, 0, "__fixups__");
+	if (fixups_off == -FDT_ERR_NOTFOUND)
+		return 0;
+	if (fixups_off < 0)
+		return fixups_off;
+
+	fdt_for_each_property_offset(prop, fdto, fixups_off) {
+		int ret;
+
+		ret = overlay_merge_fixup_into_local_fixups(
+			fdt, fdto, prop, fragment, frag_name, frag_name_len,
+			target_lfp);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * overlay_prune_empty_local_fixups - Remove empty subnodes from /__local_fixups__
+ * @fdt: Base Device Tree blob
+ * @lf_node: Node offset in @fdt's /__local_fixups__ subtree
+ *
+ * overlay_prune_empty_local_fixups() recursively deletes any child subnodes
+ * under @lf_node that have neither properties nor subnodes remaining.
+ *
+ * returns:
+ *      0 on success
+ *      Negative error code on failure
+ */
+static int overlay_prune_empty_local_fixups(void *fdt, int lf_node)
+{
+	int subnode = fdt_first_subnode(fdt, lf_node);
+
+	while (subnode >= 0) {
+		int next, ret;
+
+		ret = overlay_prune_empty_local_fixups(fdt, subnode);
+		if (ret < 0)
+			return ret;
+
+		next = fdt_next_subnode(fdt, subnode);
+		if (fdt_first_property_offset(fdt, subnode) == -FDT_ERR_NOTFOUND &&
+		    fdt_first_subnode(fdt, subnode) == -FDT_ERR_NOTFOUND) {
+			int old_struct_size = fdt_size_dt_struct(fdt);
+
+			ret = fdt_del_node(fdt, subnode);
+			if (ret < 0)
+				return ret;
+			if (next >= 0)
+				next += fdt_size_dt_struct(fdt) -
+					old_struct_size;
+		}
+		subnode = next;
+	}
+
+	return 0;
+}
+
+/**
+ * overlay_validate_local_fixups - Validate /__local_fixups__ fragment nodes in overlay
+ * @fdto: Device tree overlay blob
+ * @ov_lf_root: Node offset of /__local_fixups__ in @fdto
+ *
+ * overlay_validate_local_fixups() verifies that every fragment subnode under
+ * @ov_lf_root that contains an __overlay__ subnode corresponds to a valid
+ * fragment node at the root of @fdto.
+ *
+ * returns:
+ *      0 on success
+ *      Negative error code on failure
+ */
+static int overlay_validate_local_fixups(const void *fdto, int ov_lf_root)
+{
+	int lf_frag;
+
+	fdt_for_each_subnode(lf_frag, fdto, ov_lf_root) {
+		const char *frag_name;
+		int frag_name_len, lf_overlay, fragment;
+
+		frag_name = fdt_get_name(fdto, lf_frag, &frag_name_len);
+		if (!frag_name)
+			return frag_name_len;
+
+		lf_overlay = fdt_subnode_offset(fdto, lf_frag, "__overlay__");
+		if (lf_overlay == -FDT_ERR_NOTFOUND)
+			continue;
+		if (lf_overlay < 0)
+			return lf_overlay;
+
+		fragment = fdt_subnode_offset_namelen(fdto, 0, frag_name,
+						      frag_name_len);
+		if (fragment < 0)
+			return -FDT_ERR_BADOVERLAY;
+
+		if (fdt_subnode_offset(fdto, fragment, "__overlay__") < 0)
+			return -FDT_ERR_BADOVERLAY;
+	}
+
+	return 0;
+}
+
+/**
+ * overlay_fragment_local_fixups_src - Find a fragment's __overlay__ in overlay /__local_fixups__
+ * @fdto: Device tree overlay blob
+ * @ov_lf_root: Node offset of /__local_fixups__ in @fdto (or -FDT_ERR_NOTFOUND)
+ * @frag_name: Name of the fragment node
+ * @frag_name_len: Length of @frag_name in bytes
+ *
+ * overlay_fragment_local_fixups_src() locates the __overlay__ subnode for
+ * @frag_name under @ov_lf_root in @fdto.
+ *
+ * returns:
+ *      Node offset of /__local_fixups__/<frag_name>/__overlay__ on success
+ *      -FDT_ERR_NOTFOUND if @ov_lf_root, <frag_name>, or __overlay__ is absent
+ *      Negative error code on other failures
+ */
+static int overlay_fragment_local_fixups_src(const void *fdto, int ov_lf_root,
+					     const char *frag_name,
+					     int frag_name_len)
+{
+	int lf_frag;
+
+	if (ov_lf_root < 0)
+		return -FDT_ERR_NOTFOUND;
+
+	lf_frag = fdt_subnode_offset_namelen(fdto, ov_lf_root, frag_name,
+					     frag_name_len);
+	if (lf_frag < 0)
+		return lf_frag;
+
+	return fdt_subnode_offset(fdto, lf_frag, "__overlay__");
+}
+
+/**
+ * overlay_fragment_update_local_fixups - Update base /__local_fixups__ for one fragment
+ * @fdt: Base Device Tree blob
+ * @fdto: Device tree overlay blob
+ * @fragment: Node offset of the fragment in @fdto
+ * @ov_lf_root: Node offset of /__local_fixups__ in @fdto (or -FDT_ERR_NOTFOUND)
+ *
+ * overlay_fragment_update_local_fixups() clears any base /__local_fixups__
+ * entries overwritten by @fragment, then merges phandle offsets for @fragment
+ * from @fdto's /__local_fixups__ and /__fixups__ subtrees.
+ *
+ * returns:
+ *      0 on success
+ *      Negative error code on failure
+ */
+static int overlay_fragment_update_local_fixups(void *fdt, const void *fdto,
+						int fragment, int ov_lf_root)
+{
+	const char *frag_name;
+	int frag_name_len, overlay, target_lf, lf_overlay, ret;
+
+	overlay = fdt_subnode_offset(fdto, fragment, "__overlay__");
+	if (overlay == -FDT_ERR_NOTFOUND)
+		return 0;
+	if (overlay < 0)
+		return overlay;
+
+	frag_name = fdt_get_name(fdto, fragment, &frag_name_len);
+	if (!frag_name)
+		return frag_name_len;
+
+	target_lf = overlay_fragment_local_fixups(fdt, fdto, fragment, false);
+	if (target_lf < 0 && target_lf != -FDT_ERR_NOTFOUND)
+		return target_lf;
+
+	if (target_lf >= 0) {
+		ret = overlay_clear_overwritten_local_fixups(fdt, target_lf,
+							     fdto, overlay);
+		if (ret)
+			return ret;
+	}
+
+	lf_overlay = overlay_fragment_local_fixups_src(fdto, ov_lf_root,
+						       frag_name,
+						       frag_name_len);
+	if (lf_overlay < 0 && lf_overlay != -FDT_ERR_NOTFOUND)
+		return lf_overlay;
+
+	if (lf_overlay >= 0) {
+		if (target_lf < 0)
+			target_lf = overlay_fragment_local_fixups(fdt, fdto,
+								  fragment,
+								  true);
+		if (target_lf < 0)
+			return target_lf;
+
+		ret = overlay_apply_node(fdt, target_lf, fdto, lf_overlay);
+		if (ret)
+			return ret;
+	}
+
+	return overlay_merge_fixups_into_local_fixups(
+		fdt, fdto, fragment, frag_name, frag_name_len, &target_lf);
+}
+
+/**
+ * overlay_local_fixups_update - Update base /__local_fixups__ with overlay fixups
+ * @fdt: Base Device Tree blob
+ * @fdto: Device tree overlay blob
+ *
+ * overlay_local_fixups_update() updates the base device tree's
+ * /__local_fixups__ subtree (when present) by walking each overlay fragment in
+ * application order, clearing entries for properties overwritten by that
+ * fragment, and merging phandle reference offsets from @fdto's
+ * /__local_fixups__ and /__fixups__ subtrees.
+ *
+ * This is part of the device tree overlay application process, when you want
+ * the merged device tree to retain complete local phandle fixup metadata.
+ *
+ * returns:
+ *      0 on success
+ *      Negative error code on failure
+ */
+static int overlay_local_fixups_update(void *fdt, const void *fdto)
+{
+	int root_lf, ov_lf_root, fragment, ret;
+
+	root_lf = fdt_subnode_offset(fdt, 0, "__local_fixups__");
+	if (root_lf == -FDT_ERR_NOTFOUND)
+		return 0;
+	if (root_lf < 0)
+		return root_lf;
+
+	ov_lf_root = fdt_subnode_offset(fdto, 0, "__local_fixups__");
+	if (ov_lf_root >= 0) {
+		ret = overlay_validate_local_fixups(fdto, ov_lf_root);
+		if (ret)
+			return ret;
+	} else if (ov_lf_root != -FDT_ERR_NOTFOUND) {
+		return ov_lf_root;
+	}
+
+	/*
+	 * Process fragments in application order so that if a later fragment in
+	 * fdto overwrites a property modified by an earlier fragment, the
+	 * earlier fragment's local fixups for that property are cleared first.
+	 */
+	fdt_for_each_subnode(fragment, fdto, 0) {
+		ret = overlay_fragment_update_local_fixups(fdt, fdto, fragment,
+							   ov_lf_root);
+		if (ret)
+			return ret;
+	}
+
+	root_lf = fdt_subnode_offset(fdt, 0, "__local_fixups__");
+	if (root_lf < 0)
+		return root_lf;
+
+	return overlay_prune_empty_local_fixups(fdt, root_lf);
+}
+
 int fdt_overlay_apply(void *fdt, void *fdto)
 {
 	uint32_t delta;
@@ -1162,6 +1771,10 @@ int fdt_overlay_apply(void *fdt, void *fdto)
 	if (ret)
 		goto err;
 
+	ret = overlay_local_fixups_update(fdt, fdto);
+	if (ret)
+		goto err;
+
 	/*
 	 * The overlay has been damaged, erase its magic.
 	 */
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 842b543059bb..e232c86aab37 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -1089,6 +1089,25 @@ fdtoverlay_tests() {
 
     shorten_echo "check phandle to noda d wasn't overwritten:	"
     run_wrap_test test "$bd" = "$pd"
+
+    # verify that /__local_fixups__ in a -L base blob is updated when applying an overlay
+    run_dtc_test -@ -L -I dts -O dtb -o overlay_base_phandle_lf.test.dtb "$SRCDIR/overlay_base_phandle.dts"
+    run_wrap_test $FDTOVERLAY -i overlay_base_phandle_lf.test.dtb -o overlay_base_phandle_lfO.test.dtb overlay_overlay_phandle.test.dtb
+    run_fdtget_test 0 overlay_base_phandle_lfO.test.dtb /__local_fixups__/b a
+    run_fdtget_test 0 overlay_base_phandle_lfO.test.dtb /__local_fixups__/b d
+    run_fdtget_test 0 overlay_base_phandle_lfO.test.dtb /__local_fixups__/c b
+    run_fdtget_test 0 overlay_base_phandle_lfO.test.dtb /__local_fixups__/d a
+    run_fdtget_test 0 overlay_base_phandle_lfO.test.dtb /__local_fixups__/d b
+    run_fdtget_test 0 overlay_base_phandle_lfO.test.dtb /__local_fixups__/d c
+
+    run_dtc_test -@ -L -I dts -O dtb -o overlay_base_lf.test.dtb "$SRCDIR/overlay_base.dts"
+    run_wrap_test $DTPUT overlay_base_lf.test.dtb -cp /__local_fixups__/test-node/sub-test-node
+    run_wrap_test $DTPUT overlay_base_lf.test.dtb /__local_fixups__/test-node/sub-test-node new-sub-test-property -tu 0
+    run_dtc_test -@ -I dts -O dtb -o overlay_overlay.fdtoverlay.test.dtb "$SRCDIR/overlay_overlay.dts"
+    run_wrap_test $FDTOVERLAY -i overlay_base_lf.test.dtb -o overlay_base_lfO.test.dtb overlay_overlay.fdtoverlay.test.dtb
+    run_fdtget_test "0 4" overlay_base_lfO.test.dtb /__local_fixups__/test-node test-phandle
+    run_fdtget_test "0 4" overlay_base_lfO.test.dtb /__local_fixups__/test-node test-several-phandle
+    run_test check_path overlay_base_lfO.test.dtb not-exists "/__local_fixups__/test-node/sub-test-node"
 }
 
 pylibfdt_tests () {
-- 
2.56.0.313.g2479322e68-goog

