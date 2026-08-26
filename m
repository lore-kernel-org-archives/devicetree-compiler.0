Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4103B71C3;
	Wed, 26 Aug 2026 08:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787733149; cv=none; b=ateUIOCPjRdWqUYa5mF0h7odCN7qA3cTLGg17o1n2AwyUHsaepA1mjLv2ktt6WIsAfqjIsB0iQLWpFnEx9bXHZRkeTKXPrqXPKxxJ9x1Am4zbBhb4UYBBH3k95W1tp1FTjtJLk+Gu7UnHQnjLHkhIO16CGS23j0rk3TmU+gL7gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787733149; c=relaxed/simple;
	bh=XuEyL2T1VZz8TQ+8TN2gsz+OVuBAabLPOqtCCc25DqM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AAEFlpufl1enUEPAYFmfLanZwbx/+8NZ527waBrvML9Dv0WiMNrEeNIbnhifTMXsvuKJj6RpvIRnWBzyV80NizY8i6xm0A24nPzDdn7XKgAAIam7dvp58RlazhsMeg7T9iAgZkZ1hekIebbIy6DYNS2Dz3rqyfqg0wUI1hT2uLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=fWUvqX7z; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="fWUvqX7z"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1C9E34E413BC;
	Wed, 26 Aug 2026 08:32:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E142A604EC;
	Wed, 26 Aug 2026 08:32:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7B26F11C7AC7A;
	Wed, 26 Aug 2026 10:32:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787733136; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=iHf3NfwJeH5Imme6IQkkY+C70LdYj3DtXtyLsu2TBno=;
	b=fWUvqX7zfMrC6WJNIL57SLFPkPSu04SaIWjW7vMEVBawnqvsZSr9D2VsIG6scGiNHTNVJo
	W5hRZz7OumsNenQeEGKC1q0nW2sVkAyUbGk1eU8mLtaTqtV8/Lk9ZRwduDWhwGoCsSN7BS
	z2xARKH033rr7+d4gI8PdZsRIGp+U+EkEiR5wstvkuptPniNyDru38bcrUS2gNGyGzxN8j
	v/K9SCMXXUWkeYfGVfPHX66lRmng9BC2SuDKxP0fJLrvcYDhO9uAs2xMongKrJn/PYKafd
	rQN5C4HJ63AkuqKuRKEa41sywV3chTHBgRuwSNRFAoUuiuIq1iu0vCNCx7ODFQ==
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
Subject: [PATCH v3 00/15] Add support for structured tags and v18 dtb version
Date: Wed, 26 Aug 2026 10:31:31 +0200
Message-ID: <20260826083146.304291-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
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
version.

First patch is a fix/improvement of fdtget. IMHO, this patch could be
taken even if other patches in the series lead to discussion.

Patches 2 to 4 add support (and update tests) for a possible FDT_NOP tag
at offset 0. Here also, those patches are fixes patches.

Patch 5 is a preparation patch improving the test treegen tool.

Patch 6 introduces the structured tags. The patch gives definitions
needed to handle those tags.

Patches 7, 8 and 9 handles "unknown" tags in fdtdump, dtc and libfdt.
This is the reading part implementation related to "unknown" tags in
tools and lib.

Patch 9 to 13 are preparation commits for patch 14 and patch 14 itself
is handling modifications (writing part) when unknown tags are involved.

The last patch (patch 15) bumps the dtb version including changes that
cannot be moved out of the version bump without having a v18 without all
expected features.

Also, several tests are added as soon as the related feature is
supported. Those tests are part of the last commit adding the feature.

As already said, this current series is a prerequisite to the support
for metadata and addons. The RFC series related to metadata and addons
[1] will be rebased on top of this prerequisite. Please, keep that in
mind for the review of this current prerequisite series.

[1] https://lore.kernel.org/all/20260112142009.1006236-1-herve.codina@bootlin.com/

This v3 iteration is rebased on top of the last upstream code with also
several additional modification mostly related to:
  - feedback received on v2
  - nopulate test improvement (FDT_NODE at offset 0)
  - wip (write in place) modification missed in previous iteration

Best regards,
Hervé

Changes:

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

