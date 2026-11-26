Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692194;
	b=u3OsDkUNj5XYO1acyLzmFHxGRSYa32GiHVT82o+HtQIF4+nI0KAR/Uo06hDfBfCx27+S
	 Ex0uAODe5I1bpXOsCbHsx8JYB6JDCMXCpVjzabg52eOxT0dbCmaOoJZvqq1lpoXzeDQOp
	 oG8+eSt2KQWNPP1b65vOTsvJEg835yfe1a8LwcpJwhRaX04SPg2pQSFzWophx5cvWJue2
	 lwzGCZeInXnHyIdqLYZyFUkufUD/GJO4Bp0m4xKUosTc/2VF2Qhjcx4tdASMgN9++GGdo
	 tY76xcZBTuM+DArNSsPuVu8GI/t6o4R+o5EeSBbd+tJb/zPw441TY06o4NSK8yqtB3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692194;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=CSfGt0UI6f+jD+8LN21WTtrSPZhagCl1e5UtzrMzHN0=;
	b=xFR+cxYM3nrA2RW3qwH3rCnYFglUEeX+tnic97tNAlAeUZuCLn+nrVupSjbSgBAAZiSs
	 26eS9yW8YI6S9azWVsXSL1XCvx1JlV/VzVNZWsuJkVxOnqUAAqkD8gRSRiODhWuJTpoDL
	 FG1HJt7P/tJmzvY58/74esEF0QyXc70oRMYpg4TxtxqrZzJlCjEW4voNXgF38+Cyt8TzY
	 D3qQmyBKgkMfiNgTwalfrHTfrOrbTBx9C10tY579ErUmsbxmRjl1Hk2EmALH7cDU6Ez2Q
	 VTRN9PzhzU2pvrQJanEeM7+z/cB3olM6pyWGtsD8OnsT1ScvnK3kOdJacSFE1lx7MmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=h+E87Rqm;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E88606A685;
	Thu, 26 Nov 2026 11:23:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4E88606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=h+E87Rqm
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D4058C2B9C7;
	Thu, 26 Nov 2026 11:23:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 73FC060237;
	Thu, 26 Nov 2026 11:23:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7205911E6B361;
	Thu, 26 Nov 2026 12:23:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795692189; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=CSfGt0UI6f+jD+8LN21WTtrSPZhagCl1e5UtzrMzHN0=;
	b=h+E87RqmYCM4qaQbBB1Y/YN326+p+4Ub6EqJj/MYrLkmMYpoznfCsVdpwdV7cToRicw96M
	z72eDyf1fRhCLQ6eHxrkK+arr2sP8FnyKwdD+jyeqD/5w5//v9xP2goEcSa722iVkTbhqh
	2xNU0LbUxEss2qaVqAGzyzxuFLrkFn+nVY6zxEmBRQaFLoCryyW4wB2W4qnFQmR3/P+xfs
	r7VlIjx5drH6iyz/mv3nF+dJ/Gz75SkxmGYAHUCaUUKkCTL/+pUZvNxWhPAiPBl1q+HoZD
	zaMWb9Js/PTEp5n1TrDSl/Q+8DgloIa7syQJLqCnvXv++lUFsmffm1r7QRhZVA==
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Frank Li <Frank.Li@nxp.com>,
	David Lechner <dlechner@baylibre.com>,
	Ayush Singh <ayush@beagleboard.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree-compiler@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree-spec@vger.kernel.org,
	Hui Pu <hui.pu@gehealthcare.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH v4 00/22] Add support for structured tags and v18 dtb version
Date: Thu, 26 Nov 2026 12:22:17 +0100
Message-ID: <20261126112239.636284-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.56.1
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
X-Last-TLS-Session-Version: TLSv1.3

Previously, I sent a RFC series related to support for metadata and
addon device-trees [1].

During the discussion the concept of structured tags and "unknown" tags
emerged as well as the need to have them handled as a prerequisite of
support for metadata and addon.

