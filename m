Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89900246783;
	Mon, 12 Jan 2026 14:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227628; cv=none; b=XyOEmd4YGgfLtplnuz8qQ7nucVDsKn+l5O9kKBJXEg811esSLEUzUYAtLRfxA6Grq4W2+R6frblWfsjKujIRzl4SlJHaPyN13PpxmIgbT+bvTnOOwcxClJdJQaA4IHNfeFKhx8kHk7i1yH+6q/NDKWaRe6LHcY0olcnx4onyJdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227628; c=relaxed/simple;
	bh=bNAvoAnicq54h7ZP6SYmGIshibzjmEz0lwTwlmVIQH0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YK0UIl9PNlPGzKvL1682nh4EYI3Vbq+MlgdO5w2q016sU2WE2WWf4BRgZ4LybdEsd4UWd5eVhg+/a5pUYxGgT2BID2FZ1HpXdpcbUXbsQs5/2HixmPBrPF52hr/Ff0XzHbcilYR/r38bYsp4Q0HLTGttD2nxjTMokyY3nBCDSck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=trMNtghB; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="trMNtghB"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DE4231A26D2;
	Mon, 12 Jan 2026 14:20:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A98D4606FA;
	Mon, 12 Jan 2026 14:20:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0F76F103C8C61;
	Mon, 12 Jan 2026 15:20:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227621; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=SFRDYSOBlKtA2Et4/rhwkwH+S1ibZL4DFVwoDVTCUy0=;
	b=trMNtghBfD8J38CvgsbYngisWBBxZiqdtGXXPj9v5WuGGSFreUdciol0LN6Dysnb8F+U9D
	ZSHPjAGl3iDm0I1sGqYrTXzPu6sMQvPE4iUbmiAbSQzeVTfDGHwtoBDyjh2fIbXq7zmBcO
	fr1oYjP3d33xBx6EcrRC+CFZ8p1cd8JLxgFgoKqW9FHyBUZ1YKKaZ/jrjAZC9pambgDJrQ
	RmKQ2CCHCwEfs0IEKjFX2+F92237zeL9bQS36nqeAq2+DWS/lXlOaeTeoa1YCzq0mvQlKp
	D4WFk55TcMECSV3q8fzUVtDmTcX6n8vYBS1Ja9CcJqkkJMgq4Pa+/pewajYEgg==
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
Subject: [RFC PATCH 00/77] Add support for dtb metadata and addon device-trees
Date: Mon, 12 Jan 2026 15:18:50 +0100
Message-ID: <20260112142009.1006236-1-herve.codina@bootlin.com>
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

This big picture series adds support for dtb metadata and addon
device-trees.

Before giving details about the series content, let me give a little bit
of context.

The use-case is to support additional boards that can be hot-plugged to
a connector available in a base board. This connector is standardized in
terms of resources available on each pin. Any additional boards
compatible with the connector should be able to be connected to base
board and all base boards where this connector is implemented should
support any additional boards.

TLDR: The last patch, patch 77, gives an example of dts and dtsa (new
      addon device-tree) handling this use-case. It provides an example
      of a realistic base board description (dts) and an realistic
      additional board description (dtsa).

Each base board is described by its own device-tree and the real
resource connected to the connector depends on each board. For instance
an i2c bus on the connector can come from the i2c1 controller from base
board A and i2c5 controller from base board B. This is obviously the
case for all resources wired to the connector.

On the other hand, the device-tree describing the additional board has
no reason to be changed based on the base board the additional board is
going to be connected. Indeed this device-tree describes the additional
board hardware and this hardware doesn't change if the additional board
is connected to the base board A or the base board B.

In order to extend a device-tree at runtime, a device-tree overlay can
be used. The drawback of current overlay implementation is that an
overlay is tightly coupled with the base device-tree it is applied to.

If a symbol of the base device-tree has to be used by the overlay, all
symbols available in the base device-tree need to be visible by the
overlay and the overlay can use only those symbol without any kind of
name translation.

With current overlay implementation, a overlay depends on the base
board. Indeed, if an overlay wants to add an I2C device on the I2C bus
available on the base board A connector, it needs to reference the i2c1
bus whereas it needs to reference the i2c5 bus if it used with the base
board B.

