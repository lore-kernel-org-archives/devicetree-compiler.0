Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E803C062C;
	Thu,  9 Apr 2026 11:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775735694; cv=none; b=FLnl1cgahXr5LqROlDvvHaxz9OoTxnHEo5wR9zBHSc9aXuEFyvjOhniPe1HLmMILkIHizsjj473UgVbmacoiWXblUijmrzN0tn565/v8tAukY1H9vQv+Wl97pJhGnyhbOnN0MpO04kz38e3Hx2uypLePOLiNAwx3FndZvgzdx7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775735694; c=relaxed/simple;
	bh=icJ5hYPxm3OSEwtOydhyX0ZgDCzkJ3H+LcOT/RU8qL4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Bs03t3NbmlDzX3oIyyAdPctv5WE1D9Utswp6wrrMS8Wr9I7TBcD9t8mAycARYyK0jHhbUJg05WvYZrwz4R0KVKiStqq6EBhwfUDjuv+UqmD6UNv7aEZq43QPxwa7p97sVJzsd78Is19Hg0zr6AHiJaEgTqIFBKj3kB43c0cCpKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NaJliRPh; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NaJliRPh"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A5C1D4E42985;
	Thu,  9 Apr 2026 11:54:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6136A5FDEB;
	Thu,  9 Apr 2026 11:54:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8C405104500AD;
	Thu,  9 Apr 2026 13:54:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775735688; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=TZdW4otxJYI0nkQgTZ7aWbgYfy65cI4LCFIrhlGeIyA=;
	b=NaJliRPh47fNqPGp/1tYigj4i7Po0t/2dx1kpuSDa3K8pHhAaHwdZfwzObUvoDG8gM1NGv
	N30oBt5dmmbKdhgclxvr6g2c5MOc5PcKBjFpUdIR0k6r6zm+TQwPr/TVogaIipWTM5U/MP
	V7dGK7gPopc903x3DQnuyjD+PLsc11SUVuTd+N4wLw34o148DZJGNNni1Tu4jX4rfQgFbp
	aBzWRLkw5Wzs4MbYT9JxUs2pC0r6ljoay2r/XprGOntFjbO7lON0pZEmyZ9K9FNjXXv/FA
	a/AxlpJRYyBnpd1Upbd78GNjZuyqbjkYZHlmg9i+vbfkYz0RVms4QUlyozzSBw==
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
Subject: [PATCH v2 00/10] Add support for structured tags and v18 dtb version
Date: Thu,  9 Apr 2026 13:54:16 +0200
Message-ID: <20260409115426.352214-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.53.0
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

This current series implements those features and leads to the v18 dtb
version.

First patches (patches from 1 to 3) are patches fixing issues or
preparation patches. IMHO, those patches could be taken even if other
patches in the series lead to discussions.

Patch 4 introduces the structured tags. The patch gives definitions
needed to handle those tags.

Patches 5, 6 and 7 handles "unknown" tags in fdtdump, dtc and libfdt.
This is the reading part implementation related to "unknown" tags in
tools and lib.

Patch 8 is a preparation commit for patch 9 and patch 9 itself is
handling modifications (writing part) when unknown tags are involved.

The last patch (patch 10) bumps the dtb version including changes that
cannot be moved out of the version bump without having a v18 without all
expected features.

Also, several tests are added as soon as the related feature is
supported. Those tests are part of the last commit adding the feature.

As already said, this current series is a prerequisite to the support
for metadata and addons. The RFC series related to metadata and addons
[1] will be rebased on top of this prerequisite. Please, keep that in
mind for the review of this current prerequisite series.

[1] https://lore.kernel.org/all/20260112142009.1006236-1-herve.codina@bootlin.com/

This v2 iteration is the continuation of the first (RFC) iteration. It
mainly removes patches already applied and takes into account feedback
received from Luca during the first iteration.

Best regards,
Hervé

Changes:

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

Herve Codina (10):
  libfdt: Introduce fdt_first_node()
  libfdt: Don't assume that a FDT_BEGIN_NODE tag is available at offset
    0
  tests: asm: Introduce treehdr_vers macro
  Introduce structured tag value definition
  fdtdump: Handle unknown tags
  flattree: Handle unknown tags
  libfdt: Handle unknown tags in fdt_next_tag()
  libfdt: Introduce fdt_ptr_offset_
  libfdt: Handle unknown tags on dtb modifications
  Introduce v18 dtb version

 dtc.h                                         |   2 +-
 fdtdump.c                                     |  53 ++++++-
 flattree.c                                    | 102 ++++++++++--
 libfdt/fdt.c                                  | 114 +++++++++++++-
 libfdt/fdt.h                                  |  28 ++++
 libfdt/fdt_ro.c                               |  16 +-
 libfdt/fdt_rw.c                               | 144 ++++++++++++++++-
 libfdt/fdt_sw.c                               |   3 +
 libfdt/libfdt.h                               |   7 +-
 libfdt/libfdt_internal.h                      |   9 ++
 pylibfdt/libfdt.i                             |  18 +++
 tests/dumptrees.c                             |   5 +-
 tests/pylibfdt_tests.py                       |  10 +-
 tests/run_tests.sh                            | 115 +++++++++++++-
 tests/testdata.h                              |   3 +
 tests/testutils.c                             |   2 +-
 tests/trees.S                                 | 149 +++++++++++++++++-
 tests/unknown_tags_can_skip.dtb.dts.expect    |  19 +++
 tests/unknown_tags_can_skip.dtb.expect        |  29 ++++
 ...own_tags_can_skip.fdtput.test.dtb.0.expect |  32 ++++
 ...own_tags_can_skip.fdtput.test.dtb.1.expect |  36 +++++
 ...own_tags_can_skip.fdtput.test.dtb.2.expect |  34 ++++
 ...own_tags_can_skip.fdtput.test.dtb.3.expect |  36 +++++
 ...own_tags_can_skip.fdtput.test.dtb.4.expect |  35 ++++
 ...own_tags_can_skip.fdtput.test.dtb.5.expect |  33 ++++
 ...own_tags_can_skip.fdtput.test.dtb.6.expect |  28 ++++
 26 files changed, 1020 insertions(+), 42 deletions(-)
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
2.53.0

