Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793570649;
	b=Ky5lvyq4uWySbeeAmXCoCzS9JYw6G8pm0/eT+wPmt43Lv7DPH1nVFmnmwKw2tSgDN5Q1
	 625s9QKl+dMZjtc84mXc6h5WyGdDaz26hVGZ9aa3N1EIN5GfyCXtDpOy0ZY/HLkFTHPPZ
	 icrplY61k7G/4BbRH1KR5LgejpwmvMChjtMcmqLNRtC/TCk/X70kXZ6qt1VP3E86hcwOk
	 dHQH0G6QQ+xJUM10OtmvBXcv7yErthRGDKL0z/8LCyx3AI48jb3uUx+bK615vMkMRYCrk
	 4M2CnUjBhZmXTEYIx64JfMwV+vElSsv6og/zGgVzbj7CmuPiCOoNp58kDmuErH5prBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793570649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=9dYa6gWDl5XnXT8Hdi59TfXD4gUPeAoP5bjZ58v3kEM=;
	b=khH15zR/oqzIO5LTt5D7U5Z3VFDZAy4JLzka+tIvPXwJmWLGmSgU4HCMP3/QyxVHG5pN
	 gYiDlwa0HoAcjQfE2CT25y3W6oLP0LORKAiD9lVS5G4wnyCepqdgqviSnWZ5Wi58snrbM
	 QNYep0U1lZlLD5o76zpv+Q/jUarxx+T2652Bxk7r5jR1jeXnZuBvcnhOIQ5UGL2VSTfjZ
	 NZAarJW/SLZB+JnuscOxuEkUcNRhppmtwjUN45hJ8C0ynz+ezvKPsmmfKfdVc/xiDtdPh
	 EqtPOA6GdzP8GdfzfwpDuFS0bkT/ZXiHZ0Re6RHtHgU6zPL7WKzn0BX4GmuAveH7E4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="baLq/vBb";
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D0A606A332
	for <Devicetree-compiler@vger.kernel.org>; Sun,  1 Nov 2026 22:04:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7D0A606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=baLq/vBb
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36661f953e4so3774542eec.1
        for <Devicetree-compiler@vger.kernel.org>; Sun, 01 Nov 2026 14:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793570648; x=1794175448; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9dYa6gWDl5XnXT8Hdi59TfXD4gUPeAoP5bjZ58v3kEM=;
        b=baLq/vBbAbon88GYDAEAY04QnHf8IVXqI0b601nyGXx0b/JzQjGrd/kX+8i0H1xZFv
         8YJhTIuKZsRU7+atq3DJNu2BkpDywL8URDw/QURJt9v6zgcPnQ82D+SJJAruWNo7IKv5
         dmuvTNwVuCfBooLCqKz/giOEBG8BBO0Qwd0EI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793570648; x=1794175448;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9dYa6gWDl5XnXT8Hdi59TfXD4gUPeAoP5bjZ58v3kEM=;
        b=aWymN+VliQc1QBkQ3H9hgzKjnEVR6YnhLyJoNvdsJe6JTNt3/fMs9s8ec3Fqi8uCcW
         y9+0c4W/KWyTY+n1jlA4hefKaEAs///YfJp998WCsdsQFbm5Jc919TMWDNeL03lUj3Wk
         68MFj553veV6gjjP3CnVmupnnNNl84d2YXPyYj+8ftLYd3OF72XpbF9jjZpxxtjxjoJT
         iKKBvLidkGnIyp/IpypYMddiVBMkwCb0FoSTd94CSafyMRcnUE6VhsKGudPplibrZZaD
         sbFo/oBIFVmPIa0cTIBD7FsMGac+gRYY/yKWqP68UieNRYZgZJxbrJLKlGZ8NJZmzNio
         xsng==
X-Gm-Message-State: AFq9FYKxR9+TePDi2t8riK03cR5+4Z1fxMtrMyLYs+PUT9VxIuW9Trfw
	yBZOqFF7aL9ZBhZ9HMPt8G58wvzcEiWSNAK2NMJIBsCk2Y/alg4EIIgGcSb/vA+7pJuEkpmJ3Qj
	wmHm0IA56
X-Gm-Gg: AYBFou0JKHGy61TqC88XUEQNVJE28ELQznIfVAVuDzlybuPCKs842SO46HOELC5erd5
	9r92uK239cVI/u/Zr50FrTFOhwdQLla7sjR958HLohbHMnXJig+YGPnbw1N7xDkmOV0UoYn4rG7
	b/rh5GObAOVL2w5Yn5PV1TmcIlyJHKYQNzc4j5I5bVzmpjcuVGfL4d/KwBq+4FRsf7/RBmuSuK/
	pzDu5bbmACwIFresIyMK18Ka3ktgF4UJJZtXo9InixfK8Vm8gGtBLtHB46id8PdbSF86kjuL06g
	GVaMKJwJjIy8Ei5vGKymvizoTt61BSKjp+ocApPbQ1MfVsvCHDHEI/WJ0cCIlCyxPWWwQXEylmm
	3+wEagrwJKT4KVFWUkaX2wHNRUJ9v+mM7TNIJRaAwi/cFRqj99fgBL820OgTyANAUvCzp4jG5ap
	WQW7QvKsRw5GmzBKxs+kwDqDpSBY/tBtfiMS8mheADKjQ7z9oTwcZX14muSPB+ja555vKg94fKK
	e5MsrXbBVIVpFQUU5eq468VOdRO4GfFtE2kyGodSooynv6/3D0zZnweO670BRcWkYGl9GSl8mxs
	kfWMdl1PFiGvLNd2eVrobqTqE7WGrMuePWOMKJQ9isB+qBbONhz1CK3glO+TMASaXmFcpGXgv8c
	jxqT1XiTgh3tiew==
X-Received: by 2002:a05:7022:1707:b0:1a1:8bac:c1c1 with SMTP id a92af1059eb24-1ac5bbb9059mr11446826c88.15.1793570647361;
        Sun, 01 Nov 2026 14:04:07 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:cbd8:5ca8:653a:11f9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b106edc7f8sm11097266c88.9.2026.11.01.14.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:04:06 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Devicetree@vger.kernel.org,
	Simon Glass <sjg@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	Brian Norris <briannorris@chromium.org>,
	linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v3 15/15] fdtfactor: Add compiled FIT factoring support
Date: Sun,  1 Nov 2026 14:01:22 -0800
Message-ID: <20261101220224.1436242-16-dianders@chromium.org>
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
In-Reply-To: <20261101220224.1436242-1-dianders@chromium.org>
References: <20261101220224.1436242-1-dianders@chromium.org>
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Bootloaders such as depthcharge on Chromebooks and U-Boot use Flattened
Image Trees (FITs) to bundle a kernel image with multiple board FDT
blobs (`fdt-1`, `fdt-2`, ...) and per-board configuration nodes.

