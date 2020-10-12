From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH] libfdt: Document sequential write mechanism
Date: Mon, 12 Oct 2020 17:38:01 +0100
Message-ID: <20201012163801.24730-1-andre.przywara@arm.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

When generating a flattened devicetree on the fly, we employ some clever
techniques to avoid excessive copying and adjustments of offset values.

To avoid people scratching their heads over all those negative string
offsets and weird magic values, let's document the nifty tricks we
pull here.

Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
---
Hi,

this is at least my understanding of how it works, by reading the code.
Please correct me (and the comment), should I have got something wrong.

Cheers,
Andre

 libfdt/fdt_sw.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/libfdt/fdt_sw.c b/libfdt/fdt_sw.c
index 68b543c..1f08a92 100644
--- a/libfdt/fdt_sw.c
+++ b/libfdt/fdt_sw.c
@@ -3,6 +3,32 @@
  * libfdt - Flat Device Tree manipulation
  * Copyright (C) 2006 David Gibson, IBM Corporation.
  */
+/**
+ * DOC: libfdt sequential write support
+ *
+ * When creating a flattened device tree on the fly, the fixed structure
+ * of a DTB would require constant adjustment of memory offsets, also copying
+ * of whole regions like the string table.
+ * To avoid this, we use an intermediate representation of a flattened tree,
+ * which needs to be finalised explicitly to create a spec-conformant DTB.
+ *
+ * This is achieved by the following means:
+ * - The magic in the header differs (FDT_SW_MAGIC), to identify such an
+ *   unfinished tree and to avoid it to be mistaken for a proper DTB, should
+ *   the fdt_finish() call have been missed.
+ * - The string table is located at the end of the allocated buffer, and
+ *   is growing *downwards*,  as new strings are *prepended*.
+ * - The string offsets in the dt_struct are expressed as negative offsets,
+ *   measured from the *end* of the string table. This allows offsets to
+ *   stay fixed, even when new strings are added (before the old ones).
+ * - The dt_struct is located at its usual place, but leaves room behind it,
+ *   to grow *upwards* towards the string table.
+ * - Upon finalising the DTB, all negative string offsets in dt_struct will
+ *   be adjusted, by adding the offset of the new end of the string table.
+ * - Eventually the final offset of all structures is written into the
+ *   header, and the magic will be changed to be the spec defined one.
+ */
+
 #include "libfdt_env.h"
 
 #include <fdt.h>
-- 
2.17.5

