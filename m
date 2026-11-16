Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862448;
	b=DN5U37vZxT7J0IhQ3zPnCfhzLQ8OLXhl/Q0AN59oZ9U48pwAotkcIkOLNgCuKnEz4ZzN
	 xE6cgI8qbdrBms8GMJv1FIrkriF8JgicUuz9VwkwJrXHuy7mbu4sJWOf1P19n+oUA9jsl
	 57JvCV0ELaOhobbzceesgKnIbdrP9DNI/F80TzXAyGj2j2heGs690HeL4zeEI/edtM0Fe
	 Gf+k6ZX48WbkP0k9jbMjcuBJTLEz76+L+IhVXx5Xbo/6+yatJBpytjReCcFWucilVPa6o
	 JcuFxFRdjpJaXTfIwaWjkGEWh3/CXIpCkQhWK6p2QzSxFCSx5nm+tt91dLRIKVt5Hug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862448;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=aJBfUS11DwtHWIFuF76LsICpJUQjoWwoJoLjYxQelng=;
	b=FoJGox1w96GosnkR2BKF6Age9FtZyCO4qA3Jss7UeEmD0M/wNk8HtKgzL8CZwc1Sa8R+
	 VL3vOZxrHktEFHtaRvI3G/So7zUUYfvEMYD1MOUyKhWn49cA/QzvTILPfiQ8tyAzzPB4V
	 hhTiCaTmyoBq3HuAQruBHFymdCYwG0Bmw9Pb43a+N9R1RTBQMZC94fjyRVkENjTGvtXP6
	 3pPN0VQ4pFM4vyxaq58cbrfvpG9LZwhJVI1Pxhtmv31MXBvwQcQBUC/0O0eggHbDW9l0/
	 a6mesP24BP1sIc2AjWF4hUkc+8ERU3uaTVI4lTImk+hmtqbkwKdY4pd3fOKMhWND5og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=L4tWlBMx;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69402606A8A7
	for <Devicetree-compiler@vger.kernel.org>; Mon, 16 Nov 2026 20:54:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69402606A8A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=L4tWlBMx
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1a3c08d6928so5462187c88.0
        for <Devicetree-compiler@vger.kernel.org>; Mon, 16 Nov 2026 12:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794862446; x=1795467246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aJBfUS11DwtHWIFuF76LsICpJUQjoWwoJoLjYxQelng=;
        b=L4tWlBMxlVoav4ijzzZC5qO+SGpu0xPd8HhVW2nDJ/3pgZuT3uyNB39c+FCzlFrAvl
         76xFHvqP9XjRasqk1bAEy99jF2L/Y0MDtWQ/vZxWkV2c77ZPgWErqkdfE9QHjFV0lDpV
         wTkT9oGjTLDS1byfp941icFM0JN/ZP6N8M9xs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794862446; x=1795467246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aJBfUS11DwtHWIFuF76LsICpJUQjoWwoJoLjYxQelng=;
        b=io8dPnNuKtuKRhXY0a6Dhr6XMf8dpobSuVdfj4T66w4Mx5hSeffYUj67AZzf/sSjDJ
         M9h7iDl2c6Z+wSgoerrkW+UMD2O78VFmDQ8cRlFJE5CkT7NWI3nN87oHqczUBn575APY
         v/HJpVHID3QVn36cgcRgwhWUXYx+5uMv0h3TLlvCiom4/Znwr73Ba5Kk4jTxOPBnnNZ9
         TFxw8keGlbnMb79aGhkXlRJb8Wi5QlAG3thjXIVL4jzZN5ef7p2QSa4EoMiL8ihcJ31Z
         scz+OVqbY1HFXocH5M7G4vBFalOQXfI2XTzxubxzbMj24C34OCxVc9yQUfnGTIG204UI
         LoYQ==
X-Gm-Message-State: APuU4Z+m2TAZkcOL/rzxT6rNLIOAI9IerujjU3zNqyXaOSOcGnLlMLai
	Zlw7pCg9n6tzQN3hcjoQ3x5/iPZNSsSM/25uoPv4V9wNuuktjvWjbTngEwyZF0dRjKReVsaxq4I
	ufYMTgw==
X-Gm-Gg: AYBFou3C1O2R7nDOI2G4rW+MUpKO7ISTBBAh0VcxK/oa07YjEKflIlihveXSN24Cd99
	MjRsvoArYxpQp5IFuz+IkOt6opJsCVMJKd4AOKahutZYDceKE7NACGVrTROhWRbPn6s/1Y3Xh2m
	uyLRbyCy9rKti+rs+7wsVA+XGxRTGA7xRukxo44GsmfetxbSp1l6a+G7AUZ3/reBSiXYTh8+mVT
	covA6Y2j9w2dfW1R6me6regqtU430h4R8NdDyYT4LOsvrhzTaWSitJGjSC3KvAIIpVOvdFpW1WP
	1IgRrL8WI9E4kBq8bHnO5auE6oK+zbDbyhXHXQWwizHqe40feKRy592FLofaiuQWmQJoFkhHiOl
	hT5ZrRNlp/Fv1RtUqv8fq02nsdxA7R2Fh5wHHNVzpPIE5afiN8Svad9NhWRxo5B2I5frQTez1l7
	fNbawBd1SNT3l4D6djjOH6EwZdVi/rrbuWSquOvotoX0ayVNh/JFv6c+23hUCDQvs73ZddGyWnl
	zU5R/tEHHP6seMCLwWUBU1zLrLyD2W+XzNPRWfwlDmr/p1URQB5EuQgg3UhW5RydZj1EQEPzwo1
	rjvaltmahE3dJhA8pLh0TGA7S8ZSTs56fbIj7SDHXFb6NfT9WLQWuHQFA5QCjL4P6FZTCmYfqnh
	DoZaUeHxnhS4A4s+jUkVnMvCZZRhw7XhJW5w=
X-Received: by 2002:a05:701a:cc93:10b0:1b5:330f:6232 with SMTP id a92af1059eb24-1b5330f69ebmr2596218c88.12.1794862445553;
        Mon, 16 Nov 2026 12:54:05 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:40c8:6e27:a2df:3321])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm67120390eec.21.2026.11.16.12.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:54:03 -0800 (PST)
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
Subject: [PATCH v4 10/14] fdtfactor: Add tool to split DTBs into a base DTB and overlays
Date: Mon, 16 Nov 2026 12:53:07 -0800
Message-ID: <20261116205320.1621386-11-dianders@chromium.org>
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

When shipping a single firmware or kernel image that supports many
closely related board variants or SKUs, bundling a full compiled .dtb
for every variant results in substantial duplication.

Add `fdtfactor`, a Python tool built on `pylibfdt` and `libpydt` that
takes a set of compiled device tree blobs (.dtb) compiled with `-@ -L`
(`/__symbols__` and `/__local_fixups__`) and splits them into a single
common `base.dtb` and per-board `.dtbo` overlays:

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

Add a `fdtfactor` test suite in `tests/run_tests.sh` verifying that
applying each generated `.dtbo` to `base.dtb` with `fdtoverlay`
reconstructs the original DTB (verified via `dtbs_equal_unordered`,
including across input DTBs with shifted phandle numbers).

Reviewed-by: Simon Glass <sjg@chromium.org>
Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4:
- Rename -o/--outdir to -o/--output so standalone DTB mode and FIT mode
  share the same output option, and use 4-space indentation in
  tests/run_tests.sh (David Gibson)
- Update for libpydt rename, use Property.as_*(), Property.from_*(), and
  DeviceTree.set_prop() instead of DeviceTree get_*/set_* wrapper
  methods, and drop redundant bytes() copies on Property instances
  (David Gibson, Simon Glass)
- Replace ParsedDtb.raw_bytes with uncompressed_size, use early continue
  to reduce loop nesting, drop redundant set() before sorted() on local
  fixup offsets, and clarify pre-order walk and phandle comments (David
  Gibson)
- Allow dtc -@ -L inputs with no phandles (where dtc omits /__symbols__
  and /__local_fixups__)
- Check _is_dtbo_overlay() on the unflattened DeviceTree, index
  ParsedDtb.nodes and base_nodes by path, and skip unchanged base nodes
  in _build_board_dtbo() to avoid repeated O(depth) traversals and
  per-property comparisons
- Handle OVERLAY_LOCAL_FIXUPS != 2 in fdtfactor_tests (Simon Glass)

Changes in v3:
- Update fdtfactor to use devicetree.DeviceTree and a FactoredTree
  subclass initializing self.phandle and self.fixups in __init__()
  (David Gibson, Simon Glass)
- Rename -b/--base-dtb to --output-base-dtb to avoid confusion with an
  input base DTB (David Gibson)
- Move the test rejecting input DTBs lacking /__local_fixups__ from the
  -S patch into this base patch (Simon Glass)

Changes in v2:
- Preserve /__local_fixups__ on base.dtb by default (David Gibson)
- Store parsed trees directly in NodeTree with node.phandle and
  node.fixups attributes instead of parallel dicts (David Gibson)
