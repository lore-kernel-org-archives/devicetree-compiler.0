From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 04/11] fdtget: Fix signedness comparisons warnings
Date: Mon, 12 Oct 2020 17:19:41 +0100
Message-ID: <20201012161948.23994-5-andre.przywara@arm.com>
References: <20201012161948.23994-1-andre.przywara@arm.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20201012161948.23994-1-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

With -Wsign-compare, compilers warn about a mismatching signedness in
the different legs of the conditional operator, in fdtget.c.

In the questionable expression, we are constructing a 16-bit value out of
two unsigned 8-bit values, however are relying on the compiler's
automatic expansion of the uint8_t to a larger type, to survive the left
shift. This larger type happens to be an "int", so this part of the
expression becomes signed.

Fix this by explicitly blow up the uint8_t to a larger *unsigned* type,
before doing the left shift. That keeps all parts of the conditional
operator "unsigned", and prevents the original warning.

This fixes "make fdtget", when compiled with -Wsign-compare.

Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
---
 fdtget.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fdtget.c b/fdtget.c
index 777582e..c5685d9 100644
--- a/fdtget.c
+++ b/fdtget.c
@@ -62,8 +62,8 @@ static int show_cell_list(struct display_info *disp, const char *data, int len,
 	for (i = 0; i < len; i += size, p += size) {
 		if (i)
 			printf(" ");
-		value = size == 4 ? fdt32_ld((const fdt32_t *)p) :
-			size == 2 ? (*p << 8) | p[1] : *p;
+		value = (size == 4) ? fdt32_ld((const fdt32_t *)p) :
+			((size == 2) ? ((unsigned)(*p) << 8) | p[1] : *p);
 		printf(fmt, value);
 	}
 
-- 
2.17.5

