Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862457;
	b=JDy5q2YfG5lezfj8ALpUSYIkjO+VrBJu4poxx6vN5FweGydlNbK02htNEiEP1HP7Y6ow
	 hWlnvxjbafTMvEnp8D85A9sa72RRu1WmfITUcGaYAPR4JqKMNgTXKTNT7aWYOr1MpOqJa
	 88JphYQqECFfA1zt82/aljd7WMmGcsuHN6wnzYE5kvq4kGVBnLTjGiuQV4FC4azwpkTbF
	 u448mTnTViYhz0Yc7RqcUj1Jz9RKCVyiiq5flxcXZ7IKdBcnZXZMPDR/coNrDA+mzwSF+
	 RX/5rUikZ1oubQOHN283SNQtJCRspNA77DdJBvJBL+wWdVlQaNUxMViGLBIA9x0uFAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862457;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=wY23vVP26FclYf43DSPod+3AMaTOMObgwHZwGjSX/TM=;
	b=c0ZFcKBVHS364hh0VhtV08y0EsWNy13pCbQImPO//swaYMQV5627FdVifzF6kMtyuX9z
	 I6leUuqFjVr4nmp9H1MzJ56LlJ+IEZcYphtTgZUYTQKjnDQgOZzvocqWvbpj2BBgBOSD3
	 URMf1jWSYzbbKsWMdC0fO05W3bHs381MV+sB39wOhcJdkby1bPNWNYJz3P2WBRE/fmE91
	 x0w/SSSD8zMMPj4/1LD2np4MhV8Hix6t/z6FRC7yyDtrOx38nlCzHqkDv0eU1U2bajAPL
	 C0aB7y9u1IBdRjNokJJQV0Yj7cMXo7nLwowdkgcCp3awldj1L3bN9GaZ4CVTS1Rb1pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Q6wL8QK+;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A20606A88A
	for <Devicetree-compiler@vger.kernel.org>; Mon, 16 Nov 2026 20:54:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87A20606A88A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Q6wL8QK+
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-380b40312e2so1792221eec.1
        for <Devicetree-compiler@vger.kernel.org>; Mon, 16 Nov 2026 12:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794862456; x=1795467256; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wY23vVP26FclYf43DSPod+3AMaTOMObgwHZwGjSX/TM=;
        b=Q6wL8QK+VY9xx+ONDUwIFC6FoYn6h2EOxNhpRr0lXW0s0OR9kdjh9F26P5SZhxBqvt
         s7mpPCa+m9D2lUEuynLelsGjX/50XOlz93ERGrMUqwsncVx6fnJWktyceqYkGfMjGu/r
         khlaMciBwbYHKIACSjmasF7++5fez2yj8AQFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794862456; x=1795467256;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wY23vVP26FclYf43DSPod+3AMaTOMObgwHZwGjSX/TM=;
        b=iA8nROIcK3LnuOM8R9LmYLzMfWup0H7bEJj2gA5EZovjLU8wRNwoZ3DpvOAKGzYaKi
         1JbG0wPRkNsblTAvG0Gz7vgJ1dmnYOkPdb7+xqTRZimz2wEy890eShQQdFl2yuVQiPpP
         TRldf17SQwvv2yhO1RzJ7BG6iAqyrPbREDZCp5m14hsaGSh77sN2jFpYF38DxbFk5lCB
         wplTKjJhnOFhplKCoxnIELgb1JtDtsX8LGEeZQ//qu3Rujrtcwd8vPGUvTbMgxamN9Gs
         isCJ9JA5fKj8paLDUhtpr7dX2EZqsExrgW5Z+Ds2fAZ2xEg23nZyixMffO2xRPn0kUJn
         TrJg==
X-Gm-Message-State: APuU4Z8cZJheUPiV3+YiggiTaS5zBatQs6UQi25ZQPrU3Pin8jPQHg2k
	lqFC5k9kqD7nNUq7QgHlQFurcXBgeZ8jlWJtHh5R2pBh0QhOrk/OhRX9RU/nBBgAwMVeIuVlYlm
	HGKW6ZA==
