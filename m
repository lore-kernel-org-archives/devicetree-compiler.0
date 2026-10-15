Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B5C57F73E
	for <Devicetree-compiler@vger.kernel.org>; Thu, 15 Oct 2026 18:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792088599; cv=none; b=euH1uU3bYBSAN01mHcb+A7vu6yFYtoj0dU+C26Fur6Z5b++Fljc9vV20UTcD/0HrnLKEjdCUfxf7Hiq6Axipen/HVtW1+SNrlmqfweh8g82PYh10TKkddgOhyYYlsp5uscZxdioITyoZQxfZJD0lQbTO62K+pAn2vFrTOHDSteA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792088599; c=relaxed/simple;
	bh=tioGJIMeyj2PWzM6Uv7IGFe5Z2skPmofv2szHNtMkvk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hv21kqFNbdAPXvgt5EYRMEbgb2jOIQ6DreqC1+Drg5xeggZmTQgtV11oDfr/n/Vfl3QFZ1J8pKyy8F+o2fYxKieD1SK/PlZDxWVOEOBGva+iLDt93wdGuuDAlT0KQCe6NcPpQhnD86q5MycrKFXxIU3RCla0KFShkETg8An97G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FyJTf6Nk; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FyJTf6Nk"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-144f79153f5so235021c88.0
        for <Devicetree-compiler@vger.kernel.org>; Thu, 15 Oct 2026 11:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792088591; x=1792693391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WQ9fGwFGxn8dcozazfByEfm6bIeBTesM/0e15adWCYw=;
        b=FyJTf6NkbS32YVKK9emYHQyFLysA8c4pbaIaBhU6oJ1yJO1n2RxlqF58kko1zf0eFl
         4uhO6+zyb61a7D52nGHcJin11PMWnAKgDoDuEHtpmTcn+6RXeDN+h6w29J9gLpIzWNlb
         JNFLP5wk5QvklAKPs+KtwGLaCEKfA+fcrDKPs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792088591; x=1792693391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WQ9fGwFGxn8dcozazfByEfm6bIeBTesM/0e15adWCYw=;
        b=qoALxtw1ia2WOrqj6SRE1TpxjaqFN8cClHZKzTfBU8yBxWp1b9CWH+fmU4+UBMEEb8
         qXrwGf06UhOfiWnrIJ0jIVTdiu11BPJ83BayZE/iL3j2UwBEd76N8VCfPNYLGqN2UBu1
         179Tu9AU/X/vFiHJRQgrLyNSQOJslWgxc+8an5VIZK5Oz6UKU4or6Nm5tYoUr4UZYV/z
         4bbBaXwU8gYvyX3THt0ElReK2LAmdtMzyTYETBaSkWTlJkQ2FMYzi0VLRzQo7v9OGyrI
         woSmaOHC1O63kLuwAc0RfQ6YGOVsdr5PsfduFsZca8fuLA7HEym6aygOij9/1f2AzAed
         liVg==
X-Gm-Message-State: AFq9FYKpyWoOwyYhd8UNDk2Nb1vnucixree2tTbbjS/Us5nFGeoHwNpU
	UfNiYIGbbOq4cttw2yZzeAhqrOcXilxVNP9uc5cnmegI1DIqvBQBbG9I77gXyODSVGV9N6NXXn5
	j14E=
X-Gm-Gg: AYBFou17jL2dvMH7ppBDG+lOrl65lHdWI82r7fAGm4/no3Fpmw1Wm4PbwHPdcI93IHl
	IUg5oxb4a69B2MTT9zdutATfMWy0NRIBuFYFeJQ4LQBuwQKuuQswkQKrSGspnpHSkqbqJbuL+J+
	ZxgxusUvuZPGW4iIixprcnCywC77pnXEYGlScK5s608tDzAyoBY1Ih63WRl1wMDd+8VncE/T93H
	Hm05JUlLWTfoPMG1VGydoTzHnTHNsHLLK+tZvePrxo5Wot/M6s4vGCE32+dJkVyMheZkMugwi1k
	XSMkWE5xtTgOSklZZaAKzTTMl6g3Ltjx6zvXlxjo7nqE4vZ6ivKE5PnD+XkGcO4yne7OjZaW/DX
	2D0x8yr33QJpvZOjkE6VvI6VcIO3VtMiYPO4Ic782bQ6gYm4Ps6spOA+ZQkhJh9TsMlr8ESWv78
	yqDWUCb5qRcMxrSiHO2Wc/eCwS9QenEnVpoQXur8rQh3k/7LWoNSAx2dHKPuQyEaEQeKqlZJ5mQ
	Jz/Y8TUo0FgTgBVViSxwwhJYqf0m4glcaSuU4Zcx2xhgZdiem2jypETMiI=
