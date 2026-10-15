Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE1C582B90
	for <Devicetree-compiler@vger.kernel.org>; Thu, 15 Oct 2026 18:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792088611; cv=none; b=eVE4aX4hKj7yEN3LcPOy5briNaqmquqRz7NaglN7lyy8Fhrbd/oGNhs3LP4hXdWtUkRrbECjKND99V/G/Iq9n5lvD7bs6DouFa6NUSkqvEa6dJ3ZojmFEhu6QdLaLh2TrsoxdRKFXg3cB9zoXzNVBYhH3wDeZxrhMWaGw8YwYTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792088611; c=relaxed/simple;
	bh=wHOu/4NhG/vx0QMW09TB3htvNNcuw0KISlmwjVzTnEI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k0rqfmqFkZcBFM3e/Y0aXBnbPuwyZWMzT9oib52ESDzuFa1CErmFxA6FOFhedmqW1yr/puIhgHQX6PojTxK+YcaOdJhlBDA2I+npkB6EFH7ubtBLIX362tw7CImqhpPKOGk1V3OOubo+cRQ19NNhx7IVBrL4g9srU/NsOZBeEYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=d8dFtWhw; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="d8dFtWhw"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1419d3416ceso4315552c88.0
        for <Devicetree-compiler@vger.kernel.org>; Thu, 15 Oct 2026 11:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792088595; x=1792693395; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f6V2cNjmTjZYPHFLnaysmAiB2NW1C0sPrfcyehbr8Gg=;
        b=d8dFtWhwUadjh0AsFTgwnXVsyscUpMHKQ/iVOU1o2qTsT+phPYQXjtW2uyqYNhyMhT
         uN0Y3sCb6C4atmvtU7B7JjHBh3KoYjqCjdJFM6MGOFlQvNTNOCSopNcAEAlfQl6J2ATL
         s6vULbxRDnb5WqXmxWsHrLHPxggdFXNWp5QJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792088595; x=1792693395;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f6V2cNjmTjZYPHFLnaysmAiB2NW1C0sPrfcyehbr8Gg=;
        b=iGHG/j11+JZ4+0dlsHnAn07YuhkIN6rq34wzvR8UVL5qdC5UaMaLDOBDgYunB8qv6m
         Cc8RUZCY+HK21mh7/SbkzMLD4gbwhdxG+IjXm928Ip2cJiUfOCTxKcDuw3nYv31+EStv
         dj9sAWB+To52VG7WJzVElD01V75UEMC1Cyyns+aHIGQA+iissq+uQAnrPSTCmQ2zpcw8
         /p593ECUGJ7TdJljkNBo998n1ImrsiNe7oIUENkTxVAE8fRjZYGXn8YQ2h9NXuNowmu2
         kwcPc28uuuFkVTt+4SNHNlNMEe2Aatl5So7aUUthybacQQgsnSaXugVG17ElgXwzP2N+
         kgMw==
X-Gm-Message-State: AFq9FYLD4QzHzHu8HG4btBLo165qgUG03gnhpywViclRN8bdtLMb8B96
	hylPwWBzMy8ETofniysH11pWI+sMF7EtVAnd7iRicPi62asNn3CqxVYiYe3XVBC7bm6CSFUhuVV
	Hpwg=
X-Gm-Gg: AYBFou0kqvyp4amdE0OWAxBUjinNL6NittKwgqvcjOfBIu9E861nGJuybYaOvcW2Soo
	FGCRS7jxnnesG4YkkbyohfluDXkq9VIdeKMOuYug3jV4/XbycQIc+pnWps8uGmXr5pNkS8y/VCb
	uo0VmEOino9fpka7HmbLqYgk1PiQH2FLfIlNtzzm11eB19iDDDu8bOSGOo/liXUoUt162y8OnfC
	VlCZukrAZM/Blo8AwG21Uqb1loNQUqptMHuPvgCzeCbOAxDCa3wzv4gKsoPklsTO3/eR1QzoCIe
	8Luy0ncC8DE/wIOHsRJvqSQ9eCiNocGj8/d9XFbOU3Ev0X7jEydSWm9OevmoNvzk2RRIFmO5cQe
	LHFLDenEWlpBy+37YpVyTS2C3HaDjFz8vnNNL2PMFTMQx+IGo+H0L8FZTz7noltczxS6eABJlW3
	zT/QvO8ZJs931zeM4068zFdHBHwgJ57D2KrVnshd5Fr25phXU+3qaHS6KLlu4f0J5r4UwYamSTm
	0QF01rRjCKjKereR2cMlNaBG2wPjjrwXY1L3BOKJDzKCiPx21F6hYW42oey
X-Received: by 2002:a05:701b:21c5:b0:149:7f69:a3b3 with SMTP id a92af1059eb24-16a586a30a1mr25486611c88.2.1792088593971;
        Thu, 15 Oct 2026 11:23:13 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:9ea0:3a29:323e:5f11])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-182a8a4a56bsm727204c88.20.2026.10.15.11.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 11:23:12 -0700 (PDT)
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
Subject: [PATCH 4/4] fdtfactor: Add compiled FIT image factoring support
Date: Thu, 15 Oct 2026 11:21:37 -0700
Message-ID: <20261015182221.2931742-5-dianders@chromium.org>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
In-Reply-To: <20261015182221.2931742-1-dianders@chromium.org>
References: <20261015182221.2931742-1-dianders@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Bootloaders such as depthcharge on Chromebooks and U-Boot use Flattened
Image Tree (FIT) images to bundle a kernel image with multiple board FDT
blobs (`fdt-1`, `fdt-2`, ...) and per-board configuration nodes.

Add `-f`/`--fit`, `-F`/`--fit-out`, and `--single-base-dtb` options to
`fdtfactor` to factor a compiled FIT image directly:

- Parse non-overlay `type = "flat_dt"` nodes under `/images`,
  decompressing their `data` blobs according to their `compression`
  property (`none`, `lz4`, `lzma`, `gzip`).
- Partition the `flat_dt` blobs into compatible factor groups (by
  compression, architecture, FDT header fields, and node-path overlap)
  so a single FIT image containing multiple board/SoC families produces
  a separate `fdt-base-1`, `fdt-base-2`, etc. for each family.
- Support `--single-base-dtb` to force all `flat_dt` blobs into a single
  base DTB regardless of node-path overlap, failing only if their FDT
  headers, architecture, or compression differ.
