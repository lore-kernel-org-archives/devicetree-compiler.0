Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793224612;
	b=ci8Y5QRNx15Bfb7JG2WFJ0hgWcIX0pMbI8hBFBFHliUmqdPXgjPQgiT2Sql+KZDOsyOx
	 GHcy8nD26XLl+Z5QAlpldTr6XiTwKGHkdGfV603Yk/8hgGaQqpPZgMOM38lI+aAxphv+6
	 4sZig39fDOjz0oE2OR7ynfQy1x43CF49Z6WwEudFxZnWS0hSOR1LljqivlEVGx+gQ4vZZ
	 /1+60SP9Y+juhLpYozYmN088k3EdpM1x/EqWNR4/QBaRiOKSBAno9jx11kD8udqKK08IF
	 XuADMYmYgSRm2P8BTb3dF39VXQrrSIiYXYzRtAb6rmuY/hRO9hizG/Dufde8867VDUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793224612;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Zk9qs8Mmn8kL5t1An4FGXlIssM/OpG1ayfslpzlgiQE=;
	b=pmpWdpCEUR/K3SbqXqb0vPthzN5UHzOXk2UbkmoUr2pbyNQ2AGwEkJWP8bMEYPPS6RFX
	 VJrIHhrzuWZMTc6Awy2bk89sTL1RTYmj++K7Gc+ao1LLA0tpOyEJXjXTtqePNzOmWLYXu
	 xRjhl10kDrsbD2HuMFA65pOa5bm9ZEoGAl7cYK6T1ZBRjuFxLqrxPbrP8VD8KoSWkQ6n6
	 4Y3aa91Lc3TRFPFDx7gVto1UIPphiTgI2Bk/le8B5/ygUCPoWdjQdBP9KJhWYXoj1/3/i
	 4dm00kcYz6tMjrFStrpIRZEXnmhHxlNiKpoHwMYdw7DHSZafbLVwvIQbkoI9QxqYM0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IvPPVfZa;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36AC160A5BD1
	for <Devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 21:56:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36AC160A5BD1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IvPPVfZa
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-35b2c599f43so3131900eec.0
        for <Devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 14:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793224611; x=1793829411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zk9qs8Mmn8kL5t1An4FGXlIssM/OpG1ayfslpzlgiQE=;
        b=IvPPVfZaMBCNOssKGM1aE90IvEu4mC1L97OtqsZt5iJXLWMq2Kw51KbR26hF8II54r
         RrT8X2ZzraFkSc1di+LXPsy5UUlGWsa24ga3PNw893V2zU1FOX79XzxJp2cdnLkDPLrT
         WQqBBwmld4mzpENh5pDpIbc2WXxKEAoY5WJE8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793224611; x=1793829411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zk9qs8Mmn8kL5t1An4FGXlIssM/OpG1ayfslpzlgiQE=;
        b=pap+JrBbwLbtIDRGm3lK8z/O43QrRBmfUFxJ8AUlyGkKyzVN0qnrrZzoI83isBzbxI
         avLZtJpoCexZdMz9gbIVEkzFdf9MPO+oUkYWa/YLUsYGWmF3coGBAemGc+H5lvyStffr
         24qcySbZXE+aOSs6/6FRkL/wDgsOeaZhXtSdINB5N2EwZlKms2kjsT+SMZDgVUzfSSGb
         fRMXX+Vpngd+pj4cwqwIaRVwn+PbSyNysXW+LxNa9uUeb0OQzfYS9yf258uw6est7gzz
         pwBUavCIKnWv6c7dZCXzwY0WhNC5X/4lMbBlSEC9g86pH9VNm9cNyEpy7XCRboNLE3or
         xuhg==
X-Gm-Message-State: AFq9FYLKF+t3kv4nNL5rN2zIZPe3Jw2DN25qFQKiEBZt/er3N6OhfDfc
	KfkCK2QSXVvwBRK0PDlj0kZRstjqciyQg8Em8t4zz5etgco1TjmZD09qU2L69RkWtvPPAZpf21D
	uJU0/dG+9
