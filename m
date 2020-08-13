From: Frank Mehnert <frank.mehnert-2ptZNfhJYoRaodhZ+FW2PA@public.gmane.org>
Subject: Re: [PATCH] libfdt: fix fdt_check_node_offset_ w/ VALID_INPUT
Date: Thu, 13 Aug 2020 17:26:26 +0200
Message-ID: <1913141.TlUzK5foHS@noys4>
References: <76064614.bJBAheWMra@noys4> <20200813095108.GA181791@yekko.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200813095108.GA181791-l+x2Y8Cxqc4e6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

fdt_check_node_offset_() checks for a valid offset but also changes the
offset by calling fdt_next_tag(). Hence, do not skip this function if
ASSUME_VALID_INPUT is set but only omit the initial offset check in that
case.

As this function works very similar to fdt_check_prop_offset_(), do the
offset check there as well depending on ASSUME_VALID_INPUT.
---
 libfdt/fdt.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/libfdt/fdt.c b/libfdt/fdt.c
index c28fcc1..37b7b93 100644
--- a/libfdt/fdt.c
+++ b/libfdt/fdt.c
@@ -206,10 +206,11 @@ uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)

 int fdt_check_node_offset_(const void *fdt, int offset)
 {
-       if (can_assume(VALID_INPUT))
-               return offset;
-       if ((offset < 0) || (offset % FDT_TAGSIZE)
-           || (fdt_next_tag(fdt, offset, &offset) != FDT_BEGIN_NODE))
+       if (!can_assume(VALID_INPUT)
+           && ((offset < 0) || (offset % FDT_TAGSIZE)))
+               return -FDT_ERR_BADOFFSET;
+
+       if (fdt_next_tag(fdt, offset, &offset) != FDT_BEGIN_NODE)
                return -FDT_ERR_BADOFFSET;

        return offset;
@@ -217,8 +218,11 @@ int fdt_check_node_offset_(const void *fdt, int offset)

 int fdt_check_prop_offset_(const void *fdt, int offset)
 {
-       if ((offset < 0) || (offset % FDT_TAGSIZE)
-           || (fdt_next_tag(fdt, offset, &offset) != FDT_PROP))
+       if (!can_assume(VALID_INPUT)
+           && ((offset < 0) || (offset % FDT_TAGSIZE)))
+               return -FDT_ERR_BADOFFSET;
+
+       if (fdt_next_tag(fdt, offset, &offset) != FDT_PROP)
                return -FDT_ERR_BADOFFSET;

        return offset;
