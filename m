From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH v2 1/6] libfdt: fdt_add_string_(): Fix comparison warning
Date: Thu,  1 Oct 2020 17:46:25 +0100
Message-ID: <20201001164630.4980-2-andre.przywara@arm.com>
References: <20201001164630.4980-1-andre.przywara@arm.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20201001164630.4980-1-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

With -Wsign-compare, compilers warn about a mismatching signedness
in a comparison in fdt_add_string_().

Make all variables unsigned, and express the negative offset trick via
subtractions in the code.

Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
---
 libfdt/fdt_sw.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/libfdt/fdt_sw.c b/libfdt/fdt_sw.c
index 8de18fd..354f466 100644
--- a/libfdt/fdt_sw.c
+++ b/libfdt/fdt_sw.c
@@ -250,18 +250,18 @@ int fdt_end_node(void *fdt)
 static int fdt_add_string_(void *fdt, const char *s)
 {
 	char *strtab = (char *)fdt + fdt_totalsize(fdt);
-	int strtabsize = fdt_size_dt_strings(fdt);
-	int len = strlen(s) + 1;
-	int struct_top, offset;
+	unsigned int strtabsize = fdt_size_dt_strings(fdt);
+	unsigned int len = strlen(s) + 1;
+	unsigned int struct_top, offset;
 
-	offset = -strtabsize - len;
+	offset = strtabsize + len;
 	struct_top = fdt_off_dt_struct(fdt) + fdt_size_dt_struct(fdt);
-	if (fdt_totalsize(fdt) + offset < struct_top)
+	if (fdt_totalsize(fdt) - offset < struct_top)
 		return 0; /* no more room :( */
 
-	memcpy(strtab + offset, s, len);
+	memcpy(strtab - offset, s, len);
 	fdt_set_size_dt_strings(fdt, strtabsize + len);
-	return offset;
+	return -offset;
 }
 
 /* Must only be used to roll back in case of error */
-- 
2.17.5

