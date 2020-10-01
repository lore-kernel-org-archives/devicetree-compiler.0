From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH v2 0/6] libfdt: Fix signed/unsigned comparison warnings
Date: Thu,  1 Oct 2020 17:46:24 +0100
Message-ID: <20201001164630.4980-1-andre.przywara@arm.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Those are the six remaining patches of the initial post to fix the
C comparison warnings.
I reworked the fixes according to David's comments, and took quite a
different approach for some of them.
Changelog below.

The series is against https://github.com/dgibson/dtc/commits/main
------------------------------------

When libfdt is compiled with -Wsign-compare or -Wextra, GCC emits quite
some warnings about the signedness of the operands not matching:
=================
libfdt/fdt.c:140:18: error: comparison between signed and unsigned integer expressions [-Werror=sign-compare]
   if ((absoffset < offset)
.....
=================

This does not occur under normal conditions in the dtc repo, but might
show up when libfdt is embedded in another project. There have been reports
from U-Boot and Trusted-Firmware-A.

The underlying issue is mostly due to C's promotion behaviour (ANSI C
section 6.1.3.8) when dealing with operands of different signedness
(but same size): Signed values get implictly casted to unsigned, which
is not typically what we want if they could have been negative.

The Internet(TM) suggests that blindly applying casts is probably doing
more harm than it helps, so this series tries to fix the underlying
issues properly.
In libfdt, some types are somewhat suboptimal ("int bufsize" comes to mind);
some signed types are due to them being returned along wih error values in
other functions (node offsets).
So these fixes here have been based on the following assumptions:
- We cannot change the prototype of exported functions.
- It's better to change types (for local variables) than to cast.
- If we have established that a signed value is not negative, we can safely
  cast it to an unsigned type.

I split up the fixes in small chunks, to make them easier to review.

This is only covering libfdt for now (which is what those other projects
care about). There are more issues with dtc, but they can be addressed
later.

Please have a look, happy to discuss the invididual cases.

Cheers,
Andre

Changelog v1 .. v2:
- Omit the 8 patches that have already been applied.
- fdt_add_string_ (was 04/14): make every type unsigned; use subtractions
- fdt_move (was 05/14): add can_assume()
- fdt_create_with_flags (was 08/14): just make hdrsize signed
- libfdt_wip (was 10/14): drop redundant check for proplen being non-negative
- fdt_get_string (was 12/14): introduce unsigned variable (instead of casting)
- fdt_strerror (was 14/14): move int cast into FDT_ERRTABSIZE definition

Andre Przywara (6):
  libfdt: fdt_add_string_(): Fix comparison warning
  libfdt: fdt_move(): Fix comparison warnings
  libfdt: fdt_create_with_flags(): Fix comparison warning
  libfdt: libfdt_wip: Fix comparison warning
  libfdt: fdt_get_string(): Fix sequential write comparison warnings
  libfdt: fdt_strerror(): Fix comparison warning

 libfdt/fdt.c          |  5 ++++-
 libfdt/fdt_ro.c       | 10 ++++++----
 libfdt/fdt_strerror.c |  4 ++--
 libfdt/fdt_sw.c       | 18 +++++++++---------
 libfdt/fdt_wip.c      |  2 +-
 5 files changed, 22 insertions(+), 17 deletions(-)

-- 
2.17.5