- Insert each `fdt-base-N` node into `/images`, replace each factored
  `fdt-*` node's `data` with its compressed `.dtbo` overlay, recompute
  any `hash*` subnode digests, and prepend `fdt-base-N` to each matching
  configuration's `fdt` string list while preserving all other
  configuration properties (`description`, `compatible`, etc.,
  populating `compatible` from the board DTB's root node when omitted)
  and any pre-existing overlay entries.

Add uncompressed, LZ4-compressed multi-family, and `--single-base-dtb`
FIT image test cases to the `fdtoverlay` test suite.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 README.md                  |  15 +
 fdtfactor                  | 726 +++++++++++++++++++++++++++++++++++--
 tests/Makefile.tests       |   2 +-
 tests/fdtfactor_other1.dts |  69 ++++
 tests/fdtfactor_other2.dts |  69 ++++
 tests/fdtfactor_test.its   | 109 ++++++
 tests/run_tests.sh         |  69 +++-
 7 files changed, 1033 insertions(+), 26 deletions(-)
 create mode 100644 tests/fdtfactor_other1.dts
 create mode 100644 tests/fdtfactor_other2.dts
 create mode 100644 tests/fdtfactor_test.its

diff --git a/README.md b/README.md
index 6ace31bfbfdb..30fc28fa7545 100644
--- a/README.md
+++ b/README.md
@@ -110,6 +110,12 @@ Basic usage:
 $ fdtfactor -b base.dtb -o out_dir board1.dtb board2.dtb board3.dtb
 ```
 
+Compiled FIT image usage (targeting depthcharge / coreboot / U-Boot):
+
+```
+$ fdtfactor -S -f image.fit -F image.factored.fit
+```
+
 Options:
 
 * `-b`, `--base-dtb`: Output path for the common base `.dtb` (compressed if
@@ -118,6 +124,11 @@ Options:
   without a directory component).
 * `-o`, `--outdir`: Output directory for generated `.dtbo` files (and for
   `--base-dtb` when given without a directory component).
+* `-f`, `--fit`: Input compiled FIT image (`.fit` / `.itb`) to factor in
+  place (or write to `-F`), creating one `fdt-base-N` per compatible
+  board/SoC family.
+* `-F`, `--fit-out`: Output path for the factored FIT image (default:
+  overwrite `--fit`).
 * `-S`, `--strip-local-fixups`: Omit `/__local_fixups__` from the generated
   `base.dtb` and final reconstructed device trees. When `-L` is passed to
   `dtc` solely so `fdtfactor` can locate phandle cells at build time, the
@@ -127,6 +138,10 @@ Options:
   `.dtbo` overlays. Omit `-S` if downstream tooling or verification
   expects applying a board's `.dtbo` to `base.dtb` to reproduce the
   original `.dtb`'s `/__local_fixups__` subtree verbatim.
+* `--single-base-dtb`: In FIT mode (`-f`/`--fit`), force all `flat_dt`
+  images to be factored into a single `fdt-base-1` base `.dtb` regardless of
+  node-path overlap, failing only if their FDT headers (`boot_cpuid_phys`,
+  `/memreserve/`), architecture, or compression differ.
 * `--verify`: Verify that applying each generated `.dtbo` to `base.dtb`
   with `libfdt` recreates the original `.dtb`.
 * `-v`, `--verbose`: Print uncompressed and compressed size savings.
diff --git a/fdtfactor b/fdtfactor
index 9f06801f973c..8a0c996581e5 100755
--- a/fdtfactor
+++ b/fdtfactor
@@ -2,21 +2,24 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 """Split compiled device tree blobs (.dtb) into a base .dtb and .dtbo overlays.
 
-Given a set of compiled device tree blobs, fdtfactor extracts all common nodes
-and properties into a single base .dtb file and writes the per-board
-differences into .dtbo overlay files. Applying an overlay to the base .dtb
-using fdtoverlay or libfdt's fdt_overlay_apply() recreates the corresponding
-original device tree.
+Given a set of compiled device tree blobs (or a compiled FIT image),
+fdtfactor extracts all common nodes and properties into a base .dtb and writes
+the per-board differences into .dtbo overlays. Applying an overlay to the base
+.dtb using fdtoverlay, libfdt's fdt_overlay_apply(), or depthcharge's FIT
+loader recreates the corresponding original device tree.
 """
 
 import argparse
 from collections import Counter
+import copy
 import gzip
+import hashlib
 import lzma
 import os
 import struct
 import subprocess
 import sys
+import zlib
 
 import libfdt
 
@@ -27,8 +30,8 @@ LZ4_LEGACY_MAGIC = b'\x02\x21\x4c\x18'
 GZIP_MAGIC = b'\x1f\x8b'
 XZ_MAGIC = b'\xfd7zXZ\x00'
 # Matches raw LZMA_ALONE headers with default lc=3, lp=0, pb=2 (0x5d) and
-# power-of-two dictionary sizes >= 64 KiB; .lzma extension handles any
-# non-default LZMA headers.
+# power-of-two dictionary sizes >= 64 KiB; .lzma extension or FIT compression
+# property handles any non-default LZMA headers.
 LZMA_ALONE_MAGIC = b'\x5d\x00\x00'
 
 COMP_TO_EXT = {
@@ -209,6 +212,51 @@ class NodeTree:
         self.props = {}
         self.children = {}
 
+    @classmethod
+    def from_fdt(cls, fdt, nodeoffset=0):
+        """Recursively copy a `libfdt.FdtRo` subtree into a `NodeTree`.
+
+        Args:
+            fdt: A `libfdt.FdtRo` instance.
+            nodeoffset: Node offset in `fdt` to copy (defaults to root `0`).
+
+        Returns:
+            A `NodeTree` containing all properties and subnodes of
+            `nodeoffset`.
+        """
+        node = cls()
+        poff = fdt.first_property_offset(nodeoffset, quiet=libfdt.QUIET_NOTFOUND)
+        while poff >= 0:
+            prop = fdt.get_property_by_offset(poff)
+            node.props[prop.name] = bytes(prop)
+            poff = fdt.next_property_offset(poff, quiet=libfdt.QUIET_NOTFOUND)
+
+        soff = fdt.first_subnode(nodeoffset, quiet=libfdt.QUIET_NOTFOUND)
+        while soff >= 0:
+            name = fdt.get_name(soff)
+            node.children[name] = cls.from_fdt(fdt, soff)
+            soff = fdt.next_subnode(soff, quiet=libfdt.QUIET_NOTFOUND)
+        return node
+
+    def copy(self):
+        """Return a deep copy of this `NodeTree`."""
+        return copy.deepcopy(self)
+
+    def update_fit_hashes(self):
+        """Recompute `value` properties on any FIT `hash*` subnodes of `self`."""
+        data_bytes = self.props.get('data')
+        if data_bytes is None:
+            return
+        for sub_name, sub_node in self.children.items():
+            if not sub_name.startswith('hash'):
+                continue
+            algo = _prop_as_str(sub_node.props.get('algo'))
+            if not algo:
+                raise ValueError(
+                    f'FIT hash subnode {sub_name!r} lacks an algo property'
+                )
+            sub_node.props['value'] = _compute_fit_hash(algo, data_bytes)
+
     def get_node(self, path):
         """Return the descendant NodeTree at `path`, creating missing nodes.
 
@@ -337,7 +385,7 @@ class ParsedDtb:
     """Parsed representation of an input .dtb blob."""
 
     def __init__(self, filename, raw_bytes, compressed_size=None,
-                 compression='none'):
+                 compression='none', fdt=None):
         """Parse an uncompressed FDT blob into nodes, symbols, and fixups.
 
         Args:
@@ -347,6 +395,7 @@ class ParsedDtb:
                 decompression (defaults to `len(raw_bytes)`).
             compression: Compression algorithm of the input file (`'none'`,
                 `'lz4'`, `'lzma'`, `'xz'`, or `'gzip'`).
+            fdt: Optional pre-validated `libfdt.FdtRo` instance for `raw_bytes`.
         """
         self.filename = filename
         self.raw_bytes = raw_bytes
@@ -354,11 +403,12 @@ class ParsedDtb:
             compressed_size if compressed_size is not None else len(raw_bytes)
         )
         self.compression = compression
-        fdt = _open_fdt_ro(raw_bytes, filename)
-        if _is_dtbo_overlay(fdt):
-            raise ValueError(
-                f'{filename}: Input is already a DTB overlay (.dtbo)'
-            )
+        if fdt is None:
+            fdt = _open_fdt_ro(raw_bytes, filename)
+            if _is_dtbo_overlay(fdt):
+                raise ValueError(
+                    f'{filename}: Input is already a DTB overlay (.dtbo)'
+                )
 
         # Extract FDT header metadata (boot_cpuid_phys and /memreserve/ table)
         # stored outside the DT node/property tree; see _validate_dtb_headers()
@@ -1211,6 +1261,588 @@ def verify_recreated_dtb(orig_dtb, base_dtb_blob, dtbo_blob,
         )
 
 
+# ---------------------------------------------------------------------------
+# Compiled FIT image factoring (targeting depthcharge / coreboot / U-Boot)
+# ---------------------------------------------------------------------------
+
+def _prop_as_str(raw_bytes):
+    """Decode a NUL-terminated FDT string property.
+
+    Args:
+        raw_bytes: Raw property bytes (or None).
+
+    Returns:
+        Decoded string with trailing NULs stripped, or `''` if empty/None.
+    """
+    if not raw_bytes:
+        return ''
+    return raw_bytes.rstrip(b'\x00').decode('utf-8', errors='replace')
+
+
+def _prop_as_str_list(raw_bytes):
+    """Decode a NUL-separated FDT stringlist property.
+
+    Args:
+        raw_bytes: Raw property bytes (or None).
+
+    Returns:
+        List of decoded non-empty strings.
+    """
+    if not raw_bytes:
+        return []
+    parts = raw_bytes.rstrip(b'\x00').split(b'\x00')
+    return [p.decode('utf-8', errors='replace') for p in parts if p]
+
+
+def _compute_fit_hash(algo_name, data_bytes):
+    """Compute a binary hash digest for a FIT image `hash*` subnode.
+
+    Args:
+        algo_name: Hash algorithm name (e.g. `'sha1'`, `'sha256'`, `'crc32'`).
+        data_bytes: Image `data` property bytes to hash.
+
+    Returns:
+        Binary digest as `bytes`.
+    """
+    if algo_name == 'crc32':
+        return struct.pack('>I', zlib.crc32(data_bytes) & 0xffffffff)
+    h = hashlib.new(algo_name)
+    h.update(data_bytes)
+    return h.digest()
+
+
+def _is_dtb_filename_desc(desc):
+    """Return True if `desc` looks like a `.dtb` filename."""
+    if not desc or ' ' in desc:
+        return False
+    _, ext = os.path.splitext(desc)
+    if ext in EXT_TO_COMP:
+        desc = desc[:-len(ext)]
+    return desc.endswith('.dtb') and len(os.path.basename(desc)) > 4
+
+
+def _derive_base_dtb_description(entries, base_dtb_node_name, comp):
+    """Derive a `description` string for a factored base FDT image node.
+
+    Extracts the common prefix across `.dtb` filename descriptions in `entries`
+    and trims any partially matched trailing token before appending
+    `'-base.dtb[.comp]'` (falling back to `'<base_dtb_node_name>.dtb[.comp]'`
+    if no common prefix remains):
+
+    * Diverging at a letter (truncate back to the last `-`, `_`, or `.`):
+      - `['sc7180-trogdor-lazor', 'sc7180-trogdor-pompom']`
+        -> `'sc7180-trogdor-base.dtb'`
+      - `['sc7180-lazor', 'sc7180-limozeen']` -> `'sc7180-base.dtb'`
+      - `['alpha', 'apricot']` -> `'fdt-base-1.dtb'` (no prior separator)
+    * Diverging at a digit inside a token (strip trailing digits from prefix):
+      - `['fdtfactor_board1', 'fdtfactor_board2']` -> `'fdtfactor_board-base.dtb'`
+      - `['sc7180-trogdor', 'sc7280-herobrine']` -> `'sc-base.dtb'`
+    * Diverging at or right after a separator (keep full tokens before
+      separator):
+      - `['sc7180-1', 'sc7180-2']` -> `'sc7180-base.dtb'`
+      - `['sc7180-trogdor-r1', 'sc7180-trogdor-r1-lte']`
+        -> `'sc7180-trogdor-r1-base.dtb'`
+
+    Args:
+        entries: List of FIT `flat_dt` entry dicts in the factor group.
+        base_dtb_node_name: Node name for the base FDT (e.g. `'fdt-base-1'`).
+        comp: Compression algorithm name (`'none'`, `'lz4'`, etc.).
+
+    Returns:
+        Description string (e.g. `'sc7180-trogdor-base.dtb.lz4'`).
+    """
+    stems = []
+    for e in entries:
+        desc = _prop_as_str(e['node'].props.get('description'))
+        if _is_dtb_filename_desc(desc):
+            _, stem, _ = split_dtb_filename(desc)
+            if stem:
+                stems.append(stem)
+    if len(stems) >= 2:
+        prefix = os.path.commonprefix(stems)
+        if any(
+            len(s) > len(prefix) and s[len(prefix)].isalpha()
+            for s in stems
+        ):
+            sep_idx = max(prefix.rfind(c) for c in ('-', '_', '.'))
+            prefix = prefix[:sep_idx] if sep_idx >= 0 else ''
+        elif (
+            any(
+                len(s) > len(prefix) and s[len(prefix)].isdigit()
+                for s in stems
+            )
+            and not prefix.endswith(('-', '_', '.'))
+        ):
+            prefix = prefix.rstrip('0123456789')
+        prefix = prefix.rstrip('-_.')
+        if prefix:
+            return f'{prefix}-base.dtb{COMP_TO_EXT[comp]}'
+    return f'{base_dtb_node_name}.dtb{COMP_TO_EXT[comp]}'
+
+
+def group_fit_dtbs(fdt_entries):
+    """Partition FIT `flat_dt` entries into compatible factor groups.
+
+    DTBs are grouped by `(compression, arch, load, entry, boot_cpuid_phys,
+    mem_rsv)` and node-path overlap (>= 50%) so that a single FIT image
+    containing multiple board/SoC families (e.g. `sc7180-trogdor` and
+    `sc7280-herobrine`) produces one base DTB per family.
+
+    Args:
+        fdt_entries: List of FIT `flat_dt` entry dicts.
+
+    Returns:
+        List of entry lists, one per compatible factor group.
+    """
+    groups = []
+    for entry in fdt_entries:
+        dtb = entry['dtb']
+        header_key = (
+            entry['compression'],
+            entry['arch'],
+            entry['node'].props.get('load'),
+            entry['node'].props.get('entry'),
+            dtb.boot_cpuid_phys,
+            tuple(dtb.mem_rsv),
+        )
+        entry_nodes = set(dtb.nodes.keys())
+
+        placed = False
+        for grp in groups:
+            if grp['key'] != header_key:
+                continue
+            ref_nodes = grp['ref_nodes']
+            union_len = len(entry_nodes | ref_nodes)
+            overlap = (
+                len(entry_nodes & ref_nodes) / union_len if union_len else 1.0
+            )
+            if overlap >= 0.5:
+                grp['entries'].append(entry)
+                placed = True
+                break
+
+        if not placed:
+            groups.append({
+                'key': header_key,
+                'ref_nodes': entry_nodes,
+                'entries': [entry],
+            })
+
+    return [grp['entries'] for grp in groups]
+
+
+def _extract_fit_fdt_entries(fit_in_path, images_node):
+    """Extract and parse non-overlay `flat_dt` entries from `/images`.
+
+    Any `/images` nodes that are already `.dtbo` overlays are skipped and left
+    intact in `/images`.
+
+    Args:
+        fit_in_path: Input FIT file path for error messages.
+        images_node: The `NodeTree` for `/images`.
+
+    Returns:
+        List of parsed `flat_dt` entry dicts.
+    """
+    if any(name.startswith('fdt-base-') for name in images_node.children):
+        raise ValueError(
+            f'{fit_in_path}: FIT image already contains fdt-base-* node(s)'
+        )
+
+    fdt_entries = []
+    for img_name, img_node in images_node.children.items():
+        # Check all /images/* nodes (including kernel/ramdisk) because
+        # re-serializing fit_root would drop external data appended past
+        # the FDT totalsize.
+        if ('data-offset' in img_node.props or
+                'data-position' in img_node.props):
+            raise ValueError(
+                f'{fit_in_path}: /images/{img_name} uses external data '
+                f'(data-offset/data-position), which is not supported'
+            )
+        if _prop_as_str(img_node.props.get('type')) != 'flat_dt':
+            continue
+        raw_data = img_node.props.get('data')
+        if raw_data is None:
+            raise ValueError(
+                f'{fit_in_path}: /images/{img_name} lacks a data property'
+            )
+        node_label = f'{fit_in_path}:/images/{img_name}'
+        comp_prop = _prop_as_str(img_node.props.get('compression')) or 'none'
+        dtb_bytes, comp = decompress_blob(
+            raw_data, filename=node_label, comp=comp_prop
+        )
+        fdt_ro = _open_fdt_ro(dtb_bytes, node_label)
+        if _is_dtbo_overlay(fdt_ro):
+            continue
+
+        arch_str = _prop_as_str(img_node.props.get('arch'))
+        parsed_dtb = ParsedDtb(
+            node_label,
+            dtb_bytes,
+            compressed_size=len(raw_data),
+            compression=comp,
+            fdt=fdt_ro,
+        )
+        fdt_entries.append({
+            'name': img_name,
+            'node': img_node,
+            'dtb': parsed_dtb,
+            'compression': comp,
+            'arch': arch_str,
+        })
+
+    if len(fdt_entries) < 2:
+        raise ValueError(
+            'FIT image must contain at least two non-overlay flat_dt '
+            'nodes to factor'
+        )
+
+    return fdt_entries
+
+
+def _partition_fit_fdt_entries(fdt_entries, single_base_dtb):
+    """Partition `fdt_entries` into factorable groups and validate constraints.
+
+    Args:
+        fdt_entries: List of non-overlay FIT `flat_dt` entry dicts.
+        single_base_dtb: Whether `--single-base-dtb` was requested.
+
+    Returns:
+        List of entry lists to factor (each with `len >= 2`).
+    """
+    if single_base_dtb:
+        ref_entry = fdt_entries[0]
+        for entry in fdt_entries[1:]:
+            if entry['compression'] != ref_entry['compression']:
+                raise ValueError(
+                    f'--single-base-dtb requires all FIT flat_dt nodes to use '
+                    f'the same compression: {ref_entry["name"]} has '
+                    f'{ref_entry["compression"]!r} vs {entry["name"]} '
+                    f'{entry["compression"]!r}'
+                )
+            if entry['arch'] != ref_entry['arch']:
+                raise ValueError(
+                    f'--single-base-dtb requires all FIT flat_dt nodes to use '
+                    f'the same arch: {ref_entry["name"]} has '
+                    f'{ref_entry["arch"]!r} vs {entry["name"]} '
+                    f'{entry["arch"]!r}'
+                )
+            for prop in ('load', 'entry'):
+                if (entry['node'].props.get(prop) !=
+                        ref_entry['node'].props.get(prop)):
+                    raise ValueError(
+                        f'--single-base-dtb requires all FIT flat_dt nodes to '
+                        f'use the same {prop} property: {ref_entry["name"]} vs '
+                        f'{entry["name"]}'
+                    )
+        _validate_dtb_headers([e['dtb'] for e in fdt_entries])
+        return [fdt_entries]
+
+    groups = group_fit_dtbs(fdt_entries)
+    factorable_groups = [g for g in groups if len(g) >= 2]
+    if not factorable_groups:
+        raise ValueError(
+            'FIT image must contain at least two compatible '
+            'flat_dt nodes to factor'
+        )
+    for g in groups:
+        if len(g) == 1:
+            print(
+                f'Note: FIT flat_dt node {g[0]["name"]} has no '
+                f'compatible peers and will be left unfactored',
+                file=sys.stderr,
+            )
+    return factorable_groups
+
+
+def _factor_fit_group(entries, base_dtb_node_name, strip_local_fixups, verify):
+    """Factor one compatible group of FIT `flat_dt` entries.
+
+    Updates each `entry['node']` in place with its compressed `.dtbo` overlay
+    and returns the newly created `base_dtb_node` along with group size
+    statistics.
+
+    Args:
+        entries: List of FIT `flat_dt` entry dicts in the group.
+        base_dtb_node_name: Name for the group's base DTB node (e.g.
+            `'fdt-base-1'`).
+        strip_local_fixups: Whether to strip `/__local_fixups__`.
+        verify: Whether to verify each reconstructed DTB.
+
+    Returns:
+        Tuple of `(base_dtb_node, group_stat)`.
+    """
+    group_dtbs = [e['dtb'] for e in entries]
+    comp = entries[0]['compression']
+
+    base_dtb_blob, dtbo_blobs = create_base_dtb_and_overlays(
+        group_dtbs,
+        strip_local_fixups=strip_local_fixups,
+    )
+
+    if verify:
+        for d, dtbo_blob in zip(group_dtbs, dtbo_blobs):
+            verify_recreated_dtb(
+                d, base_dtb_blob, dtbo_blob, strip_local_fixups
+            )
+
+    base_dtb_comp_bytes = compress_blob(base_dtb_blob, comp)
+    base_dtb_node = entries[0]['node'].copy()
+    for prop in ('phandle', 'linux,phandle', 'compatible'):
+        base_dtb_node.props.pop(prop, None)
+    base_dtb_node.children = {
+        k: v
+        for k, v in base_dtb_node.children.items()
+        if k.startswith('hash')
+    }
+    for sub_node in base_dtb_node.children.values():
+        sub_node.props.pop('phandle', None)
+        sub_node.props.pop('linux,phandle', None)
+    if 'description' in base_dtb_node.props:
+        base_dtb_desc = _derive_base_dtb_description(
+            entries, base_dtb_node_name, comp
+        )
+        base_dtb_node.props['description'] = (
+            base_dtb_desc.encode('utf-8') + b'\x00'
+        )
+    base_dtb_node.props['data'] = base_dtb_comp_bytes
+    if 'compression' in base_dtb_node.props or comp != 'none':
+        base_dtb_node.props['compression'] = comp.encode('utf-8') + b'\x00'
+    base_dtb_node.update_fit_hashes()
+
+    dtbo_comp_sizes = []
+    for entry, dtbo_blob in zip(entries, dtbo_blobs):
+        img_node = entry['node']
+        dtbo_comp_bytes = compress_blob(dtbo_blob, comp)
+        dtbo_comp_sizes.append(len(dtbo_comp_bytes))
+
+        if 'description' in img_node.props:
+            old_desc = _prop_as_str(img_node.props['description'])
+            if _is_dtb_filename_desc(old_desc):
+                desc_dir, desc_stem, _ = split_dtb_filename(old_desc)
+                new_desc_name = f'{desc_stem}.dtbo{COMP_TO_EXT[comp]}'
+                new_desc = (
+                    os.path.join(desc_dir, new_desc_name)
+                    if desc_dir
+                    else new_desc_name
+                )
+                img_node.props['description'] = (
+                    new_desc.encode('utf-8') + b'\x00'
+                )
+
+        for prop in ('load', 'entry'):
+            img_node.props.pop(prop, None)
+        for sub_name in list(img_node.children):
+            if sub_name.startswith('signature'):
+                print(
+                    f'Warning: Stripping invalidated signature subnode '
+                    f'/images/{entry["name"]}/{sub_name}',
+                    file=sys.stderr,
+                )
+                del img_node.children[sub_name]
+
+        img_node.props['data'] = dtbo_comp_bytes
+        img_node.update_fit_hashes()
+
+    group_stat = {
+        'base_dtb_name': base_dtb_node_name,
+        'comp': comp,
+        'dtbs': group_dtbs,
+        'base_dtb_blob': base_dtb_blob,
+        'dtbo_blobs': dtbo_blobs,
+        'base_dtb_comp_size': len(base_dtb_comp_bytes),
+        'dtbo_comp_sizes': dtbo_comp_sizes,
+    }
+    return base_dtb_node, group_stat
+
+
+def _update_fit_images_and_configs(images_node, configs_node,
+                                   insert_before_first, fdt_to_base_dtb):
+    """Insert `fdt-base-*` nodes into `/images` and update `/configurations`.
+
+    Args:
+        images_node: The `NodeTree` for `/images`.
+        configs_node: The `NodeTree` for `/configurations`.
+        insert_before_first: Dict mapping the first `flat_dt` node name of each
+            group to `(base_dtb_node_name, base_dtb_node)`.
+        fdt_to_base_dtb: Dict mapping each factored `flat_dt` node name to
+            `(base_dtb_node_name, orig_dtb)`.
+    """
+    new_images_children = {}
+    for img_name, img_node in images_node.children.items():
+        if img_name in insert_before_first:
+            b_name, b_node = insert_before_first[img_name]
+            new_images_children[b_name] = b_node
+        new_images_children[img_name] = img_node
+    images_node.children = new_images_children
+
+    for conf_name, conf_node in configs_node.children.items():
+        fdt_list = _prop_as_str_list(conf_node.props.get('fdt'))
+        if not fdt_list:
+            continue
+        primary_fdt = fdt_list[0]
+        for extra_fdt in fdt_list[1:]:
+            if extra_fdt in fdt_to_base_dtb:
+                raise ValueError(
+                    f'/configurations/{conf_name} lists factored flat_dt '
+                    f'{extra_fdt!r} after the primary FDT'
+                )
+        if primary_fdt in fdt_to_base_dtb:
+            base_dtb_name, orig_dtb = fdt_to_base_dtb[primary_fdt]
+            new_fdt_list = [base_dtb_name] + fdt_list
+            conf_node.props['fdt'] = (
+                '\x00'.join(new_fdt_list).encode('utf-8') + b'\x00'
+            )
+            # If the configuration omitted 'compatible' (relying on the
+            # bootloader reading root 'compatible' from fdt_list[0]), copy the
+            # board's root 'compatible' property onto the configuration node
+            # now that fdt_list[0] is the shared base DTB.
+            if 'compatible' not in conf_node.props:
+                root_compat = orig_dtb.nodes.get('/', {}).get('compatible')
+                if root_compat is not None:
+                    conf_node.props['compatible'] = root_compat
+            for sub_name in list(conf_node.children):
+                if sub_name.startswith(('signature', 'hash')):
+                    print(
+                        f'Warning: Stripping invalidated {sub_name} subnode '
+                        f'/configurations/{conf_name}/{sub_name}',
+                        file=sys.stderr,
+                    )
+                    del conf_node.children[sub_name]
+
+
+def _print_fit_stats(group_stats, orig_fit_size, new_fit_size):
+    """Print per-group and total FIT image size savings.
+
+    Args:
+        group_stats: List of group statistics dicts from `_factor_fit_group()`.
+        orig_fit_size: Original FIT image size in bytes.
+        new_fit_size: Factored FIT image size in bytes.
+    """
+    for st in group_stats:
+        g_dtbs = st['dtbs']
+        orig_uncomp = sum(len(d.raw_bytes) for d in g_dtbs)
+        base_dtb_uncomp = len(st['base_dtb_blob'])
+        dtbo_uncomp = sum(len(b) for b in st['dtbo_blobs'])
+        new_uncomp = base_dtb_uncomp + dtbo_uncomp
+        saved_uncomp = orig_uncomp - new_uncomp
+        pct_uncomp = (
+            (saved_uncomp / orig_uncomp * 100.0) if orig_uncomp else 0.0
+        )
+        print(
+            f'[{st["base_dtb_name"]}] Uncompressed DTBs: {len(g_dtbs)} '
+            f'files ({orig_uncomp:,} B) -> base {base_dtb_uncomp:,} B + '
+            f'{len(st["dtbo_blobs"])} overlays {dtbo_uncomp:,} B = '
+            f'{new_uncomp:,} B (saved {saved_uncomp:,} B / '
+            f'{pct_uncomp:.1f}%)'
+        )
+        if st['comp'] != 'none':
+            orig_comp = sum(d.compressed_size for d in g_dtbs)
+            base_dtb_csize = st['base_dtb_comp_size']
+            dtbo_csize = sum(st['dtbo_comp_sizes'])
+            new_comp = base_dtb_csize + dtbo_csize
+            saved_comp = orig_comp - new_comp
+            pct_comp = (
+                (saved_comp / orig_comp * 100.0) if orig_comp else 0.0
+            )
+            print(
+                f'[{st["base_dtb_name"]}] Compressed ({st["comp"]}): '
+                f'{len(g_dtbs)} files ({orig_comp:,} B) -> base '
+                f'{base_dtb_csize:,} B + {len(st["dtbo_blobs"])} overlays '
+                f'{dtbo_csize:,} B = {new_comp:,} B '
+                f'(saved {saved_comp:,} B / {pct_comp:.1f}%)'
+            )
+    fit_saved = orig_fit_size - new_fit_size
+    fit_pct = (fit_saved / orig_fit_size * 100.0) if orig_fit_size else 0.0
+    print(
+        f'FIT image total: {orig_fit_size:,} bytes -> {new_fit_size:,} bytes '
+        f'(saved {fit_saved:,} B / {fit_pct:.1f}%)'
+    )
+
+
+def factor_fit_image(fit_in_path, fit_out_path, strip_local_fixups=False,
+                     single_base_dtb=False, verify=False, verbose=False):
+    """Factor all `flat_dt` images in a compiled FIT image into base + overlays.
+
+    Args:
+        fit_in_path: Input `.fit` / `.itb` file path.
+        fit_out_path: Output `.fit` / `.itb` file path.
+        strip_local_fixups: Whether to strip `/__local_fixups__` from factored
+            DTBs.
+        single_base_dtb: If True, force all `flat_dt` nodes in the FIT image to
+            be factored into a single `fdt-base-1` base DTB, failing only if
+            their FDT headers, architecture, or compression differ.
+        verify: Whether to verify each board's reconstructed DTB using
+            `fdt_overlay_apply()`.
+        verbose: Whether to print size savings statistics.
+
+    Raises:
+        ValueError: If the FIT image lacks `/images` or `/configurations`,
+            a `flat_dt` node lacks a `data` property, or `single_base_dtb` is
+            requested and the `flat_dt` nodes have incompatible headers,
+            architecture, or compression.
+    """
+    with open(fit_in_path, 'rb') as f:
+        orig_fit_bytes = f.read()
+
+    orig_fit_fdt = _open_fdt_ro(orig_fit_bytes, fit_in_path)
+    fit_root = NodeTree.from_fdt(orig_fit_fdt)
+
+    images_node = fit_root.children.get('images')
+    configs_node = fit_root.children.get('configurations')
+    if images_node is None or configs_node is None:
+        raise ValueError(
+            f'{fit_in_path}: FIT image must contain /images and '
+            f'/configurations nodes'
+        )
+
+    fdt_entries = _extract_fit_fdt_entries(fit_in_path, images_node)
+    factorable_groups = _partition_fit_fdt_entries(
+        fdt_entries, single_base_dtb
+    )
+
+    fdt_to_base_dtb = {}
+    insert_before_first = {}
+    group_stats = []
+
+    for idx, entries in enumerate(factorable_groups, 1):
+        base_dtb_node_name = f'fdt-base-{idx}'
+
+        base_dtb_node, group_stat = _factor_fit_group(
+            entries, base_dtb_node_name, strip_local_fixups, verify
+        )
+        insert_before_first[entries[0]['name']] = (
+            base_dtb_node_name, base_dtb_node
+        )
+        for entry in entries:
+            fdt_to_base_dtb[entry['name']] = (base_dtb_node_name, entry['dtb'])
+        group_stats.append(group_stat)
+
+    _update_fit_images_and_configs(
+        images_node, configs_node, insert_before_first, fdt_to_base_dtb
+    )
+
+    fit_mem_rsv = [
+        tuple(orig_fit_fdt.get_mem_rsv(i))
+        for i in range(orig_fit_fdt.num_mem_rsv())
+    ]
+    new_fit_bytes = fit_root.to_fdt_blob(
+        mem_rsv=fit_mem_rsv,
+        boot_cpuid_phys=orig_fit_fdt.boot_cpuid_phys(),
+        size_hint=max(len(orig_fit_bytes) + 65536, 65536),
+    )
+
+    out_dir = os.path.dirname(fit_out_path)
+    if out_dir:
+        os.makedirs(out_dir, exist_ok=True)
+    with open(fit_out_path, 'wb') as f:
+        f.write(new_fit_bytes)
+
+    if verbose:
+        _print_fit_stats(group_stats, len(orig_fit_bytes), len(new_fit_bytes))
+
+
 def get_dtbo_output_path(dtb_path, outdir, comp='none'):
     """Determine the output `.dtbo[.comp]` file path for an input `.dtb` path.
 
@@ -1238,13 +1870,13 @@ def parse_args():
     parser = argparse.ArgumentParser(
         description=(
             'Split a set of compiled device tree blobs (.dtb, or compressed '
-            '.dtb.lz4/.xz/.lzma/.gz) into a single common base .dtb and '
-            'per-board overlay blobs (.dtbo).'
+            '.dtb.lz4/.xz/.lzma/.gz) or a compiled FIT image into common '
+            'base .dtb(s) and per-board overlay blobs (.dtbo).'
         )
     )
     parser.add_argument(
         '-b', '--base-dtb',
-        required=True,
+        default=None,
         metavar='BASE_DTB',
         help=(
             'Output common base .dtb (or .dtb.lz4/.xz/.lzma/.gz) file path '
@@ -1260,6 +1892,23 @@ def parse_args():
             'filenames (default: alongside each input .dtb)'
         ),
     )
+    parser.add_argument(
+        '-f', '--fit',
+        default=None,
+        metavar='FIT_IMAGE',
+        help=(
+            'Input compiled FIT image (.fit / .itb) to factor (updated '
+            'in-place unless -F/--fit-out is specified)'
+        ),
+    )
+    parser.add_argument(
+        '-F', '--fit-out',
+        default=None,
+        metavar='FIT_OUT',
+        help=(
+            'Output path for the factored FIT image (default: overwrite --fit)'
+        ),
+    )
     parser.add_argument(
         '-S', '--strip-local-fixups',
         action='store_true',
@@ -1268,6 +1917,15 @@ def parse_args():
             'reconstructed device trees'
         ),
     )
+    parser.add_argument(
+        '--single-base-dtb',
+        action='store_true',
+        help=(
+            'Force all flat_dt nodes in a FIT image (-f/--fit) to be '
+            'factored into a single fdt-base-1 base DTB, failing only if '
+            'headers, arch, or compression differ'
+        ),
+    )
     parser.add_argument(
         '--verify',
         action='store_true',
@@ -1283,16 +1941,29 @@ def parse_args():
     )
     parser.add_argument(
         'dtbs',
-        nargs='+',
+        nargs='*',
         metavar='DTB',
         help=(
-            'Input .dtb (or compressed .dtb.lz4/.xz/.lzma/.gz) files (at '
-            'least two required)'
+            'Input .dtb (or compressed .dtb.lz4/.xz/.lzma/.gz) files (when '
+            '--fit is not used)'
         ),
     )
     args = parser.parse_args()
-    if len(args.dtbs) < 2:
-        parser.error('at least two input .dtb files are required')
+    if args.fit_out and not args.fit:
+        parser.error('-F/--fit-out requires -f/--fit')
+    if args.single_base_dtb and not args.fit:
+        parser.error('--single-base-dtb requires -f/--fit')
+    if args.fit:
+        if args.dtbs or args.base_dtb or args.outdir:
+            parser.error(
+                '-f/--fit cannot be combined with -b/--base-dtb, '
+                '-o/--outdir, or positional DTB arguments'
+            )
+    else:
+        if not args.base_dtb:
+            parser.error('-b/--base-dtb is required when -f/--fit is not used')
+        if len(args.dtbs) < 2:
+            parser.error('at least two input .dtb files are required')
     return args
 
 
@@ -1417,7 +2088,18 @@ def main():
     """
     args = parse_args()
     try:
-        factor_dtb_files(args)
+        if args.fit:
+            fit_out = args.fit_out if args.fit_out else args.fit
+            factor_fit_image(
+                args.fit,
+                fit_out,
+                strip_local_fixups=args.strip_local_fixups,
+                single_base_dtb=args.single_base_dtb,
+                verify=args.verify,
+                verbose=args.verbose,
+            )
+        else:
+            factor_dtb_files(args)
     except (OSError, ValueError, RuntimeError, libfdt.FdtException) as exc:
         sys.exit(f'Error: {exc}')
     return 0
diff --git a/tests/Makefile.tests b/tests/Makefile.tests
index d0bdc4afefb2..0ca2d70457f9 100644
--- a/tests/Makefile.tests
+++ b/tests/Makefile.tests
@@ -53,7 +53,7 @@ TESTS_DEPFILES = $(TESTS:%=%.d) \
 	$(addprefix $(TESTS_PREFIX),testutils.d)
 
 TESTS_CLEANFILES_L = $(STD_CLEANFILES) \
-	*.dtb *.test.dtbo *.test.dts *.test.dt.yaml *.dtsv1 \
+	*.dtb *.test.dtbo *.test.dts *.test.its *.test.fit *.test.dt.yaml *.dtsv1 \
 	*.test.dtb.gz *.test.dtbo.gz *.test.dtb.xz *.test.dtbo.xz \
 	*.test.dtb.lzma *.test.dtbo.lzma *.test.dtb.lz4 *.test.dtbo.lz4 \
 	tmp.* *.bak \
diff --git a/tests/fdtfactor_other1.dts b/tests/fdtfactor_other1.dts
new file mode 100644
index 000000000000..26fca3816d5a
--- /dev/null
+++ b/tests/fdtfactor_other1.dts
@@ -0,0 +1,69 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/dts-v1/;
+
+/ {
+	model = "Other Board 1";
+	compatible = "vendor,other1", "vendor,other";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	intc: interrupt-controller@8000 {
+		compatible = "vendor,other-intc";
+		reg = <0x8000 0x100>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	clk: clock-controller@9000 {
+		compatible = "vendor,other-clk";
+		reg = <0x9000 0x100>;
+		#clock-cells = <1>;
+	};
+
+	soc@10000000 {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+		interrupt-parent = <&intc>;
+
+		uart0: serial@a000 {
+			compatible = "vendor,other-uart";
+			reg = <0xa000 0x100>;
+			interrupts = <1 0>;
+			clocks = <&clk 1>;
+			status = "okay";
+		};
+
+		i2c0: i2c@b000 {
+			compatible = "vendor,other-i2c";
+			reg = <0xb000 0x100>;
+			interrupts = <2 0>;
+			clocks = <&clk 2>;
+			status = "okay";
+
+			pmic: pmic@50 {
+				compatible = "vendor,other-pmic";
+				reg = <0x50>;
+
+				reg_buck1: buck1 {
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+				};
+			};
+		};
+
+		spi0: spi@c000 {
+			compatible = "vendor,other-spi";
+			reg = <0xc000 0x100>;
+			clocks = <&clk 3>;
+			vdd-supply = <&reg_buck1>;
+			cs-supply = <&other1_reg>;
+		};
+	};
+
+	other1_reg: regulator-other1 {
+		compatible = "regulator-fixed";
+		regulator-name = "other1-cs";
+	};
+};
diff --git a/tests/fdtfactor_other2.dts b/tests/fdtfactor_other2.dts
new file mode 100644
index 000000000000..50cbc73759d2
--- /dev/null
+++ b/tests/fdtfactor_other2.dts
@@ -0,0 +1,69 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/dts-v1/;
+
+/ {
+	model = "Other Board 2";
+	compatible = "vendor,other2", "vendor,other";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	other2_early_reg: regulator-other-early {
+		compatible = "regulator-fixed";
+		regulator-name = "other2-early";
+	};
+
+	intc: interrupt-controller@8000 {
+		compatible = "vendor,other-intc";
+		reg = <0x8000 0x100>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	clk: clock-controller@9000 {
+		compatible = "vendor,other-clk";
+		reg = <0x9000 0x100>;
+		#clock-cells = <1>;
+	};
+
+	soc@10000000 {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+		interrupt-parent = <&intc>;
+
+		uart0: serial@a000 {
+			compatible = "vendor,other-uart";
+			reg = <0xa000 0x100>;
+			interrupts = <1 0>;
+			clocks = <&clk 1>;
+			status = "disabled";
+		};
+
+		i2c0: i2c@b000 {
+			compatible = "vendor,other-i2c";
+			reg = <0xb000 0x100>;
+			interrupts = <2 0>;
+			clocks = <&clk 2>;
+			status = "okay";
+
+			pmic: pmic@50 {
+				compatible = "vendor,other-pmic";
+				reg = <0x50>;
+
+				reg_buck1: buck1 {
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <3300000>;
+				};
+			};
+		};
+
+		mmc0: mmc@d000 {
+			compatible = "vendor,other-mmc";
+			reg = <0xd000 0x100>;
+			clocks = <&clk 4>;
+			vmmc-supply = <&reg_buck1>;
+			vqmmc-supply = <&other2_early_reg>;
+		};
+	};
+};
diff --git a/tests/fdtfactor_test.its b/tests/fdtfactor_test.its
new file mode 100644
index 000000000000..bf3b9ef8c439
--- /dev/null
+++ b/tests/fdtfactor_test.its
@@ -0,0 +1,109 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/dts-v1/;
+
+/ {
+	description = "Test FIT image for fdtfactor";
+	#address-cells = <1>;
+
+	images {
+		kernel-1 {
+			description = "Unavailable";
+			data = /incbin/("fdtfactor_board1.test.dtb");
+			type = "kernel_noload";
+			arch = "arm64";
+			os = "linux";
+			compression = "none";
+			load = <0>;
+			entry = <0>;
+		};
+		fdt-1 {
+			description = "fdtfactor_board1.test.dtb";
+			data = /incbin/("fdtfactor_board1.test.dtb");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "none";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-2 {
+			description = "fdtfactor_board2.test.dtb";
+			data = /incbin/("fdtfactor_board2.test.dtb");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "none";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-3 {
+			description = "fdtfactor_board3.test.dtb";
+			data = /incbin/("fdtfactor_board3.test.dtb");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "none";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-4 {
+			description = "fdtfactor_other1.test.dtb";
+			data = /incbin/("fdtfactor_other1.test.dtb");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "none";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-5 {
+			description = "fdtfactor_other2.test.dtb";
+			data = /incbin/("fdtfactor_other2.test.dtb");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "none";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-ovl-1 {
+			description = "overlay_overlay_phandle.test.dtb";
+			data = /incbin/("overlay_overlay_phandle.test.dtb");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "none";
+		};
+	};
+	configurations {
+		default = "conf-1";
+		conf-1 {
+			description = "board-meta-1";
+			kernel = "kernel-1";
+			fdt = "fdt-1";
+			compatible = "vendor,board1", "vendor,common";
+		};
+		conf-2 {
+			description = "board-meta-2";
+			kernel = "kernel-1";
+			fdt = "fdt-2";
+		};
+		conf-3 {
+			description = "board-meta-3";
+			kernel = "kernel-1";
+			fdt = "fdt-3", "fdt-ovl-1";
+			compatible = "vendor,board3", "vendor,common";
+		};
+		conf-4 {
+			description = "board-meta-4";
+			kernel = "kernel-1";
+			fdt = "fdt-4";
+			compatible = "vendor,other1", "vendor,other";
+		};
+		conf-5 {
+			description = "board-meta-5";
+			kernel = "kernel-1";
+			fdt = "fdt-5";
+			compatible = "vendor,other2", "vendor,other";
+		};
+	};
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 92edec8b724c..70a2f5ef6d97 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -1177,6 +1177,69 @@ fdtoverlay_tests() {
 	    run_wrap_test check_dtb_recreated \
 		fdtfactor_board1.test.dtb "fdtfactor_board1.${ext}_recreated.test.dtb"
 	done
+
+	# Compiled FIT image mode (2 families with <50% node-path overlap: 3 boards + 2 boards)
+	run_dtc_test -@ -L -I dts -O dtb -o fdtfactor_other1.test.dtb "$SRCDIR/fdtfactor_other1.dts"
+	run_dtc_test -@ -L -I dts -O dtb -o fdtfactor_other2.test.dtb "$SRCDIR/fdtfactor_other2.dts"
+
+	run_dtc_test -i . -I dts -O dtb -o fdtfactor_in.test.fit "$SRCDIR/fdtfactor_test.its"
+	run_wrap_test $PYTHON "$FDTFACTOR" -v --verify \
+	    -f fdtfactor_in.test.fit -F fdtfactor.test.fit
+	run_fdtget_test "fdtfactor_board-base.dtb" fdtfactor.test.fit /images/fdt-base-1 description -ts
+	run_fdtget_test "fdtfactor_other-base.dtb" fdtfactor.test.fit /images/fdt-base-2 description -ts
+	run_fdtget_test "fdtfactor_board1.test.dtbo" fdtfactor.test.fit /images/fdt-1 description -ts
+	run_fdtget_test "fdtfactor_board2.test.dtbo" fdtfactor.test.fit /images/fdt-2 description -ts
+	run_fdtget_test "fdtfactor_board3.test.dtbo" fdtfactor.test.fit /images/fdt-3 description -ts
+	run_fdtget_test "fdtfactor_other1.test.dtbo" fdtfactor.test.fit /images/fdt-4 description -ts
+	run_fdtget_test "fdtfactor_other2.test.dtbo" fdtfactor.test.fit /images/fdt-5 description -ts
+	run_wrap_test test -n "$($DTGET fdtfactor.test.fit /images/fdt-base-1/hash-1 value -tx)"
+	run_wrap_test test -n "$($DTGET fdtfactor.test.fit /images/fdt-1/hash-1 value -tx)"
+	run_fdtget_test "fdt-base-1 fdt-1" fdtfactor.test.fit /configurations/conf-1 fdt -ts
+	run_fdtget_test "fdt-base-1 fdt-2" fdtfactor.test.fit /configurations/conf-2 fdt -ts
+	run_fdtget_test "fdt-base-1 fdt-3 fdt-ovl-1" fdtfactor.test.fit /configurations/conf-3 fdt -ts
+	run_fdtget_test "fdt-base-2 fdt-4" fdtfactor.test.fit /configurations/conf-4 fdt -ts
+	run_fdtget_test "fdt-base-2 fdt-5" fdtfactor.test.fit /configurations/conf-5 fdt -ts
+	run_fdtget_test "overlay_overlay_phandle.test.dtb" fdtfactor.test.fit /images/fdt-ovl-1 description -ts
+	run_fdtget_test "board-meta-1" fdtfactor.test.fit /configurations/conf-1 description -ts
+	run_fdtget_test "vendor,board1 vendor,common" fdtfactor.test.fit /configurations/conf-1 compatible -ts
+	run_fdtget_test "vendor,board2 vendor,common" fdtfactor.test.fit /configurations/conf-2 compatible -ts
+	run_fdtget_test "vendor,other2 vendor,other" fdtfactor.test.fit /configurations/conf-5 compatible -ts
+
+	# --single-base-dtb combines all boards (even with <50% overlap) into 1 base DTB
+	run_wrap_test $PYTHON "$FDTFACTOR" --verify -S --single-base-dtb \
+	    -f fdtfactor_in.test.fit -F fdtfactor_single.test.fit
+	run_fdtget_test "kernel-1\nfdt-base-1\nfdt-1\nfdt-2\nfdt-3\nfdt-4\nfdt-5\nfdt-ovl-1" \
+	    fdtfactor_single.test.fit -l /images
+	run_fdtget_test "fdtfactor-base.dtb" fdtfactor_single.test.fit /images/fdt-base-1 description -ts
+	run_fdtget_test "fdt-base-1 fdt-5" fdtfactor_single.test.fit /configurations/conf-5 fdt -ts
+
+	# --single-base-dtb fails when flat_dt nodes have mismatched arch/headers
+	cp fdtfactor_in.test.fit fdtfactor_mismatch.test.fit
+	run_wrap_test $DTPUT -ts fdtfactor_mismatch.test.fit /images/fdt-5 arch arm
+	run_wrap_error_test $PYTHON "$FDTFACTOR" --verify --single-base-dtb \
+	    -f fdtfactor_mismatch.test.fit -F fdtfactor_single_fail.test.fit
+
+	# Compressed (.dtb.lz4) FIT image mode (fdtfactor_board{1,2,3}.test.dtb.lz4
+	# were already generated by the compressed test loop above)
+	if command -v lz4 >/dev/null 2>&1; then
+	    run_wrap_test lz4 -12 -q -f -m \
+		fdtfactor_other1.test.dtb fdtfactor_other2.test.dtb overlay_overlay_phandle.test.dtb
+	    sed -e 's/\.test\.dtb/.test.dtb.lz4/g' \
+		-e 's/compression = "none"/compression = "lz4"/g' \
+		-e 's/description = "fdtfactor_other1/description = "soc99-alpha/' \
+		-e 's/description = "fdtfactor_other2/description = "soc99-beta/' \
+		"$SRCDIR/fdtfactor_test.its" > fdtfactor_lz4.test.its
+	    run_dtc_test -I dts -O dtb -o fdtfactor_lz4.test.fit fdtfactor_lz4.test.its
+	    run_wrap_test $PYTHON "$FDTFACTOR" --verify \
+		-f fdtfactor_lz4.test.fit
+	    run_fdtget_test "lz4" fdtfactor_lz4.test.fit /images/fdt-base-1 compression -ts
+	    run_fdtget_test "lz4" fdtfactor_lz4.test.fit /images/fdt-base-2 compression -ts
+	    run_fdtget_test "fdtfactor_board-base.dtb.lz4" fdtfactor_lz4.test.fit /images/fdt-base-1 description -ts
+	    run_fdtget_test "soc99-base.dtb.lz4" fdtfactor_lz4.test.fit /images/fdt-base-2 description -ts
+	    run_fdtget_test "fdtfactor_board1.test.dtbo.lz4" fdtfactor_lz4.test.fit /images/fdt-1 description -ts
+	    run_fdtget_test "fdt-base-1 fdt-3 fdt-ovl-1" fdtfactor_lz4.test.fit /configurations/conf-3 fdt -ts
+	    run_fdtget_test "fdt-base-2 fdt-5" fdtfactor_lz4.test.fit /configurations/conf-5 fdt -ts
+	fi
     fi
 }
 
@@ -1228,9 +1291,9 @@ if [ -z "$TESTSETS" ]; then
 fi
 
 # Make sure we don't have stale blobs lying around
-rm -f *.test.dtb *.test.dtbo *.test.dts *.test.dtb.gz *.test.dtbo.gz \
-    *.test.dtb.xz *.test.dtbo.xz *.test.dtb.lzma *.test.dtbo.lzma \
-    *.test.dtb.lz4 *.test.dtbo.lz4
+rm -f *.test.dtb *.test.dtbo *.test.dts *.test.its *.test.fit \
+    *.test.dtb.gz *.test.dtbo.gz *.test.dtb.xz *.test.dtbo.xz \
+    *.test.dtb.lzma *.test.dtbo.lzma *.test.dtb.lz4 *.test.dtbo.lz4
 
 for set in $TESTSETS; do
     case $set in
-- 
2.56.0.176.g3575e65682-goog