Herve Codina (15):
  fdtget: Use libfdt iterators instead of open coded loops
  libfdt: Don't assume the root node is available at offset 0
  tests: Don't assume the root node is available at offset 0
  tests/nopulate: Add a FDT_NOP before the root node
  tests: treegen: Introduce emit_fdt_header_vers()
  Introduce structured tag value definition
  fdtdump: Handle unknown tags
  flattree: Handle unknown tags
  libfdt: Handle unknown tags in fdt_next_tag()
  libfdt: Introduce fdt_ptr_offset_()
  libfdt: Introduce fdt_getprop_by_offset_w()
  libfdt: Introduce fdt_getprop_offset_namelen()
  tests: Add wip_func utility
  libfdt: Handle unknown tags on dtb modifications
  Introduce v18 dtb version

 dtc.h                                         |   2 +-
 fdtdump.c                                     |  53 ++++-
 fdtget.c                                      |  73 ++----
 flattree.c                                    | 102 +++++++-
 libfdt/fdt.c                                  | 114 ++++++++-
 libfdt/fdt.h                                  |  28 +++
 libfdt/fdt_ro.c                               |  70 +++++-
 libfdt/fdt_rw.c                               | 161 ++++++++++++-
 libfdt/fdt_sw.c                               |   3 +
 libfdt/fdt_wip.c                              |  28 ++-
 libfdt/libfdt.h                               |  28 ++-
 libfdt/libfdt_internal.h                      |  19 ++
 libfdt/version.lds                            |   1 +
 pylibfdt/libfdt.i                             |  18 ++
 tests/.gitignore                              |   1 +
 tests/Makefile.tests                          |   8 +-
 tests/dtflags_default.dtb.expect              |   1 +
 tests/dtflags_default.dts                     |  10 +
 tests/get_prop_offset_w.c                     |  84 +++++++
 tests/meson.build                             |   5 +
 tests/node_offset_by_compatible.c             |   4 +-
 tests/node_offset_by_prop_value.c             |  11 +-
 tests/nopulate.c                              |   3 +
 tests/path_offset.c                           |  13 +-
 tests/pylibfdt_tests.py                       |  10 +-
 tests/root_node.c                             |   6 +-
 tests/run_tests.sh                            | 152 +++++++++++-
 tests/tests.h                                 |   1 +
 tests/testutils.c                             |  20 +-
 tests/treegen.c                               | 219 +++++++++++++++++-
 tests/unknown_tags_can_skip.dtb.dts.expect    |  19 ++
 tests/unknown_tags_can_skip.dtb.expect        |  29 +++
 ...own_tags_can_skip.fdtput.test.dtb.0.expect |  32 +++
 ...own_tags_can_skip.fdtput.test.dtb.1.expect |  36 +++
 ...own_tags_can_skip.fdtput.test.dtb.2.expect |  34 +++
 ...own_tags_can_skip.fdtput.test.dtb.3.expect |  36 +++
 ...own_tags_can_skip.fdtput.test.dtb.4.expect |  35 +++
 ...own_tags_can_skip.fdtput.test.dtb.5.expect |  33 +++
 ...own_tags_can_skip.fdtput.test.dtb.6.expect |  28 +++
 ...nknown_tags_can_skip.wip.test.dtb.0.expect |  32 +++
 ...nknown_tags_can_skip.wip.test.dtb.1.expect |  36 +++
 ...nknown_tags_can_skip.wip.test.dtb.2.expect |  38 +++
 ...nknown_tags_can_skip.wip.test.dtb.3.expect |  39 ++++
 tests/wip_func.c                              | 127 ++++++++++
 44 files changed, 1688 insertions(+), 114 deletions(-)
 create mode 100644 tests/dtflags_default.dtb.expect
 create mode 100644 tests/dtflags_default.dts
 create mode 100644 tests/get_prop_offset_w.c
 create mode 100644 tests/unknown_tags_can_skip.dtb.dts.expect
 create mode 100644 tests/unknown_tags_can_skip.dtb.expect
 create mode 100644 tests/unknown_tags_can_skip.fdtput.test.dtb.0.expect
 create mode 100644 tests/unknown_tags_can_skip.fdtput.test.dtb.1.expect
 create mode 100644 tests/unknown_tags_can_skip.fdtput.test.dtb.2.expect
 create mode 100644 tests/unknown_tags_can_skip.fdtput.test.dtb.3.expect
 create mode 100644 tests/unknown_tags_can_skip.fdtput.test.dtb.4.expect
 create mode 100644 tests/unknown_tags_can_skip.fdtput.test.dtb.5.expect
 create mode 100644 tests/unknown_tags_can_skip.fdtput.test.dtb.6.expect
 create mode 100644 tests/unknown_tags_can_skip.wip.test.dtb.0.expect
 create mode 100644 tests/unknown_tags_can_skip.wip.test.dtb.1.expect
 create mode 100644 tests/unknown_tags_can_skip.wip.test.dtb.2.expect
 create mode 100644 tests/unknown_tags_can_skip.wip.test.dtb.3.expect
 create mode 100644 tests/wip_func.c

-- 
2.55.0

