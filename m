Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3A83B7767;
	Wed, 26 Aug 2026 09:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787737843; cv=none; b=V3DJ3HCE3l69+c+VdKv3cqfx5mhj7ABAsqADBK/qWtq8fQwojxiyzY5ukfFIi24+0v7uJI553lNMMY21vpanq845T2UmECBqtGZwyFnO3PzIf0QqrpWNzRcLQ2Q03ZbuJz0qIKaH7OzPiNxN8pK25EQrNJ9++b6aPUkY44Io+4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787737843; c=relaxed/simple;
	bh=H1Asas5SQWtvq6b6vxA9B3sTkYdb+iFcQdbU6LTuv1w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dWDY8wg/VlwetdShGRyDWUreRJ85b5LK3fH/LOCFthYkZ3N+SUOC4JACroO07IX4FgOj+Hbon1d5mo0hoKASmqQ3xhIQDZTAQz6fP300A0f0IWbW1t0pcITCX5ExC/KqcqDLlaDQozxDDwNRmdJUFIhdS39zWcxNKeAGNHbTlwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=yXapImyG; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="yXapImyG"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 79F911A183A;
	Wed, 26 Aug 2026 09:50:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4BF8F604EC;
	Wed, 26 Aug 2026 09:50:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2C36911C780F5;
	Wed, 26 Aug 2026 11:50:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787737832; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=HkVUPyAx/oge8my8mybXTULxVudSXuovtlBICkNFihY=;
	b=yXapImyG3VunUmuydGNvk2n2D4EVWlWLO4AriH2Tym1RNJALt3X8NDnJr+4VV03Tza723E
	cu89yAZK93LJogxFFd19+2LaOCuCDCYEOOoVSRVzmGOnAVbPPvlmS9Sjx2amNWdB08/csg
	Plo/s7gtxM30D0KEq86lmSAde9wijDYdIv2Cj9ade/QO08tyoO2OUTIU/X2sKSKMW3vCWo
	tbIw4F+DdKY7PsP0hwyp8VAQ9vGXs5p0P/mLK6fpX7rAWDyd5fMCrtU74e3uSRbCl9OWe5
	MlRJYR4Avw52mfl7QO1dGACrX6vQ6/HmxRdmFKbcirXli0Q+vKVbDy8lGTb3+A==
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
Subject: [RFC PATCH v2 00/74] Add support for dtb metadata and addon device-trees
Date: Wed, 26 Aug 2026 11:48:29 +0200
Message-ID: <20260826094950.1088288-1-herve.codina@bootlin.com>
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

This big picture series adds support for dtb metadata and addon
device-trees.

It is worth noting that this series needs the support for "structured
tags" available and so this RFC v2 must be applied to top of the
following series:
   https://lore.kernel.org/all/20260826083146.304291-1-herve.codina@bootlin.com/

Before giving details about the series content, let me give a little bit
of context.

The use-case is to support additional boards that can be hot-plugged to
a connector available in a base board. This connector is standardized in
terms of resources available on each pin. Any additional boards
compatible with the connector should be able to be connected to base
board and all base boards where this connector is implemented should
support any additional boards.

TLDR: The patch 73 gives an example of dts and dtsa (new addon
      device-tree) handling this use-case. It provides an example of a
      realistic base board description (dts) and an realistic additional
      board description (dtsa).

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

A first RFC iteration related to the implementation of features
discussed on the mailing-list has been sent [4]. During the review, the
need for "structured tag" format emerged in order to allow a smoother
integration of new tags. A series adding support for those structured
tags has been sent separately and its v3 iteration is available [5].

This current RFC v2 is the implementation of features discussed on the
mailing-list rebased on the top of the series adding support for
"structured tags" [5]. A lot of things are new in dtb format (new tags)
and dts format (new keyword, new kind of references) and not yet
mentioned in the standard.

[4] https://lore.kernel.org/all/20260112142009.1006236-1-herve.codina@bootlin.com/
[5] https://lore.kernel.org/all/20260826083146.304291-1-herve.codina@bootlin.com/

Also this RFC v2 contains some improvements and fixes that were missed
in RFC v1.