The conclusion was the need for a new dtb version (v18) with support
for:
  - Structured tags and based on them, "unknown" tags.
    Those structured tags allow to have an standardized definition of
    tags with the capability of skipping a tag and its related data
    when a "unknown" tag is incountered by a given version of libfdt,
    dtc and tools. Those "unknown" tags are tags defined in future
    versions. Even if they exact meaning is unknown for an 'old'
    version, they structure is understood and the 'old' version can skip
    them without any errors if allowed.

  - Flags in the dtb header (dt_flags).
    The goal of this field is to have a placeholder to specify the
    type of dtb we are dealing with. For instance, addons dtb will set a
    flag in this placeholder

  - A last compatible version for writing purpose.
    The goal of the new dtb header field (last_comp_version_w) is to
    disable globally any modification. It works similarly to
    last_comp_version but for modification. It can be used to avoid any
    modification that could be done by an 'old' version and could lead
    to inconsistencies between the modification itself and some
    "unknown" tags.

This current series implements those features and leads to the v18 dtb
version. Worth noting that during the review of the v3 iteration of the
series, the last_comp_version_w dtb header field has been rejected.

Patches 1 to 6 add support (and update tests) for possible FDT_NOP tags
at offset 0. Those patches are fixes patches.

Patch 7 to 11 are preparation patches improving the test treegen tool.

Patch 12 introduces the structured tags. The patch gives definitions
needed to handle those tags.

Patch 13 is a preparation patch needed by patch 14 which itself adds
the generation of all dtbs needed for tests involving "unknown" tags.

Patches 15, 16 and 17 handle "unknown" tags in fdtdump, libfdt and dtc.
This is the reading part implementation related to "unknown" tags in
tools and lib.

Patch 18 to 20 are preparation commits for patch 21 and patch 21 itself
is handling modifications (writing part) when unknown tags are involved.

The last patch (patch 22) bumps the dtb version including changes that
cannot be moved out of the version bump without having a v18 without all
expected features.

Also, several tests are added as soon as the related feature is
supported. Those tests are part of the last commit adding the feature.

As already said, this current series is a prerequisite to the support
for metadata and addons. The RFC v2 series related to metadata and
addons [2] will be rebased on top of this prerequisite. Please, keep
that in mind for the review of this current prerequisite series.

[1] https://lore.kernel.org/all/20260112142009.1006236-1-herve.codina@bootlin.com/
[2] https://lore.kernel.org/all/20260826094950.1088288-1-herve.codina@bootlin.com/

Best regards,
Hervé

Changes:

