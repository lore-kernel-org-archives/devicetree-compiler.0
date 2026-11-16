Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862453;
	b=U4BGNMf5c/beHybFfPrdPFwgeNFUywp5wfQ/+li4xZpE3aDhUrpG2To9EJxCKM54RMw6
	 yhVUODjhyCgX5Sd2CoS9XYDRtuhxh0wD1RsApcRWXtu6LLlr0bj4VASsyYXJrk+HGKw2u
	 KYr4sz5lYMVYXJ5TkSfY5ml4Q2zzgyuxEWB348+1wW9C9efB4ZeA3saJIxMqMfxoI2Roc
	 KaGDsHSNrbmPkHevmjqSeXRNPjORtDNwNQcP/GMIgND6uvIncorEQiZjw7bM+SkHcPlGA
	 XSywNUPzkk4Xua+pWDM5TJa6UA18sxMpdY7CDy5sFx85Cr0hDAMaCTmYNfynvPGq4Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862453;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sGCup0RtjtCip1BaWb9vaDcyEkcs8VQI+4Ux6CHO4JE=;
	b=aW/v/abTkSgp2azx6Op2a8f6RA/QeACwodrBYsoGDE7GalMPDEEnDxISRmxlPfBkf9u1
	 QDYLJsuBbnsM3ZDfd6aeiCU0170wLN08S+hvxllHBU4YvNec4WrMdcUsrBazIo0XiRdP8
	 oEzLV+osvE8QYw5eaMYdt7AMpIMP216DQTQAeQD92F1hBEZk4tAuLwjy0r8NknmFPCclI
	 7lG5T+1ChAVOjZR7nRf+KgvaqZXFJ0Jzi1Zs7nVYIqy13rH1D4FPWOGXyzikzCcYupfET
	 oYkvDX47yle+5FWhRObW2Bbp/IbXD/V+nlWvpYJefJ9RA6d/JAa9uXBoaB7iHwHyoxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=MXLaLr+z;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67267606A8AD
	for <Devicetree-compiler@vger.kernel.org>; Mon, 16 Nov 2026 20:54:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67267606A8AD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=MXLaLr+z
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36dbde64409so5734807eec.0
        for <Devicetree-compiler@vger.kernel.org>; Mon, 16 Nov 2026 12:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794862451; x=1795467251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sGCup0RtjtCip1BaWb9vaDcyEkcs8VQI+4Ux6CHO4JE=;
        b=MXLaLr+zHDxv9WfBhulLtGUqDKAtJvT7WPjLydISe3iWkl/TlkJFpayBJoOcDhiY4x
         oLx/E0wto40gH2hUWa/5kIHy3Zoj9fdmrCrFUPqVl5/9H1tgN3BsWyl2o1y4933lgG4U
         6IKRekXpP77PWtL33V30E88sSF3KbmsnDm8Vk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794862451; x=1795467251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sGCup0RtjtCip1BaWb9vaDcyEkcs8VQI+4Ux6CHO4JE=;
        b=bQcwsDdIe4JNPfeP7A6liJ0e7aotrBZv28L4X3lIo9BkOSbM7dZaOtTuYfA1bEmcpg
         xE9X99gl9DgVz3NV2xClJ3RATWEbpEL/s1Z1xFx+WjxFaGKtl1IjAoiZp8urR+VCmzEG
         8xeihP3D2c8aWalgAKBt0iBsrFxAFeTrkWuwfUbNByUR1dl/tEGPfwJnd9NYhBFVw4o2
         eRvfvBr341RK0IiydZhGZbNnWXI1NEOhCEuinOgy5BwcRa6BLp+FzG7ogE6EAK9PjXjm
         fk3gc3vMtpu6NoFptKLdJyD2QdO5jAfjOJij2yuNZ/MWi2ns1460xsxbdiEZGDPgLST6
         kJTg==
X-Gm-Message-State: APuU4Z9NxH9l9USx9Y28uRnnWfnDcc9yFi0X/wpNXQuVra/hotlAw+aI
	evGJAg68bjp/60BgA15kHybz5GERFnYdYH81j3ChliIac6PO2SW6uaiXe5rDTocIql9vPubtuO6
	ToW+qsg==
