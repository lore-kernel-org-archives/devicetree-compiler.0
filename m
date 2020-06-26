From: Andrei Ziureaev <andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 0/3] dtc: Preserve negative integers in yaml and dts output
Date: Fri, 26 Jun 2020 17:25:25 +0100
Message-ID: <20200626162528.2129-1-andrei.ziureaev@arm.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Currently, in yaml output, negative values are indistinguishable from
positive ones. Some bindings (for example
Documentation/devicetree/bindings/iio/accel/lis302.txt) mention negative
values. If those binding are converted to yaml, dt-schema validation
wouldn't work with them.

The first patch is a mechanical change and shouldn't affect dtc's
behaviour.

The second one is the functional change. When applied, dts to dts and
dts to yaml conversions preserve the '-' sign in front of integers.

For now, in dts parsing, only the unary '-' operator creates negative
values (the other operators just set the 'is_negative' flag to false),
but it should be easy to add support for other operators if needed.

One issue is that there are two ways to format an array of bytes in dts:
'/bits/ 8 <...>' and '[...]'. Only the former supports negative
integers. But, in dts output, only the latter is used. Therefore, I
didn't include support for negative 8-bit values in dts output (I did
add support for them in yaml output). Some possible alternatives are:

- switch to the '/bits/ 8 <>' format in dts output

- only switch to the '/bits/ 8 <>' format if the array contains negative
  values

- add another marker to differentiate between the two formats

Thanks,
Andrei.

Andrei Ziureaev (3):
  dtc: Turn 'uint64_t integer' into a struct
  dtc: Preserve negative integers in yaml and dts output
  dtc: Add sign preservation tests

 dtc-lexer.l                           |  10 +-
 dtc-parser.y                          | 132 +++++++++++++++++++-------
 dtc.h                                 |  14 +++
 tests/run_tests.sh                    |   4 +-
 tests/sign-preservation-bytes.dt.yaml |   5 +
 tests/sign-preservation-bytes.dts     |   7 ++
 tests/sign-preservation.dt.yaml       |  20 ++++
 tests/sign-preservation.dts           |  28 ++++++
 treesource.c                          |  35 +++++--
 yamltree.c                            |  32 ++++---
 10 files changed, 225 insertions(+), 62 deletions(-)
 create mode 100644 tests/sign-preservation-bytes.dt.yaml
 create mode 100644 tests/sign-preservation-bytes.dts
 create mode 100644 tests/sign-preservation.dt.yaml
 create mode 100644 tests/sign-preservation.dts

-- 
2.17.1

