Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862457;
	b=o3Rq55FbeQPbdm3OOek+TJe2TiLMZJTIuGcv50U2iQmqk0RKrb5oPniS6v5Cok1qgGrg
	 Or7zDJJRl6NpyYO7KSuJl+xigksGq+sF2zrNKdJ53TD/HMfSD8VqetJ0L+YWYMT1sA9rW
	 MBkF4okNYz5KiopzBvmQhBulimWtONjNsldEdbg2HeRhUXHYKR5s89PnPY98yGPyGvEUD
	 0DeyJ4ln5o9mZku4LWh36OdcqjbqJCyQgobhKOtK1gnJGOe7a7H6Fksy7UDODmlXH401v
	 yRjT29nIfwT+BAit4GHGgzLqllyve2fXRHGFlTztQu8TB8TqAKdK6PBKh03ca1V/KnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862457;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=Mzx9R3IBxh/ElVn85e1xU4OL316kcqzktSsdyKCMpgg=;
	b=Ms8HQlTtz/058ZpHet8WUPumRMtcUYJofnFL0lXhUrt3lhlReLXpcfkRVOe3QHBAQvSD
	 XIrLj/vC+To2ul+JfB1xiOsakfIYZds8esHlp9xGZh3XrmuNzSexSlj3ZNYnCabqkBF6s
	 E0MAxRJRAPvSThbKTk0aYekZ7UErWvO92NFThV0/wZn+PyCLok2+10yyQcawStSU5UwnK
	 mLEOWl/ZKC5pgJqFJQOMaMvJuX7wFQseAPVGavu2DTbdOWBF/xxVo0hzlMRjmstRHw0eo
	 S2tqF+wZGfqseyHREW1ADprT3x65ocDakBWuNY2q4aLds6nTogfnDyxR6MFp6gZX+iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=dqRxBpHp;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D4760A2614
	for <Devicetree-compiler@vger.kernel.org>; Mon, 16 Nov 2026 20:54:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60D4760A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=dqRxBpHp
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1513769eec.0
        for <Devicetree-compiler@vger.kernel.org>; Mon, 16 Nov 2026 12:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794862455; x=1795467255; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mzx9R3IBxh/ElVn85e1xU4OL316kcqzktSsdyKCMpgg=;
        b=dqRxBpHpXnVL9RByLOsjsRVjlTlh5APi0p6vaRmMX2ixlcGTQ8EETULrQKgzkczr3r
         /SsDBl6GUaVeXA0mUTQb8tfNiKZlH3seQn0s5R7yawuoDeQ/eT8q/FFyNJh/mrzNhh+K
         IcbILaniUaSYKxZ/AmIjW5YSzEgb+JzR52ht8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794862455; x=1795467255;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mzx9R3IBxh/ElVn85e1xU4OL316kcqzktSsdyKCMpgg=;
        b=qlUTi/aB7A0yTsKaNQTh8YW9y3MliAo7FNa/U9WRt1Bl1hQJ+E/gn5f0hZfFkLi9QZ
         z/L+G2seyPL0KsDRD686KsU8vkumlg3B+gyGSrmYHCCnLQIp6RT8OyhfFKzn+Kri/QOx
         +Md2yBKiGVIojyV/B7vGyXgtfq5rBn0/7EOJT266NKzRrUXcvdjGG6yGMH6ajSHMKyJC
         lgo8hClDpRiC6WDVCTcXqjTdtQdZVOSQvsFQ3gsRahkzmWzjJhPtWHnYGJL+uGFC3Xcn
         p3jOsk4II7CjaIf5/+0F70mN/CSVvg6fNQjHAwvcJJZxh9sbSjfzGm1kInr+ieBwI2X5
         9xyg==
X-Gm-Message-State: APuU4Z8XdsfytYAEIMNbOlar1sd2Gb8/p7g30PeZudBpB8eYzYlgY6t8
	fcZJOTbZiG9dsJO2pMQQozr24uD3ub+ogz/BPqMazzkIkWv9thQlqHfGEwAN7ORZh/fie4bKiix
	XXCHhZA==
X-Gm-Gg: AZFdTZePszWAlllO9984xPJMgGcPepJbT1Wi45Wc8B5CQqIN86ubqKawFN0FVVB4tFL
	vd0QQ0WDhXXAJyLyXSVL6Bczd8DCXR0V6+OkLl+ubsnPDR5TvTTWm3DtB5JyI4dwaE0wfvbLQBJ
	kz/PYvcnGkGv/sEpBzIKxrvJEYU2YePpAwh/aSUtl1NcWZLQ2DVMAobaJeV3vaqW6qlSs0HN/bV
	7FfRjyF9Hauc8PH+z2iBmv4i3D9vj3Os3smN2P8033QMiCnWJzLBqmAePaSCZVGGTpakf+EDcwF
	gtqKChKjlgEu2Qa5c1EKms+PdlZDsi+YIDTbvIPEQlbGqVT7e4mdm2k04dVqvqmEIJp64+84g28
	MlZPki9pPTrk8dVD7C0yEfUfYtKzYzbjI0endWMo8cK+BncnVFq7slbnSUmlJwimXeXyk0HKSwh
	Ie0dwpTmeZR7P5C0DCLUxaXHZDKfWfbMWMcG3nM1IsgDc9vJhbLMsX8ryNql7qzKCMpziXlbqPp
	EGP9Tze3Gh9NjbPGYiKSCQFcqaEIQCkHNEPRvR4z2SoRDggXHsScqH73q5QHF6m5RftNQRFtc9j
	2+o9UHOQOSGFM99A/PF9gXE2CI0u0rik88twNg/9+5hbLN0hA+idaZzzv9gQ0pfuDMxiQSjjnmL
	z6ms2MS/t/cQ8DA==
X-Received: by 2002:a05:7300:d18b:b0:36d:37c4:3759 with SMTP id 5a478bee46e88-37965f9d24cmr11250765eec.18.1794862453283;
        Mon, 16 Nov 2026 12:54:13 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:40c8:6e27:a2df:3321])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm67120390eec.21.2026.11.16.12.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:54:12 -0800 (PST)
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
Subject: [PATCH v4 13/14] fdtfactor: Add compiled FIT factoring support
Date: Mon, 16 Nov 2026 12:53:10 -0800
Message-ID: <20261116205320.1621386-14-dianders@chromium.org>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Bootloaders such as depthcharge on Chromebooks and U-Boot use Flattened
Image Trees (FITs) to bundle a kernel image with multiple board FDT
blobs (`fdt-1`, `fdt-2`, ...) and per-board configuration nodes.

Add `-F`/`--fit`, `--min-overlap`, and `--single-base-dtb` options to
`fdtfactor` (writing the factored FIT to `-o`/`--output`, or updating
`--fit` in place by default):

- Parse non-overlay `type = "flat_dt"` nodes under `/images`,
  decompressing their `data` blobs according to their `compression`
  property (`none`, `lz4`, `lzma`, `xz`, `gzip`).
- Reject FITs containing `signature*` subnodes under `/images/*` or
  `/configurations/*`, as modifying FDT blobs and configurations would
  invalidate cryptographic signatures.