X-Gm-Gg: AYBFou1gQmblXc/u0v3ggJs/COxo9nGlEQZd0s1V7KjSbaRiSaSHWHvpNPY2KQDKhNI
	ZejELLZ4x3Fr8FGmdkto0CdGvJSbH8A5fBH7WYKeJsRHi6RCYJHxsrY1LOiGZJYQHLXrY7P9btT
	9C5pw/wpM7k3gYZQilX0F/8iw1EuuAJ04KmGh8PqwOdIHnuk2zw9mzj2kukQjFIlxA9Uyt2Ybzx
	sMeqzUeXWZwfc3fopdbOLBfGi/wh5q6ozwVNYRSfgrar5A88dc/Nie0cBUTy4FramBz55bsAUGd
	4UH94/8lQQhJYjSODNcadNND/Ef06hDn5fcVvNqbxKF447dLyBA0pToDUUNpn6k+84DgoyJHPsR
	+JrgSMg/bmTXT9TiFHJ8/f0rWqAPpFLjiCY14OyoO5S3D8ZKKPVo4twXJFTujtQ1Ztbxe3vaZI5
	J3AgqkrwL9nmX4Io9OfD4EdUUiJtd63aGQE+kOu96zVjD2R5Ncu66AkcbOK6VXNKLR1TuAAbgex
	9r0N2eupusydc4yQ5x7i7tEqz2B9qatWRcB85qHJ9udPbv/2RIBXNkEvGDny4ps/IX3NGdaZqAN
	yqthg7sWtFrVVOhAY4XX3V/S/V2DEAIa4+T8yN3suSDLkPAAmeRqqoNn2tTKCqxWEZSSKQDjLPN
	u4YWfSqDVgE72
X-Received: by 2002:a05:7301:640b:b0:36a:30b:5dce with SMTP id 5a478bee46e88-36a2044c340mr5112210eec.19.1793224610953;
        Wed, 28 Oct 2026 14:56:50 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:19e7:c87:2527:4e12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2393cc86sm8845224eec.19.2026.10.28.14.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 14:56:49 -0700 (PDT)
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
Subject: [PATCH v2 09/10] fdtfactor: Support compressed DTB inputs and outputs
Date: Wed, 28 Oct 2026 14:46:58 -0700
Message-ID: <20261028215600.1713475-10-dianders@chromium.org>
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

Firmware and FIT image build pipelines frequently store device tree
blobs compressed with LZ4, LZMA/XZ, or gzip (e.g., `.dtb.lz4`).

Extend `fdtfactor` to detect compressed input blobs by magic bytes or
file extension, transparently decompress them before factoring, and
compress the resulting `.dtbo` and `base.dtb` outputs when appropriate:

- Support `.lz4` (including legacy `-l` frames via the `lz4` CLI),
  `.lzma`/`.xz` (via Python's `lzma` module, using `CHECK_CRC32` for XZ
  compatibility with kernel/bootloader decompressors), and `.gz` (via
  Python's `gzip` module).
- Preserve the input compression format on generated `.dtbo` files and
  compress `base.dtb` according to `--base-compression` (which defaults
  to `auto`, auto-detecting from `--base-dtb`'s filename extension such
  as `-b base.dtb.lz4`).
- Report compressed size savings alongside uncompressed savings when
  `-s`/`--stats` is specified.

On the 47 Qualcomm SC7180 Trogdor Chromebook `.dtb.lz4` files,
`fdtfactor -S` reduces total LZ4-compressed size from 1.71 MB to 213 KB
(87.5% savings).

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Add --base-compression to explicitly control base.dtb compression
  while documenting auto-detection from --base-dtb's filename suffix
  (David Gibson)
- Support legacy LZ4 frames (lz4 -l) and use CRC32 check for XZ outputs
  (Simon Glass)

 README.md            |  17 ++-
 fdtfactor            | 312 +++++++++++++++++++++++++++++++++++++++----
 tests/Makefile.tests |   5 +-
 tests/run_tests.sh   |  77 ++++++++++-
 4 files changed, 379 insertions(+), 32 deletions(-)

diff --git a/README.md b/README.md
index 9b2115ebbc67..6b5ad32f474b 100644
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
@@ -114,7 +114,12 @@ Options:
 
 * `-b`, `--base-dtb`: Output filename for the common base `.dtb`
   (default: `base.dtb`; placed in `--outdir` if specified, or the current
-  directory otherwise).
+  directory otherwise). By default (`--base-compression=auto`), `base.dtb`
+  is compressed if its filename carries a `.lz4`, `.xz`, `.lzma`, or `.gz`
+  suffix, whereas each `.dtbo` preserves its input `.dtb`'s compression.
+* `--base-compression`: Compression format for `--base-dtb`: `auto`,
+  `none`, `lz4`, `lz4_legacy`, `lzma`, `xz`, or `gzip` (default: `auto`,
+  which auto-detects from the `--base-dtb` filename suffix).
 * `-o`, `--outdir`: Output directory for generated `.dtbo` files and
   `--base-dtb` (default: alongside each input `.dtb` for `.dtbo` files,
   current directory for `--base-dtb`).
