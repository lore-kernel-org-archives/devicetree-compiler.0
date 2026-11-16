Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862445;
	b=mHbODxSGT2pgF5/4gYpIu3r6gYaYHn1tjlg1ZYXws/eKYJMihunpYB4/SERnznJT9K2w
	 C+EGVAZLH7jDLD0Ss0RRqELucZSymez+7nvgtfWBhtNy8aGlolPTytTnVrciRgtemxbrB
	 TYEqCeIqjXuPeiRZeJijNE14tX1oL+zG1la8z0APUfgRJNtC4rRQlRLihlHR9yb0+y41r
	 p6vlKahB6FDcqFKQa56dZRmZZhiC3fdARobaoxhIUQ/lBTghyUOSzEc+3fper6H9X+Hsy
	 8mqjhObDvezFn3YYHMsdsRk+kXJTCoIB7oR0p1zFARs/3guQ+Lu4osSF/keXjFOupvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862445;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vuMDWz7RzdbsD5AWUeHvrSqM4wfQElSGWxJaG+4UjeE=;
	b=ZfFircEt+SH8PBn7cfXGA7imndxGZ3Nqy2tXYakBH7UNwCl/BDOmuW5A+70qZzwod5he
	 4shjFVaLMyVLXNgvin+YyURqyOuaXdZm+ymn/f7DsoEGA5/5ViZJmBtzJmOaZzHiqJSlO
	 TWTLG2Y4hW+Wsr8laO9JOGCOC6VSiC6rFTyEeidpqsBq5SqJihvg7q+mzQz9JPP9f+Nth
	 7w1Wfq965VRSQyURju2jpfZVUhKWHZoaqoR9ylf5jTlkcEZEhuqLgAbPxvRyEcN9MfzG5
	 T32y6TLbhsXYdp2oYJcEtAh/TUtD+2Kem554Mql0gSRRfRFiNWuQ2K9pmNPuCaUcGXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=kkipiSt4;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8CF6606A332
	for <Devicetree-compiler@vger.kernel.org>; Mon, 16 Nov 2026 20:54:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8CF6606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=kkipiSt4
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-37071c0f42aso5808177eec.0
        for <Devicetree-compiler@vger.kernel.org>; Mon, 16 Nov 2026 12:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794862443; x=1795467243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vuMDWz7RzdbsD5AWUeHvrSqM4wfQElSGWxJaG+4UjeE=;
        b=kkipiSt4mv2DkCnUwHbsVM5cOWaGOKdiAy2OcZbPTpyBZUxgf7dcsFcWlGz7KNjMVw
         bGVjrQ2f+Qd2S7+uk1lASH4jO4S9XVC7VSfjbNFOV4rZKJXtKoDE0DhFlkq2YqYcdmdG
         HO4L3QHVNmGrFxoO9w7/pN+hd74QlGEIznU/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794862443; x=1795467243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vuMDWz7RzdbsD5AWUeHvrSqM4wfQElSGWxJaG+4UjeE=;
        b=h41qw59zk6LDNXFQ2fJNMABsT5F0Vi8FPQKNVgV/rOrK+y2QlJO/7fnxoTC57nO403
         egpIMwL0ebNawPi8woE8p0zsL/Y8wLAqRZiZQXQ/CnHqjB1Khd9+muNerThP65EwM1WW
         uUnFbV45kyrQmpentOCxD5VgH8cpCV/PNhd3IqVczUWi+TiYCmupySgNIl1n9vVMMk9F
         fIJzLhShvrCQRr9ffFqoaobzPzDHgULrEKJ/2yDnIHM46frd2V6t5PDGB8xrYY4rvDJ+
         Tw9pRULodfgsIZfrz9JzhNzGdJBUXl141uFDQtCgYTTBtj0e3Nxpg1KjCLXyla/GmJhy
         IXmg==
X-Gm-Message-State: APuU4Z9Yxf5f7oxmIbGX4+/xGXzYolMw3+tqownn3lHKX3cBqMoIGgIH
	m5KNZJjCdhOkmAYjEsY++WBKgrnDo2hxSEaZ0WE1j07pujuNZg12EtkK+V5Z/wzem8eY9tMNxbe
	TMpWwUw==
