Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793570656;
	b=i40n7wPaxn+DtFS9q4ZZ0WJJHHkhutxGTkZMATrIzh1fKSXQaKICqlA7sBOJtN4/YtMf
	 bn8Dvy6a+5ZRYTXdWOoeVAF9kf6d/uBUwpXatz7plAk2A+JO1ZymoLJeFRV+Kavfkmm9S
	 g4PJZ5JXx8VUxKbQxCn4CKYZebfeqeprBt5kDfHOE1CqH5Fyt27bc/aw6WkZotmCaovip
	 f+rBLkwz48M0uNCSPJbGvnu41OjwFJDc044WkWfWNXaGDrW4n/pcMIFbd1cSinrr0mcr/
	 XF6AHFc6NCBwO0wXWfA4rH+AljOYp1A+QFXTMkmpDleF19sPlTlmF4iO2klNbizIfNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793570656;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=u/145CDVWnSJfN35X0zXnJT74cKgFPtu8mDao0tz02g=;
	b=Er8/M8LqasVIEzdPsfHxYbtqK4mnRVJUdRN0CRYZDUV5V44vcLcFZgfRi8NS8RtIVY8X
	 cDwJOOD2tqZOgug5u5YKBI9p+VdPsaGhTexRC0w2q27NJF9wa9O7GNgWBK5r3lZqePbqf
	 bZxfYgPVip38Kz4y7HCqWnpPgg/4WQTV6/cTJv8r/dXbq/yfQDHu/6OBwYAK6Y6/RFTdh
	 MfZs5tk/ISosyqnnImXiL9hlbCcIeCaq2zMx5DLXhOvqPrjdkJ8dU2BSDV3LinaJK78SN
	 wbxvaiC26nlRcxkwxJsHDPEKJbT1XsqkOUX9BpsZG2FmjRR2daKYcObxP4Sj8XTcrnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="P/DA+njm";
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012AB60A261E
	for <Devicetree-compiler@vger.kernel.org>; Sun,  1 Nov 2026 22:04:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 012AB60A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=P/DA+njm
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1adbf62dd31so2377509c88.0
        for <Devicetree-compiler@vger.kernel.org>; Sun, 01 Nov 2026 14:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793570645; x=1794175445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u/145CDVWnSJfN35X0zXnJT74cKgFPtu8mDao0tz02g=;
        b=P/DA+njmpiKJpxZfnJ0Rd/BmzXli8q/vgz64+53jD0j9VxErVOZyOQE+B1Hblky13U
         o4BRKTVyAFdHi+FKemHAa2rEUEkfrk92RO9TZ7+JvuF04lD3QOAlAeFzpNn5DfDtRJbf
         MjSv40RHu9RhIz6syUL0jqzilgb9ycS3guVdU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793570645; x=1794175445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u/145CDVWnSJfN35X0zXnJT74cKgFPtu8mDao0tz02g=;
        b=pQnvtmU9MqNfYuLJobTke2BRO6stLg5S4AneClcTcWrMOmSO1VJ8WfRzrgL6ltsSFk
         sNO+v3q6shwECmN+LUhLQA16p2knqM3lVjS9LaAkqAZ1i4+a90X3HefDr80SxZpqegea
         mh6IOYj1SKOZbMwY+4zyBmvGjGLp2b7pnQNl0GoXPzB6hnPV5Ve4ye/BfzkqUN54sOI+
         AUBjBzGrnSsEFwxNcEylNv78A1u1qh7Y6Cm2CjjzW5GVycZANhL7E53/KVIuT5YMFsQp
         I3qWC1bCLDDsYcngIK7W5AAKdukvWQgVKvyCxEVHr3XMGUOCGUIGf/r7/PBnZ//P1unU
         TTLw==
X-Gm-Message-State: AFq9FYLlUUIDm+21RCCmBGBml8AHBxoerYTES6E0WzgzVbjbzSGrV1KO
	KfFQYDCWWc9jtq2oPNgYNV2smR6NSDSwRPmPCpNG+sPYiVcVqMuwwK+HhdYCPdJPjX7XkvUm371
	ClrZzW7i3
X-Gm-Gg: AYBFou2a1PGac+7QP8zZHY0nBcvAFNJ1WYOSymXgY6bYJWSDnYhy0ShfjaocM7DhSgG
	a1FxxiU4fkVsW+YcHPyNrbcooWRSOouP9N2tNR41C8epjNVSKpTGAgqHYdi6IEASjEwrSjJAhxB
	8KGiHHsQB5bWgXuM66JOoa5YxiITvamUrXYJsXzIowrBFw1KtZIF4u88J3c0Sf+NIG0Nv9k5zTA
	aoFFM8T/V4fR/4g3Xny8g7FgFcDHvuiXLwq0ffNAdRHh9wRdqyDrVNacsXiPqs4XRSMBWPbvKz7
	xdd3hi8EUwZcBC3x6vCKq85aCI1uQZk6kUUGqdduavu379+AqtcsMqA+Zgseniv7xEgnlvKF5nz
	XpS7qJdlrexjTOP9NFE/09WrxdbjDZ8noDwS0AC/y6bfZC+V6H0S128RuAQ7IMYsUbS/NJ3r26o
	Ti3LnjCjmLgtBkNfcKwP6q/g1I5COiJSxboWHE9Qx0hcLpsYY4/0RnugL7XPy5II8yLWwvcrErL
	mdQqtcXK/hKBf7G80lxrug/p5gqEz5lzUCEcb0KuTNiDeEtcGcz9+Y8kXKbwPs3k1Y5eIb6OC+0
	EZHAfV6BBDgJUcMsrOeKTURuW729KOt3Z8NDZdF7qoKOiMewQB3vFkoTBMcRydj7mAzoSdvDzXd
	QyZDJm2gxzbvsd9c=
