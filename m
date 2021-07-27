From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v3 0/5] Improve output type formatting
Date: Tue, 27 Jul 2021 12:30:18 -0600
Message-ID: <20210727183023.3212077-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

This series improves maintaining type information in the output of dtc
from sources without any type annotations such as dtb format. As there's
already a bunch of type information in the checks, we simply need to
have the checks add markers.

This is needed in part to be able to run DT schema validation on dtb
files. I also plan to use the schema files to provide type information
for all the properties not covered by the dtc checks. Why not do this
for all the properties? It's possible, but it wouldn't be possible with
just pure schema. The phandle+args patterns with variable cells would
need to recreate the same parsing code.

Rob

Rob Herring (5):
  Move marker functions to dtc.h
  Add has_type_markers() helper
  checks: Add markers on known properties
  dtc: Drop dts source restriction for yaml output
  treesource: Maintain phandle label/path on output

 checks.c                        | 87 +++++++++++++++++++++++++++++++--
 dtc.c                           |  2 -
 dtc.h                           | 28 ++++++++++-
 tests/type-preservation.dt.yaml |  3 ++
 tests/type-preservation.dts     |  3 ++
 treesource.c                    | 48 ++++++++----------
 6 files changed, 135 insertions(+), 36 deletions(-)

-- 
2.27.0