X-Gm-Gg: AZFdTZfzF2Yj3TDjU6plsonH8Y/gcNp5TS0rBNf4IjKl53OSGdemk9kmbv+ov0BgAzs
	Fr+GvOs0D02T7VE9oa6BBkKjvLG5cK0xCzLvrWfL+tRn6WGOvjZsylgmWAiWvpP9Jgm3tKJO6fU
	Nrj6WuTihFyAu5mifpZGWDilmUASd3hY8buw86ZOsVTL5oXl2VLZtX9gufBJkeyVl6Prtyj2QYW
	27QGDrMMvSW2qefXpUBUbCmRXBmH60N0GEirjc9HUG+E4UReBsGq9abkCwy+Qzb03Zv3R+nxzYZ
	0+f5aIgvj3jKYDicYx+CPZNgWw9d38g9xNgCPZf0zy9ZJ+TGlB7MrI+TGRfhJUr/+gJ6ryLojgi
	El/GwOhD2gEaZfxvt0rLBjIKuIE8VAO0XtKBkHKdJDOu8uqIKCo4Pvy1CtlYdVlv/Elz0qXKTS7
	TWctxQT345sWnbe3+3a96i5z5+VgAkjsq/BXqWtUaT6jeJIhdWRhV9GlLWzanD5AMOL1K4gnKzx
	cggQ9TNFXsVl5Rt8rHz4wiz99+hiJQlegHssWgh/oilltP5DsmCaJoIw9fcN4H2838ozDJTxAoV
	CE1ZfdLHtHjDQpB20kDLJhe+BMYf8ahiW+FaseNpFumCJpTynk4tAGVfq8ie2+MsqLQpSSqXRfn
	z+5SowaHBV5bpVw==
X-Received: by 2002:a05:693c:83d4:10b0:37f:4fda:1a85 with SMTP id 5a478bee46e88-37f4fda20f2mr3778860eec.16.1794862455442;
        Mon, 16 Nov 2026 12:54:15 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:40c8:6e27:a2df:3321])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm67120390eec.21.2026.11.16.12.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:54:14 -0800 (PST)
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
Subject: [PATCH v4 14/14] fdtfactor: Parallelize blob compression and decompression
Date: Mon, 16 Nov 2026 12:53:11 -0800
Message-ID: <20261116205320.1621386-15-dianders@chromium.org>
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

When factoring dozens or hundreds of compressed DTBs (either standalone
with `-C` or inside a compiled FIT with `-F`), running `gzip`, `lzma`,
`xz`, or external `lz4` processes sequentially spends several seconds
compressing and decompressing blobs one at a time.

Because Python's `zlib` and `_lzma` C extensions and `subprocess.run()`
for `lz4` all release the GIL, add a small `_map_blobs()` helper using
`concurrent.futures.ThreadPoolExecutor` to decompress input blobs and
compress output base/overlay blobs across worker threads in
deterministic input order whenever multiple compressed blobs are
processed.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Found this speedup while benchmarking fdtfactor. It's not critical to
functionality, but seems like a nice win.

Changes in v4:
- New patch parallelizing blob compression and decompression across
  worker threads

 fdtfactor | 190 +++++++++++++++++++++++++++++++++++++++---------------
 1 file changed, 138 insertions(+), 52 deletions(-)