X-Received: by 2002:a05:7022:ed09:b0:159:aa67:28c1 with SMTP id a92af1059eb24-1ac5c92da58mr12112109c88.20.1793570644771;
        Sun, 01 Nov 2026 14:04:04 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:cbd8:5ca8:653a:11f9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b106edc7f8sm11097266c88.9.2026.11.01.14.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:04:04 -0800 (PST)
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
Subject: [PATCH v3 14/15] fdtfactor: Support compressed DTB inputs and outputs
Date: Sun,  1 Nov 2026 14:01:21 -0800
Message-ID: <20261101220224.1436242-15-dianders@chromium.org>
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
Content-Transfer-Encoding: 8bit

Firmware and FIT build pipelines frequently store device tree blobs
compressed with LZ4, LZMA/XZ, or gzip (e.g., `.dtb.lz4`).

Extend `fdtfactor` to detect compressed input blobs by magic bytes or
file extension, transparently decompress them before factoring, and
compress the resulting `.dtbo` and `base.dtb` outputs when appropriate:

- Support `.lz4` (including legacy `-l` frames via the `lz4` CLI),
  `.lzma`/`.xz` (via Python's `lzma` module, using `CHECK_CRC32` for XZ
  compatibility with kernel/bootloader decompressors), and `.gz` (via
  Python's `gzip` module).
- Preserve the input compression format on generated `.dtbo` files and
  compress `base.dtb` according to `--base-compression` (which defaults
  to `auto`, auto-detecting from `--output-base-dtb`'s filename
  extension such as `--output-base-dtb base.dtb.lz4`).
- Report compressed size savings alongside uncompressed savings when
  `-s`/`--stats` is specified.

On the 47 Qualcomm SC7180 Trogdor Chromebook `.dtb.lz4` files,
`fdtfactor -S` reduces total LZ4-compressed size from 1.71 MB to 213 KB
(87.5% savings).

Reviewed-by: Simon Glass <sjg@chromium.org>
Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- Update for -b/--base-dtb rename to --output-base-dtb (David Gibson)

Changes in v2:
- Add --base-compression to explicitly control base.dtb compression
  while documenting auto-detection from --base-dtb's filename suffix
  (David Gibson)
- Support legacy LZ4 frames (lz4 -l) and use CRC32 check for XZ outputs
  (Simon Glass)

 README.md            |  17 ++-
 fdtfactor            | 318 +++++++++++++++++++++++++++++++++++++++----
 tests/Makefile.tests |   5 +-
 tests/run_tests.sh   |  82 ++++++++++-
 4 files changed, 391 insertions(+), 31 deletions(-)

diff --git a/README.md b/README.md
index bb6f041e1e78..a3d1ad8c58f3 100644
--- a/README.md
+++ b/README.md
@@ -115,10 +115,10 @@ values.
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
@@ -135,7 +135,12 @@ Options:
 
 * `--output-base-dtb`: Output filename for the common base `.dtb`
   (default: `base.dtb`; placed in `--outdir` if specified, or the current
-  directory otherwise).
+  directory otherwise). By default (`--base-compression=auto`), `base.dtb`
+  is compressed if its filename carries a `.lz4`, `.xz`, `.lzma`, or `.gz`
+  suffix, whereas each `.dtbo` preserves its input `.dtb`'s compression.
+* `--base-compression`: Compression format for `--output-base-dtb`: `auto`,
+  `none`, `lz4`, `lz4_legacy`, `lzma`, `xz`, or `gzip` (default: `auto`,
+  which auto-detects from the `--output-base-dtb` filename suffix).
 * `-o`, `--outdir`: Output directory for generated `.dtbo` files and
   `--output-base-dtb` (default: alongside each input `.dtb` for `.dtbo` files,
   current directory for `--output-base-dtb`).
@@ -148,7 +153,7 @@ Options:
   passed to `dtc` solely to help `fdtfactor` locate phandles at build time
   and `/__local_fixups__` is not needed at runtime, passing `-S` strips it
   from `base.dtb` to save space.
-* `-s`, `--stats`: Print size savings summary.
+* `-s`, `--stats`: Print uncompressed and compressed size savings.
 
 ### TODO
 
