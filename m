Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793224589;
	b=MtwhpsUYJG9VTAU8CD8Aqj5sP/SFQTjiedvyyVRjjVj68KBD34XYCmjNc+dhneK9qxs6
	 biGVPvSCCCtWfUbWEEksOZbibECsMgiZLqj31bOHZIyMy4/yauehpQu2arc1LfbmDIS2j
	 wLs9eUkkwycm4iMI5qSRhHcXsSzz2n9UQxV1z+B+IZrJwUHZF6ySMsy5smmqHPXA3/wJv
	 wx3l8Y8+rIYNS+O1QKhIWBf8pzg9HJLPUBEX4FoQWGW+Ib8SA568COfJ1uv3Bv04KAT0u
	 N/dJ62NPM3FcsF/cDgDov3R+KgfbR+6GkEW9Awk1NExsgWF5ldt8doCWbMlvZe6QDjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793224589;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=7kkNpYHoAXd6IrwvX2fEmvIFuXohpJX1+/fOXYZcgTE=;
	b=fMwnRhhd4feTWdMyZ41hp2VSz/GLyO2DSO5Eb2NmDzfGJnz5yJUm0cAy2f5mdB3OW2be
	 L8B/hruW87GcV/pxqewd9uy56RxJCbAUbOULRs6nm6BuvGiBLL2uSy4olJzdy3mENlRrR
	 T11VY2H4umf39Oa/Abpm29dyTrXQnskbon0m6w8mIdNle1ElvBgdu9/6aiCmcfEy7BoiZ
	 4JlJxT9nlxZlkvUAXWgxqdxZSG6FY+3ZMx83iReY8SCYsEvPtB413X7HZ5hNUhONgivYE
	 ruEOiZ/XhHjoHfw8J3c6DkocJUPVc/rt6/kh3kr90VfRStgZjqgLxnTvE5VRkdKwI2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Dam7nWgr;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222E460A2609
	for <Devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 21:56:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 222E460A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Dam7nWgr
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso2643244eec.0
        for <Devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 14:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793224587; x=1793829387; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7kkNpYHoAXd6IrwvX2fEmvIFuXohpJX1+/fOXYZcgTE=;
        b=Dam7nWgrXb7+KZguosSLcJIwgRURctcRj9WnpX4bkBxB1Ar/mIxd6vrzjvqFMun7F6
         7GHpXOlrzYP6rs3eplIgnny4CLTWS8rRVWLP06F71rdP8syr+EVZ6LJm0luVzagNjbGy
         xmzexiLS9ysGJ1l2/yiVsqqB0CoElpoLWuTcM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793224587; x=1793829387;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7kkNpYHoAXd6IrwvX2fEmvIFuXohpJX1+/fOXYZcgTE=;
        b=QWlRJusCQctM+bPGd0BdSEVchTdBGYKnH0ob8l9OG/UChdNPPaXXY6RbjxEPxf14SU
         y1Awac5OTLgCXK4h5jcQDpTrqdUGHLLiFOHtgWQaw5dTPsQt39jaMzVnGLRL/zyrrQ8a
         zJQkRIqxT4FqNOAwDWmiPxjSx0OhESznxYxrx8nWbMZvXc6pFOhqja+NIhSl4X659FvR
         2BVhwxjngeCzVYE+Rl4Uqvrj7ObCXLkp8vAAO23r6SqZvgYY+CZKE8MklCM3KKOgOBPn
         QL1P3U/pMV2sfHO0Et66gRmlO2xe2+/M8Z/nuqDg5migj3BU++RR4GUMkv5ZAjOVYuxI
         DyPw==
X-Gm-Message-State: AFq9FYLTMpW3ODqtcTAN8LOBS6dXp2ChSoYowgUNZSHZPyZAGJqwx0yi
	ny9F+ON4h2UT+ur1YO+EG/GiVjlV4oLnFA4B0daYw5rh05sdCWRrX28er6ynEnr4Yi5bkWmzpTF
	U7Kn0UYjo