v3 -> v4

  Rebase on top of the last master branch of the dtc repository.

  Patch 1 in v3 applied upstream

  Patch 1 (patch 2 in v3)
  - Return EBADSTRUCTURE instead of ENOTFOUND in fdt_root_offset()
  - fdt_next_tag(): Remove unneeded variable initialisation
  - Make fdt_check_node_offset_() update its offset parameter

  Patch 2 (new patch in v3)
  - Add a dedicated test for fdt_root_offset()

  Patch 3 (patch 3 in v3)
  - Remove the FDT_BEGIN_NODE check from the root_node test

  Patch 4 (patch 4 in v3)
  - Add 'Reviewed-by: David Gibson'

  Patch 5 (new patch in v4)
  - Add '--noskip-nop' option in dtbs_equal_ordered. This option is
    useful to avoid FDT_NOP tags skipped when dtbs are compared in
    tests looking explicitly at FDT_NOP tags.

  Patch 6 (new patch in v4)
   - Fix dtc to handle all possible FDT_NOP tags. FDT_NOP tags before
     the root node and FDT_NOP tags before the FDT_END tag were not
     handled.
   - Add a dtc test involving FDT_NOP tags. Used a nopulated dtb.
     Indeed, with recent modification done in nopulate, FDT_NOP are
     added everywhere in the dtb from offset 0 and after all tags up
     to FDT_END.

  Patch 7 (patch 5 in v3)
   - Add 'Reviewed-by: David Gibson'

  Patch 8 (new patch in v4)
  - Introduce harnesses in treegen to allow grouping tree generators

  Patch 9 (new patch in v4)
  - Fix missing included header in util.h

  Patch 10 (new patch in v4)
  - Introduce treegen.h an export primitives to generate trees

  Patch 11 (new patch in v4)
  - Move generated base dtbs from treegen.c to a dedicated file
    treegen_base.c (split treegen.c file)

  Patch 12 (patch 6 in v3)
  - Rework "structured" tags definition:
    - Remove SKIP_SAFE bit
    - Introduce 'Reserved' field
    - Resize fields
    - Update comments
  - Add macro to help in handling tags (get DLEN, test if skippable)
  - Remap tests reserved tags to high tag_id value

  Patch 13 (new patch in v4)
  - Add concat() macro in util.h.

  Patch 14 (new patch in v4)
  - Generate expected dtbs used for tests with unknwnow tags

  Patch 15 (patch 7 in v3)
  - Update due to "structured" tags definition rework
  - Remove dtbs generation (treegen modification) and use dtbs generated
    in patch 13.
  - Remove '-u' option and update unknown tags display text
  - Add get_structured_tag_data()

  Patch 16 (patch 9 in v3)
  - Update due to "structured" tags definition rework
  - Return all tags from fdt_next_tag().
  - Add fdt_get_structured_tag_data()
  - Check unknown tags in dtbs_equal_ordered. Also add the '-s' option
    to ignore those tags when dtbs are compared.
  - Update tests using dtbs generated in patch 13.

  Patch 17 (patch 8 in v3)
  - Update due to "structured" tags definition rework
  - Add flat_read_structured_tag_data()
  - Update the test; use -O dtb instead of -O dts and compare the
    output (dtbs_equal_ordered) against unknown_tags_removed.dtb
    generated in patch 13.

  Patch 18 (patch 10 in v3)
  No changes

  Patch 19 (patch 11 in v3)
  - Remove fdt_open_into() from tests/get_prop_offset_w.c
  - Remove get_poffset() and its usage. Replace it by a direct
    fdt_for_each_property_offset() usage.
  - Checked returned pointers values instead of values pointed by those
    pointers.
  - Move the test from tree1_tests_rw() tests to other write-in-place
    tests in tree1_tests().

  Patch 12 in v3 (libfdt: Introduce fdt_getprop_offset_namelen())
  Fully removed in v4

  Patch 20 (patch 13 in v3)
  No changes

  Patch 21 (patch 14 in v3)
  - Rework all the patch.
  - Update due to "structured" tags definition.
  - Implement the new set of rules related to modification when unknown
    tags are involved.
  - Expose internally fdt_get_property_namelen_() and use it to replace
    the usage of the no more existing fdt_getprop_offset_namelen().
  - Introduce fdt_remove_unknown_tags_{at,after}() to handle the logic
    needed to remove unknown tags. Put those function in the neutral
    fdt.c file. Use this common function from both wip and rw
    modification functions.
  - Introduce 'eraser' functions passed to fdt_remove_unknown_tags_*()
    depending on wip or rw modification;
      - fdt_erase_nopify() used in wip modification allow to erase
        unknown tags using FDT_NOP tags.
      - fdt_erase_splice() used in rw modification allow to erase
        unknown tags using splice.
  - Unknown tags can be present right after a sub-node. Those tags
    should not be there but nothing prevent that. When a sub-node is
    deleted those tags must not be attached to any previous items such
    as a property, an other sub-node or the parent node. Fix that
    removing them on sub-node removal.
  - In all tests, remove expected text files. Use dtbs generated in
    patch 13 as expected values and compare modified dtbs against
    expected ones using dtbs_equal_ordered.

  Patch 22 (patch 15 in v3)
  - Generate and use the expected dtb matching dtflags_default.dts. Use
    it to replace the expected text file in tests.
  - Remove the last_comp_version_w header field.

