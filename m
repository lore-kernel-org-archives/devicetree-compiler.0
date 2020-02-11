From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v6 0/8] libfdt: Allow more control of code size
Date: Tue, 11 Feb 2020 13:09:37 -0700
Message-ID: <20200211200945.46606-1-sjg@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6Gh6g+IoKM4Gn4lpmT/RJsL81swyOoCuR6XK6efwR1I=;
        b=a+A1WbydGwHunbxuZ/qolFMrymM6mdYUf4+yQHDhTz2e4F2Tycs2dWjAkWxPDAGUfY
         oIGWEXcfHdEjMBjc9G+gokkj4Dmjfgo5uU/ApiYoIXJJq9N0d52JQN84OQf1n+NTlf0V
         S7CUZSstpWWquOTLQFaz+S07gWbvTZRLnPDUk=
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>


Since v1.4.6 libfdt has gained a number of checks for incorrect
device-tree input and incorrect parameters. These are valuable and should
be enabled by default. Some are basic sanity checks and some are designed
to avoid security risks with carefully crafted device-tree input.

However the checks have added to code size to such an extent that many
U-Boot boards can no-longer build/boot in SPL. This has prevented recent
versions of libfdt from being used by U-Boot.

U-Boot SPL generally reads a device tree which has been set up by the
build system and is known to be correct (e.g. it may be cryptographically
signed by the build system). Therefore sanity checks in SPL should never
fail, and just contribute to longer run-time and larger code size.

During review of those patches[1] the code-size impact was discussed and
a possible solution was suggested.

This series adds a new ASSUME_MASK option, which allows for some control
over the checks used in libfdt. With all assumptions enabled, libfdt
assumes that the input data and parameters are all correct and that
internal errors cannot happen. This allows U-Boot SPL to continue to use
later versions of libfdt.

Within the code, preprocessor macros and an inline function are used which
resolve to true or false to control the use of checks in the code. This
seems better than using '#ifdefs' throughout the code. It also ensures
that all code is compiled regardless of which checks are enabled (useful
for build coverage).

This series reduces the size of libfdt by about 3KB on 64-bit x86
(about 6%) when all assumptions are enabled. Future work is planned to
reduce this further, but this is a good start. It enables U-Boot to move
to the latest libfdt.

Note: libfdt includes a number of assignments in conditional statements.
I have only changed these where necessary. It might be desirable to remove
them all, to reduce the output from checkpatch.pl.

Series available at https://github.com/sglass68/dtc/tree/small6

[1] https://www.spinics.net/lists/devicetree-compiler/msg02166.html

Changes in v6:
- Add a new patch to disable the ordering check and fixup
- Add an option to skip the ordering check
- Always call fdt_ro_probe_(), etc. and have that function do the check
- Change check in fdt_get_property_namelen_() to VALID_DTB
- Don't add VALID_INPUT to fdt_get_property_namelen_()
- Drop assumption in fdt_nodename_eq_()

Changes in v5:
- Include just VALID_INPUT checks in this patch
- Rename _can_assume() to can_assume_()
- Split SANE into VALID_DTB and VALID_INPUT
- Split out VALID_DTB checks into a separate patch
- Update comment for ASSUME_PERFECT to mention invalid parameters

Changes in v4:
- Add a can_assume() macros and squash the inline functions into one
- Add fdt_header_size to version.lds
- Drop unnecessary FDT_ prefix
- Fix 'Incosistencies' typo
- Merge the 'friendly' and 'sane' checks into one
- Update and expand comments

Changes in v3:
- Add a new patch to de-inline fdt_header_size()
- Expand the comments about each check option
- Fix 'santiy' typo
- Instead of excluding fdt_check_full() put it in its own file
- Invert the checks to be called assumptions
- Move header-version code to fdt.c
- Move the comments on check options to the enum
- Rearrange code in terms of checks instead of files changed, to aid review
- Replace 'unsigned' with 'unsigned int'
- Update commit message a little
- Use hex for CHK_MASK

Changes in v2:
- Add a comment to fdt_find_add_string_()
- Add an fdt_ prefix to avoid namespace conflicts
- Correct inverted version checks in a few cases
- Drop optimised code path in fdt_nodename_eq_()
- Update to use new check functions
- Use fdt_chk_base() in fdt_blocks_misordered_()
- Use symbolic names for _check functions and drop leading underscores

Simon Glass (8):
  libfdt: De-inline fdt_header_size()
  Add a way to control the level of checks in the code
  libfdt: Add support for disabling dtb checks
  libfdt: Add support for disabling sanity checks
  libfdt: Add support for disabling rollback handling
  libfdt: Add support for disabling version checks
  libfdt: Add support for disabling ordering check/fixup
  libfdt: Allow exclusion of fdt_check_full()

 Makefile                 |   6 +-
 libfdt/Makefile.libfdt   |   2 +-
 libfdt/fdt.c             | 100 +++++++++++++++++----------
 libfdt/fdt_check.c       |  74 ++++++++++++++++++++
 libfdt/fdt_ro.c          | 143 ++++++++++++++-------------------------
 libfdt/fdt_rw.c          |  29 ++++++--
 libfdt/fdt_sw.c          |  19 ++++--
 libfdt/libfdt.h          |   9 +--
 libfdt/libfdt_internal.h | 104 ++++++++++++++++++++++++++++
 libfdt/version.lds       |   1 +
 tests/testutils.c        |   1 -
 11 files changed, 338 insertions(+), 150 deletions(-)
 create mode 100644 libfdt/fdt_check.c

-- 
2.25.0.341.g760bfbb309-goog

