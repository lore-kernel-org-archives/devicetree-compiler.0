From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 05/14] libfdt: fdt_move(): Fix comparison warnings
Date: Mon, 21 Sep 2020 17:52:54 +0100
Message-ID: <20200921165303.9115-6-andre.przywara@arm.com>
References: <20200921165303.9115-1-andre.przywara@arm.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200921165303.9115-1-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

With -Wsign-compare, compilers warn about a mismatching signedness
in comparisons in fdt_move().

This stems from "bufsize" being passed in as a signed integer, even
though we would expect a buffer size to be positive.

Short of changing the prototype, check that bufsize is not negative, and
cast it to an unsigned type in the comparison.

Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
---
 libfdt/fdt.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/libfdt/fdt.c b/libfdt/fdt.c
index 04e1e06..43aaada 100644
--- a/libfdt/fdt.c
+++ b/libfdt/fdt.c
@@ -314,9 +314,12 @@ const char *fdt_find_string_(const char *strtab, int tabsize, const char *s)
 
 int fdt_move(const void *fdt, void *buf, int bufsize)
 {
+	if (bufsize < 0)
+		return -FDT_ERR_NOSPACE;
+
 	FDT_RO_PROBE(fdt);
 
-	if (fdt_totalsize(fdt) > bufsize)
+	if (fdt_totalsize(fdt) > (unsigned int)bufsize)
 		return -FDT_ERR_NOSPACE;
 
 	memmove(buf, fdt, fdt_totalsize(fdt));
-- 
2.17.5

