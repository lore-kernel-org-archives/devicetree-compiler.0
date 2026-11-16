Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862411;
	b=0xLip/9OWTwy1pfv9+ZoZeuhrMcK93lDFpb3enrFNt3AOgZ3y3uZDla/S/tHmN7AhHju
	 vO/Qnw3sI/g4a9eIKl4Z0jdD06qhwjGwp1BV6zKZH1ubjDDIK2rltwIcPjwD/vNJgZN6h
	 qde3dvOgFWUosN34JCCkqKYjRdxIk5OOiUWd240pBfRq3WGnaL1ve6ZgKvAcJWeFFnl3m
	 czclTZ9CVXQcbu3A2P3pIMg7LRlB7etJ2CWugagYfK7LWT71cv9fRZgSk2EVAiF3f2/kF
	 ufV3SQEnLWIpfZK8s87hZl6z2wA052vzmGibS/IvDS8+6cs+eJtAsNPGUbIVDInBPpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862411;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=TN7GgaQjbiXrJ1Dkp7uLNXNpjZ+U4N8o/5liCViDKuo=;
	b=nyxBVoCLslzfzD3kYFeiddN/EG2avd9eFg1d1uAIaCQEM1SMw2ZhfsfdzLx6ukdO/LKh
	 DCISxqdbU9ZjKK+LoK//zrlBa1TO1zKVQDQLBidvJsVYAR7BzboD5DfedPP0BMDJ2udVJ
	 AsOdpuUO988FOYjRDcHZDia20N6Pc+5t9vuPbSk2/4jjBzFTwSPXqvdLte8S1VTqY2d2d
	 3ubvSuTFLE5vjm239XH6+EAWv9OYUfeE7rRlM5Wc1vihRF9Ym9QUsAtt/LYaYmmrhXxKT
	 SCXuOUcWN2WfIWT4rPD6XLCAE0Qrf2ke42P7ZrbmEjB9HHooYxyxxvlECqEDUjaoVKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=BvsPebGJ;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C3B606A31C
	for <Devicetree-compiler@vger.kernel.org>; Mon, 16 Nov 2026 20:53:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22C3B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=BvsPebGJ
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-37628596783so6575808eec.1
        for <Devicetree-compiler@vger.kernel.org>; Mon, 16 Nov 2026 12:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794862409; x=1795467209; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TN7GgaQjbiXrJ1Dkp7uLNXNpjZ+U4N8o/5liCViDKuo=;
        b=BvsPebGJDoAlKpcCJF2+mrxScvtJO748AWDDP7xFPqakEA3L4P3ut7SiZ+Jl+kENs7
         gX3o6gc+iaCv+RAv03b/5nw8EHbXX9erCeLxQkPtTQ9OA7SjJ4X6Xwm+w0VssMJktpBy
         B/8xIL7wrBIB5jyWYfquWILBCXyRs3oAGwWss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794862409; x=1795467209;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TN7GgaQjbiXrJ1Dkp7uLNXNpjZ+U4N8o/5liCViDKuo=;
        b=J4nH6RNyDws4omFL/LfCNNWFiYCdQhJqUM6cvsCQmGOKMGRA++fA5a9FP84glU3X3x
         eiyoUnqy9uZbn32IyO7QV8SclL5pHULmtos0agbWyW44VORG7O1UDTiWv/7d1bgA78Kn
         7nGcRQo5ZVURKlI7zTUDw9xDlT613KdFmvjzf37SceUL+L4bWFI4+HqtSFi2rtH3VZZX
         rq+aHDW6KbaycIoPr1FUVmpCWFuPW6GL38AXCB3w2jp1J+SXCAHJqpGaxXCGiBNXeHIf
         rK+9oVSjBfh6BW+aMz5i5obGv8ZXmT0MUGH+6esivWnawTRsOfg45O/fv0c0fACH0phg
         oXUA==