- Extract phandles in a separate pass after unflattening and reject
  legacy linux,phandle properties (David Gibson)
- Exclude non-root common phandle nodes lacking a common symbol from
  base.dtb instead of synthesizing __fdtfactor_ph_* symbols (David
  Gibson)
- Drop -q/--quiet, rename -v/--verbose to -s/--stats, and move tests to
  a dedicated fdtfactor test suite (David Gibson)

 Makefile                           |   2 +-
 README.md                          |  43 ++
 fdtfactor                          | 881 +++++++++++++++++++++++++++++
 meson.build                        |   1 +
 tests/Makefile.tests               |   4 +-
 tests/fdtfactor_board1.dts         |  72 +++
 tests/fdtfactor_board2.dts         |  70 +++
 tests/fdtfactor_board3.dts         |  68 +++
 tests/fdtfactor_board3_shifted.dts |  68 +++
 tests/meson.build                  |   2 +-
 tests/run_tests.sh                 | 110 +++-
 tests/testutils.sh                 |   1 +
 12 files changed, 1315 insertions(+), 7 deletions(-)
 create mode 100755 fdtfactor
 create mode 100644 tests/fdtfactor_board1.dts
 create mode 100644 tests/fdtfactor_board2.dts
 create mode 100644 tests/fdtfactor_board3.dts
 create mode 100644 tests/fdtfactor_board3_shifted.dts

diff --git a/Makefile b/Makefile
index 1560a5609fea..fc06b0ae16e2 100644
--- a/Makefile
+++ b/Makefile
@@ -169,7 +169,7 @@ BIN += fdtget
 BIN += fdtput
 BIN += fdtoverlay
 
-SCRIPTS = dtdiff
+SCRIPTS = dtdiff fdtfactor
 
 all: $(BIN) libfdt
 
diff --git a/README.md b/README.md
index 9d38c7e79fc6..9a8be74d47fe 100644
--- a/README.md
+++ b/README.md
@@ -201,6 +201,49 @@ merged blob to `-o`, `--output`:
 $ fdtoverlay -i base.dtb -o merged.dtb overlay1.dtbo overlay2.dtbo
 ```
 
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
+$ fdtfactor -o out_dir board1.dtb board2.dtb board3.dtb
+```
+
+Options:
+
+* `--output-base-dtb`: Output filename for the common base `.dtb`
+  (default: `base.dtb`; placed in `--output` if specified, or the current
+  directory otherwise).
+* `-o`, `--output`: Output directory for generated `.dtbo` files and
+  `--output-base-dtb` (default: alongside each input `.dtb` for `.dtbo` files,
+  current directory for `--output-base-dtb`).
+* `-s`, `--stats`: Print size savings summary.
+
+### TODO
+
+* **Targeted overlay fragments**: Add an option to emit fine-grained
+  `/fragment@N` nodes targeting individual parent subnodes rather than
+  placing all overlay changes under a single `/fragment@0` targeting `/`.
+* **Multi-level overlays**: Support hierarchical overlay layers (for
+  example, SoC base -> board family intermediate overlay -> SKU leaf
+  overlay) when multiple boards share large sub-trees not present across
+  all boards. As an interim step, `fdtfactor` could accept an
+  already-generated `base.dtb` plus a subset of `.dtbo` overlays emitted
+  by an initial pass, leaving `base.dtb` untouched while factoring out
+  an intermediate `.dtbo` for the commonalities shared within that
+  subset.
+
 ## Mailing lists
 
 * The [devicetree-compiler](mailto:devicetree-compiler@vger.kernel.org)