diff --git a/fdtfactor b/fdtfactor
index ebf40cdeaf92..ab59763d8863 100755
--- a/fdtfactor
+++ b/fdtfactor
@@ -18,6 +18,7 @@ its embedded `/images/fdt-*` blobs into base DTBs (`fdt-base-1`, `fdt-base-2`,
 
 import argparse
 from collections import Counter
+import concurrent.futures
 import copy
 import gzip
 import hashlib
@@ -140,6 +141,32 @@ def compress_blob(raw_bytes, comp, filename=''):
     raise ValueError(f'{prefix}Unsupported compression type: {comp}')
 
 
+def _map_blobs(func, tasks, pool=None):
+    """Apply `func(blob, comp, filename)` across `tasks`, parallelizing if compressed.
+
+    Python's `zlib` and `_lzma` C extensions and external `lz4` subprocesses
+    release the GIL, so running multiple compressed tasks across a
+    `ThreadPoolExecutor` overlaps compression and decompression across CPU
+    cores while preserving deterministic input order.
+
+    Args:
+        func: `decompress_blob` or `compress_blob`.
+        tasks: Sequence of `(blob_bytes, comp, filename)` tuples.
+        pool: Optional shared `ThreadPoolExecutor` instance.
+
+    Returns:
+        List of processed `bytes` in the same order as `tasks`.
+    """
+    if len(tasks) < 2 or not any(
+        comp not in ('none', '', None) for _, comp, _ in tasks
+    ):
+        return [func(*t) for t in tasks]
+    if pool is not None:
+        return list(pool.map(lambda t: func(*t), tasks))
+    with concurrent.futures.ThreadPoolExecutor() as new_pool:
+        return list(new_pool.map(lambda t: func(*t), tasks))
+
+
 def _is_dtbo_overlay(root):
     """Return True if `root` is a `.dtbo` overlay tree rather than a base DTB.
 
@@ -1061,13 +1088,14 @@ def group_fit_dtbs(fdt_entries, min_overlap=50.0):
     return [grp['entries'] for grp in groups]
 
 
-def _extract_fit_fdt_entries(fit_in_path, images_node, configs_node):
+def _extract_fit_fdt_entries(fit_in_path, images_node, configs_node, pool=None):
     """Extract and parse non-overlay `flat_dt` entries from `/images`.
 
     Args:
         fit_in_path: Input FIT path (for error reporting).
         images_node: `DeviceTree` for the FIT `/images` node.
         configs_node: `DeviceTree` for the FIT `/configurations` node.
+        pool: Optional shared `ThreadPoolExecutor` for decompression.
 
     Returns:
         List of dicts (`{'name', 'node', 'dtb', 'fdt'}`) for all non-overlay
@@ -1081,7 +1109,7 @@ def _extract_fit_fdt_entries(fit_in_path, images_node, configs_node):
                     f'is not supported; sign the FIT after factoring'
                 )
 
-    fdt_entries = []
+    candidates = []
     for img_name, img_node in images_node.children.items():
         if ('data-offset' in img_node.props or
                 'data-position' in img_node.props):
@@ -1112,7 +1140,19 @@ def _extract_fit_fdt_entries(fit_in_path, images_node, configs_node):
             )
         if comp == 'lz4' and raw_data.startswith(LZ4_LEGACY_MAGIC):
             comp = 'lz4_legacy'
-        raw_bytes = decompress_blob(raw_data, comp, filename=node_label)
+        candidates.append((img_name, img_node, node_label, comp, raw_data))
+
+    raw_blobs = _map_blobs(
+        decompress_blob,
+        [(raw_data, comp, node_label)
+         for _, _, node_label, comp, raw_data in candidates],
+        pool=pool,
+    )
+
+    fdt_entries = []
+    for (img_name, img_node, node_label, comp, raw_data), raw_bytes in zip(
+        candidates, raw_blobs
+    ):
         fdt = _open_fdt(raw_bytes, node_label)
         root = FactoredTree.unflatten(fdt)
         if _is_dtbo_overlay(root):
@@ -1194,13 +1234,15 @@ def _partition_fit_fdt_entries(fdt_entries, single_base_dtb, min_overlap=50.0):
     return factorable_groups, unfactored_entries
 
 
-def _strip_fit_unfactored_local_fixups(unfactored_entries):
+def _strip_fit_unfactored_local_fixups(unfactored_entries, pool=None):
     """Strip `/__local_fixups__` from unfactored FIT `flat_dt` entries.
 
     Args:
         unfactored_entries: List of single-board FIT `flat_dt` entry dicts left
             unfactored by `_partition_fit_fdt_entries()`.
+        pool: Optional shared `ThreadPoolExecutor` for compression.
     """
+    to_recompress = []
     for entry in unfactored_entries:
         fdt = entry.pop('fdt')
         tree = libpydt.DeviceTree.unflatten(fdt)
@@ -1210,17 +1252,26 @@ def _strip_fit_unfactored_local_fixups(unfactored_entries):
             mem_rsv=entry['dtb'].mem_rsv,
             boot_cpuid_phys=entry['dtb'].boot_cpuid_phys,
         )