@@ -127,7 +132,7 @@ Options:
   passed to `dtc` solely to help `fdtfactor` locate phandles at build time
   and `/__local_fixups__` is not needed at runtime, passing `-S` strips it
   from `base.dtb` to save space.
-* `-s`, `--stats`: Print size savings summary.
+* `-s`, `--stats`: Print uncompressed and compressed size savings.
 
 ### TODO
 
diff --git a/fdtfactor b/fdtfactor
index ebe1e3d44382..ab261765bb29 100755
--- a/fdtfactor
+++ b/fdtfactor
@@ -12,13 +12,214 @@ original board DTB.
 
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
+    'lz4_legacy': '.lz4',
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
+        raw_bytes: Raw file bytes to inspect for magic headers.
+        filename: Optional filename string used as a fallback if `raw_bytes`
+            does not match a known magic header.
+
+    Returns:
+        Compression format string (`'none'`, `'lz4'`, `'lz4_legacy'`, `'lzma'`,
+        `'xz'`, or `'gzip'`).
+    """
+    if raw_bytes.startswith(FDT_MAGIC):
+        return 'none'
+    if raw_bytes.startswith(LZ4_MAGIC):
+        return 'lz4'
+    if raw_bytes.startswith(LZ4_LEGACY_MAGIC):
+        return 'lz4_legacy'
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
+def _run_lz4(args, input_bytes, action):
+    """Run the `lz4` CLI with `args` on `input_bytes` and return stdout.
+
+    Args:
+        args: List of command-line arguments to pass to `lz4`.
+        input_bytes: Bytes to feed to `lz4` standard input.
+        action: Human-readable action description for error messages.
+
+    Returns:
+        Output `bytes` written to `lz4` standard output.
+    """
+    try:
+        res = subprocess.run(
+            ['lz4', *args],
+            input=input_bytes,
+            capture_output=True,
+            check=False,
+        )
+    except FileNotFoundError as exc:
+        raise RuntimeError(
+            'lz4 command not found; install lz4 to process .lz4 files'
+        ) from exc
+    if res.returncode != 0:
+        err = res.stderr.decode('utf-8', errors='replace').strip()
+        raise RuntimeError(f'Failed to {action} with lz4: {err}')
+    return res.stdout
+
+
+def decompress_blob(raw_bytes, filename=''):
+    """Decompress a DTB blob if compressed, returning `(raw_bytes, comp)`.
+
+    Args:
+        raw_bytes: Input FDT `bytes` (compressed or uncompressed).
+        filename: Optional filename for error reporting and extension fallback.
+
+    Returns:
+        Tuple of `(uncompressed_bytes, resolved_compression_type)`.
+    """
+    comp = detect_compression(raw_bytes, filename)
+    if comp == 'none':
+        return raw_bytes, 'none'
+    if comp in ('lz4', 'lz4_legacy'):
+        return _run_lz4(['-d', '-q', '-c'], raw_bytes, f'decompress {filename}'), comp
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
+def compress_blob(raw_bytes, comp, filename=''):
+    """Compress an FDT blob using the specified compression algorithm.
+
+    Args:
+        raw_bytes: Uncompressed FDT `bytes`.
+        comp: Compression format (`'none'`, `'lz4'`, `'lz4_legacy'`, `'lzma'`,
+            `'xz'`, or `'gzip'`).
+        filename: Optional filename for error messages.
+
+    Returns:
+        Compressed (or uncompressed if `comp` is `'none'`) `bytes`.
+    """
+    if comp in ('none', '', None):
+        return raw_bytes
+    target = filename or 'blob'
+    if comp == 'lz4':
+        return _run_lz4(
+            ['-12', '-z', '-q', '-c'], raw_bytes, f'compress {target}'
+        )
+    if comp == 'lz4_legacy':
+        return _run_lz4(
+            ['-l', '-12', '-q', '-c'], raw_bytes, f'compress {target}'
+        )
+    if comp == 'gzip':
+        return gzip.compress(raw_bytes, mtime=0)
+    if comp == 'lzma':
+        return lzma.compress(raw_bytes, format=lzma.FORMAT_ALONE)
+    if comp == 'xz':
+        return lzma.compress(
+            raw_bytes, format=lzma.FORMAT_XZ, check=lzma.CHECK_CRC32
+        )
+    prefix = f'{filename}: ' if filename else ''
+    raise ValueError(f'{prefix}Unsupported compression type: {comp}')
+
+
+def split_dtb_filename(path):
+    """Split a DTB path into `(directory, stem, compression_type)`.
+
+    Strips a recognized compression suffix (`.lz4`, `.lzma`, `.xz`, `.gz`), if
+    present, followed by a `.dtb` or `.dtbo` suffix, if present. Note that for
+    input files, `ParsedDtb` detects the actual compression format from the
+    file's magic bytes via `decompress_blob()` rather than relying on the
+    filename extension; `split_dtb_filename()` is used to derive the output
+    `.dtbo` filename stem and (when `--base-compression=auto`) to infer the
+    default compression format for `--base-dtb` from its output filename.
+
+    Examples:
+        >>> split_dtb_filename('/path/to/board.dtb')
+        ('/path/to', 'board', 'none')
+        >>> split_dtb_filename('board.dtbo')
+        ('', 'board', 'none')
+        >>> split_dtb_filename('/path/to/board.dtb.lz4')
+        ('/path/to', 'board', 'lz4')
+        >>> split_dtb_filename('base.dtb.xz')
+        ('', 'base', 'xz')
+        >>> split_dtb_filename('/path/to/board.rev2.dtb.gz')
+        ('/path/to', 'board.rev2', 'gzip')
+        >>> split_dtb_filename('/path/to/board.custom.lzma')
+        ('/path/to', 'board.custom', 'lzma')
+        >>> split_dtb_filename('my_blob')
+        ('', 'my_blob', 'none')
+
+    Args:
+        path: Input or output DTB file path string.
+
+    Returns:
+        Tuple of `(directory, stem, compression_type)`.
+    """
+    directory, filename = os.path.split(path)
+    comp = 'none'
+    prefix, sep, ext = filename.rpartition('.')
+    if prefix and sep and f'.{ext}' in EXT_TO_COMP:
+        comp = EXT_TO_COMP[f'.{ext}']
+        filename = prefix
+    stem, sep, ext = filename.rpartition('.')
+    if not stem or not sep or ext not in ('dtb', 'dtbo'):
+        stem = filename
+    return directory, stem, comp
+
+
 def _is_dtbo_overlay(fdt):
     """Return True if `fdt` is a `.dtbo` overlay rather than a base DTB.
 