X-Gm-Message-State: APuU4Z+sKi3w24WVcv3rB4R1v9uIjkpAbyULWncvAgf+slBoPEG3gWdi
	/r/YcoyMZLw0JnTrR+m2sfp9N/FOqQrb+Cf1gFla+6xmtE260Ld+/is6VP1djUoQGRGcw7bWYWO
	8beGz9g==
X-Gm-Gg: AZFdTZcJfglyYDehZktVYi270BR4JuBRnubnzlAOmI2NBFO6uVpAnR/XAAkubGjnNo4
	7Opreki8E2tas7blh7MFVWIABJZTEC57Yeo3xSYfJGpbXIf4LUK0z+fIJYJ25cVo/QQDRzFGoBi
	09NQkdP6ASap7coY+b0DPY8VR6Py2hMNUbWZQAGXmldsOR/KKCGlXER2/EubjhxYigs+ZFB3dr6
	/ObiDFU9EP5e9zXSz0HnYNClFJfoBv2o6xlfGOfnCGHxGExEDkRAIQMTVnoqmysezv5NtnN2a2P
	EU1auco9wPvHTobA22Qrye6RbUHVGSEaEcnpgqndHqCOZON22uVw4lTbFUwcsgZvl8jwfzDB6rm
	bgVkizTL5fxDhbgBvbAutLdwCfzuV93acNDetTs9pT5JtcUHIfJFwlGyopgHKrGBPljkEPvcYG/
	1A1GqGtkNaOozUEljJ8BtxJv/ifW8lxHS0pTJfc/aIx2YRGWq/pMyWbG/31p2d0r13mnIo3nw24
	SJLUTIQ30fNItdPL3wjmfAttOkr/IXG8CTSCD8zO4WpnP4TAzFHbuGFF8a1QxMe/dbamsiSu0xo
	50lmX8Kg9SIIL/peZIwi6+OoZc0L+652xQHJ9t+MBkL5N4loVctf2eggyLT8LmjcsejTn4pYIFf
	wuJAPSeguTAJNeXqwuMUX2Uhfw5UXerb23LM=
X-Received: by 2002:a05:7300:5356:b0:381:db2:9772 with SMTP id 5a478bee46e88-3810db29d7bmr861273eec.29.1794862408963;
        Mon, 16 Nov 2026 12:53:28 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:40c8:6e27:a2df:3321])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm67120390eec.21.2026.11.16.12.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:53:27 -0800 (PST)
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
Subject: [PATCH v4 00/14] fdtfactor: Introduce fdtfactor to auto-factor overlays
Date: Mon, 16 Nov 2026 12:52:57 -0800
Message-ID: <20261116205320.1621386-1-dianders@chromium.org>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
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


Devicetree overlays exist at both the source level (via `/include/` and
`.dtsi` files) and the binary level (where a compiled `.dtbo` overlay is
applied to a "base" `.dtb` at runtime to add or modify nodes).

Binary `.dtbo` overlays were created by transcribing source-level
overlay semantics to `.dtb` blobs to serve two main use cases:

1. Supporting add-on boards (like "hats" on a dev board), where a base
   board's `.dtb` is combined with an add-on board's `.dtbo` at boot or
   runtime (a use case that Hervé Codina's upcoming "addons" work aims
   to model more cleanly).

2. Allowing constrained bootloaders or firmware images to support a
   "family" of similar boards in a space-efficient way without shipping
   a full `.dtb` for every variant. In upstream Linux, for example,
   there are 47 distinct sc7180-trogdor boards supported. At the source
   level these boards share common `.dtsi` files, but we still compile
   (and ship) 47 separate full `.dtb` blobs. Binary devicetree overlays
   can make this much more efficient by factoring the common bits into a
   single base `.dtb` and representing each of the 47 boards as a small
   `.dtbo` overlay.

Even though `.dtbo` overlay semantics are a natural fit for case #2
(since they derive from source-level `.dts` overlays, which were
designed for board/SoC families), upstream Linux has mostly reserved
compiled `.dtso` -> `.dtbo` overlays for case #1. Many Android phones
attempt to use `.dtso` overlays for case #2 by describing the SoC as the
base devicetree and describing boards in `.dtso` overlays, but forcing
the binary base/overlay split into the source files has drawbacks: there
is still lots of duplication between board overlays, and upstream
reception towards structuring board source files this way has been
lukewarm [1].