X-Gm-Gg: AYBFou1th2vLhBi68upGO8Mw0Er8AnJUrWkH3GpXey4Bhy6OCh5OMHlyocunMDEzrnw
	li6Eiovoo4LAGziBlRrgEmTBWchnOpSjxtRrlzygerfS/izzCw82Zn2i18vMtZOtw7wMjgtfCdu
	7oe6BDuJvT18N0uOFUq1db3qtNjysKh//G5GR9IIQMfhcwa05YmMTtqKGVT5FK+/ITWnEpMNajJ
	mU+s7drdQnxao2/GWQSwfnq7UIINjFb2XXH31a7XUXY8ls/ORl10Q7m23NxXPVSAZ0EQ6I83M5Y
	ZfrBdRQX66q8qsEntZVBuosuuRsH/MA252qU5MedQtjT8SEtm7aneaRSpzwnYgA5YhrurXPXmUt
	zES5KW3EvrOZzF/WqlELeZ69FalEw7PrcTqWmmXRI3vMXfryVgUcq50E8cIqSHUNcJ6OnlWepyU
	D8seKd0lwXHOj18QB6jMOy5tmJlUmQbeW4nzJhx8SqcNuR5FkxYhoz0ClH4/sxF2pWg89DBWI0W
	6R7reXHxACFM+9jXIf4kP1zDELn+UqTDh7Fh9z2ZDy12Ctdad9chrMv3kHNTL5sXkIuFNFLt78W
	24cJqlRD7v4PSqwGmU0YLP8zdm0A1qnQWl238Gvu+L+XIubHdGelG169PVxBMGD0BTW7XrLZh0+
	ALjbEXxbFmAuM
X-Received: by 2002:a05:7300:8aa0:b0:36a:168a:96c4 with SMTP id 5a478bee46e88-36a1ffc56efmr5102572eec.1.1793224587050;
        Wed, 28 Oct 2026 14:56:27 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:19e7:c87:2527:4e12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2393cc86sm8845224eec.19.2026.10.28.14.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 14:56:26 -0700 (PDT)
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
Subject: [PATCH v2 00/10] fdtfactor: Introduce fdtfactor to auto-factor overlays
Date: Wed, 28 Oct 2026 14:46:49 -0700
Message-ID: <20261028215600.1713475-1-dianders@chromium.org>
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
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
preparatory patches: adding Python iterators and a `NodeTree` live-tree
abstraction to `pylibfdt`, and teaching `libfdt`'s `fdt_overlay_apply()`
to update `/__local_fixups__` on the base tree so overlays can be
applied in multiple stages.

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

Changes in v2:
- New patch fixing FdtSw.as_fdt() buffer resize when < 4 bytes remain
- New patch adding FdtRo.subnodes(), FdtRo.properties(), and
  FdtRo.get_mem_rsv_list()
- Split NodeTree live tree representation out of fdtfactor into
  pylibfdt (David Gibson)
- New patch factoring out overlay_parse_fixup_entry() and
  overlay_split_fragment_path() helpers in libfdt/fdt_overlay.c
- New patch tightening fixup offset parsing and generalizing
  overlay_split_fragment_path() for non-NUL-terminated paths in
  libfdt/fdt_overlay.c
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

Douglas Anderson (10):
  pylibfdt: Fix FdtSw.as_fdt() when buffer is nearly full
  pylibfdt: Add subnode/property iterators and get_mem_rsv_list()
  pylibfdt: Add NodeTree live tree representation
  libfdt: overlay: Factor out fixup and fragment path parsing helpers
  libfdt: overlay: Prepare fixup and fragment path helpers for reuse
  libfdt: overlay: Update base /__local_fixups__ on apply
  fdtfactor: Add tool to split DTBs into a base DTB and overlays
  fdtfactor: Add -S/--strip-local-fixups option
  fdtfactor: Support compressed DTB inputs and outputs
  fdtfactor: Add compiled FIT image factoring support

 Makefile                           |    2 +-
 README.md                          |   74 ++
 fdtfactor                          | 1626 ++++++++++++++++++++++++++++
 libfdt/fdt_overlay.c               |  847 +++++++++++++--
 meson.build                        |    1 +
 pylibfdt/libfdt.i                  |  310 +++++-
 tests/Makefile.tests               |    7 +-
 tests/fdtfactor_board1.dts         |   38 +
 tests/fdtfactor_board2.dts         |   36 +
 tests/fdtfactor_board3.dts         |   34 +
 tests/fdtfactor_board3_shifted.dts |   34 +
 tests/fdtfactor_lz4.its            |  109 ++
 tests/fdtfactor_other1.dts         |   33 +
 tests/fdtfactor_other2.dts         |   33 +
 tests/fdtfactor_test.its           |  109 ++
 tests/meson.build                  |    2 +-
 tests/pylibfdt_tests.py            |   80 ++
 tests/run_tests.sh                 |  337 +++++-
 tests/testutils.sh                 |    1 +
 19 files changed, 3629 insertions(+), 84 deletions(-)
 create mode 100755 fdtfactor
 create mode 100644 tests/fdtfactor_board1.dts
 create mode 100644 tests/fdtfactor_board2.dts
 create mode 100644 tests/fdtfactor_board3.dts
 create mode 100644 tests/fdtfactor_board3_shifted.dts
 create mode 100644 tests/fdtfactor_lz4.its
 create mode 100644 tests/fdtfactor_other1.dts
 create mode 100644 tests/fdtfactor_other2.dts
 create mode 100644 tests/fdtfactor_test.its

-- 
2.56.0.313.g2479322e68-goog