In order to fix the issue, the 'export symbol' concept has been
proposed. This concept allows some specific node to 'export' symbols in
order to be seen by an overlay applied to this node.

The use-case and the export symbol proposal have been detailed during
a talk at ELCE 2025. Have a look at the slides [1] and/or the video [2]
to have a clear view of the topic

[1] https://bootlin.com/pub/conferences/2025/elce/ceresoli-hotplug-status.pdf
[2] https://www.youtube.com/watch?v=C8dEQ4OzMnc

The export symbol proposal based on an export-symbol node in the
device-tree have been rejected by device-tree and dtc maintainers.

A discussion about the topic has been started on the mailing-list [3].
This discussions led to:

- The addition of meta-data in dtb instead of having __fixup__, __local__fixup__,
  an similar nodes in the device-tree used by overlays

- A new kind of device-tree, an addon device-tree, in order to replace the
  usage of the overlay device-tree in this 'hot-plugging additional board'
  use-case.

[3] https://lore.kernel.org/all/20250902105710.00512c6d@booty/

This current RFC is the implementation of features discussed on the
mailing-list. A lot of things are new in dtb format (new tags) and dts
format (new keyword, new kind of references) and not yet mentioned in
the standard.

The purpose of this big picture RFC is to move forward on this topic
based on code and some concrete dts / dtb example. Indeed, this RFC also
adds tests for each feature introduced. Those tests are performed using
dts files and the content of those dts files can also help in the
discussion.