Add `-F`/`--fit`, `--outfile`, and `--single-base-dtb` options to
`fdtfactor` to factor a compiled FIT directly:

- Parse non-overlay `type = "flat_dt"` nodes under `/images`,
  decompressing their `data` blobs according to their `compression`
  property (`none`, `lz4`, `lzma`, `xz`, `gzip`).
- Reject FITs containing `signature*` subnodes under `/images/*` or
  `/configurations/*`, as modifying FDT blobs and configurations would
  invalidate cryptographic signatures.
- Partition the `flat_dt` blobs into compatible factor groups (by
  compression, architecture, FDT header fields, and node-path overlap)
  so a single FIT containing multiple board/SoC families produces a
  separate `fdt-base-1`, `fdt-base-2`, etc. for each family.
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

Add uncompressed, LZ4-compressed multi-family, signed-FIT rejection, and
`--single-base-dtb` FIT test cases to the `fdtfactor` test suite.

Reviewed-by: Simon Glass <sjg@chromium.org>
Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- Use "FIT" instead of "FIT image" in documentation, comments, and
  commit messages (Simon Glass)
- Update for DeviceTree and --output-base-dtb (Simon Glass, David
  Gibson)

Changes in v2:
- Rename -f/--fit and -F/--fit-out to -F/--fit and --outfile and clarify
  FIT mode in the --help description (David Gibson, Simon Glass)
- Reject signed FIT images with signature* subnodes (Simon Glass)
- Use '<base-node-name>.dtb' for FIT base FDT descriptions instead of
  common-prefix heuristics (Simon Glass)
- Compare FIT group node overlap against the group's common node set
  instead of only the first entry (Simon Glass)
- Document in README.md that U-Boot's boot_get_fdt_fit() currently
  requires FIT overlays to be uncompressed (Simon Glass)

 README.md                  |  17 ++
 fdtfactor                  | 577 +++++++++++++++++++++++++++++++++++--
 tests/Makefile.tests       |   2 +-
 tests/fdtfactor_lz4.its    | 109 +++++++
 tests/fdtfactor_other1.dts |  33 +++
 tests/fdtfactor_other2.dts |  33 +++
 tests/fdtfactor_test.its   | 109 +++++++
 tests/run_tests.sh         | 158 +++++++++-
 8 files changed, 1011 insertions(+), 27 deletions(-)
 create mode 100644 tests/fdtfactor_lz4.its
 create mode 100644 tests/fdtfactor_other1.dts
 create mode 100644 tests/fdtfactor_other2.dts
 create mode 100644 tests/fdtfactor_test.its

diff --git a/README.md b/README.md
index a3d1ad8c58f3..7e2b99818730 100644
--- a/README.md
+++ b/README.md
@@ -129,6 +129,7 @@ Basic usage:
 
 ```
 $ fdtfactor -o out_dir board1.dtb board2.dtb board3.dtb
+$ fdtfactor -F image.fit --outfile image.factored.fit
 ```
 
 Options:
@@ -144,6 +145,22 @@ Options:
 * `-o`, `--outdir`: Output directory for generated `.dtbo` files and
   `--output-base-dtb` (default: alongside each input `.dtb` for `.dtbo` files,
   current directory for `--output-base-dtb`).
+* `-F`, `--fit`: Factor `/images/fdt-*` blobs inside a compiled FIT
+  (creating `/images/fdt-base-1`, `/images/fdt-base-2`, ... per compatible
+  board/SoC family grouped by FDT headers and `>= 50%` node-path overlap,
+  converting each `/images/fdt-N` node into a `.dtbo` overlay, updating
+  `/configurations/conf-*` `fdt` and `compatible` properties, and
+  recalculating `/images/*/hash-*` digests). Each factored base DTB and
+  `.dtbo` overlay preserves the `compression` setting of its `/images/fdt-*`
+  node (note: while bootloaders such as depthcharge decompress compressed
+  FIT overlays, U-Boot's `boot_get_fdt_fit()` currently only decompresses
+  the base DTB and requires FIT overlays to be uncompressed). Signed FITs
+  with `signature*` subnodes are rejected because modifying FDT blobs
+  and configurations would invalidate cryptographic signatures.
+* `--outfile`: Output FIT path when `--fit` is used (default:
+  overwrite `--fit` in place).
+* `--single-base-dtb`: Force a single `/images/fdt-base-1` across all FDTs
+  in `--fit` mode rather than grouping by node-path overlap.
 * `-S`, `--strip-local-fixups`: Omit `/__local_fixups__` from the generated
   `base.dtb` and final reconstructed device trees. By default, `fdtfactor`
   preserves `/__local_fixups__` on `base.dtb` so that when `fdt_overlay_apply()`
diff --git a/fdtfactor b/fdtfactor
index 9bc8bfde2038..379a27da139d 100755
--- a/fdtfactor
+++ b/fdtfactor
@@ -8,16 +8,25 @@ properties shared across the inputs into a single common `base.dtb` and emits a
 small per-board `.dtbo` overlay for each input. Applying a board's `.dtbo` to
 `base.dtb` (e.g., via `fdtoverlay` or `fdt_overlay_apply()`) reconstructs the
 original board DTB.
+
+Alternatively, `fdtfactor -F <image.fit>` can rewrite a compiled U-Boot /
+ChromeOS Flattened Image Tree (FIT) in place (or to `--outfile`), factoring its
+embedded `/images/fdt-*` blobs into base DTBs (`fdt-base-1`, `fdt-base-2`, ...)
+and overlays while updating `/configurations/conf-*` `fdt` and `compatible`
+properties and recalculating `/images/*/hash-*` digests.
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
 
 import devicetree
 import libfdt
@@ -247,6 +256,10 @@ def _is_dtbo_overlay(fdt):
     )
 
 
+class OverlayBlobError(ValueError):
+    """Raised when an input FDT blob is already a `.dtbo` overlay."""
+
+
 class FactoredTree(devicetree.DeviceTree):
     """DeviceTree subclass with normalized phandle and fixup attributes.
 
@@ -283,17 +296,24 @@ class ParsedDtb:
       independent of numeric phandle numbering.
     """
 
-    def __init__(self, filename):
-        """Parse an input FDT file into a normalized FactoredTree.
+    def __init__(self, filename, file_bytes=None, comp=None):
+        """Parse an input FDT file or blob into a normalized FactoredTree.
 
         Args:
