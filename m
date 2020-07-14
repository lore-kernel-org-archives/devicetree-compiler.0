From: Andrei Ziureaev <andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH v2 0/6] dtc: Add support for signed operations
Date: Tue, 14 Jul 2020 16:45:36 +0100
Message-ID: <20200714154542.18064-1-andrei.ziureaev@arm.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Following the discussion on v1, I decided to add proper support for all
signed operations.

The first two patches can be useful on their own.

Patches 3/6 to 6/6 add support for signed operations and sign
preservation in high-level output formats.

All operators are supported, which means some of them will behave
differently with negative values, namely: /, %, >>, <, <=, >, >=. I
haven't found any existing dts files using these operators with negative
values.

There is no explicit signed type in the dts format, but the idea is to
infer the sign as intuitively as possible: negative values are signed,
positive values are unsigned. Zero can be either, so the output side
checks for that. I haven't given much thought to overflows, but they
happen to be handled well, I think (at least UB in C is prevented).

This change allows us to validate dts files that contain negative
values. One could argue that (-1 == 0xffffffff), so there's no point in
doing this, but dt-schema is written in Python 3, which uses
arbitrary-precision arithmetic and doesn't have the traditional
overflowing types. This makes it hard to solve this problem in dt-schema
(especially checking if a signed value is within a range, I think).

Thanks,
Andrei.

Changes in v2:
- avoid UB when shifting
- add a bytestring type
- add support for all the operators
- use TYPE_SIGNED, instead of TYPE_NEGATIVE
- use macros on the output side
- add more tests

Andrei Ziureaev (6):
  dtc: Avoid UB when shifting
  dtc: Add bytestring type
  dtc: Turn 'uint64_t integer' into a struct
  dtc: Add support for signed operations
  dtc: Preserve negative integers in yaml and dts
  dtc: Add sign preservation and operation tests

 dtc-lexer.l                     |  10 +-
 dtc-parser.y                    | 190 ++++++++++++++++++++++++++------
 dtc.h                           |  14 +++
 tests/integer-expressions.c     |   8 ++
 tests/operations-expected.dts   |  31 ++++++
 tests/operations.dt.yaml        |  29 +++++
 tests/operations.dts            |  38 +++++++
 tests/run_tests.sh              |  13 ++-
 tests/sign-preservation.dt.yaml |  23 ++++
 tests/sign-preservation.dts     |  31 ++++++
 tests/type-preservation.dt.yaml |   2 +
 tests/type-preservation.dts     |   6 +-
 treesource.c                    |  47 +++++---
 yamltree.c                      |  27 ++---
 14 files changed, 399 insertions(+), 70 deletions(-)
 create mode 100644 tests/operations-expected.dts
 create mode 100644 tests/operations.dt.yaml
 create mode 100644 tests/operations.dts
 create mode 100644 tests/sign-preservation.dt.yaml
 create mode 100644 tests/sign-preservation.dts

-- 
2.17.1

