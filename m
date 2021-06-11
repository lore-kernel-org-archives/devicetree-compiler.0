From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH v2 2/8] fdtdump: Fix signedness comparisons warnings
Date: Fri, 11 Jun 2021 18:10:34 +0100
Message-ID: <20210611171040.25524-3-andre.przywara@arm.com>
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
comparisons in fdtdump.c.

The "len" parameter to valid_header() refers to a memory size, not a
file offset, so the (unsigned) size_t is better fit, and fixes the
warning nicely.

In the main function we compare the difference between two pointers,
which produces a signed ptrdiff_t type. However the while loop above the
comparison makes sure that "p" always points before "endp" (by virtue of
the limit in the memchr() call). This means "endp - p" is never
negative, so we can safely cast this expression to an unsigned type.

This fixes "make fdtdump", when compiled with -Wsign-compare.

Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
---
 fdtdump.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fdtdump.c b/fdtdump.c
index d9fb374..bdc0f94 100644
--- a/fdtdump.c
+++ b/fdtdump.c
@@ -18,7 +18,7 @@
 #include "util.h"
 
 #define FDT_MAGIC_SIZE	4
-#define MAX_VERSION 17
+#define MAX_VERSION 17U
 
 #define ALIGN(x, a)	(((x) + ((a) - 1)) & ~((a) - 1))
 #define PALIGN(p, a)	((void *)(ALIGN((unsigned long)(p), (a))))
@@ -163,7 +163,7 @@ static const char * const usage_opts_help[] = {
 	USAGE_COMMON_OPTS_HELP
 };
 
-static bool valid_header(char *p, off_t len)
+static bool valid_header(char *p, size_t len)
 {
 	if (len < sizeof(struct fdt_header) ||
 	    fdt_magic(p) != FDT_MAGIC ||
@@ -235,7 +235,7 @@ int main(int argc, char *argv[])
 			}
 			++p;
 		}
-		if (!p || endp - p < sizeof(struct fdt_header))
+		if (!p || (size_t)(endp - p) < sizeof(struct fdt_header))
 			die("%s: could not locate fdt magic\n", file);
 		printf("%s: found fdt at offset %#tx\n", file, p - buf);
 		buf = p;
-- 
2.17.5

