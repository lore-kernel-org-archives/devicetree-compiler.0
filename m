From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH v2 3/8] fdtget: Fix signedness comparisons warnings
Date: Fri, 11 Jun 2021 18:10:35 +0100
Message-ID: <20210611171040.25524-4-andre.przywara@arm.com>
References: <20210611171040.25524-1-andre.przywara@arm.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20210611171040.25524-1-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

With -Wsign-compare, compilers warn about a mismatching signedness in
the different legs of the conditional operator, in fdtget.c.

In the questionable expression, we are constructing a 16-bit value out of
two unsigned 8-bit values, however are relying on the compiler's
automatic expansion of the uint8_t to a larger type, to survive the left
shift. This larger type happens to be an "int", so this part of the
expression becomes signed.

Fix this by explicitly blowing up the uint8_t to a larger *unsigned* type,
before doing the left shift. And while we are at it, convert the hardly
readable conditional operator usage into a sane switch/case expression.

This fixes "make fdtget", when compiled with -Wsign-compare.

Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
---
 fdtget.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/fdtget.c b/fdtget.c
index 777582e..1f6eb73 100644
--- a/fdtget.c
+++ b/fdtget.c
@@ -62,8 +62,14 @@ static int show_cell_list(struct display_info *disp, const char *data, int len,
 	for (i = 0; i < len; i += size, p += size) {
 		if (i)
 			printf(" ");
-		value = size == 4 ? fdt32_ld((const fdt32_t *)p) :
-			size == 2 ? (*p << 8) | p[1] : *p;
+		switch (size) {
+		case 4: value = fdt32_ld((const fdt32_t *)p); break;
+		case 2: value = ((unsigned)(*p) << 8) | p[1]; break;
+		case 1:
+		default:
+			value = *p;
+			break;
+		}
 		printf(fmt, value);
 	}
 
-- 
2.17.5