-            filename: File path of the `.dtb` (or compressed `.dtb.*`) file.
+            filename: File path (or display name when `file_bytes` is given).
+            file_bytes: Optional raw (compressed or uncompressed) FDT bytes; if
+                None, read from `filename`.
+            comp: Optional explicit compression algorithm name, or None to
+                auto-detect via `decompress_blob()`.
         """
         self.filename = filename
-        with open(filename, 'rb') as f:
-            file_bytes = f.read()
+        if file_bytes is None:
+            with open(filename, 'rb') as f:
+                file_bytes = f.read()
         self.compressed_size = len(file_bytes)
-        raw_bytes, self.compression = decompress_blob(file_bytes, filename)
+        raw_bytes, self.compression = decompress_blob(
+            file_bytes, filename, comp=comp
+        )
         self.raw_bytes = raw_bytes
 
         try:
@@ -303,7 +323,7 @@ class ParsedDtb:
             raise ValueError(f'{filename}: Invalid FDT blob ({exc})') from exc
 
         if _is_dtbo_overlay(fdt):
-            raise ValueError(
+            raise OverlayBlobError(
                 f'{filename}: Input is already a DTB overlay (.dtbo)'
             )
 
@@ -885,6 +905,460 @@ def create_base_dtb_and_overlays(dtbs, strip_local_fixups=False):
     return base_dtb_blob, dtbo_blobs
 
 
+# ---------------------------------------------------------------------------
+# Compiled FIT factoring (targeting depthcharge / coreboot / U-Boot)
+# ---------------------------------------------------------------------------
+
+def _compute_fit_hash(algo_name, data_bytes):
+    """Compute a binary hash digest for a FIT `hash*` subnode.
+
+    Args:
+        algo_name: Hash algorithm name (e.g., `'crc32'`, `'sha1'`, `'sha256'`).
+        data_bytes: Input `bytes` to hash.
+
+    Returns:
+        Binary hash digest `bytes`.
+    """
+    if algo_name == 'crc32':
+        return struct.pack('>I', zlib.crc32(data_bytes) & 0xffffffff)
+    h = hashlib.new(algo_name)
+    h.update(data_bytes)
+    return h.digest()
+
+
+def _update_fit_hashes(img_node):
+    """Recompute `value` properties on any FIT `hash*` subnodes of `img_node`.
+
+    Args:
+        img_node: `DeviceTree` for a `/images/*` subnode whose `hash*` child
+            nodes should be updated in place from `img_node.props['data']`.
+    """
+    data_prop = img_node.props.get('data')
+    if data_prop is None:
+        return
+    data_bytes = bytes(data_prop)
+    for sub_name, sub_node in img_node.children.items():
+        if not sub_name.startswith('hash'):
+            continue
+        if 'algo' not in sub_node.props:
+            raise ValueError(
+                f'FIT hash subnode {sub_name!r} lacks an algo property'
+            )
+        algo = sub_node.get_str('algo')
+        sub_node.props['value'] = libfdt.Property(
+            'value', _compute_fit_hash(algo, data_bytes)
+        )
+
+
+def _is_dtb_filename_desc(desc):
+    """Return True if `desc` looks like a `.dtb` filename.
+
+    Args:
+        desc: Description string from a FIT `/images/fdt-*` node.
+
+    Returns:
+        True if `desc` has no spaces and ends with `.dtb` (optionally followed
+        by a recognized compression suffix), False otherwise.
+    """
+    if not desc or ' ' in desc:
+        return False
+    _, stem, desc_comp = split_dtb_filename(desc)
+    return os.path.basename(desc) == f'{stem}.dtb{COMP_TO_EXT[desc_comp]}'
+
+
+def group_fit_dtbs(fdt_entries):
+    """Partition FIT `flat_dt` entries into compatible factor groups.
+
+    DTBs are grouped by `(compression, arch, load, entry, boot_cpuid_phys,
+    mem_rsv)` and node-path overlap (>= 50%) against the group's common node
+    set so that a single FIT containing multiple board/SoC families
+    produces one base DTB per family.
+
+    Args:
+        fdt_entries: Sequence of FIT `flat_dt` entry dicts from
+            `_extract_fit_fdt_entries()`.
+
+    Returns:
+        List of entry-dict lists, one per compatible group.
+    """
+    groups = []
+    for entry in fdt_entries:
+        dtb = entry['dtb']
+        header_key = (
+            dtb.compression,
+            *(entry['node'].props.get(p) for p in ('arch', 'load', 'entry')),
+            dtb.boot_cpuid_phys,
+            dtb.mem_rsv,
+        )
+        entry_nodes = {path for path, _ in dtb.root.walk()}
+
+        placed = False
+        for grp in groups:
+            if grp['key'] != header_key:
+                continue
+            common_nodes = grp['common_nodes']
+            union_len = len(entry_nodes | common_nodes)
+            overlap = (
+                len(entry_nodes & common_nodes) / union_len
+                if union_len
+                else 1.0
+            )
+            if overlap >= 0.5:
+                grp['common_nodes'] &= entry_nodes
+                grp['entries'].append(entry)
+                placed = True
+                break
+
+        if not placed:
+            groups.append({
+                'key': header_key,
+                'common_nodes': set(entry_nodes),
+                'entries': [entry],
+            })
+
+    return [grp['entries'] for grp in groups]
+
+
+def _extract_fit_fdt_entries(fit_in_path, images_node, configs_node):
+    """Extract and parse non-overlay `flat_dt` entries from `/images`.
+
+    Args:
+        fit_in_path: Input FIT path (for error reporting).
+        images_node: `DeviceTree` for the FIT `/images` node.
+        configs_node: `DeviceTree` for the FIT `/configurations` node.
+
+    Returns:
+        List of dicts (`{'name', 'node', 'dtb'}`) for all non-overlay
+        `flat_dt` image subnodes.
+    """
+    if any(name.startswith('fdt-base-') for name in images_node.children):
+        raise ValueError(
+            f'{fit_in_path}: FIT already contains fdt-base-* node(s)'
+        )
+
+    for conf_name, conf_node in configs_node.children.items():
+        for sub_name in conf_node.children:
+            if sub_name.startswith(('signature', 'hash')):
+                raise ValueError(
+                    f'{fit_in_path}: /configurations/{conf_name}/{sub_name} '
+                    f'is not supported; sign the FIT after factoring'
+                )
+
+    fdt_entries = []
+    for img_name, img_node in images_node.children.items():
+        if ('data-offset' in img_node.props or
+                'data-position' in img_node.props):
+            raise ValueError(
+                f'{fit_in_path}: /images/{img_name} uses external data '
+                f'(data-offset/data-position), which is not supported'
+            )
+        for sub_name in img_node.children:
+            if sub_name.startswith('signature'):
+                raise ValueError(
+                    f'{fit_in_path}: /images/{img_name}/{sub_name} is not '
+                    f'supported; sign the FIT after factoring'
+                )
+        img_type = img_node.get_str('type') if 'type' in img_node.props else ''
+        if img_type != 'flat_dt':
+            continue
+        raw_data = img_node.props.get('data')
+        if raw_data is None:
+            raise ValueError(
+                f'{fit_in_path}: /images/{img_name} lacks a data property'
+            )
+        node_label = f'{fit_in_path}:/images/{img_name}'
+        comp_prop = (
+            img_node.get_str('compression')
+            if 'compression' in img_node.props
+            else 'none'
+        ) or 'none'
+        try:
+            parsed_dtb = ParsedDtb(
+                node_label, file_bytes=bytes(raw_data), comp=comp_prop
+            )
+        except OverlayBlobError:
+            continue
+
+        fdt_entries.append({
+            'name': img_name,
+            'node': img_node,
+            'dtb': parsed_dtb,
+        })
+
+    if len(fdt_entries) < 2:
+        raise ValueError(
+            'FIT must contain at least two non-overlay flat_dt '
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
+        fdt_entries: List of FIT `flat_dt` entry dicts from
+            `_extract_fit_fdt_entries()`.
+        single_base_dtb: If True, require all `fdt_entries` to share a single
+            base DTB group rather than grouping by node-path overlap.
+
+    Returns:
+        List of factorable entry-dict groups (each containing at least 2
+        entries).
+    """
+    if single_base_dtb:
+        ref_entry = fdt_entries[0]
+        for entry in fdt_entries[1:]:
+            if entry['dtb'].compression != ref_entry['dtb'].compression:
+                raise ValueError(
+                    f'--single-base-dtb requires all FIT flat_dt nodes to use '
+                    f'the same compression: {ref_entry["name"]} has '
+                    f'{ref_entry["dtb"].compression!r} vs {entry["name"]} '
+                    f'{entry["dtb"].compression!r}'
+                )
+            for prop in ('arch', 'load', 'entry'):
+                if (entry['node'].props.get(prop) !=
+                        ref_entry['node'].props.get(prop)):
+                    raise ValueError(
+                        f'--single-base-dtb requires all FIT flat_dt nodes to '
+                        f'use the same {prop} property: {ref_entry["name"]} vs '
+                        f'{entry["name"]}'
+                    )
+        return [fdt_entries]
+
+    groups = group_fit_dtbs(fdt_entries)
+    factorable_groups = [g for g in groups if len(g) >= 2]
+    if not factorable_groups:
+        raise ValueError(
+            'FIT must contain at least two compatible '
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
+def _factor_fit_group(entries, base_dtb_node_name, strip_local_fixups):
+    """Factor one compatible group of FIT `flat_dt` entries.
+
+    Args:
+        entries: List of FIT `flat_dt` entry dicts in this compatible group.
+        base_dtb_node_name: Name for the new `/images/<base_dtb_node_name>`
+            node (e.g., `'fdt-base-1'`).
+        strip_local_fixups: If True, omit `/__local_fixups__` from the
+            generated base DTB.
+
+    Returns:
+        Tuple of `(base_dtb_node, stat_args)` where `base_dtb_node` is the
+        constructed `DeviceTree` for `/images/<base_dtb_node_name>` and
+        `stat_args` is an argument tuple for `_print_dtb_stats()`.
+    """
+    group_dtbs = [e['dtb'] for e in entries]
+    comp = group_dtbs[0].compression
+
+    base_dtb_blob, dtbo_blobs = create_base_dtb_and_overlays(
+        group_dtbs,
+        strip_local_fixups=strip_local_fixups,
+    )
+
+    base_dtb_comp_bytes = compress_blob(
+        base_dtb_blob, comp, filename=f'/images/{base_dtb_node_name}'
+    )
+    base_dtb_node = copy.deepcopy(entries[0]['node'])
+    for prop in ('phandle', 'compatible'):
+        base_dtb_node.props.pop(prop, None)
+    base_dtb_node.children = {
+        k: v
+        for k, v in base_dtb_node.children.items()
+        if k.startswith('hash')
+    }
+    for sub_node in base_dtb_node.children.values():
+        sub_node.props.pop('phandle', None)
+    if 'description' in base_dtb_node.props:
+        base_dtb_node.set_str(
+            'description',
+            f'{base_dtb_node_name}.dtb{COMP_TO_EXT[comp]}',
+        )
+    base_dtb_node.props['data'] = libfdt.Property('data', base_dtb_comp_bytes)
+    if 'compression' in base_dtb_node.props or comp != 'none':
+        comp_prop = 'lz4' if comp == 'lz4_legacy' else comp
+        base_dtb_node.set_str('compression', comp_prop)
+    _update_fit_hashes(base_dtb_node)
+
+    dtbo_comp_sizes = []
+    for entry, dtbo_blob in zip(entries, dtbo_blobs):
+        img_node = entry['node']
+        dtbo_comp_bytes = compress_blob(
+            dtbo_blob, comp, filename=f'/images/{entry["name"]}'
+        )
+        dtbo_comp_sizes.append(len(dtbo_comp_bytes))
+
+        if 'description' in img_node.props:
+            old_desc = img_node.get_str('description')
+            if _is_dtb_filename_desc(old_desc):
+                img_node.set_str(
+                    'description',
+                    get_dtbo_output_path(old_desc, None, comp=comp),
+                )
+
+        # Strip 'load' and 'entry' from overlay image nodes so bootloaders do
+        # not load overlays at the base FDT address and overwrite the base FDT.
+        for prop in ('load', 'entry'):
+            img_node.props.pop(prop, None)
+
+        img_node.props['data'] = libfdt.Property('data', dtbo_comp_bytes)
+        _update_fit_hashes(img_node)
+
+    stat_args = (
+        group_dtbs,
+        base_dtb_blob,
+        dtbo_blobs,
+        comp,
+        len(base_dtb_comp_bytes),
+        dtbo_comp_sizes,
+        f'[{base_dtb_node_name}] ',
+    )
+    return base_dtb_node, stat_args
+
+
+def _update_fit_images_and_configs(images_node, configs_node,
+                                   insert_before_first, fdt_to_base_dtb):
+    """Insert `fdt-base-*` nodes into `/images` and update `/configurations`.
+
+    Args:
+        images_node: `DeviceTree` for `/images` (mutated in place).
+        configs_node: `DeviceTree` for `/configurations` (mutated in place).
+        insert_before_first: Dict mapping the first `fdt-*` subnode name of
+            each group to `(base_dtb_node_name, base_dtb_node)`.
+        fdt_to_base_dtb: Dict mapping each factored `fdt-*` subnode name to
+            `(base_dtb_node_name, orig_parsed_dtb)`.
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
+        if 'fdt' not in conf_node.props:
+            continue
+        fdt_list = conf_node.get_stringlist('fdt')
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
+            conf_node.set_stringlist('fdt', [base_dtb_name] + fdt_list)
+            # If the configuration omitted 'compatible' (relying on the
+            # bootloader reading root 'compatible' from fdt_list[0]), copy the
+            # board's root 'compatible' property onto the configuration node
+            # now that fdt_list[0] is the shared base DTB.
+            if 'compatible' not in conf_node.props:
+                root_compat = orig_dtb.root.props.get('compatible')
+                if root_compat is not None:
+                    conf_node.props['compatible'] = copy.copy(root_compat)
+
+
+def factor_fit(fit_in_path, fit_out_path, strip_local_fixups=False,
+               single_base_dtb=False, stats=False):
+    """Factor all `flat_dt` images in a compiled FIT into base + overlays.
+
+    Args:
+        fit_in_path: Path to the input compiled FIT.
+        fit_out_path: Path where the factored FIT should be written.
+        strip_local_fixups: If True, omit `/__local_fixups__` from generated
+            base DTBs.
+        single_base_dtb: If True, force all `flat_dt` nodes into a single
+            `fdt-base-1` base DTB.
+        stats: If True, print per-group and overall FIT size savings.
+    """
+    with open(fit_in_path, 'rb') as f:
+        orig_fit_bytes = f.read()
+
+    try:
+        orig_fit_fdt = libfdt.FdtRo(orig_fit_bytes)
+        libfdt.check_err(
+            libfdt.fdt_check_full(orig_fit_fdt._fdt, len(orig_fit_bytes))
+        )
+    except libfdt.FdtException as exc:
+        raise ValueError(f'{fit_in_path}: Invalid FDT blob ({exc})') from exc
+
+    fit_root = devicetree.DeviceTree.unflatten(orig_fit_fdt)
+    images_node = fit_root.children.get('images')
+    configs_node = fit_root.children.get('configurations')
+    if images_node is None or configs_node is None:
+        raise ValueError(
+            f'{fit_in_path}: FIT must contain /images and '
+            f'/configurations nodes'
+        )
+
+    fdt_entries = _extract_fit_fdt_entries(
+        fit_in_path, images_node, configs_node
+    )
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
+        base_dtb_node, stat_args = _factor_fit_group(
+            entries, base_dtb_node_name, strip_local_fixups
+        )
+        insert_before_first[entries[0]['name']] = (
+            base_dtb_node_name, base_dtb_node
+        )
+        for entry in entries:
+            fdt_to_base_dtb[entry['name']] = (base_dtb_node_name, entry['dtb'])
+        group_stats.append(stat_args)
+
+    _update_fit_images_and_configs(
+        images_node, configs_node, insert_before_first, fdt_to_base_dtb
+    )
+
+    new_fit_fdt = fit_root.flatten(
+        mem_rsv=orig_fit_fdt.get_mem_rsv_list(),
+        boot_cpuid_phys=orig_fit_fdt.boot_cpuid_phys(),
+    )
+    new_fit_bytes = bytes(new_fit_fdt.as_bytearray())
+
+    out_dir = os.path.dirname(fit_out_path)
+    if out_dir:
+        os.makedirs(out_dir, exist_ok=True)
+    with open(fit_out_path, 'wb') as f:
+        f.write(new_fit_bytes)
+
+    if stats:
+        for stat_args in group_stats:
+            _print_dtb_stats(*stat_args)
+        fit_saved = len(orig_fit_bytes) - len(new_fit_bytes)
+        fit_pct = (
+            (fit_saved / len(orig_fit_bytes) * 100.0) if orig_fit_bytes else 0.0
+        )
+        print(
+            f'FIT total: {len(orig_fit_bytes):,} B -> '
+            f'{len(new_fit_bytes):,} B '
+            f'(saved {fit_saved:,} B / {fit_pct:.1f}%)'
+        )
+
+
 def get_dtbo_output_path(dtb_path, outdir, comp='none'):
     """Determine the output `.dtbo[.comp]` file path for an input `.dtb` path.
 
@@ -917,13 +1391,15 @@ def parse_args(argv=None):
     parser = argparse.ArgumentParser(
         description=(
             'Split a set of compiled device tree blobs (.dtb, or compressed '
-            '.dtb.lz4/.xz/.lzma/.gz) into a single common base .dtb and '
-            'per-board overlay blobs (.dtbo).'
+            '.dtb.lz4/.xz/.lzma/.gz) into a common base .dtb and per-board '
+            'overlay blobs (.dtbo), or update a compiled FIT '
+            '(-F/--fit) in-place (or to --outfile) by factoring its '
+            '/images/fdt-* blobs into base DTBs and overlays.'
         )
     )
     parser.add_argument(
         '--output-base-dtb',
-        default='base.dtb',
+        default=None,
         metavar='FILENAME',
         help=(
             'Output common base .dtb (or .dtb.lz4/.xz/.lzma/.gz) filename '
@@ -950,6 +1426,23 @@ def parse_args(argv=None):
             'current directory for --output-base-dtb)'
         ),
     )
+    parser.add_argument(
+        '-F', '--fit',
+        default=None,
+        metavar='FIT_FILE',
+        help=(
+            'Input compiled FIT (.fit / .itb) to factor (updated '
+            'in-place unless --outfile is specified)'
+        ),
+    )
+    parser.add_argument(
+        '--outfile',
+        default=None,
+        metavar='FIT_OUT',
+        help=(
+            'Output path for the factored FIT (default: overwrite --fit)'
+        ),
+    )
     parser.add_argument(
         '-S', '--strip-local-fixups',
         action='store_true',
@@ -958,6 +1451,15 @@ def parse_args(argv=None):
             'reconstructed device trees'
         ),
     )