diff --git a/fdtfactor b/fdtfactor
new file mode 100755
index 000000000000..dfbee0aea2d6
--- /dev/null
+++ b/fdtfactor
@@ -0,0 +1,881 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0-or-later
+"""fdtfactor - Split multiple compiled .dtb files into a base .dtb and .dtbo overlays.
+
+Given two or more input .dtb files compiled with `dtc -@ -L` (so they include
+`/__symbols__` and `/__local_fixups__`), `fdtfactor` extracts all nodes and
+properties shared across the inputs into a single common `base.dtb` and emits a
+small per-board `.dtbo` overlay for each input. Applying a board's `.dtbo` to
+`base.dtb` (e.g., via `fdtoverlay` or `fdt_overlay_apply()`) reconstructs the
+original board DTB.
+"""
+
+import argparse
+from collections import Counter
+import os
+import struct
+import sys
+
+import libfdt
+import libpydt
+
+
+def _is_dtbo_overlay(root):
+    """Return True if `root` is a `.dtbo` overlay tree rather than a base DTB.
+
+    Args:
+        root: Root `libpydt.DeviceTree` instance to inspect.
+
+    Returns:
+        True if `root` contains `/__fixups__` or a top-level subnode with an
+        `__overlay__` child, False otherwise.
+    """
+    return (
+        '__fixups__' in root.children or
+        any('__overlay__' in child.children
+            for child in root.children.values())
+    )
+
+
+class FactoredTree(libpydt.DeviceTree):
+    """DeviceTree subclass with normalized phandle and fixup attributes.
+
+    Attributes:
+        phandle: Optional integer phandle popped from `props['phandle']`.
+        fixups: Dict mapping property name (str) to a tuple of
+            `(byte_offset, target_node_path)` phandle fixup pairs.
+    """
+
+    def __init__(self):
+        self.props = {}
+        self.children = {}
+        self.phandle = None
+        self.fixups = {}
+
+
+class ParsedDtb:
+    """Complete input .dtb blob with phandle-normalized tree and FDT metadata.
+
+    While `libpydt.DeviceTree` is a generic live-tree representation of a
+    node hierarchy (with `libfdt.Property` instances and unprocessed
+    `/__symbols__`, `/__local_fixups__`, and `phandle` properties), `ParsedDtb`
+    wraps an entire input `.dtb` in a `FactoredTree` (`self.root`) and
+    normalizes it for cross-board comparison:
+
+    - Stores FDT header, memory reservation, and file-level metadata that live
+      outside the root node tree (`boot_cpuid_phys`, `mem_rsv`, `filename`,
+      `uncompressed_size`).
+    - Pops `/__symbols__` (parsed into `self.symbols`) and `/__local_fixups__`
+      out of `self.root`, and indexes the remaining tree in pre-order in
+      `self.nodes` (`path -> FactoredTree`).
+    - Moves each node's `phandle` property out of `node.props` into
+      `node.phandle`, and uses `/__local_fixups__` to zero out numeric phandle
+      cells in `node.props` while recording canonical `(offset, target_path)`
+      tuples in `node.fixups` so properties can be compared across DTBs
+      independent of numeric phandle numbering.
+    """
+
+    def __init__(self, filename):
+        """Parse an input FDT file into a normalized FactoredTree.
+
+        Args:
+            filename: File path of the `.dtb` file to read.
+        """
+        self.filename = filename
+        with open(filename, 'rb') as f:
+            raw_bytes = f.read()
+        self.uncompressed_size = len(raw_bytes)
+
+        try:
+            fdt = libfdt.FdtRo(raw_bytes)
+            libfdt.check_err(libfdt.fdt_check_full(fdt._fdt, len(raw_bytes)))
+        except libfdt.FdtException as exc:
+            raise ValueError(f'{filename}: Invalid FDT blob ({exc})') from exc
+
+        self.boot_cpuid_phys = fdt.boot_cpuid_phys()
+        self.mem_rsv = tuple(fdt.get_mem_rsv_list())
+        self.root = FactoredTree.unflatten(fdt)
+
+        if _is_dtbo_overlay(self.root):
+            raise ValueError(
+                f'{filename}: Input is already a DTB overlay (.dtbo)'
+            )
+
+        sym_node = self.root.children.pop('__symbols__', None)
+        lf_root = self.root.children.pop('__local_fixups__', None)
+        self.has_local_fixups = lf_root is not None
+
+        self.nodes = dict(self.root.walk())
+        phandle_to_path = self._extract_phandles()
+        if phandle_to_path and (sym_node is None or lf_root is None):
+            raise ValueError(
+                f'input DTB(s) lack /__symbols__ or /__local_fixups__: '
+                f'{filename} (compile input DTBs with dtc -@ -L)'
+            )
+        self.symbols = (
+            self._parse_symbols(sym_node) if sym_node is not None else {}
+        )
+        if lf_root is not None:
+            self._apply_local_fixups(lf_root, phandle_to_path)
+
+    def _extract_phandles(self):
+        """Move `phandle` properties out of `node.props`.
+
+        Iterates `self.nodes` in pre-order and, for each node:
+        - Pops `phandle` from `node.props` (so phandle properties are not
+          compared as ordinary byte properties across DTBs, since `dtc` may
+          assign different integer phandles to the same node in different
+          boards) and stores the decoded integer in `node.phandle`.
+        - Validates that `node.phandle` is not `0` or `0xffffffff`, and that no
+          two nodes in the DTB share the same phandle.
+
+        Returns:
+            Dict mapping each integer phandle in this DTB to its node path
+            string (`""` for root, `"/soc/..."` for subnodes), used by
+            `_apply_local_fixups()` to resolve numeric phandle cells to
+            canonical target node paths.
+        """
+        phandle_to_path = {}
+        for path, node in self.nodes.items():
+            if 'linux,phandle' in node.props:
+                raise ValueError(
+                    f'{self.filename}: {path or "/"}: legacy linux,phandle '
+                    f'property is not supported (compile with dtc -H epapr)'
+                )
+            ph_prop = node.props.pop('phandle', None)
+            if ph_prop is not None:
+                node.phandle = ph_prop.as_uint32()
+
+            if node.phandle is None:
+                continue
+            if node.phandle in (0, 0xffffffff):
+                raise ValueError(
+                    f'{self.filename}: invalid phandle {node.phandle:#x} '
+                    f'on {path or "/"}'
+                )
+            if node.phandle in phandle_to_path:
+                raise ValueError(
+                    f'{self.filename}: duplicate phandle {node.phandle:#x} '
+                    f'on {phandle_to_path[node.phandle] or "/"} and '
+                    f'{path or "/"}'
+                )
+            phandle_to_path[node.phandle] = path
+        return phandle_to_path
+
+    def _parse_symbols(self, sym_node):
+        """Parse the popped `/__symbols__` node into a `label -> path` dict.
+
+        Each property on `/__symbols__` (ignoring any `phandle` property on the
+        `/__symbols__` node itself) maps a Devicetree label name to the full
+        path of the target node in the DTB. Root paths (`"/"`) are normalized to
+        `""` to match `DeviceTree` path conventions, and each target path is
+        verified to exist in `self.nodes`.
+
+        Args:
+            sym_node: The `FactoredTree` for `/__symbols__` popped from
+                `self.root`.
+
+        Returns:
+            Dict mapping symbol label name (str) to normalized target node path
+            (str, `""` for root or `"/..."` for subnodes).
+        """
+        symbols = {}
+        for label, prop in sym_node.props.items():
+            if label == 'phandle':
+                continue
+            raw_path = prop.as_str()
+            if not raw_path.startswith('/') or '//' in raw_path:
+                raise ValueError(
+                    f'{self.filename}: symbol {label!r} has malformed '
+                    f'path {raw_path!r}'
+                )
+            target_path = raw_path.rstrip('/')
+            if target_path not in self.nodes:
+                raise ValueError(
+                    f'{self.filename}: symbol {label!r} references '
+                    f'missing node {target_path or "/"!r}'
+                )
+            symbols[label] = target_path
+        return symbols
+
+    def _apply_local_fixups(self, lf_root, phandle_to_path):
+        """Normalize phandle references in `self.root` using `/__local_fixups__`.
+
+        The `/__local_fixups__` tree mirrors the structure of `self.root`: each
+        property in `/__local_fixups__` contains a list of 32-bit byte offsets
+        where the corresponding property in `self.root` holds a phandle cell.
+        For every such offset, this method:
+        - Reads the 32-bit integer phandle from `target_node.props[prop_name]`
+          and resolves it to a canonical target node path via `phandle_to_path`.
+        - Zeros out the 4-byte phandle cell in `target_node.props[prop_name]` so
+          property values can be compared across DTBs independent of numeric
+          phandle numbering.
+        - Records `((offset, target_path), ...)` in
+          `target_node.fixups[prop_name]`.
+
+        Args:
+            lf_root: The `FactoredTree` for `/__local_fixups__` popped from
+                `self.root`.
+            phandle_to_path: Dict mapping integer phandle values to normalized
+                node paths in `self.root`, as returned by `_extract_phandles()`.
+        """
+        for path, lf_node in lf_root.walk():
+            if not lf_node.props:
+                continue
+            target_node = self.nodes.get(path)
+            if target_node is None:
+                raise ValueError(
+                    f'{self.filename}: local fixup references missing node '
+                    f'{path or "/"}'
+                )
+            for prop_name, lf_prop in lf_node.props.items():
+                raw_prop = target_node.props.get(prop_name)
+                if raw_prop is None:
+                    raise ValueError(
+                        f'{self.filename}: local fixup references missing '
+                        f'property {path or "/"}:{prop_name}'
+                    )
+                offsets = sorted(lf_prop.as_uint32_list())
+                masked = bytearray(raw_prop)
+                targets = []
+                for off in offsets:
+                    if off + 4 > len(raw_prop):
+                        raise ValueError(
+                            f'{self.filename}: fixup offset {off} out of range '
+                            f'on {path or "/"}:{prop_name} (len {len(raw_prop)})'
+                        )
+                    if targets and off < targets[-1][0] + 4:
+                        raise ValueError(
+                            f'{self.filename}: overlapping fixup offset {off} '
+                            f'on {path or "/"}:{prop_name}'
+                        )
+                    ph = struct.unpack_from('>I', raw_prop, off)[0]
+                    target_path = phandle_to_path.get(ph)
+                    if target_path is None:
+                        raise ValueError(
+                            f'{self.filename}: unknown phandle {ph:#x} at '
+                            f'{path or "/"}:{prop_name}+{off}'
+                        )
+                    masked[off:off + 4] = b'\x00\x00\x00\x00'
+                    targets.append((off, target_path))
+                target_node.set_prop(
+                    libfdt.Property(prop_name, bytes(masked))
+                )
+                target_node.fixups[prop_name] = tuple(targets)
+
+
+def select_best_candidate(candidates, path, prop_name):
+    """Choose the `(masked_bytes, fixups)` value that maximizes overlay savings.
+
+    Only candidates shared by at least two input DTBs (`count > 1`) are
+    eligible for the base DTB; a value that appears in only one DTB would add
+    one copy to `base.dtb` to save one overlay copy (zero net savings).
+
+    Byte cost model per overlay occurrence:
+    - Each FDT property carries a 12-byte structure header (`FDT_PROP` 4-byte
+      tag + 4-byte length + 4-byte `nameoff`) plus `len(masked_bytes)` value
+      bytes.
+    - Each phandle fixup in an overlay adds a string entry of the form
+      `"/fragment@0/__overlay__<path>:<prop_name>:<off>\\0"` to `/__fixups__`:
+      22 bytes (`"/fragment@0/__overlay__"`) + `len(path)` + 1 (`":"`) +
+      `len(prop_name)` + 1 (`":"`) + ~1-2 digits for `<off>` + 1 (`"\\0"`) +
+      ~3 bytes amortized `/__fixups__` property overhead =
+      `len(path) + len(prop_name) + 28` bytes.
+
+    Args:
+        candidates: Sequence of `(masked_bytes, fixups)` tuples observed across
+            input DTBs for `prop_name` on `path`.
+        path: Normalized node path (`""` for root or `"/..."` for subnodes).
+        prop_name: Property name string.
+
+    Returns:
+        The `(masked_bytes, fixups)` tuple that yields the largest estimated
+        byte savings when placed in `base.dtb`, or `None` if no candidate
+        appears in at least two input DTBs.
+    """
+    fixup_entry_cost = len(path) + len(prop_name) + 28
+    counts = Counter(candidates)
+    best_val = None
+    best_key = None
+    for val, count in counts.items():
+        if count <= 1:
+            continue
+        masked_bytes, fixups = val
+        length = len(masked_bytes) + len(fixups) * fixup_entry_cost
+        # Placing `val` in base.dtb adds 1 copy and removes `count` overlay
+        # copies, saving `(count - 1) * (length + 12)` bytes across the set.
+        key = ((count - 1) * (length + 12), count, length)
+        if best_key is None or key > best_key:
+            best_key = key
+            best_val = val
+    return best_val
+
+
+def _validate_dtb_headers(dtbs):
+    """Verify that FDT header fields and `/memreserve/` entries match across DTBs.
+
+    `fdt_overlay_apply()` only merges the `.dtbo` structure block into the base
+    DTB and ignores the `.dtbo` header and `/memreserve/` block, so all DTBs
+    sharing a base DTB must have identical `boot_cpuid_phys` and `mem_rsv`.
+
+    Args:
+        dtbs: Sequence of `ParsedDtb` instances to validate.
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
+    """Build the common `FactoredTree` skeleton and assign base DTB phandles.
+
+    Includes nodes whose path is present in every input DTB. If a node has a
+    `phandle` in at least one input DTB:
+    - When it has a shared label in `/__symbols__` across all input DTBs (or is
+      the root node), it is kept in `base.dtb` and assigned a sequential
+      phandle. That satisfies references from common properties, `/__symbols__`,
+      and overlay `/__fixups__`.
+    - Otherwise (e.g. only some boards label the node, or boards use different
+      labels), the node and its subtree are excluded from `base.dtb` and emitted
+      per board in `.dtbo` overlays. That avoids adding a spurious `phandle` to
+      boards that lacked one and avoids overlays needing a `/__fixups__` target
+      missing from `base.dtb`'s `/__symbols__`.
+
+    Args:
+        dtbs: Sequence of `ParsedDtb` instances.
+
+    Returns:
+        Dict mapping each common node path in pre-order (`""` for root,
+        `"/..."` for subnodes) to its `FactoredTree` node, with `node.phandle`
+        set to its assigned sequential integer phandle (or `None` if the node
+        has no phandle in any input DTB) and `node.fixups` initialized to `{}`.
+    """
+    common_paths = set(dtbs[0].nodes).intersection(
+        *(d.nodes for d in dtbs[1:])
+    )
+
+    common_sym_targets = {
+        path for label, path in dtbs[0].symbols.items()
+        if all(d.symbols.get(label) == path for d in dtbs[1:])
+    }
+
+    base_root = FactoredTree()
+    base_nodes = {}
+    next_ph = 1
+    # Iterate dtbs[0].nodes in pre-order (rather than iterating the unordered
+    # `common_paths` set) so parents are always visited before their children,
+    # subnode order is preserved, and `next_ph` assignment is deterministic.
+    for path in dtbs[0].nodes:
+        if path not in common_paths:
+            continue
+        if path and path.rpartition('/')[0] not in base_nodes:
+            continue
+        has_phandle = any(d.nodes[path].phandle is not None for d in dtbs)
+        if has_phandle and path and path not in common_sym_targets:
+            continue
+        base_node = base_root.create_path(path)
+        base_nodes[path] = base_node
+        if has_phandle:
+            base_node.phandle = next_ph
+            next_ph += 1
+    return base_nodes
+
+
+def _find_common_symbols(dtbs, base_nodes):
+    """Find symbols common to all input DTBs that point to the same base node.
+
+    Args:
+        dtbs: Sequence of `ParsedDtb` instances.
+        base_nodes: Pre-order `path -> FactoredTree` dict for `base.dtb`.
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
+    for label, chosen_path in dtbs[0].symbols.items():
+        if not all(d.symbols.get(label) == chosen_path for d in dtbs[1:]):
+            continue
+        base_node = base_nodes.get(chosen_path)
+        if base_node is None:
+            continue
+        base_dtb_symbols[label] = chosen_path
+        if (base_node.phandle is not None and
+                chosen_path not in path_to_base_dtb_symbol):
+            path_to_base_dtb_symbol[chosen_path] = label
+
+    return base_dtb_symbols, path_to_base_dtb_symbol
+
+
+def _build_base_tree(dtbs):
+    """Construct the normalized `FactoredTree` nodes for the common base DTB.
+
+    Args:
+        dtbs: Sequence of `ParsedDtb` instances.
+
+    Returns:
+        Pre-order `path -> FactoredTree` dict containing all common nodes,
+        their assigned `phandle` attributes, and their best shared
+        `(masked_bytes, fixups)` properties.
+    """
+    base_nodes = _find_common_nodes_and_phandles(dtbs)
+    for path, base_node in base_nodes.items():
+        dtb_nodes = [d.nodes[path] for d in dtbs]
+        common_prop_names = [
+            k for k in dtb_nodes[0].props
+            if all(k in n.props for n in dtb_nodes[1:])
+        ]
+        for prop_name in common_prop_names:
+            eligible = []
+            for n in dtb_nodes:
+                fixups = n.fixups.get(prop_name, ())
+                if not all(t_path in base_nodes for _, t_path in fixups):
+                    continue
+                eligible.append((n.props[prop_name], fixups))
+
+            chosen = select_best_candidate(eligible, path, prop_name)
+            if chosen is None:
+                continue
+            prop, fixups = chosen
+            base_node.set_prop(prop)
+            base_node.fixups[prop_name] = fixups
+
+    return base_nodes
+
+
+def _serialize_base_dtb(base_nodes, base_dtb_symbols, rsvmap, boot_cpuid_phys,
+                        emit_local_fixups=True):
+    """Materialize phandles, `/__symbols__`, and `/__local_fixups__` and flatten.
+
+    Args:
+        base_nodes: Pre-order `path -> FactoredTree` dict for the base DTB from
+            `_build_base_tree()`.
+        base_dtb_symbols: Dict mapping common symbol labels to target paths.
+        rsvmap: Sequence of `(address, size)` memory reservation tuples.
+        boot_cpuid_phys: Physical boot CPU ID for the FDT header.
+        emit_local_fixups: If True, include `/__local_fixups__` on the
+            generated `base.dtb`.
+
+    Returns:
+        Serialized `.dtb` `bytes` for the common base DTB.
+    """
+    out_root = libpydt.DeviceTree()
+    lf_entries = []
+
+    for path, base_node in base_nodes.items():
+        out_node = out_root.create_path(path)
+        for prop_name, prop in base_node.props.items():
+            fixups = base_node.fixups.get(prop_name, ())
+            if not fixups:
+                out_node.set_prop(prop)
+            else:
+                val = bytearray(prop)
+                for off, t_path in fixups:
+                    target_ph = base_nodes[t_path].phandle
+                    struct.pack_into('>I', val, off, target_ph)
+                out_node.set_prop(libfdt.Property(prop_name, bytes(val)))
+                lf_entries.append((path, prop_name, [off for off, _ in fixups]))
+
+        if base_node.phandle is not None:
+            out_node.set_prop(
+                libfdt.Property.from_uint32('phandle', base_node.phandle)
+            )
+
+    any_phandle = any(n.phandle is not None for n in base_nodes.values())
+    if base_dtb_symbols or (emit_local_fixups and any_phandle):
+        sym_node = out_root.create_path('/__symbols__')
+        for label, target_path in base_dtb_symbols.items():
+            sym_node.set_prop(
+                libfdt.Property.from_str(label, target_path or '/')
+            )
+
+    if emit_local_fixups:
+        # Create `/__local_fixups__` on the base DTB so `fdt_overlay_apply()`
+        # updates it with the overlay's phandle fixups when merging.
+        lf_root = out_root.create_path('/__local_fixups__')
+        for path, prop_name, offs in lf_entries:
+            lf_root.create_path(path).set_prop(
+                libfdt.Property.from_uint32_list(prop_name, offs)
+            )
+
+    fdt = out_root.flatten(mem_rsv=rsvmap, boot_cpuid_phys=boot_cpuid_phys)
+    return bytes(fdt.as_bytearray())
+
+
+def _assign_local_phandles(dtb, base_nodes):
+    """Assign sequential overlay-local phandles (`1, 2, ...`) to board-only nodes.
+
+    Args:
+        dtb: `ParsedDtb` instance for the board.
+        base_nodes: Pre-order `path -> FactoredTree` dict for `base.dtb`.
+
+    Returns:
+        Dict mapping each board-only node path that has a phandle in `dtb` to
+        its sequential overlay-local integer phandle (`1, 2, ...`).
+    """
+    local_phandles = {}
+    next_local_ph = 1
+    for path, node in dtb.nodes.items():
+        if node.phandle is not None and path not in base_nodes:
+            local_phandles[path] = next_local_ph
+            next_local_ph += 1
+    return local_phandles
+
+
+def _encode_dtbo_property(dtb_filename, path, prop_name, masked_bytes, fixups,
+                          base_nodes, path_to_base_dtb_symbol, local_phandles,
+                          ext_fixups, ov_local_fixups):
+    """Encode a property value for `/fragment@0/__overlay__` and record fixups.
+
+    Args:
+        dtb_filename: Input DTB filename (for error reporting).
+        path: Normalized node path (`""` for root or `"/..."` for subnodes).
+        prop_name: Property name string.
+        masked_bytes: Normalized property bytes (with zeroed phandle cells).
+        fixups: Tuple of `(offset, target_path)` phandle fixups for this
+            property.
+        base_nodes: Pre-order `path -> FactoredTree` dict for `base.dtb`.
+        path_to_base_dtb_symbol: Dict mapping common node paths to their symbol
+            labels in `base.dtb`.
+        local_phandles: Dict mapping board-only node paths to overlay-local
+            phandles.
+        ext_fixups: Dict mapping target base symbol labels to lists of
+            `/__fixups__` entry strings (mutated in place).
+        ov_local_fixups: Dict mapping `(path, prop_name)` to lists of byte
+            offsets for `/__local_fixups__` (mutated in place).
+
+    Returns:
+        Encoded property value `bytes` with `0xffffffff` placeholders for
+        external base references and local phandle integers for overlay-local
+        references.
+    """
+    if not fixups:
+        return masked_bytes
+
+    val = bytearray(masked_bytes)
+    for off, t_path in fixups:
+        if t_path in base_nodes:
+            sym_label = path_to_base_dtb_symbol.get(t_path)
+            if sym_label is None:
+                raise ValueError(
+                    f'{dtb_filename}: property {path or "/"}:{prop_name} '
+                    f'references common base node {t_path or "/"} which lacks '
+                    f'a common symbol in /__symbols__'
+                )
+            struct.pack_into('>I', val, off, 0xffffffff)
+            entry = f'/fragment@0/__overlay__{path}:{prop_name}:{off}'
+            ext_fixups.setdefault(sym_label, []).append(entry)
+        else:
+            struct.pack_into('>I', val, off, local_phandles[t_path])
+            ov_local_fixups.setdefault((path, prop_name), []).append(off)
+    return bytes(val)
+
+
+def _build_board_dtbo(dtb, base_nodes, base_dtb_symbols,
+                      path_to_base_dtb_symbol):
+    """Construct and flatten the `.dtbo` overlay blob for a single board.
+
+    Args:
+        dtb: `ParsedDtb` instance for the board.
+        base_nodes: Pre-order `path -> FactoredTree` dict for `base.dtb`.
+        base_dtb_symbols: Dict mapping common symbol labels to target paths.
+        path_to_base_dtb_symbol: Dict mapping common node paths to their symbol
+            labels in `base.dtb`.
+
+    Returns:
+        Serialized `.dtbo` overlay `bytes` for `dtb`.
+    """
+    dtbo_root = libpydt.DeviceTree()
+    frag_node = dtbo_root.create_path('/fragment@0')
+    frag_node.set_prop(libfdt.Property.from_str('target-path', '/'))
+    ov_root = frag_node.create_path('__overlay__')
+
+    local_phandles = _assign_local_phandles(dtb, base_nodes)
+    ext_fixups = {}
+    ov_local_fixups = {}
+
+    for path, node in dtb.nodes.items():
+        base_node = base_nodes.get(path)
+        if (base_node is not None and
+                base_node.props == node.props and
+                base_node.fixups == node.fixups):
+            continue
+        diff_props = [
+            prop_name for prop_name, raw_val in node.props.items()
+            if (base_node is None or
+                base_node.props.get(prop_name) != raw_val or
+                base_node.fixups.get(prop_name, ()) !=
+                node.fixups.get(prop_name, ()))
+        ]
+        if base_node is not None and not diff_props:
+            continue
+        ov_node = ov_root.create_path(path)
+        for prop_name in diff_props:
+            ov_node.set_prop(
+                libfdt.Property(
+                    prop_name,
+                    _encode_dtbo_property(
+                        dtb.filename, path, prop_name,
+                        node.props[prop_name],
+                        node.fixups.get(prop_name, ()), base_nodes,
+                        path_to_base_dtb_symbol, local_phandles, ext_fixups,
+                        ov_local_fixups,
+                    ),
+                )
+            )
+        if path in local_phandles:
+            ov_node.set_prop(
+                libfdt.Property.from_uint32('phandle', local_phandles[path])
+            )
+
+    diff_syms = [
+        (label, t_path)
+        for label, t_path in dtb.symbols.items()
+        if base_dtb_symbols.get(label) != t_path
+    ]
+    if diff_syms:
+        sym_node = dtbo_root.create_path('/__symbols__')
+        for label, t_path in diff_syms:
+            ov_root.create_path(t_path)
+            sym_node.set_prop(
+                libfdt.Property.from_str(
+                    label, f'/fragment@0/__overlay__{t_path}'
+                )
+            )
+
+    if ext_fixups:
+        fixups_node = dtbo_root.create_path('/__fixups__')
+        for label, entries in ext_fixups.items():
+            fixups_node.set_prop(
+                libfdt.Property.from_stringlist(label, entries)
+            )
+
+    if ov_local_fixups:
+        ov_lf_root = dtbo_root.create_path(
+            '/__local_fixups__/fragment@0/__overlay__'
+        )
+        for (path, prop_name), offs in ov_local_fixups.items():
+            ov_lf_root.create_path(path).set_prop(
+                libfdt.Property.from_uint32_list(prop_name, offs)
+            )
+
+    return bytes(dtbo_root.flatten().as_bytearray())
+
+
+def create_base_dtb_and_overlays(dtbs):
+    """Compute the base DTB and per-board DTBO blobs from parsed DTBs.
+
+    Args:
+        dtbs: Sequence of `ParsedDtb` instances (at least two).
+
+    Returns:
+        Tuple of `(base_dtb_blob, dtbo_blobs)` where `base_dtb_blob` is the
+        serialized `base.dtb` `bytes` and `dtbo_blobs` is a list of serialized
+        `.dtbo` `bytes` corresponding 1:1 with `dtbs`.
+    """
+    _validate_dtb_headers(dtbs)
+    base_nodes = _build_base_tree(dtbs)
+    base_dtb_symbols, path_to_base_dtb_symbol = _find_common_symbols(
+        dtbs, base_nodes
+    )
+    base_dtb_blob = _serialize_base_dtb(
+        base_nodes, base_dtb_symbols,
+        dtbs[0].mem_rsv, dtbs[0].boot_cpuid_phys,
+        emit_local_fixups=any(d.has_local_fixups for d in dtbs),
+    )
+    dtbo_blobs = [
+        _build_board_dtbo(
+            d, base_nodes, base_dtb_symbols, path_to_base_dtb_symbol,
+        )
+        for d in dtbs
+    ]
+    return base_dtb_blob, dtbo_blobs
+
+
+def get_dtbo_output_path(dtb_path, outdir):
+    """Determine the output `.dtbo` file path for an input `.dtb` path.
+
+    Args:
+        dtb_path: Path to the input `.dtb` file.
+        outdir: Output directory path, or `None` to place the `.dtbo` alongside
+            `dtb_path`.
+
+    Returns:
+        Output `.dtbo` file path string.
+    """
+    dtb_dir, filename = os.path.split(dtb_path)
+    stem = filename[:-4] if filename.endswith('.dtb') else filename
+    target_dir = outdir if outdir is not None else dtb_dir
+    return os.path.join(target_dir, f'{stem}.dtbo')
+
+
+def parse_args(argv=None):
+    """Parse command-line arguments.
+
+    Args:
+        argv: Optional list of command-line argument strings (defaults to
+            `sys.argv[1:]`).
+
+    Returns:
+        Parsed `argparse.Namespace` instance.
+    """
+    parser = argparse.ArgumentParser(
+        description=(
+            'Split a set of compiled device tree blobs (.dtb) into a single '
+            'common base .dtb and per-board overlay blobs (.dtbo).'
+        )
+    )
+    parser.add_argument(
+        '--output-base-dtb',
+        default='base.dtb',
+        metavar='FILENAME',
+        help=(
+            'Output common base .dtb filename (default: base.dtb; placed in '
+            '--output if specified, or current directory otherwise)'
+        ),
+    )
+    parser.add_argument(
+        '-o', '--output',
+        default=None,
+        metavar='DIR',
+        help=(
+            'Output directory for generated .dtbo files and '
+            '--output-base-dtb (default: alongside each input .dtb for .dtbo, '
+            'current directory for --output-base-dtb)'
+        ),
+    )
+    parser.add_argument(
+        '-s', '--stats',
+        action='store_true',
+        help='Print size statistics summary',
+    )
+    parser.add_argument(
+        'dtbs',
+        nargs='+',
+        metavar='DTB',
+        help='Input .dtb files (at least two required)',
+    )
+    args = parser.parse_args(argv)
+    if not args.output_base_dtb or os.path.dirname(args.output_base_dtb):
+        parser.error(
+            '--output-base-dtb must be a non-empty filename without directory '
+            'components; use -o/--output to specify the output directory'
+        )
+    if len(args.dtbs) < 2:
+        parser.error('at least two input .dtb files are required')
+    return args
+
+
+def _print_dtb_stats(dtbs, base_dtb_blob, dtbo_blobs):
+    """Print uncompressed size savings summary.
+
+    Args:
+        dtbs: Sequence of input `ParsedDtb` instances.
+        base_dtb_blob: Uncompressed base DTB `bytes`.
+        dtbo_blobs: Sequence of uncompressed `.dtbo` overlay `bytes`.
+    """
+    orig_uncomp = sum(d.uncompressed_size for d in dtbs)
+    base_dtb_uncomp = len(base_dtb_blob)
+    dtbo_uncomp = sum(len(b) for b in dtbo_blobs)
+    new_uncomp = base_dtb_uncomp + dtbo_uncomp
+    saved_uncomp = orig_uncomp - new_uncomp
+    pct_uncomp = (saved_uncomp / orig_uncomp * 100.0) if orig_uncomp else 0.0
+    print(
+        f'Uncompressed DTBs: {len(dtbs)} files ({orig_uncomp:,} B) -> '
+        f'base {base_dtb_uncomp:,} B + {len(dtbo_blobs)} overlays '
+        f'{dtbo_uncomp:,} B = {new_uncomp:,} B '
+        f'(saved {saved_uncomp:,} B / {pct_uncomp:.1f}%)'
+    )
+
+
+def factor_dtb_files(args):
+    """Factor a list of standalone .dtb files into a base .dtb and .dtbo files.
+
+    Args:
+        args: Parsed `argparse.Namespace` from `parse_args()`.
+    """
+    input_dtb_paths = args.dtbs
+    dtbs = [ParsedDtb(p) for p in input_dtb_paths]
+
+    base_dtb_path = (
+        os.path.join(args.output, args.output_base_dtb)
+        if args.output is not None
+        else args.output_base_dtb
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
+        out_path = get_dtbo_output_path(dtb_path, args.output)
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
+    base_dtb_blob, dtbo_blobs = create_base_dtb_and_overlays(dtbs)
+
+    if args.output:
+        os.makedirs(args.output, exist_ok=True)
+    with open(base_dtb_path, 'wb') as f:
+        f.write(base_dtb_blob)
+
+    for out_path, dtbo_blob in zip(dtbo_paths, dtbo_blobs):
+        out_dir = os.path.dirname(out_path)
+        if out_dir:
+            os.makedirs(out_dir, exist_ok=True)
+        with open(out_path, 'wb') as f:
+            f.write(dtbo_blob)
+
+    if args.stats:
+        _print_dtb_stats(dtbs, base_dtb_blob, dtbo_blobs)
+
+
+def main(argv=None):
+    """Run the fdtfactor command-line tool.
+
+    Args:
+        argv: Optional list of command-line argument strings.
+
+    Returns:
+        Integer exit status (`0` on success).
+    """
+    args = parse_args(argv)
+    try:
+        factor_dtb_files(args)
+    except (OSError, ValueError, RuntimeError, struct.error,
+            libfdt.FdtException) as exc:
+        sys.exit(f'Error: {exc}')
+    return 0
+
+
+if __name__ == '__main__':
+    sys.exit(main())
diff --git a/meson.build b/meson.build
index 348d9b555e34..97dc66c24ab4 100644
--- a/meson.build
+++ b/meson.build
@@ -119,6 +119,7 @@ if get_option('tools') and not wheel_only
 
   install_data(
     'dtdiff',
+    'fdtfactor',
     install_dir: get_option('bindir'),
     install_mode: 'rwxr-xr-x',
   )
diff --git a/tests/Makefile.tests b/tests/Makefile.tests
index 623d71786701..9e8d09d37d8b 100644
--- a/tests/Makefile.tests
+++ b/tests/Makefile.tests
@@ -53,10 +53,10 @@ TESTS_DEPFILES = $(TESTS:%=%.d) \
 	$(addprefix $(TESTS_PREFIX),testutils.d)
 
 TESTS_CLEANFILES_L = $(STD_CLEANFILES) \
-	*.dtb *.test.dts *.test.dt.yaml *.dtsv1 tmp.* *.bak \
+	*.dtb *.test.dtbo *.test.dts *.test.dt.yaml *.dtsv1 tmp.* *.bak \
 	treegen
 TESTS_CLEANFILES = $(TESTS) $(TESTS_CLEANFILES_L:%=$(TESTS_PREFIX)%)
-TESTS_CLEANDIRS_L = fs
+TESTS_CLEANDIRS_L = fs *.test.dir
 TESTS_CLEANDIRS = $(TESTS_CLEANDIRS_L:%=$(TESTS_PREFIX)%)
 
 .PHONY: tests
diff --git a/tests/fdtfactor_board1.dts b/tests/fdtfactor_board1.dts
new file mode 100644
index 000000000000..324a3f23a488
--- /dev/null
+++ b/tests/fdtfactor_board1.dts
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/dts-v1/;
+
+/memreserve/ 0xdeadbeef00000000 0x100000;
+
+/ {
+	compatible = "test_fdtfactor";
+	model = "board1";
+	prop-int = <0xdeadbeef>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	sn1: subnode@1 {
+		compatible = "subnode1";
+		reg = <1>;
+		prop-ref = <&sn1 0x10 &ssn1 0x20>;
+		shared-data = <
+			0x00010203 0x04050607 0x08090a0b 0x0c0d0e0f
+			0x10111213 0x14151617 0x18191a1b 0x1c1d1e1f
+			0x20212223 0x24252627 0x28292a2b 0x2c2d2e2f
+			0x30313233 0x34353637 0x38393a3b 0x3c3d3e3f
+			0x40414243 0x44454647 0x48494a4b 0x4c4d4e4f
+			0x50515253 0x54555657 0x58595a5b 0x5c5d5e5f
+			0x60616263 0x64656667 0x68696a6b 0x6c6d6e6f
+			0x70717273 0x74757677 0x78797a7b 0x7c7d7e7f
+			0x80818283 0x84858687 0x88898a8b 0x8c8d8e8f
+			0x90919293 0x94959697 0x98999a9b 0x9c9d9e9f
+			0xa0a1a2a3 0xa4a5a6a7 0xa8a9aaab 0xacadaeaf
+			0xb0b1b2b3 0xb4b5b6b7 0xb8b9babb 0xbcbdbebf
+			0xc0c1c2c3 0xc4c5c6c7 0xc8c9cacb 0xcccdcecf
+			0xd0d1d2d3 0xd4d5d6d7 0xd8d9dadb 0xdcdddedf
+			0xe0e1e2e3 0xe4e5e6e7 0xe8e9eaeb 0xecedeeef
+			0xf0f1f2f3 0xf4f5f6f7 0xf8f9fafb 0xfcfdfeff
+			0x01030507 0x090b0d0f 0x11131517 0x191b1d1f
+			0x21232527 0x292b2d2f 0x31333537 0x393b3d3f
+			0x41434547 0x494b4d4f 0x51535557 0x595b5d5f
+			0x61636567 0x696b6d6f 0x71737577 0x797b7d7f
+			0x81838587 0x898b8d8f 0x91939597 0x999b9d9f
+			0xa1a3a5a7 0xa9abadaf 0xb1b3b5b7 0xb9bbbdbf
+			0xc1c3c5c7 0xc9cbcdcf 0xd1d3d5d7 0xd9dbdddf
+			0xe1e3e5e7 0xe9ebedef 0xf1f3f5f7 0xf9fbfdff
+			0x02060a0e 0x12161a1e 0x22262a2e 0x32363a3e
+			0x42464a4e 0x52565a5e 0x62666a6e 0x72767a7e
+			0x82868a8e 0x92969a9e 0xa2a6aaae 0xb2b6babe
+			0xc2c6cace 0xd2d6dade 0xe2e6eaee 0xf2f6fafe
+			0x03070b0f 0x13171b1f 0x23272b2f 0x33373b3f
+			0x43474b4f 0x53575b5f 0x63676b6f 0x73777b7f
+			0x83878b8f 0x93979b9f 0xa3a7abaf 0xb3b7bbbf
+			0xc3c7cbcf 0xd3d7dbdf 0xe3e7ebef 0xf3f7fbff
+		>;
+
+		ssn1: subsubnode {
+			compatible = "subsubnode1", "subsubnode";
+			prop-phandle = <&sn1>;
+		};
+	};
+
+	sn2: subnode@2 {
+		reg = <2>;
+		prop-maybe-phandle = <&sn2>;
+	};
+
+	b1_node: board1-node {
+		prop-str = "board1";
+		ref-base = <&sn1>;
+		ref-local = <&b1_node &b1_child>;
+
+		b1_child: child {
+			prop-int = <1>;
+		};
+	};
+};
diff --git a/tests/fdtfactor_board2.dts b/tests/fdtfactor_board2.dts
new file mode 100644
index 000000000000..7e4a71299cd1
--- /dev/null
+++ b/tests/fdtfactor_board2.dts
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/dts-v1/;
+
+/memreserve/ 0xdeadbeef00000000 0x100000;
+
+/ {
+	compatible = "test_fdtfactor";
+	model = "board2";
+	prop-int = <0xdeadbeef>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	sn1: subnode@1 {
+		compatible = "subnode1";
+		reg = <1>;
+		prop-ref = <&sn1 0x10 &ssn1 0x20>;
+		shared-data = <
+			0x00010203 0x04050607 0x08090a0b 0x0c0d0e0f
+			0x10111213 0x14151617 0x18191a1b 0x1c1d1e1f
+			0x20212223 0x24252627 0x28292a2b 0x2c2d2e2f
+			0x30313233 0x34353637 0x38393a3b 0x3c3d3e3f
+			0x40414243 0x44454647 0x48494a4b 0x4c4d4e4f
+			0x50515253 0x54555657 0x58595a5b 0x5c5d5e5f
+			0x60616263 0x64656667 0x68696a6b 0x6c6d6e6f
+			0x70717273 0x74757677 0x78797a7b 0x7c7d7e7f
+			0x80818283 0x84858687 0x88898a8b 0x8c8d8e8f
+			0x90919293 0x94959697 0x98999a9b 0x9c9d9e9f
+			0xa0a1a2a3 0xa4a5a6a7 0xa8a9aaab 0xacadaeaf
+			0xb0b1b2b3 0xb4b5b6b7 0xb8b9babb 0xbcbdbebf
+			0xc0c1c2c3 0xc4c5c6c7 0xc8c9cacb 0xcccdcecf
+			0xd0d1d2d3 0xd4d5d6d7 0xd8d9dadb 0xdcdddedf
+			0xe0e1e2e3 0xe4e5e6e7 0xe8e9eaeb 0xecedeeef
+			0xf0f1f2f3 0xf4f5f6f7 0xf8f9fafb 0xfcfdfeff
+			0x01030507 0x090b0d0f 0x11131517 0x191b1d1f
+			0x21232527 0x292b2d2f 0x31333537 0x393b3d3f
+			0x41434547 0x494b4d4f 0x51535557 0x595b5d5f
+			0x61636567 0x696b6d6f 0x71737577 0x797b7d7f
+			0x81838587 0x898b8d8f 0x91939597 0x999b9d9f
+			0xa1a3a5a7 0xa9abadaf 0xb1b3b5b7 0xb9bbbdbf
+			0xc1c3c5c7 0xc9cbcdcf 0xd1d3d5d7 0xd9dbdddf
+			0xe1e3e5e7 0xe9ebedef 0xf1f3f5f7 0xf9fbfdff
+			0x02060a0e 0x12161a1e 0x22262a2e 0x32363a3e
+			0x42464a4e 0x52565a5e 0x62666a6e 0x72767a7e
+			0x82868a8e 0x92969a9e 0xa2a6aaae 0xb2b6babe
+			0xc2c6cace 0xd2d6dade 0xe2e6eaee 0xf2f6fafe
+			0x03070b0f 0x13171b1f 0x23272b2f 0x33373b3f
+			0x43474b4f 0x53575b5f 0x63676b6f 0x73777b7f
+			0x83878b8f 0x93979b9f 0xa3a7abaf 0xb3b7bbbf
+			0xc3c7cbcf 0xd3d7dbdf 0xe3e7ebef 0xf3f7fbff
+		>;
+
+		ssn1: subsubnode {
+			compatible = "subsubnode1", "subsubnode";
+			prop-phandle = <&sn1>;
+		};
+	};
+
+	sn2: subnode@2 {
+		reg = <2>;
+		prop-maybe-phandle = <&sn2>;
+		board2-only-prop = "only-on-board2";
+		board2-ref = <&b2_node>;
+	};
+
+	b2_node: board2-node {
+		prop-str = "board2";
+		ref-base = <&ssn1>;
+		ref-self = <&b2_node>;
+	};
+};
diff --git a/tests/fdtfactor_board3.dts b/tests/fdtfactor_board3.dts
new file mode 100644
index 000000000000..74087efbd493
--- /dev/null
+++ b/tests/fdtfactor_board3.dts
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/dts-v1/;
+
+/memreserve/ 0xdeadbeef00000000 0x100000;
+
+/ {
+	compatible = "test_fdtfactor";
+	model = "board3";
+	prop-int = <0x12345678>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	sn1: subnode@1 {
+		compatible = "subnode1";
+		reg = <1>;
+		prop-ref = <&sn1 0x10 &ssn1 0x20>;
+		shared-data = <
+			0x00010203 0x04050607 0x08090a0b 0x0c0d0e0f
+			0x10111213 0x14151617 0x18191a1b 0x1c1d1e1f
+			0x20212223 0x24252627 0x28292a2b 0x2c2d2e2f
+			0x30313233 0x34353637 0x38393a3b 0x3c3d3e3f
+			0x40414243 0x44454647 0x48494a4b 0x4c4d4e4f
+			0x50515253 0x54555657 0x58595a5b 0x5c5d5e5f
+			0x60616263 0x64656667 0x68696a6b 0x6c6d6e6f
+			0x70717273 0x74757677 0x78797a7b 0x7c7d7e7f
+			0x80818283 0x84858687 0x88898a8b 0x8c8d8e8f
+			0x90919293 0x94959697 0x98999a9b 0x9c9d9e9f
+			0xa0a1a2a3 0xa4a5a6a7 0xa8a9aaab 0xacadaeaf
+			0xb0b1b2b3 0xb4b5b6b7 0xb8b9babb 0xbcbdbebf
+			0xc0c1c2c3 0xc4c5c6c7 0xc8c9cacb 0xcccdcecf
+			0xd0d1d2d3 0xd4d5d6d7 0xd8d9dadb 0xdcdddedf
+			0xe0e1e2e3 0xe4e5e6e7 0xe8e9eaeb 0xecedeeef
+			0xf0f1f2f3 0xf4f5f6f7 0xf8f9fafb 0xfcfdfeff
+			0x01030507 0x090b0d0f 0x11131517 0x191b1d1f
+			0x21232527 0x292b2d2f 0x31333537 0x393b3d3f
+			0x41434547 0x494b4d4f 0x51535557 0x595b5d5f
+			0x61636567 0x696b6d6f 0x71737577 0x797b7d7f
+			0x81838587 0x898b8d8f 0x91939597 0x999b9d9f
+			0xa1a3a5a7 0xa9abadaf 0xb1b3b5b7 0xb9bbbdbf
+			0xc1c3c5c7 0xc9cbcdcf 0xd1d3d5d7 0xd9dbdddf
+			0xe1e3e5e7 0xe9ebedef 0xf1f3f5f7 0xf9fbfdff
+			0x02060a0e 0x12161a1e 0x22262a2e 0x32363a3e
+			0x42464a4e 0x52565a5e 0x62666a6e 0x72767a7e
+			0x82868a8e 0x92969a9e 0xa2a6aaae 0xb2b6babe
+			0xc2c6cace 0xd2d6dade 0xe2e6eaee 0xf2f6fafe
+			0x03070b0f 0x13171b1f 0x23272b2f 0x33373b3f
+			0x43474b4f 0x53575b5f 0x63676b6f 0x73777b7f
+			0x83878b8f 0x93979b9f 0xa3a7abaf 0xb3b7bbbf
+			0xc3c7cbcf 0xd3d7dbdf 0xe3e7ebef 0xf3f7fbff
+		>;
+
+		ssn1: subsubnode {
+			compatible = "subsubnode1", "subsubnode";
+			prop-phandle = <&sn2>;
+		};
+	};
+
+	sn2: subnode@2 {
+		reg = <2>;
+		prop-maybe-phandle = <0>;
+	};
+
+	b3_node: board3-node {
+		prop-str = "board3";
+		ref-base = <&sn2>;
+		ref-self = <&b3_node>;
+	};
+};
diff --git a/tests/fdtfactor_board3_shifted.dts b/tests/fdtfactor_board3_shifted.dts
new file mode 100644
index 000000000000..263503f851b8
--- /dev/null
+++ b/tests/fdtfactor_board3_shifted.dts
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/dts-v1/;
+
+/memreserve/ 0xdeadbeef00000000 0x100000;
+
+/ {
+	compatible = "test_fdtfactor";
+	model = "board3";
+	prop-int = <0x12345678>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	b3_node: board3-node {
+		prop-str = "board3";
+		ref-self = <&b3_node>;
+		ref-base = <&sn2>;
+	};
+
+	sn1: subnode@1 {
+		compatible = "subnode1";
+		reg = <1>;
+		prop-ref = <&sn1 0x10 &ssn1 0x20>;
+		shared-data = <
+			0x00010203 0x04050607 0x08090a0b 0x0c0d0e0f
+			0x10111213 0x14151617 0x18191a1b 0x1c1d1e1f
+			0x20212223 0x24252627 0x28292a2b 0x2c2d2e2f
+			0x30313233 0x34353637 0x38393a3b 0x3c3d3e3f
+			0x40414243 0x44454647 0x48494a4b 0x4c4d4e4f
+			0x50515253 0x54555657 0x58595a5b 0x5c5d5e5f
+			0x60616263 0x64656667 0x68696a6b 0x6c6d6e6f
+			0x70717273 0x74757677 0x78797a7b 0x7c7d7e7f
+			0x80818283 0x84858687 0x88898a8b 0x8c8d8e8f
+			0x90919293 0x94959697 0x98999a9b 0x9c9d9e9f
+			0xa0a1a2a3 0xa4a5a6a7 0xa8a9aaab 0xacadaeaf
+			0xb0b1b2b3 0xb4b5b6b7 0xb8b9babb 0xbcbdbebf
+			0xc0c1c2c3 0xc4c5c6c7 0xc8c9cacb 0xcccdcecf
+			0xd0d1d2d3 0xd4d5d6d7 0xd8d9dadb 0xdcdddedf
+			0xe0e1e2e3 0xe4e5e6e7 0xe8e9eaeb 0xecedeeef
+			0xf0f1f2f3 0xf4f5f6f7 0xf8f9fafb 0xfcfdfeff
+			0x01030507 0x090b0d0f 0x11131517 0x191b1d1f
+			0x21232527 0x292b2d2f 0x31333537 0x393b3d3f
+			0x41434547 0x494b4d4f 0x51535557 0x595b5d5f
+			0x61636567 0x696b6d6f 0x71737577 0x797b7d7f
+			0x81838587 0x898b8d8f 0x91939597 0x999b9d9f
+			0xa1a3a5a7 0xa9abadaf 0xb1b3b5b7 0xb9bbbdbf
+			0xc1c3c5c7 0xc9cbcdcf 0xd1d3d5d7 0xd9dbdddf
+			0xe1e3e5e7 0xe9ebedef 0xf1f3f5f7 0xf9fbfdff
+			0x02060a0e 0x12161a1e 0x22262a2e 0x32363a3e
+			0x42464a4e 0x52565a5e 0x62666a6e 0x72767a7e
+			0x82868a8e 0x92969a9e 0xa2a6aaae 0xb2b6babe
+			0xc2c6cace 0xd2d6dade 0xe2e6eaee 0xf2f6fafe
+			0x03070b0f 0x13171b1f 0x23272b2f 0x33373b3f
+			0x43474b4f 0x53575b5f 0x63676b6f 0x73777b7f
+			0x83878b8f 0x93979b9f 0xa3a7abaf 0xb3b7bbbf
+			0xc3c7cbcf 0xd3d7dbdf 0xe3e7ebef 0xf3f7fbff
+		>;
+
+		ssn1: subsubnode {
+			compatible = "subsubnode1", "subsubnode";
+			prop-phandle = <&sn2>;
+		};
+	};
+
+	sn2: subnode@2 {
+		reg = <2>;
+		prop-maybe-phandle = <0>;
+	};
+};
diff --git a/tests/meson.build b/tests/meson.build
index 9f0f51013530..5d1c3a798c96 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -144,7 +144,7 @@ run_test_deps = [
   dtc_tools, treegen_dtb, tests_exe,
 ]
 if pylibfdt_enabled
-  run_test_types += 'pylibfdt'
+  run_test_types += ['pylibfdt', 'fdtfactor']
   run_test_deps += pylibfdt
 endif
 foreach test_type : run_test_types
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index e16767d3f3a2..815233227df1 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -1207,6 +1207,106 @@ pylibfdt_tests () {
     run_python_tests "$SRCDIR/libpydt_tests.py"
 }
 
+fdtfactor_tests () {
+    check_factored_dtb () {
+        exp="$1"
+        got="$2"
+        if [ "$OVERLAY_LOCAL_FIXUPS" -ne 2 ]; then
+            cp "$exp" "$got.exp.test.dtb"
+            $DTPUT -r "$got.exp.test.dtb" /__local_fixups__ 2>/dev/null || true
+            $DTPUT -r "$got" /__local_fixups__ 2>/dev/null || true
+            exp="$got.exp.test.dtb"
+        fi
+        run_test dtbs_equal_unordered "$exp" "$got"
+    }
+
+    for i in 1 2 3; do
+        run_dtc_test -b 2 -@ -L -I dts -O dtb -o fdtfactor_board${i}.test.dtb \
+            "$SRCDIR/fdtfactor_board${i}.dts"
+    done
+
+    # Default mode: factor 3 boards into base.dtb + .dtbo overlays and verify
+    # that majority properties land in base.dtb and fdtoverlay reconstructs
+    # each original DTB (including /__local_fixups__, /memreserve/, and
+    # boot_cpuid_phys).
+    rm -rf fdtfactor_out.test.dir
+    run_wrap_test $PYTHON $FDTFACTOR -s --output-base-dtb base.test.dtb \
+        -o fdtfactor_out.test.dir \
+        fdtfactor_board1.test.dtb fdtfactor_board2.test.dtb \
+        fdtfactor_board3.test.dtb
+    run_fdtget_test "deadbeef" -tx fdtfactor_out.test.dir/base.test.dtb \
+        / prop-int
+    run_wrap_error_test $DTGET \
+        fdtfactor_out.test.dir/fdtfactor_board1.test.dtbo \
+        /fragment@0/__overlay__ prop-int
+    for i in 1 2 3; do
+        run_wrap_test $FDTOVERLAY -i fdtfactor_out.test.dir/base.test.dtb \
+            -o fdtfactor_out.test.dir/merged${i}.test.dtb \
+            fdtfactor_out.test.dir/fdtfactor_board${i}.test.dtbo
+        check_factored_dtb fdtfactor_board${i}.test.dtb \
+            fdtfactor_out.test.dir/merged${i}.test.dtb
+    done
+
+    # Shifted phandles: fdtfactor_board3_shifted.dts defines board3-node before
+    # subnode@1 so all phandle numbers differ from board1 and board2; verify
+    # that fdtfactor normalizes them via /__local_fixups__.
+    run_dtc_test -b 2 -@ -L -I dts -O dtb \
+        -o fdtfactor_board3_shifted.test.dtb \
+        "$SRCDIR/fdtfactor_board3_shifted.dts"
+    rm -rf fdtfactor_shift.test.dir
+    run_wrap_test $PYTHON $FDTFACTOR -o fdtfactor_shift.test.dir \
+        fdtfactor_board1.test.dtb fdtfactor_board2.test.dtb \
+        fdtfactor_board3_shifted.test.dtb
+    run_wrap_error_test $DTGET \
+        fdtfactor_shift.test.dir/fdtfactor_board3_shifted.test.dtbo \
+        /fragment@0/__overlay__/subnode@1 prop-ref
+    run_wrap_test $FDTOVERLAY -i fdtfactor_shift.test.dir/base.dtb \
+        -o fdtfactor_shift.test.dir/merged3.test.dtb \
+        fdtfactor_shift.test.dir/fdtfactor_board3_shifted.test.dtbo
+    check_factored_dtb fdtfactor_board3.test.dtb \
+        fdtfactor_shift.test.dir/merged3.test.dtb
+
+    # DTBs compiled with dtc -@ -L that contain no labels or phandle references
+    # (for which dtc omits /__symbols__ and /__local_fixups__) are accepted.
+    printf '/dts-v1/;\n/ { common = <1>; b = "a"; };\n' > fdtfactor_noph1.test.dts
+    printf '/dts-v1/;\n/ { common = <1>; b = "b"; };\n' > fdtfactor_noph2.test.dts
+    for i in 1 2; do
+        run_dtc_test -@ -L -I dts -O dtb -o fdtfactor_noph${i}.test.dtb \
+            fdtfactor_noph${i}.test.dts
+        run_test check_path fdtfactor_noph${i}.test.dtb \
+            not-exists "/__symbols__"
+        run_test check_path fdtfactor_noph${i}.test.dtb \
+            not-exists "/__local_fixups__"
+    done
+    rm -rf fdtfactor_noph.test.dir
+    run_wrap_test $PYTHON $FDTFACTOR -o fdtfactor_noph.test.dir \
+        fdtfactor_noph1.test.dtb fdtfactor_noph2.test.dtb
+    for i in 1 2; do
+        run_wrap_test $FDTOVERLAY -i fdtfactor_noph.test.dir/base.dtb \
+            -o fdtfactor_noph.test.dir/merged${i}.test.dtb \
+            fdtfactor_noph.test.dir/fdtfactor_noph${i}.test.dtbo
+        run_test dtbs_equal_unordered fdtfactor_noph${i}.test.dtb \
+            fdtfactor_noph.test.dir/merged${i}.test.dtb
+    done
+
+    # Legacy linux,phandle properties (dtc -H both / -H legacy), overlay .dtbo
+    # inputs, and inputs lacking /__local_fixups__ are rejected.
+    run_dtc_test -H both -@ -L -I dts -O dtb \
+        -o fdtfactor_legacy_ph.test.dtb "$SRCDIR/fdtfactor_board1.dts"
+    run_wrap_error_test $PYTHON $FDTFACTOR -o fdtfactor_legacy.test.dir \
+        fdtfactor_legacy_ph.test.dtb fdtfactor_board2.test.dtb
+    run_wrap_error_test $PYTHON $FDTFACTOR -o fdtfactor_legacy.test.dir \
+        fdtfactor_out.test.dir/fdtfactor_board1.test.dtbo \
+        fdtfactor_board2.test.dtb
+    for i in 1 2 3; do
+        run_dtc_test -b 2 -@ -I dts -O dtb \
+            -o fdtfactor_board${i}.nolf.test.dtb \
+            "$SRCDIR/fdtfactor_board${i}.dts"
+    done
+    run_wrap_error_test $PYTHON $FDTFACTOR -o fdtfactor_legacy.test.dir \
+        fdtfactor_board1.nolf.test.dtb fdtfactor_board2.test.dtb
+}
+
 while getopts "vt:me" ARG ; do
     case $ARG in
 	"v")
@@ -1227,14 +1327,15 @@ done
 if [ -z "$TESTSETS" ]; then
     TESTSETS="libfdt utilfdt dtc dtbs_equal fdtget fdtput fdtdump fdtoverlay"
 
-    # Test pylibfdt if the libfdt Python module is available.
+    # Test pylibfdt and fdtfactor if the libfdt Python module is available.
     if ! $no_python; then
-        TESTSETS="$TESTSETS pylibfdt"
+        TESTSETS="$TESTSETS pylibfdt fdtfactor"
     fi
 fi
 
 # Make sure we don't have stale blobs lying around
-rm -f *.test.dtb *.test.dts
+rm -f *.test.dtb *.test.dtbo *.test.dts
+rm -rf *.test.dir
 
 for set in $TESTSETS; do
     case $set in
@@ -1265,6 +1366,9 @@ for set in $TESTSETS; do
         "fdtoverlay")
 	    fdtoverlay_tests
 	    ;;
+        "fdtfactor")
+            fdtfactor_tests
+            ;;
     esac
 done
 
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
2.56.0.679.gc527c65306-goog

