Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6563E63BD
	for <Devicetree-compiler@vger.kernel.org>; Thu, 15 Oct 2026 18:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792088597; cv=none; b=jwgwy6ObmhY7MK0f+H6zmWjninHo3jbA2hiLVFkSRSv5jomEv0qnq53hd82qy8n2wUNPNJpoyfiqnLTln/2KX0sBYfSNSDZQ1ZDBiTpIjuSh3PTwm8yDN/xz2s3aEUypY4dKol3uNLVpkN0a7XjQNTI58hx3upHStDQ1uzfu7B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792088597; c=relaxed/simple;
	bh=t2fqYTeQ3tLkWFZBMtKQ0809KY8q9nI0g489z2XRh0o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cB3Y+Al2eG0kr2Z5tjFfRKcGXgGAB5plAj+EVp45xhI3HZpwG7ffs4Hwn2Vt14bUgPD8RiPWsv4TH55AH0cp2vYFhFyGLm6gpXzKKc2QOrsijdeJSmO50RUNonTH8KyTCYznMP2jiGdfzqEvRU+UOTeY/QtdEoVaHLFe9qYdY+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Neaq+YC8; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Neaq+YC8"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-16079d54c17so786672c88.0
        for <Devicetree-compiler@vger.kernel.org>; Thu, 15 Oct 2026 11:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792088589; x=1792693389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zh1jMr4tvV8ouhv3YnVFweWqZZaDob4xX1pfVsBf53M=;
        b=Neaq+YC8qYKgCLDTw0ucnKt7uMa7x40cX9XwNJ/rss2u6+aUyAvHlDy1yj7QOQmFVC
         NJDW3FPRssLy795wxGyKceKzzkHk9U819ePXY5QUAs3gtIZYU42lnv7XnLLQoDT+GJhm
         33g4NnPfP7s3HPP8KkaVDpOGGcCr/9FO4ZcI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792088589; x=1792693389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zh1jMr4tvV8ouhv3YnVFweWqZZaDob4xX1pfVsBf53M=;
        b=ClsMZFR/zxqsBVw0Ew1KPp2VpfIPcdxsaPkdakM/rbFblEEMmc3uc4zC9ttb45Y6tt
         +jx2eOkxKefiP50tqQCVgNg0GiG35UzV9yl9NqNwip8VDoPOx+7iO4f5jrdYT4t4a9Sh
         WvM0PvCIxrs6LlUc7Tu7CcROl9vRp3PSa26xXquhwZT2O1NrKoCN8m7vVSneIfXPNmmv
         cjQCpTwsv5cRj8n4sWDT7FF3u6tJv26M2EkhkGV9Iz13MVF34l96Qnk4GM3UpG/IAe9Q
         WqQ+EnxTLgEf25TKRNdmsMCX0uB/DxwhbpWtsnfK83tZTdesVIuuS0gOIFqLTK5Mufh2
         w/lg==
X-Gm-Message-State: AFq9FYKXxHN0hPrhOTaVZvZe04CNTHqweXVZ1FyCDkXdweGh2Cb4fN3U
	IBPGbCxpbB95hKnd+2Z/wCK9LdTK7mHDvle71PLNGJzbekshIrPOaJlGuytb26o8jxdnZ4GK1xG
	/pHc=
X-Gm-Gg: AYBFou1w4TaAr26MsV6g0OmZedpuAx2ZRoXPH64zEc87LnHAzg8aHP3HIBRpgOf0sOf
	UBOF2K6Oi8xu6eTtTISlo8Oy52matuzngyHHXPwruv6L9PxC91LXHESKGe7Nynk8S9pijry9NvV
	ybpSu7G23iQUa4i1Ojp+Mlkgl0I2uN2hPOC3Q6fPLjbogtGvSvj73LRoqldMB4QNYnD61/bjD6k
	o1PvydG5fSmlXQcAx/601+VSgJAOXNggXk8OHIQnVTM1LcBsAnO4Jm3FVPPgOyVYM7fvV6Ka0Fn
	KxFikcztHslMf3VEn3PXDf7rxWXmkjkyDDqy1yxk6UGdoO5sX/cylTgyFMarXoy94B+NIsM0sj8
	fOK+iNnfexhcwm8dt1bIDOwkMsinhc6azgpgOZPJzDlH8MXsjqXaFz51jqzCR0ytFRgHZ15GOlD
	6y7p4eeBzFuhvKvRWBdqVNL9C2pKz4QjSOOxFK8ovcEUjEJlJIwDPA59wwFqSjrAcmRwUHX0DIx
	GaURCHwDcjliruLtkpb8nzsquBQqbvJ5l1Sy39EukwoTWHh5szyDB+lSF4=
X-Received: by 2002:a05:701b:2903:b0:156:1d8:7026 with SMTP id a92af1059eb24-16a60de3224mr24282386c88.46.1792088588293;
        Thu, 15 Oct 2026 11:23:08 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:9ea0:3a29:323e:5f11])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-182a8a4a56bsm727204c88.20.2026.10.15.11.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 11:23:05 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-kernel@vger.kernel.org,
	Devicetree@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Julius Werner <jwerner@chromium.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 2/4] fdtfactor: Add tool to split DTBs into a base DTB and overlays
Date: Thu, 15 Oct 2026 11:21:35 -0700
Message-ID: <20261015182221.2931742-3-dianders@chromium.org>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
In-Reply-To: <20261015182221.2931742-1-dianders@chromium.org>
References: <20261015182221.2931742-1-dianders@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When shipping a single firmware or kernel image that supports many
closely related board variants or SKUs, bundling a full compiled .dtb
for every variant results in substantial duplication.

Add `fdtfactor`, a Python tool built on `pylibfdt` that takes a set of
compiled device tree blobs (.dtb) compiled with `-@ -L` (`/__symbols__`
and `/__local_fixups__`) and splits them into a single common
`base.dtb` and per-board `.dtbo` overlays:

- Common nodes present across all input DTBs are placed in `base.dtb`,
  with each common property assigned the value shared by at least two
  boards that maximizes byte savings across overlays.
- Using `/__local_fixups__`, phandle references inside property values
  are normalized to target node paths so common properties referencing
  common nodes match even when numeric phandles differ across input
  DTBs.
- Any common node that carries a phandle in any input DTB receives its
  phandle in `base.dtb` so overlays only emit `phandle` properties on
  newly added subnodes, matching the requirements of `libfdt`, Linux's
  `drivers/of/overlay.c`, and coreboot's `dt_apply_overlay()`.

On a set of 47 Qualcomm SC7180 Trogdor Chromebook board DTBs,
`fdtfactor -S` reduces total uncompressed size from 7.69 MB to 634 KB
(91.8% savings).

Add 3-board test cases covering default mode and `--strip-local-fixups`
to the `fdtoverlay` test suite.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 Makefile                   |    2 +-
 README.md                  |   58 ++
 fdtfactor                  | 1218 ++++++++++++++++++++++++++++++++++++
 meson.build                |    1 +
 tests/Makefile.tests       |    2 +-
 tests/fdtfactor_board1.dts |   69 ++
 tests/fdtfactor_board2.dts |   73 +++
 tests/fdtfactor_board3.dts |   96 +++
 tests/run_tests.sh         |   61 +-
 tests/testutils.sh         |    1 +
 10 files changed, 1578 insertions(+), 3 deletions(-)
 create mode 100755 fdtfactor
 create mode 100644 tests/fdtfactor_board1.dts
 create mode 100644 tests/fdtfactor_board2.dts
 create mode 100644 tests/fdtfactor_board3.dts

diff --git a/Makefile b/Makefile
index 9110d17796b0..4df5bbda9ce2 100644
--- a/Makefile
+++ b/Makefile
@@ -165,7 +165,7 @@ BIN += fdtget
 BIN += fdtput
 BIN += fdtoverlay
 
-SCRIPTS = dtdiff
+SCRIPTS = dtdiff fdtfactor
 
 all: $(BIN) libfdt
 
diff --git a/README.md b/README.md
index 8f1a5d2a4d67..e2ff2374b01d 100644
--- a/README.md
+++ b/README.md
@@ -91,6 +91,64 @@ $ make NO_PYTHON=1
 More work remains to support all of libfdt, including access to numeric
 values.
 