X-Received: by 2002:a05:701b:4504:10b0:182:c472:b123 with SMTP id a92af1059eb24-182c472d135mr173954c88.1.1792088591080;
        Thu, 15 Oct 2026 11:23:11 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:9ea0:3a29:323e:5f11])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-182a8a4a56bsm727204c88.20.2026.10.15.11.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 11:23:09 -0700 (PDT)
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
Subject: [PATCH 3/4] fdtfactor: Support compressed DTB inputs and outputs
Date: Thu, 15 Oct 2026 11:21:36 -0700
Message-ID: <20261015182221.2931742-4-dianders@chromium.org>
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

Firmware and FIT image build pipelines frequently store device tree
blobs compressed with LZ4, LZMA/XZ, or gzip (e.g., `.dtb.lz4`).

Extend `fdtfactor` to detect compressed input blobs by magic bytes or
file extension, transparently decompress them before factoring, and
compress the resulting `.dtbo` and `base.dtb` outputs when appropriate:

- Support `.lz4` (via the `lz4` CLI), `.lzma`/`.xz` (via Python's
  `lzma` module), and `.gz` (via Python's `gzip` module).
- Preserve the input compression format on generated `.dtbo` files and
  compress `base.dtb` when its output path carries a compression suffix
  (e.g., `-b base.dtb.lz4`).
- Report compressed size savings alongside uncompressed savings when
  `-v`/`--verbose` is specified.

On the 47 Qualcomm SC7180 Trogdor Chromebook `.dtb.lz4` files,
`fdtfactor -S` reduces total LZ4-compressed size from 1.71 MB to 213 KB
(87.5% savings).

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 README.md            |  16 +--
 fdtfactor            | 267 ++++++++++++++++++++++++++++++++++++++-----
 tests/Makefile.tests |   5 +-
 tests/run_tests.sh   |  34 +++++-
 4 files changed, 284 insertions(+), 38 deletions(-)

diff --git a/README.md b/README.md
index e2ff2374b01d..6ace31bfbfdb 100644
--- a/README.md
+++ b/README.md
@@ -94,10 +94,10 @@ values.
 ## fdtfactor
 
 `fdtfactor` is a Python tool built on `pylibfdt` that takes a set of
-compiled device tree blobs (`.dtb`) and splits them into a single common
-`base.dtb` and per-board `.dtbo` overlays so that applying a board's
-`.dtbo` to `base.dtb` recreates the original board device tree while
-reducing total storage size.
+compiled device tree blobs (`.dtb`, or compressed `.dtb.lz4`, `.dtb.xz`,
+`.dtb.lzma`, `.dtb.gz`) and splits them into a single common `base.dtb` and
+per-board `.dtbo` overlays so that applying a board's `.dtbo` to `base.dtb`
+recreates the original board device tree while reducing total storage size.
 
 Input `.dtb` files must be compiled with `dtc -@ -L` so that both
 `/__symbols__` (used to resolve overlay `/__fixups__` against `base.dtb`)
@@ -112,8 +112,10 @@ $ fdtfactor -b base.dtb -o out_dir board1.dtb board2.dtb board3.dtb
 
 Options:
 
-* `-b`, `--base-dtb`: Output path for the common base `.dtb` (placed in
-  `--outdir` if specified without a directory component).
+* `-b`, `--base-dtb`: Output path for the common base `.dtb` (compressed if
+  given a `.lz4`, `.xz`, `.lzma`, or `.gz` suffix, whereas each `.dtbo`
+  preserves its input `.dtb`'s compression; placed in `--outdir` if specified
+  without a directory component).
 * `-o`, `--outdir`: Output directory for generated `.dtbo` files (and for
   `--base-dtb` when given without a directory component).
 * `-S`, `--strip-local-fixups`: Omit `/__local_fixups__` from the generated
@@ -127,7 +129,7 @@ Options:
   original `.dtb`'s `/__local_fixups__` subtree verbatim.
 * `--verify`: Verify that applying each generated `.dtbo` to `base.dtb`
   with `libfdt` recreates the original `.dtb`.
-* `-v`, `--verbose`: Print size savings summary.
+* `-v`, `--verbose`: Print uncompressed and compressed size savings.
 
 ### TODO
 
diff --git a/fdtfactor b/fdtfactor
index 377f499bea50..9f06801f973c 100755
--- a/fdtfactor
+++ b/fdtfactor
@@ -11,31 +11,195 @@ original device tree.
 
 import argparse
 from collections import Counter
+import gzip
+import lzma
 import os
 import struct
+import subprocess
 import sys
 
 import libfdt
 
 
+FDT_MAGIC = b'\xd0\x0d\xfe\xed'
+LZ4_MAGIC = b'\x04\x22\x4d\x18'
+LZ4_LEGACY_MAGIC = b'\x02\x21\x4c\x18'
+GZIP_MAGIC = b'\x1f\x8b'
+XZ_MAGIC = b'\xfd7zXZ\x00'
+# Matches raw LZMA_ALONE headers with default lc=3, lp=0, pb=2 (0x5d) and
+# power-of-two dictionary sizes >= 64 KiB; .lzma extension handles any
+# non-default LZMA headers.
+LZMA_ALONE_MAGIC = b'\x5d\x00\x00'
+
+COMP_TO_EXT = {
+    'none': '',
+    'lz4': '.lz4',
+    'lzma': '.lzma',
+    'xz': '.xz',
+    'gzip': '.gz',
+}
+
+EXT_TO_COMP = {
+    '.lz4': 'lz4',
+    '.lzma': 'lzma',
+    '.xz': 'xz',
+    '.gz': 'gzip',
+}
+
+
+def detect_compression(raw_bytes, filename=''):
+    """Detect compression algorithm from magic bytes or filename extension.
+
+    Args:
+        raw_bytes: Input file or blob contents as `bytes`.
+        filename: Optional file path or name for extension fallback.
+
+    Returns:
+        Compression algorithm name (`'none'`, `'lz4'`, `'lzma'`, `'xz'`, or
+        `'gzip'`).
+    """
+    if raw_bytes.startswith(FDT_MAGIC):
+        return 'none'
+    if (raw_bytes.startswith(LZ4_MAGIC) or
+            raw_bytes.startswith(LZ4_LEGACY_MAGIC)):
+        return 'lz4'
+    if raw_bytes.startswith(GZIP_MAGIC):
+        return 'gzip'
+    if raw_bytes.startswith(XZ_MAGIC):
+        return 'xz'
+    if raw_bytes.startswith(LZMA_ALONE_MAGIC):
+        return 'lzma'
+    _, ext = os.path.splitext(filename)
+    if ext in EXT_TO_COMP:
+        return EXT_TO_COMP[ext]
+    return 'none'
+
+
+def decompress_blob(raw_bytes, filename='', comp=None):
+    """Decompress a DTB blob if compressed.
+
+    Args:
+        raw_bytes: Input file or blob contents as `bytes`.
+        filename: Optional file path or name for error reporting and extension
+            detection.
+        comp: Optional explicit compression algorithm name; auto-detected if
+            None or empty.
+
+    Returns:
+        Tuple of `(uncompressed_bytes, compression_type)`.
+
+    Raises:
+        RuntimeError: If `lz4` is missing or fails to decompress `raw_bytes`.
+        ValueError: If the compression type is unsupported.
+    """
+    if not comp:
+        comp = detect_compression(raw_bytes, filename)
+    if comp == 'none':
+        return raw_bytes, 'none'
+    if comp == 'lz4':
+        try:
+            res = subprocess.run(
+                ['lz4', '-d', '-q', '-c'],
+                input=raw_bytes,
+                capture_output=True,
+                check=False,
+            )
+        except FileNotFoundError as exc:
+            raise RuntimeError(
+                'lz4 command not found; install lz4 to process .lz4 files'
+            ) from exc
+        if res.returncode != 0:
+            raise RuntimeError(
+                f'Failed to decompress {filename} with lz4: '
+                f'{res.stderr.decode("utf-8", errors="replace").strip()}'
+            )
+        return res.stdout, 'lz4'
+    if comp == 'gzip':
+        try:
+            return gzip.decompress(raw_bytes), 'gzip'
+        except Exception as exc:
+            raise RuntimeError(
+                f'Failed to decompress {filename} with gzip: {exc}'
+            ) from exc
+    if comp in ('lzma', 'xz'):
+        try:
+            return lzma.decompress(raw_bytes), comp
+        except Exception as exc:
+            raise RuntimeError(
+                f'Failed to decompress {filename} with {comp}: {exc}'
+            ) from exc
+    prefix = f'{filename}: ' if filename else ''
+    raise ValueError(f'{prefix}Unsupported compression type: {comp}')
+
+
+def compress_blob(raw_bytes, comp):
+    """Compress an FDT blob using the specified compression algorithm.
+
+    Args:
+        raw_bytes: Uncompressed FDT blob as `bytes`.
+        comp: Compression algorithm name (`'none'`, `'lz4'`, `'lzma'`, `'xz'`,
+            or `'gzip'`).
+
+    Returns:
+        Compressed (or uncompressed if `comp` is `'none'`) blob as `bytes`.
+
+    Raises:
+        RuntimeError: If `lz4` is missing or fails to compress `raw_bytes`.
+        ValueError: If `comp` is not a supported compression type.
+    """
+    if comp in ('none', '', None):
+        return raw_bytes
+    if comp == 'lz4':
+        try:
+            res = subprocess.run(
+                ['lz4', '-12', '-z', '-q', '-c'],
+                input=raw_bytes,
+                capture_output=True,
+                check=False,
+            )
+        except FileNotFoundError as exc:
+            raise RuntimeError(
+                'lz4 command not found; install lz4 to process .lz4 files'
+            ) from exc
+        if res.returncode != 0:
+            raise RuntimeError(
+                f'Failed to compress blob with lz4: '
+                f'{res.stderr.decode("utf-8", errors="replace").strip()}'
+            )
+        return res.stdout
+    if comp == 'gzip':
+        return gzip.compress(raw_bytes, mtime=0)
+    if comp == 'lzma':
+        return lzma.compress(raw_bytes, format=lzma.FORMAT_ALONE)
+    if comp == 'xz':
+        return lzma.compress(raw_bytes, format=lzma.FORMAT_XZ)
+    raise ValueError(f'Unsupported compression type: {comp}')
+
+
 def split_dtb_filename(path):
-    """Split a DTB path into its directory and filename stem.
+    """Split a DTB path into its directory, stem, and compression type.
 
-    Example:
-        '/dir/board.dtb' -> ('/dir', 'board')
+    Examples:
+        '/dir/board.dtb'     -> ('/dir', 'board', 'none')
+        '/dir/board.dtb.lz4' -> ('/dir', 'board', 'lz4')
 
     Args:
-        path: File path to a .dtb or .dtbo file.
+        path: File path to a `.dtb` or `.dtbo` (optionally compressed) file.
 
     Returns:
-        Tuple of (directory, stem) where `stem` has any trailing `.dtb` or
-        `.dtbo` suffix removed.
+        Tuple of `(directory, stem, compression_type)` where `stem` has any
+        trailing compression and `.dtb`/`.dtbo` suffixes removed.
     """
     directory, filename = os.path.split(path)
+    comp = 'none'
+    prefix, sep, ext = filename.rpartition('.')
+    if prefix and sep and f'.{ext}' in EXT_TO_COMP:
+        comp = EXT_TO_COMP[f'.{ext}']
+        filename = prefix
     stem, sep, ext = filename.rpartition('.')
     if not stem or not sep or ext not in ('dtb', 'dtbo'):
         stem = filename
-    return directory, stem
+    return directory, stem, comp
 
 
 class NodeTree:
@@ -172,15 +336,24 @@ def _is_dtbo_overlay(fdt_ro):
 class ParsedDtb:
     """Parsed representation of an input .dtb blob."""
 
-    def __init__(self, filename, raw_bytes):
+    def __init__(self, filename, raw_bytes, compressed_size=None,
+                 compression='none'):
         """Parse an uncompressed FDT blob into nodes, symbols, and fixups.
 
         Args:
             filename: Display name or file path for error reporting.
             raw_bytes: Uncompressed FDT binary contents as `bytes`.
+            compressed_size: Original on-disk size in bytes before
+                decompression (defaults to `len(raw_bytes)`).
+            compression: Compression algorithm of the input file (`'none'`,
+                `'lz4'`, `'lzma'`, `'xz'`, or `'gzip'`).
         """
         self.filename = filename
         self.raw_bytes = raw_bytes
+        self.compressed_size = (
+            compressed_size if compressed_size is not None else len(raw_bytes)
+        )
+        self.compression = compression
         fdt = _open_fdt_ro(raw_bytes, filename)
         if _is_dtbo_overlay(fdt):
             raise ValueError(
@@ -211,17 +384,19 @@ class ParsedDtb:
 
     @classmethod
     def from_file(cls, path):
-        """Read and parse a .dtb file from disk.
+        """Read and parse a .dtb (or compressed .dtb.lz4/.lzma/.xz/.gz) file.
 
         Args:
-            path: Path to the input .dtb file.
+            path: Path to the input .dtb (or compressed .dtb) file.
 
         Returns:
             A new `ParsedDtb` instance.
         """
         with open(path, 'rb') as f:
-            raw_bytes = f.read()
-        return cls(path, raw_bytes)
+            file_bytes = f.read()
+        raw_bytes, comp = decompress_blob(file_bytes, path)
+        return cls(path, raw_bytes, compressed_size=len(file_bytes),
+                   compression=comp)
 
     def _parse_tree(self, fdt):
         """Walk the FDT and extract nodes, properties, symbols, and fixups.
@@ -1036,18 +1211,20 @@ def verify_recreated_dtb(orig_dtb, base_dtb_blob, dtbo_blob,
         )
 
 
-def get_dtbo_output_path(dtb_path, outdir):
-    """Determine the output `.dtbo` file path for an input `.dtb` path.
+def get_dtbo_output_path(dtb_path, outdir, comp='none'):
+    """Determine the output `.dtbo[.comp]` file path for an input `.dtb` path.
 
     Args:
-        dtb_path: Path to the input `.dtb` file.
+        dtb_path: Path to the input `.dtb` (or compressed `.dtb`) file.
         outdir: Output directory if `--outdir` was specified, else None.
+        comp: Compression algorithm name (`'none'`, `'lz4'`, `'lzma'`, `'xz'`,
+            or `'gzip'`).
 
     Returns:
-        Output `.dtbo` file path string.
+        Output `.dtbo[.comp]` file path string.
     """
-    dtb_dir, stem = split_dtb_filename(dtb_path)
-    dtbo_name = f'{stem}.dtbo'
+    dtb_dir, stem, _ = split_dtb_filename(dtb_path)
+    dtbo_name = f'{stem}.dtbo{COMP_TO_EXT[comp]}'
     target_dir = outdir if outdir is not None else dtb_dir
     return os.path.join(target_dir, dtbo_name)
 
@@ -1060,8 +1237,9 @@ def parse_args():
     """
     parser = argparse.ArgumentParser(
         description=(
-            'Split a set of compiled device tree blobs (.dtb) into a single '
-            'common base .dtb and per-board overlay blobs (.dtbo).'
+            'Split a set of compiled device tree blobs (.dtb, or compressed '
+            '.dtb.lz4/.xz/.lzma/.gz) into a single common base .dtb and '
+            'per-board overlay blobs (.dtbo).'
         )
     )
     parser.add_argument(
@@ -1069,8 +1247,8 @@ def parse_args():
         required=True,
         metavar='BASE_DTB',
         help=(
-            'Output common base .dtb file path (placed in --outdir if '
-            'specified without a directory component)'
+            'Output common base .dtb (or .dtb.lz4/.xz/.lzma/.gz) file path '
+            '(placed in --outdir if specified without a directory component)'
         ),
     )
     parser.add_argument(
@@ -1101,13 +1279,16 @@ def parse_args():
     parser.add_argument(
         '-v', '--verbose',
         action='store_true',
-        help='Print size statistics summary',
+        help='Print size statistics and compression summary',
     )
     parser.add_argument(
         'dtbs',
         nargs='+',
         metavar='DTB',
-        help='Input .dtb files (at least two required)',
+        help=(
+            'Input .dtb (or compressed .dtb.lz4/.xz/.lzma/.gz) files (at '
+            'least two required)'
+        ),
     )
     args = parser.parse_args()
     if len(args.dtbs) < 2:
@@ -1130,6 +1311,7 @@ def factor_dtb_files(args):
         if args.outdir is not None and not os.path.dirname(args.base_dtb)
         else args.base_dtb
     )
+    _, _, base_dtb_comp = split_dtb_filename(base_dtb_path)
 
     input_abs_paths = {os.path.abspath(p) for p in input_dtb_paths}
     base_abs_path = os.path.abspath(base_dtb_path)
@@ -1141,8 +1323,8 @@ def factor_dtb_files(args):
 
     dtbo_paths = []
     seen_paths = {base_abs_path}
-    for dtb_path in input_dtb_paths:
-        out_path = get_dtbo_output_path(dtb_path, args.outdir)
+    for dtb_path, d in zip(input_dtb_paths, dtbs):
+        out_path = get_dtbo_output_path(dtb_path, args.outdir, comp=d.compression)
         abs_out = os.path.abspath(out_path)
         if abs_out in input_abs_paths:
             raise ValueError(
@@ -1167,20 +1349,24 @@ def factor_dtb_files(args):
                 d, base_dtb_blob, dtbo_blob, args.strip_local_fixups
             )
 
+    base_dtb_file_bytes = compress_blob(base_dtb_blob, base_dtb_comp)
     base_dtb_dir = os.path.dirname(base_dtb_path)
     if base_dtb_dir:
         os.makedirs(base_dtb_dir, exist_ok=True)
     with open(base_dtb_path, 'wb') as f:
-        f.write(base_dtb_blob)
+        f.write(base_dtb_file_bytes)
 
     if args.outdir:
         os.makedirs(args.outdir, exist_ok=True)
-    for out_path, dtbo_blob in zip(dtbo_paths, dtbo_blobs):
+    dtbo_file_sizes = []
+    for out_path, dtbo_blob, d in zip(dtbo_paths, dtbo_blobs, dtbs):
         out_dir = os.path.dirname(out_path)
         if out_dir:
             os.makedirs(out_dir, exist_ok=True)
+        out_bytes = compress_blob(dtbo_blob, d.compression)
+        dtbo_file_sizes.append(len(out_bytes))
         with open(out_path, 'wb') as f:
-            f.write(dtbo_blob)
+            f.write(out_bytes)
 
     if args.verbose:
         orig_uncomp = sum(len(d.raw_bytes) for d in dtbs)
@@ -1198,6 +1384,29 @@ def factor_dtb_files(args):
             f'{dtbo_uncomp:,} B = {new_uncomp:,} bytes '
             f'(saved {saved_uncomp:,} B / {pct_uncomp:.1f}%)'
         )
+        all_comps = {base_dtb_comp, *(d.compression for d in dtbs)}
+        comp_names = sorted(c for c in all_comps if c != 'none')
+        if comp_names:
+            comp_label = '/'.join(sorted(all_comps))
+            hdr = (
+                f'Compressed ({comp_label}):'
+                if len(all_comps) == 1
+                else f'On-disk ({comp_label}):   '
+            )
+            orig_comp = sum(d.compressed_size for d in dtbs)
+            base_dtb_csize = len(base_dtb_file_bytes)
+            dtbo_csize = sum(dtbo_file_sizes)
+            new_comp = base_dtb_csize + dtbo_csize
+            saved_comp = orig_comp - new_comp
+            pct_comp = (saved_comp / orig_comp * 100.0) if orig_comp else 0.0
+            print(
+                f'{hdr}  {len(dtbs)} files '
+                f'({orig_comp:,} bytes) -> base {base_dtb_csize:,} B + '
+                f'{len(dtbo_blobs)} overlays {dtbo_csize:,} B '
+                f'(avg {dtbo_csize // len(dtbo_blobs):,} B) = '
+                f'{new_comp:,} bytes '
+                f'(saved {saved_comp:,} B / {pct_comp:.1f}%)'
+            )
 
 
 def main():
diff --git a/tests/Makefile.tests b/tests/Makefile.tests
index 9f8a2896d597..d0bdc4afefb2 100644
--- a/tests/Makefile.tests
+++ b/tests/Makefile.tests
@@ -53,7 +53,10 @@ TESTS_DEPFILES = $(TESTS:%=%.d) \
 	$(addprefix $(TESTS_PREFIX),testutils.d)
 
 TESTS_CLEANFILES_L = $(STD_CLEANFILES) \
-	*.dtb *.test.dtbo *.test.dts *.test.dt.yaml *.dtsv1 tmp.* *.bak \
+	*.dtb *.test.dtbo *.test.dts *.test.dt.yaml *.dtsv1 \
+	*.test.dtb.gz *.test.dtbo.gz *.test.dtb.xz *.test.dtbo.xz \
+	*.test.dtb.lzma *.test.dtbo.lzma *.test.dtb.lz4 *.test.dtbo.lz4 \
+	tmp.* *.bak \
 	treegen
 TESTS_CLEANFILES = $(TESTS) $(TESTS_CLEANFILES_L:%=$(TESTS_PREFIX)%)
 TESTS_CLEANDIRS_L = fs
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 92fa417d3457..92edec8b724c 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -1147,6 +1147,36 @@ fdtoverlay_tests() {
 	run_wrap_test check_dtb_recreated fdtfactor_board1.recreated.test.dtb fdtfactor_board1.stripped.test.dtb
 	run_wrap_test check_dtb_recreated fdtfactor_board2.recreated.test.dtb fdtfactor_board2.stripped.test.dtb
 	run_wrap_test check_dtb_recreated fdtfactor_board3.recreated.test.dtb fdtfactor_board3.stripped.test.dtb
+
+	# Compressed (.dtb.gz / .dtb.xz / .dtb.lzma / .dtb.lz4) modes (3 boards)
+	for comp_spec in "gz:gzip -9 -k -f:gzip -d -f" \
+			 "xz:xz -k -f:xz -d -f" \
+			 "lzma:xz --format=lzma -k -f:xz -d -f" \
+			 "lz4:lz4 -12 -q -f -m:lz4 -d -q -f --rm"; do
+	    ext="${comp_spec%%:*}"
+	    rest="${comp_spec#*:}"
+	    comp_cmd="${rest%%:*}"
+	    decomp_cmd="${rest#*:}"
+	    if ! command -v "${comp_cmd%% *}" >/dev/null 2>&1; then
+		continue
+	    fi
+	    run_wrap_test $comp_cmd \
+		fdtfactor_board1.test.dtb fdtfactor_board2.test.dtb fdtfactor_board3.test.dtb
+	    run_wrap_test $PYTHON "$FDTFACTOR" -v --verify \
+		-b "fdtfactor_base.test.dtb.$ext" \
+		"fdtfactor_board1.test.dtb.$ext" \
+		"fdtfactor_board2.test.dtb.$ext" \
+		"fdtfactor_board3.test.dtb.$ext"
+	    cp "fdtfactor_base.test.dtb.$ext" "fdtfactor_base.${ext}_dec.test.dtb.$ext"
+	    cp "fdtfactor_board1.test.dtbo.$ext" "fdtfactor_board1.${ext}_dec.test.dtbo.$ext"
+	    run_wrap_test $decomp_cmd "fdtfactor_base.${ext}_dec.test.dtb.$ext"
+	    run_wrap_test $decomp_cmd "fdtfactor_board1.${ext}_dec.test.dtbo.$ext"
+	    run_wrap_test $FDTOVERLAY -i "fdtfactor_base.${ext}_dec.test.dtb" \
+		-o "fdtfactor_board1.${ext}_recreated.test.dtb" \
+		"fdtfactor_board1.${ext}_dec.test.dtbo"
+	    run_wrap_test check_dtb_recreated \
+		fdtfactor_board1.test.dtb "fdtfactor_board1.${ext}_recreated.test.dtb"
+	done
     fi
 }
 
@@ -1198,7 +1228,9 @@ if [ -z "$TESTSETS" ]; then
 fi
 
 # Make sure we don't have stale blobs lying around
-rm -f *.test.dtb *.test.dtbo *.test.dts
+rm -f *.test.dtb *.test.dtbo *.test.dts *.test.dtb.gz *.test.dtbo.gz \
+    *.test.dtb.xz *.test.dtbo.xz *.test.dtb.lzma *.test.dtbo.lzma \
+    *.test.dtb.lz4 *.test.dtbo.lz4
 
 for set in $TESTSETS; do
     case $set in
-- 
2.56.0.176.g3575e65682-goog

