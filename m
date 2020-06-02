From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH v3 0/3] dtc: checks: Validate interrupt-map properties
Date: Tue,  2 Jun 2020 12:04:16 +0100
Message-ID: <20200602110419.22488-1-andre.przywara@arm.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

v3 just adds prerequisites for the existing interrupts_property test,
to avoid double checks.
Changelog below.
===============

The interrupt-map properties can be quite tricky, as they are already
hard to read in their source form, and depend on at least two nodes.

The first patch adds a separate test for interrupt providers, to avoid
redundant warnings for missing properties later.
Patch 2/3 is the actual check routine, to verify some features
of the map. In particular it should be able to spot missing fields or
fields using the wrong number of cells. Most of the fields cannot easily
be verified, but at the least the phandle to the interrupt controller and
the total number of cells in the property should be valid.
It actually find problems in the Linux kernel tree's .dts files.

The third patch is more a proof of concept, not sure it should be merged
as is, since it deviates from the current output scheme: It adds more
output in case a map is considered broken, so the issue can be found
much easier.
I would be happy with it living on the list for now.

Please let me know what you think.

Cheers,
Andre

Changelog v2 .. v3:
- add new prerequisites for interrupts_property test

Changelog v1 .. v2:
- change silent returns to asserts if no #interrupt-cells is found
- add prerequisites to interrupt_map test

Changelog RFC .. v1:
- add extra test for #interrupt-cells and #address-cells
- report expected and actual interrupt-map property length
- drop (now) redundant warnings
- explicitly check for overlay DT
- consider nested interrupt-map properties

Andre Przywara (3):
  checks: Add interrupt provider test
  checks: Validate interrupt-map properties
  checks: interrupt-map: Dump entries on error

 checks.c                           | 194 +++++++++++++++++++++++++++++++++++--
 tests/bad-interrupt-controller.dts |   7 ++
 tests/bad-interrupt-map.dts        |  21 ++++
 tests/run_tests.sh                 |   2 +
 4 files changed, 218 insertions(+), 6 deletions(-)
 create mode 100644 tests/bad-interrupt-controller.dts
 create mode 100644 tests/bad-interrupt-map.dts

-- 
2.14.1