The purpose of this big picture RFC is to move forward on this topic
based on code and some concrete dts / dtb example. Indeed, this RFC also
adds tests for each feature introduced. Those tests are performed using
dts files and the content of those dts files can also help in the
discussion.

  - Patch 1:
    The first patch is just a simple fix and can probably be merged out
    of this meta-data and addon discussion.

  - Patches 2..12: Introduce new meta-data dtb tags based on markers

    Those new tags are FDT_PROPDATA_PHANDLE and FDT_PROPDATA_PHANDLE_REF
    (FDT_LOCAL and FDT_REF_PHANDLE in RFC v1).

    FDT_PROPDATA_PHANDLE (details in patch 7) is used to tag property
    using a  phandle and this phandle points to a local node (i.e. a
    node existing in the dtb).

    FDT_PROPDATA_PHANDLE_REF (details in patch 11) is used to tag a
    property using a phandle but this phandle points to a non local node
    (i.e. the node doesn't exist in the dtb). The reference to the node
    is present with the tag and the phandle value has to be fixed when
    the dtb is applied. This tag can only be present in plugins
    (overlays) and addons dtb.

  - Patches 13..15: Introduce addons device-tree

    This part introduce the new /addon/ dts keyword

  - Patches 16..26: Introduce /export/ keyword and related dtb tags

    This part introduces the new /export/ dts keyword (details in patch
    17) and the related FDT_EXPORT_SYM and FDT_EXPORT_SYM_REF dtb tags.

    FDT_EXPORT_SYM (details in patch 21) is used when the exported
    symbol involved is a local node and FDT_EXPORT_SYM_REF (details in
    patch 25) is used when the node involved is a non local node.

  - Patches 27..34: Introduce /import/ keyword and related dtb tags

    This part introduces the new /import/ dts keyword (details in patch
    29) and the related FDT_IMPORT_SYM dtb tag (details in patch 31).

  - Patches 35..58: Introduce orphan nodes

    Even if the orphan nodes concept was already present in overlays,
    the final encoding of those nodes in addon dtbs is different
    compared to overlays dtbs.

    In overlays, orphan nodes are transformed to a /fragment@n/__overlay__
    node. This is not the way used in addons.

    Indeed, in addons, orphan nodes are not transformed to fit in
    something like /fragment@n/__overlay__. They are encoded in the dtb
    using a specific tag.

    This part, after some preparation, introduces orphan nodes (details
    in patch 44) and the related FDT_BEGIN_NODE_REF_SYM dtb tag (details
    in patch 51).

    It also adds support for addons dts/dtb without a 'root' (details in
    patch 53).

    This part ended with the support for merging orphan node described
    in dts when relevant (details patch 55).

  - Patches 59..60: Reference orphan nodes and its sub-nodes by path

    A new syntax is needed to be able to reference an orphan node and
    its sub-nodes by path.

    This new syntax is '${$<orphan_name>/<path>}' (details in patch 59)

  - Patches 61..62: Namespace labels references

    Add Namespace labels references with the new syntax '&foo.bar.baz'.

    This new syntax, only allowed in addons, allows to 'jump' from node
    to node based on exported symbols defined at each node (details in
    patch 61).

  - Patches 63..64: Support for applying an addon

    First, add fdt_addon_apply() in libfdt (details in patch 63) and
    then the fdtaddon command line tool (details in patch 64).

  - Patches 65..71: fdtaddon test

    Several tests related to addon application

  - Patch 72: A more Realistic test

    A test based on use-case we want to handle.

    This patch (and its dts and dtsa files) shows the kind of usage is
    expected for addons.

    Also it proves that metadata and addons features handles our
    use-case.

  - Patch 73..74: External resolver

    Add the ability to use an external symbol resolver (i.e. a symbol
    resolver other than the one provided in the core libfdt) and
    implement an external resolver in the fdtaddon tool.

    This external resolver performs the resolution based on information
    given at the tool command line and prove the capabilities of the
    addon feature to handle the case where an addon uses several
    connectors of a base board.

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

Changes RFC v1 -> RFC v2

  RFC v1: https://lore.kernel.org/all/20260112142009.1006236-1-herve.codina@bootlin.com/

  Rebase on top of the series adding support for "structured tags"
     https://lore.kernel.org/all/20260826083146.304291-1-herve.codina@bootlin.com/
  Use "structured tag" for the new tags.
  Remove patches proposed in RFC v1 which arae either already applied
  upstream or moved to the series adding support for "structured tags".

  - Patch 1 (patch 15 in RFC v1)
    Reword commit log and move the patch at the beginning of the series.

  - Patches 2..12: Introduce new meta-data dtb tags based on markers
    - Introduce get_structured_tag_data() in fdtdump and
      fdt_get_structured_tag_data() in libfdt to avoid code duplication.
    - Remove fdt_next_tag_full() and keep fdt_next_tag() returning all
      known tags (no implicit filtering). All tags need to be handled at
      caller side. Introduce fdt_next_tag_filter() and a predefined
      filter function, fdt_tag_filter_skip_metadata(), to ease the
      handling of tags at caller side avoiding also code duplication.
    - Handle metadata tags on dtb modification.
    - Move fill_fullpaths() into build_dt_info()
    - Rename FDT_LOCAL and FDT_REF_PHANDLE to FDT_PROPDATA_PHANDLE and
      FDT_PROPDATA_PHANDLE_REF
    - Complete REF_PHANDLE markers with complete_references() instead of
      creating new marker as suggested in RFC v1. Complete those markers
      as soon as possible in build_dt_info() to avoid the existence of
      incomplete markers later in the code. build_dt_info() is called at
      the end of parsing functions whatever the format (dts, dtb) parsed.
      Once a dt_info is available, markers are complete. In other words,
      markers are completed as soon as the input file is parsed.
    - Fold simple patch (RFC v1 patch 4) into patch that needs it.

  - Patches 13..15: Introduce addons device-tree
    - Check that the DTC input (dts or dtb) is not flagged plugin
      (overlay) and addon. Mutually exclusive flags.

  - Patches 16..26: Introduce /export/ keyword and related dtb tags
    - Fix patch 16 commit log
    - Update fdt_tag_filter_skip_metadata()
    - Update complete_references()
    - Avoid extra padding in FDT_EXPORT_SYM. Make FDT_EXPORT_SYM_REF
      consistent with FDT_EXPORT_SYM format (i.e. symbol name after the
      reference)
    - Put FDT_EXPORT* tags right after FDT_NODE. Indeed, FDT_EXPORT*
      tags are node related structured tags.
    - Remove the (ugly) 'placeholder for a phandle' field in
      FDT_EXPORT_SYM_REF.

  - Patches 27..34: Introduce /import/ keyword and related dtb tags
    - Update fdt_tag_filter_skip_metadata()

  - Patches 35..58: Introduce orphan nodes
    - Change existing function signature instead of introducing new
      functions. Add '_' suffix to function with old signature that are
      still used internally.
    - Introduce node_is_orphan() to test if a given node is an orphan
      node.
    - Fix fixup_phandle_references() when an orphan node is involved
      (missed in RFC v1) and add a related test.
    - Do not check node name for orphan nodes. A orphan node doesn't
      have a node name but a reference to an external node.
    - Rework handling in libfdt due to fdt_next_tag() returning all
      known tags.
    - Take orphan nodes into account in libfdt fdt_check_full().

  - Patches 59..60: Reference orphan nodes and its sub-nodes by path
    - Fix fill_fullpaths(), get_node_by_path() and get_node_by_ref_().
    - phandle properties are no more created in an orphan node. Fix test
      expected values.

  - Patches 61..62: Namespace labels references
    - No specific changes other expected values updates due to series
      changes (tags name and locations)

  - Patches 63..64: Support for applying an addon
    - Minor modification to avoid signed/unsigned mismatch
    - Fix last_prop_offset handling in addon_adjust_local_phandles(),
      addon_resolve_phandles() and addon_replace_local_phandles()
    - Handle data fields re-ordering in FDT_EXPORT_SYM and
      FDT_EXPORT_SYM_REF.
    - Handle the 'placeholder for a phandle' field removal in
      FDT_EXPORT_SYM_REF.
    - Use fdt_get_structured_tag_data() to get data related to new tags.
    - Use fdt_root_offset() to get the addon root node instead of using
      hard-coded offset 0.
    - An addon cannot modify a property present in the base device-tree.
      In RFC v1 if the property was present in both side, an error was
      reported. Fix that and report the error only if the property is
      present on both side but with different values. Exact same values
      doesn't imply a property modification.
    - Update orphan node handling and remove tag overrides done in RFC
      v1 to consider orphan nodes as standard nodes at some specific
      parts.
    - Update comments, split and renamed some functions, make the code
      more consistent.

  - Patches 67..71: fdtaddon test
    - Update expected values due to series changes (tags name and
      locations)
    - Add a new test related to references by path to orphan nodes
    - Add a new test related properties in addon identical to existing
      ones

  - Patch 72: A more Realistic test
    - No specific changes other expected values updates due to series
      changes (tags name and locations)

  - Patch 73..74: External resolver
    - New patches in RFC v2. Allow to resolve symbols on criteria other
      than simple import/export symbol names. Symbol resolution of an
      addon applied at some node level and using several connectors
      should be handle by this kind of external resolver.

Herve Codina (74):
  dtc-parser.y: Avoid an empty proplist
  Introduce v20 dtb version
  fdtdump: Introduce get_structured_tag_data()
  libfdt: Introduce fdt_get_structured_tag_data()
  libfdt: Prepare for metadata tag support
  dtc: Move fill_fullpaths() into build_dt_info()
  Add support for FDT_PROPDATA_PHANDLE dtb tag
  livetree: Improve get_node_by_phandle()
  dtc: Complete REF_PHANDLE markers with ref strings and is_local flags
  tests: Add basic metadata tests
  Add support for FDT_PROPDATA_PHANDLE_REF dtb tag
  tests: metadata: Add external phandle reference tests
  Add support for /addon/ keyword
  tests: Add a test related to addon dt_flags header value
  tests: metadata: Add a basic addon test
  dtc: Introduce export symbols
  dtc: Add support for /export/ dts keyword parsing
  checks: Handle export symbols in fixup_phandle_references()
  dtc: Add export symbols (/export/ keyword) in generated dts file
  dtc: Extend complete_references() to handle export symbols
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
  checks: Get 'chosen' node using get_subnode()
  dtc: Change get_node_by_path() signature to take dt_info
  dtc: Change get_node_by_label() signature to take dt_info
  dtc: Change get_node_by_phandle() signature to take dt_info
  dtc: Change get_node_by_ref() signature to take dt_info
  dtc: Change get_node_phandle() signature to take dt_info
  dtc: Change get_property_by_label() signature to take dt_info
  dtc: Change get_marker_label() signature to take dt_info
  dtc: Change fill_fullpaths() signature to take dt_info
  dtc: Introduce orphan nodes
  dtc: Handle orphan nodes in get_xxx_by_yyy()
  dtc: Avoid NULL fullpath for nodes in orphan trees
  dtc: Handle orphan nodes in complete_references()
  checks: Perform checks for orphan nodes
  dtc: Rename add_orphan_node() to plugin_add_orphan_node()
  dtc: Add basic support for addon orphan nodes in dts
  Add support for FDT_BEGIN_NODE_REF dtb tag
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
  libfdt: Add support for applying an addon on a base device-tree blob
  Add fdtaddon tool to apply an addon
  tests: Add a first basic test for fdtaddon
  tests: fdtaddon: Add a basic test for addons using an orphan nodes
  tests: fdtaddon: Add a basic test for addons with unresolved phandle
    references
  tests: fdtaddon: Add a basic test for addons with references by path
    to orphan nodes
  tests: fdtaddon: Add a test for addons with properties identical to
    existing ones
  tests: fdtaddon: Add a test for addons using namespace label
    references
  tests: fdtaddon: Add a test for using 'stacked' addons
  tests: fdtaddon: Add a test using more realistic dts and dtsa
  libfdt/fdt_addon.c: Add support for an external resolver
  fdtaddon: Add a simple external resolver

 Makefile                                      |    5 +
 Makefile.utils                                |    6 +
 checks.c                                      |  154 +-
 data.c                                        |    3 +-
 dtc-lexer.l                                   |   37 +
 dtc-parser.y                                  |  307 ++-
 dtc.c                                         |   40 +-
 dtc.h                                         |   66 +-
 fdtaddon.c                                    |  415 ++++
 fdtdump.c                                     |  121 +-
 flattree.c                                    |  470 ++++-
 fstree.c                                      |    5 +-
 libfdt/Makefile.libfdt                        |    2 +-
 libfdt/fdt.c                                  |  365 +++-
 libfdt/fdt.h                                  |   89 +
 libfdt/fdt_addon.c                            | 1805 +++++++++++++++++
 libfdt/fdt_check.c                            |  257 ++-
 libfdt/fdt_ro.c                               |   49 +-
 libfdt/fdt_rw.c                               |  172 +-
 libfdt/fdt_wip.c                              |   23 +-
 libfdt/libfdt.h                               |  137 +-
 libfdt/libfdt_internal.h                      |   29 +
 libfdt/meson.build                            |    1 +
 libfdt/version.lds                            |    3 +
 livetree.c                                    |  626 +++++-
 meson.build                                   |    2 +-
 tests/dtflags_addon.dtb.expect                |    1 +
 tests/dtflags_addon.dts                       |   11 +
 ...n_custom_resolver_node_a-merged.dtb.expect |   39 +
 ...n_addon_custom_resolver_node_a.dtba.expect |   15 +
 ...fdtaddon_addon_custom_resolver_node_a.dtsa |   22 +
 ..._custom_resolver_node_ab-merged.dtb.expect |   42 +
 ..._addon_custom_resolver_node_ab.dtba.expect |   21 +
 ...dtaddon_addon_custom_resolver_node_ab.dtsa |   29 +
 ...ddon_addon_namespace-merged.dtb.dts.expect |   57 +
 ...fdtaddon_addon_namespace-merged.dtb.expect |   49 +
 tests/fdtaddon_addon_namespace.dtba.expect    |   31 +
 tests/fdtaddon_addon_namespace.dtsa           |   34 +
 ...n_addon_prop_existing_ok-merged.dtb.expect |   20 +
 ...dtaddon_addon_prop_existing_ok.dtba.expect |   17 +
 tests/fdtaddon_addon_prop_existing_ok.dtsa    |   25 +
 tests/fdtaddon_base.dtb.expect                |   24 +
 tests/fdtaddon_base.dts                       |   27 +
 .../fdtaddon_base_custom_resolver.dtb.expect  |   33 +
 tests/fdtaddon_base_custom_resolver.dts       |   52 +
 tests/fdtaddon_base_namespace.dtb.expect      |   29 +
 tests/fdtaddon_base_namespace.dts             |   33 +
 tests/fdtaddon_base_prop_existing.dtb.expect  |   17 +
 tests/fdtaddon_base_prop_existing.dts         |   22 +
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
 tests/fdtaddon_basics4-merged1.dtb.dts.expect |   43 +
 tests/fdtaddon_basics4-merged1.dtb.expect     |   37 +
 tests/fdtaddon_basics4-merged2.dtb.dts.expect |   43 +
 tests/fdtaddon_basics4-merged2.dtb.expect     |   37 +
 tests/fdtaddon_basics4.dtba.expect            |   22 +
 tests/fdtaddon_basics4.dtsa                   |   25 +
 ...ddon_realistic_addon-merged.dtb.dts.expect |   91 +
 ...fdtaddon_realistic_addon-merged.dtb.expect |   93 +
 tests/fdtaddon_realistic_addon.dtba.expect    |   32 +
 tests/fdtaddon_realistic_addon.dtsa           |   50 +
 tests/fdtaddon_realistic_base.dtb.expect      |   72 +
 tests/fdtaddon_realistic_base.dts             |   74 +
 .../fdtaddon_stack_1st-merged.dtb.dts.expect  |   51 +
 tests/fdtaddon_stack_1st-merged.dtb.expect    |   41 +
 tests/fdtaddon_stack_1st.dtba.expect          |   24 +
 tests/fdtaddon_stack_1st.dtsa                 |   28 +
 .../fdtaddon_stack_2nd-merged.dtb.dts.expect  |   70 +
 tests/fdtaddon_stack_2nd-merged.dtb.expect    |   59 +
 tests/fdtaddon_stack_2nd.dtba.expect          |   30 +
 tests/fdtaddon_stack_2nd.dtsa                 |   35 +
 tests/meson.build                             |    2 +
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
 .../metadata_addon_references.dtb.dts.expect  |   47 +
 tests/metadata_addon_references.dtb.expect    |   47 +
 tests/metadata_addon_references.dts           |   43 +
 .../metadata_addon_references.dts.dts.expect  |   47 +
 ...metadata_addon_refnamespace.dtb.dts.expect |   32 +
 tests/metadata_addon_refnamespace.dtb.expect  |   29 +
 tests/metadata_addon_refnamespace.dts         |   38 +
 ...metadata_addon_refnamespace.dts.dts.expect |   32 +
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
 ...data_propdata_phandle_local.dtb.dts.expect |   23 +
 ...metadata_propdata_phandle_local.dtb.expect |   20 +
 tests/metadata_propdata_phandle_local.dts     |   27 +
 ...data_propdata_phandle_local.dts.dts.expect |   23 +
 ...tadata_propdata_phandle_ref.dtb.dts.expect |   18 +
 .../metadata_propdata_phandle_ref.dtb.expect  |   16 +
 tests/metadata_propdata_phandle_ref.dts       |   11 +
 ...tadata_propdata_phandle_ref.dts.dts.expect |   18 +
 tests/metadata_sort.dtb.dts.expect            |   61 +
 tests/metadata_sort.dtb.expect                |   48 +
 tests/metadata_sort.dts                       |   58 +
 tests/pylibfdt_tests.py                       |    6 +-
 tests/run_tests.sh                            |  178 +-
 tests/testutils.sh                            |    1 +
 tests/treegen.c                               |    2 +-
 ...own_tags_can_skip.fdtput.test.dtb.1.expect |    2 +-
 ...nknown_tags_can_skip.wip.test.dtb.1.expect |    2 +-
 treesource.c                                  |   46 +-
 142 files changed, 8299 insertions(+), 298 deletions(-)
 create mode 100644 fdtaddon.c
 create mode 100644 libfdt/fdt_addon.c
 create mode 100644 tests/dtflags_addon.dtb.expect
 create mode 100644 tests/dtflags_addon.dts
 create mode 100644 tests/fdtaddon_addon_custom_resolver_node_a-merged.dtb.expect
 create mode 100644 tests/fdtaddon_addon_custom_resolver_node_a.dtba.expect
 create mode 100644 tests/fdtaddon_addon_custom_resolver_node_a.dtsa
 create mode 100644 tests/fdtaddon_addon_custom_resolver_node_ab-merged.dtb.expect
 create mode 100644 tests/fdtaddon_addon_custom_resolver_node_ab.dtba.expect
 create mode 100644 tests/fdtaddon_addon_custom_resolver_node_ab.dtsa
 create mode 100644 tests/fdtaddon_addon_namespace-merged.dtb.dts.expect
 create mode 100644 tests/fdtaddon_addon_namespace-merged.dtb.expect
 create mode 100644 tests/fdtaddon_addon_namespace.dtba.expect
 create mode 100644 tests/fdtaddon_addon_namespace.dtsa
 create mode 100644 tests/fdtaddon_addon_prop_existing_ok-merged.dtb.expect
 create mode 100644 tests/fdtaddon_addon_prop_existing_ok.dtba.expect
 create mode 100644 tests/fdtaddon_addon_prop_existing_ok.dtsa
 create mode 100644 tests/fdtaddon_base.dtb.expect
 create mode 100644 tests/fdtaddon_base.dts
 create mode 100644 tests/fdtaddon_base_custom_resolver.dtb.expect
 create mode 100644 tests/fdtaddon_base_custom_resolver.dts
 create mode 100644 tests/fdtaddon_base_namespace.dtb.expect
 create mode 100644 tests/fdtaddon_base_namespace.dts
 create mode 100644 tests/fdtaddon_base_prop_existing.dtb.expect
 create mode 100644 tests/fdtaddon_base_prop_existing.dts
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
 create mode 100644 tests/fdtaddon_basics4-merged1.dtb.dts.expect
 create mode 100644 tests/fdtaddon_basics4-merged1.dtb.expect
 create mode 100644 tests/fdtaddon_basics4-merged2.dtb.dts.expect
 create mode 100644 tests/fdtaddon_basics4-merged2.dtb.expect
 create mode 100644 tests/fdtaddon_basics4.dtba.expect
 create mode 100644 tests/fdtaddon_basics4.dtsa
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
 create mode 100644 tests/metadata_propdata_phandle_local.dtb.dts.expect
 create mode 100644 tests/metadata_propdata_phandle_local.dtb.expect
 create mode 100644 tests/metadata_propdata_phandle_local.dts
 create mode 100644 tests/metadata_propdata_phandle_local.dts.dts.expect
 create mode 100644 tests/metadata_propdata_phandle_ref.dtb.dts.expect
 create mode 100644 tests/metadata_propdata_phandle_ref.dtb.expect
 create mode 100644 tests/metadata_propdata_phandle_ref.dts
 create mode 100644 tests/metadata_propdata_phandle_ref.dts.dts.expect
 create mode 100644 tests/metadata_sort.dtb.dts.expect
 create mode 100644 tests/metadata_sort.dtb.expect
 create mode 100644 tests/metadata_sort.dts

-- 
2.55.0