v2 -> v3
  v2: https://lore.kernel.org/devicetree-compiler/20260409115426.352214-1-herve.codina@bootlin.com/

  Rebase on top of the last master branch of the dtc repository.

  Even if Frank Li has sent his 'Reviewed-by' tag on all v2 patches,
  his 'Reviewed-by' tag is not added on patches having substantial
  modification in this v3.

  - Patch 1 (New patch):
    Remove open coded loops in fdtget.

  - Patch 2 (patch 1 and 2 in v2):

   Squash v2 patch 1 and patch 2
    Rename fdt_first_node() to fdt_root_offset()
    Make fdt_root_offset() accessible from users of libfdt library.
    Fix libfdt functions that must take care of root node offset vs
    offset 0 (identified thanks to nopulate update and missed in v2):
       - fdt_get_name(),
       - fdt_first_property_offset(),
       - fdt_supernode_atdepth_offset(),
       - fdt_node_depth(),
       - fdt_add_property_().
    Update commit log
    Add 'Reviewed-by: Frank Li'

  - Patch 3 (new patch):
    Update tests to avoid considering offset 0 as the expected offset
    for the root node.

  - Patch 4 (new patch):
    Improve nopulate to add a FDT_NOP tag at offset 0 (i.e. before the
    root node).

  - Patch 5 (patch 3 in v2)
    Port modification done on tree.S in v2 to the treegen tool

  - Patch 6 (patch 4 in v2)
    Force structured tags to be unsigned. This avoids later
    signed/unsigned mismatch.
    Add 'Reviewed-by: Frank Li'

  - Patch 7 (patch 5 in v2)
    Use treegen tool to generate unknown_tags_can_skip.dtb and
    unknown_tags_no_skip.dtb.
    Slightly modified unknown_tags_can_skip.dtb content.
    Add 'Reviewed-by: Frank Li'

  - Patch 8 (patch 6 in v2)
    Update expected dtbs due to slightly modification in
    unknown_tags_can_skip.dtb
    Add 'Reviewed-by: Frank Li'

  - Patch 9 (patch 7 in v2)
    Rename fdt_is_unknown_tag() to fdt_tag_is_unknown()
    Add 'Reviewed-by: Frank Li'

  - Patch 10 (patch 8 in v2)
    Add 'Reviewed-by: Frank Li'

  - Patch 11 (New patch)
    Introduce fdt_getprop_by_offset_w() and its related test.
    This new function is needed for later fdt_wip modifications.

  - Patch 12 (New patch)
    Introduce fdt_getprop_offset_namelen() and its simple variant
    fdt_getprop_offset(). This new function is needed for later fdt_wip
    modifications

  - Patch 13 (New patch)
    Introduce wip_func, a test utility to call wip (write inplace)
    functions family. This allows to write test with custom scenario
    when unknown tags are involved.

  - Patch 14 (patch 9 in v2)
    Handle modification done using inplace functions (fdt_wip.c). Those
    were missed in previous v2.
    Add a test involving wip functions when unknown tags are present.
    Update expected dtbs due to slightly modification in
    unknown_tags_can_skip.dtb

  - Patch 15 (patch 10 in v2)
    Add a test for the dt_flags default value
    Update header generation in treegen tool and use treegen tool to
    generate last_comp_version_w.dtb
    Add 'Reviewed-by: Frank Li'

v1 -> v2
  v1: https://lore.kernel.org/devicetree-compiler/20260316171640.6fb0d952@bootlin.com/T/#t

  Rebase on top of the last master branch of the dtc repository.
  Remove the RFC tag.

  - Patches 1, 2, 3, 4 and 7 in v1: Removed
    Already applied.

  - Patch 1 (5 in v1)
    Update the commit log.

  - Patch 2 (6 in v1)
    Fix a typo in the commit log.
    Add a comment related to 'offset <= 0' in fdt_next_node().

  - Patch 3 (8 in v1)
    No change

  - Patch 4 (9 in v1)
    Fix typos in commit log.
    Replace DATA_LNG_ENCODING by DATA_LEN_ENCODING in commit log.
    Use SKIP_SAFE instead of CAN_SKIP in commit log.
    Rename FDT_TAG_DATA_LNG to FDT_TAG_DATA_VARLEN in tags definition.
    Rename FDT_TEST_LNG_CAN_SKIP to FDT_TEST_VARLEN_CAN_SKIP.

  - Patch 5 (10 in v1)
    Use FDT_TAG_DATA_VARLEN instead of FDT_TAG_DATA_LNG.
    Use FDT_TEST_VARLEN_CAN_SKIP instead of FDT_TEST_LNG_CAN_SKIP.
    Update values used in the unknown_tags_can_skip dtb test file.
    Use 'len' instead of 'lng'
    Update the '-uu' option help message.
    Update the fdtdump test to be stricter (avoid removing some specific
    comments related to unknown tags in sed command used in the test).

  - Patch 6 (11 in v1)
    Use FDT_TAG_DATA_VARLEN instead of FDT_TAG_DATA_LNG.
    Update the dtc test due to unknown_tags_can_skip dtb changes.
    Add 'Reviewed-by: Luca Ceresoli'

  - Patch 7 (12 in v1)
    Replace fdt_get_next() by fdt_next_tag() in commit title and log.
    Fix a typo in commit log.
    Use FDT_TAG_DATA_VARLEN instead of FDT_TAG_DATA_LNG.
    Update the fdtget test due to unknown_tags_can_skip dtb changes.
    Add 'Reviewed-by: Luca Ceresoli'

  - Patch 8 (13 in v1)
    Fix commit log.
    Add 'Reviewed-by: Luca Ceresoli'

  - Patch 9 (14 in v1)
    Update the fdtput test due to unknown_tags_can_skip dtb and
    fdtdump changes.
    Add a missing ')' in commit log
    Add 'Reviewed-by: Luca Ceresoli'

  - Patch 10 (15 in v1)
    Fix typos and clarify several parts of the commit log.