X-Gm-Gg: AZFdTZcw2eBc9yOnZRrCN3jeCejRtX6W1SPEL2MqH53mjlALjH1zAMJ8duEtjEJxYKQ
	wCP3mluG0PFm/HcYtJxY5bH1wXhrs9baH3fHuWVu6+KnDFxsGk/GyXYdnXdiceWjlXTvGEeAI7M
	H7BvxOitoMVdhAfCHTMKkZqC0CKKfuaVSXsGvOgI4X06zl18zHO4N55YwRtiYnjEePnigoNDOeE
	/TRicB09aB9MVgiWJDHf2uuY7KYueYSqiXNl1EqqtU/Mp/yGO9mufHDwAUQDT7JYO4tz7mS5jOl
	YO/JfvPcvpn4r7m/3CWSf1ObqhveV34WGAfJsLEKLnAEzzHeyRQgstedAMMyojkq8PY0euAxrQT
	0jRyqggBfUuCI6tGhUX5lrEeGTp8IO5CTZeChhvWh3PMJkUjRUzHdP3WZnDprdmbtPVFn/93Rra
	N8ho+ik2MOLKlqN9aUhDjCa7iqC5bK0LmYvofQQnTPCLroJw7o9HZUazNaOqfwTyybrVKPU0HEz
	NV1pQQZqjlLFZOi4FgjNRfptn8sowGszw1VI9J90AORX0gEOBU2C/XXnG6/FJ7nhdALfwmKv+QG
	A3uF8bXazHXhwOSlN2r9BShJeesvJTMJucxEO5sROJdmoqsMQfJH0yxoLIDxiH91CwkNvJXmXRG
	wpIcUq665Uf6jMQ==
X-Received: by 2002:a05:7300:85:b0:376:e950:873e with SMTP id 5a478bee46e88-37965f9ad51mr10745150eec.12.1794862451103;
        Mon, 16 Nov 2026 12:54:11 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:40c8:6e27:a2df:3321])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm67120390eec.21.2026.11.16.12.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:54:09 -0800 (PST)
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
Subject: [PATCH v4 12/14] fdtfactor: Support compressed DTB inputs and outputs
Date: Mon, 16 Nov 2026 12:53:09 -0800
Message-ID: <20261116205320.1621386-13-dianders@chromium.org>
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

Firmware and FIT build pipelines frequently store device tree blobs
compressed with LZ4, LZMA/XZ, or gzip (e.g., `.dtb.lz4`).

Add `-C` / `--compression` (`none`, `lz4`, `lz4_legacy`, `lzma`, `xz`,
`gzip`; default `none`) to `fdtfactor` to decompress compressed input
DTBs before factoring and compress the resulting `base.dtb` and `.dtbo`
outputs with the same algorithm:

- Support `lz4` and `lz4_legacy` (via the `lz4` CLI), `lzma` and `xz`
  (via Python's `lzma` module, using `CHECK_CRC32` for XZ compatibility
  with kernel/bootloader decompressors), and `gzip` (via Python's `gzip`
  module).
- Default `--output-base-dtb` to `base.dtb.<ext>` matching `-C` /
  `--compression` (e.g., `base.dtb.lz4` when `-C lz4` is passed), and
  emit `.dtbo.<ext>` overlays.
- Report compressed size savings alongside uncompressed savings when
  `-s` / `--stats` is specified with compression enabled.

On the 47 Qualcomm SC7180 Trogdor Chromebook `.dtb.lz4` files,
`fdtfactor -S -C lz4` reduces total LZ4-compressed size from 1.08 MB
(built without `-@ -L`) to 214 KB (80.2% savings).

Reviewed-by: Simon Glass <sjg@chromium.org>
Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4:
- Replace magic-byte/extension auto-detection and --base-compression
  with a single explicit -C/--compression option controlling both input
  and output compression (David Gibson)
- Drop unnecessary --stats documentation/help changes and use 4-space
  indentation in tests/run_tests.sh (David Gibson)
- Use check_factored_dtb in fdtfactor_tests so tests pass when
  OVERLAY_LOCAL_FIXUPS != 2 (Simon Glass)

Changes in v3:
- Update for -b/--base-dtb rename to --output-base-dtb (David Gibson)