This patch series introduces a tool to decouple binary `.dtbo`
generation from `.dts` source structure. The idea (suggested by Konrad
Dybcio at LPC) is to continue to represent all the boards in a family as
normal standalone device trees in source code (using `.dtsi` includes as
makes sense for human readability). Then, after building the full `.dtb`
blobs, `fdtfactor` automatically factors them into a common base `.dtb`
and a set of per-board `.dtbo` overlays.

This tool has quite a few advantages over other solutions:
1. No change to the way device trees are stored / arranged upstream.
2. No need to deal with some of the awkwardness / limitations of
   overlays.
3. Better savings than just a simple partitioning, like between SoC and
   boards.

I've used `fdtfactor -S` to reduce sc7180-trogdor device tree files
(which are stored lz4 compressed) from 1.08 MB (built without `-@ -L`)
to 214 KB, an 80.2% savings.

To compare against the manual SoC-base + board-overlay split used by
downstream Android kernels, I also tested `fdtfactor -S` on the
downstream Pixel 10 family device trees (29 physical hardware board
variants: 27 phone variants across Pixel 10, Pixel 10 Pro, and Pixel 10
Pro XL plus 2 socketed dev board variants) by combining the downstream
base + overlays into full board DTBs and re-factoring them with
`fdtfactor -S`:

* Just B0 silicon (29 boards):
  - Full unfactored DTBs (29 `.dtb`s): 26.30 MB uncompressed (5.28 MB
    lz4)
  - Downstream manual SoC base (`lga-b0.dtb`) + 29 board `.dtbo`s:
    8.06 MB uncompressed (1.66 MB lz4)
  - Auto-factored with `fdtfactor -S` (1 `base.dtb` + 29 `.dtbo`s):
    3.27 MB uncompressed (668 KB lz4) -- 2.48x smaller than the manual
    SoC split (and 3.68x smaller across the 27 phone boards alone, where
    average overlay size drops from 252 KB to 44 KB uncompressed, or
    52 KB to 9.1 KB lz4).

* Both A0 and B0 SoC steppings:
  In practice, phone Proto boards (8 variants) only ever use A0 silicon,
  phone EVT1.1+ boards (15 variants) only ever use B0 silicon, and only
  phone EVT1 boards (4 variants) and the socketed dev boards (2
  variants) can have either A0 or B0 silicon -- giving 35 realistic
  (board, stepping) combinations (14 A0 + 21 B0), compared to 58 for a
  naive 29 x 2 cross-product:
  - Full unfactored DTBs (35 `.dtb`s): 31.71 MB uncompressed (6.37 MB
    lz4)
  - Downstream manual split (2 SoC bases `lga-a0.dtb` + `lga-b0.dtb` +
    29 board `.dtbo`s): 8.78 MB uncompressed (1.79 MB lz4)
  - Auto-factored with `fdtfactor -S` (1 shared `base.dtb` + 35
    `.dtbo`s): 4.00 MB uncompressed (855 KB lz4). This could likely be
    improved more with multiple levels of overlays, but we're already
    2x smaller than what downstream is doing today.

NOTE: on Chromebooks like sc7180-trogdor, using overlays like this is
an optimization. On Android phones like Pixel 10, the bootloader logic
bakes in the need for overlays. Specifically, if we want to be able to
build a single image that supports multiple boards and have the
bootloader auto-construct the right devicetree, we need the boards to be
represented by overlays. This fdtfactor tool can make that a reality.

The fdtfactor tool can either work directly on a set of compiled
devicetree files or it can work on a FIT (flattened image tree) file.
The idea is that you'd create the FIT file containing all of the
duplicated devicetree files and then fdtfactor would "optimize" them.