The first patch is just a simple fix and can probably be merged out of this
meta-data and addon discussion.

  - Patches 2..12: Introduce new meta-data dtb tags based on markers

    Those new tags are FDT_REF_LOCAL and FDT_REF_PHANDLE.

    FDT_REF_LOCAL (details in patch 6) is used to tag property using a
    phandle and this phandle points to a local node (i.e. a node
    existing in the dtb).

    FDT_REF_PHANDLE (details in patch 11) is used to tag a property
    using a phandle but this phandle points to a non local node (i.e.
    the node doesn't exist in the dtb). The reference to the node is
    present with the tag and the phandle value has to be fixed when the
    dtb is applied. This tag can only be present in plugins (overlays)
    and addons dtb.

  - Patches 13..17: Introduce addons device-tree

    This part introduce the new /addon/ dts keyword

  - Patches 18..30: Introduce /export/ keyword and related dtb tags

    This part introduces the new /export/ dts keyword (details in patch
    20) and the related FDT_EXPORT_SYM and FDT_EXPORT_SYM_REF dtb tags.

    FDT_EXPORT_SYM (details in patch 25) is used when the exported
    symbol involved is a local node and FDT_EXPORT_SYM_REF (details in
    patch 29) is used when the node involved is a non local node.

  - Patches 31..38: Introduce /import/ keyword and related dtb tags

    This part introduces the new /import/ dts keyword (details in patch
    33) and the related FDT_IMPORT_SYM dtb tag (details in patch 35).

  - Patches 39..63: Introduce orphan nodes

    Even if the orphan nodes concept was already present in overlays,
    the final encoding of those nodes in addon dtbs is different
    compared to overlays dtbs.

    In overlays, orphan nodes are transformed to a /fragment@n/__overlay__
    node. This is not the way used in addons.

    Indeed, in addons, orphan nodes are not transformed to fit in
    something like /fragment@n/__overlay__. They are encoded in the dtb
    using a specific tag.

    This part, after some preparation, introduces orphan nodes (details
    in patch 48) and the related FDT_BEGIN_NODE_REF_SYM dtb tag (details
    in patch 56).

    It also adds support for addons dts/dtb without a 'root' (details in
    patch 58).

    This part ended with the support for merging orphan node described
    in dts when relevant (details patch 60).

  - Patches 64..65: Reference orphan nodes and its sub-nodes by path

    A new syntax is needed to be able to reference a an orphan node and
    its sub-nodes by path.

    This new syntax is '${$<orphan_name>/<path>}' (details in patch #60)

  - Patches 66..67: Namespace labels references

    Add Namespace labels references with the new syntax '&foo.bar.baz'.

    This new syntax, only allowed in addons, allows to 'jump' from node
    to node based on exported symbols defined at each node (details in
    patch 66).

  - Patches 68..71: Support for applying an addon

    First, add fdt_addon_apply() in libfdt (details in patch 70) and
    then the fdtaddon command line tool (details in patch 71).

  - Patches 72..76: fdtaddon test

    Several tests related to addon application

  - Patch 77: A more Realistic test

    A last test based on use-case we want to handle.

    This last patch (and its dts and dtsa files) shows the kind of usage
    is expected for addons.

    Also it proves that metadata and addons features handles our
    use-case.

I know this series is a huge series but I would like to give the big
picture in this RFC (I hope this was a good idea). Of course, this
series can be split for the upstreaming step and handled by parts by
parts. Let me know.

Tests are provided for each feature. In addition to be used for testing,
tests input source files and expected output files can be used to see
the expected behavior related to each feature.

I hope also that this first RFC will help in moving forward regarding
this 'handling an additional board described by a device-tree' topic.

Best regards,
Hervé

Herve Codina (77):
  checks: Use consistent type for strspn() returned value
  Introduce v18 dtb version
  libfdt: Introduce fdt_next_tag_full() and use it in fdt_next_tag()
  dtc: Allow to use data_append_markers() out of data.c
  fdtdump: Change FDT_PROP prob handling to ease future addition
  Add support for FDT_REF_LOCAL dtb tag
  livetree: Improve get_node_by_phandle()
  dtc: Introduce update_phandles_ref()
  dtc: Introduce mark_local_phandles()
  tests: Add basic metadata tests
  Add support for FDT_REF_PHANDLE dtb tag
  tests: metadata: Add external phandle reference tests
  Introduce dt_flags field in dtb header
  tests: metadata: Add a first test related to the dt_flags header field
  Add support for /addon/ keyword
  tests: metadata: Add a test related to addon dt_flags header value
  tests: metadata: Add a basic addon test
  dtc-parser.y: Avoid an empty proplist
  dtc: Introduce export symbols
  dtc: Add support for /export/ dts keyword parsing
  checks: Handle export symbols in fixup_phandle_references()
  dtc: Add export symbols (/export/ keyword) in generated dts file
  dtc: Introduce mark_local_exports()
  dtc: Introduce update_exports_ref()
  Add support for FDT_EXPORT_SYM dtb tag
  tests: metadata: Add export symbols with local references tests
  dtc: Add support for export symbols sorting
  tests: metadata: Add a test for export symbols sorting
  Add support for FDT_EXPORT_SYM_REF dtb tag
  tests: metadata: Add export symbols with external references tests
  dtc: Introduce import symbols
  dtc-parser: Introduce last_header_flags
  dtc: Add support for /import/ dts keyword parsing
  dtc: Add import symbols (/import/ keyword) in generated dts file
  Add support for FDT_IMPORT_SYM dtb tag
  tests: metadata: Add import symbols tests
  dtc: Add support for import symbols sorting
  tests: metadata: Improve sort test to check for import symbols sorting
  check: Get 'chosen' node using get_subnode()
  dtc: Introduce dti_get_node_by_path()
  dtc: Introduce dti_get_node_by_label()
  dtc: Introduce dti_get_node_by_phandle()
  dtc: Introduce dti_get_node_by_ref()
  dtc: Introduce dti_get_node_phandle()
  dtc: Introduce dti_get_property_by_label()
  dtc: Introduce dti_get_marker_label()
  dtc: Introduce dti_fill_fullpaths()
  dtc: Introduce orphan nodes
  dtc: Handle orphan nodes in dti_get_xxx_by_yyy()
  dtc: Handle orphan nodes in mark_local_xxx() and update_xxx_ref()
  dtc: Avoid NULL fullpath for nodes in orphan trees
  checks: Perform checks for orphan nodes
  dtc: Rename add_orphan_node() to plugin_add_orphan_node()
  dtc: Add basic support for addon orphan nodes dts parsing
  dtc: Add orphan nodes in generated dts file
  Add support for FDT_BEGIN_NODE_REF_SYM dtb tag
  tests: metadata: Add basic test for addon orphan nodes
  dtc: Add support for missing root node in addon device-tree
  tests: metadata: Add a test for addon without root node
  dtc: Allow parser_get_node_by_ref() to return an orphan node for
    merging purpose
  tests: metadata: Add a test related to orphan node merging
  dtc: Add support for orphan nodes sorting
  tests: metadata: Improve sort test to check for orphan nodes sorting
  dtc: Add support for references by path involving orphan nodes
  tests: metadata: Add a test for references by path involving orphan
    nodes
  dtc: Add support for namespace labels references
  tests: metadata: Add a test for namespace labels references
  libfdt: Introduce fdt_getprop_by_offset_w()
  libfdt: Introduce fdt_getprop_offset()
  libfdt: Add support for applying an addon on a base device-tree blob
  Add fdtaddon tool to apply an addon
  tests: Add a first basic test for fdtaddon
  tests: fdtaddon: Add a basic test for addons using an orphan nodes
  tests: fdtaddon: Add a basic test for addons with unresolved phandle
    references
  tests: fdtaddon: Add a test for addons using namespace label
    references
  tests: fdtaddon: Add a test for using 'stacked' addons
  tests: fdtaddon: Add a test using more realistic dts and dtsa

 Makefile                                      |    5 +
 checks.c                                      |  135 +-
 data.c                                        |    3 +-
 dtc-lexer.l                                   |   37 +
 dtc-parser.y                                  |  307 +++-
 dtc.c                                         |   64 +-
 dtc.h                                         |   72 +-
 fdtaddon.c                                    |  197 ++
 fdtdump.c                                     |  114 +-
 flattree.c                                    |  396 +++-
 fstree.c                                      |    5 +-
 libfdt/Makefile.libfdt                        |    2 +-
 libfdt/fdt.c                                  |  152 +-
 libfdt/fdt.h                                  |   15 +
 libfdt/fdt_addon.c                            | 1636 +++++++++++++++++
 libfdt/fdt_ro.c                               |   12 +
 libfdt/fdt_rw.c                               |  102 +-
 libfdt/libfdt.h                               |   60 +-
 libfdt/libfdt_internal.h                      |    7 +
 libfdt/meson.build                            |    1 +
 libfdt/version.lds                            |    2 +
 livetree.c                                    |  563 +++++-
 meson.build                                   |    2 +-
 ...ddon_addon_namespace-merged.dtb.dts.expect |   57 +
 ...fdtaddon_addon_namespace-merged.dtb.expect |   49 +
 tests/fdtaddon_addon_namespace.dtba.expect    |   31 +
 tests/fdtaddon_addon_namespace.dtsa           |   34 +
 tests/fdtaddon_base.dtb.expect                |   24 +
 tests/fdtaddon_base.dts                       |   27 +
 tests/fdtaddon_base_namespace.dtb.expect      |   29 +
 tests/fdtaddon_base_namespace.dts             |   33 +
 tests/fdtaddon_basics1-merged1.dtb.dts.expect |   35 +
 tests/fdtaddon_basics1-merged1.dtb.expect     |   27 +
 tests/fdtaddon_basics1-merged2.dtb.dts.expect |   35 +
 tests/fdtaddon_basics1-merged2.dtb.expect     |   27 +
 tests/fdtaddon_basics1.dtba.expect            |    8 +
 tests/fdtaddon_basics1.dtsa                   |   13 +
 tests/fdtaddon_basics2-merged1.dtb.dts.expect |   35 +
 tests/fdtaddon_basics2-merged1.dtb.expect     |   27 +
 tests/fdtaddon_basics2-merged2.dtb.dts.expect |   35 +
 tests/fdtaddon_basics2-merged2.dtb.expect     |   27 +
 tests/fdtaddon_basics2.dtba.expect            |    9 +
 tests/fdtaddon_basics2.dtsa                   |   15 +
 tests/fdtaddon_basics3-merged1.dtb.dts.expect |   36 +
 tests/fdtaddon_basics3-merged1.dtb.expect     |   29 +
 tests/fdtaddon_basics3-merged2.dtb.dts.expect |   36 +
 tests/fdtaddon_basics3-merged2.dtb.expect     |   29 +
 tests/fdtaddon_basics3.dtba.expect            |   12 +
 tests/fdtaddon_basics3.dtsa                   |   17 +
 ...ddon_realistic_addon-merged.dtb.dts.expect |   91 +
 ...fdtaddon_realistic_addon-merged.dtb.expect |   93 +
 tests/fdtaddon_realistic_addon.dtba.expect    |   32 +
 tests/fdtaddon_realistic_addon.dtsa           |   50 +
 tests/fdtaddon_realistic_base.dtb.expect      |   72 +
 tests/fdtaddon_realistic_base.dts             |   74 +
 .../fdtaddon_stack_1st-merged.dtb.dts.expect  |   51 +
 tests/fdtaddon_stack_1st-merged.dtb.expect    |   41 +
 tests/fdtaddon_stack_1st.dtba.expect          |   24 +
 tests/fdtaddon_stack_1st.dtsa                 |   27 +
 .../fdtaddon_stack_2nd-merged.dtb.dts.expect  |   70 +
 tests/fdtaddon_stack_2nd-merged.dtb.expect    |   59 +
 tests/fdtaddon_stack_2nd.dtba.expect          |   30 +
 tests/fdtaddon_stack_2nd.dtsa                 |   35 +
 tests/meson.build                             |    4 +-
 tests/metadata_addon_base.dtb.dts.expect      |   10 +
 tests/metadata_addon_base.dtb.expect          |   10 +
 tests/metadata_addon_base.dts                 |   14 +
 tests/metadata_addon_base.dts.dts.expect      |   10 +
 tests/metadata_addon_orphan1.dtb.dts.expect   |   16 +
 tests/metadata_addon_orphan1.dtb.expect       |   13 +
 tests/metadata_addon_orphan1.dts              |   19 +
 tests/metadata_addon_orphan1.dts.dts.expect   |   16 +
 tests/metadata_addon_orphan2.dtb.dts.expect   |   10 +
 tests/metadata_addon_orphan2.dtb.expect       |    8 +
 tests/metadata_addon_orphan2.dts              |   13 +
 tests/metadata_addon_orphan2.dts.dts.expect   |   10 +
 tests/metadata_addon_orphan3.dtb.dts.expect   |   22 +
 tests/metadata_addon_orphan3.dtb.expect       |   17 +
 tests/metadata_addon_orphan3.dts              |   28 +
 tests/metadata_addon_orphan3.dts.dts.expect   |   22 +
 .../metadata_addon_references.dtb.dts.expect  |   48 +
 tests/metadata_addon_references.dtb.expect    |   48 +
 tests/metadata_addon_references.dts           |   43 +
 .../metadata_addon_references.dts.dts.expect  |   48 +
 ...metadata_addon_refnamespace.dtb.dts.expect |   32 +
 tests/metadata_addon_refnamespace.dtb.expect  |   29 +
 tests/metadata_addon_refnamespace.dts         |   38 +
 ...metadata_addon_refnamespace.dts.dts.expect |   32 +
 tests/metadata_dtflags0.dtb.expect            |    1 +
 tests/metadata_dtflags0.dts                   |   10 +
 tests/metadata_dtflags1.dtb.expect            |    1 +
 tests/metadata_dtflags1.dts                   |   11 +
 .../metadata_exportsyms_local.dtb.dts.expect  |   26 +
 tests/metadata_exportsyms_local.dtb.expect    |   20 +
 tests/metadata_exportsyms_local.dts           |   28 +
 .../metadata_exportsyms_local.dts.dts.expect  |   26 +
 tests/metadata_exportsyms_ref.dtb.dts.expect  |   25 +
 tests/metadata_exportsyms_ref.dtb.expect      |   18 +
 tests/metadata_exportsyms_ref.dts             |   26 +
 tests/metadata_exportsyms_ref.dts.dts.expect  |   25 +
 tests/metadata_importsyms.dtb.dts.expect      |    9 +
 tests/metadata_importsyms.dtb.expect          |    8 +
 tests/metadata_importsyms.dts                 |   14 +
 tests/metadata_importsyms.dts.dts.expect      |    9 +
 tests/metadata_reflocal.dtb.dts.expect        |   23 +
 tests/metadata_reflocal.dtb.expect            |   20 +
 tests/metadata_reflocal.dts                   |   27 +
 tests/metadata_reflocal.dts.dts.expect        |   23 +
 tests/metadata_refphandle.dtb.dts.expect      |   17 +
 tests/metadata_refphandle.dtb.expect          |   16 +
 tests/metadata_refphandle.dts                 |   11 +
 tests/metadata_refphandle.dts.dts.expect      |   17 +
 tests/metadata_sort.dtb.dts.expect            |   61 +
 tests/metadata_sort.dtb.expect                |   48 +
 tests/metadata_sort.dts                       |   58 +
 tests/pylibfdt_tests.py                       |    8 +-
 tests/run_tests.sh                            |  176 +-
 tests/testutils.c                             |    2 +-
 tests/testutils.sh                            |    1 +
 tests/trees.S                                 |    3 +-
 treesource.c                                  |   42 +-
 121 files changed, 6552 insertions(+), 192 deletions(-)
 create mode 100644 fdtaddon.c
 create mode 100644 libfdt/fdt_addon.c
 create mode 100644 tests/fdtaddon_addon_namespace-merged.dtb.dts.expect
 create mode 100644 tests/fdtaddon_addon_namespace-merged.dtb.expect
 create mode 100644 tests/fdtaddon_addon_namespace.dtba.expect
 create mode 100644 tests/fdtaddon_addon_namespace.dtsa
 create mode 100644 tests/fdtaddon_base.dtb.expect
 create mode 100644 tests/fdtaddon_base.dts
 create mode 100644 tests/fdtaddon_base_namespace.dtb.expect
 create mode 100644 tests/fdtaddon_base_namespace.dts
 create mode 100644 tests/fdtaddon_basics1-merged1.dtb.dts.expect
 create mode 100644 tests/fdtaddon_basics1-merged1.dtb.expect
 create mode 100644 tests/fdtaddon_basics1-merged2.dtb.dts.expect
 create mode 100644 tests/fdtaddon_basics1-merged2.dtb.expect
 create mode 100644 tests/fdtaddon_basics1.dtba.expect
 create mode 100644 tests/fdtaddon_basics1.dtsa
 create mode 100644 tests/fdtaddon_basics2-merged1.dtb.dts.expect
 create mode 100644 tests/fdtaddon_basics2-merged1.dtb.expect
 create mode 100644 tests/fdtaddon_basics2-merged2.dtb.dts.expect
 create mode 100644 tests/fdtaddon_basics2-merged2.dtb.expect
 create mode 100644 tests/fdtaddon_basics2.dtba.expect
 create mode 100644 tests/fdtaddon_basics2.dtsa
 create mode 100644 tests/fdtaddon_basics3-merged1.dtb.dts.expect
 create mode 100644 tests/fdtaddon_basics3-merged1.dtb.expect
 create mode 100644 tests/fdtaddon_basics3-merged2.dtb.dts.expect
 create mode 100644 tests/fdtaddon_basics3-merged2.dtb.expect
 create mode 100644 tests/fdtaddon_basics3.dtba.expect
 create mode 100644 tests/fdtaddon_basics3.dtsa
 create mode 100644 tests/fdtaddon_realistic_addon-merged.dtb.dts.expect
 create mode 100644 tests/fdtaddon_realistic_addon-merged.dtb.expect
 create mode 100644 tests/fdtaddon_realistic_addon.dtba.expect
 create mode 100644 tests/fdtaddon_realistic_addon.dtsa
 create mode 100644 tests/fdtaddon_realistic_base.dtb.expect
 create mode 100644 tests/fdtaddon_realistic_base.dts
 create mode 100644 tests/fdtaddon_stack_1st-merged.dtb.dts.expect
 create mode 100644 tests/fdtaddon_stack_1st-merged.dtb.expect
 create mode 100644 tests/fdtaddon_stack_1st.dtba.expect
 create mode 100644 tests/fdtaddon_stack_1st.dtsa
 create mode 100644 tests/fdtaddon_stack_2nd-merged.dtb.dts.expect
 create mode 100644 tests/fdtaddon_stack_2nd-merged.dtb.expect
 create mode 100644 tests/fdtaddon_stack_2nd.dtba.expect
 create mode 100644 tests/fdtaddon_stack_2nd.dtsa
 create mode 100644 tests/metadata_addon_base.dtb.dts.expect
 create mode 100644 tests/metadata_addon_base.dtb.expect
 create mode 100644 tests/metadata_addon_base.dts
 create mode 100644 tests/metadata_addon_base.dts.dts.expect
 create mode 100644 tests/metadata_addon_orphan1.dtb.dts.expect
 create mode 100644 tests/metadata_addon_orphan1.dtb.expect
 create mode 100644 tests/metadata_addon_orphan1.dts
 create mode 100644 tests/metadata_addon_orphan1.dts.dts.expect
 create mode 100644 tests/metadata_addon_orphan2.dtb.dts.expect
 create mode 100644 tests/metadata_addon_orphan2.dtb.expect
 create mode 100644 tests/metadata_addon_orphan2.dts
 create mode 100644 tests/metadata_addon_orphan2.dts.dts.expect
 create mode 100644 tests/metadata_addon_orphan3.dtb.dts.expect
 create mode 100644 tests/metadata_addon_orphan3.dtb.expect
 create mode 100644 tests/metadata_addon_orphan3.dts
 create mode 100644 tests/metadata_addon_orphan3.dts.dts.expect
 create mode 100644 tests/metadata_addon_references.dtb.dts.expect
 create mode 100644 tests/metadata_addon_references.dtb.expect
 create mode 100644 tests/metadata_addon_references.dts
 create mode 100644 tests/metadata_addon_references.dts.dts.expect
 create mode 100644 tests/metadata_addon_refnamespace.dtb.dts.expect
 create mode 100644 tests/metadata_addon_refnamespace.dtb.expect
 create mode 100644 tests/metadata_addon_refnamespace.dts
 create mode 100644 tests/metadata_addon_refnamespace.dts.dts.expect
 create mode 100644 tests/metadata_dtflags0.dtb.expect
 create mode 100644 tests/metadata_dtflags0.dts
 create mode 100644 tests/metadata_dtflags1.dtb.expect
 create mode 100644 tests/metadata_dtflags1.dts
 create mode 100644 tests/metadata_exportsyms_local.dtb.dts.expect
 create mode 100644 tests/metadata_exportsyms_local.dtb.expect
 create mode 100644 tests/metadata_exportsyms_local.dts
 create mode 100644 tests/metadata_exportsyms_local.dts.dts.expect
 create mode 100644 tests/metadata_exportsyms_ref.dtb.dts.expect
 create mode 100644 tests/metadata_exportsyms_ref.dtb.expect
 create mode 100644 tests/metadata_exportsyms_ref.dts
 create mode 100644 tests/metadata_exportsyms_ref.dts.dts.expect
 create mode 100644 tests/metadata_importsyms.dtb.dts.expect
 create mode 100644 tests/metadata_importsyms.dtb.expect
 create mode 100644 tests/metadata_importsyms.dts
 create mode 100644 tests/metadata_importsyms.dts.dts.expect
 create mode 100644 tests/metadata_reflocal.dtb.dts.expect
 create mode 100644 tests/metadata_reflocal.dtb.expect
 create mode 100644 tests/metadata_reflocal.dts
 create mode 100644 tests/metadata_reflocal.dts.dts.expect
 create mode 100644 tests/metadata_refphandle.dtb.dts.expect
 create mode 100644 tests/metadata_refphandle.dtb.expect
 create mode 100644 tests/metadata_refphandle.dts
 create mode 100644 tests/metadata_refphandle.dts.dts.expect
 create mode 100644 tests/metadata_sort.dtb.dts.expect
 create mode 100644 tests/metadata_sort.dtb.expect
 create mode 100644 tests/metadata_sort.dts

-- 
2.52.0