Changes in v2:
- Add --base-compression to explicitly control base.dtb compression
  while documenting auto-detection from --base-dtb's filename suffix
  (David Gibson)
- Support legacy LZ4 frames (lz4 -l) and use CRC32 check for XZ outputs
  (Simon Glass)

 README.md            |  11 ++-
 fdtfactor            | 208 ++++++++++++++++++++++++++++++++++++++-----
 tests/Makefile.tests |   5 +-
 tests/run_tests.sh   |  51 ++++++++++-
 4 files changed, 248 insertions(+), 27 deletions(-)

diff --git a/README.md b/README.md
index 198384cd8456..ac571384d421 100644
--- a/README.md
+++ b/README.md
@@ -204,7 +204,8 @@ $ fdtoverlay -i base.dtb -o merged.dtb overlay1.dtbo overlay2.dtbo
 ## fdtfactor
 
 `fdtfactor` is a Python tool built on `pylibfdt` that takes a set of
-compiled device tree blobs (`.dtb`) and splits them into a single common
+compiled device tree blobs (`.dtb`, or compressed `.dtb.lz4`, `.dtb.xz`,
+`.dtb.lzma`, `.dtb.gz` with `-C`) and splits them into a single common
 `base.dtb` and per-board `.dtbo` overlays so that applying a board's
 `.dtbo` to `base.dtb` recreates the original board device tree while
 reducing total storage size.
@@ -223,8 +224,12 @@ $ fdtfactor -o out_dir board1.dtb board2.dtb board3.dtb
 Options:
 
 * `--output-base-dtb`: Output filename for the common base `.dtb`
-  (default: `base.dtb`; placed in `--output` if specified, or the current
-  directory otherwise).
+  (default: `base.dtb`, or `base.dtb.<ext>` when `-C` / `--compression` is
+  used; placed in `--output` if specified, or the current directory
+  otherwise).
+* `-C`, `--compression`: Compression format for both input `.dtb` files and
+  generated `base.dtb` / `.dtbo` outputs: `none`, `lz4`, `lz4_legacy`, `lzma`,
+  `xz`, or `gzip` (default: `none`).
 * `-o`, `--output`: Output directory for generated `.dtbo` files and
   `--output-base-dtb` (default: alongside each input `.dtb` for `.dtbo` files,
   current directory for `--output-base-dtb`).
diff --git a/fdtfactor b/fdtfactor
index a083a8c380a0..beeeff231ba6 100755
--- a/fdtfactor
+++ b/fdtfactor
@@ -12,14 +12,125 @@ original board DTB.
 
 import argparse
 from collections import Counter
+import gzip
+import lzma
 import os
 import struct
+import subprocess
 import sys
 
 import libfdt
 import libpydt
 
 