To test multi-SoC FIT factoring, I also built an upstream Linux
`arch/arm64` `image.fit` containing all 438 Qualcomm device trees (367
standalone `.dtb`s plus 71 composite `.dtb`s built from 30 add-on
`.dtbo`s; gzip-compressed). Comparing the embedded FDT blob totals (with
non-factored cases built without `-@ -L`, and factored cases using
`fdtfactor -S`):

* Plain FIT (438 full `.dtb`s): 49.13 MB uncompressed (9.27 MB gzip)
* `FIT_DECOMPOSE_DTBS=1` alone (deduplicating the 71 composite `.dtb`s
  into 367 `.dtb`s + 30 add-on `.dtbo`s): 36.23 MB uncompressed (6.94 MB
  gzip)
* `fdtfactor` alone (41 `fdt-base-*` groups, 426 board `.dtbo`s, 12
  single-board SoCs): 18.26 MB uncompressed (3.59 MB gzip -- 61.3%
  compressed savings vs. plain)
* `FIT_DECOMPOSE_DTBS=1` + `fdtfactor` (41 `fdt-base-*` groups, 355
  board `.dtbo`s, 30 add-on `.dtbo`s, 12 single-board SoCs): 15.28 MB
  uncompressed (3.03 MB gzip -- 67.3% compressed savings vs. plain,
  56.3% vs. `FIT_DECOMPOSE_DTBS=1` alone)

Before introducing `fdtfactor` itself, the series starts with a few
preparatory patches: documenting the existing tools in `README.md`,
adding a `DeviceTree` live-tree abstraction in `pylibfdt/libpydt.py`
(with supporting `Property`, `FdtRo`, and `FdtSw` enhancements),
speeding up `libfdt` string-table lookups with `memchr()`, and teaching
`libfdt`'s `fdt_overlay_apply()` to update `/__local_fixups__` on the
base tree so merged trees retain complete and accurate phandle location
metadata (for runtime consumers, composite `.dtb`s built by `fdtoverlay`
that are later fed into `fdtfactor`, and round-trip verification against
`dtc -L`).

I'll freely admit that the patches in this series were pretty heavily
vibe coded. I'll not pretend that I have a deep understanding of the
intricacies of how overlays are implemented. That being said:
* I've spent quite a bit of time reviewing the code from a high-level
  perspective: confirming that functions are well documented, well
  structured, and make sense.
* I believe that what the tool is doing and how the tool is used make
  sense.
* I have had quite a number of internal "the AI reviews the AI" rounds
  to the point of diminishing returns.
At this point, I'm not embarrassed to put my name behind this. While I
won't promise that there are zero cases of the AI doing something really
stupid, I'd be willing to bet that the end result is better (and cleaner
/ better structured) than what I would have coded up if I had spent a
few weeks doing this on my own.

[1] https://lore.kernel.org/all/20251114-elite-refined-yak-bf9e64@kuoka/

v1: https://lore.kernel.org/r/20261015182221.2931742-1-dianders@chromium.org
v2: https://lore.kernel.org/r/20261028215600.1713475-1-dianders@chromium.org
v3: https://lore.kernel.org/r/20261101220224.1436242-1-dianders@chromium.org

Changes in v4:
- New patch adding README.md blurbs for dtc and ancillary tools (David
  Gibson)
- New patch making Property a subclass of bytes instead of bytearray
  (David Gibson)
- New patch trimming the returned Fdt bytearray in FdtSw.as_fdt() so
  DeviceTree.flatten() does not need to call fdt.pack() (David Gibson)
- New patch adding Property.from_*() creation classmethods so
  DeviceTree does not need its own get_*/set_* wrapper methods (David
  Gibson)
- New patch speeding up Property.as_list() with a single struct.unpack()
  call
- New patch speeding up FdtRo.properties() with a C helper
- Start the commit message with the motivation for a live tree and
  condense the summary (Simon Glass)
- Rename devicetree.py to libpydt.py (under pylibfdt/) to avoid
  colliding with PyPI's python-devicetree package, and move its unit
  tests into a separate tests/libpydt_tests.py file (Simon Glass, David
  Gibson)