@@ -58,14 +259,16 @@ class ParsedDtb:
     """
 
     def __init__(self, filename):
-        """Parse an uncompressed FDT file into a normalized NodeTree.
+        """Parse an input FDT file into a normalized NodeTree.
 
         Args:
-            filename: Path to the input .dtb file.
+            filename: Path to the input .dtb (or compressed .dtb.*) file.
         """
         self.filename = filename
         with open(filename, 'rb') as f:
-            raw_bytes = f.read()
+            file_bytes = f.read()
+        self.compressed_size = len(file_bytes)
+        raw_bytes, self.compression = decompress_blob(file_bytes, filename)
         self.raw_bytes = raw_bytes
 
         try:
@@ -646,21 +849,23 @@ def create_base_dtb_and_overlays(dtbs, strip_local_fixups=False):
     return base_dtb_blob, dtbo_blobs
 
 
-def get_dtbo_output_path(dtb_path, outdir):
-    """Determine the output `.dtbo` file path for an input `.dtb` path.
+def get_dtbo_output_path(dtb_path, outdir, comp='none'):
+    """Determine the output `.dtbo[.comp]` file path for an input `.dtb` path.
 
     Args:
-        dtb_path: Path to the input `.dtb` file.
+        dtb_path: Path to the input `.dtb` (or `.dtb.*`) file.
         outdir: Output directory path, or `None` to place the `.dtbo` alongside
             `dtb_path`.
+        comp: Compression format string for the output `.dtbo` (default:
+            `'none'`).
 
     Returns:
-        Output `.dtbo` file path string.
+        Output `.dtbo` (or compressed `.dtbo.*`) file path string.
     """
-    dtb_dir, filename = os.path.split(dtb_path)
-    stem = filename[:-4] if filename.endswith('.dtb') else filename
+    dtb_dir, stem, _ = split_dtb_filename(dtb_path)
+    dtbo_name = f'{stem}.dtbo{COMP_TO_EXT[comp]}'
     target_dir = outdir if outdir is not None else dtb_dir
-    return os.path.join(target_dir, f'{stem}.dtbo')
+    return os.path.join(target_dir, dtbo_name)
 
 
 def parse_args(argv=None):
@@ -675,8 +880,9 @@ def parse_args(argv=None):
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
@@ -684,8 +890,18 @@ def parse_args(argv=None):
         default='base.dtb',
         metavar='FILENAME',
         help=(
-            'Output common base .dtb filename (default: base.dtb; placed in '
-            '--outdir if specified, or current directory otherwise)'
+            'Output common base .dtb (or .dtb.lz4/.xz/.lzma/.gz) filename '
+            '(default: base.dtb; placed in --outdir if specified, or current '
+            'directory otherwise)'
+        ),
+    )
+    parser.add_argument(
+        '--base-compression',
+        choices=('auto', 'none', 'lz4', 'lz4_legacy', 'lzma', 'xz', 'gzip'),
+        default='auto',
+        help=(
+            'Compression format for --base-dtb (default: auto, which '
+            'auto-detects from the --base-dtb filename extension)'
         ),
     )
     parser.add_argument(
@@ -709,13 +925,16 @@ def parse_args(argv=None):
     parser.add_argument(
         '-s', '--stats',
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
     args = parser.parse_args(argv)
     if os.path.dirname(args.base_dtb):
@@ -728,13 +947,17 @@ def parse_args(argv=None):
     return args
 
 
-def _print_dtb_stats(dtbs, base_dtb_blob, dtbo_blobs):
-    """Print uncompressed size savings summary.
+def _print_dtb_stats(dtbs, base_dtb_blob, dtbo_blobs, base_dtb_comp='none',
+                     base_dtb_csize=None, dtbo_csizes=None):
+    """Print uncompressed and compressed size savings summary.
 
     Args:
         dtbs: Sequence of input `ParsedDtb` instances.
         base_dtb_blob: Uncompressed base DTB `bytes`.
         dtbo_blobs: Sequence of uncompressed `.dtbo` overlay `bytes`.
+        base_dtb_comp: Compression format of the base DTB output.
+        base_dtb_csize: Byte size of the compressed base DTB output.
+        dtbo_csizes: Sequence of byte sizes of the compressed `.dtbo` outputs.
     """
     orig_uncomp = sum(len(d.raw_bytes) for d in dtbs)
     base_dtb_uncomp = len(base_dtb_blob)
@@ -748,6 +971,25 @@ def _print_dtb_stats(dtbs, base_dtb_blob, dtbo_blobs):
         f'{dtbo_uncomp:,} B = {new_uncomp:,} B '
         f'(saved {saved_uncomp:,} B / {pct_uncomp:.1f}%)'
     )
+    all_comps = {base_dtb_comp, *(d.compression for d in dtbs)}
+    if any(c != 'none' for c in all_comps):
+        comp_label = '/'.join(sorted(all_comps))
+        hdr = (
+            f'Compressed ({comp_label}):'
+            if len(all_comps) == 1
+            else f'On-disk ({comp_label}):   '
+        )
+        orig_comp = sum(d.compressed_size for d in dtbs)
+        dtbo_csize = sum(dtbo_csizes)
+        new_comp = base_dtb_csize + dtbo_csize
+        saved_comp = orig_comp - new_comp
+        pct_comp = (saved_comp / orig_comp * 100.0) if orig_comp else 0.0
+        print(
+            f'{hdr} {len(dtbs)} files ({orig_comp:,} B) -> '
+            f'base {base_dtb_csize:,} B + {len(dtbo_blobs)} overlays '
+            f'{dtbo_csize:,} B (avg {dtbo_csize // len(dtbo_blobs):,} B) = '
+            f'{new_comp:,} B (saved {saved_comp:,} B / {pct_comp:.1f}%)'
+        )
 
 
 def factor_dtb_files(args):
@@ -764,6 +1006,13 @@ def factor_dtb_files(args):
         if args.outdir is not None
         else args.base_dtb
     )
