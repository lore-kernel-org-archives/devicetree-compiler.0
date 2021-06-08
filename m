From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 0/3] Improve output type formatting
Date: Tue,  8 Jun 2021 15:46:23 -0500
Message-ID: <20210608204626.1545418-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

This series improves maintaining type information in the output of dtc
from sources without any type annotations such as dtb format. It also
makes the output formatting less dependent on the input source
bracketing. As there's already a bunch of type information in the
checks, we simply need to have the checks add markers.

This is needed in part to be able to run DT schema validation on dtb
files. I also plan to use the schema files to provide type information
for all the properties not covered by the dtc checks. Why not do this
for all the properties? It's possible, but it wouldn't be possible with
just pure schema. The phandle+args patterns with variable cells would
need to recreate the same parsing code.

Rob

Rob Herring (3):
  checks: Add markers on known properties
  dtc: Drop dts source restriction for yaml output
  treesource: Maintain phandle label/path on output

 checks.c     | 102 +++++++++++++++++++++++++++++++++++++++++----------
 dtc.c        |   2 -
 treesource.c |  23 ++++++++++--
 3 files changed, 101 insertions(+), 26 deletions(-)

-- 
2.27.0

