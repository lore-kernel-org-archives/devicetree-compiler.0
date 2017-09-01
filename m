From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v3 0/3] dtc: checks for phandle with arg properties
Date: Fri,  1 Sep 2017 13:53:00 -0500
Message-ID: <20170901185303.24770-1-robh@kernel.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

David,

Here's a new version of checks for phandle with arg style properties. This
checks interrupt and gpio bindings and other common bindings which follow 
the same phandle plus args pattern.

This generates ~200 warnings building the ARM dts files in the kernel.

Rob

Rob Herring (3):
  checks: add phandle with arg property checks
  checks: add gpio binding properties check
  checks: add interrupts property check

 checks.c                      | 280 ++++++++++++++++++++++++++++++++++++++++++
 dtc.h                         |   1 +
 livetree.c                    |   6 +
 tests/bad-gpio.dts            |  13 ++
 tests/bad-interrupt-cells.dts |  12 ++
 tests/bad-phandle-cells.dts   |  11 ++
 tests/run_tests.sh            |   4 +
 7 files changed, 327 insertions(+)
 create mode 100644 tests/bad-gpio.dts
 create mode 100644 tests/bad-interrupt-cells.dts
 create mode 100644 tests/bad-phandle-cells.dts

-- 
2.11.0