+## fdtfactor
+
+`fdtfactor` is a Python tool built on `pylibfdt` that takes a set of
+compiled device tree blobs (`.dtb`) and splits them into a single common
+`base.dtb` and per-board `.dtbo` overlays so that applying a board's
+`.dtbo` to `base.dtb` recreates the original board device tree while
+reducing total storage size.
+
+Input `.dtb` files must be compiled with `dtc -@ -L` so that both
+`/__symbols__` (used to resolve overlay `/__fixups__` against `base.dtb`)
+and `/__local_fixups__` (used to identify phandle references inside
+property values) are present.
+
+Basic usage:
+
+```
+$ fdtfactor -b base.dtb -o out_dir board1.dtb board2.dtb board3.dtb
+```
+
+Options:
+
+* `-b`, `--base-dtb`: Output path for the common base `.dtb` (placed in
+  `--outdir` if specified without a directory component).
+* `-o`, `--outdir`: Output directory for generated `.dtbo` files (and for
+  `--base-dtb` when given without a directory component).
+* `-S`, `--strip-local-fixups`: Omit `/__local_fixups__` from the generated
+  `base.dtb` and final reconstructed device trees. When `-L` is passed to
+  `dtc` solely so `fdtfactor` can locate phandle cells at build time, the
+  original DTB's `/__local_fixups__` subtree is not needed at runtime by
+  either the overlay loader (`fdt_overlay_apply()`) or the OS kernel;
+  passing `-S` strips it to reduce the size of both `base.dtb` and the
+  `.dtbo` overlays. Omit `-S` if downstream tooling or verification
+  expects applying a board's `.dtbo` to `base.dtb` to reproduce the
+  original `.dtb`'s `/__local_fixups__` subtree verbatim.
+* `--verify`: Verify that applying each generated `.dtbo` to `base.dtb`
+  with `libfdt` recreates the original `.dtb`.
+* `-v`, `--verbose`: Print size savings summary.
+
+### TODO
+
+* **Explore omitting `/__fixups__` and `/__symbols__` from overlays by
+  hardcoding base DT phandles**: Normally a standalone `.dtbo` stores
+  references to base tree nodes as `0xffffffff` with string entries in
+  `/__fixups__` that the overlay loader resolves at runtime against
+  `base.dtb`'s `/__symbols__`. Because `fdtfactor` generates `base.dtb`
+  and all `.dtbo` overlays together, it already knows the exact numeric
+  phandle values assigned to every node in `base.dtb`. Neither `libfdt` nor
+  coreboot modifies property cells that are not listed in `/__fixups__` or
+  `/__local_fixups__`. Writing the base phandle integers directly into
+  overlay properties would allow omitting `/__fixups__` from the `.dtbo`
+  files (and omitting `/__symbols__` when runtime symbol lookup is not
+  needed), further reducing overlay size and speeding up boot-time overlay
+  application.
+* **Multi-level overlays**: Support hierarchical overlay layers (for
+  example, SoC base -> board family intermediate overlay -> SKU leaf
+  overlay) when multiple boards share large sub-trees not present across
+  all boards.
+
 ## Mailing lists
 
 * The [devicetree-compiler](mailto:devicetree-compiler@vger.kernel.org)
