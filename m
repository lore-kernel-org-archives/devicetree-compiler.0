From: Frank Mehnert <frank.mehnert-2ptZNfhJYoRaodhZ+FW2PA@public.gmane.org>
Subject: [PATCH] libfdt: fix fdt_check_node_offset_ w/ VALID_INPUT
Date: Thu, 13 Aug 2020 09:55:09 +0200
Message-ID: <76064614.bJBAheWMra@noys4>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

fdt_check_node_offset_() checks for a valid offset but also changes the
offset by calling fdt_next_tag(). Hence, do not skip this function if
ASSUME_VALID_INPUT is set.

Actually this works similar to fdt_check_prop_offset_().
---
 libfdt/fdt.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/libfdt/fdt.c b/libfdt/fdt.c
index c28fcc1..39ed8ed 100644
--- a/libfdt/fdt.c
+++ b/libfdt/fdt.c
@@ -206,8 +206,6 @@ uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)

 int fdt_check_node_offset_(const void *fdt, int offset)
 {
-       if (can_assume(VALID_INPUT))
-               return offset;
        if ((offset < 0) || (offset % FDT_TAGSIZE)
            || (fdt_next_tag(fdt, offset, &offset) != FDT_BEGIN_NODE))
                return -FDT_ERR_BADOFFSET;