+COMP_TO_EXT = {
+    'none': '',
+    'lz4': '.lz4',
+    'lz4_legacy': '.lz4',
+    'lzma': '.lzma',
+    'xz': '.xz',
+    'gzip': '.gz',
+}
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
+def decompress_blob(data, comp, filename=''):
+    """Decompress a DTB blob according to `comp`.
+
+    Args:
+        data: Input file or property `bytes` (compressed or uncompressed).
+        comp: Compression format (`'none'`, `'lz4'`, `'lz4_legacy'`, `'lzma'`,
+            `'xz'`, or `'gzip'`).
+        filename: Optional filename or node description for error reporting.
+
+    Returns:
+        Uncompressed FDT `bytes`.
+    """
+    if comp in ('none', '', None):
+        return data
+    target = filename or 'blob'
+    if comp in ('lz4', 'lz4_legacy'):
+        return _run_lz4(['-d', '-q', '-c'], data, f'decompress {target}')
+    if comp == 'gzip':
+        try:
+            return gzip.decompress(data)
+        except Exception as exc:
+            raise RuntimeError(
+                f'Failed to decompress {target} with gzip: {exc}'
+            ) from exc
+    if comp in ('lzma', 'xz'):
+        try:
+            return lzma.decompress(data)
+        except Exception as exc:
+            raise RuntimeError(
+                f'Failed to decompress {target} with {comp}: {exc}'
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
 def _is_dtbo_overlay(root):
     """Return True if `root` is a `.dtbo` overlay tree rather than a base DTB.
 
@@ -64,7 +175,7 @@ class ParsedDtb:
 
     - Stores FDT header, memory reservation, and file-level metadata that live
       outside the root node tree (`boot_cpuid_phys`, `mem_rsv`, `filename`,
-      `uncompressed_size`).
+      `compression`, `compressed_size`, `uncompressed_size`).
     - Pops `/__symbols__` (parsed into `self.symbols`) and `/__local_fixups__`
       out of `self.root`, and indexes the remaining tree in pre-order in
       `self.nodes` (`path -> FactoredTree`).
@@ -75,15 +186,19 @@ class ParsedDtb:
       independent of numeric phandle numbering.
     """
 
-    def __init__(self, filename):
+    def __init__(self, filename, comp='none'):
         """Parse an input FDT file into a normalized FactoredTree.
 
         Args:
-            filename: File path of the `.dtb` file to read.
+            filename: File path of the `.dtb` (or compressed `.dtb.*`) file.
+            comp: Compression format string (default: `'none'`).
         """
         self.filename = filename
+        self.compression = comp
         with open(filename, 'rb') as f:
-            raw_bytes = f.read()
+            file_bytes = f.read()
+        self.compressed_size = len(file_bytes)
+        raw_bytes = decompress_blob(file_bytes, comp, filename=filename)
         self.uncompressed_size = len(raw_bytes)
 
         try:
@@ -709,21 +824,26 @@ def create_base_dtb_and_overlays(dtbs, strip_local_fixups=False):
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
     dtb_dir, filename = os.path.split(dtb_path)
+    ext = COMP_TO_EXT[comp]
+    if ext and filename.endswith(ext):
+        filename = filename[:-len(ext)]
     stem = filename[:-4] if filename.endswith('.dtb') else filename
     target_dir = outdir if outdir is not None else dtb_dir
-    return os.path.join(target_dir, f'{stem}.dtbo')
+    return os.path.join(target_dir, f'{stem}.dtbo{ext}')
 
 
 def parse_args(argv=None):
@@ -738,17 +858,28 @@ def parse_args(argv=None):
     """
     parser = argparse.ArgumentParser(
         description=(
-            'Split a set of compiled device tree blobs (.dtb) into a single '
-            'common base .dtb and per-board overlay blobs (.dtbo).'
+            'Split a set of compiled device tree blobs (.dtb, or compressed '
+            '.dtb.lz4/.xz/.lzma/.gz with -C) into a single common base .dtb '
+            'and per-board overlay blobs (.dtbo).'
         )
     )
     parser.add_argument(
         '--output-base-dtb',
-        default='base.dtb',
+        default=None,
         metavar='FILENAME',
         help=(
-            'Output common base .dtb filename (default: base.dtb; placed in '
-            '--output if specified, or current directory otherwise)'
+            'Output common base .dtb filename (default: base.dtb, or '
+            'base.dtb.<ext> when -C/--compression is used; placed in --output '
+            'if specified, or current directory otherwise)'
+        ),
+    )
+    parser.add_argument(
+        '-C', '--compression',
+        choices=tuple(COMP_TO_EXT),
+        default='none',
+        help=(
+            'Compression format for both input DTBs and output base.dtb/.dtbo '
+            'files (default: none)'
         ),
     )
     parser.add_argument(
@@ -778,9 +909,14 @@ def parse_args(argv=None):
         'dtbs',
         nargs='+',
         metavar='DTB',
-        help='Input .dtb files (at least two required)',
+        help=(
+            'Input .dtb (or compressed .dtb.lz4/.xz/.lzma/.gz with -C) files '
+            '(at least two required)'
+        ),
     )
     args = parser.parse_args(argv)
+    if args.output_base_dtb is None:
+        args.output_base_dtb = f'base.dtb{COMP_TO_EXT[args.compression]}'
     if not args.output_base_dtb or os.path.dirname(args.output_base_dtb):
         parser.error(
             '--output-base-dtb must be a non-empty filename without directory '
@@ -791,13 +927,17 @@ def parse_args(argv=None):
     return args
 
 
-def _print_dtb_stats(dtbs, base_dtb_blob, dtbo_blobs):
-    """Print uncompressed size savings summary.
+def _print_dtb_stats(dtbs, base_dtb_blob, dtbo_blobs, comp, base_dtb_csize,
+                     dtbo_csizes):
+    """Print uncompressed and compressed size savings summary.
 
     Args:
         dtbs: Sequence of input `ParsedDtb` instances.
         base_dtb_blob: Uncompressed base DTB `bytes`.
         dtbo_blobs: Sequence of uncompressed `.dtbo` overlay `bytes`.
+        comp: Compression format of the inputs and outputs.
+        base_dtb_csize: Byte size of the compressed base DTB output.
+        dtbo_csizes: Sequence of byte sizes of the compressed `.dtbo` outputs.
     """
     orig_uncomp = sum(d.uncompressed_size for d in dtbs)
     base_dtb_uncomp = len(base_dtb_blob)
@@ -811,6 +951,18 @@ def _print_dtb_stats(dtbs, base_dtb_blob, dtbo_blobs):
         f'{dtbo_uncomp:,} B = {new_uncomp:,} B '
         f'(saved {saved_uncomp:,} B / {pct_uncomp:.1f}%)'
     )
