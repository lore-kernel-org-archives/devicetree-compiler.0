Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793570600;
	b=zHlK/RIXag0/cv69tmiOLOZG0dFj2UTqxttvOVgEqDrMuq0rCfMYFkDo+qEd2rWztiFS
	 akKW8/9tQInPNWKl8ganaRsDbp2ZJ5+X/Zg0ave834BI4eB4hlNyT/M5OVYHrLFUtcDuU
	 Y1aC9RSbp9rHHzwUd3KUXG5M8WyNpzMfZg4oKMIQq+PXQR5yI3VErrsd0gERTvBPxmXFK
	 83uR9NRSF5IvDfnjRDAzfECDGCFaxuT4+wN3zBQyisIQzkHSBHh5R0kGt6sUOiCsBRTjN
	 Tm34WzvC/DyMMxwgFKnbYFCUB8pmAchztVCFy1pz97z5i5P2XDHseJdxOdTA0MikZUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793570600;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=4hG4fKw7cC0NAeH3NsejqIZl8bPYg06/Pu9wVWraTy8=;
	b=RKSVhyIAOp9foWmv1nw9ZTgAnf8opDjb3d/NIe9+10kzC0hhKCcT1jvygI0ful/f2BPG
	 u/kiqxB0tV1E32pxFjTr02UUA5WhzUDYQtit/CmquNPOU+ZgUdSUREXb46rcna2LvnbHA
	 K5WW/9//Gl33xmaUDUWjSgNt9adAgMX2b7LgOMa6SkmUMe/Dc7f7s31ClsDfWS0CqQlI9
	 ZSh4Y2S1+SWwho/ZeZ/UGBglIKYmScgM1HD2fZkp3rwmpkmk1itLLdh/Zs6IT6AGpv5nu
	 PN2vJQNZY1sULQFBHEW52oNbGDADYVmuLXUr+B5WncehUcUMXxhgtiYSFFzB49SdzKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=a+0TULw1;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427EA606A326
	for <Devicetree-compiler@vger.kernel.org>; Sun,  1 Nov 2026 22:03:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 427EA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=a+0TULw1
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-14394530ec6so2900787c88.1
        for <Devicetree-compiler@vger.kernel.org>; Sun, 01 Nov 2026 14:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793570598; x=1794175398; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4hG4fKw7cC0NAeH3NsejqIZl8bPYg06/Pu9wVWraTy8=;
        b=a+0TULw1nP7U2ouxKQC54XbdJawkaPk6rweilLhaVaN9DhLh1Eel6OvsHQSGfwGBS3
         6uoDJ8jLl4ELSSF/GX35DHv5QlbU4VOKXLNId5WD2tQuv8gGkmeX64yIAy3GARiJB3QQ
         TI/mxceSSBoLkz4M91FWDWbSKURYXzieGnNvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793570598; x=1794175398;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4hG4fKw7cC0NAeH3NsejqIZl8bPYg06/Pu9wVWraTy8=;
        b=kj1wzqp95meLhIYvmtEgHrpaNoMYE+9nqh5ZUfBs+Uay4qNgIYrXC2/XxvJc9RhV6u
         6T0+g1/rJtZZIHk/r56raTHHql6tPrYPUB1TI7lmliTkxKpcxzmuT1DVhC5LeTie6V0v
         7KYpACobvXJSSA3qWDJtTM1fOdIWgSEp4I5rCK7aG6LY/f6gHLYl1eHP6GyfVfGqiWrv
         i5CTeBowb4PkaCtYj64OUmhmY6G/IkTAzrqSd8+t6S78SJwnktAwsoIgI2tV0RNqtg5b
         1rE43DND0DZ+r+5d4JqYLSMbeOxb1m0r8kawcBzB9UWZOiXjt4izGYlYlZji5cuOjcLv
         8Qmw==
X-Gm-Message-State: AFq9FYI0NnyYIiuWgZCeR8qZKtjkCw1Vtq5D0MfJxrcGvHuh9V0VRwjo
	7JA8r+7++3wRbZM10EF3weF8nNlJQ7IjYv1ye26yHCE9CUP7y7+DR6CNWT16b/ru9sOkXBGjzXq
	Aj0yNgoq/