+    if args.base_compression == 'auto':
+        _, _, base_dtb_comp = split_dtb_filename(base_dtb_path)
+        if (base_dtb_comp == 'lz4' and
+                all(d.compression == 'lz4_legacy' for d in dtbs)):
+            base_dtb_comp = 'lz4_legacy'
+    else:
+        base_dtb_comp = args.base_compression
 
     input_abs_paths = {os.path.abspath(p) for p in input_dtb_paths}
     base_abs_path = os.path.abspath(base_dtb_path)
@@ -775,8 +1024,10 @@ def factor_dtb_files(args):
 
     dtbo_paths = []
     seen_paths = {base_abs_path}
-    for dtb_path in input_dtb_paths:
-        out_path = get_dtbo_output_path(dtb_path, args.outdir)
+    for dtb_path, d in zip(input_dtb_paths, dtbs):
+        out_path = get_dtbo_output_path(
+            dtb_path, args.outdir, comp=d.compression
+        )
         abs_out = os.path.abspath(out_path)
         if abs_out in input_abs_paths:
             raise ValueError(
@@ -795,20 +1046,33 @@ def factor_dtb_files(args):
         strip_local_fixups=args.strip_local_fixups,
     )
 
+    base_dtb_file_bytes = compress_blob(
+        base_dtb_blob, base_dtb_comp, filename=base_dtb_path
+    )
     if args.outdir:
         os.makedirs(args.outdir, exist_ok=True)
     with open(base_dtb_path, 'wb') as f:
-        f.write(base_dtb_blob)
+        f.write(base_dtb_file_bytes)
 
-    for out_path, dtbo_blob in zip(dtbo_paths, dtbo_blobs):
+    dtbo_file_sizes = []
+    for out_path, dtbo_blob, d in zip(dtbo_paths, dtbo_blobs, dtbs):
         out_dir = os.path.dirname(out_path)
         if out_dir:
             os.makedirs(out_dir, exist_ok=True)
+        out_bytes = compress_blob(
+            dtbo_blob, d.compression, filename=out_path
+        )
+        dtbo_file_sizes.append(len(out_bytes))
         with open(out_path, 'wb') as f:
-            f.write(dtbo_blob)
+            f.write(out_bytes)
 
     if args.stats:
-        _print_dtb_stats(dtbs, base_dtb_blob, dtbo_blobs)
+        _print_dtb_stats(
+            dtbs, base_dtb_blob, dtbo_blobs,
+            base_dtb_comp=base_dtb_comp,
+            base_dtb_csize=len(base_dtb_file_bytes),
+            dtbo_csizes=dtbo_file_sizes,
+        )
 
 
 def main(argv=None):