-        comp_bytes = compress_blob(
-            bytes(stripped_fdt.as_bytearray()),
+        stripped_bytes = bytes(stripped_fdt.as_bytearray())
+        to_recompress.append((
+            entry['node'],
+            stripped_bytes,
             entry['dtb'].compression,
-            filename=f'/images/{entry["name"]}',
-        )
-        img_node = entry['node']
+            f'/images/{entry["name"]}',
+        ))
+
+    comp_blobs = _map_blobs(
+        compress_blob,
+        [(blob, comp, label) for _, blob, comp, label in to_recompress],
+        pool=pool,
+    )
+    for (img_node, _, _, _), comp_bytes in zip(to_recompress, comp_blobs):
         img_node.set_prop(libfdt.Property('data', comp_bytes))
         _update_fit_hashes(img_node)
 
 
-def _factor_fit_group(entries, base_dtb_node_name, strip_local_fixups):
+def _factor_fit_group(entries, base_dtb_node_name, strip_local_fixups,
+                      pool=None):
     """Factor one group of FIT `flat_dt` entries into a base node and overlays.
 
     Args:
@@ -1229,6 +1280,7 @@ def _factor_fit_group(entries, base_dtb_node_name, strip_local_fixups):
             node (e.g., `'fdt-base-1'`).
         strip_local_fixups: If True, omit `/__local_fixups__` from the
             generated base DTB.
+        pool: Optional shared `ThreadPoolExecutor` for compression.
 
     Returns:
         Tuple of `(base_dtb_node, stat_args)` where `base_dtb_node` is the
@@ -1241,9 +1293,20 @@ def _factor_fit_group(entries, base_dtb_node_name, strip_local_fixups):
     )
     base_comp = group_dtbs[0].compression
 
-    base_dtb_comp_bytes = compress_blob(
-        base_dtb_blob, base_comp, filename=f'/images/{base_dtb_node_name}'
+    comp_blobs = _map_blobs(
+        compress_blob,
+        [
+            (base_dtb_blob, base_comp, f'/images/{base_dtb_node_name}'),
+            *(
+                (dtbo_blob, entry['dtb'].compression, f'/images/{entry["name"]}')
+                for entry, dtbo_blob in zip(entries, dtbo_blobs)
+            ),
+        ],
+        pool=pool,
     )
+    base_dtb_comp_bytes = comp_blobs[0]
+    dtbo_comp_blobs = comp_blobs[1:]
+
     base_dtb_node = copy.deepcopy(entries[0]['node'])
     for prop in ('phandle', 'compatible'):
         base_dtb_node.props.pop(prop, None)
@@ -1272,12 +1335,9 @@ def _factor_fit_group(entries, base_dtb_node_name, strip_local_fixups):
     _update_fit_hashes(base_dtb_node)
 
     dtbo_comp_sizes = []
-    for entry, dtbo_blob in zip(entries, dtbo_blobs):
+    for entry, dtbo_comp_bytes in zip(entries, dtbo_comp_blobs):
         img_node = entry['node']
         entry_comp = entry['dtb'].compression
-        dtbo_comp_bytes = compress_blob(
-            dtbo_blob, entry_comp, filename=f'/images/{entry["name"]}'
-        )
         dtbo_comp_sizes.append(len(dtbo_comp_bytes))
 
         if 'description' in img_node.props:
@@ -1386,39 +1446,42 @@ def factor_fit(fit_in_path, fit_out_path, strip_local_fixups=False,
             f'/configurations nodes'
         )
 
-    fdt_entries = _extract_fit_fdt_entries(
-        fit_in_path, images_node, configs_node
-    )
-    factorable_groups, unfactored_entries = _partition_fit_fdt_entries(
-        fdt_entries, single_base_dtb, min_overlap=min_overlap
-    )
-    if strip_local_fixups and unfactored_entries:
-        _strip_fit_unfactored_local_fixups(unfactored_entries)
-    else:
-        for entry in unfactored_entries:
-            entry.pop('fdt', None)
-
-    fdt_to_base_dtb = {}
-    insert_before_first = {}
-    group_stats = []
-    used_image_names = set(images_node.children)
-    next_base_idx = 1
-
-    for entries in factorable_groups:
-        while f'fdt-base-{next_base_idx}' in used_image_names:
-            next_base_idx += 1
-        base_dtb_node_name = f'fdt-base-{next_base_idx}'
-        used_image_names.add(base_dtb_node_name)
-        next_base_idx += 1
-        base_dtb_node, stat_args = _factor_fit_group(
-            entries, base_dtb_node_name, strip_local_fixups
+    with concurrent.futures.ThreadPoolExecutor() as pool:
+        fdt_entries = _extract_fit_fdt_entries(
+            fit_in_path, images_node, configs_node, pool=pool
         )
-        insert_before_first[entries[0]['name']] = (
-            base_dtb_node_name, base_dtb_node
+        factorable_groups, unfactored_entries = _partition_fit_fdt_entries(
+            fdt_entries, single_base_dtb, min_overlap=min_overlap
         )
-        for entry in entries:
-            fdt_to_base_dtb[entry['name']] = (base_dtb_node_name, entry['dtb'])
-        group_stats.append(stat_args)
+        if strip_local_fixups and unfactored_entries:
+            _strip_fit_unfactored_local_fixups(unfactored_entries, pool=pool)
+        else:
+            for entry in unfactored_entries:
+                entry.pop('fdt', None)
+
+        fdt_to_base_dtb = {}
+        insert_before_first = {}
+        group_stats = []
+        used_image_names = set(images_node.children)
+        next_base_idx = 1
+
+        for entries in factorable_groups:
+            while f'fdt-base-{next_base_idx}' in used_image_names:
+                next_base_idx += 1
+            base_dtb_node_name = f'fdt-base-{next_base_idx}'
+            used_image_names.add(base_dtb_node_name)
+            next_base_idx += 1
+            base_dtb_node, stat_args = _factor_fit_group(
+                entries, base_dtb_node_name, strip_local_fixups, pool=pool
+            )
+            insert_before_first[entries[0]['name']] = (
+                base_dtb_node_name, base_dtb_node
+            )
+            for entry in entries:
+                fdt_to_base_dtb[entry['name']] = (
+                    base_dtb_node_name, entry['dtb']
+                )
+            group_stats.append(stat_args)
 
     _update_fit_images_and_configs(
         images_node, configs_node, insert_before_first, fdt_to_base_dtb
@@ -1668,7 +1731,24 @@ def factor_dtb_files(args):
     """
     comp = args.compression
     input_dtb_paths = args.dtbs