X-Gm-Gg: AYBFou3APkv4NQJn8YTBRnYxkodWIu3zRVUOQyEwqmsyjAWsEmAyiwHUm0tpNrSQYcb
	li+9UHjvWdZ8oU1/63/i83yyDPaTx4eNF/eNuCnx5rzYlYpwRShYFwCCAvqwhtGBoA0yc+3EQJb
	10KZQ44tW3DrW5oza4/xf07axwC6GLChBMrZeuBOUkP439pGiaqx2yOgkJIypkkxgwp1VV9YoCH
	VFu6yn2CWbN/btdRHYXk2hi6OjUhVgqou2y/VYrSQI97W03U63+7ZQaD7Y0ensExOm4mmxFB3Xc
	L7oPqZC+mkAFd828Bh/kYJmV2MBavRuKL3DldxCA+O1ewICYR8ixdG2OWqfk+XpxFFQnX07U4tY
	lQGXA8kJNO+RokLBkfrYjNaGFB65V0M0zoy0ZRavuDENaQoqWGvvOZzKRgFu82DFjf08EM5+v+4
	D10ZFyhpMlJJmzPWNYU+VG4y1ytl6mLHQsAHDWn1AHJKSEuXz8/iDcm7xzmQAirLwJaC6+CE2C1
	Uu6AzpRCNmU8hJx7ztZiHC+kI0NmQsR7ZZlWccpmUukaSEasDLPuwY4RarwPHKnfIZeNjTQvBfa
	6xsnl/eL8beZTWXdrfGD2nO2ANOHVQZ/RKzoE6j5RQ19z+KuBVhlomWDIbJk1wj+8cPnqaFcCDi
	Uqwqc2cC4ccDZWQ==
X-Received: by 2002:a05:7022:3c87:b0:1ad:4ef5:ffed with SMTP id a92af1059eb24-1aea05f4bcfmr6889093c88.38.1793570598083;
        Sun, 01 Nov 2026 14:03:18 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:cbd8:5ca8:653a:11f9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b106edc7f8sm11097266c88.9.2026.11.01.14.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:03:15 -0800 (PST)
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
Subject: [PATCH v3 00/15] fdtfactor: Introduce fdtfactor to auto-factor overlays
Date: Sun,  1 Nov 2026 14:01:07 -0800
Message-ID: <20261101220224.1436242-1-dianders@chromium.org>
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
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

I've used this tool to reduce sc7180-trogdor device tree files (which
are stored lz4 compressed) from 1.71 MB to 213 KB, an 87.5% savings.

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

Before introducing `fdtfactor` itself, the series starts with a few
preparatory patches: adding a `DeviceTree` live-tree abstraction in
`devicetree.py`, and teaching `libfdt`'s `fdt_overlay_apply()` to update
`/__local_fixups__` on the base tree so overlays can be applied in
multiple stages.

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

Changes in v3:
- Split the fixup offset overflow fix and fdt_wip.c bounds check out of
  "libfdt: overlay: Prepare fixup and fragment path helpers for reuse"
  into a standalone bugfix patch with dedicated tests (Simon Glass)
- Add a comment explaining why an initial ASCII digit check is needed
  before strtoul() (David Gibson)
- Split the removal of redundant *sep != ':' checks out of "libfdt:
  overlay: Prepare fixup and fragment path helpers for reuse" into a
  standalone patch
- New follow-up patch for already-applied commit 6b0371afc532
  ("pylibfdt: Add subnode/property iterators and get_mem_rsv_list()")
  clarifying iterator docstrings and testing negative offsets (Simon
  Glass, David Gibson)
- Split Property.as_str() and Property.as_stringlist() empty-property
  handling into a standalone patch and add direct Property unit tests
  (Simon Glass, David Gibson)
- New patch adding Fdt.set_boot_cpuid_phys() to pylibfdt (Simon Glass)
- New patch in v3 to support copying Property instances in DeviceTree
  (Simon Glass)
- Move NodeTree out of pylibfdt/libfdt.i into a new devicetree.py module
  and rename it to DeviceTree (David Gibson)
- Store libfdt.Property objects in self.props instead of raw bytes
  (David Gibson)
- Return a packed libfdt.Fdt object from flatten() instead of raw bytes
  and use fdt.set_boot_cpuid_phys() (David Gibson, Simon Glass)
- Raise ValueError in unflatten() on duplicate property or sibling
  subnode names (Simon Glass)
- Document in overlay_parse_fixup_entry()'s comment that @valuep and
  @lenp are advanced past the consumed entry (David Gibson)
- Return 1 (under __overlay__), 0 (not under __overlay__), or
  -FDT_ERR_BADVALUE from overlay_split_fragment_path() instead of taking
  a bool *is_overlayp out-parameter (David Gibson)
- Move the fixup offset overflow fix into its own standalone patch at
  the start of the series (Simon Glass)
- Move the removal of the redundant *sep != ':' checks into its own
  standalone patch
- Reject paths ending with a trailing slash ("/<frag>/__overlay__/") in
  overlay_split_fragment_path() (David Gibson)
- Split constifying fdto in overlay_apply_node() out of "libfdt:
  overlay: Update base /__local_fixups__ on apply" into a standalone
  patch (David Gibson)
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
- Use "FIT" instead of "FIT image" in documentation, comments, and
  commit messages (Simon Glass)