+    if comp != 'none':
+        orig_comp = sum(d.compressed_size for d in dtbs)
+        dtbo_csize = sum(dtbo_csizes)
+        new_comp = base_dtb_csize + dtbo_csize
+        saved_comp = orig_comp - new_comp
+        pct_comp = (saved_comp / orig_comp * 100.0) if orig_comp else 0.0
+        print(
+            f'Compressed ({comp}): {len(dtbs)} files ({orig_comp:,} B) -> '
+            f'base {base_dtb_csize:,} B + {len(dtbo_blobs)} overlays '
+            f'{dtbo_csize:,} B (avg {dtbo_csize // len(dtbo_blobs):,} B) = '
+            f'{new_comp:,} B (saved {saved_comp:,} B / {pct_comp:.1f}%)'
+        )
 
 
 def factor_dtb_files(args):
@@ -819,8 +971,9 @@ def factor_dtb_files(args):
     Args:
         args: Parsed `argparse.Namespace` from `parse_args()`.
     """
+    comp = args.compression
     input_dtb_paths = args.dtbs
-    dtbs = [ParsedDtb(p) for p in input_dtb_paths]
+    dtbs = [ParsedDtb(p, comp=comp) for p in input_dtb_paths]
 
     base_dtb_path = (
         os.path.join(args.output, args.output_base_dtb)
@@ -839,7 +992,7 @@ def factor_dtb_files(args):
     dtbo_paths = []
     seen_paths = {base_abs_path}
     for dtb_path in input_dtb_paths:
-        out_path = get_dtbo_output_path(dtb_path, args.output)
+        out_path = get_dtbo_output_path(dtb_path, args.output, comp=comp)
         abs_out = os.path.abspath(out_path)
         if abs_out in input_abs_paths:
             raise ValueError(
@@ -858,20 +1011,31 @@ def factor_dtb_files(args):
         strip_local_fixups=args.strip_local_fixups,
     )
 
+    base_dtb_file_bytes = compress_blob(
+        base_dtb_blob, comp, filename=base_dtb_path
+    )
     if args.output:
         os.makedirs(args.output, exist_ok=True)
     with open(base_dtb_path, 'wb') as f:
-        f.write(base_dtb_blob)
+        f.write(base_dtb_file_bytes)
 
+    dtbo_file_sizes = []
     for out_path, dtbo_blob in zip(dtbo_paths, dtbo_blobs):
         out_dir = os.path.dirname(out_path)
         if out_dir:
             os.makedirs(out_dir, exist_ok=True)
+        out_bytes = compress_blob(dtbo_blob, comp, filename=out_path)
+        dtbo_file_sizes.append(len(out_bytes))
         with open(out_path, 'wb') as f:
-            f.write(dtbo_blob)
+            f.write(out_bytes)
 
     if args.stats:
-        _print_dtb_stats(dtbs, base_dtb_blob, dtbo_blobs)
+        _print_dtb_stats(
+            dtbs, base_dtb_blob, dtbo_blobs,
+            comp=comp,
+            base_dtb_csize=len(base_dtb_file_bytes),
+            dtbo_csizes=dtbo_file_sizes,
+        )
 
 
 def main(argv=None):
diff --git a/tests/Makefile.tests b/tests/Makefile.tests
index 9e8d09d37d8b..1eed9ba6478a 100644
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
index 4f5026e363fc..9b005396bc79 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -1324,6 +1324,53 @@ fdtfactor_tests () {
         run_test dtbs_equal_unordered fdtfactor_board${i}.nolf.test.dtb \
             fdtfactor_strip.test.dir/merged${i}.test.dtb
     done
+
+    # Compressed (.dtb.gz / .dtb.xz / .dtb.lzma / .dtb.lz4) modes via -C
+    for comp_spec in "gzip:gz:gzip -9 -k -f:gzip -d -f" \
+                     "xz:xz:xz -k -f:xz -d -f" \
+                     "lzma:lzma:xz --format=lzma -k -f:xz -d -f" \
+                     "lz4:lz4:lz4 -12 -q -f -m:lz4 -d -q -f --rm" \
+                     "lz4_legacy:lz4:lz4 -l -12 -q -f -m:lz4 -d -q -f --rm"; do
+        algo="${comp_spec%%:*}"
+        rest="${comp_spec#*:}"
+        ext="${rest%%:*}"
+        rest="${rest#*:}"
+        comp_cmd="${rest%%:*}"
+        decomp_cmd="${rest#*:}"
+        if ! command -v "${comp_cmd%% *}" >/dev/null 2>&1; then
+            continue
+        fi
+        run_wrap_test $comp_cmd \
+            fdtfactor_board1.test.dtb fdtfactor_board2.test.dtb \
+            fdtfactor_board3.test.dtb
+        rm -rf fdtfactor_comp.test.dir
+        run_wrap_test $PYTHON $FDTFACTOR -s -C "$algo" \
+            -o fdtfactor_comp.test.dir \
+            "fdtfactor_board1.test.dtb.$ext" \
+            "fdtfactor_board2.test.dtb.$ext" \
+            "fdtfactor_board3.test.dtb.$ext"
+        run_wrap_test $decomp_cmd "fdtfactor_comp.test.dir/base.dtb.$ext"
+        run_wrap_test $decomp_cmd \
+            "fdtfactor_comp.test.dir/fdtfactor_board1.test.dtbo.$ext"
+        run_wrap_test $FDTOVERLAY \
+            -i fdtfactor_comp.test.dir/base.dtb \
+            -o fdtfactor_comp.test.dir/merged1.test.dtb \
+            fdtfactor_comp.test.dir/fdtfactor_board1.test.dtbo
+        check_factored_dtb fdtfactor_board1.test.dtb \
+            fdtfactor_comp.test.dir/merged1.test.dtb
+    done
+
+    # Verify that mismatched compression (compressed inputs without -C, or
+    # uncompressed inputs with -C) fails rather than guessing.
+    if command -v gzip >/dev/null 2>&1; then
+        run_wrap_test gzip -9 -k -f \
+            fdtfactor_board1.test.dtb fdtfactor_board2.test.dtb
+        run_wrap_error_test $PYTHON $FDTFACTOR -o fdtfactor_comp_err.test.dir \
+            fdtfactor_board1.test.dtb.gz fdtfactor_board2.test.dtb.gz
+        run_wrap_error_test $PYTHON $FDTFACTOR -C gzip \
+            -o fdtfactor_comp_err.test.dir \
+            fdtfactor_board1.test.dtb fdtfactor_board2.test.dtb
+    fi
 }
 
 while getopts "vt:me" ARG ; do
@@ -1353,7 +1400,9 @@ if [ -z "$TESTSETS" ]; then
 fi
 
 # Make sure we don't have stale blobs lying around
-rm -f *.test.dtb *.test.dtbo *.test.dts
+rm -f *.test.dtb *.test.dtbo *.test.dts *.test.dtb.gz *.test.dtbo.gz \
+    *.test.dtb.xz *.test.dtbo.xz *.test.dtb.lzma *.test.dtbo.lzma \
+    *.test.dtb.lz4 *.test.dtbo.lz4
 rm -rf *.test.dir
 
 for set in $TESTSETS; do
-- 
2.56.0.679.gc527c65306-goog