- Partition the `flat_dt` blobs into factor groups by compatible FDT
  headers / FIT `arch` and `load` properties and shared normalized
  property byte overlap (`>= --min-overlap`%, default `50`%, reusing
  `select_best_candidate()`'s `_prop_byte_cost()` model) so a single FIT
  containing multiple board/SoC families produces a separate
  `fdt-base-1`, `fdt-base-2`, etc. for each family.
- Support `--single-base-dtb` to force all `flat_dt` blobs into a single
  base DTB regardless of property overlap, failing only if their FDT
  headers, `arch`, or `load` properties differ.
- Insert each `fdt-base-N` node into `/images` (picking the next unused
  `fdt-base-N` name), replace each factored `fdt-*` node's `data` with
  its `.dtbo` overlay (preserving each node's `compression` setting, and
  stripping `/__local_fixups__` from any unfactored single-board
  `flat_dt` nodes too when `-S` is passed), recompute any `hash*`
  subnode digests, and prepend `fdt-base-N` to each matching
  configuration's `fdt` string list while preserving all other
  configuration properties (`description`, `compatible`, etc.,
  populating `compatible` from the board DTB's root node when omitted)
  and any pre-existing overlay entries.

Add uncompressed, LZ4-compressed multi-family, `--min-overlap`,
unfactored-singleton `-S`, pre-existing `fdt-base-*` / multi-pass,
signed-FIT rejection, and `--single-base-dtb` FIT test cases to the
`fdtfactor` test suite.

Reviewed-by: Simon Glass <sjg@chromium.org>
Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4:
- Unify --outfile into -o/--output, and split standalone DTB vs. FIT
  options into separate README.md subsections and --help groups (David
  Gibson)
- Check _is_dtbo_overlay() directly in _extract_fit_fdt_entries()
  instead of adding OverlayBlobError to ParsedDtb (David Gibson)
- Map standard FIT hash algorithm names explicitly via FIT_HASH_ALGOS
  instead of passing raw names to hashlib.new() (David Gibson)
- Remove compression and entry from FIT grouping, document load, expose
  --min-overlap, and compute FIT group overlap using normalized property
  byte costs via _prop_byte_cost() instead of unweighted node paths
  (David Gibson)
- Strip /__local_fixups__ from unfactored single-board FIT flat_dt
  entries when -S/--strip-local-fixups is passed, and pick the next
  unused fdt-base-N node name instead of rejecting FITs that already
  contain fdt-base-* nodes
- Pass already-unflattened FactoredTree into ParsedDtb and intern
  normalized properties to integer IDs in group_fit_dtbs() to speed up
  multi-SoC FIT factoring
- Preserve whether input FIT FDT descriptions include a compression
  extension instead of unconditionally appending one
- Update for libpydt rename, use Property.as_*(), Property.from_*(), and
  DeviceTree.set_prop() instead of DeviceTree get_*/set_* wrapper
  methods, and drop redundant bytes() copies on Property instances
  (David Gibson, Simon Glass)
- Use check_factored_dtb and 4-space indentation in tests/run_tests.sh
  (Simon Glass, David Gibson)

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

 README.md                  |  89 +++-
 fdtfactor                  | 850 +++++++++++++++++++++++++++++++++----
 tests/Makefile.tests       |   2 +-
 tests/fdtfactor_lz4.its    | 109 +++++
 tests/fdtfactor_other1.dts |  67 +++
 tests/fdtfactor_other2.dts |  67 +++
 tests/fdtfactor_test.its   | 109 +++++
 tests/run_tests.sh         | 225 +++++++++-
 8 files changed, 1421 insertions(+), 97 deletions(-)
 create mode 100644 tests/fdtfactor_lz4.its
 create mode 100644 tests/fdtfactor_other1.dts
 create mode 100644 tests/fdtfactor_other2.dts
 create mode 100644 tests/fdtfactor_test.its

diff --git a/README.md b/README.md
index ac571384d421..304611eb763b 100644
--- a/README.md
+++ b/README.md
@@ -203,14 +203,14 @@ $ fdtoverlay -i base.dtb -o merged.dtb overlay1.dtbo overlay2.dtbo
 
 ## fdtfactor
 
-`fdtfactor` is a Python tool built on `pylibfdt` that takes a set of
-compiled device tree blobs (`.dtb`, or compressed `.dtb.lz4`, `.dtb.xz`,
-`.dtb.lzma`, `.dtb.gz` with `-C`) and splits them into a single common
-`base.dtb` and per-board `.dtbo` overlays so that applying a board's
-`.dtbo` to `base.dtb` recreates the original board device tree while
-reducing total storage size.
-
-Input `.dtb` files must be compiled with `dtc -@ -L` so that both
+`fdtfactor` is a Python tool built on `pylibfdt` that factors a set of
+compiled device tree blobs — either standalone `.dtb` files or
+`/images/fdt-*` nodes inside a compiled FIT — into a common base `.dtb`
+and per-board `.dtbo` overlays so that applying a board's `.dtbo` to the
+base `.dtb` recreates the original board device tree while reducing
+total storage size.
+
+Input `.dtb` blobs must be compiled with `dtc -@ -L` so that both
 `/__symbols__` (used to resolve overlay `/__fixups__` against `base.dtb`)
 and `/__local_fixups__` (used to identify phandle references inside
 property values) are present.
@@ -219,30 +219,73 @@ Basic usage:
 
 ```
 $ fdtfactor -o out_dir board1.dtb board2.dtb board3.dtb
+$ fdtfactor -F image.fit -o image.factored.fit
 ```
 
-Options:
+Common options:
 
+* `-S`, `--strip-local-fixups`: Omit `/__local_fixups__` from the generated
+  base `.dtb` and final reconstructed device trees. By default, `fdtfactor`
+  preserves `/__local_fixups__` on the base `.dtb` so that when
+  `fdt_overlay_apply()` merges a `.dtbo` overlay, the reconstructed device
+  tree retains full `/__local_fixups__` information (e.g., for an OS kernel
+  that wants to know which property cells contain phandles at runtime). When
+  `-L` was passed to `dtc` solely to help `fdtfactor` locate phandles at
+  build time and `/__local_fixups__` is not needed at runtime, passing `-S`
+  strips it from the base `.dtb` (and any unfactored FIT FDTs) to save space.
+* `-s`, `--stats`: Print size savings summary.
+
+### Standalone DTB Factoring
+
+When `-F` / `--fit` is not passed, `fdtfactor` takes two or more positional
+`.dtb` files (or compressed `.dtb.lz4`, `.dtb.xz`, `.dtb.lzma`, `.dtb.gz`
+files with `-C`) and writes a common base `.dtb` plus one `.dtbo` overlay per
+input file:
+
+* `-o`, `--output`: Output directory for generated `.dtbo` files and
+  `--output-base-dtb` (default: alongside each input `.dtb` for `.dtbo`
+  files, current directory for `--output-base-dtb`).
 * `--output-base-dtb`: Output filename for the common base `.dtb`
   (default: `base.dtb`, or `base.dtb.<ext>` when `-C` / `--compression` is
-  used; placed in `--output` if specified, or the current directory
+  used; placed in `-o` / `--output` if specified, or the current directory
   otherwise).
 * `-C`, `--compression`: Compression format for both input `.dtb` files and
   generated `base.dtb` / `.dtbo` outputs: `none`, `lz4`, `lz4_legacy`, `lzma`,
   `xz`, or `gzip` (default: `none`).
-* `-o`, `--output`: Output directory for generated `.dtbo` files and
-  `--output-base-dtb` (default: alongside each input `.dtb` for `.dtbo` files,
-  current directory for `--output-base-dtb`).
-* `-S`, `--strip-local-fixups`: Omit `/__local_fixups__` from the generated
-  `base.dtb` and final reconstructed device trees. By default, `fdtfactor`
-  preserves `/__local_fixups__` on `base.dtb` so that when `fdt_overlay_apply()`
-  merges a `.dtbo` overlay, the reconstructed device tree retains full
-  `/__local_fixups__` information (e.g., for an OS kernel that wants to
-  know which property cells contain phandles at runtime). When `-L` was
-  passed to `dtc` solely to help `fdtfactor` locate phandles at build time
-  and `/__local_fixups__` is not needed at runtime, passing `-S` strips it
-  from `base.dtb` to save space.
-* `-s`, `--stats`: Print size savings summary.
+
+### FIT Factoring
+
+When `-F` / `--fit` is passed, `fdtfactor` updates a compiled Flattened Image
+Tree:
+
+* `-F`, `--fit`: Input compiled FIT (`.fit` / `.itb`) to factor.
+* `-o`, `--output`: Output FIT path (default: overwrite `--fit` in place).
+* `--min-overlap`: Minimum percentage (`0`–`100`, default: `50`) of normalized
+  property bytes shared with a group's common properties required to place a
+  `flat_dt` node into that group.
+* `--single-base-dtb`: Force a single `/images/fdt-base-1` across all FDTs in
+  the FIT regardless of property overlap.
+
+FIT behavior and constraints:
+
+* Non-overlay `type = "flat_dt"` subnodes under `/images` are decompressed
+  according to their FIT `compression` property (`none`, `lz4`, `lzma`, `xz`,
+  `gzip`) and partitioned into factor groups that share compatible FDT headers,
+  `arch`, and `load` properties and at least `--min-overlap`% of normalized
+  property bytes (or forced into a single group when `--single-base-dtb` is
+  passed).
+* For each group, `fdtfactor` inserts `/images/fdt-base-N`, converts each
+  member `/images/fdt-*` node into a `.dtbo` overlay (preserving each node's
+  `compression` setting and stripping any `load` address), prepends
+  `fdt-base-N` to matching `/configurations/conf-*` `fdt` string lists
+  (populating `compatible` from the board DTB's root node when omitted), and
+  recomputes `/images/*/hash*` digests.
+* Note that while bootloaders such as depthcharge decompress compressed FIT
+  overlays, U-Boot's `boot_get_fdt_fit()` currently only decompresses the base
+  DTB and requires FIT overlays to be uncompressed.
+* Signed FITs containing `signature*` subnodes are rejected because modifying
+  FDT blobs and configurations would invalidate cryptographic signatures; sign
+  the FIT after factoring.
 
 ### TODO
 
diff --git a/fdtfactor b/fdtfactor
index beeeff231ba6..ebf40cdeaf92 100755
--- a/fdtfactor
+++ b/fdtfactor
@@ -8,16 +8,25 @@ properties shared across the inputs into a single common `base.dtb` and emits a
 small per-board `.dtbo` overlay for each input. Applying a board's `.dtbo` to
 `base.dtb` (e.g., via `fdtoverlay` or `fdt_overlay_apply()`) reconstructs the
 original board DTB.
+
+Alternatively, `fdtfactor -F <image.fit>` can rewrite a compiled U-Boot /
+ChromeOS Flattened Image Tree (FIT) in place (or to `-o`/`--output`), factoring
+its embedded `/images/fdt-*` blobs into base DTBs (`fdt-base-1`, `fdt-base-2`,
+...) and overlays while updating `/configurations/conf-*` `fdt` and
+`compatible` properties and recalculating `/images/*/hash-*` digests.
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
 import libpydt
@@ -148,6 +157,24 @@ def _is_dtbo_overlay(root):
     )
 
 
+def _open_fdt(raw_bytes, filename):
+    """Validate `raw_bytes` with `fdt_check_full()` and return an `FdtRo`.
+
+    Args:
+        raw_bytes: Uncompressed FDT blob `bytes`.
+        filename: File path or node label for error reporting.
+
+    Returns:
+        Validated `libfdt.FdtRo` instance.
+    """
+    try:
+        fdt = libfdt.FdtRo(raw_bytes)
+        libfdt.check_err(libfdt.fdt_check_full(fdt._fdt, len(raw_bytes)))
+    except libfdt.FdtException as exc:
+        raise ValueError(f'{filename}: Invalid FDT blob ({exc})') from exc
+    return fdt
+
+
 class FactoredTree(libpydt.DeviceTree):
     """DeviceTree subclass with normalized phandle and fixup attributes.
 
@@ -186,30 +213,41 @@ class ParsedDtb:
       independent of numeric phandle numbering.
     """
 
-    def __init__(self, filename, comp='none'):
-        """Parse an input FDT file into a normalized FactoredTree.
+    def __init__(self, filename, comp='none', fdt=None, root=None,
+                 uncompressed_size=None, compressed_size=None):
+        """Parse an input FDT file or opened `FdtRo` into a `FactoredTree`.
 
         Args:
-            filename: File path of the `.dtb` (or compressed `.dtb.*`) file.
+            filename: File path (or display name when `fdt` is provided).
             comp: Compression format string (default: `'none'`).
+            fdt: Optional already-validated `libfdt.FdtRo` instance; if None,
+                read and decompressed from `filename`.
+            root: Optional already-unflattened `FactoredTree` for `fdt`.
+            uncompressed_size: Uncompressed byte length when `fdt` is provided.
+            compressed_size: Raw/compressed byte length when `fdt` is provided.
         """
         self.filename = filename
         self.compression = comp
-        with open(filename, 'rb') as f:
-            file_bytes = f.read()
-        self.compressed_size = len(file_bytes)
-        raw_bytes = decompress_blob(file_bytes, comp, filename=filename)
-        self.uncompressed_size = len(raw_bytes)
-
-        try:
-            fdt = libfdt.FdtRo(raw_bytes)
-            libfdt.check_err(libfdt.fdt_check_full(fdt._fdt, len(raw_bytes)))
-        except libfdt.FdtException as exc:
-            raise ValueError(f'{filename}: Invalid FDT blob ({exc})') from exc
+        if fdt is None:
+            with open(filename, 'rb') as f:
+                file_bytes = f.read()
+            self.compressed_size = len(file_bytes)
+            raw_bytes = decompress_blob(file_bytes, comp, filename=filename)
+            self.uncompressed_size = len(raw_bytes)
+            fdt = _open_fdt(raw_bytes, filename)
+        else:
+            self.uncompressed_size = (
+                fdt.totalsize() if uncompressed_size is None
+                else uncompressed_size
+            )
+            self.compressed_size = (
+                self.uncompressed_size if compressed_size is None
+                else compressed_size
+            )
 
         self.boot_cpuid_phys = fdt.boot_cpuid_phys()
         self.mem_rsv = tuple(fdt.get_mem_rsv_list())
-        self.root = FactoredTree.unflatten(fdt)
+        self.root = FactoredTree.unflatten(fdt) if root is None else root
 
         if _is_dtbo_overlay(self.root):
             raise ValueError(
@@ -379,16 +417,12 @@ class ParsedDtb:
                 target_node.fixups[prop_name] = tuple(targets)
 
 
-def select_best_candidate(candidates, path, prop_name):
-    """Choose the `(masked_bytes, fixups)` value that maximizes overlay savings.
-
-    Only candidates shared by at least two input DTBs (`count > 1`) are
-    eligible for the base DTB; a value that appears in only one DTB would add
-    one copy to `base.dtb` to save one overlay copy (zero net savings).
+def _prop_byte_cost(path, prop_name, prop_bytes, fixups):
+    """Estimate the FDT structure + `/__fixups__` byte cost of a property.
 
-    Byte cost model per overlay occurrence:
+    Byte cost model per occurrence:
     - Each FDT property carries a 12-byte structure header (`FDT_PROP` 4-byte
-      tag + 4-byte length + 4-byte `nameoff`) plus `len(masked_bytes)` value
+      tag + 4-byte length + 4-byte `nameoff`) plus `len(prop_bytes)` value
       bytes.
     - Each phandle fixup in an overlay adds a string entry of the form
       `"/fragment@0/__overlay__<path>:<prop_name>:<off>\\0"` to `/__fixups__`:
@@ -397,6 +431,26 @@ def select_best_candidate(candidates, path, prop_name):
       ~3 bytes amortized `/__fixups__` property overhead =
       `len(path) + len(prop_name) + 28` bytes.
 
+    Args:
+        path: Normalized node path (`""` for root or `"/..."` for subnodes).
+        prop_name: Property name string.
+        prop_bytes: Property value `bytes`.
+        fixups: Sequence of `(offset, target_path)` phandle fixups.
+
+    Returns:
+        Estimated byte cost (int).
+    """
+    fixup_cost = len(fixups) * (len(path) + len(prop_name) + 28)
+    return len(prop_bytes) + fixup_cost + 12
+
+
+def select_best_candidate(candidates, path, prop_name):
+    """Choose the `(masked_bytes, fixups)` value that maximizes overlay savings.
+
+    Only candidates shared by at least two input DTBs (`count > 1`) are
+    eligible for the base DTB; a value that appears in only one DTB would add
+    one copy to `base.dtb` to save one overlay copy (zero net savings).
+
     Args:
         candidates: Sequence of `(masked_bytes, fixups)` tuples observed across
             input DTBs for `prop_name` on `path`.
@@ -408,7 +462,6 @@ def select_best_candidate(candidates, path, prop_name):
         byte savings when placed in `base.dtb`, or `None` if no candidate
         appears in at least two input DTBs.
     """
-    fixup_entry_cost = len(path) + len(prop_name) + 28
     counts = Counter(candidates)
     best_val = None
     best_key = None
@@ -416,10 +469,10 @@ def select_best_candidate(candidates, path, prop_name):
         if count <= 1:
             continue
         masked_bytes, fixups = val
-        length = len(masked_bytes) + len(fixups) * fixup_entry_cost
+        cost = _prop_byte_cost(path, prop_name, masked_bytes, fixups)
         # Placing `val` in base.dtb adds 1 copy and removes `count` overlay
-        # copies, saving `(count - 1) * (length + 12)` bytes across the set.
-        key = ((count - 1) * (length + 12), count, length)
+        # copies, saving `(count - 1) * cost` bytes across the set.
+        key = ((count - 1) * cost, count, cost)
         if best_key is None or key > best_key:
             best_key = key
             best_val = val
@@ -824,6 +877,579 @@ def create_base_dtb_and_overlays(dtbs, strip_local_fixups=False):
     return base_dtb_blob, dtbo_blobs
 
 
+# ---------------------------------------------------------------------------
+# Compiled FIT factoring (targeting depthcharge / coreboot / U-Boot)
+# ---------------------------------------------------------------------------
+
+FIT_COMPRESSIONS = ('none', 'lz4', 'lzma', 'xz', 'gzip')
+LZ4_LEGACY_MAGIC = b'\x02\x21\x4c\x18'
+
+FIT_HASH_ALGOS = {
+    'crc32': lambda data: struct.pack('>I', zlib.crc32(data) & 0xffffffff),
+    'md5': lambda data: hashlib.md5(data).digest(),
+    'sha1': lambda data: hashlib.sha1(data).digest(),
+    'sha256': lambda data: hashlib.sha256(data).digest(),
+    'sha384': lambda data: hashlib.sha384(data).digest(),
+    'sha512': lambda data: hashlib.sha512(data).digest(),
+}
+
+
+def _compute_fit_hash(algo_name, data_bytes):
+    """Compute a binary hash digest for a FIT `hash*` subnode.
+
+    Args:
+        algo_name: FIT hash algorithm name (`'crc32'`, `'md5'`, `'sha1'`,
+            `'sha256'`, `'sha384'`, or `'sha512'`).
+        data_bytes: Input `bytes` to hash.
+
+    Returns:
+        Binary hash digest `bytes`.
+    """
+    hash_fn = FIT_HASH_ALGOS.get(algo_name)
+    if hash_fn is None:
+        raise ValueError(f'Unsupported FIT hash algorithm: {algo_name!r}')
+    return hash_fn(data_bytes)
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
+    for sub_name, sub_node in img_node.children.items():
+        if not sub_name.startswith('hash'):
+            continue
+        if 'algo' not in sub_node.props:
+            raise ValueError(
+                f'FIT hash subnode {sub_name!r} lacks an algo property'
+            )
+        algo = sub_node.props['algo'].as_str()
+        sub_node.set_prop(
+            libfdt.Property('value', _compute_fit_hash(algo, data_prop))
+        )
+
+
+def _rewrite_fit_dtbo_desc(desc, comp):
+    """Rewrite a `.dtb` filename description to `.dtbo`, preserving suffix.
+
+    Args:
+        desc: Description string from a FIT `/images/fdt-*` node.
+        comp: Compression format string of the FIT `/images/fdt-*` node.
+
+    Returns:
+        Rewritten `.dtbo` (or `.dtbo<ext>`) description string if `desc` has no
+        spaces and ends with `.dtb` (or `.dtb<ext>`), or `None` to leave
+        free-form descriptions unchanged.
+    """
+    if not desc or ' ' in desc:
+        return None
+    if desc.endswith('.dtb'):
+        return f'{desc[:-4]}.dtbo'
+    ext = COMP_TO_EXT[comp]
+    if ext and desc.endswith(f'.dtb{ext}'):
+        return f'{desc[:-len(ext) - 4]}.dtbo{ext}'
+    return None
+
+
+def _intern_dtb_props(dtb, prop_ids, id_costs):
+    """Intern each normalized `(path, name, prop, fixups)` in `dtb` to an int ID.
+
+    Args:
+        dtb: `ParsedDtb` instance.
+        prop_ids: Mutable dict mapping `(path, prop_name, prop, fixups)` tuples
+            to sequential integer IDs across DTBs.
+        id_costs: Mutable list mapping each integer ID to `_prop_byte_cost()`.
+
+    Returns:
+        Tuple of `(entry_ids, entry_bytes)` where `entry_ids` is the `set` of
+        integer property IDs present in `dtb` and `entry_bytes` is their total
+        `_prop_byte_cost()`.
+    """
+    entry_ids = set()
+    entry_bytes = 0
+    for path, node in dtb.nodes.items():
+        fixups_map = node.fixups
+        for name, prop in node.props.items():
+            fixups = fixups_map.get(name, ()) if fixups_map else ()
+            key = (path, name, prop, fixups)
+            pid = prop_ids.get(key)
+            if pid is None:
+                pid = len(id_costs)
+                prop_ids[key] = pid
+                id_costs.append(_prop_byte_cost(path, name, prop, fixups))
+            entry_ids.add(pid)
+            entry_bytes += id_costs[pid]
+    return entry_ids, entry_bytes
+
+
+def group_fit_dtbs(fdt_entries, min_overlap=50.0):
+    """Partition FIT `flat_dt` entries into compatible factor groups.
+
+    Entries sharing a `fdt-base-N` node must match on `(arch, load,
+    boot_cpuid_phys, mem_rsv)` (`load` is the optional physical RAM address
+    where bootloaders such as U-Boot copy the base FDT before applying
+    overlays, so two FDTs requiring different RAM load addresses cannot share a
+    single `fdt-base-N` node) and share at least `min_overlap`% of normalized
+    property bytes (`shared_bytes / union_bytes * 100`) against the group's
+    common property set. When multiple groups qualify, the group with the
+    highest overlap percentage is chosen.
+
+    Args:
+        fdt_entries: Sequence of FIT `flat_dt` entry dicts from
+            `_extract_fit_fdt_entries()`.
+        min_overlap: Minimum byte-weighted Jaccard overlap percentage
+            (`0.0` to `100.0`, default `50.0`).
+
+    Returns:
+        List of entry-dict lists, one per factor group.
+    """
+    prop_ids = {}
+    id_costs = []
+    groups = []
+
+    for entry in fdt_entries:
+        dtb = entry['dtb']
+        header_key = (
+            entry['node'].props.get('arch'),
+            entry['node'].props.get('load'),
+            dtb.boot_cpuid_phys,
+            dtb.mem_rsv,
+        )
+        entry_ids, entry_bytes = _intern_dtb_props(dtb, prop_ids, id_costs)
+
+        best_grp = None
+        best_overlap = -1.0
+        best_shared_ids = None
+        best_shared_bytes = 0
+
+        for grp in groups:
+            if grp['key'] != header_key:
+                continue
+            max_shared = min(entry_bytes, grp['common_bytes'])
+            max_union = entry_bytes + grp['common_bytes'] - max_shared
+            if max_union and (max_shared / max_union * 100.0) < min_overlap:
+                continue
+            shared_ids = grp['common_ids'] & entry_ids
+            shared_bytes = sum(id_costs[pid] for pid in shared_ids)
+            union_bytes = entry_bytes + grp['common_bytes'] - shared_bytes
+            overlap = (
+                shared_bytes / union_bytes * 100.0 if union_bytes else 100.0
+            )
+            if overlap >= min_overlap and overlap > best_overlap:
+                best_overlap = overlap
+                best_grp = grp
+                best_shared_ids = shared_ids
+                best_shared_bytes = shared_bytes
+
+        if best_grp is not None:
+            best_grp['common_ids'] = best_shared_ids
+            best_grp['common_bytes'] = best_shared_bytes
+            best_grp['entries'].append(entry)
+        else:
+            groups.append({
+                'key': header_key,
+                'common_ids': entry_ids,
+                'common_bytes': entry_bytes,
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
+        List of dicts (`{'name', 'node', 'dtb', 'fdt'}`) for all non-overlay
+        `flat_dt` image subnodes.
+    """
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
+        type_prop = img_node.props.get('type')
+        if type_prop is None or type_prop.as_str() != 'flat_dt':
+            continue
+        raw_data = img_node.props.get('data')
+        if raw_data is None:
+            raise ValueError(
+                f'{fit_in_path}: /images/{img_name} lacks a data property'
+            )
+        node_label = f'{fit_in_path}:/images/{img_name}'
+        comp_prop = img_node.props.get('compression')
+        comp = (comp_prop.as_str() if comp_prop is not None else '') or 'none'
+        if comp not in FIT_COMPRESSIONS:
+            raise ValueError(
+                f'{node_label}: Unsupported FIT compression type: {comp}'
+            )
+        if comp == 'lz4' and raw_data.startswith(LZ4_LEGACY_MAGIC):
+            comp = 'lz4_legacy'
+        raw_bytes = decompress_blob(raw_data, comp, filename=node_label)
+        fdt = _open_fdt(raw_bytes, node_label)
+        root = FactoredTree.unflatten(fdt)
+        if _is_dtbo_overlay(root):
+            continue
+
+        parsed_dtb = ParsedDtb(
+            node_label,
+            comp=comp,
+            fdt=fdt,
+            root=root,
+            uncompressed_size=len(raw_bytes),
+            compressed_size=len(raw_data),
+        )
+        fdt_entries.append({
+            'name': img_name,
+            'node': img_node,
+            'dtb': parsed_dtb,
+            'fdt': fdt,
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
+def _partition_fit_fdt_entries(fdt_entries, single_base_dtb, min_overlap=50.0):
+    """Partition `fdt_entries` into factorable groups and unfactored singletons.
+
+    Args:
+        fdt_entries: List of FIT `flat_dt` entry dicts from
+            `_extract_fit_fdt_entries()`.
+        single_base_dtb: If True, require all `fdt_entries` to share a single
+            base DTB group regardless of property overlap.
+        min_overlap: Minimum normalized property byte overlap percentage (`0.0`
+            to `100.0`) used when `single_base_dtb` is False.
+
+    Returns:
+        Tuple of `(factorable_groups, unfactored_entries)` where
+        `factorable_groups` is a list of entry-dict lists (each containing at
+        least 2 entries) and `unfactored_entries` is a list of single-board
+        entry dicts left unfactored.
+    """
+    if single_base_dtb:
+        ref_entry = fdt_entries[0]
+        for entry in fdt_entries[1:]:
+            for prop in ('arch', 'load'):
+                if (entry['node'].props.get(prop) !=
+                        ref_entry['node'].props.get(prop)):
+                    raise ValueError(
+                        f'--single-base-dtb requires all FIT flat_dt nodes to '
+                        f'use the same {prop} property: {ref_entry["name"]} vs '
+                        f'{entry["name"]}'
+                    )
+        for entry in fdt_entries:
+            entry.pop('fdt', None)
+        return [fdt_entries], []
+
+    groups = group_fit_dtbs(fdt_entries, min_overlap=min_overlap)
+    factorable_groups = [g for g in groups if len(g) >= 2]
+    if not factorable_groups:
+        raise ValueError(
+            'FIT must contain at least two compatible '
+            'flat_dt nodes to factor'
+        )
+    for g in factorable_groups:
+        for entry in g:
+            entry.pop('fdt', None)
+    unfactored_entries = [g[0] for g in groups if len(g) == 1]
+    for entry in unfactored_entries:
+        print(
+            f'Note: FIT flat_dt node {entry["name"]} has no '
+            f'compatible peers and will be left unfactored',
+            file=sys.stderr,
+        )
+    return factorable_groups, unfactored_entries
+
+
+def _strip_fit_unfactored_local_fixups(unfactored_entries):
+    """Strip `/__local_fixups__` from unfactored FIT `flat_dt` entries.
+
+    Args:
+        unfactored_entries: List of single-board FIT `flat_dt` entry dicts left
+            unfactored by `_partition_fit_fdt_entries()`.
+    """
+    for entry in unfactored_entries:
+        fdt = entry.pop('fdt')
+        tree = libpydt.DeviceTree.unflatten(fdt)
+        if tree.children.pop('__local_fixups__', None) is None:
+            continue
+        stripped_fdt = tree.flatten(
+            mem_rsv=entry['dtb'].mem_rsv,
+            boot_cpuid_phys=entry['dtb'].boot_cpuid_phys,
+        )
+        comp_bytes = compress_blob(
+            bytes(stripped_fdt.as_bytearray()),
+            entry['dtb'].compression,
+            filename=f'/images/{entry["name"]}',
+        )
+        img_node = entry['node']
+        img_node.set_prop(libfdt.Property('data', comp_bytes))
+        _update_fit_hashes(img_node)
+
+
+def _factor_fit_group(entries, base_dtb_node_name, strip_local_fixups):
+    """Factor one group of FIT `flat_dt` entries into a base node and overlays.
+
+    Args:
+        entries: List of FIT `flat_dt` entry dicts in this group.
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
+    base_dtb_blob, dtbo_blobs = create_base_dtb_and_overlays(
+        group_dtbs, strip_local_fixups=strip_local_fixups
+    )
+    base_comp = group_dtbs[0].compression
+
+    base_dtb_comp_bytes = compress_blob(
+        base_dtb_blob, base_comp, filename=f'/images/{base_dtb_node_name}'
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
+        first_desc = base_dtb_node.props['description'].as_str()
+        ext = COMP_TO_EXT[base_comp]
+        base_suffix = ext if (ext and first_desc.endswith(ext)) else ''
+        base_dtb_node.set_prop(
+            libfdt.Property.from_str(
+                'description', f'{base_dtb_node_name}.dtb{base_suffix}'
+            )
+        )
+    base_dtb_node.set_prop(libfdt.Property('data', base_dtb_comp_bytes))
+    if 'compression' in base_dtb_node.props or base_comp != 'none':
+        comp_prop = 'lz4' if base_comp == 'lz4_legacy' else base_comp
+        base_dtb_node.set_prop(
+            libfdt.Property.from_str('compression', comp_prop)
+        )
+    _update_fit_hashes(base_dtb_node)
+
+    dtbo_comp_sizes = []
+    for entry, dtbo_blob in zip(entries, dtbo_blobs):
+        img_node = entry['node']
+        entry_comp = entry['dtb'].compression
+        dtbo_comp_bytes = compress_blob(
+            dtbo_blob, entry_comp, filename=f'/images/{entry["name"]}'
+        )
+        dtbo_comp_sizes.append(len(dtbo_comp_bytes))
+
+        if 'description' in img_node.props:
+            new_desc = _rewrite_fit_dtbo_desc(
+                img_node.props['description'].as_str(), entry_comp
+            )
+            if new_desc is not None:
+                img_node.set_prop(
+                    libfdt.Property.from_str('description', new_desc)
+                )
+
+        # Strip 'load' from overlay image nodes so bootloaders do not copy an
+        # overlay onto the base FDT's RAM load address.
+        img_node.props.pop('load', None)
+
+        img_node.set_prop(libfdt.Property('data', dtbo_comp_bytes))
+        _update_fit_hashes(img_node)
+
+    stat_args = (
+        group_dtbs,
+        base_dtb_blob,
+        dtbo_blobs,
+        base_comp,
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
+        fdt_list = conf_node.props['fdt'].as_stringlist()
+        if not fdt_list:
+            continue
+        primary_fdt = fdt_list[0]
+        for extra_fdt in fdt_list[1:]:
+            if extra_fdt in fdt_to_base_dtb:
+                raise ValueError(
+                    f'/configurations/{conf_name} lists factored flat_dt '
+                    f'{extra_fdt!r} after the primary FDT'
+                )
+        if primary_fdt not in fdt_to_base_dtb:
+            continue
+        base_dtb_name, orig_dtb = fdt_to_base_dtb[primary_fdt]
+        conf_node.set_prop(
+            libfdt.Property.from_stringlist('fdt', [base_dtb_name] + fdt_list)
+        )
+        # If the configuration omitted 'compatible' (relying on the
+        # bootloader reading root 'compatible' from fdt_list[0]), copy the
+        # board's root 'compatible' property onto the configuration node
+        # now that fdt_list[0] is the shared base DTB.
+        if 'compatible' in conf_node.props:
+            continue
+        root_compat = orig_dtb.root.props.get('compatible')
+        if root_compat is not None:
+            conf_node.set_prop(root_compat)
+
+
+def factor_fit(fit_in_path, fit_out_path, strip_local_fixups=False,
+               single_base_dtb=False, min_overlap=50.0, stats=False):
+    """Factor all `flat_dt` images in a compiled FIT into base + overlays.
+
+    Args:
+        fit_in_path: Path to the input compiled FIT.
+        fit_out_path: Path where the factored FIT should be written.
+        strip_local_fixups: If True, omit `/__local_fixups__` from generated
+            base DTBs.
+        single_base_dtb: If True, force all `flat_dt` nodes into a single
+            `fdt-base-1` base DTB.
+        min_overlap: Minimum normalized property byte overlap percentage
+            (`0.0` to `100.0`, default `50.0`) when `single_base_dtb` is False.
+        stats: If True, print per-group and overall FIT size savings.
+    """
+    with open(fit_in_path, 'rb') as f:
+        orig_fit_bytes = f.read()
+
+    orig_fit_fdt = _open_fdt(orig_fit_bytes, fit_in_path)
+    fit_root = libpydt.DeviceTree.unflatten(orig_fit_fdt)
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
+    factorable_groups, unfactored_entries = _partition_fit_fdt_entries(
+        fdt_entries, single_base_dtb, min_overlap=min_overlap
+    )
+    if strip_local_fixups and unfactored_entries:
+        _strip_fit_unfactored_local_fixups(unfactored_entries)
+    else:
+        for entry in unfactored_entries:
+            entry.pop('fdt', None)
+
+    fdt_to_base_dtb = {}
+    insert_before_first = {}
+    group_stats = []
+    used_image_names = set(images_node.children)
+    next_base_idx = 1
+
+    for entries in factorable_groups:
+        while f'fdt-base-{next_base_idx}' in used_image_names:
+            next_base_idx += 1
+        base_dtb_node_name = f'fdt-base-{next_base_idx}'
+        used_image_names.add(base_dtb_node_name)
+        next_base_idx += 1
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
+    new_fit_bytes = new_fit_fdt.as_bytearray()
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
 
@@ -857,23 +1483,69 @@ def parse_args(argv=None):
         Parsed `argparse.Namespace` instance.
     """
     parser = argparse.ArgumentParser(
+        prog='fdtfactor',
+        usage=(
+            '%(prog)s [-h] [-o DIR] [-S] [-s] [--output-base-dtb FILENAME]\n'
+            '                 [-C {none,lz4,lz4_legacy,lzma,xz,gzip}] '
+            'DTB DTB [DTB ...]\n'
+            '       %(prog)s -F FIT_FILE [-o FIT_OUT] [-S] [-s] '
+            '[--min-overlap PERCENT]\n'
+            '                 [--single-base-dtb]'
+        ),
         description=(
             'Split a set of compiled device tree blobs (.dtb, or compressed '
-            '.dtb.lz4/.xz/.lzma/.gz with -C) into a single common base .dtb '
-            'and per-board overlay blobs (.dtbo).'
-        )
+            '.dtb.lz4/.xz/.lzma/.gz with -C) into a common base .dtb and '
+            'per-board overlay blobs (.dtbo), or update a compiled FIT '
+            '(-F/--fit) in place (or to -o/--output) by factoring its '
+            '/images/fdt-* blobs into base DTBs and overlays.'
+        ),
+    )
+    parser.add_argument(
+        '-o', '--output',
+        default=None,
+        metavar='PATH',
+        help=(
+            'Output directory in standalone DTB mode (default: alongside each '
+            'input .dtb for .dtbo, current directory for --output-base-dtb), '
+            'or output FIT path in FIT mode (default: overwrite --fit in '
+            'place)'
+        ),
     )
     parser.add_argument(
+        '-S', '--strip-local-fixups',
+        action='store_true',
+        help=(
+            'Omit /__local_fixups__ from generated base DTB(s) and '
+            'reconstructed device trees'
+        ),
+    )
+    parser.add_argument(
+        '-s', '--stats',
+        action='store_true',
+        help='Print size statistics summary',
+    )
+
+    dtb_group = parser.add_argument_group('standalone DTB mode')
+    dtb_group.add_argument(
+        'dtbs',
+        nargs='*',
+        metavar='DTB',
+        help=(
+            'Input .dtb (or compressed .dtb.lz4/.xz/.lzma/.gz with -C) files '
+            '(at least two required)'
+        ),
+    )
+    dtb_group.add_argument(
         '--output-base-dtb',
         default=None,
         metavar='FILENAME',
         help=(
             'Output common base .dtb filename (default: base.dtb, or '
-            'base.dtb.<ext> when -C/--compression is used; placed in --output '
-            'if specified, or current directory otherwise)'
+            'base.dtb.<ext> when -C/--compression is used; placed in '
+            '-o/--output if specified, or current directory otherwise)'
         ),
     )
-    parser.add_argument(
+    dtb_group.add_argument(
         '-C', '--compression',
         choices=tuple(COMP_TO_EXT),
         default='none',
@@ -882,62 +1554,82 @@ def parse_args(argv=None):
             'files (default: none)'
         ),
     )
-    parser.add_argument(
-        '-o', '--output',
+
+    fit_group = parser.add_argument_group('FIT mode')
+    fit_group.add_argument(
+        '-F', '--fit',
         default=None,
-        metavar='DIR',
+        metavar='FIT_FILE',
         help=(
-            'Output directory for generated .dtbo files and '
-            '--output-base-dtb (default: alongside each input .dtb for .dtbo, '
-            'current directory for --output-base-dtb)'
+            'Input compiled FIT (.fit / .itb) to factor (updated in place '
+            'unless -o/--output is specified)'
         ),
     )
-    parser.add_argument(
-        '-S', '--strip-local-fixups',
-        action='store_true',
+    fit_group.add_argument(
+        '--min-overlap',
+        type=float,
+        default=None,
+        metavar='PERCENT',
         help=(
-            'Omit /__local_fixups__ from the generated base .dtb and '
-            'reconstructed device trees'
+            'Minimum shared normalized property byte overlap percentage '
+            '(0-100) to group FIT flat_dt nodes into the same base DTB '
+            '(default: 50)'
         ),
     )
-    parser.add_argument(
-        '-s', '--stats',
+    fit_group.add_argument(
+        '--single-base-dtb',
         action='store_true',
-        help='Print size statistics summary',
-    )
-    parser.add_argument(
-        'dtbs',
-        nargs='+',
-        metavar='DTB',
         help=(
-            'Input .dtb (or compressed .dtb.lz4/.xz/.lzma/.gz with -C) files '
-            '(at least two required)'
+            'Force all flat_dt nodes in the FIT into a single fdt-base-1 base '
+            'DTB, failing only if FDT headers, arch, or load differ'
         ),
     )
     args = parser.parse_args(argv)
-    if args.output_base_dtb is None:
-        args.output_base_dtb = f'base.dtb{COMP_TO_EXT[args.compression]}'
-    if not args.output_base_dtb or os.path.dirname(args.output_base_dtb):
+    if args.single_base_dtb and not args.fit:
+        parser.error('--single-base-dtb requires -F/--fit')
+    if args.min_overlap is not None and not args.fit:
+        parser.error('--min-overlap requires -F/--fit')
+    if args.min_overlap is not None and args.single_base_dtb:
         parser.error(
-            '--output-base-dtb must be a non-empty filename without directory '
-            'components; use -o/--output to specify the output directory'
+            '--min-overlap cannot be combined with --single-base-dtb'
         )
-    if len(args.dtbs) < 2:
-        parser.error('at least two input .dtb files are required')
+    if args.min_overlap is not None and not (0.0 <= args.min_overlap <= 100.0):
+        parser.error('--min-overlap must be between 0 and 100')
+    if args.min_overlap is None:
+        args.min_overlap = 50.0
+    if args.fit:
+        if (args.dtbs or args.output_base_dtb is not None or
+                args.compression != 'none'):
+            parser.error(
+                '-F/--fit cannot be combined with --output-base-dtb, '
+                '-C/--compression, or positional DTB arguments'
+            )
+    else:
+        if args.output_base_dtb is None:
+            args.output_base_dtb = f'base.dtb{COMP_TO_EXT[args.compression]}'
+        if not args.output_base_dtb or os.path.dirname(args.output_base_dtb):
+            parser.error(
+                '--output-base-dtb must be a non-empty filename without '
+                'directory components; use -o/--output to specify the output '
+                'directory'
+            )
+        if len(args.dtbs) < 2:
+            parser.error('at least two input .dtb files are required')
     return args
 
 
-def _print_dtb_stats(dtbs, base_dtb_blob, dtbo_blobs, comp, base_dtb_csize,
-                     dtbo_csizes):
+def _print_dtb_stats(dtbs, base_dtb_blob, dtbo_blobs, base_dtb_comp,
+                     base_dtb_csize, dtbo_csizes, prefix=''):
     """Print uncompressed and compressed size savings summary.
 
     Args:
         dtbs: Sequence of input `ParsedDtb` instances.
         base_dtb_blob: Uncompressed base DTB `bytes`.
         dtbo_blobs: Sequence of uncompressed `.dtbo` overlay `bytes`.
-        comp: Compression format of the inputs and outputs.
+        base_dtb_comp: Compression format of the base DTB output.
         base_dtb_csize: Byte size of the compressed base DTB output.
         dtbo_csizes: Sequence of byte sizes of the compressed `.dtbo` outputs.
+        prefix: Optional line prefix (e.g., `'[fdt-base-1] '`).
     """
     orig_uncomp = sum(d.uncompressed_size for d in dtbs)
     base_dtb_uncomp = len(base_dtb_blob)
@@ -946,22 +1638,25 @@ def _print_dtb_stats(dtbs, base_dtb_blob, dtbo_blobs, comp, base_dtb_csize,
     saved_uncomp = orig_uncomp - new_uncomp
     pct_uncomp = (saved_uncomp / orig_uncomp * 100.0) if orig_uncomp else 0.0
     print(
-        f'Uncompressed DTBs: {len(dtbs)} files ({orig_uncomp:,} B) -> '
+        f'{prefix}Uncompressed DTBs: {len(dtbs)} files ({orig_uncomp:,} B) -> '
         f'base {base_dtb_uncomp:,} B + {len(dtbo_blobs)} overlays '
         f'{dtbo_uncomp:,} B = {new_uncomp:,} B '
         f'(saved {saved_uncomp:,} B / {pct_uncomp:.1f}%)'
     )
-    if comp != 'none':
+    comps = sorted({base_dtb_comp, *(d.compression for d in dtbs)})
+    if any(c != 'none' for c in comps):
+        comp_label = '/'.join(comps)
         orig_comp = sum(d.compressed_size for d in dtbs)
         dtbo_csize = sum(dtbo_csizes)
         new_comp = base_dtb_csize + dtbo_csize
         saved_comp = orig_comp - new_comp
         pct_comp = (saved_comp / orig_comp * 100.0) if orig_comp else 0.0
         print(
-            f'Compressed ({comp}): {len(dtbs)} files ({orig_comp:,} B) -> '
-            f'base {base_dtb_csize:,} B + {len(dtbo_blobs)} overlays '
-            f'{dtbo_csize:,} B (avg {dtbo_csize // len(dtbo_blobs):,} B) = '
-            f'{new_comp:,} B (saved {saved_comp:,} B / {pct_comp:.1f}%)'
+            f'{prefix}Compressed ({comp_label}): {len(dtbs)} files '
+            f'({orig_comp:,} B) -> base {base_dtb_csize:,} B + '
+            f'{len(dtbo_blobs)} overlays {dtbo_csize:,} B '
+            f'(avg {dtbo_csize // len(dtbo_blobs):,} B) = {new_comp:,} B '
+            f'(saved {saved_comp:,} B / {pct_comp:.1f}%)'
         )
 
 
@@ -1032,7 +1727,7 @@ def factor_dtb_files(args):
     if args.stats:
         _print_dtb_stats(
             dtbs, base_dtb_blob, dtbo_blobs,
-            comp=comp,
+            base_dtb_comp=comp,
             base_dtb_csize=len(base_dtb_file_bytes),
             dtbo_csizes=dtbo_file_sizes,
         )
@@ -1049,7 +1744,18 @@ def main(argv=None):
     """
     args = parse_args(argv)
     try:
-        factor_dtb_files(args)
+        if args.fit:
+            fit_out = args.output if args.output is not None else args.fit
+            factor_fit(
+                args.fit,
+                fit_out,
+                strip_local_fixups=args.strip_local_fixups,
+                single_base_dtb=args.single_base_dtb,
+                min_overlap=args.min_overlap,
+                stats=args.stats,
+            )
+        else:
+            factor_dtb_files(args)
     except (OSError, ValueError, RuntimeError, struct.error,
             libfdt.FdtException) as exc:
         sys.exit(f'Error: {exc}')
diff --git a/tests/Makefile.tests b/tests/Makefile.tests
index 1eed9ba6478a..351d4ed199b5 100644
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
index 000000000000..4939223e57da
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
+			description = "fdtfactor_other1.test.dtb";
+			data = /incbin/("fdtfactor_other1.test.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-5 {
+			description = "fdtfactor_other2.test.dtb";
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
index 000000000000..1396815974e5
--- /dev/null
+++ b/tests/fdtfactor_other1.dts
@@ -0,0 +1,67 @@
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
+		other-shared-data = <
+			0xfefdfcfb 0xfaf9f8f7 0xf6f5f4f3 0xf2f1f0ef
+			0xeeedeceb 0xeae9e8e7 0xe6e5e4e3 0xe2e1e0df
+			0xdedddcdb 0xdad9d8d7 0xd6d5d4d3 0xd2d1d0cf
+			0xcecdcccb 0xcac9c8c7 0xc6c5c4c3 0xc2c1c0bf
+			0xbebdbcbb 0xbab9b8b7 0xb6b5b4b3 0xb2b1b0af
+			0xaeadacab 0xaaa9a8a7 0xa6a5a4a3 0xa2a1a09f
+			0x9e9d9c9b 0x9a999897 0x96959493 0x9291908f
+			0x8e8d8c8b 0x8a898887 0x86858483 0x8281807f
+			0x7e7d7c7b 0x7a797877 0x76757473 0x7271706f
+			0x6e6d6c6b 0x6a696867 0x66656463 0x6261605f
+			0x5e5d5c5b 0x5a595857 0x56555453 0x5251504f
+			0x4e4d4c4b 0x4a494847 0x46454443 0x4241403f
+			0x3e3d3c3b 0x3a393837 0x36353433 0x3231302f
+			0x2e2d2c2b 0x2a292827 0x26252423 0x2221201f
+			0x1e1d1c1b 0x1a191817 0x16151413 0x1211100f
+			0x0e0d0c0b 0x0a090807 0x06050403 0x020100ff
+			0xfdfbf9f7 0xf5f3f1ef 0xede9e7e5 0xe3e1dfdd
+			0xdbdad8d6 0xd4d2d0ce 0xcccbc9c7 0xc5c3c1bf
+			0xbdbbb9b7 0xb5b3b1af 0xadaba9a7 0xa5a3a19f
+			0x9d9b9997 0x9593918f 0x8d8b8987 0x8583817f
+			0x7d7b7977 0x7573716f 0x6d6b6967 0x6563615f
+			0x5d5b5957 0x5553514f 0x4d4b4947 0x4543413f
+			0x3d3b3937 0x3533312f 0x2d2b2927 0x2523211f
+			0x1d1b1917 0x1513110f 0x0d0b0907 0x050301fe
+			0xfcf8f4f0 0xece8e4e0 0xdcd8d4d0 0xccc8c4c0
+			0xbcb8b4b0 0xaca8a4a0 0x9c989490 0x8c888480
+			0x7c787470 0x6c686460 0x5c585450 0x4c484440
+			0x3c383430 0x2c282420 0x1c181410 0x0c080400
+			0xfbf7f3ef 0xebe7e3df 0xdbd7d3cf 0xcbc7c3bf
+			0xbbb7b3af 0xaba7a39f 0x9b97938f 0x8b87837f
+			0x7b77736f 0x6b67635f 0x5b57534f 0x4b47433f
+			0x3b37332f 0x2b27231f 0x1b17130f 0x0b0703ff
+		>;
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
index 000000000000..c5ad9b53c047
--- /dev/null
+++ b/tests/fdtfactor_other2.dts
@@ -0,0 +1,67 @@
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
+		other-shared-data = <
+			0xfefdfcfb 0xfaf9f8f7 0xf6f5f4f3 0xf2f1f0ef
+			0xeeedeceb 0xeae9e8e7 0xe6e5e4e3 0xe2e1e0df
+			0xdedddcdb 0xdad9d8d7 0xd6d5d4d3 0xd2d1d0cf
+			0xcecdcccb 0xcac9c8c7 0xc6c5c4c3 0xc2c1c0bf
+			0xbebdbcbb 0xbab9b8b7 0xb6b5b4b3 0xb2b1b0af
+			0xaeadacab 0xaaa9a8a7 0xa6a5a4a3 0xa2a1a09f
+			0x9e9d9c9b 0x9a999897 0x96959493 0x9291908f
+			0x8e8d8c8b 0x8a898887 0x86858483 0x8281807f
+			0x7e7d7c7b 0x7a797877 0x76757473 0x7271706f
+			0x6e6d6c6b 0x6a696867 0x66656463 0x6261605f
+			0x5e5d5c5b 0x5a595857 0x56555453 0x5251504f
+			0x4e4d4c4b 0x4a494847 0x46454443 0x4241403f
+			0x3e3d3c3b 0x3a393837 0x36353433 0x3231302f
+			0x2e2d2c2b 0x2a292827 0x26252423 0x2221201f
+			0x1e1d1c1b 0x1a191817 0x16151413 0x1211100f
+			0x0e0d0c0b 0x0a090807 0x06050403 0x020100ff
+			0xfdfbf9f7 0xf5f3f1ef 0xede9e7e5 0xe3e1dfdd
+			0xdbdad8d6 0xd4d2d0ce 0xcccbc9c7 0xc5c3c1bf
+			0xbdbbb9b7 0xb5b3b1af 0xadaba9a7 0xa5a3a19f
+			0x9d9b9997 0x9593918f 0x8d8b8987 0x8583817f
+			0x7d7b7977 0x7573716f 0x6d6b6967 0x6563615f
+			0x5d5b5957 0x5553514f 0x4d4b4947 0x4543413f
+			0x3d3b3937 0x3533312f 0x2d2b2927 0x2523211f
+			0x1d1b1917 0x1513110f 0x0d0b0907 0x050301fe
+			0xfcf8f4f0 0xece8e4e0 0xdcd8d4d0 0xccc8c4c0
+			0xbcb8b4b0 0xaca8a4a0 0x9c989490 0x8c888480
+			0x7c787470 0x6c686460 0x5c585450 0x4c484440
+			0x3c383430 0x2c282420 0x1c181410 0x0c080400
+			0xfbf7f3ef 0xebe7e3df 0xdbd7d3cf 0xcbc7c3bf
+			0xbbb7b3af 0xaba7a39f 0x9b97938f 0x8b87837f
+			0x7b77736f 0x6b67635f 0x5b57534f 0x4b47433f
+			0x3b37332f 0x2b27231f 0x1b17130f 0x0b0703ff
+		>;
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
index 9b005396bc79..237e399803bb 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -1371,6 +1371,229 @@ fdtfactor_tests () {
             -o fdtfactor_comp_err.test.dir \
             fdtfactor_board1.test.dtb fdtfactor_board2.test.dtb
     fi
+
+    # FIT factoring (uncompressed and compressed, multi-group by property
+    # byte overlap)
+    # fdtget -t r appends a trailing newline; strip that last byte.
+    fdtget_raw () {
+        $DTGET -t r "$1" "$2" "$3" > "$4.tmp"
+        head -c $(($($STATSZ "$4.tmp") - 1)) "$4.tmp" > "$4"
+        rm -f "$4.tmp"
+    }
+    run_dtc_test -b 2 -@ -L -I dts -O dtb -o fdtfactor_other1.test.dtb \
+        "$SRCDIR/fdtfactor_other1.dts"
+    run_dtc_test -b 2 -@ -L -I dts -O dtb -o fdtfactor_other2.test.dtb \
+        "$SRCDIR/fdtfactor_other2.dts"
+    run_dtc_test -@ -I dts -O dtb -o overlay_overlay_phandle.test.dtb \
+        "$SRCDIR/overlay_overlay_phandle.dts"
+
+    run_dtc_test -i . -I dts -O dtb -o fdtfactor.test.fit \
+        "$SRCDIR/fdtfactor_test.its"
+    cp fdtfactor.test.fit fdtfactor_orig.test.fit
+    run_wrap_test $PYTHON $FDTFACTOR -s -F fdtfactor.test.fit
+    run_fdtget_test "fdt-base-1.dtb" fdtfactor.test.fit \
+        /images/fdt-base-1 description
+    run_fdtget_test "fdtfactor_board1.test.dtbo" fdtfactor.test.fit \
+        /images/fdt-1 description
+    run_fdtget_test "fdt-base-2.dtb" fdtfactor.test.fit \
+        /images/fdt-base-2 description
+    run_fdtget_test "fdtfactor_other1.test.dtbo" fdtfactor.test.fit \
+        /images/fdt-4 description
+    run_fdtget_test "fdt-base-1 fdt-1" fdtfactor.test.fit \
+        /configurations/conf-1 fdt
+    run_fdtget_test "fdt-base-1 fdt-2" fdtfactor.test.fit \
+        /configurations/conf-2 fdt
+    run_fdtget_test "fdt-base-1 fdt-3 fdt-ovl-1" fdtfactor.test.fit \
+        /configurations/conf-3 fdt
+    run_fdtget_test "fdt-base-2 fdt-4" fdtfactor.test.fit \
+        /configurations/conf-4 fdt
+    run_fdtget_test "fdt-base-2 fdt-5" fdtfactor.test.fit \
+        /configurations/conf-5 fdt
+    # conf-1 already had an explicit compatible property; conf-2 did not, so
+    # fdtfactor should populate it from fdt-2's root compatible property.
+    run_fdtget_test "vendor,board1 vendor,common" fdtfactor.test.fit \
+        /configurations/conf-1 compatible
+    run_fdtget_test "test_fdtfactor" fdtfactor.test.fit \
+        /configurations/conf-2 compatible
+    run_fdtget_test "vendor,other1 vendor,other" fdtfactor.test.fit \
+        /configurations/conf-4 compatible
+    # Verify that hash-1/value was populated for fdt-base-1, fdt-base-2, and
+    # updated for fdt-1.
+    base1_hash=$($DTGET -t bx fdtfactor.test.fit \
+        /images/fdt-base-1/hash-1 value)
+    base2_hash=$($DTGET -t bx fdtfactor.test.fit \
+        /images/fdt-base-2/hash-1 value)
+    fdt1_hash=$($DTGET -t bx fdtfactor.test.fit \
+        /images/fdt-1/hash-1 value)
+    if [ -z "$base1_hash" ] || [ -z "$base2_hash" ] || \
+       [ "$fdt1_hash" = "0 0 0 0 0 0 0 0" ]; then
+        FAIL "FIT hash-1 values were not updated"
+    fi
+    # Extract factored base DTBs and overlays from the FIT and verify all 5
+    # boards with fdtoverlay + dtbs_equal_unordered.
+    fdtget_raw fdtfactor.test.fit /images/fdt-base-1 data fit_base1.test.dtb
+    for i in 1 2 3; do
+        fdtget_raw fdtfactor.test.fit /images/fdt-${i} data \
+            fit_fdt${i}.test.dtbo
+        run_wrap_test $FDTOVERLAY -i fit_base1.test.dtb \
+            -o fit_merged${i}.test.dtb fit_fdt${i}.test.dtbo
+        check_factored_dtb fdtfactor_board${i}.test.dtb \
+            fit_merged${i}.test.dtb
+    done
+    fdtget_raw fdtfactor.test.fit /images/fdt-base-2 data fit_base2.test.dtb
+    for i in 1 2; do
+        idx=$((i + 3))
+        fdtget_raw fdtfactor.test.fit /images/fdt-${idx} data \
+            fit_fdt${idx}.test.dtbo
+        run_wrap_test $FDTOVERLAY -i fit_base2.test.dtb \
+            -o fit_merged${idx}.test.dtb fit_fdt${idx}.test.dtbo
+        check_factored_dtb fdtfactor_other${i}.test.dtb \
+            fit_merged${idx}.test.dtb
+    done
+
+    # --min-overlap controls the shared property byte overlap threshold
+    run_wrap_test $PYTHON $FDTFACTOR --min-overlap 1 \
+        -F fdtfactor_orig.test.fit -o fdtfactor_minovl.test.fit
+    run_fdtget_test "fdt-base-1 fdt-1" fdtfactor_minovl.test.fit \
+        /configurations/conf-1 fdt
+    run_fdtget_test "fdt-base-1 fdt-4" fdtfactor_minovl.test.fit \
+        /configurations/conf-4 fdt
+    run_wrap_error_test $PYTHON $FDTFACTOR --min-overlap 99 \
+        -F fdtfactor_orig.test.fit -o fdtfactor_minovl_hi.test.fit
+
+    # Unfactored singleton FIT entries retain /__local_fixups__ by default and
+    # strip it (updating hashes) when -S/--strip-local-fixups is passed.
+    cp fdtfactor_orig.test.fit fdtfactor_singleton_in.test.fit
+    run_wrap_test $DTPUT -r fdtfactor_singleton_in.test.fit \
+        /images/fdt-5 /configurations/conf-5
+    run_wrap_test $PYTHON $FDTFACTOR -F fdtfactor_singleton_in.test.fit \
+        -o fdtfactor_singleton_keep.test.fit
+    run_fdtget_test "fdt-4" fdtfactor_singleton_keep.test.fit \
+        /configurations/conf-4 fdt
+    fdtget_raw fdtfactor_singleton_keep.test.fit /images/fdt-4 data \
+        fit_singleton_keep.test.dtb
+    run_test check_path fit_singleton_keep.test.dtb exists "/__local_fixups__"
+    run_wrap_test $PYTHON $FDTFACTOR -S -F fdtfactor_singleton_in.test.fit \
+        -o fdtfactor_singleton_strip.test.fit
+    fdtget_raw fdtfactor_singleton_strip.test.fit /images/fdt-4 data \
+        fit_singleton_strip.test.dtb
+    run_test check_path fit_singleton_strip.test.dtb \
+        not-exists "/__local_fixups__"
+    run_test check_path fit_singleton_strip.test.dtb exists "/__symbols__"
+    fdt4_hash=$($DTGET -t bx fdtfactor_singleton_strip.test.fit \
+        /images/fdt-4/hash-1 value)
+    if [ -z "$fdt4_hash" ] || [ "$fdt4_hash" = "0 0 0 0 0 0 0 0" ]; then
+        FAIL "Singleton FIT hash-1 value was not updated under -S"
+    fi
+
+    # --single-base-dtb forces a single fdt-base-1 across all FDTs
+    run_wrap_test $PYTHON $FDTFACTOR --single-base-dtb \
+        -F fdtfactor_orig.test.fit -o fdtfactor_single.test.fit
+    run_fdtget_test "fdt-base-1.dtb" fdtfactor_single.test.fit \
+        /images/fdt-base-1 description
+    run_fdtget_test "fdt-base-1 fdt-1" fdtfactor_single.test.fit \
+        /configurations/conf-1 fdt
+    run_fdtget_test "fdt-base-1 fdt-4" fdtfactor_single.test.fit \
+        /configurations/conf-4 fdt
+    fdtget_raw fdtfactor_single.test.fit /images/fdt-base-1 data \
+        fit_single_base1.test.dtb
+    for i in 1 2 3; do
+        fdtget_raw fdtfactor_single.test.fit /images/fdt-${i} data \
+            fit_single_fdt${i}.test.dtbo
+        run_wrap_test $FDTOVERLAY -i fit_single_base1.test.dtb \
+            -o fit_single_merged${i}.test.dtb fit_single_fdt${i}.test.dtbo
+        check_factored_dtb fdtfactor_board${i}.test.dtb \
+            fit_single_merged${i}.test.dtb
+    done
+    for i in 1 2; do
+        idx=$((i + 3))
+        fdtget_raw fdtfactor_single.test.fit /images/fdt-${idx} data \
+            fit_single_fdt${idx}.test.dtbo
+        run_wrap_test $FDTOVERLAY -i fit_single_base1.test.dtb \
+            -o fit_single_merged${idx}.test.dtb fit_single_fdt${idx}.test.dtbo
+        check_factored_dtb fdtfactor_other${i}.test.dtb \
+            fit_single_merged${idx}.test.dtb
+    done
+
+    # Verify that conflicting image properties (e.g. arch) in a group fail
+    cp fdtfactor_orig.test.fit fdtfactor_bad_arch.test.fit
+    run_wrap_test $DTPUT fdtfactor_bad_arch.test.fit /images/fdt-4 \
+        arch -ts "arm"
+    run_wrap_error_test $PYTHON $FDTFACTOR --single-base-dtb \
+        -F fdtfactor_bad_arch.test.fit
+
+    # Verify that signed FITs (with signature* subnodes) and
+    # already-factored FITs (with no remaining compatible pairs) are rejected
+    cp fdtfactor_orig.test.fit fdtfactor_signed.test.fit
+    run_wrap_test $DTPUT fdtfactor_signed.test.fit -c \
+        /configurations/conf-1/signature-1
+    run_wrap_error_test $PYTHON $FDTFACTOR -F fdtfactor_signed.test.fit
+    run_wrap_error_test $PYTHON $FDTFACTOR -F fdtfactor.test.fit
+
+    # Pre-existing /images/fdt-base-* nodes do not collide: a second pass at
+    # --min-overlap 1 picks fdt-base-3 and produces a valid multi-stage chain.
+    run_wrap_test $PYTHON $FDTFACTOR -S --min-overlap 1 \
+        -F fdtfactor.test.fit -o fdtfactor_chained.test.fit
+    run_fdtget_test "fdt-base-3 fdt-base-1 fdt-1" fdtfactor_chained.test.fit \
+        /configurations/conf-1 fdt
+    run_fdtget_test "fdt-base-3 fdt-base-2 fdt-4" fdtfactor_chained.test.fit \
+        /configurations/conf-4 fdt
+    fdtget_raw fdtfactor_chained.test.fit /images/fdt-base-3 data \
+        fit_chain_b3.test.dtb
+    fdtget_raw fdtfactor_chained.test.fit /images/fdt-base-1 data \
+        fit_chain_b1.test.dtbo
+    fdtget_raw fdtfactor_chained.test.fit /images/fdt-1 data \
+        fit_chain_f1.test.dtbo
+    run_wrap_test $FDTOVERLAY -i fit_chain_b3.test.dtb \
+        -o fit_chain_merged1.test.dtb \
+        fit_chain_b1.test.dtbo fit_chain_f1.test.dtbo
+    run_test dtbs_equal_unordered fdtfactor_board1.nolf.test.dtb \
+        fit_chain_merged1.test.dtb
+
+    if command -v lz4 >/dev/null 2>&1; then
+        # fdt-2 stays uncompressed in fdtfactor_lz4.its to verify mixed
+        # compression within a single FIT group.
+        run_wrap_test lz4 -12 -q -f -m \
+            fdtfactor_board1.test.dtb \
+            fdtfactor_board3.test.dtb fdtfactor_other1.test.dtb \
+            fdtfactor_other2.test.dtb overlay_overlay_phandle.test.dtb
+        run_dtc_test -i . -I dts -O dtb -o fdtfactor_lz4.test.fit \
+            "$SRCDIR/fdtfactor_lz4.its"
+        run_wrap_test $PYTHON $FDTFACTOR -s \
+            -F fdtfactor_lz4.test.fit -o fdtfactor_lz4_out.test.fit
+        run_fdtget_test "fdt-base-1.dtb.lz4" fdtfactor_lz4_out.test.fit \
+            /images/fdt-base-1 description
+        run_fdtget_test "fdtfactor_board1.test.dtbo.lz4" \
+            fdtfactor_lz4_out.test.fit /images/fdt-1 description
+        run_fdtget_test "fdtfactor_board2.test.dtbo" \
+            fdtfactor_lz4_out.test.fit /images/fdt-2 description
+        run_fdtget_test "fdt-base-2.dtb" fdtfactor_lz4_out.test.fit \
+            /images/fdt-base-2 description
+        run_fdtget_test "fdtfactor_other1.test.dtbo" \
+            fdtfactor_lz4_out.test.fit /images/fdt-4 description
+        run_fdtget_test "fdt-base-1 fdt-1" fdtfactor_lz4_out.test.fit \
+            /configurations/conf-1 fdt
+        run_fdtget_test "fdt-base-1 fdt-2" fdtfactor_lz4_out.test.fit \
+            /configurations/conf-2 fdt
+        run_fdtget_test "fdt-base-2 fdt-4" fdtfactor_lz4_out.test.fit \
+            /configurations/conf-4 fdt
+        fdtget_raw fdtfactor_lz4_out.test.fit /images/fdt-base-1 data \
+            fit_lz4_base1.test.dtb.lz4
+        fdtget_raw fdtfactor_lz4_out.test.fit /images/fdt-1 data \
+            fit_lz4_fdt1.test.dtbo.lz4
+        fdtget_raw fdtfactor_lz4_out.test.fit /images/fdt-2 data \
+            fit_lz4_fdt2.test.dtbo
+        run_wrap_test lz4 -d -q -f --rm fit_lz4_base1.test.dtb.lz4
+        run_wrap_test lz4 -d -q -f --rm fit_lz4_fdt1.test.dtbo.lz4
+        run_wrap_test $FDTOVERLAY -i fit_lz4_base1.test.dtb \
+            -o fit_lz4_merged1.test.dtb fit_lz4_fdt1.test.dtbo
+        check_factored_dtb fdtfactor_board1.test.dtb \
+            fit_lz4_merged1.test.dtb
+        run_wrap_test $FDTOVERLAY -i fit_lz4_base1.test.dtb \
+            -o fit_lz4_merged2.test.dtb fit_lz4_fdt2.test.dtbo
+        check_factored_dtb fdtfactor_board2.test.dtb \
+            fit_lz4_merged2.test.dtb
+    fi
 }
 
 while getopts "vt:me" ARG ; do
@@ -1400,7 +1623,7 @@ if [ -z "$TESTSETS" ]; then
 fi
 
 # Make sure we don't have stale blobs lying around
-rm -f *.test.dtb *.test.dtbo *.test.dts *.test.dtb.gz *.test.dtbo.gz \
+rm -f *.test.dtb *.test.dtbo *.test.dts *.test.fit *.test.dtb.gz *.test.dtbo.gz \
     *.test.dtb.xz *.test.dtbo.xz *.test.dtb.lzma *.test.dtbo.lzma \
     *.test.dtb.lz4 *.test.dtbo.lz4
 rm -rf *.test.dir
-- 
2.56.0.679.gc527c65306-goog

