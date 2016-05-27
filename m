From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 0/9] cmd: fdt: Add device tree overlays support
Date: Fri, 27 May 2016 11:13:13 +0200
Message-ID: <1464340402-2249-1-git-send-email-maxime.ripard@free-electrons.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Hi,

The device tree overlays are a great solution to the issue raised by
the bunch expandable boards we find everywhere these days, like the
Beaglebone, Raspberry Pi or CHIP.

However, most of the time, the overlays are applied through a
mechanism involving the firmware request interface in Linux, that is
only fully functional once the userspace has been mounted and is
running.

Some expansion boards might need to be enabled before that, because
they simply need to patch the DT early on, or need to be initialized
early in order to be fully functional, or because they provide access
to the root filesystem.

In these cases, having the bootloader applying the overlay before
Linux starts seems like the easiest solution.

This implementation doesn't provide all the Linux fancyness though,
there's no transactional application, which means that if the overlay
cannot be applied for a reason while you're still halfway through the
application, you're probably screwed. It also cannot remove an
overlay, but I don't think that it is currently a use-case.

The libfdt patches has been sent upstream earlier today for review.

Let me know what you think,
Maxime

Changes from v1:
  - Moved the overlay code to libfdt
  - Added unit tests
  - Refactored the code to reduce the amount of memory allocation
  - No longer modify the overlay itself, but create a copy to operate
    on instead.
  - Removed the limitations on the fixups path, names and properties
    length
  - Fixed a few things here and there according to comments

Maxime Ripard (9):
  cmd: fdt: Narrow the check for fdt addr
  scripts: Makefile.lib: Sanitize DTB names
  vsprintf: Include stdarg for va_list
  libfdt: Add new headers and defines
  libfdt: Add iterator over properties
  libfdt: Add max phandle retrieval function
  libfdt: Add overlay application function
  cmd: fdt: add fdt overlay application subcommand
  tests: Introduce DT overlay tests

 Makefile                          |   1 +
 cmd/fdt.c                         |  22 +-
 include/libfdt.h                  |  67 ++++++
 include/libfdt_env.h              |   7 +
 include/test/overlay.h            |  16 ++
 include/test/suites.h             |   1 +
 include/vsprintf.h                |   2 +
 lib/libfdt/Makefile               |   2 +-
 lib/libfdt/fdt_overlay.c          | 414 ++++++++++++++++++++++++++++++++++++++
 lib/libfdt/fdt_ro.c               |  15 ++
 scripts/Makefile.lib              |   8 +-
 test/Kconfig                      |   1 +
 test/cmd_ut.c                     |   6 +
 test/overlay/Kconfig              |  10 +
 test/overlay/Makefile             |  15 ++
 test/overlay/cmd_ut_overlay.c     | 176 ++++++++++++++++
 test/overlay/test-fdt-base.dts    |  17 ++
 test/overlay/test-fdt-overlay.dts |  60 ++++++
 18 files changed, 834 insertions(+), 6 deletions(-)
 create mode 100644 include/test/overlay.h
 create mode 100644 lib/libfdt/fdt_overlay.c
 create mode 100644 test/overlay/Kconfig
 create mode 100644 test/overlay/Makefile
 create mode 100644 test/overlay/cmd_ut_overlay.c
 create mode 100644 test/overlay/test-fdt-base.dts
 create mode 100644 test/overlay/test-fdt-overlay.dts

-- 
2.8.2