- Update for DeviceTree and --output-base-dtb (Simon Glass, David
  Gibson)

Changes in v2:
- Split live tree representation out of fdtfactor (David Gibson)
- New patch factoring out overlay_parse_fixup_entry() and
  overlay_split_fragment_path() helpers in libfdt/fdt_overlay.c
- New patch generalizing overlay_split_fragment_path() for
  non-NUL-terminated paths in libfdt/fdt_overlay.c
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
- Drop "tests: Fix Python test environment setup in meson.build"
  (applied upstream by David Gibson)
- Clarify source-level (.dts/.dtsi) vs. binary-level (.dtb/.dtbo)
  overlay history in cover letter (David Gibson)
- Add Pixel 10 (Tensor G5) base + overlay comparison numbers to cover
  letter (Simon Glass)
- Rename -f/--fit and -F/--fit-out to -F/--fit and --outfile and clarify
  FIT mode in the --help description (David Gibson, Simon Glass)
- Reject signed FIT images with signature* subnodes (Simon Glass)
- Use '<base-node-name>.dtb' for FIT base FDT descriptions instead of
  common-prefix heuristics (Simon Glass)
- Compare FIT group node overlap against the group's common node set
  instead of only the first entry (Simon Glass)
- Document in README.md that U-Boot's boot_get_fdt_fit() currently
  requires FIT overlays to be uncompressed (Simon Glass)

Douglas Anderson (15):
  libfdt: overlay: Fix out-of-bounds write on bad fixup offset
  libfdt: overlay: Drop redundant *sep != ':' checks after memchr()
  pylibfdt: Clarify iterator docstrings and test negative offsets
  pylibfdt: Handle empty properties in as_str() and as_stringlist()
  pylibfdt: Add Fdt.set_boot_cpuid_phys()
  pylibfdt: Support copy.copy() and copy.deepcopy() on Property
  devicetree: Add DeviceTree live tree representation
  libfdt: overlay: Factor out fixup and fragment path parsing helpers
  libfdt: overlay: Prepare fragment path helper for reuse
  libfdt: overlay: Make fdto const in overlay_apply_node()
  libfdt: overlay: Update base /__local_fixups__ on apply
  fdtfactor: Add tool to split DTBs into a base DTB and overlays
  fdtfactor: Add -S/--strip-local-fixups option
  fdtfactor: Support compressed DTB inputs and outputs
  fdtfactor: Add compiled FIT factoring support

 Makefile                                   |    8 +-
 README.md                                  |   74 +
 devicetree.py                              |  276 ++++
 fdtfactor                                  | 1659 ++++++++++++++++++++
 libfdt/fdt_overlay.c                       |  778 ++++++++-
 libfdt/fdt_wip.c                           |    7 +-
 libfdt/libfdt.h                            |    7 +
 libfdt/libfdt_internal.h                   |   21 +
 meson.build                                |    7 +
 meson_options.txt                          |    2 +
 pylibfdt/libfdt.i                          |   27 +-
 tests/Makefile.tests                       |    7 +-
 tests/fdtfactor_board1.dts                 |   38 +
 tests/fdtfactor_board2.dts                 |   36 +
 tests/fdtfactor_board3.dts                 |   34 +
 tests/fdtfactor_board3_shifted.dts         |   34 +
 tests/fdtfactor_lz4.its                    |  109 ++
 tests/fdtfactor_other1.dts                 |   33 +
 tests/fdtfactor_other2.dts                 |   33 +
 tests/fdtfactor_test.its                   |  109 ++
 tests/meson.build                          |    4 +-
 tests/overlay.c                            |   80 +
 tests/overlay_bad_fixup_negative_index.dts |    9 +
 tests/overlay_bad_fixup_overflow_index.dts |    9 +
 tests/pylibfdt_tests.py                    |   97 ++
 tests/run_tests.sh                         |  347 +++-
 tests/setprop_inplace.c                    |    8 +
 tests/testutils.sh                         |    1 +
 28 files changed, 3760 insertions(+), 94 deletions(-)
 create mode 100644 devicetree.py
 create mode 100755 fdtfactor
 create mode 100644 tests/fdtfactor_board1.dts
 create mode 100644 tests/fdtfactor_board2.dts
 create mode 100644 tests/fdtfactor_board3.dts
 create mode 100644 tests/fdtfactor_board3_shifted.dts
 create mode 100644 tests/fdtfactor_lz4.its
 create mode 100644 tests/fdtfactor_other1.dts
 create mode 100644 tests/fdtfactor_other2.dts
 create mode 100644 tests/fdtfactor_test.its
 create mode 100644 tests/overlay_bad_fixup_negative_index.dts
 create mode 100644 tests/overlay_bad_fixup_overflow_index.dts

-- 
2.56.0.317.g454f8302e1-goog