- Unflatten the tree in a single O(n) pass using fdt.next_node() instead
  of recursive O(d * n) fdt.subnodes() traversal, raising FdtException
  on corrupt/truncated trees, and add a unit test (David Gibson, Simon
  Glass)
- Implement DeviceTree.walk() iteratively with an explicit stack instead
  of recursive yield from, and populate node.props directly in
  unflatten()
- Drop redundant fdt.pack() call from DeviceTree.flatten() (David
  Gibson)
- Drop get_*/set_* typed wrapper methods from DeviceTree in favor of
  Property.as_*() and Property.from_*() plus DeviceTree.set_prop()
  (David Gibson)
- Drop unnecessary copy.deepcopy() and compare unordered node/child sets
  instead of ordered lists in round-trip test (David Gibson)
- New patch speeding up fdt_find_string_len_() with memchr()
- Split out internal helper fdt_add_empty_subnode_() so
  overlay_fragment_local_fixups() avoids passing an in-blob pointer to
  fdt_add_subnode_namelen() or casting fdt_get_name() (Simon Glass)
- Add test cases in tests/overlay.c where the overlay target has no
  existing subnode under /__local_fixups__, with /__local_fixups__ both
  before and after the target in the blob (Simon Glass)
- Pass OVERLAY_LOCAL_FIXUPS to tests/run_tests.sh, adjust
  fdtoverlay_tests for all three modes, and use 4-space indentation
  (Simon Glass, David Gibson)
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
- Use 4-space indentation instead of mixed tabs and spaces in
  tests/run_tests.sh, and update context for -o/--output (David Gibson)
- Replace magic-byte/extension auto-detection and --base-compression
  with a single explicit -C/--compression option controlling both input
  and output compression (David Gibson)
- Drop unnecessary --stats documentation/help changes and use 4-space
  indentation in tests/run_tests.sh (David Gibson)
- Use check_factored_dtb in fdtfactor_tests so tests pass when
  OVERLAY_LOCAL_FIXUPS != 2 (Simon Glass)
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
- Drop patches 1-6 and 8-10 from v3 (applied upstream by David Gibson)
- Add preparatory README.md patch documenting dtc and ancillary tools
  (David Gibson)
- Add pylibfdt preparatory patches making Property a subclass of bytes,
  trimming FdtSw.as_fdt() to totalsize(), adding Property.from_*()
  creation helpers (David Gibson), and speeding up Property.as_list()
  and FdtRo.properties()
- Rename devicetree.py to pylibfdt/libpydt.py and address v3 review
  feedback on DeviceTree (Simon Glass, David Gibson)
- Add preparatory libfdt patch speeding up fdt_find_string_len_() with
  memchr()
- Update cover letter motivation for fdt_overlay_apply()
  /__local_fixups__ handling (Simon Glass)
- Replace compression auto-detection with explicit -C/--compression,
  unify -o/--output across DTB and FIT modes, and group FIT FDTs by
  configurable --min-overlap shared normalized property byte cost
  instead of a hardcoded 50% node-path heuristic (David Gibson)
- Speed up multi-SoC FIT factoring, parallelize blob
  compression/decompression, and add Qualcomm FIT space-savings numbers
  (and non-`-@ -L` sc7180-trogdor baseline) to cover letter
- New patch parallelizing blob compression and decompression across
  worker threads

Changes in v3:
- Move NodeTree out of pylibfdt/libfdt.i into a new devicetree.py module
  and rename it to DeviceTree (David Gibson)
- Store libfdt.Property objects in self.props instead of raw bytes
  (David Gibson)
- Return a packed libfdt.Fdt object from flatten() instead of raw bytes
  and use fdt.set_boot_cpuid_phys() (David Gibson, Simon Glass)
- Raise ValueError in unflatten() on duplicate property or sibling
  subnode names (Simon Glass)
- Move constifying fdto in overlay_apply_node() into a standalone
  preparatory patch (David Gibson)