diff --git a/fdtfactor b/fdtfactor
new file mode 100755
index 000000000000..377f499bea50
--- /dev/null
+++ b/fdtfactor
@@ -0,0 +1,1218 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0-or-later
+"""Split compiled device tree blobs (.dtb) into a base .dtb and .dtbo overlays.
+
+Given a set of compiled device tree blobs, fdtfactor extracts all common nodes
+and properties into a single base .dtb file and writes the per-board
+differences into .dtbo overlay files. Applying an overlay to the base .dtb
+using fdtoverlay or libfdt's fdt_overlay_apply() recreates the corresponding
+original device tree.
+"""
+
+import argparse
+from collections import Counter
+import os
+import struct
+import sys
+
+import libfdt
+
+
+def split_dtb_filename(path):
+    """Split a DTB path into its directory and filename stem.
+
+    Example:
+        '/dir/board.dtb' -> ('/dir', 'board')
+
+    Args:
+        path: File path to a .dtb or .dtbo file.
+
+    Returns:
+        Tuple of (directory, stem) where `stem` has any trailing `.dtb` or
+        `.dtbo` suffix removed.
+    """
+    directory, filename = os.path.split(path)
+    stem, sep, ext = filename.rpartition('.')
+    if not stem or not sep or ext not in ('dtb', 'dtbo'):
+        stem = filename
+    return directory, stem
+
+
+class NodeTree:
+    """In-memory tree of nodes and properties for sequential FDT creation."""
+
+    def __init__(self):
+        self.props = {}
+        self.children = {}
+
+    def get_node(self, path):
+        """Return the descendant NodeTree at `path`, creating missing nodes.
+
+        Looks up a child or deeper descendant `NodeTree` by following the
+        slash-separated node names in `path` starting from `self` (leading and
+        trailing `'/'` characters are ignored, so `'/soc/i2c@4000'` and
+        `'soc/i2c@4000'` behave identically). If any node along `path` does not
+        exist yet in `self.children`, a new empty `NodeTree` is created for it
+        automatically (similar to `mkdir -p`). Passing `''` or `'/'` returns
+        `self`.
+
+        Example:
+            root = NodeTree()
+            # The following automatically creates root.children['soc'] and
+            # root.children['soc'].children['i2c@4000'], and returns the
+            # 'i2c@4000' NodeTree.
+            i2c = root.get_node('/soc/i2c@4000')
+            i2c.props['status'] = b'okay\\x00'
+
+        Args:
+            path: Slash-separated node path starting from `self` (leading `'/'`
+                is optional and ignored, e.g. `'/soc/i2c@4000'` or
+                `'soc/i2c@4000'`).
+
+        Returns:
+            The `NodeTree` instance at `path`.
+        """
+        if path == '/' or not path:
+            return self
+        curr = self
+        for part in path.strip('/').split('/'):
+            if part not in curr.children:
+                curr.children[part] = NodeTree()
+            curr = curr.children[part]
+        return curr
+
+    def _write_to_sw(self, sw, name=''):
+        """Recursively write this NodeTree and its children into an FdtSw.
+
+        Args:
+            sw: A `libfdt.FdtSw` sequential-write instance.
+            name: Node name for this subtree (empty string for the root node).
+        """
+        sw.begin_node(name)
+        for prop_name, val in self.props.items():
+            sw.property(prop_name, bytes(val))
+        for child_name, child_node in self.children.items():
+            child_node._write_to_sw(sw, child_name)
+        sw.end_node()
+
+    def to_fdt_blob(self, mem_rsv=(), boot_cpuid_phys=0, size_hint=65536):
+        """Serialize this root NodeTree into a packed FDT byte string.
+
+        Args:
+            mem_rsv: Iterable of (address, size) tuples for the FDT memory
+                reservation block.
+            boot_cpuid_phys: Physical boot CPU ID for the FDT header.
+            size_hint: Initial buffer size hint in bytes for `libfdt.FdtSw`.
+
+        Returns:
+            Serialized FDT blob as `bytes`.
+        """
+        sw = libfdt.FdtSw(size_hint)
+        for addr, size in mem_rsv:
+            sw.add_reservemap_entry(addr, size)
+        sw.finish_reservemap()
+        self._write_to_sw(sw, '')
+        # Unlike other FdtSw methods, as_fdt() does not call check_space()
+        # when fdt_finish() appends the 4-byte FDT_END token. If fewer than
+        # 4 bytes remain in the buffer, resize once and retry.
+        try:
+            fdt = sw.as_fdt()
+        except libfdt.FdtException as exc:
+            if not sw.check_space(exc.err):
+                raise
+            fdt = sw.as_fdt()
+        libfdt.fdt_set_boot_cpuid_phys(fdt._fdt, boot_cpuid_phys)
+        fdt.pack()
+        return bytes(fdt.as_bytearray())
+
+
+def _open_fdt_ro(raw_bytes, filename):
+    """Validate and wrap an uncompressed FDT blob in `libfdt.FdtRo`.
+
+    Args:
+        raw_bytes: Uncompressed FDT binary contents as `bytes`.
+        filename: Display name or file path for error reporting.
+
+    Returns:
+        A validated `libfdt.FdtRo` instance.
+
+    Raises:
+        ValueError: If `raw_bytes` fails FDT header or full-structure checks.
+    """
+    try:
+        fdt = libfdt.FdtRo(raw_bytes)
+        libfdt.check_err(libfdt.fdt_check_full(fdt._fdt, len(raw_bytes)))
+    except libfdt.FdtException as exc:
+        raise ValueError(f'{filename}: Invalid FDT blob ({exc})') from exc
+    return fdt
+
+
+def _is_dtbo_overlay(fdt_ro):
+    """Return True if `fdt_ro` is a `.dtbo` overlay rather than a base DTB.
+
+    Args:
+        fdt_ro: A `libfdt.FdtRo` instance wrapping an uncompressed FDT blob.
+
+    Returns:
+        True if the FDT has `/__fixups__` or a top-level fragment node
+        containing an `__overlay__` subnode.
+    """
+    if fdt_ro.subnode_offset(0, '__fixups__', quiet=libfdt.QUIET_NOTFOUND) >= 0:
+        return True
+    soff = fdt_ro.first_subnode(0, quiet=libfdt.QUIET_NOTFOUND)
+    while soff >= 0:
+        if fdt_ro.subnode_offset(
+            soff, '__overlay__', quiet=libfdt.QUIET_NOTFOUND
+        ) >= 0:
+            return True
+        soff = fdt_ro.next_subnode(soff, quiet=libfdt.QUIET_NOTFOUND)
+    return False
+
+
+class ParsedDtb:
+    """Parsed representation of an input .dtb blob."""
+
+    def __init__(self, filename, raw_bytes):
+        """Parse an uncompressed FDT blob into nodes, symbols, and fixups.
+
+        Args:
+            filename: Display name or file path for error reporting.
+            raw_bytes: Uncompressed FDT binary contents as `bytes`.
+        """
+        self.filename = filename
+        self.raw_bytes = raw_bytes
+        fdt = _open_fdt_ro(raw_bytes, filename)
+        if _is_dtbo_overlay(fdt):
+            raise ValueError(
+                f'{filename}: Input is already a DTB overlay (.dtbo)'
+            )
+
+        # Extract FDT header metadata (boot_cpuid_phys and /memreserve/ table)
+        # stored outside the DT node/property tree; see _validate_dtb_headers()
+        # for why these require special handling.
+        self.boot_cpuid_phys = fdt.boot_cpuid_phys()
+        self.mem_rsv = [
+            tuple(fdt.get_mem_rsv(i)) for i in range(fdt.num_mem_rsv())
+        ]
+
+        self.has_symbols = False
+        self.symbols = {}
+        self.has_local_fixups = False
+        self.local_fixups = {}
+
+        self.nodes = {}
+        self.phandles = {}
+        self.has_phandle_prop = {}
+        self.has_linux_phandle_prop = {}
+        self.phandle_to_path = {}
+        self.sym_props = {}
+
+        self._parse_tree(fdt)
+
+    @classmethod
+    def from_file(cls, path):
+        """Read and parse a .dtb file from disk.
+
+        Args:
+            path: Path to the input .dtb file.
+
+        Returns:
+            A new `ParsedDtb` instance.
+        """
+        with open(path, 'rb') as f:
+            raw_bytes = f.read()
+        return cls(path, raw_bytes)
+
+    def _parse_tree(self, fdt):
+        """Walk the FDT and extract nodes, properties, symbols, and fixups.
+
+        Args:
+            fdt: A `libfdt.FdtRo` instance wrapping the input blob.
+        """
+        self._walk_regular(fdt, 0, '/')
+
+        sym_off = fdt.subnode_offset(0, '__symbols__',
+                                     quiet=libfdt.QUIET_NOTFOUND)
+        if sym_off >= 0:
+            self.has_symbols = True
+            poff = fdt.first_property_offset(sym_off,
+                                             quiet=libfdt.QUIET_NOTFOUND)
+            while poff >= 0:
+                prop = fdt.get_property_by_offset(poff)
+                if prop.name not in ('phandle', 'linux,phandle'):
+                    target_path = prop.as_str() if prop else ''
+                    if target_path not in self.nodes:
+                        raise ValueError(
+                            f'{self.filename}: symbol {prop.name!r} references '
+                            f'missing node {target_path!r}'
+                        )
+                    self.symbols[prop.name] = target_path
+                poff = fdt.next_property_offset(poff,
+                                                quiet=libfdt.QUIET_NOTFOUND)
+
+        lf_off = fdt.subnode_offset(0, '__local_fixups__',
+                                    quiet=libfdt.QUIET_NOTFOUND)
+        if lf_off >= 0:
+            self.has_local_fixups = True
+            self._walk_local_fixups(fdt, lf_off, '/')
+
+    def _walk_regular(self, fdt, nodeoffset, path):
+        """Recursively collect regular nodes and their properties.
+
+        Args:
+            fdt: A `libfdt.FdtRo` instance.
+            nodeoffset: Offset of the current node in `fdt`.
+            path: Full device tree path of the current node (e.g. '/soc').
+        """
+        props = {}
+        ph_val = None
+        has_ph = False
+        has_linux_ph = False
+
+        poff = fdt.first_property_offset(nodeoffset,
+                                         quiet=libfdt.QUIET_NOTFOUND)
+        while poff >= 0:
+            prop = fdt.get_property_by_offset(poff)
+            raw = bytes(prop)
+            if prop.name in ('phandle', 'linux,phandle'):
+                if len(raw) != 4:
+                    raise ValueError(
+                        f'{self.filename}: {path}: {prop.name} length '
+                        f'{len(raw)} != 4'
+                    )
+                val = struct.unpack('>I', raw)[0]
+                if ph_val is not None and ph_val != val:
+                    raise ValueError(
+                        f'{self.filename}: {path}: mismatched phandle '
+                        f'({ph_val:#x} vs {val:#x})'
+                    )
+                ph_val = val
+                if prop.name == 'phandle':
+                    has_ph = True
+                else:
+                    has_linux_ph = True
+            else:
+                props[prop.name] = raw
+            poff = fdt.next_property_offset(poff, quiet=libfdt.QUIET_NOTFOUND)
+
+        self.nodes[path] = props
+        self.phandles[path] = ph_val
+        self.has_phandle_prop[path] = has_ph
+        self.has_linux_phandle_prop[path] = has_linux_ph
+        if ph_val is not None:
+            if ph_val in (0, 0xffffffff):
+                raise ValueError(
+                    f'{self.filename}: invalid phandle {ph_val:#x} on {path}'
+                )
+            if ph_val in self.phandle_to_path:
+                raise ValueError(
+                    f'{self.filename}: duplicate phandle {ph_val:#x} on '
+                    f'{self.phandle_to_path[ph_val]} and {path}'
+                )
+            self.phandle_to_path[ph_val] = path
+
+        soff = fdt.first_subnode(nodeoffset, quiet=libfdt.QUIET_NOTFOUND)
+        while soff >= 0:
+            name = fdt.get_name(soff)
+            if path == '/' and name in ('__symbols__', '__local_fixups__'):
+                soff = fdt.next_subnode(soff, quiet=libfdt.QUIET_NOTFOUND)
+                continue
+            child_path = '/' + name if path == '/' else f'{path}/{name}'
+            self._walk_regular(fdt, soff, child_path)
+            soff = fdt.next_subnode(soff, quiet=libfdt.QUIET_NOTFOUND)
+
+    def _walk_local_fixups(self, fdt, nodeoffset, rel_path):
+        """Recursively collect phandle byte offsets from `/__local_fixups__`.
+
+        Args:
+            fdt: A `libfdt.FdtRo` instance.
+            nodeoffset: Offset of the current node inside `/__local_fixups__`.
+            rel_path: Corresponding target node path in the device tree.
+
+        Raises:
+            ValueError: If a fixup property length is not a multiple of 4.
+        """
+        poff = fdt.first_property_offset(nodeoffset,
+                                         quiet=libfdt.QUIET_NOTFOUND)
+        while poff >= 0:
+            prop = fdt.get_property_by_offset(poff)
+            raw = bytes(prop)
+            if len(raw) % 4 != 0:
+                raise ValueError(
+                    f'{self.filename}: malformed __local_fixups__ property '
+                    f'{rel_path}:{prop.name} (length {len(raw)})'
+                )
+            count = len(raw) // 4
+            offsets = struct.unpack(f'>{count}I', raw)
+            self.local_fixups[(rel_path, prop.name)] = offsets
+            poff = fdt.next_property_offset(poff, quiet=libfdt.QUIET_NOTFOUND)
+
+        soff = fdt.first_subnode(nodeoffset, quiet=libfdt.QUIET_NOTFOUND)
+        while soff >= 0:
+            name = fdt.get_name(soff)
+            child_path = '/' + name if rel_path == '/' else f'{rel_path}/{name}'
+            self._walk_local_fixups(fdt, soff, child_path)
+            soff = fdt.next_subnode(soff, quiet=libfdt.QUIET_NOTFOUND)
+
+    def build_symbolic_props(self):
+        """Build normalized property values for comparison across DTBs.
+
+        Populates `self.sym_props[path][prop_name]` with a tuple:
+            `(masked_bytes, ((offset, target_node_path), ...))`
+        where phandle cells listed in `self.local_fixups` are zeroed in
+        `masked_bytes` and recorded symbolically by their target node path.
+
+        Raises:
+            ValueError: If a fixup references a missing property, its offset is
+                out of range, or it references an unknown phandle value.
+        """
+        for path, prop_name in self.local_fixups:
+            if path not in self.nodes or prop_name not in self.nodes[path]:
+                raise ValueError(
+                    f'{self.filename}: local fixup references missing property '
+                    f'{path}:{prop_name}'
+                )
+        for path, props in self.nodes.items():
+            node_sym_props = {}
+            for prop_name, raw in props.items():
+                offsets = self.local_fixups.get((path, prop_name), ())
+                if not offsets:
+                    node_sym_props[prop_name] = (raw, ())
+                    continue
+                masked = bytearray(raw)
+                targets = []
+                for off in offsets:
+                    if off + 4 > len(raw):
+                        raise ValueError(
+                            f'{self.filename}: fixup offset {off} out of range '
+                            f'on {path}:{prop_name} (len {len(raw)})'
+                        )
+                    ph = struct.unpack_from('>I', raw, off)[0]
+                    target_path = self.phandle_to_path.get(ph)
+                    if target_path is None:
+                        raise ValueError(
+                            f'{self.filename}: unknown phandle {ph:#x} at '
+                            f'{path}:{prop_name}+{off}'
+                        )
+                    masked[off:off + 4] = b'\x00\x00\x00\x00'
+                    targets.append((off, target_path))
+                node_sym_props[prop_name] = (bytes(masked), tuple(targets))
+            self.sym_props[path] = node_sym_props
+
+
+def select_best_candidate(candidates, byte_len_fn):
+    """Choose the value that maximizes space savings across overlays.
+
+    Only candidates shared by at least two input DTBs (count > 1) are eligible
+    for inclusion in the base DTB; if every candidate value is unique to a
+    single DTB, placing one in the base DTB would yield zero net size savings
+    (adding one copy to the base DTB to save one overlay copy).
+
+    Args:
+        candidates: Iterable of candidate values (in input DTB order).
+        byte_len_fn: Function returning the byte cost of a candidate value in
+            an overlay.
+
+    Returns:
+        The chosen candidate value, or None if no value appears more than once.
+    """
+    counts = Counter(candidates)
+    best_val = None
+    best_key = None
+    for val, count in counts.items():
+        if count <= 1:
+            continue
+        length = byte_len_fn(val)
+        # Maximize total bytes saved across overlays:
+        # (count - 1) * (length + 12)
+        key = ((count - 1) * (length + 12), count, length)
+        if best_key is None or key > best_key:
+            best_key = key
+            best_val = val
+    return best_val
+
+
+def _validate_dtb_headers(dtbs):
+    """Verify that FDT header fields and /memreserve/ entries match across DTBs.
+
+    `boot_cpuid_phys` and `/memreserve/` require special handling because:
+    * Unlike regular DT nodes (including `/reserved-memory`), they are stored
+      in the FDT binary header and memory reservation block rather than the
+      DT structure block.
+    * `fdt_overlay_apply()` only merges the `.dtbo` structure block into the
+      base DTB and ignores the `.dtbo`'s header and `/memreserve/` block.
+    * Therefore, every reconstructed board DTB inherits `boot_cpuid_phys` and
+      `/memreserve/` directly from the base DTB, so all DTBs sharing a base
+      DTB must have identical values.
+
+    Args:
+        dtbs: Sequence of `ParsedDtb` objects to validate.
+
+    Raises:
+        ValueError: If `boot_cpuid_phys` or `mem_rsv` differs between any two
+            input DTBs.
+    """
+    for d in dtbs[1:]:
+        if d.boot_cpuid_phys != dtbs[0].boot_cpuid_phys:
+            raise ValueError(
+                f'boot_cpuid_phys mismatch between {dtbs[0].filename} '
+                f'({dtbs[0].boot_cpuid_phys}) and {d.filename} '
+                f'({d.boot_cpuid_phys})'
+            )
+        if d.mem_rsv != dtbs[0].mem_rsv:
+            raise ValueError(
+                f'/memreserve/ mismatch between {dtbs[0].filename} '
+                f'({dtbs[0].mem_rsv}) and {d.filename} ({d.mem_rsv})'
+            )
+
+
+def _find_common_nodes_and_phandles(dtbs):
+    """Identify common node paths and assign sequential base DTB phandles.
+
+    Any common node that carries a phandle in any input DTB is assigned a
+    phandle in the base DTB so overlays never attempt to add a `phandle`
+    property to an already-existing base DTB node (which Linux and
+    coreboot/depthcharge disallow).
+
+    Args:
+        dtbs: Sequence of `ParsedDtb` objects.
+
+    Returns:
+        Tuple of `(base_dtb_nodes, common_node_set, base_dtb_phandles)` where:
+        * `base_dtb_nodes`: Ordered list of node paths common to all `dtbs`.
+        * `common_node_set`: Set of node paths in `base_dtb_nodes`.
+        * `base_dtb_phandles`: Dict mapping node path to assigned integer
+          phandle in the base DTB.
+    """
+    common_node_set = set(dtbs[0].nodes.keys())
+    for d in dtbs[1:]:
+        common_node_set &= set(d.nodes.keys())
+    base_dtb_nodes = [p for p in dtbs[0].nodes.keys() if p in common_node_set]
+
+    base_dtb_phandles = {}
+    next_ph = 1
+    for path in base_dtb_nodes:
+        if any(d.phandles[path] is not None for d in dtbs):
+            base_dtb_phandles[path] = next_ph
+            next_ph += 1
+
+    return base_dtb_nodes, common_node_set, base_dtb_phandles
+
+
+def _find_common_symbols(dtbs, common_node_set, base_dtb_phandles):
+    """Find symbols common to all input DTBs that point to the same base node.
+
+    Only symbols that exist in all DTBs and resolve to the same common base
+    DTB node path are placed in the base DTB's `/__symbols__`, ensuring
+    overlays only add new symbols and never need to overwrite existing ones
+    (which coreboot/depthcharge merges with `upd=0`).
+
+    Args:
+        dtbs: Sequence of `ParsedDtb` objects.
+        common_node_set: Set of node paths present in all input DTBs.
+        base_dtb_phandles: Dict mapping base DTB node paths to their assigned
+            integer phandles.
+
+    Returns:
+        Tuple of `(base_dtb_symbols, path_to_base_dtb_symbol)` where:
+        * `base_dtb_symbols`: Dict mapping symbol label to target node path.
+        * `path_to_base_dtb_symbol`: Dict mapping target node path to its
+          primary symbol label in `base_dtb_symbols`.
+    """
+    base_dtb_symbols = {}
+    path_to_base_dtb_symbol = {}
+
+    common_sym_names = set(dtbs[0].symbols.keys())
+    for d in dtbs[1:]:
+        common_sym_names &= set(d.symbols.keys())
+    for label in dtbs[0].symbols.keys():
+        if label not in common_sym_names:
+            continue
+        target_paths = {d.symbols[label] for d in dtbs}
+        if len(target_paths) == 1:
+            chosen_path = dtbs[0].symbols[label]
+            if chosen_path in common_node_set:
+                base_dtb_symbols[label] = chosen_path
+                if (chosen_path in base_dtb_phandles and
+                        chosen_path not in path_to_base_dtb_symbol):
+                    path_to_base_dtb_symbol[chosen_path] = label
+
+    return base_dtb_symbols, path_to_base_dtb_symbol
+
+
+def _select_base_dtb_properties(dtbs, base_dtb_nodes, base_dtb_phandles,
+                                preserve_local_fixups):
+    """Select the common property values to place on each node in the base DTB.
+
+    Args:
+        dtbs: Sequence of `ParsedDtb` objects with `sym_props` populated.
+        base_dtb_nodes: Ordered list of node paths in the base DTB.
+        base_dtb_phandles: Dict mapping base DTB node paths to their assigned
+            integer phandles.
+        preserve_local_fixups: Whether `/__local_fixups__` from the input DTBs
+            must be preserved in the merged output.
+
+    Returns:
+        Tuple of `(base_dtb_props, base_dtb_fixup_offsets)` where:
+        * `base_dtb_props`: Dict mapping `path -> {prop_name: sym_val}` for
+          properties placed in the base DTB.
+        * `base_dtb_fixup_offsets`: Dict mapping `(path, prop_name)` to a tuple
+          of byte offsets for the base DTB's `/__local_fixups__`.
+    """
+    base_dtb_props = {}
+    base_dtb_fixup_offsets = {}
+
+    for path in base_dtb_nodes:
+        common_prop_names = set(dtbs[0].nodes[path].keys())
+        for d in dtbs[1:]:
+            common_prop_names &= set(d.nodes[path].keys())
+
+        node_base_props = {}
+        for prop_name in dtbs[0].nodes[path].keys():
+            if prop_name not in common_prop_names:
+                continue
+
+            all_have_prop_fixups = all(
+                bool(d.sym_props[path][prop_name][1]) for d in dtbs
+            )
+            eligible = []
+            for d in dtbs:
+                sym_val = d.sym_props[path][prop_name]
+                _, targets = sym_val
+                if targets:
+                    # Overlays cannot delete a property from /__local_fixups__,
+                    # so a phandle-bearing value can only go into base.dtb when
+                    # every board also has phandle fixups on this property.
+                    if preserve_local_fixups and not all_have_prop_fixups:
+                        continue
+                    if not all(
+                        t_path in base_dtb_phandles for _, t_path in targets
+                    ):
+                        continue
+                eligible.append(sym_val)
+
+            fixup_entry_cost = len(path) + len(prop_name) + 28
+            chosen_val = select_best_candidate(
+                eligible,
+                lambda sv, fc=fixup_entry_cost: (
+                    len(sv[0]) + len(sv[1]) * fc
+                ),
+            )
+            if chosen_val is not None:
+                node_base_props[prop_name] = chosen_val
+                if preserve_local_fixups and chosen_val[1]:
+                    offs = tuple(off for off, _ in chosen_val[1])
+                    base_dtb_fixup_offsets[(path, prop_name)] = offs
+
+        base_dtb_props[path] = node_base_props
+
+    return base_dtb_props, base_dtb_fixup_offsets
+
+
+def _build_base_dtb(dtbs, base_dtb_nodes, base_dtb_props, base_dtb_phandles,
+                    base_dtb_symbols, base_dtb_fixup_offsets):
+    """Construct and serialize the common base DTB blob.
+
+    Args:
+        dtbs: Sequence of `ParsedDtb` objects.
+        base_dtb_nodes: Ordered list of node paths in the base DTB.
+        base_dtb_props: Dict mapping `path -> {prop_name: sym_val}`.
+        base_dtb_phandles: Dict mapping base DTB node paths to their assigned
+            integer phandles.
+        base_dtb_symbols: Dict mapping symbol label to target node path for the
+            base DTB's `/__symbols__`.
+        base_dtb_fixup_offsets: Dict mapping `(path, prop_name)` to phandle
+            byte offsets for the base DTB's `/__local_fixups__`.
+
+    Returns:
+        Serialized base DTB blob as `bytes`.
+    """
+    base_dtb_root = NodeTree()
+    for path in base_dtb_nodes:
+        node = base_dtb_root.get_node(path)
+        for prop_name, (masked_bytes, targets) in base_dtb_props[path].items():
+            if not targets:
+                node.props[prop_name] = masked_bytes
+            else:
+                val = bytearray(masked_bytes)
+                for off, t_path in targets:
+                    struct.pack_into('>I', val, off, base_dtb_phandles[t_path])
+                node.props[prop_name] = bytes(val)
+
+        if path in base_dtb_phandles:
+            ph_bytes = struct.pack('>I', base_dtb_phandles[path])
+            if any(d.has_phandle_prop[path] for d in dtbs):
+                node.props['phandle'] = ph_bytes
+            if any(d.has_linux_phandle_prop[path] for d in dtbs):
+                node.props['linux,phandle'] = ph_bytes
+
+    if base_dtb_symbols:
+        sym_node = base_dtb_root.get_node('/__symbols__')
+        for label, target_path in base_dtb_symbols.items():
+            sym_node.props[label] = target_path.encode('utf-8') + b'\x00'
+
+    if base_dtb_fixup_offsets:
+        lf_root = base_dtb_root.get_node('/__local_fixups__')
+        for (path, prop_name), offs in base_dtb_fixup_offsets.items():
+            lf_node = lf_root.get_node(path)
+            lf_node.props[prop_name] = struct.pack(f'>{len(offs)}I', *offs)
+
+    return base_dtb_root.to_fdt_blob(
+        mem_rsv=dtbs[0].mem_rsv,
+        boot_cpuid_phys=dtbs[0].boot_cpuid_phys,
+        size_hint=max(len(dtbs[0].raw_bytes), 4096),
+    )
+
+
+def _assign_local_phandles(dtb, base_dtb_phandles):
+    """Assign sequential overlay-local phandles to board-specific nodes.
+
+    Args:
+        dtb: The board's `ParsedDtb`.
+        base_dtb_phandles: Dict mapping base DTB node paths to their phandles.
+
+    Returns:
+        Dict mapping board-specific node path to its overlay-local integer
+        phandle (`1, 2, ...`).
+    """
+    local_phandles = {}
+    next_local_ph = 1
+    for path in dtb.nodes.keys():
+        if dtb.phandles[path] is not None and path not in base_dtb_phandles:
+            local_phandles[path] = next_local_ph
+            next_local_ph += 1
+    return local_phandles
+
+
+def _encode_dtbo_property(path, prop_name, sym_val, base_dtb_phandles,
+                          path_to_base_dtb_symbol, local_phandles, ext_fixups,
+                          ov_local_fixups):
+    """Encode a property value for `/fragment@0/__overlay__` and record fixups.
+
+    Args:
+        path: Target node path in the device tree (e.g. '/soc/i2c@4000').
+        prop_name: Property name.
+        sym_val: Normalized `(masked_bytes, targets)` tuple for the property.
+        base_dtb_phandles: Dict mapping base DTB node paths to their phandles.
+        path_to_base_dtb_symbol: Dict mapping base DTB node paths to symbol
+            names in the base DTB's `/__symbols__`.
+        local_phandles: Dict mapping board-only node paths to overlay-local
+            phandles.
+        ext_fixups: Dict of `label -> [fixup_str, ...]` updated in-place for
+            references to base DTB symbols.
+        ov_local_fixups: Dict of `(path, prop_name) -> [offset, ...]` updated
+            in-place for references to overlay-local phandles.
+
+    Returns:
+        Encoded property value as `bytes`.
+    """
+    masked_bytes, targets = sym_val
+    if not targets:
+        return masked_bytes
+
+    val = bytearray(masked_bytes)
+    for off, t_path in targets:
+        if t_path in base_dtb_phandles:
+            sym_label = path_to_base_dtb_symbol.get(t_path)
+            if sym_label is not None:
+                struct.pack_into('>I', val, off, 0xffffffff)
+                ov_path = (
+                    '/fragment@0/__overlay__'
+                    if path == '/'
+                    else f'/fragment@0/__overlay__{path}'
+                )
+                entry = f'{ov_path}:{prop_name}:{off}'
+                ext_fixups.setdefault(sym_label, []).append(entry)
+            else:
+                # Target is a common base DTB node without a symbol shared by
+                # all input DTBs (e.g. an anonymous &{/path} reference or a
+                # board-specific label); use its assigned base DTB phandle.
+                struct.pack_into('>I', val, off, base_dtb_phandles[t_path])
+        else:
+            struct.pack_into('>I', val, off, local_phandles[t_path])
+            ov_local_fixups.setdefault((path, prop_name), []).append(off)
+    return bytes(val)
+
+
+def _populate_dtbo_overlay_nodes(ov_root, dtb, common_node_set, base_dtb_props,
+                                 base_dtb_phandles, path_to_base_dtb_symbol,
+                                 local_phandles):
+    """Populate `/fragment@0/__overlay__` with board-specific nodes and props.
+
+    Args:
+        ov_root: The `NodeTree` for `/fragment@0/__overlay__`.
+        dtb: The board's `ParsedDtb`.
+        common_node_set: Set of node paths present in the base DTB.
+        base_dtb_props: Dict mapping `path -> {prop_name: sym_val}` in the
+            base DTB.
+        base_dtb_phandles: Dict mapping base DTB node paths to their phandles.
+        path_to_base_dtb_symbol: Dict mapping base DTB node paths to symbol
+            names in the base DTB's `/__symbols__`.
+        local_phandles: Dict mapping board-only node paths to overlay-local
+            phandles.
+
+    Returns:
+        Tuple of `(ext_fixups, ov_local_fixups)` collected across all overlay
+        properties.
+    """
+    ext_fixups = {}
+    ov_local_fixups = {}
+
+    for path, props in dtb.nodes.items():
+        in_base_dtb = path in common_node_set
+        base_node_props = base_dtb_props.get(path, {})
+
+        diff_props = [
+            (prop_name, dtb.sym_props[path][prop_name])
+            for prop_name in props.keys()
+            if (not in_base_dtb or
+                base_node_props.get(prop_name) !=
+                dtb.sym_props[path][prop_name])
+        ]
+
+        if not in_base_dtb or diff_props:
+            ov_node = ov_root.get_node(path)
+            for prop_name, sym_val in diff_props:
+                ov_node.props[prop_name] = _encode_dtbo_property(
+                    path, prop_name, sym_val, base_dtb_phandles,
+                    path_to_base_dtb_symbol, local_phandles, ext_fixups,
+                    ov_local_fixups,
+                )
+
+            if path in local_phandles:
+                ph_bytes = struct.pack('>I', local_phandles[path])
+                if dtb.has_phandle_prop[path]:
+                    ov_node.props['phandle'] = ph_bytes
+                if dtb.has_linux_phandle_prop[path]:
+                    ov_node.props['linux,phandle'] = ph_bytes
+
+    return ext_fixups, ov_local_fixups
+
+
+def _populate_dtbo_metadata(dtbo_root, ov_root, dtb, base_dtb_symbols,
+                            base_dtb_fixup_offsets, ext_fixups,
+                            ov_local_fixups, preserve_local_fixups):
+    """Populate `/__symbols__`, `/__fixups__`, and `/__local_fixups__` on DTBO.
+
+    Args:
+        dtbo_root: Root `NodeTree` of the `.dtbo` overlay.
+        ov_root: The `NodeTree` for `/fragment@0/__overlay__`.
+        dtb: The board's `ParsedDtb`.
+        base_dtb_symbols: Dict of symbols already present in the base DTB.
+        base_dtb_fixup_offsets: Dict of `/__local_fixups__` offsets already
+            present in the base DTB.
+        ext_fixups: Dict of `label -> [fixup_str, ...]` referencing base DTB
+            symbols.
+        ov_local_fixups: Dict of `(path, prop_name) -> [offset, ...]`
+            referencing overlay-local phandles.
+        preserve_local_fixups: Whether to emit differing input
+            `/__local_fixups__` entries into
+            `/fragment@0/__overlay__/__local_fixups__`.
+    """
+    # If preserving input /__local_fixups__ in the merged tree, place any
+    # differing fixup offset lists under
+    # /fragment@0/__overlay__/__local_fixups__
+    if preserve_local_fixups:
+        for (path, prop_name), offs in dtb.local_fixups.items():
+            if base_dtb_fixup_offsets.get((path, prop_name)) != offs:
+                merged_lf_root = ov_root.get_node('/__local_fixups__')
+                merged_lf_node = merged_lf_root.get_node(path)
+                merged_lf_node.props[prop_name] = struct.pack(
+                    f'>{len(offs)}I', *offs
+                )
+
+    # Emit overlay root /__symbols__ for new or modified symbols
+    diff_syms = [
+        (label, t_path)
+        for label, t_path in dtb.symbols.items()
+        if base_dtb_symbols.get(label) != t_path
+    ]
+    if diff_syms:
+        sym_node = dtbo_root.get_node('/__symbols__')
+        for label, t_path in diff_syms:
+            # Ensure target node exists in __overlay__ so dtc -I dtb -O dts
+            # on the standalone .dtbo does not warn about a missing node.
+            ov_root.get_node(t_path)
+            ov_target = (
+                '/fragment@0/__overlay__'
+                if t_path == '/'
+                else f'/fragment@0/__overlay__{t_path}'
+            )
+            sym_node.props[label] = ov_target.encode('utf-8') + b'\x00'
+
+    # Emit overlay root /__fixups__ for references to base DTB symbols
+    if ext_fixups:
+        fixups_node = dtbo_root.get_node('/__fixups__')
+        for label, entries in ext_fixups.items():
+            fixups_node.props[label] = (
+                '\x00'.join(entries).encode('utf-8') + b'\x00'
+            )
+
+    # Emit overlay root /__local_fixups__ for overlay-local phandles
+    if ov_local_fixups:
+        ov_lf_root = dtbo_root.get_node(
+            '/__local_fixups__/fragment@0/__overlay__'
+        )
+        for (path, prop_name), offs in ov_local_fixups.items():
+            lf_node = ov_lf_root.get_node(path)
+            lf_node.props[prop_name] = struct.pack(f'>{len(offs)}I', *offs)
+
+
+def _build_board_dtbo(dtb, common_node_set, base_dtb_props, base_dtb_phandles,
+                      base_dtb_symbols, path_to_base_dtb_symbol,
+                      base_dtb_fixup_offsets, preserve_local_fixups):
+    """Construct and serialize the `.dtbo` overlay blob for a single board.
+
+    Args:
+        dtb: The board's `ParsedDtb`.
+        common_node_set: Set of node paths present in the base DTB.
+        base_dtb_props: Dict mapping `path -> {prop_name: sym_val}` in the
+            base DTB.
+        base_dtb_phandles: Dict mapping base DTB node paths to their phandles.
+        base_dtb_symbols: Dict of symbols present in the base DTB.
+        path_to_base_dtb_symbol: Dict mapping base DTB node paths to symbol
+            names in the base DTB's `/__symbols__`.
+        base_dtb_fixup_offsets: Dict of `/__local_fixups__` offsets present in
+            the base DTB.
+        preserve_local_fixups: Whether to preserve `/__local_fixups__` in the
+            merged output.
+
+    Returns:
+        Serialized `.dtbo` overlay blob as `bytes`.
+    """
+    dtbo_root = NodeTree()
+    frag_node = dtbo_root.get_node('/fragment@0')
+    frag_node.props['target-path'] = b'/\x00'
+    ov_root = frag_node.get_node('__overlay__')
+
+    local_phandles = _assign_local_phandles(dtb, base_dtb_phandles)
+    ext_fixups, ov_local_fixups = _populate_dtbo_overlay_nodes(
+        ov_root, dtb, common_node_set, base_dtb_props, base_dtb_phandles,
+        path_to_base_dtb_symbol, local_phandles,
+    )
+    _populate_dtbo_metadata(
+        dtbo_root, ov_root, dtb, base_dtb_symbols, base_dtb_fixup_offsets,
+        ext_fixups, ov_local_fixups, preserve_local_fixups,
+    )
+
+    return dtbo_root.to_fdt_blob(size_hint=16384)
+
+
+def create_base_dtb_and_overlays(dtbs, strip_local_fixups=False):
+    """Compute the base DTB and per-board DTBO blobs from parsed DTBs.
+
+    Args:
+        dtbs: List of `ParsedDtb` objects (all compiled with `-@ -L`).
+        strip_local_fixups: If True, omit `/__local_fixups__` from the base DTB
+            and from the merged result.
+
+    Returns:
+        Tuple of `(base_dtb_blob, dtbo_blobs)` where `base_dtb_blob` is `bytes`
+        and `dtbo_blobs` is a list of `bytes` corresponding to `dtbs`.
+    """
+    missing_meta = [
+        d.filename for d in dtbs if not (d.has_symbols and d.has_local_fixups)
+    ]
+    if missing_meta:
+        raise ValueError(
+            f'input DTB(s) lack /__symbols__ or /__local_fixups__: '
+            f'{", ".join(missing_meta)} (compile input DTBs with dtc -@ -L)'
+        )
+
+    _validate_dtb_headers(dtbs)
+
+    for d in dtbs:
+        d.build_symbolic_props()
+
+    base_dtb_nodes, common_node_set, base_dtb_phandles = (
+        _find_common_nodes_and_phandles(dtbs)
+    )
+    base_dtb_symbols, path_to_base_dtb_symbol = _find_common_symbols(
+        dtbs, common_node_set, base_dtb_phandles
+    )
+    preserve_local_fixups = not strip_local_fixups
+    base_dtb_props, base_dtb_fixup_offsets = _select_base_dtb_properties(
+        dtbs, base_dtb_nodes, base_dtb_phandles, preserve_local_fixups
+    )
+
+    base_dtb_blob = _build_base_dtb(
+        dtbs, base_dtb_nodes, base_dtb_props, base_dtb_phandles,
+        base_dtb_symbols, base_dtb_fixup_offsets,
+    )
+    dtbo_blobs = [
+        _build_board_dtbo(
+            d, common_node_set, base_dtb_props, base_dtb_phandles,
+            base_dtb_symbols, path_to_base_dtb_symbol, base_dtb_fixup_offsets,
+            preserve_local_fixups,
+        )
+        for d in dtbs
+    ]
+    return base_dtb_blob, dtbo_blobs
+
+
+def verify_recreated_dtb(orig_dtb, base_dtb_blob, dtbo_blob,
+                         strip_local_fixups):
+    """Apply `dtbo_blob` to `base_dtb_blob` and verify it matches `orig_dtb`.
+
+    Args:
+        orig_dtb: The original `ParsedDtb` instance for the board.
+        base_dtb_blob: Uncompressed base DTB binary as `bytes`.
+        dtbo_blob: Uncompressed board `.dtbo` overlay binary as `bytes`.
+        strip_local_fixups: Whether `/__local_fixups__` was stripped.
+
+    Raises:
+        RuntimeError: If `fdt_overlay_apply()` fails or any node, property,
+            phandle, symbol, or header field in the merged DTB differs from
+            `orig_dtb`.
+    """
+    merged_fdt = libfdt.Fdt(base_dtb_blob)
+    merged_fdt.resize(len(base_dtb_blob) + len(dtbo_blob) * 2 + 65536)
+    fdto = bytearray(dtbo_blob)
+    err = libfdt.fdt_overlay_apply(merged_fdt._fdt, fdto)
+    if err != 0:
+        raise RuntimeError(
+            f'{orig_dtb.filename}: fdt_overlay_apply failed with error {err} '
+            f'({libfdt.strerror(err)})'
+        )
+    merged_fdt.pack()
+    recreated = ParsedDtb(
+        f'{orig_dtb.filename} (recreated)', bytes(merged_fdt.as_bytearray())
+    )
+    if strip_local_fixups:
+        if recreated.has_local_fixups:
+            raise RuntimeError(
+                f'{orig_dtb.filename}: /__local_fixups__ present despite '
+                f'--strip-local-fixups'
+            )
+        recreated.local_fixups = orig_dtb.local_fixups
+    else:
+        if orig_dtb.local_fixups != recreated.local_fixups:
+            raise RuntimeError(
+                f'{orig_dtb.filename}: /__local_fixups__ mismatch'
+            )
+
+    recreated.build_symbolic_props()
+
+    if set(orig_dtb.nodes.keys()) != set(recreated.nodes.keys()):
+        missing = set(orig_dtb.nodes.keys()) - set(recreated.nodes.keys())
+        extra = set(recreated.nodes.keys()) - set(orig_dtb.nodes.keys())
+        raise RuntimeError(
+            f'{orig_dtb.filename}: node mismatch (missing={missing}, '
+            f'extra={extra})'
+        )
+
+    for path in orig_dtb.nodes.keys():
+        if orig_dtb.sym_props[path] != recreated.sym_props[path]:
+            for p in (set(orig_dtb.sym_props[path]) |
+                      set(recreated.sym_props[path])):
+                if (orig_dtb.sym_props[path].get(p) !=
+                        recreated.sym_props[path].get(p)):
+                    raise RuntimeError(
+                        f'{orig_dtb.filename}: property mismatch at {path}:{p}'
+                    )
+        # Common base nodes may gain a phandle if another board referenced them.
+        if (orig_dtb.has_phandle_prop[path] and
+                not recreated.has_phandle_prop[path]):
+            raise RuntimeError(
+                f'{orig_dtb.filename}: missing phandle at {path}'
+            )
+        if (orig_dtb.has_linux_phandle_prop[path] and
+                not recreated.has_linux_phandle_prop[path]):
+            raise RuntimeError(
+                f'{orig_dtb.filename}: missing linux,phandle at {path}'
+            )
+
+    if orig_dtb.symbols != recreated.symbols:
+        raise RuntimeError(f'{orig_dtb.filename}: /__symbols__ mismatch')
+    if orig_dtb.boot_cpuid_phys != recreated.boot_cpuid_phys:
+        raise RuntimeError(
+            f'{orig_dtb.filename}: boot_cpuid_phys mismatch '
+            f'({orig_dtb.boot_cpuid_phys} != {recreated.boot_cpuid_phys})'
+        )
+    if orig_dtb.mem_rsv != recreated.mem_rsv:
+        raise RuntimeError(
+            f'{orig_dtb.filename}: /memreserve/ mismatch '
+            f'({orig_dtb.mem_rsv} != {recreated.mem_rsv})'
+        )
+
+
+def get_dtbo_output_path(dtb_path, outdir):
+    """Determine the output `.dtbo` file path for an input `.dtb` path.
+
+    Args:
+        dtb_path: Path to the input `.dtb` file.
+        outdir: Output directory if `--outdir` was specified, else None.
+
+    Returns:
+        Output `.dtbo` file path string.
+    """
+    dtb_dir, stem = split_dtb_filename(dtb_path)
+    dtbo_name = f'{stem}.dtbo'
+    target_dir = outdir if outdir is not None else dtb_dir
+    return os.path.join(target_dir, dtbo_name)
+
+
+def parse_args():
+    """Parse command-line arguments.
+
+    Returns:
+        Parsed `argparse.Namespace` object.
+    """
+    parser = argparse.ArgumentParser(
+        description=(
+            'Split a set of compiled device tree blobs (.dtb) into a single '
+            'common base .dtb and per-board overlay blobs (.dtbo).'
+        )
+    )
+    parser.add_argument(
+        '-b', '--base-dtb',
+        required=True,
+        metavar='BASE_DTB',
+        help=(
+            'Output common base .dtb file path (placed in --outdir if '
+            'specified without a directory component)'
+        ),
+    )
+    parser.add_argument(
+        '-o', '--outdir',
+        default=None,
+        metavar='DIR',
+        help=(
+            'Output directory for generated .dtbo files and bare --base-dtb '
+            'filenames (default: alongside each input .dtb)'
+        ),
+    )
+    parser.add_argument(
+        '-S', '--strip-local-fixups',
+        action='store_true',
+        help=(
+            'Omit /__local_fixups__ from the generated base .dtb and '
+            'reconstructed device trees'
+        ),
+    )
+    parser.add_argument(
+        '--verify',
+        action='store_true',
+        help=(
+            'Verify that applying each generated .dtbo to the base .dtb '
+            'recreates the original .dtb'
+        ),
+    )
+    parser.add_argument(
+        '-v', '--verbose',
+        action='store_true',
+        help='Print size statistics summary',
+    )
+    parser.add_argument(
+        'dtbs',
+        nargs='+',
+        metavar='DTB',
+        help='Input .dtb files (at least two required)',
+    )
+    args = parser.parse_args()
+    if len(args.dtbs) < 2:
+        parser.error('at least two input .dtb files are required')
+    return args
+
+
+def factor_dtb_files(args):
+    """Factor a list of standalone .dtb files into a base .dtb and .dtbo files.
+
+    Args:
+        args: Parsed `argparse.Namespace` object.
+    """
+    input_dtb_paths = args.dtbs
+
+    dtbs = [ParsedDtb.from_file(p) for p in input_dtb_paths]
+
+    base_dtb_path = (
+        os.path.join(args.outdir, args.base_dtb)
+        if args.outdir is not None and not os.path.dirname(args.base_dtb)
+        else args.base_dtb
+    )
+
+    input_abs_paths = {os.path.abspath(p) for p in input_dtb_paths}
+    base_abs_path = os.path.abspath(base_dtb_path)
+    if base_abs_path in input_abs_paths:
+        raise ValueError(
+            f'base DTB output path {base_dtb_path!r} collides with '
+            f'an input DTB file'
+        )
+
+    dtbo_paths = []
+    seen_paths = {base_abs_path}
+    for dtb_path in input_dtb_paths:
+        out_path = get_dtbo_output_path(dtb_path, args.outdir)
+        abs_out = os.path.abspath(out_path)
+        if abs_out in input_abs_paths:
+            raise ValueError(
+                f'output path {out_path!r} collides with an input DTB file'
+            )
+        if abs_out in seen_paths:
+            raise ValueError(
+                f'output path collision on {out_path!r}; ensure input '
+                f'files have distinct names'
+            )
+        seen_paths.add(abs_out)
+        dtbo_paths.append(out_path)
+
+    base_dtb_blob, dtbo_blobs = create_base_dtb_and_overlays(
+        dtbs,
+        strip_local_fixups=args.strip_local_fixups,
+    )
+
+    if args.verify:
+        for d, dtbo_blob in zip(dtbs, dtbo_blobs):
+            verify_recreated_dtb(
+                d, base_dtb_blob, dtbo_blob, args.strip_local_fixups
+            )
+
+    base_dtb_dir = os.path.dirname(base_dtb_path)
+    if base_dtb_dir:
+        os.makedirs(base_dtb_dir, exist_ok=True)
+    with open(base_dtb_path, 'wb') as f:
+        f.write(base_dtb_blob)
+
+    if args.outdir:
+        os.makedirs(args.outdir, exist_ok=True)
+    for out_path, dtbo_blob in zip(dtbo_paths, dtbo_blobs):
+        out_dir = os.path.dirname(out_path)
+        if out_dir:
+            os.makedirs(out_dir, exist_ok=True)
+        with open(out_path, 'wb') as f:
+            f.write(dtbo_blob)
+
+    if args.verbose:
+        orig_uncomp = sum(len(d.raw_bytes) for d in dtbs)
+        base_dtb_uncomp = len(base_dtb_blob)
+        dtbo_uncomp = sum(len(b) for b in dtbo_blobs)
+        new_uncomp = base_dtb_uncomp + dtbo_uncomp
+        saved_uncomp = orig_uncomp - new_uncomp
+        pct_uncomp = (
+            (saved_uncomp / orig_uncomp * 100.0) if orig_uncomp else 0.0
+        )
+
+        print(
+            f'Uncompressed DTBs: {len(dtbs)} files ({orig_uncomp:,} bytes) -> '
+            f'base {base_dtb_uncomp:,} B + {len(dtbo_blobs)} overlays '
+            f'{dtbo_uncomp:,} B = {new_uncomp:,} bytes '
+            f'(saved {saved_uncomp:,} B / {pct_uncomp:.1f}%)'
+        )
+
+
+def main():
+    """Run the fdtfactor command-line tool.
+
+    Returns:
+        Process exit code (0 on success).
+    """
+    args = parse_args()
+    try:
+        factor_dtb_files(args)
+    except (OSError, ValueError, RuntimeError, libfdt.FdtException) as exc:
+        sys.exit(f'Error: {exc}')
+    return 0
+
+
+if __name__ == '__main__':
+    sys.exit(main())
diff --git a/meson.build b/meson.build
index 520cd35f9075..73b4687a2852 100644
--- a/meson.build
+++ b/meson.build
@@ -114,6 +114,7 @@ if get_option('tools') and not wheel_only
 
   install_data(
     'dtdiff',
+    'fdtfactor',
     install_dir: get_option('bindir'),
     install_mode: 'rwxr-xr-x',
   )