diff --git a/tests/Makefile.tests b/tests/Makefile.tests
index ea1d35cd8e4e..300f244f41c5 100644
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
 TESTS_CLEANDIRS_L = fs *.test.dir
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index b0c621e5d1c3..b1a8188a9264 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -1206,6 +1206,79 @@ fdtfactor_tests () {
 	run_test dtbs_equal_unordered fdtfactor_board${i}.nolf.test.dtb \
 	    fdtfactor_strip.test.dir/merged${i}.test.dtb
     done
+
+    # Compressed (.dtb.gz / .dtb.xz / .dtb.lzma / .dtb.lz4) modes
+    for comp_spec in "gz:gzip -9 -k -f:gzip -d -f" \
+		     "xz:xz -k -f:xz -d -f" \
+		     "lzma:xz --format=lzma -k -f:xz -d -f" \
+		     "lz4:lz4 -12 -q -f -m:lz4 -d -q -f --rm" \
+		     "lz4:lz4 -l -12 -q -f -m:lz4 -d -q -f --rm"; do
+	ext="${comp_spec%%:*}"
+	rest="${comp_spec#*:}"
+	comp_cmd="${rest%%:*}"
+	decomp_cmd="${rest#*:}"
+	if ! command -v "${comp_cmd%% *}" >/dev/null 2>&1; then
+	    continue
+	fi
+	run_wrap_test $comp_cmd \
+	    fdtfactor_board1.test.dtb fdtfactor_board2.test.dtb \
+	    fdtfactor_board3.test.dtb
+	rm -rf fdtfactor_comp.test.dir
+	run_wrap_test $PYTHON $FDTFACTOR -s -b "base.test.dtb.$ext" \
+	    -o fdtfactor_comp.test.dir \
+	    "fdtfactor_board1.test.dtb.$ext" \
+	    "fdtfactor_board2.test.dtb.$ext" \
+	    "fdtfactor_board3.test.dtb.$ext"
+	run_wrap_test $decomp_cmd "fdtfactor_comp.test.dir/base.test.dtb.$ext"
+	run_wrap_test $decomp_cmd \
+	    "fdtfactor_comp.test.dir/fdtfactor_board1.test.dtbo.$ext"
+	run_wrap_test $FDTOVERLAY \
+	    -i fdtfactor_comp.test.dir/base.test.dtb \
+	    -o fdtfactor_comp.test.dir/merged1.test.dtb \
+	    fdtfactor_comp.test.dir/fdtfactor_board1.test.dtbo
+	run_test dtbs_equal_unordered fdtfactor_board1.test.dtb \
+	    fdtfactor_comp.test.dir/merged1.test.dtb
+    done
+
+    # Test magic-byte detection on a compressed blob with a plain .dtb
+    # extension and an uncompressed -b alongside compressed inputs.
+    if command -v gzip >/dev/null 2>&1; then
+	run_wrap_test gzip -9 -k -f \
+	    fdtfactor_board1.test.dtb fdtfactor_board2.test.dtb \
+	    fdtfactor_board3.test.dtb
+	cp fdtfactor_board1.test.dtb.gz fdtfactor_board1_magic.test.dtb
+	rm -rf fdtfactor_comp_mixed.test.dir
+	run_wrap_test $PYTHON $FDTFACTOR -s -b base_uncomp.test.dtb \
+	    -o fdtfactor_comp_mixed.test.dir \
+	    fdtfactor_board1_magic.test.dtb \
+	    fdtfactor_board2.test.dtb.gz \
+	    fdtfactor_board3.test.dtb.gz
+	run_wrap_test gzip -d -f \
+	    fdtfactor_comp_mixed.test.dir/fdtfactor_board1_magic.test.dtbo.gz
+	run_wrap_test $FDTOVERLAY \
+	    -i fdtfactor_comp_mixed.test.dir/base_uncomp.test.dtb \
+	    -o fdtfactor_comp_mixed.test.dir/merged1.test.dtb \
+	    fdtfactor_comp_mixed.test.dir/fdtfactor_board1_magic.test.dtbo
+	run_test dtbs_equal_unordered fdtfactor_board1.test.dtb \
+	    fdtfactor_comp_mixed.test.dir/merged1.test.dtb
+
+	# Explicit --base-compression overriding the -b filename extension
+	rm -rf fdtfactor_base_comp.test.dir
+	run_wrap_test $PYTHON $FDTFACTOR --base-compression=gzip \
+	    -b base_custom.test.dtb -o fdtfactor_base_comp.test.dir \
+	    fdtfactor_board1.test.dtb fdtfactor_board2.test.dtb \
+	    fdtfactor_board3.test.dtb
+	mv fdtfactor_base_comp.test.dir/base_custom.test.dtb \
+	    fdtfactor_base_comp.test.dir/base_custom.test.dtb.gz
+	run_wrap_test gzip -d -f \
+	    fdtfactor_base_comp.test.dir/base_custom.test.dtb.gz
+	run_wrap_test $FDTOVERLAY \
+	    -i fdtfactor_base_comp.test.dir/base_custom.test.dtb \
+	    -o fdtfactor_base_comp.test.dir/merged1.test.dtb \
+	    fdtfactor_base_comp.test.dir/fdtfactor_board1.test.dtbo
+	run_test dtbs_equal_unordered fdtfactor_board1.test.dtb \
+	    fdtfactor_base_comp.test.dir/merged1.test.dtb
+    fi
 }
 
 while getopts "vt:me" ARG ; do
@@ -1235,7 +1308,9 @@ if [ -z "$TESTSETS" ]; then
 fi
 
 # Make sure we don't have stale blobs lying around
-rm -f *.test.dtb *.test.dtbo *.test.dts
+rm -f *.test.dtb *.test.dtbo *.test.dts *.test.dtb.gz *.test.dtbo.gz \
+    *.test.dtb.xz *.test.dtbo.xz *.test.dtb.lzma *.test.dtbo.lzma \
+    *.test.dtb.lz4 *.test.dtbo.lz4
 rm -rf *.test.dir
 
 for set in $TESTSETS; do
-- 
2.56.0.313.g2479322e68-goog