- Gate `/__local_fixups__` handling behind a 3-state compile-time
  `FDT_OVERLAY_LOCAL_FIXUPS` flag (`0=ignore`, `1=strip`, `2=update`),
  defaulting to `0` (`IGNORE`) in `libfdt_internal.h` for embedded
  builds and `2` (`UPDATE`) in Meson/Make desktop builds (Simon Glass,
  David Gibson)
- Rewrite commit message in the present tense with motivation up front,
  and update `fdt_overlay_apply()` documentation in `libfdt/libfdt.h`
  (Simon Glass)
- Require a strict relative path in `overlay_create_path()` and return
  `-FDT_ERR_BADOVERLAY` on empty path components or trailing `'/'`
  (David Gibson)
- Eliminate the 256-byte `namebuf` limit in
  `overlay_fragment_local_fixups()` by re-reading the node name from the
  shifted ancestor offset after `fdt_add_subnode_namelen()` (David
  Gibson, Simon Glass)
- Return `-FDT_ERR_BADVALUE` instead of `-FDT_ERR_BADSTRUCTURE` in
  `overlay_add_local_fixup_offset()` when an existing
  `/__local_fixups__` property length is not a multiple of 4 (David
  Gibson, Simon Glass)
- Drop redundant `overlay_validate_local_fixups()` pre-pass and inline
  single-use helpers (Simon Glass)
- Update fdtfactor to use devicetree.DeviceTree and a FactoredTree
  subclass initializing self.phandle and self.fixups in __init__()
  (David Gibson, Simon Glass)
- Rename -b/--base-dtb to --output-base-dtb to avoid confusion with an
  input base DTB (David Gibson)
- Move the test rejecting input DTBs lacking /__local_fixups__ from the
  -S patch into this base patch (Simon Glass)
- Include both non--S (932 KB) and -S (634 KB) Trogdor size numbers in
  the commit message to show the savings of -S itself (Simon Glass)
- Pass -S to the negative test verifying that inputs lacking
  /__local_fixups__ are still rejected when -S is used, and move the
  non--S rejection test to the base fdtfactor patch (Simon Glass)
- Update for -b/--base-dtb rename to --output-base-dtb (David Gibson)
- Use "FIT" instead of "FIT image" in documentation, comments, and
  commit messages (Simon Glass)
- Update for DeviceTree and --output-base-dtb (Simon Glass, David
  Gibson)
- Drop "pylibfdt: Fix FdtSw.as_fdt() when buffer is nearly full" and
  "pylibfdt: Add subnode/property iterators and get_mem_rsv_list()"
  (applied upstream by David Gibson)
- Split fixup offset overflow fix, redundant memchr() check cleanup,
  iterator docstring/test follow-up, Property.as_str()/as_stringlist()
  empty-property handling, Fdt.set_boot_cpuid_phys(),
  Property.__copy__()/__deepcopy__(), and overlay_apply_node() const
  fdto into standalone patches (David Gibson, Simon Glass)
- Move NodeTree into a new devicetree.py module as DeviceTree (David
  Gibson)
- Gate fdt_overlay_apply() /__local_fixups__ handling behind a 3-state
  compile-time FDT_OVERLAY_LOCAL_FIXUPS option (Simon Glass, David
  Gibson)

Changes in v2:
- Split live tree representation out of fdtfactor (David Gibson)
- New patch updating base /__local_fixups__ in libfdt
  fdt_overlay_apply() instead of stripping /__local_fixups__ by default
  (David Gibson)
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
- Split -S/--strip-local-fixups into a separate opt-in patch (David
  Gibson)
- Add --base-compression to explicitly control base.dtb compression
  while documenting auto-detection from --base-dtb's filename suffix
  (David Gibson)
- Support legacy LZ4 frames (lz4 -l) and use CRC32 check for XZ outputs
  (Simon Glass)
- Rename -f/--fit and -F/--fit-out to -F/--fit and --outfile and clarify
  FIT mode in the --help description (David Gibson, Simon Glass)