diff --git a/tests/Makefile.tests b/tests/Makefile.tests
index af5d309cf8a9..9f8a2896d597 100644
--- a/tests/Makefile.tests
+++ b/tests/Makefile.tests
@@ -53,7 +53,7 @@ TESTS_DEPFILES = $(TESTS:%=%.d) \
 	$(addprefix $(TESTS_PREFIX),testutils.d)
 
 TESTS_CLEANFILES_L = $(STD_CLEANFILES) \
-	*.dtb *.test.dts *.test.dt.yaml *.dtsv1 tmp.* *.bak \
+	*.dtb *.test.dtbo *.test.dts *.test.dt.yaml *.dtsv1 tmp.* *.bak \
 	treegen
 TESTS_CLEANFILES = $(TESTS) $(TESTS_CLEANFILES_L:%=$(TESTS_PREFIX)%)
 TESTS_CLEANDIRS_L = fs
diff --git a/tests/fdtfactor_board1.dts b/tests/fdtfactor_board1.dts
new file mode 100644
index 000000000000..cab6b3a4a3cd
--- /dev/null
+++ b/tests/fdtfactor_board1.dts
@@ -0,0 +1,69 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/dts-v1/;
+
+/ {
+	model = "Test Board 1";
+	compatible = "vendor,board1", "vendor,common";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	intc: interrupt-controller@1000 {
+		compatible = "vendor,intc";
+		reg = <0x1000 0x100>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	clk: clock-controller@2000 {
+		compatible = "vendor,clk";
+		reg = <0x2000 0x100>;
+		#clock-cells = <1>;
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+		interrupt-parent = <&intc>;
+
+		uart0: serial@3000 {
+			compatible = "vendor,uart";
+			reg = <0x3000 0x100>;
+			interrupts = <1 0>;
+			clocks = <&clk 1>;
+			status = "okay";
+		};
+
+		i2c0: i2c@4000 {
+			compatible = "vendor,i2c";
+			reg = <0x4000 0x100>;
+			interrupts = <2 0>;
+			clocks = <&clk 2>;
+			status = "okay";
+
+			pmic: pmic@40 {
+				compatible = "vendor,pmic";
+				reg = <0x40>;
+
+				reg_vdd: vdd {
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+				};
+			};
+		};
+
+		spi0: spi@5000 {
+			compatible = "vendor,spi";
+			reg = <0x5000 0x100>;
+			clocks = <&clk 3>;
+			vdd-supply = <&reg_vdd>;
+			cs-supply = <&board1_reg>;
+		};
+	};
+
+	board1_reg: regulator-board1 {
+		compatible = "regulator-fixed";
+		regulator-name = "board1-cs";
+	};
+};
diff --git a/tests/fdtfactor_board2.dts b/tests/fdtfactor_board2.dts
new file mode 100644
index 000000000000..8d3322e5ce74
--- /dev/null
+++ b/tests/fdtfactor_board2.dts
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/dts-v1/;
+
+/ {
+	model = "Test Board 2";
+	compatible = "vendor,board2", "vendor,common";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	/*
+	 * Extra phandle-bearing node before intc/clk shifts all subsequent
+	 * phandle numbers in board2.dtb relative to board1.dtb.
+	 */
+	board2_early_reg: regulator-early {
+		compatible = "regulator-fixed";
+		regulator-name = "board2-early";
+	};
+
+	intc: interrupt-controller@1000 {
+		compatible = "vendor,intc";
+		reg = <0x1000 0x100>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	clk: clock-controller@2000 {
+		compatible = "vendor,clk";
+		reg = <0x2000 0x100>;
+		#clock-cells = <1>;
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+		interrupt-parent = <&intc>;
+
+		uart0: serial@3000 {
+			compatible = "vendor,uart";
+			reg = <0x3000 0x100>;
+			interrupts = <1 0>;
+			clocks = <&clk 1>;
+			status = "disabled";
+		};
+
+		i2c0: i2c@4000 {
+			compatible = "vendor,i2c";
+			reg = <0x4000 0x100>;
+			interrupts = <2 0>;
+			clocks = <&clk 2>;
+			status = "okay";
+
+			pmic: pmic@40 {
+				compatible = "vendor,pmic";
+				reg = <0x40>;
+
+				reg_vdd: vdd {
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <3300000>;
+				};
+			};
+		};
+
+		mmc0: mmc@6000 {
+			compatible = "vendor,mmc";
+			reg = <0x6000 0x100>;
+			clocks = <&clk 4>;
+			vmmc-supply = <&reg_vdd>;
+			vqmmc-supply = <&board2_early_reg>;
+		};
+	};
+};
diff --git a/tests/fdtfactor_board3.dts b/tests/fdtfactor_board3.dts
new file mode 100644
index 000000000000..1a0fb1641241
--- /dev/null
+++ b/tests/fdtfactor_board3.dts
@@ -0,0 +1,96 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/dts-v1/;
+
+/ {
+	model = "Test Board 3";
+	compatible = "vendor,board3", "vendor,common";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	/*
+	 * Two extra phandle-bearing nodes before intc/clk shift all subsequent
+	 * phandle numbers in board3.dtb relative to both board1.dtb and
+	 * board2.dtb.
+	 */
+	board3_early_reg1: regulator-early1 {
+		compatible = "regulator-fixed";
+		regulator-name = "board3-early1";
+	};
+
+	board3_early_reg2: regulator-early2 {
+		compatible = "regulator-fixed";
+		regulator-name = "board3-early2";
+		vin-supply = <&board3_early_reg1>;
+	};
+
+	intc: interrupt-controller@1000 {
+		compatible = "vendor,intc";
+		reg = <0x1000 0x100>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	clk: clock-controller@2000 {
+		compatible = "vendor,clk";
+		reg = <0x2000 0x100>;
+		#clock-cells = <1>;
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+		interrupt-parent = <&intc>;
+
+		uart0: serial@3000 {
+			compatible = "vendor,uart";
+			reg = <0x3000 0x100>;
+			interrupts = <1 0>;
+			clocks = <&clk 1>;
+			status = "okay";
+		};
+
+		i2c0: i2c@4000 {
+			compatible = "vendor,i2c";
+			reg = <0x4000 0x100>;
+			interrupts = <2 0>;
+			clocks = <&clk 2>;
+			status = "okay";
+
+			pmic: pmic@40 {
+				compatible = "vendor,pmic";
+				reg = <0x40>;
+
+				reg_vdd: vdd {
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <3300000>;
+				};
+			};
+		};
+
+		spi0: spi@5000 {
+			compatible = "vendor,spi";
+			reg = <0x5000 0x100>;
+			clocks = <&clk 3>;
+			vdd-supply = <&reg_vdd>;
+			cs-supply = <&board3_early_reg2>;
+		};
+
+		mmc0: mmc@6000 {
+			compatible = "vendor,mmc";
+			reg = <0x6000 0x100>;
+			clocks = <&clk 4>;
+			vmmc-supply = <&reg_vdd>;
+			vqmmc-supply = <&board3_early_reg1>;
+		};
+
+		usb0: usb@7000 {
+			compatible = "vendor,usb";
+			reg = <0x7000 0x100>;
+			interrupts = <5 0>;
+			clocks = <&clk 5>;
+			vbus-supply = <&board3_early_reg2>;
+		};
+	};
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 842b543059bb..92fa417d3457 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -239,6 +239,21 @@ run_fdtoverlay_test() {
     base_run_test sh "$SRCDIR/fdtoverlay-runtest.sh" "$expect" "$@"
 }
 
+# Compare an original .dtb and a recreated .dtb by decompiling and sorting both
+# with dtc -I dtb -O dts -qq -f -s (like dtdiff) and normalizing the numeric
+# phandle properties assigned to target nodes. Because both blobs contain
+# /__symbols__ and /__local_fixups__, dtc restores all node labels and converts
+# all phandle references in properties back into symbolic <&label> references.
+check_dtb_recreated () {
+    orig="$1"
+    recreated="$2"
+    $DTC -I dtb -O dts -qq -f -s -o "$orig.raw.test.dts" "$orig" || return 1
+    $DTC -I dtb -O dts -qq -f -s -o "$recreated.raw.test.dts" "$recreated" || return 1
+    sed 's/phandle = <0x[0-9a-f]*>;/phandle = <0xffffffff>;/' "$orig.raw.test.dts" > "$orig.cmp.test.dts" || return 1
+    sed 's/phandle = <0x[0-9a-f]*>;/phandle = <0xffffffff>;/' "$recreated.raw.test.dts" > "$recreated.cmp.test.dts" || return 1
+    diff -u "$orig.cmp.test.dts" "$recreated.cmp.test.dts"
+}
+
 BAD_FIXUP_TREES="bad_index \
 		empty \
 		empty_index \
@@ -1089,6 +1104,50 @@ fdtoverlay_tests() {
 
     shorten_echo "check phandle to noda d wasn't overwritten:	"
     run_wrap_test test "$bd" = "$pd"
+
+    if ! $no_python; then
+	run_dtc_test -@ -L -I dts -O dtb -o fdtfactor_board1.test.dtb "$SRCDIR/fdtfactor_board1.dts"
+	run_dtc_test -@ -L -I dts -O dtb -o fdtfactor_board2.test.dtb "$SRCDIR/fdtfactor_board2.dts"
+	run_dtc_test -@ -L -I dts -O dtb -o fdtfactor_board3.test.dtb "$SRCDIR/fdtfactor_board3.dts"
+
+	# Symbolic phandle deduplication mode (3 boards)
+	run_wrap_test $PYTHON "$FDTFACTOR" -v --verify \
+	    -b fdtfactor_base.test.dtb \
+	    fdtfactor_board1.test.dtb fdtfactor_board2.test.dtb fdtfactor_board3.test.dtb
+	run_wrap_test $FDTOVERLAY -i fdtfactor_base.test.dtb \
+	    -o fdtfactor_board1.recreated.test.dtb fdtfactor_board1.test.dtbo
+	run_wrap_test $FDTOVERLAY -i fdtfactor_base.test.dtb \
+	    -o fdtfactor_board2.recreated.test.dtb fdtfactor_board2.test.dtbo
+	run_wrap_test $FDTOVERLAY -i fdtfactor_base.test.dtb \
+	    -o fdtfactor_board3.recreated.test.dtb fdtfactor_board3.test.dtbo
+	run_wrap_test check_dtb_recreated fdtfactor_board1.test.dtb fdtfactor_board1.recreated.test.dtb
+	run_wrap_test check_dtb_recreated fdtfactor_board2.test.dtb fdtfactor_board2.recreated.test.dtb
+	run_wrap_test check_dtb_recreated fdtfactor_board3.test.dtb fdtfactor_board3.recreated.test.dtb
+	# Majority value ("okay" in boards 1 & 3) should be in base.dtb
+	run_fdtget_test "okay" fdtfactor_base.test.dtb /soc/serial@3000 status -ts
+
+	# Strip local fixups mode (3 boards)
+	run_wrap_test $PYTHON "$FDTFACTOR" --verify -S \
+	    --base-dtb fdtfactor_base_stripped.test.dtb -o . \
+	    fdtfactor_board1.test.dtb fdtfactor_board2.test.dtb fdtfactor_board3.test.dtb
+	run_wrap_test $FDTOVERLAY -i fdtfactor_base_stripped.test.dtb \
+	    -o fdtfactor_board1.stripped.test.dtb fdtfactor_board1.test.dtbo
+	run_wrap_test $FDTOVERLAY -i fdtfactor_base_stripped.test.dtb \
+	    -o fdtfactor_board2.stripped.test.dtb fdtfactor_board2.test.dtbo
+	run_wrap_test $FDTOVERLAY -i fdtfactor_base_stripped.test.dtb \
+	    -o fdtfactor_board3.stripped.test.dtb fdtfactor_board3.test.dtbo
+	run_test check_path fdtfactor_board1.stripped.test.dtb not-exists "/__local_fixups__"
+	# Without /__local_fixups__, dtc -I dtb -O dts cannot turn phandle cells
+	# inside properties back into <&label> references, so compare stripped
+	# against recreated (after removing /__local_fixups__), which shares
+	# fdtfactor's phandle numbering and was already verified against orig.
+	run_wrap_test $DTPUT -r fdtfactor_board1.recreated.test.dtb /__local_fixups__
+	run_wrap_test $DTPUT -r fdtfactor_board2.recreated.test.dtb /__local_fixups__
+	run_wrap_test $DTPUT -r fdtfactor_board3.recreated.test.dtb /__local_fixups__
+	run_wrap_test check_dtb_recreated fdtfactor_board1.recreated.test.dtb fdtfactor_board1.stripped.test.dtb
+	run_wrap_test check_dtb_recreated fdtfactor_board2.recreated.test.dtb fdtfactor_board2.stripped.test.dtb
+	run_wrap_test check_dtb_recreated fdtfactor_board3.recreated.test.dtb fdtfactor_board3.stripped.test.dtb
+    fi
 }
 
 pylibfdt_tests () {
@@ -1139,7 +1198,7 @@ if [ -z "$TESTSETS" ]; then
 fi
 
 # Make sure we don't have stale blobs lying around
-rm -f *.test.dtb *.test.dts
+rm -f *.test.dtb *.test.dtbo *.test.dts
 
 for set in $TESTSETS; do
     case $set in
diff --git a/tests/testutils.sh b/tests/testutils.sh
index 6b2f0d14e3e5..7f35ba8e4158 100644
--- a/tests/testutils.sh
+++ b/tests/testutils.sh
@@ -27,6 +27,7 @@ DTGET=${TEST_BINDIR}/fdtget
 DTPUT=${TEST_BINDIR}/fdtput
 FDTDUMP=${TEST_BINDIR}/fdtdump
 FDTOVERLAY=${TEST_BINDIR}/fdtoverlay
+FDTFACTOR=${SRCDIR}/../fdtfactor
 
 verbose_run () {
     if [ -z "$QUIET_TEST" ]; then
-- 
2.56.0.176.g3575e65682-goog