-    dtbs = [ParsedDtb(p, comp=comp) for p in input_dtb_paths]
+    file_blobs = []
+    for p in input_dtb_paths:
+        with open(p, 'rb') as f:
+            file_blobs.append(f.read())
+    raw_blobs = _map_blobs(
+        decompress_blob,
+        [(b, comp, p) for p, b in zip(input_dtb_paths, file_blobs)],
+    )
+    dtbs = [
+        ParsedDtb(
+            p,
+            comp=comp,
+            fdt=_open_fdt(raw, p),
+            uncompressed_size=len(raw),
+            compressed_size=len(fblob),
+        )
+        for p, fblob, raw in zip(input_dtb_paths, file_blobs, raw_blobs)
+    ]
 
     base_dtb_path = (
         os.path.join(args.output, args.output_base_dtb)
@@ -1706,20 +1786,26 @@ def factor_dtb_files(args):
         strip_local_fixups=args.strip_local_fixups,
     )
 
-    base_dtb_file_bytes = compress_blob(
-        base_dtb_blob, comp, filename=base_dtb_path
+    comp_blobs = _map_blobs(
+        compress_blob,
+        [
+            (base_dtb_blob, comp, base_dtb_path),
+            *((b, comp, p) for p, b in zip(dtbo_paths, dtbo_blobs)),
+        ],
     )
+    base_dtb_file_bytes = comp_blobs[0]
+    dtbo_comp_blobs = comp_blobs[1:]
+
     if args.output:
         os.makedirs(args.output, exist_ok=True)
     with open(base_dtb_path, 'wb') as f:
         f.write(base_dtb_file_bytes)
 
     dtbo_file_sizes = []
-    for out_path, dtbo_blob in zip(dtbo_paths, dtbo_blobs):
+    for out_path, out_bytes in zip(dtbo_paths, dtbo_comp_blobs):
         out_dir = os.path.dirname(out_path)
         if out_dir:
             os.makedirs(out_dir, exist_ok=True)
-        out_bytes = compress_blob(dtbo_blob, comp, filename=out_path)
         dtbo_file_sizes.append(len(out_bytes))
         with open(out_path, 'wb') as f:
             f.write(out_bytes)
-- 
2.56.0.679.gc527c65306-goog

