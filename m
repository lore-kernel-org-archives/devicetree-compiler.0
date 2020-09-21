From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 04/14] libfdt: fdt_add_string_(): Fix comparison warning
Date: Mon, 21 Sep 2020 17:52:53 +0100
Message-ID: <20200921165303.9115-5-andre.przywara@arm.com>
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
in a comparison in fdt_add_string_().

As struct_top can only be positive, just use an unsigned type for it,
and avoid the signedness difference.

Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
---
 libfdt/fdt_sw.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/libfdt/fdt_sw.c b/libfdt/fdt_sw.c
index d10a720..d65e9c8 100644
--- a/libfdt/fdt_sw.c
+++ b/libfdt/fdt_sw.c
@@ -249,7 +249,8 @@ static int fdt_add_string_(void *fdt, const char *s)
 	char *strtab = (char *)fdt + fdt_totalsize(fdt);
 	int strtabsize = fdt_size_dt_strings(fdt);
 	int len = strlen(s) + 1;
-	int struct_top, offset;
+	unsigned int struct_top;
+	int offset;
 
 	offset = -strtabsize - len;
 	struct_top = fdt_off_dt_struct(fdt) + fdt_size_dt_struct(fdt);
-- 
2.17.5