X-Gm-Gg: AZFdTZd4adbo4xy8gryu7i/uxwEUTgStZSpF5zpxzcw6R5j7EgBVvlmo6NLnCwpxCfO
	BsZpamkFLq2Hw4LqPr7AiY5Nd4coulDkvoZzKev1rtgpfqgw5zQhUwE0Q2L10fBVkTduYY17v7W
	81dBBJL5rjRvaQivDFMrKXxE7TcNchO5zM8VHbzIgrMjAGtqd3UXmB68ZXAR2ptWidABzFXipji
	0R0TysejqntItWd7ULSiEFy2ePktbOBeZulcS5h6KFGVYS2qqOX0Su7B9bOoI4xfr14FeXb4i6D
	r8wGB7bsjFJ5p8USwehnLv/5Sh5qySeT9h74JUIUX9jovQufvPGHCkKl3CRPiOIyK/rWUNpnifX
	xT7msGWS3W1J7wKHIujCyCW57x2RO2JzHluj5kAm2HO7pM7ekiHhg7uMDDME7Z5u/IGEpgyigTi
	5g7+4zyRDKFLOzMP9SV3fDvPwmq234JIXyhQwnaEWEu3yglQ7/ekFHOSbHzZkKGfTfq5ZycbEJN
	CiRO48z8qlNGX41tmTh8YtjsGFES3XgaqWnVE5jgV1Wp/mhcytZcWL6YG+NqVXdrBV7Ot3hRABg
	T/Os6oSzhkrlYpjYwG2BZmG86AsWQljC+Bk6nb2S7jdGZJqo8XqRRmdEpkkSbA8F2NAghV7bpg9
	+a9ayz9i3F1+o/g==
X-Received: by 2002:a05:693c:2801:b0:369:d8e1:7bb6 with SMTP id 5a478bee46e88-37967ed6d47mr10414770eec.25.1794862442532;
        Mon, 16 Nov 2026 12:54:02 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:40c8:6e27:a2df:3321])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm67120390eec.21.2026.11.16.12.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:54:00 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Devicetree@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Saravana Kannan <saravanak@kernel.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Simon Glass <sjg@chromium.org>,
	linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Julius Werner <jwerner@chromium.org>,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v4 09/14] libfdt: overlay: Update base /__local_fixups__ on apply
Date: Mon, 16 Nov 2026 12:53:06 -0800
Message-ID: <20261116205320.1621386-10-dianders@chromium.org>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
In-Reply-To: <20261116205320.1621386-1-dianders@chromium.org>
References: <20261116205320.1621386-1-dianders@chromium.org>
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
all phandle references in its properties (for example, so an OS kernel
can identify phandle cells at runtime, so a composite `.dtb` built by
`fdtoverlay` such as Linux's `foo-dtbs := base.dtb bar.dtbo` retains
complete phandle metadata for tools like `fdtfactor`, or so a merged
tree matches what `dtc -L` produces).

