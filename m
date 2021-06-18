From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH v3 0/5] dtc: Fix signed/unsigned comparison warnings
Date: Fri, 18 Jun 2021 18:20:25 +0100
Message-ID: <20210618172030.9684-1-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Hi,

trying to fix the remaining comments from David:

Changelog v2 .. v3:
- dropped 2/8, 5/8 and 6/8, which are already merged
- replace fdt_is_valid_phandle() with phandle_is_valid()
- use cell_t instead of unsigned, where appropriate
- replace cumbersome statement with fdt16_ld()
- avoid masking errors in overlay tests
- check for "len" being non-negative in check_set_name()

Changelog v1 .. v2:
- dropped 2/11, 6/11 and 8/11, which are already merged
- tests: add explicit tests for negative len values
- use size_t instead of "unsigned int", where appropriate
- fdtget: expand hard-to-read conditional operator into switch/case
- dtc: use static inline fdt_is_valid_phandle() instead of macro
- use strtoul() to parse unsigned value

-----------------------

When dtc and the other tools in the tree are compiled with -Wsign-compare
or -Wextra, GCC emits quite some warnings about the signedness of the
operands not matching:
=================
In file included from dtc.h:15:0,
                 from checks.c:6:
checks.c: In function ‘fixup_phandle_references’:
checks.c:591:38: error: comparison between signed and unsigned integer
expressions [-Werror=sign-compare]
    assert(m->offset + sizeof(cell_t) <= prop->val.len);
.....
=================

libfdt has just been fixed in this regard recently; this adds the missing
bits to cover the rest of the source tree, namely dtc, the various smaller
tools, checks, and tests.

Those warnings do not show under normal conditions in the dtc repo at the
moment, because we avoid to enable the warning option.

The underlying issue is mostly due to C's promotion behaviour (ANSI C
section 6.1.3.8) when dealing with operands of different signedness
(but same size): Signed values get implictly casted to unsigned, which
is not typically what we want if they could have been negative.

The Internet(TM) suggests that blindly applying casts is probably doing
more harm than it helps, so this series tries to fix the underlying
issues properly.
Many types in dtc are somewhat suboptimal, they hold a size (which should
be non-negative), but are "int" anyway. Loop counters just declared as
"int i;" are another frequent issue.

The main strategy to fix those issues is to make the types right, which
mostly means to make variables "unsigned".
If that is not easily possible, we cast the signed expression to
"unsigned", provided this is safe, because it cannot be negative.

This series gathers multiple similar fixes in one patch, splitting them
mostly by the tool or source file. This is just to simplify review, the
patches could also be merged later on.

I tried to put some rationale in most of the patches, but explaining
every single instance becomes really tedious (so some patches paper over
that).

The final patch eventually enables the warning option in question, that
should avoid those kind of errors creeping back in again.

Compile tested with "make clean && make all tests check", after every
patch, on x86-64 and arm64.

Please have a look, happy to discuss the invididual cases.

Cheers,
Andre

Andre Przywara (5):
  tests: Fix signedness comparisons warnings
  fdtget: Fix signedness comparisons warnings
  dtc: Wrap phandle validity check
  checks: Fix signedness comparisons warnings
  Makefile: add -Wsign-compare to warning options

 Makefile                    |  2 +-
 checks.c                    | 30 +++++++++++++++---------------
 dtc.h                       |  5 +++++
 fdtget.c                    | 10 ++++++++--
 libfdt/libfdt.h             |  7 +++++++
 livetree.c                  |  4 ++--
 tests/dumptrees.c           |  2 +-
 tests/fs_tree1.c            |  2 +-
 tests/get_name.c            |  4 +++-
 tests/integer-expressions.c |  2 +-
 tests/nopulate.c            |  3 ++-
 tests/overlay.c             |  6 +++++-
 tests/phandle_format.c      |  2 +-
 tests/property_iterate.c    |  2 +-
 tests/references.c          |  2 +-
 tests/set_name.c            | 10 ++++++++--
 tests/subnode_iterate.c     |  2 +-
 tests/tests.h               |  2 +-
 tests/testutils.c           | 12 +++++++++---
 19 files changed, 73 insertions(+), 36 deletions(-)

-- 
2.17.5