+    parser.add_argument(
+        '--single-base-dtb',
+        action='store_true',
+        help=(
+            'Force all flat_dt nodes in a FIT (-F/--fit) to be '
+            'factored into a single fdt-base-1 base DTB, failing only if '
+            'headers, arch, or compression differ'
+        ),
+    )
     parser.add_argument(
         '-s', '--stats',
         action='store_true',
@@ -965,26 +1467,40 @@ def parse_args(argv=None):
     )
     parser.add_argument(
         'dtbs',
-        nargs='+',
+        nargs='*',
         metavar='DTB',
         help=(
-            'Input .dtb (or compressed .dtb.lz4/.xz/.lzma/.gz) files '
-            '(at least two required)'
+            'Input .dtb (or compressed .dtb.lz4/.xz/.lzma/.gz) files (when '
+            '--fit is not used)'
         ),
     )
     args = parser.parse_args(argv)
-    if os.path.dirname(args.output_base_dtb):
-        parser.error(
-            '--output-base-dtb must be a filename without directory '
-            'components; use -o/--outdir to specify the output directory'
-        )
-    if len(args.dtbs) < 2:
-        parser.error('at least two input .dtb files are required')
+    if args.outfile and not args.fit:
+        parser.error('--outfile requires -F/--fit')
+    if args.single_base_dtb and not args.fit:
+        parser.error('--single-base-dtb requires -F/--fit')
+    if args.fit:
+        if (args.dtbs or args.output_base_dtb or args.outdir or
+                args.base_compression != 'auto'):
+            parser.error(
+                '-F/--fit cannot be combined with --output-base-dtb, '
+                '--base-compression, -o/--outdir, or positional DTB arguments'
+            )
+    else:
+        if args.output_base_dtb is None:
+            args.output_base_dtb = 'base.dtb'
+        if os.path.dirname(args.output_base_dtb):
+            parser.error(
+                '--output-base-dtb must be a filename without directory '
+                'components; use -o/--outdir to specify the output directory'
+            )
+        if len(args.dtbs) < 2:
+            parser.error('at least two input .dtb files are required')
     return args
 
 
 def _print_dtb_stats(dtbs, base_dtb_blob, dtbo_blobs, base_dtb_comp='none',
-                     base_dtb_csize=None, dtbo_csizes=None):
+                     base_dtb_csize=None, dtbo_csizes=None, prefix=''):
     """Print uncompressed and compressed size savings summary.
 
     Args:
@@ -994,6 +1510,7 @@ def _print_dtb_stats(dtbs, base_dtb_blob, dtbo_blobs, base_dtb_comp='none',
         base_dtb_comp: Compression format of the base DTB output.
         base_dtb_csize: Byte size of the compressed base DTB output.
         dtbo_csizes: Sequence of byte sizes of the compressed `.dtbo` outputs.
+        prefix: Optional line prefix (e.g., `'[fdt-base-1] '`).
     """
     orig_uncomp = sum(len(d.raw_bytes) for d in dtbs)
     base_dtb_uncomp = len(base_dtb_blob)
