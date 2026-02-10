Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25AE93128A3;
	Tue, 10 Feb 2026 17:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770744850; cv=none; b=i0LcJohziDpRsNJPTq3ERBd1g2Hwy5hEq8HdxV4XvwPuAcPjRamXYjobA2Cnq0vIWiy0q2zq+vjK1F8nZJH2x9wRFoQiT6uAgLIdumeOwi30yBzp1rkb9NguclP0f0mIoTfjOLgVGn3oI0HLT5eXVyA24A4e9QJB9w90g3A3TNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770744850; c=relaxed/simple;
	bh=cMtI4aQfy3KuwPyZ7gc9eBfDXEqqoqA8OkfDQpavX04=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RQiVxT2dRBaA4nUQQ9+kYXekPZWc4bq3h6SY+RL72XeArDUJ5NCAn9f4v5ezhiDWFgtryInPbYrHwNO9dew164ut09bDxgbbGi+CVMmFbbd6CcodgzA/LDbe/QJXLMkolf5NokWXOx94xEe5Ao2JGA7twHXL2Jk27DBM4nrpUD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=K68UfT6x; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="K68UfT6x"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 73FB31A0D81;
	Tue, 10 Feb 2026 17:34:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 34514606BD;
	Tue, 10 Feb 2026 17:34:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 64A6610B91B35;
	Tue, 10 Feb 2026 18:34:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770744845; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=+3AbG+UdYN5oHgBrTellu1tg3kJXUw2Rb6xyFWvuLzk=;
	b=K68UfT6xL+NjXHUms9XeBhr0sNOzPItXZw5CLsQKmT1K3Nax7BCQGVc0BsTGIKGZIzYxOJ
	nnQ/u9yp8XExnI7JDz8qtpDmF/GGz5HboSXh9YmgHsptfgrBO8qbV42pExMztxvkp92FP+
	VJeaGdA8N2W4Loui8dzxj6HzlUw+ezTkq6wJilMjIrw6kzR8zi8cMk1cdpBiSF5JxFcDmu
	z9cRPJgkQbiNP5oil80gEFfmR4bvwYhB45DoGsjp+9gHdoKhl6e1Rk2/4MlqRSyNbpQTED
	4WAGjIVuZAGlOZiDS5nm2lxj9fyLT1Rw7bFv/f4zYUGnICQ21OqobjLRsaIG2w==
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Ayush Singh <ayush@beagleboard.org>,
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
Subject: [RFC PATCH 00/15] Add support for structured tags and v18 dtb version
Date: Tue, 10 Feb 2026 18:33:28 +0100
Message-ID: <20260210173349.636766-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Recently, I sent a RFC series related to support for metadata and addon
device-trees [1].

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

This RFC series implements those features and leads to the v18 dtb
version.

First patches (patches from 1 to 8) are patches fixing issues or
preparation patches. IMHO, those patches could be taken even if other
patches in the series lead to discussions.

Patch 9 introduces the structured tags. The patch gives definitions
needed to handle those tags.

Patches 10, 11 and 12 handles "unknown" tags in fdtdump, dtc and libfdt.
This is the reading part implementation related to "unknown" tags in
tools and lib.

Patch 13 is a preparation commit for patch 14 and patch 14 itself is
handling modifications (writing part) when unknown tags are involved.

The last patch (patch 15) bumps the dtb version including changes that
cannot be moved out of the version bump without having a v18 without all
expected features.

Also, several tests are added as soon as the related feature is
supported. Those tests are part of the last commit adding the feature.

As already said, this current RFC series is a prerequisite to the
support for metadata and addons. The RFC series related to metadata and
addons [1] will be rebased on top of this prerequisite. Please, keep
that in mind for the review of this current RFC prerequisite series.

[1] https://lore.kernel.org/all/20260112142009.1006236-1-herve.codina@bootlin.com/

Best regards,
Hervé

Herve Codina (15):
  dtc: Use a consistent type for basenamelen
  fdtdump: Remove dtb version check
  fdtdump: Return an error code on wrong tag value
  libfdt: fdt_rw: Introduce fdt_downgrade_version()
  libfdt: Introduce fdt_first_node()
  libfdt: Don't assume that a FDT_BEGIN_NODE tag is available at offset
    0
  libfdt: fdt_check_full: Handle FDT_NOP when FDT_END is expected
  tests: asm: Introduce treehdr_vers macro
  Introduce structured tag value definition
  fdtdump: Handle unknown tags
  flattree: Handle unknown tags
  libfdt: Handle unknown tags in fdt_get_next()
  libfdt: Introduce fdt_ptr_offset_
  libfdt: Handle unknown tags on dtb modifications
  Introduce v18 dtb version

 checks.c                                      |   2 +-
 dtc.h                                         |   4 +-
 fdtdump.c                                     |  57 ++++++-
 flattree.c                                    | 102 ++++++++++--
 libfdt/fdt.c                                  | 110 ++++++++++++-
 libfdt/fdt.h                                  |  28 ++++
 libfdt/fdt_check.c                            |   2 +-
 libfdt/fdt_ro.c                               |  16 +-
 libfdt/fdt_rw.c                               | 151 +++++++++++++++++-
 libfdt/fdt_sw.c                               |   3 +
 libfdt/libfdt.h                               |   7 +-
 libfdt/libfdt_internal.h                      |   9 ++
 pylibfdt/libfdt.i                             |  18 +++
 tests/dumptrees.c                             |   5 +-
 tests/pylibfdt_tests.py                       |  10 +-
 tests/run_tests.sh                            | 115 ++++++++++++-
 tests/testdata.h                              |   3 +
 tests/testutils.c                             |   2 +-
 tests/trees.S                                 | 143 ++++++++++++++++-
 tests/unknown_tags_can_skip.dtb.dts.expect    |  19 +++
 tests/unknown_tags_can_skip.dtb.expect        |  26 +++
 ...own_tags_can_skip.fdtput.test.dtb.0.expect |  32 ++++
 ...own_tags_can_skip.fdtput.test.dtb.1.expect |  36 +++++
 ...own_tags_can_skip.fdtput.test.dtb.2.expect |  34 ++++
 ...own_tags_can_skip.fdtput.test.dtb.3.expect |  36 +++++
 ...own_tags_can_skip.fdtput.test.dtb.4.expect |  35 ++++
 ...own_tags_can_skip.fdtput.test.dtb.5.expect |  33 ++++
 ...own_tags_can_skip.fdtput.test.dtb.6.expect |  28 ++++
 28 files changed, 1017 insertions(+), 49 deletions(-)
 create mode 100644 tests/unknown_tags_can_skip.dtb.dts.expect
 create mode 100644 tests/unknown_tags_can_skip.dtb.expect
 create mode 100644 tests/unknown_tags_can_skip.fdtput.test.dtb.0.expect
 create mode 100644 tests/unknown_tags_can_skip.fdtput.test.dtb.1.expect
 create mode 100644 tests/unknown_tags_can_skip.fdtput.test.dtb.2.expect
 create mode 100644 tests/unknown_tags_can_skip.fdtput.test.dtb.3.expect
 create mode 100644 tests/unknown_tags_can_skip.fdtput.test.dtb.4.expect
 create mode 100644 tests/unknown_tags_can_skip.fdtput.test.dtb.5.expect
 create mode 100644 tests/unknown_tags_can_skip.fdtput.test.dtb.6.expect

-- 
2.52.0