`fdt_overlay_apply()` updates the base tree's `/__symbols__` via
`overlay_symbol_update()`, but leaves the base tree's
`/__local_fixups__` untouched. As a result, applying an overlay to a
base tree with `/__local_fixups__` leaves `/__local_fixups__` missing
the phandle references introduced by the overlay (both from the
overlay's `/__local_fixups__` and from its resolved `/__fixups__`), and
leaves stale offsets if the overlay overwrites a base property that
previously had phandle references.

Add `overlay_local_fixups_update()`, controlled by a 3-state
compile-time `FDT_OVERLAY_LOCAL_FIXUPS` setting in
`libfdt/libfdt_internal.h`:

- `0` (`FDT_OVERLAY_LOCAL_FIXUPS_IGNORE`): Leave `/__local_fixups__`
  untouched. This is the `#ifndef` fallback in `libfdt_internal.h` so
  that size-sensitive embedded environments (such as U-Boot SPL) that
  vendor `libfdt` directly get zero code-size increase and no behavior
  change unless they opt in.
- `1` (`FDT_OVERLAY_LOCAL_FIXUPS_STRIP`): Delete `/__local_fixups__`
  from the base tree if present (~50 bytes of code), avoiding leaving a
  stale/incomplete `/__local_fixups__` node in the merged tree.
- `2` (`FDT_OVERLAY_LOCAL_FIXUPS_UPDATE`): Fully update the base tree's
  `/__local_fixups__` node when present (clearing entries for
  overwritten properties, merging offsets from the overlay's
  `/__local_fixups__` and `/__fixups__` in sorted ascending order, and
  pruning any subnodes that become empty). This is enabled by default in
  `dtc`'s Meson (`-Doverlay-local-fixups=2`) and Make
  (`OVERLAY_LOCAL_FIXUPS=2`) builds for desktop tools and tests.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4:
- Split out internal helper fdt_add_empty_subnode_() so
  overlay_fragment_local_fixups() avoids passing an in-blob pointer to
  fdt_add_subnode_namelen() or casting fdt_get_name() (Simon Glass)
- Add test cases in tests/overlay.c where the overlay target has no
  existing subnode under /__local_fixups__, with /__local_fixups__ both
  before and after the target in the blob (Simon Glass)
- Pass OVERLAY_LOCAL_FIXUPS to tests/run_tests.sh, adjust
  fdtoverlay_tests for all three modes, and use 4-space indentation
  (Simon Glass, David Gibson)

Changes in v3:
- Move constifying fdto in overlay_apply_node() into a standalone
  preparatory patch (David Gibson)
- Gate `/__local_fixups__` handling behind a 3-state compile-time
  `FDT_OVERLAY_LOCAL_FIXUPS` flag (`0=ignore`, `1=strip`, `2=update`),
  defaulting to `0` (`IGNORE`) in `libfdt_internal.h` for embedded
  builds and `2` (`UPDATE`) in Meson/Make desktop builds (Simon Glass,
  David Gibson)
- Rewrite commit message in the present tense with motivation up front,
  and update `fdt_overlay_apply()` documentation in `libfdt/libfdt.h`
  (Simon Glass)
- Require a strict relative path in `overlay_create_path()` and return
  `-FDT_ERR_BADOVERLAY` on empty path components or trailing `'/'`
  (David Gibson)
- Eliminate the 256-byte `namebuf` limit in
  `overlay_fragment_local_fixups()` by re-reading the node name from the
  shifted ancestor offset after `fdt_add_subnode_namelen()` (David
  Gibson, Simon Glass)
- Return `-FDT_ERR_BADVALUE` instead of `-FDT_ERR_BADSTRUCTURE` in
  `overlay_add_local_fixup_offset()` when an existing
  `/__local_fixups__` property length is not a multiple of 4 (David
  Gibson, Simon Glass)
- Drop redundant `overlay_validate_local_fixups()` pre-pass and inline
  single-use helpers (Simon Glass)

Changes in v2:
- New patch updating base /__local_fixups__ in libfdt
  fdt_overlay_apply() instead of stripping /__local_fixups__ by default
  (David Gibson)

 Makefile                 |   6 +-
 libfdt/fdt_overlay.c     | 525 ++++++++++++++++++++++++++++++++++++++-
 libfdt/fdt_rw.c          |  37 ++-
 libfdt/libfdt.h          |   7 +
 libfdt/libfdt_internal.h |  23 ++
 meson.build              |   5 +
 meson_options.txt        |   2 +
 tests/Makefile.tests     |   6 +-
 tests/meson.build        |   1 +
 tests/overlay.c          | 154 ++++++++++++
 tests/run_tests.sh       |  32 +++
 11 files changed, 780 insertions(+), 18 deletions(-)

diff --git a/Makefile b/Makefile
index 9110d17796b0..1560a5609fea 100644
--- a/Makefile
+++ b/Makefile
@@ -21,7 +21,11 @@ CONFIG_LOCALVERSION =
 # See libfdt_internal.h for details
 ASSUME_MASK ?= 0
 
-CPPFLAGS = -I libfdt -I . -DFDT_ASSUME_MASK=$(ASSUME_MASK)
+# Control how fdt_overlay_apply() handles base /__local_fixups__ (0=ignore, 1=strip, 2=update)
+# See libfdt_internal.h for details
+OVERLAY_LOCAL_FIXUPS ?= 2
+
+CPPFLAGS = -I libfdt -I . -DFDT_ASSUME_MASK=$(ASSUME_MASK) -DFDT_OVERLAY_LOCAL_FIXUPS=$(OVERLAY_LOCAL_FIXUPS)
 WARNINGS = -Wall -Wpointer-arith -Wcast-qual -Wnested-externs -Wsign-compare \
 	-Wstrict-prototypes -Wmissing-prototypes -Wredundant-decls -Wshadow \
 	-Wwrite-strings
diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
index 4b3e17bd087e..fb76fbafa661 100644
--- a/libfdt/fdt_overlay.c
+++ b/libfdt/fdt_overlay.c
@@ -1019,9 +1019,8 @@ static int overlay_split_fragment_path(const char *path, int path_len,
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
@@ -1135,6 +1134,522 @@ static int overlay_symbol_update(void *fdt, void *fdto)
 	return 0;
 }
 
+#if FDT_OVERLAY_LOCAL_FIXUPS == FDT_OVERLAY_LOCAL_FIXUPS_UPDATE
+/**
+ * overlay_create_path - Create a relative path under a parent node
+ * @fdt: Base Device Tree blob
+ * @parent: Node offset of the starting parent node
+ * @path: Relative path to traverse (must not start or end with '/' or contain "//")
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
+	int node = parent;
+
+	while (path_len > 0) {
+		const char *sep = memchr(path, '/', path_len);
+		int comp_len = sep ? (sep - path) : path_len;
+		int next;
+
+		if (!comp_len)
+			return -FDT_ERR_BADOVERLAY;
+
+		next = fdt_subnode_offset_namelen(fdt, node, path, comp_len);
+		if (next == -FDT_ERR_NOTFOUND)
+			next = fdt_add_subnode_namelen(fdt, node, path,
+						       comp_len);
+		if (next < 0)
+			return next;
+		node = next;
+
+		if (!sep)
+			break;
+		path += comp_len + 1;
+		path_len -= comp_len + 1;
+		if (!path_len)
+			return -FDT_ERR_BADOVERLAY;
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
+			int old_struct_size = fdt_size_dt_struct(fdt);
+			char *new_name;
+
+			next_lf = fdt_add_empty_subnode_(fdt, node, namelen,
+							 &new_name);
+			if (next_lf < 0)
+				return next_lf;
+			if (next_lf <= ancestor) {
+				int delta = fdt_size_dt_struct(fdt) -
+					    old_struct_size;
+
+				target += delta;
+				ancestor += delta;
+				name = fdt_get_name(fdt, ancestor, NULL);
+			}
+			memcpy(new_name, name, namelen);
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
+			return -FDT_ERR_BADVALUE;
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
+ * overlay_merge_fixups_into_local_fixups - Record resolved /__fixups__ for a fragment
+ * @fdt: Base Device Tree blob
+ * @fdto: Device tree overlay blob
+ * @fragment: Node offset of the current fragment in @fdto
+ * @target_frag_name: Name of @fragment
+ * @target_frag_len: Length of @target_frag_name in bytes
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
+						  const char *target_frag_name,
+						  int target_frag_len,
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
+		const char *value, *label;
+		int len;
+
+		value = fdt_getprop_by_offset(fdto, prop, &label, &len);
+		if (!value)
+			return len;
+
+		do {
+			const char *path, *name, *frag_name, *rel_path;
+			uint32_t path_len, name_len, poffset;
+			int frag_name_len, rel_path_len, lf_node, ret;
+
+			ret = overlay_parse_fixup_entry(&value, &len, &path,
+							&path_len, &name,
+							&name_len, &poffset);
+			if (ret)
+				return ret;
+
+			ret = overlay_split_fragment_path(path, path_len,
+							  &frag_name,
+							  &frag_name_len,
+							  &rel_path,
+							  &rel_path_len);
+			if (ret < 0)
+				return ret;
+			if (!ret)
+				continue;
+
+			if (frag_name_len != target_frag_len ||
+			    memcmp(frag_name, target_frag_name,
+				   frag_name_len) != 0)
+				continue;
+
+			if (*target_lfp < 0) {
+				*target_lfp = overlay_fragment_local_fixups(
+					fdt, fdto, fragment, true);
+				if (*target_lfp < 0)
+					return *target_lfp;
+			}
+
+			lf_node = overlay_create_path(fdt, *target_lfp,
+						      rel_path, rel_path_len);
+			if (lf_node < 0)
+				return lf_node;
+
+			ret = overlay_add_local_fixup_offset(fdt, lf_node,
+							     name, name_len,
+							     poffset);
+			if (ret)
+				return ret;
+		} while (len > 0);
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
+	int frag_name_len, overlay, target_lf, lf_frag, lf_overlay, ret;
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
+	lf_overlay = -FDT_ERR_NOTFOUND;
+	if (ov_lf_root >= 0) {
+		lf_frag = fdt_subnode_offset_namelen(fdto, ov_lf_root,
+						     frag_name, frag_name_len);
+		if (lf_frag >= 0)
+			lf_overlay = fdt_subnode_offset(fdto, lf_frag,
+							"__overlay__");
+		else if (lf_frag != -FDT_ERR_NOTFOUND)
+			return lf_frag;
+	}
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
+	if (ov_lf_root < 0 && ov_lf_root != -FDT_ERR_NOTFOUND)
+		return ov_lf_root;
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
+#elif FDT_OVERLAY_LOCAL_FIXUPS == FDT_OVERLAY_LOCAL_FIXUPS_STRIP
+static int overlay_local_fixups_update(void *fdt, const void *fdto)
+{
+	int root_lf = fdt_subnode_offset(fdt, 0, "__local_fixups__");
+
+	if (root_lf == -FDT_ERR_NOTFOUND)
+		return 0;
+	if (root_lf < 0)
+		return root_lf;
+
+	return fdt_del_node(fdt, root_lf);
+}
+#else
+static int overlay_local_fixups_update(void *fdt, const void *fdto)
+{
+	return 0;
+}
+#endif
+
 int fdt_overlay_apply(void *fdt, void *fdto)
 {
 	uint32_t delta;
@@ -1175,6 +1690,10 @@ int fdt_overlay_apply(void *fdt, void *fdto)
 	if (ret)
 		goto err;
 
+	ret = overlay_local_fixups_update(fdt, fdto);
+	if (ret)
+		goto err;
+
 	/*
 	 * The overlay has been damaged, erase its magic.
 	 */
diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
index 850aafe44d27..99048f135cb5 100644
--- a/libfdt/fdt_rw.c
+++ b/libfdt/fdt_rw.c
@@ -365,8 +365,8 @@ int fdt_delprop(void *fdt, int nodeoffset, const char *name)
 	return fdt_splice_struct_(fdt, prop, proplen, 0);
 }
 
