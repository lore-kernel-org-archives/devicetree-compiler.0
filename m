From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH v2 6/6] libfdt: fdt_strerror(): Fix comparison warning
Date: Thu,  1 Oct 2020 17:46:30 +0100
Message-ID: <20201001164630.4980-7-andre.przywara@arm.com>
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
in a comparison in fdt_strerror().

Force FDT_ERRTABSIZE to be signed (it's surely small enough to fit), so
that the types match. Also move the minus sign to errval, as this is
actually what we use in the next line.

Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
---
 libfdt/fdt_strerror.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/libfdt/fdt_strerror.c b/libfdt/fdt_strerror.c
index 768db66..b435693 100644
--- a/libfdt/fdt_strerror.c
+++ b/libfdt/fdt_strerror.c
@@ -40,7 +40,7 @@ static struct fdt_errtabent fdt_errtable[] = {
 	FDT_ERRTABENT(FDT_ERR_NOPHANDLES),
 	FDT_ERRTABENT(FDT_ERR_BADFLAGS),
 };
-#define FDT_ERRTABSIZE	(sizeof(fdt_errtable) / sizeof(fdt_errtable[0]))
+#define FDT_ERRTABSIZE	((int)(sizeof(fdt_errtable) / sizeof(fdt_errtable[0])))
 
 const char *fdt_strerror(int errval)
 {
@@ -48,7 +48,7 @@ const char *fdt_strerror(int errval)
 		return "<valid offset/length>";
 	else if (errval == 0)
 		return "<no error>";
-	else if (errval > -FDT_ERRTABSIZE) {
+	else if (-errval < FDT_ERRTABSIZE) {
 		const char *s = fdt_errtable[-errval].str;
 
 		if (s)
-- 
2.17.5

