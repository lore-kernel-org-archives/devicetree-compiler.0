From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 01/14] libfdt: fdt_offset_ptr(): Fix comparison warnings
Date: Mon, 21 Sep 2020 17:52:50 +0100
Message-ID: <20200921165303.9115-2-andre.przywara@arm.com>
References: <20200921165303.9115-1-andre.przywara@arm.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200921165303.9115-1-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

With -Wsign-compare, compilers warn about mismatching signedness in
comparisons in fdt_offset_ptr().

This mostly stems from "offset" being passed in as a signed integer,
even though the function would not really tolerate negative values.

Short of changing the prototype, check that offset is not negative, and
use an unsigned type internally.

Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
---
 libfdt/fdt.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/libfdt/fdt.c b/libfdt/fdt.c
index 37b7b93..04e1e06 100644
--- a/libfdt/fdt.c
+++ b/libfdt/fdt.c
@@ -134,16 +134,20 @@ int fdt_check_header(const void *fdt)
 
 const void *fdt_offset_ptr(const void *fdt, int offset, unsigned int len)
 {
-	unsigned absoffset = offset + fdt_off_dt_struct(fdt);
+	unsigned int uoffset = offset;
+	unsigned int absoffset = offset + fdt_off_dt_struct(fdt);
+
+	if (offset < 0)
+		return NULL;
 
 	if (!can_assume(VALID_INPUT))
-		if ((absoffset < offset)
+		if ((absoffset < uoffset)
 		    || ((absoffset + len) < absoffset)
 		    || (absoffset + len) > fdt_totalsize(fdt))
 			return NULL;
 
 	if (can_assume(LATEST) || fdt_version(fdt) >= 0x11)
-		if (((offset + len) < offset)
+		if (((uoffset + len) < uoffset)
 		    || ((offset + len) > fdt_size_dt_struct(fdt)))
 			return NULL;
 
-- 
2.17.5