-int fdt_add_subnode_namelen(void *fdt, int parentoffset,
-			    const char *name, int namelen)
+int fdt_add_empty_subnode_(void *fdt, int parentoffset, int namelen,
+			   char **namep)
 {
 	struct fdt_node_header *nh;
 	int offset, nextoffset;
@@ -375,14 +375,6 @@ int fdt_add_subnode_namelen(void *fdt, int parentoffset,
 	uint32_t tag;
 	fdt32_t *endtag;
 
-	FDT_RW_PROBE(fdt);
-
-	offset = fdt_subnode_offset_namelen(fdt, parentoffset, name, namelen);
-	if (offset >= 0)
-		return -FDT_ERR_EXISTS;
-	else if (offset != -FDT_ERR_NOTFOUND)
-		return offset;
-
 	/* Try to place the new node after the parent's properties */
 	tag = fdt_next_tag(fdt, parentoffset, &nextoffset);
 	/* the fdt_subnode_offset_namelen() should ensure this never hits */
@@ -402,9 +394,32 @@ int fdt_add_subnode_namelen(void *fdt, int parentoffset,
 
 	nh->tag = cpu_to_fdt32(FDT_BEGIN_NODE);
 	memset(nh->name, 0, FDT_TAGALIGN(namelen+1));
-	memcpy(nh->name, name, namelen);
 	endtag = (fdt32_t *)((char *)nh + nodelen - FDT_TAGSIZE);
 	*endtag = cpu_to_fdt32(FDT_END_NODE);
+	*namep = nh->name;
+
+	return offset;
+}
+
+int fdt_add_subnode_namelen(void *fdt, int parentoffset,
+			    const char *name, int namelen)
+{
+	char *namep;
+	int offset;
+
+	FDT_RW_PROBE(fdt);
+
+	offset = fdt_subnode_offset_namelen(fdt, parentoffset, name, namelen);
+	if (offset >= 0)
+		return -FDT_ERR_EXISTS;
+	else if (offset != -FDT_ERR_NOTFOUND)
+		return offset;
+
+	offset = fdt_add_empty_subnode_(fdt, parentoffset, namelen, &namep);
+	if (offset < 0)
+		return offset;
+
+	memcpy(namep, name, namelen);
 
 	return offset;
 }
diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index c69a18edf09f..c2f47a7d3e87 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -2472,6 +2472,13 @@ int fdt_del_node(void *fdt, int nodeoffset);
  * fdt_overlay_apply() will apply the given device tree overlay on the
  * given base device tree.
  *
+ * If the base device tree contains a /__symbols__ node, it is updated with
+ * any symbols from the overlay. If the base device tree contains a
+ * /__local_fixups__ node, how it is handled depends on the build-time
+ * FDT_OVERLAY_LOCAL_FIXUPS setting (see libfdt_internal.h): left untouched
+ * (IGNORE), deleted (STRIP), or updated to reflect phandle references in the
+ * merged tree (UPDATE, the default when built via dtc's build system).
+ *
  * Expect the base device tree to be modified, even if the function
  * returns an error.
  *
diff --git a/libfdt/libfdt_internal.h b/libfdt/libfdt_internal.h
index eefea2a3ccf3..315a7022fc32 100644
--- a/libfdt/libfdt_internal.h
+++ b/libfdt/libfdt_internal.h
@@ -32,6 +32,8 @@ static inline const char *fdt_find_string_(const char *strtab, int tabsize,
 }
 
 int fdt_node_end_offset_(void *fdt, int nodeoffset);
+int fdt_add_empty_subnode_(void *fdt, int parentoffset, int namelen,
+			   char **namep);
 
 static inline const void *fdt_offset_ptr_(const void *fdt, int offset)
 {
@@ -99,6 +101,27 @@ static inline uint64_t fdt64_ld_(const fdt64_t *p)
 #define FDT_PARENT_MAX_DEPTH 32
 #endif
 
+/*
+ * Controls how fdt_overlay_apply() handles a /__local_fixups__ node in the
+ * base device tree:
+ *   0 (FDT_OVERLAY_LOCAL_FIXUPS_IGNORE): Leave /__local_fixups__ untouched
+ *     (zero extra code size and preserves historical behavior; default when
+ *     building libfdt standalone without dtc's build system).
+ *   1 (FDT_OVERLAY_LOCAL_FIXUPS_STRIP): Delete /__local_fixups__ from the
+ *     base device tree so a stale/incomplete /__local_fixups__ node is not
+ *     left behind (~50 bytes of code).
+ *   2 (FDT_OVERLAY_LOCAL_FIXUPS_UPDATE): Fully update /__local_fixups__ in
+ *     the base device tree with the overlay's local and resolved external
+ *     phandle fixups (default when building via dtc's Meson/Make build).
+ */
+#define FDT_OVERLAY_LOCAL_FIXUPS_IGNORE	0
+#define FDT_OVERLAY_LOCAL_FIXUPS_STRIP	1
+#define FDT_OVERLAY_LOCAL_FIXUPS_UPDATE	2
+
+#ifndef FDT_OVERLAY_LOCAL_FIXUPS
+#define FDT_OVERLAY_LOCAL_FIXUPS	FDT_OVERLAY_LOCAL_FIXUPS_IGNORE
+#endif
+
 /*
  * Defines assumptions which can be enabled. Each of these can be enabled
  * individually. For maximum safety, don't enable any assumptions!
diff --git a/meson.build b/meson.build
index 520cd35f9075..348d9b555e34 100644
--- a/meson.build
+++ b/meson.build
@@ -28,6 +28,11 @@ add_project_arguments(
   language: 'c'
 )
 
+add_project_arguments(
+  '-DFDT_OVERLAY_LOCAL_FIXUPS=' + get_option('overlay-local-fixups').to_string(),
+  language: 'c'
+)
+
 yamltree = 'yamltree.c'
 yaml = dependency('yaml-0.1', version: '>=0.2.3', required: get_option('yaml'))
 if not yaml.found()
diff --git a/meson_options.txt b/meson_options.txt
index a866b172e802..ac8ea4aa2a9f 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -2,6 +2,8 @@ option('tools', type: 'boolean', value: true,
        description: 'Build tools')
 option('assume-mask', type: 'integer', value: 0,
        description: 'Control the assumptions made (e.g. risking security issues) in the code.')
+option('overlay-local-fixups', type: 'integer', value: 2,
+       description: 'Control how fdt_overlay_apply() handles base /__local_fixups__ (0=ignore, 1=strip, 2=update)')
 option('yaml', type: 'feature', value: 'auto',
        description: 'YAML support')
 option('valgrind', type: 'feature', value: 'auto',
diff --git a/tests/Makefile.tests b/tests/Makefile.tests
index af5d309cf8a9..623d71786701 100644
--- a/tests/Makefile.tests
+++ b/tests/Makefile.tests
@@ -81,18 +81,18 @@ tests_clean:
 	rm -rf $(TESTS_CLEANDIRS)
 
 check:	tests ${TESTS_BIN} $(TESTS_PYLIBFDT)
-	cd $(TESTS_PREFIX); ./run_tests.sh
+	cd $(TESTS_PREFIX); OVERLAY_LOCAL_FIXUPS=$(OVERLAY_LOCAL_FIXUPS) ./run_tests.sh
 
 ifeq ($(NO_VALGRIND),1)
 checkm:
 	@echo "make checkm requires valgrind, but NO_VALGRIND=1"
 else
 checkm: tests ${TESTS_BIN} $(TESTS_PYLIBFDT)
-	cd $(TESTS_PREFIX); ./run_tests.sh -m
+	cd $(TESTS_PREFIX); OVERLAY_LOCAL_FIXUPS=$(OVERLAY_LOCAL_FIXUPS) ./run_tests.sh -m
 endif
 
 checkv:	tests ${TESTS_BIN} $(TESTS_PYLIBFDT)
-	cd $(TESTS_PREFIX); ./run_tests.sh -v
+	cd $(TESTS_PREFIX); OVERLAY_LOCAL_FIXUPS=$(OVERLAY_LOCAL_FIXUPS) ./run_tests.sh -v
 
 ifneq ($(DEPTARGETS),)
 -include $(TESTS_DEPFILES)
diff --git a/tests/meson.build b/tests/meson.build
index e37567864e04..9f0f51013530 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -128,6 +128,7 @@ if not yaml.found()
 else
   env += 'NO_YAML=0'
 endif
+env += 'OVERLAY_LOCAL_FIXUPS=' + get_option('overlay-local-fixups').to_string()
 
 run_test_types = [
   'libfdt',
diff --git a/tests/overlay.c b/tests/overlay.c
index 2d27918a3369..d2cc0af0178c 100644
--- a/tests/overlay.c
+++ b/tests/overlay.c
@@ -9,6 +9,7 @@
 #include <stdio.h>
 
 #include <libfdt.h>
+#include "libfdt_internal.h"
 
 #include "tests.h"
 
@@ -191,6 +192,156 @@ static void *open_dt(char *path)
 	return copy;
 }
 
+static void fdt_overlay_local_fixups(char *base_path, char *overlay_path)
+{
+	void *fdt_base = open_dt(base_path);
+	void *fdt_overlay = open_dt(overlay_path);
+	int lf, tn, stn;
+
+	/*
+	 * Add a /__local_fixups__ subtree to the base tree before applying
+	 * the overlay:
+	 * - /__local_fixups__/test-node: test-int-property = <0> (overwritten
+	 *   by the overlay with a non-phandle value)
+	 * - /__local_fixups__/test-node/sub-test-node:
+	 *   new-sub-test-property = <0> (overwritten by the overlay, leaving
+	 *   sub-test-node empty so it should be pruned in UPDATE mode)
+	 */
+	lf = fdt_add_subnode(fdt_base, 0, "__local_fixups__");
+	CHECK(lf < 0);
+	tn = fdt_add_subnode(fdt_base, lf, "test-node");
+	CHECK(tn < 0);
+	CHECK(fdt_setprop_u32(fdt_base, tn, "test-int-property", 0));
+	stn = fdt_add_subnode(fdt_base, tn, "sub-test-node");
+	CHECK(stn < 0);
+	CHECK(fdt_setprop_u32(fdt_base, stn, "new-sub-test-property", 0));
+
+	CHECK(fdt_overlay_apply(fdt_base, fdt_overlay));
+
+#if FDT_OVERLAY_LOCAL_FIXUPS == FDT_OVERLAY_LOCAL_FIXUPS_UPDATE
+	{
+		unsigned long val = 0;
+
+		CHECK(fdt_getprop_u32_by_poffset(
+			      fdt_base, "/__local_fixups__/test-node",
+			      "test-int-property", 0, &val) !=
+		      -FDT_ERR_NOTFOUND);
+		CHECK(fdt_path_offset(
+			      fdt_base,
+			      "/__local_fixups__/test-node/sub-test-node") !=
+		      -FDT_ERR_NOTFOUND);
+
+		CHECK(fdt_getprop_u32_by_poffset(
+			      fdt_base, "/__local_fixups__/test-node",
+			      "test-phandle", 0, &val));
+		CHECK(val != 0);
+		CHECK(fdt_getprop_u32_by_poffset(
+			      fdt_base, "/__local_fixups__/test-node",
+			      "test-phandle", 1, &val));
+		CHECK(val != 4);
+
+		CHECK(fdt_getprop_u32_by_poffset(
+			      fdt_base, "/__local_fixups__/test-node",
+			      "test-several-phandle", 0, &val));
+		CHECK(val != 0);
+		CHECK(fdt_getprop_u32_by_poffset(
+			      fdt_base, "/__local_fixups__/test-node",
+			      "test-several-phandle", 1, &val));
+		CHECK(val != 4);
+	}
+#elif FDT_OVERLAY_LOCAL_FIXUPS == FDT_OVERLAY_LOCAL_FIXUPS_STRIP
+	CHECK(fdt_path_offset(fdt_base, "/__local_fixups__") !=
+	      -FDT_ERR_NOTFOUND);
+#else
+	{
+		unsigned long val = 0;
+
+		CHECK(fdt_getprop_u32_by_poffset(
+			      fdt_base, "/__local_fixups__/test-node",
+			      "test-int-property", 0, &val));
+		CHECK(val != 0);
+		CHECK(fdt_getprop_u32_by_poffset(
+			      fdt_base, "/__local_fixups__/test-node",
+			      "test-phandle", 0, &val) != -FDT_ERR_NOTFOUND);
+	}
+#endif
+
+	free(fdt_base);
+	free(fdt_overlay);
+}
+
+static void fdt_overlay_local_fixups_create(char *base_path, char *overlay_path,
+					    bool lf_after_target)
+{
+	void *fdt_base = open_dt(base_path);
+	void *fdt_overlay = open_dt(overlay_path);
+	int lf, tn;
+
+	/*
+	 * Create an empty /__local_fixups__ node (with no test-node child)
+	 * either before or after /test-node in the blob, so that
+	 * overlay_fragment_local_fixups() must create /__local_fixups__/test-node
+	 * during fdt_overlay_apply().
+	 */
+	if (lf_after_target) {
+		uint32_t ph;
+
+		tn = fdt_path_offset(fdt_base, "/test-node");
+		CHECK(tn < 0);
+		ph = fdt_get_phandle(fdt_base, tn);
+		CHECK(!ph);
+		CHECK(fdt_del_node(fdt_base, tn));
+		lf = fdt_add_subnode(fdt_base, 0, "__local_fixups__");
+		CHECK(lf < 0);
+		tn = fdt_add_subnode(fdt_base, 0, "test-node");
+		CHECK(tn < 0);
+		CHECK(fdt_setprop_u32(fdt_base, tn, "phandle", ph));
+		lf = fdt_path_offset(fdt_base, "/__local_fixups__");
+		CHECK(lf <= tn);
+	} else {
+		lf = fdt_add_subnode(fdt_base, 0, "__local_fixups__");
+		CHECK(lf < 0);
+		tn = fdt_path_offset(fdt_base, "/test-node");
+		CHECK(tn < 0);
+		CHECK(lf >= tn);
+	}
+
+	CHECK(fdt_overlay_apply(fdt_base, fdt_overlay));
+
+#if FDT_OVERLAY_LOCAL_FIXUPS == FDT_OVERLAY_LOCAL_FIXUPS_UPDATE
+	{
+		unsigned long val = 0;
+
+		CHECK(fdt_getprop_u32_by_poffset(
+			      fdt_base, "/__local_fixups__/test-node",
+			      "test-phandle", 0, &val));
+		CHECK(val != 0);
+		CHECK(fdt_getprop_u32_by_poffset(
+			      fdt_base, "/__local_fixups__/test-node",
+			      "test-phandle", 1, &val));
+		CHECK(val != 4);
+		CHECK(fdt_getprop_u32_by_poffset(
+			      fdt_base, "/__local_fixups__/test-node",
+			      "test-several-phandle", 0, &val));
+		CHECK(val != 0);
+		CHECK(fdt_getprop_u32_by_poffset(
+			      fdt_base, "/__local_fixups__/test-node",
+			      "test-several-phandle", 1, &val));
+		CHECK(val != 4);
+	}
+#elif FDT_OVERLAY_LOCAL_FIXUPS == FDT_OVERLAY_LOCAL_FIXUPS_STRIP
+	CHECK(fdt_path_offset(fdt_base, "/__local_fixups__") !=
+	      -FDT_ERR_NOTFOUND);
+#else
+	CHECK(fdt_path_offset(fdt_base, "/__local_fixups__") < 0);
+	CHECK(fdt_path_offset(fdt_base, "/__local_fixups__/test-node") !=
+	      -FDT_ERR_NOTFOUND);
+#endif
+
+	free(fdt_base);
+	free(fdt_overlay);
+}
+
 int main(int argc, char *argv[])
 {
 	void *fdt_base, *fdt_overlay;
@@ -219,6 +370,9 @@ int main(int argc, char *argv[])
 	if (fdt_path_offset(fdt_base, "/__symbols__") >= 0) {
 		fdt_overlay_local_phandle(fdt_base);
 		fdt_overlay_local_phandles(fdt_base);
+		fdt_overlay_local_fixups(argv[1], argv[2]);
+		fdt_overlay_local_fixups_create(argv[1], argv[2], false);
+		fdt_overlay_local_fixups_create(argv[1], argv[2], true);
 	}
 
 	PASS();
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 3cacb68438df..e16767d3f3a2 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -11,6 +11,10 @@ if [ -z "$PYTHON" ]; then
     PYTHON=python3
 fi
 
+if [ -z "$OVERLAY_LOCAL_FIXUPS" ]; then
+    OVERLAY_LOCAL_FIXUPS=2
+fi
+
 if [ -n "$NO_PYTHON" ]; then
     if [ "$NO_PYTHON" != "0" ]; then
         no_python=true
@@ -1147,6 +1151,34 @@ fdtoverlay_tests() {
 
     shorten_echo "check phandle to noda d wasn't overwritten:	"
     run_wrap_test test "$bd" = "$pd"
+
+    # verify how /__local_fixups__ in a -L base blob is handled when applying an overlay
+    run_dtc_test -@ -L -I dts -O dtb -o overlay_base_phandle_lf.test.dtb "$SRCDIR/overlay_base_phandle.dts"
+    run_wrap_test $FDTOVERLAY -i overlay_base_phandle_lf.test.dtb -o overlay_base_phandle_lfO.test.dtb overlay_overlay_phandle.test.dtb
+    run_dtc_test -@ -L -I dts -O dtb -o overlay_base_lf.test.dtb "$SRCDIR/overlay_base.dts"
+    run_wrap_test $DTPUT overlay_base_lf.test.dtb -cp /__local_fixups__/test-node/sub-test-node
+    run_wrap_test $DTPUT overlay_base_lf.test.dtb /__local_fixups__/test-node/sub-test-node new-sub-test-property -tu 0
+    run_dtc_test -@ -I dts -O dtb -o overlay_overlay.fdtoverlay.test.dtb "$SRCDIR/overlay_overlay.dts"
+    run_wrap_test $FDTOVERLAY -i overlay_base_lf.test.dtb -o overlay_base_lfO.test.dtb overlay_overlay.fdtoverlay.test.dtb
+    if [ "$OVERLAY_LOCAL_FIXUPS" -eq 2 ]; then
+        run_fdtget_test 0 overlay_base_phandle_lfO.test.dtb /__local_fixups__/b a
+        run_fdtget_test 0 overlay_base_phandle_lfO.test.dtb /__local_fixups__/b d
+        run_fdtget_test 0 overlay_base_phandle_lfO.test.dtb /__local_fixups__/c b
+        run_fdtget_test 0 overlay_base_phandle_lfO.test.dtb /__local_fixups__/d a
+        run_fdtget_test 0 overlay_base_phandle_lfO.test.dtb /__local_fixups__/d b
+        run_fdtget_test 0 overlay_base_phandle_lfO.test.dtb /__local_fixups__/d c
+
+        run_fdtget_test "0 4" overlay_base_lfO.test.dtb /__local_fixups__/test-node test-phandle
+        run_fdtget_test "0 4" overlay_base_lfO.test.dtb /__local_fixups__/test-node test-several-phandle
+        run_test check_path overlay_base_lfO.test.dtb not-exists "/__local_fixups__/test-node/sub-test-node"
+    elif [ "$OVERLAY_LOCAL_FIXUPS" -eq 1 ]; then
+        run_test check_path overlay_base_phandle_lfO.test.dtb not-exists "/__local_fixups__"
+        run_test check_path overlay_base_lfO.test.dtb not-exists "/__local_fixups__"
+    else
+        run_fdtget_test 0 overlay_base_phandle_lfO.test.dtb /__local_fixups__/b a
+        run_wrap_error_test $DTGET overlay_base_phandle_lfO.test.dtb /__local_fixups__/b d
+        run_fdtget_test 0 overlay_base_lfO.test.dtb /__local_fixups__/test-node/sub-test-node new-sub-test-property
+    fi
 }
 
 run_python_tests () {
-- 
2.56.0.679.gc527c65306-goog