Herve Codina (22):
  libfdt: Don't assume the root node is available at offset 0
  tests: Add a test for fdt_root_offset()
  tests: Don't assume the root node is available at offset 0
  tests/nopulate: Add an FDT_NOP before the root node
  tests: dtbs_equal_ordered: Add --noskip-nop option
  dtc: Skip possible FDT_NOP before the root node and before FDT_END tag
  tests: treegen: Introduce emit_fdt_header_vers()
  tests: treegen: Introduce tree harness
  util.h: Add missing <stdio.h>
  tests: treegen: Export tree generation primitives
  tests: treegen: Move base harness trees to treegen_base.c
  Introduce structured tag value definition
  util.h: Add concat() macro
  tests: treegen: Generate dtbs with unknown tags
  fdtdump: Handle unknown tags
  libfdt: Handle unknown tags in fdt_next_tag()
  flattree: Handle unknown tags
  libfdt: Introduce fdt_ptr_offset_()
  libfdt: Introduce fdt_getprop_by_offset_w()
  tests: Add wip_func utility
  libfdt: Handle unknown tags on dtb modifications
  Introduce v18 dtb version

 dtc.h                                      |    2 +-
 fdtdump.c                                  |   48 +-
 flattree.c                                 |   93 +-
 libfdt/fdt.c                               |  168 ++-
 libfdt/fdt.h                               |   80 ++
 libfdt/fdt_check.c                         |    6 +-
 libfdt/fdt_ro.c                            |   83 +-
 libfdt/fdt_rw.c                            |  195 +++-
 libfdt/fdt_sw.c                            |    2 +
 libfdt/fdt_wip.c                           |  115 +-
 libfdt/libfdt.h                            |   25 +-
 libfdt/libfdt_internal.h                   |   26 +-
 libfdt/version.lds                         |    1 +
 pylibfdt/libfdt.i                          |    9 +
 tests/.gitignore                           |    3 +
 tests/Makefile.tests                       |  247 ++++-
 tests/dtbs_equal_ordered.c                 |   84 +-
 tests/dtflags_default.dts                  |   10 +
 tests/get_prop_offset_w.c                  |   78 ++
 tests/meson.build                          |  241 ++++-
 tests/node_offset_by_compatible.c          |    4 +-
 tests/node_offset_by_prop_value.c          |   11 +-
 tests/nopulate.c                           |    3 +
 tests/path_offset.c                        |   13 +-
 tests/pylibfdt_tests.py                    |    9 +-
 tests/root_node.c                          |    9 +-
 tests/root_offset.c                        |   45 +
 tests/run_tests.sh                         |  179 ++-
 tests/testutils.c                          |    2 +-
 tests/treegen.c                            |  617 ++---------
 tests/treegen.h                            |   83 ++
 tests/treegen_base.c                       |  590 ++++++++++
 tests/treegen_unknown_tags.c               | 1142 ++++++++++++++++++++
 tests/unknown_tags_can_skip.fdtdump.expect |  228 ++++
 tests/wip_func.c                           |  127 +++
 util.h                                     |    4 +
 36 files changed, 3925 insertions(+), 657 deletions(-)
 create mode 100644 tests/dtflags_default.dts
 create mode 100644 tests/get_prop_offset_w.c
 create mode 100644 tests/root_offset.c
 create mode 100644 tests/treegen.h
 create mode 100644 tests/treegen_base.c
 create mode 100644 tests/treegen_unknown_tags.c
 create mode 100644 tests/unknown_tags_can_skip.fdtdump.expect
 create mode 100644 tests/wip_func.c

-- 
2.56.1