- Reject signed FIT images with signature* subnodes (Simon Glass)
- Use '<base-node-name>.dtb' for FIT base FDT descriptions instead of
  common-prefix heuristics (Simon Glass)
- Compare FIT group node overlap against the group's common node set
  instead of only the first entry (Simon Glass)
- Document in README.md that U-Boot's boot_get_fdt_fit() currently
  requires FIT overlays to be uncompressed (Simon Glass)
- Drop "tests: Fix Python test environment setup in meson.build"
  (applied upstream by David Gibson)
- Clarify source-level (.dts/.dtsi) vs. binary-level (.dtb/.dtbo)
  overlay history in cover letter (David Gibson)
- Add Pixel 10 (Tensor G5) base + overlay comparison numbers to cover
  letter (Simon Glass)

Douglas Anderson (14):
  README: Add overview blurbs for dtc and ancillary tools
  pylibfdt: Make Property a subclass of bytes instead of bytearray
  pylibfdt: Trim Fdt bytearray to totalsize() in FdtSw.as_fdt()
  pylibfdt: Add Property.from_*() creation methods
  pylibfdt: Unpack Property.as_list() in a single struct.unpack() call
  pylibfdt: Speed up FdtRo.properties() with a C helper
  libpydt: Add DeviceTree live tree representation
  libfdt: Speed up fdt_find_string_len_() with memchr()
  libfdt: overlay: Update base /__local_fixups__ on apply
  fdtfactor: Add tool to split DTBs into a base DTB and overlays
  fdtfactor: Add -S/--strip-local-fixups option
  fdtfactor: Support compressed DTB inputs and outputs
  fdtfactor: Add compiled FIT factoring support
  fdtfactor: Parallelize blob compression and decompression

 Makefile                           |    8 +-
 README.md                          |  189 +++
 fdtfactor                          | 1852 ++++++++++++++++++++++++++++
 libfdt/fdt.c                       |   14 +-
 libfdt/fdt_overlay.c               |  525 +++++++-
 libfdt/fdt_rw.c                    |   37 +-
 libfdt/libfdt.h                    |    7 +
 libfdt/libfdt_internal.h           |   23 +
 meson.build                        |    6 +
 meson_options.txt                  |    2 +
 pylibfdt/libfdt.i                  |  141 ++-
 pylibfdt/libpydt.py                |  184 +++
 pylibfdt/meson.build               |    2 +
 tests/Makefile.tests               |   13 +-
 tests/fdtfactor_board1.dts         |   72 ++
 tests/fdtfactor_board2.dts         |   70 ++
 tests/fdtfactor_board3.dts         |   68 +
 tests/fdtfactor_board3_shifted.dts |   68 +
 tests/fdtfactor_lz4.its            |  109 ++
 tests/fdtfactor_other1.dts         |   67 +
 tests/fdtfactor_other2.dts         |   67 +
 tests/fdtfactor_test.its           |  109 ++
 tests/libpydt_tests.py             |  106 ++
 tests/meson.build                  |    5 +-
 tests/overlay.c                    |  154 +++
 tests/pylibfdt_tests.py            |   55 +
 tests/run_tests.sh                 |  446 ++++++-
 tests/testutils.sh                 |    1 +
 28 files changed, 4354 insertions(+), 46 deletions(-)
 create mode 100755 fdtfactor
 create mode 100644 pylibfdt/libpydt.py
 create mode 100644 tests/fdtfactor_board1.dts
 create mode 100644 tests/fdtfactor_board2.dts
 create mode 100644 tests/fdtfactor_board3.dts
 create mode 100644 tests/fdtfactor_board3_shifted.dts
 create mode 100644 tests/fdtfactor_lz4.its
 create mode 100644 tests/fdtfactor_other1.dts
 create mode 100644 tests/fdtfactor_other2.dts
 create mode 100644 tests/fdtfactor_test.its
 create mode 100644 tests/libpydt_tests.py

-- 
2.56.0.679.gc527c65306-goog