diff --git a/fdtfactor b/fdtfactor
index 7442a2597399..9bc8bfde2038 100755
--- a/fdtfactor
+++ b/fdtfactor
@@ -12,14 +12,223 @@ original board DTB.
 
 import argparse
 from collections import Counter
+import gzip
+import lzma
 import os
 import struct
+import subprocess
 import sys
 
 import devicetree
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
+def decompress_blob(raw_bytes, filename='', comp=None):
+    """Decompress a DTB blob if compressed, returning `(raw_bytes, comp)`.
+
+    Args:
+        raw_bytes: Input file or property `bytes` (compressed or uncompressed).
+        filename: Optional filename or node description for error reporting and
+            extension fallback.
+        comp: Optional explicit compression type (`'none'`, `'lz4'`,
+            `'lz4_legacy'`, `'lzma'`, `'xz'`, `'gzip'`), or `None` to
+            auto-detect via `detect_compression()`.
+
+    Returns:
+        Tuple of `(uncompressed_bytes, resolved_compression_type)`.
+    """
+    if not comp:
+        comp = detect_compression(raw_bytes, filename)
+    elif comp == 'lz4' and raw_bytes.startswith(LZ4_LEGACY_MAGIC):
+        comp = 'lz4_legacy'
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
+    default compression format for `--output-base-dtb` from its output
+    filename.
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
 
@@ -78,11 +287,13 @@ class ParsedDtb:
         """Parse an input FDT file into a normalized FactoredTree.
 
         Args:
-            filename: File path of the `.dtb` file to read.
+            filename: File path of the `.dtb` (or compressed `.dtb.*`) file.
         """
         self.filename = filename
         with open(filename, 'rb') as f:
-            raw_bytes = f.read()
+            file_bytes = f.read()
+        self.compressed_size = len(file_bytes)
+        raw_bytes, self.compression = decompress_blob(file_bytes, filename)
         self.raw_bytes = raw_bytes
 
         try:
@@ -674,21 +885,23 @@ def create_base_dtb_and_overlays(dtbs, strip_local_fixups=False):
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
@@ -703,8 +916,9 @@ def parse_args(argv=None):
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
@@ -712,8 +926,18 @@ def parse_args(argv=None):
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
+            'Compression format for --output-base-dtb (default: auto, which '
+            'auto-detects from the --output-base-dtb filename extension)'
         ),
     )
     parser.add_argument(
@@ -737,13 +961,16 @@ def parse_args(argv=None):
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
+            'Input .dtb (or compressed .dtb.lz4/.xz/.lzma/.gz) files '
+            '(at least two required)'
+        ),
     )
     args = parser.parse_args(argv)
     if os.path.dirname(args.output_base_dtb):
@@ -756,13 +983,17 @@ def parse_args(argv=None):
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
@@ -776,6 +1007,25 @@ def _print_dtb_stats(dtbs, base_dtb_blob, dtbo_blobs):
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
@@ -792,6 +1042,13 @@ def factor_dtb_files(args):
         if args.outdir is not None
         else args.output_base_dtb
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
@@ -803,8 +1060,10 @@ def factor_dtb_files(args):
 
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
@@ -823,20 +1082,33 @@ def factor_dtb_files(args):
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
index e5ac38dd2bab..c18d824c7bc7 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -1261,6 +1261,84 @@ fdtfactor_tests () {
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
+	run_wrap_test $PYTHON $FDTFACTOR -s \
+	    --output-base-dtb "base.test.dtb.$ext" \
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
+    # extension and an uncompressed --output-base-dtb alongside compressed
+    # inputs.
+    if command -v gzip >/dev/null 2>&1; then
+	run_wrap_test gzip -9 -k -f \
+	    fdtfactor_board1.test.dtb fdtfactor_board2.test.dtb \
+	    fdtfactor_board3.test.dtb
+	cp fdtfactor_board1.test.dtb.gz fdtfactor_board1_magic.test.dtb
+	rm -rf fdtfactor_comp_mixed.test.dir
+	run_wrap_test $PYTHON $FDTFACTOR -s \
+	    --output-base-dtb base_uncomp.test.dtb \
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
+	# Explicit --base-compression overriding the --output-base-dtb filename
+	# extension
+	rm -rf fdtfactor_base_comp.test.dir
+	run_wrap_test $PYTHON $FDTFACTOR --base-compression=gzip \
+	    --output-base-dtb base_custom.test.dtb \
+	    -o fdtfactor_base_comp.test.dir \
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
@@ -1290,7 +1368,9 @@ if [ -z "$TESTSETS" ]; then
 fi
 
 # Make sure we don't have stale blobs lying around
-rm -f *.test.dtb *.test.dtbo *.test.dts
+rm -f *.test.dtb *.test.dtbo *.test.dts *.test.dtb.gz *.test.dtbo.gz \
+    *.test.dtb.xz *.test.dtbo.xz *.test.dtb.lzma *.test.dtbo.lzma \
+    *.test.dtb.lz4 *.test.dtbo.lz4
 rm -rf *.test.dir
 
 for set in $TESTSETS; do
-- 
2.56.0.317.g454f8302e1-goog

