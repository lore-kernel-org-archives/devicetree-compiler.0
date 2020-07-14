From: Andrei Ziureaev <andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH v2 1/6] dtc: Avoid UB when shifting
Date: Tue, 14 Jul 2020 16:45:37 +0100
Message-ID: <20200714154542.18064-2-andrei.ziureaev@arm.com>
References: <20200714154542.18064-1-andrei.ziureaev@arm.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200714154542.18064-1-andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Prevent undefined behavior when shifting by a number that's bigger than
or equal to the width of the first operand.

Signed-off-by: Andrei Ziureaev <andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>
---
 dtc-parser.y | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index 40dcf4f..a0316a3 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -476,8 +476,8 @@ integer_rela:
 	;
 
 integer_shift:
-	  integer_shift DT_LSHIFT integer_add { $$ = $1 << $3; }
-	| integer_shift DT_RSHIFT integer_add { $$ = $1 >> $3; }
+	  integer_shift DT_LSHIFT integer_add { $$ = ($3 < 64) ? ($1 << $3) : 0; }
+	| integer_shift DT_RSHIFT integer_add { $$ = ($3 < 64) ? ($1 >> $3) : 0; }
 	| integer_add
 	;
 
-- 
2.17.1

