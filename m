From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 02/11] convert-dtsv0: Fix signedness comparisons warning
Date: Mon, 12 Oct 2020 17:19:39 +0100
Message-ID: <20201012161948.23994-3-andre.przywara@arm.com>
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
comparisons in the generated lexer code.

In this case we walk over an array, and never use negative indicies, so
we can change the loop counter variable to be unsigned.

This fixes "make convert-dtsv0", when compiled with -Wsign-compare.

Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
---
 convert-dtsv0-lexer.l | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/convert-dtsv0-lexer.l b/convert-dtsv0-lexer.l
index f52e8a1..7a66f57 100644
--- a/convert-dtsv0-lexer.l
+++ b/convert-dtsv0-lexer.l
@@ -94,7 +94,7 @@ static const struct {
 <INITIAL>[0-9a-fA-F]+	{
 			unsigned long long val;
 			int obase = 16, width = 0;
-			int i;
+			unsigned int i;
 
 			val = strtoull(yytext, NULL, cbase);
 
-- 
2.17.5