@@ -1002,7 +1519,7 @@ def _print_dtb_stats(dtbs, base_dtb_blob, dtbo_blobs, base_dtb_comp='none',
     saved_uncomp = orig_uncomp - new_uncomp
     pct_uncomp = (saved_uncomp / orig_uncomp * 100.0) if orig_uncomp else 0.0
     print(
-        f'Uncompressed DTBs: {len(dtbs)} files ({orig_uncomp:,} B) -> '
+        f'{prefix}Uncompressed DTBs: {len(dtbs)} files ({orig_uncomp:,} B) -> '
         f'base {base_dtb_uncomp:,} B + {len(dtbo_blobs)} overlays '
         f'{dtbo_uncomp:,} B = {new_uncomp:,} B '
         f'(saved {saved_uncomp:,} B / {pct_uncomp:.1f}%)'
@@ -1011,9 +1528,9 @@ def _print_dtb_stats(dtbs, base_dtb_blob, dtbo_blobs, base_dtb_comp='none',
     if any(c != 'none' for c in all_comps):
         comp_label = '/'.join(sorted(all_comps))
         hdr = (
-            f'Compressed ({comp_label}):'
+            f'{prefix}Compressed ({comp_label}):'
             if len(all_comps) == 1
-            else f'On-disk ({comp_label}):   '
+            else f'{prefix}On-disk ({comp_label}):   '
         )
         orig_comp = sum(d.compressed_size for d in dtbs)
         dtbo_csize = sum(dtbo_csizes)
@@ -1122,7 +1639,17 @@ def main(argv=None):
     """
     args = parse_args(argv)
     try:
-        factor_dtb_files(args)
+        if args.fit:
+            fit_out = args.outfile if args.outfile else args.fit
+            factor_fit(
+                args.fit,
+                fit_out,
+                strip_local_fixups=args.strip_local_fixups,
+                single_base_dtb=args.single_base_dtb,
+                stats=args.stats,
+            )
+        else:
+            factor_dtb_files(args)
     except (OSError, ValueError, RuntimeError, libfdt.FdtException) as exc:
         sys.exit(f'Error: {exc}')
     return 0
diff --git a/tests/Makefile.tests b/tests/Makefile.tests
index 300f244f41c5..a89bcde1f038 100644
--- a/tests/Makefile.tests
+++ b/tests/Makefile.tests
@@ -53,7 +53,7 @@ TESTS_DEPFILES = $(TESTS:%=%.d) \
 	$(addprefix $(TESTS_PREFIX),testutils.d)
 
 TESTS_CLEANFILES_L = $(STD_CLEANFILES) \
-	*.dtb *.test.dtbo *.test.dts *.test.dt.yaml *.dtsv1 \
+	*.dtb *.test.dtbo *.test.dts *.test.dt.yaml *.dtsv1 *.test.fit \
 	*.test.dtb.gz *.test.dtbo.gz *.test.dtb.xz *.test.dtbo.xz \
 	*.test.dtb.lzma *.test.dtbo.lzma *.test.dtb.lz4 *.test.dtbo.lz4 \
 	tmp.* *.bak \
diff --git a/tests/fdtfactor_lz4.its b/tests/fdtfactor_lz4.its
new file mode 100644
index 000000000000..3f862b19c759
--- /dev/null
+++ b/tests/fdtfactor_lz4.its
@@ -0,0 +1,109 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/dts-v1/;
+
+/ {
+	description = "Test LZ4 FIT for fdtfactor";
+	#address-cells = <1>;
+
+	images {
+		kernel-1 {
+			description = "Unavailable";
+			data = /incbin/("fdtfactor_board1.test.dtb.lz4");
+			type = "kernel_noload";
+			arch = "arm64";
+			os = "linux";
+			compression = "lz4";
+			load = <0>;
+			entry = <0>;
+		};
+		fdt-1 {
+			description = "fdtfactor_board1.test.dtb.lz4";
+			data = /incbin/("fdtfactor_board1.test.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-2 {
+			description = "fdtfactor_board2.test.dtb.lz4";
+			data = /incbin/("fdtfactor_board2.test.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-3 {
+			description = "fdtfactor_board3.test.dtb.lz4";
+			data = /incbin/("fdtfactor_board3.test.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-4 {
+			description = "fdtfactor_other1.test.dtb.lz4";
+			data = /incbin/("fdtfactor_other1.test.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-5 {
+			description = "fdtfactor_other2.test.dtb.lz4";
+			data = /incbin/("fdtfactor_other2.test.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-ovl-1 {
+			description = "overlay_overlay_phandle.test.dtb.lz4";
+			data = /incbin/("overlay_overlay_phandle.test.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
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
diff --git a/tests/fdtfactor_other1.dts b/tests/fdtfactor_other1.dts
new file mode 100644
index 000000000000..d6257d1fd29d
--- /dev/null
+++ b/tests/fdtfactor_other1.dts
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/dts-v1/;
+
+/memreserve/ 0xdeadbeef00000000 0x100000;
+
+/ {
+	compatible = "vendor,other1", "vendor,other";
+	model = "other1";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	osn1: other-subnode@1 {
+		compatible = "other-subnode1";
+		reg = <1>;
+		prop-ref = <&osn1 0x10 &ossn1 0x20>;
+
+		ossn1: other-subsubnode {
+			compatible = "other-subsubnode";
+			prop-int = <0x1111>;
+		};
+	};
+
+	osn2: other-subnode@2 {
+		reg = <2>;
+		prop-phandle = <&osn2>;
+	};
+
+	o1_node: other1-node {
+		prop-str = "other1";
+		ref-base = <&osn1>;
+		ref-self = <&o1_node>;
+	};
+};
diff --git a/tests/fdtfactor_other2.dts b/tests/fdtfactor_other2.dts
new file mode 100644
index 000000000000..2d97f3595e3c
--- /dev/null
+++ b/tests/fdtfactor_other2.dts
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/dts-v1/;
+
+/memreserve/ 0xdeadbeef00000000 0x100000;
+
+/ {
+	compatible = "vendor,other2", "vendor,other";
+	model = "other2";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	osn1: other-subnode@1 {
+		compatible = "other-subnode1";
+		reg = <1>;
+		prop-ref = <&osn1 0x10 &ossn1 0x20>;
+
+		ossn1: other-subsubnode {
+			compatible = "other-subsubnode";
+			prop-int = <0x2222>;
+		};
+	};
+
+	osn2: other-subnode@2 {
+		reg = <2>;
+		prop-phandle = <&osn2>;
+	};
+
+	o2_node: other2-node {
+		prop-str = "other2";
+		ref-base = <&ossn1>;
+		ref-self = <&o2_node>;
+	};
+};
diff --git a/tests/fdtfactor_test.its b/tests/fdtfactor_test.its
new file mode 100644
index 000000000000..dd515e17b66f
--- /dev/null
+++ b/tests/fdtfactor_test.its
@@ -0,0 +1,109 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/dts-v1/;
+
+/ {
+	description = "Test FIT for fdtfactor";
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
index c18d824c7bc7..812574203339 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -1339,6 +1339,162 @@ fdtfactor_tests () {
 	run_test dtbs_equal_unordered fdtfactor_board1.test.dtb \
 	    fdtfactor_base_comp.test.dir/merged1.test.dtb
     fi
+
+    # FIT factoring (uncompressed and compressed, multi-group by node
+    # overlap)
+    # fdtget -t r appends a trailing newline; strip that last byte.
+    fdtget_raw () {
+	$DTGET -t r "$1" "$2" "$3" > "$4.tmp"
+	head -c $(($($STATSZ "$4.tmp") - 1)) "$4.tmp" > "$4"
+	rm -f "$4.tmp"
+    }
+    run_dtc_test -b 2 -@ -L -I dts -O dtb -o fdtfactor_other1.test.dtb \
+	"$SRCDIR/fdtfactor_other1.dts"
+    run_dtc_test -b 2 -@ -L -I dts -O dtb -o fdtfactor_other2.test.dtb \
+	"$SRCDIR/fdtfactor_other2.dts"
+    run_dtc_test -@ -I dts -O dtb -o overlay_overlay_phandle.test.dtb \
+	"$SRCDIR/overlay_overlay_phandle.dts"
+
+    run_dtc_test -i . -I dts -O dtb -o fdtfactor.test.fit \
+	"$SRCDIR/fdtfactor_test.its"
+    cp fdtfactor.test.fit fdtfactor_orig.test.fit
+    run_wrap_test $PYTHON $FDTFACTOR -s -F fdtfactor.test.fit
+    run_fdtget_test "fdt-base-1.dtb" fdtfactor.test.fit \
+	/images/fdt-base-1 description
+    run_fdtget_test "fdtfactor_board1.test.dtbo" fdtfactor.test.fit \
+	/images/fdt-1 description
+    run_fdtget_test "fdt-base-2.dtb" fdtfactor.test.fit \
+	/images/fdt-base-2 description
+    run_fdtget_test "fdtfactor_other1.test.dtbo" fdtfactor.test.fit \
+	/images/fdt-4 description
+    run_fdtget_test "fdt-base-1 fdt-1" fdtfactor.test.fit \
+	/configurations/conf-1 fdt
+    run_fdtget_test "fdt-base-1 fdt-2" fdtfactor.test.fit \
+	/configurations/conf-2 fdt
+    run_fdtget_test "fdt-base-1 fdt-3 fdt-ovl-1" fdtfactor.test.fit \
+	/configurations/conf-3 fdt
+    run_fdtget_test "fdt-base-2 fdt-4" fdtfactor.test.fit \
+	/configurations/conf-4 fdt
+    run_fdtget_test "fdt-base-2 fdt-5" fdtfactor.test.fit \
+	/configurations/conf-5 fdt
+    # conf-1 already had an explicit compatible property; conf-2 did not, so
+    # fdtfactor should populate it from fdt-2's root compatible property.
+    run_fdtget_test "vendor,board1 vendor,common" fdtfactor.test.fit \
+	/configurations/conf-1 compatible
+    run_fdtget_test "test_fdtfactor" fdtfactor.test.fit \
+	/configurations/conf-2 compatible
+    run_fdtget_test "vendor,other1 vendor,other" fdtfactor.test.fit \
+	/configurations/conf-4 compatible
+    # Verify that hash-1/value was populated for fdt-base-1, fdt-base-2, and
+    # updated for fdt-1.
+    base1_hash=$($DTGET -t bx fdtfactor.test.fit \
+	/images/fdt-base-1/hash-1 value)
+    base2_hash=$($DTGET -t bx fdtfactor.test.fit \
+	/images/fdt-base-2/hash-1 value)
+    fdt1_hash=$($DTGET -t bx fdtfactor.test.fit \
+	/images/fdt-1/hash-1 value)
+    if [ -z "$base1_hash" ] || [ -z "$base2_hash" ] || \
+       [ "$fdt1_hash" = "0 0 0 0 0 0 0 0" ]; then
+	FAIL "FIT hash-1 values were not updated"
+    fi
+    # Extract factored base DTBs and overlays from the FIT and verify all 5
+    # boards with fdtoverlay + dtbs_equal_unordered.
+    fdtget_raw fdtfactor.test.fit /images/fdt-base-1 data fit_base1.test.dtb
+    for i in 1 2 3; do
+	fdtget_raw fdtfactor.test.fit /images/fdt-${i} data \
+	    fit_fdt${i}.test.dtbo
+	run_wrap_test $FDTOVERLAY -i fit_base1.test.dtb \
+	    -o fit_merged${i}.test.dtb fit_fdt${i}.test.dtbo
+	run_test dtbs_equal_unordered fdtfactor_board${i}.test.dtb \
+	    fit_merged${i}.test.dtb
+    done
+    fdtget_raw fdtfactor.test.fit /images/fdt-base-2 data fit_base2.test.dtb
+    for i in 1 2; do
+	idx=$((i + 3))
+	fdtget_raw fdtfactor.test.fit /images/fdt-${idx} data \
+	    fit_fdt${idx}.test.dtbo
+	run_wrap_test $FDTOVERLAY -i fit_base2.test.dtb \
+	    -o fit_merged${idx}.test.dtb fit_fdt${idx}.test.dtbo
+	run_test dtbs_equal_unordered fdtfactor_other${i}.test.dtb \
+	    fit_merged${idx}.test.dtb
+    done
+
+    # --single-base-dtb forces a single fdt-base-1 across all FDTs
+    run_wrap_test $PYTHON $FDTFACTOR --single-base-dtb \
+	-F fdtfactor_orig.test.fit --outfile fdtfactor_single.test.fit
+    run_fdtget_test "fdt-base-1.dtb" fdtfactor_single.test.fit \
+	/images/fdt-base-1 description
+    run_fdtget_test "fdt-base-1 fdt-1" fdtfactor_single.test.fit \
+	/configurations/conf-1 fdt
+    run_fdtget_test "fdt-base-1 fdt-4" fdtfactor_single.test.fit \
+	/configurations/conf-4 fdt
+    fdtget_raw fdtfactor_single.test.fit /images/fdt-base-1 data \
+	fit_single_base1.test.dtb
+    for i in 1 2 3; do
+	fdtget_raw fdtfactor_single.test.fit /images/fdt-${i} data \
+	    fit_single_fdt${i}.test.dtbo
+	run_wrap_test $FDTOVERLAY -i fit_single_base1.test.dtb \
+	    -o fit_single_merged${i}.test.dtb fit_single_fdt${i}.test.dtbo
+	run_test dtbs_equal_unordered fdtfactor_board${i}.test.dtb \
+	    fit_single_merged${i}.test.dtb
+    done
+    for i in 1 2; do
+	idx=$((i + 3))
+	fdtget_raw fdtfactor_single.test.fit /images/fdt-${idx} data \
+	    fit_single_fdt${idx}.test.dtbo
+	run_wrap_test $FDTOVERLAY -i fit_single_base1.test.dtb \
+	    -o fit_single_merged${idx}.test.dtb fit_single_fdt${idx}.test.dtbo
+	run_test dtbs_equal_unordered fdtfactor_other${i}.test.dtb \
+	    fit_single_merged${idx}.test.dtb
+    done
+
+    # Verify that conflicting image properties (e.g. arch) in a group fail
+    cp fdtfactor_orig.test.fit fdtfactor_bad_arch.test.fit
+    run_wrap_test $DTPUT fdtfactor_bad_arch.test.fit /images/fdt-4 \
+	arch -ts "arm"
+    run_wrap_error_test $PYTHON $FDTFACTOR --single-base-dtb \
+	-F fdtfactor_bad_arch.test.fit
+
+    # Verify that signed FITs (with signature* subnodes) and
+    # already-factored FITs (containing fdt-base-*) are rejected
+    cp fdtfactor_orig.test.fit fdtfactor_signed.test.fit
+    run_wrap_test $DTPUT fdtfactor_signed.test.fit -c \
+	/configurations/conf-1/signature-1
+    run_wrap_error_test $PYTHON $FDTFACTOR -F fdtfactor_signed.test.fit
+    run_wrap_error_test $PYTHON $FDTFACTOR -F fdtfactor.test.fit
+
+    if command -v lz4 >/dev/null 2>&1; then
+	run_wrap_test lz4 -12 -q -f -m \
+	    fdtfactor_board1.test.dtb fdtfactor_board2.test.dtb \
+	    fdtfactor_board3.test.dtb fdtfactor_other1.test.dtb \
+	    fdtfactor_other2.test.dtb overlay_overlay_phandle.test.dtb
+	run_dtc_test -i . -I dts -O dtb -o fdtfactor_lz4.test.fit \
+	    "$SRCDIR/fdtfactor_lz4.its"
+	run_wrap_test $PYTHON $FDTFACTOR -s \
+	    -F fdtfactor_lz4.test.fit --outfile fdtfactor_lz4_out.test.fit
+	run_fdtget_test "fdt-base-1.dtb.lz4" fdtfactor_lz4_out.test.fit \
+	    /images/fdt-base-1 description
+	run_fdtget_test "fdtfactor_board1.test.dtbo.lz4" \
+	    fdtfactor_lz4_out.test.fit /images/fdt-1 description
+	run_fdtget_test "fdt-base-2.dtb.lz4" fdtfactor_lz4_out.test.fit \
+	    /images/fdt-base-2 description
+	run_fdtget_test "fdtfactor_other1.test.dtbo.lz4" \
+	    fdtfactor_lz4_out.test.fit /images/fdt-4 description
+	run_fdtget_test "fdt-base-1 fdt-1" fdtfactor_lz4_out.test.fit \
+	    /configurations/conf-1 fdt
+	run_fdtget_test "fdt-base-2 fdt-4" fdtfactor_lz4_out.test.fit \
+	    /configurations/conf-4 fdt
+	fdtget_raw fdtfactor_lz4_out.test.fit /images/fdt-base-1 data \
+	    fit_lz4_base1.test.dtb.lz4
+	fdtget_raw fdtfactor_lz4_out.test.fit /images/fdt-1 data \
+	    fit_lz4_fdt1.test.dtbo.lz4
+	run_wrap_test lz4 -d -q -f --rm fit_lz4_base1.test.dtb.lz4
+	run_wrap_test lz4 -d -q -f --rm fit_lz4_fdt1.test.dtbo.lz4
+	run_wrap_test $FDTOVERLAY -i fit_lz4_base1.test.dtb \
+	    -o fit_lz4_merged1.test.dtb fit_lz4_fdt1.test.dtbo
+	run_test dtbs_equal_unordered fdtfactor_board1.test.dtb \
+	    fit_lz4_merged1.test.dtb
+    fi
 }
 
 while getopts "vt:me" ARG ; do
@@ -1368,7 +1524,7 @@ if [ -z "$TESTSETS" ]; then
 fi
 
 # Make sure we don't have stale blobs lying around
-rm -f *.test.dtb *.test.dtbo *.test.dts *.test.dtb.gz *.test.dtbo.gz \
+rm -f *.test.dtb *.test.dtbo *.test.dts *.test.fit *.test.dtb.gz *.test.dtbo.gz \
     *.test.dtb.xz *.test.dtbo.xz *.test.dtb.lzma *.test.dtbo.lzma \
     *.test.dtb.lz4 *.test.dtbo.lz4
 rm -rf *.test.dir
-- 
2.56.0.317.g454f8302e1-goog

