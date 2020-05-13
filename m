From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: [RFC PATCH 0/2] dtc: checks: Validate interrupt-map properties
Date: Wed, 13 May 2020 17:33:37 +0100
Message-ID: <20200513163339.29607-1-andre.przywara@arm.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

The interrupt-map properties can be quite tricky, as they are already
hard to read in their source form, and depend on at least two nodes.

The first patch is the actual check routine, to verify some features
of the map. In particular it should be able to spot missing fields or
fields using the wrong number of cells. Most of the fields cannot easily
be verified, but at the least the phandle to the interrupt controller and
the total number of cells in the property should be valid.
It actually find problems in the Linux kernel tree's .dts files.

While the first patch is quite clean, I am not so confident about the
second one, hence the RFC tags. It adds more output in case a map is
considered broken, so the issue can be found much easier. But it will
increase the amount of warnings, beyond the usual one-problem-per-line,
and lacks the usual prefixes.

Please let me know what you think.

Cheers,
Andre

Andre Przywara (2):
  checks: Validate interrupt-map properties
  checks: interrupt-map: Dump entries on error

 checks.c                    | 165 ++++++++++++++++++++++++++++++++++++++++++++
 tests/bad-interrupt-map.dts |  21 ++++++
 tests/run_tests.sh          |   2 +
 3 files changed, 188 insertions(+)
 create mode 100644 tests/bad-interrupt-map.dts

-- 
2.14.1

