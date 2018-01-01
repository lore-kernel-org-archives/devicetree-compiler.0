From: kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org
Subject: [PATCH 0/2] overlays: auto allocate phandles for nodes in base fdt
Date: Sun, 31 Dec 2017 20:14:32 -0600
Message-ID: <20180101021434.7826-1-kevans@FreeBSD.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Nodes in the base fdt that do not have phandles cannot currently be referenced
in overlays; we can target them for an overlay, but we cannot use them as a
reference in another property if needed. This is quite limiting for some
use-cases where you're needing cross-references that don't currently exist in
the base.

Kyle Evans (2):
  fdt_overlay: Allocate phandles as needed for nodes referenced in base
    fdt
  fdt_overlay: Basic regression tests for automatically allocated
    phandles

 libfdt/fdt_overlay.c                               | 57 ++++++++++++++++++----
 tests/overlay_base_manual_symbols_auto_phandle.dts | 24 +++++++++
 tests/run_tests.sh                                 |  6 +++
 3 files changed, 78 insertions(+), 9 deletions(-)
 create mode 100644 tests/overlay_base_manual_symbols_auto_phandle.dts

-- 
2.15.1
