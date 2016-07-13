From: Jean-Christophe Dubois <jcd-WBS85hRCVJbxB9160cZjhg@public.gmane.org>
Subject: [PATCH] fdtdump.c: make sure size_t argument to memchr is always unsigned.
Date: Wed, 13 Jul 2016 02:04:30 +0200
Message-ID: <1468368270-2690-1-git-send-email-jcd@tribudubois.net>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, jdl-CYoMK+44s/E@public.gmane.org
Cc: Jean-Christophe Dubois <jcd-WBS85hRCVJbxB9160cZjhg@public.gmane.org>

CID 132817 (#1 of 1): Integer overflowed argument (INTEGER_OVERFLOW)
15. overflow_sink: Overflowed or truncated value (or a value computed from an overflowed or truncated value) endp - p - 4L used as critical argument to function.

Signed-off-by: Jean-Christophe Dubois <jcd-WBS85hRCVJbxB9160cZjhg@public.gmane.org>
---
 fdtdump.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/fdtdump.c b/fdtdump.c
index 95a6a20..be5584b 100644
--- a/fdtdump.c
+++ b/fdtdump.c
@@ -15,6 +15,8 @@
 
 #include "util.h"
 
+#define FDT_MAGIC_SIZE	4
+
 #define ALIGN(x, a)	(((x) + ((a) - 1)) & ~((a) - 1))
 #define PALIGN(p, a)	((void *)(ALIGN((unsigned long)(p), (a))))
 #define GET_CELL(p)	(p += 4, *((const uint32_t *)(p-4)))
@@ -188,15 +190,15 @@ int main(int argc, char *argv[])
 
 	/* try and locate an embedded fdt in a bigger blob */
 	if (scan) {
-		unsigned char smagic[4];
+		unsigned char smagic[FDT_MAGIC_SIZE];
 		char *p = buf;
 		char *endp = buf + len;
 
 		fdt_set_magic(smagic, FDT_MAGIC);
 
 		/* poor man's memmem */
-		while (true) {
-			p = memchr(p, smagic[0], endp - p - 4);
+		while ((endp - p) >= FDT_MAGIC_SIZE) {
+			p = memchr(p, smagic[0], endp - p - FDT_MAGIC_SIZE);
 			if (!p)
 				break;
 			if (fdt_magic(p) == FDT_MAGIC) {
-- 
2.7.4
