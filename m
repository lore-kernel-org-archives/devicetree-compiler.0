From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 0/4] libfdt: A few overlay fixes
Date: Thu,  6 Oct 2016 13:39:55 +0200
Message-ID: <20161006113959.30865-1-maxime.ripard@free-electrons.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Hi David,

Here are a few patches to fix the things you requested and a few bugs
encountered while doing so.

Let me know what you think,
Maxime

Maxime Ripard (4):
  libfdt: Add BADPHANDLE error string
  libfdt: overlay: Report a bad overlay for mismatching local fixups
  libfdt: overlay: Fix symbols and fixups nodes condition
  tests: overlay: Move back the bad fixup tests

 libfdt/fdt_overlay.c  |  9 +++++----
 libfdt/fdt_strerror.c |  1 +
 tests/run_tests.sh    | 14 +++++++-------
 3 files changed, 13 insertions(+), 11 deletions(-)

-- 
2.9.3
