From: Andrei Ziureaev <andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH v2 4/6] dtc: Add support for signed operations
Date: Tue, 14 Jul 2020 16:45:40 +0100
Message-ID: <20200714154542.18064-5-andrei.ziureaev@arm.com>
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

Add support for signed operations, including division, modulo, right
shift and comparisons. Signed values are "created" by the negation and
subtraction operators and preserved by other operators as long as the
value stays negative. Therefore "negative" and "signed" are the same
thing in this case. Bitwise operators always return unsigned values.

This is useful for validation with dt-schema, which uses
arbitrary-precision arithmetic and needs explicit information about the
sign.

The TYPE_SIGNED marker can be used by yaml and dts emitters and, if a
plugin interface is added, by plugins.

Signed-off-by: Andrei Ziureaev <andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>
---
 dtc-parser.y                | 81 ++++++++++++++++++++++++++++++++-----
 dtc.h                       |  2 +
 tests/integer-expressions.c |  8 ++++
 3 files changed, 81 insertions(+), 10 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index 3bc1aca..a7c1777 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -381,6 +381,8 @@ arrayprefix:
 		}
 	| arrayprefix integer_prim
 		{
+			struct data data = $1.data;
+
 			if ($1.bits < 64) {
 				uint64_t mask = (1ULL << $1.bits) - 1;
 				/*
@@ -396,7 +398,10 @@ arrayprefix:
 					      " %d-bit array element", $1.bits);
 			}
 
-			$$.data = data_append_integer($1.data, $2.ull, $1.bits);
+			if ($2.is_negative)
+				data = data_add_marker(data, TYPE_SIGNED, NULL);
+
+			$$.data = data_append_integer(data, $2.ull, $1.bits);
 		}
 	| arrayprefix dt_ref
 		{
@@ -492,19 +497,31 @@ integer_rela:
 	  integer_shift
 	| integer_rela '<' integer_shift
 		{
-			$$ = (struct integer){ $1.ull < $3.ull };
+			if ($1.is_negative || $3.is_negative)
+				$$ = (struct integer){ (int64_t)$1.ull < (int64_t)$3.ull };
+			else
+				$$ = (struct integer){ $1.ull < $3.ull };
 		}
 	| integer_rela '>' integer_shift
 		{
-			$$ = (struct integer){ $1.ull > $3.ull };
+			if ($1.is_negative || $3.is_negative)
+				$$ = (struct integer){ (int64_t)$1.ull > (int64_t)$3.ull };
+			else
+				$$ = (struct integer){ $1.ull > $3.ull };
 		}
 	| integer_rela DT_LE integer_shift
 		{
-			$$ = (struct integer){ $1.ull <= $3.ull };
+			if ($1.is_negative || $3.is_negative)
+				$$ = (struct integer){ (int64_t)$1.ull <= (int64_t)$3.ull };
+			else
+				$$ = (struct integer){ $1.ull <= $3.ull };
 		}
 	| integer_rela DT_GE integer_shift
 		{
-			$$ = (struct integer){ $1.ull >= $3.ull };
+			if ($1.is_negative || $3.is_negative)
+				$$ = (struct integer){ (int64_t)$1.ull >= (int64_t)$3.ull };
+			else
+				$$ = (struct integer){ $1.ull >= $3.ull };
 		}
 	;
 
@@ -515,7 +532,13 @@ integer_shift:
 		}
 	| integer_shift DT_RSHIFT integer_add
 		{
-			$$ = (struct integer){ ($3.ull < 64) ? ($1.ull >> $3.ull) : 0 };
+			if ($3.ull < 64)
+				if ($1.is_negative)
+					$$ = (struct integer){ (int64_t)$1.ull >> $3.ull };
+				else
+					$$ = (struct integer){ $1.ull >> $3.ull };
+			else
+				$$ = (struct integer){ $1.is_negative ? ~0ULL : 0 };
 		}
 	| integer_add
 	;
@@ -524,10 +547,20 @@ integer_add:
 	  integer_add '+' integer_mul
 		{
 			$$ = (struct integer){ $1.ull + $3.ull };
+
+			if ($1.is_negative == $3.is_negative)
+				$$.is_negative = $1.is_negative;
+			else
+				$$.is_negative = $1.ull < -$3.ull;
 		}
 	| integer_add '-' integer_mul
 		{
 			$$ = (struct integer){ $1.ull - $3.ull };
+
+			if ($1.is_negative != $3.is_negative)
+				$$.is_negative = $1.is_negative;
+			else
+				$$.is_negative = $1.ull < $3.ull;
 		}
 	| integer_mul
 	;
@@ -535,12 +568,29 @@ integer_add:
 integer_mul:
 	  integer_mul '*' integer_unary
 		{
-			$$ = (struct integer){ $1.ull * $3.ull };
+			/* For our purpose, signed multiplication is the same as
+			 * unsigned multiplication */
+			$$ = (struct integer){
+				$1.ull * $3.ull,
+				$1.is_negative != $3.is_negative
+			};
 		}
 	| integer_mul '/' integer_unary
 		{
 			if ($3.ull != 0) {
-				$$ = (struct integer){ $1.ull / $3.ull };
+				if ($1.is_negative || $3.is_negative) {
+					/* Prevent UB in signed division */
+					if (($1.ull == (1ULL << 63)) && ($3.ull == ~0ULL))
+						$$ = (struct integer){ $1.ull };
+					else
+						$$ = (struct integer){
+							(int64_t)$1.ull / (int64_t)$3.ull
+						};
+
+					$$.is_negative = $1.is_negative != $3.is_negative;
+				} else {
+					$$ = (struct integer){ $1.ull / $3.ull };
+				}
 			} else {
 				ERROR(&@$, "Division by zero");
 				$$ = (struct integer){ 0 };
@@ -549,7 +599,18 @@ integer_mul:
 	| integer_mul '%' integer_unary
 		{
 			if ($3.ull != 0) {
-			$$ = (struct integer){ $1.ull % $3.ull };
+				if ($1.is_negative || $3.is_negative) {
+					if (($1.ull == (1ULL << 63)) && ($3.ull == ~0ULL))
+						$$ = (struct integer){ 0 };
+					else
+						$$ = (struct integer){
+							(int64_t)$1.ull % (int64_t)$3.ull
+						};
+
+					$$.is_negative = $1.is_negative;
+				} else {
+					$$ = (struct integer){ $1.ull % $3.ull };
+				}
 			} else {
 				ERROR(&@$, "Division by zero");
 				$$ = (struct integer){ 0 };
@@ -562,7 +623,7 @@ integer_unary:
 	  integer_prim
 	| '-' integer_unary
 		{
-			$$ = (struct integer){ -$2.ull };
+			$$ = (struct integer){ -$2.ull, !$2.is_negative };
 		}
 	| '~' integer_unary
 		{
diff --git a/dtc.h b/dtc.h
index ccfe689..a502bef 100644
--- a/dtc.h
+++ b/dtc.h
@@ -95,6 +95,7 @@ enum markertype {
 	REF_PHANDLE,
 	REF_PATH,
 	LABEL,
+	TYPE_SIGNED,
 	TYPE_UINT8,
 	TYPE_UINT16,
 	TYPE_UINT32,
@@ -119,6 +120,7 @@ struct data {
 
 struct integer {
 	uint64_t ull;
+	bool is_negative;
 };
 
 #define empty_data ((struct data){ 0 /* all .members = 0 or NULL */ })
diff --git a/tests/integer-expressions.c b/tests/integer-expressions.c
index 6f33d81..041efb0 100644
--- a/tests/integer-expressions.c
+++ b/tests/integer-expressions.c
@@ -28,15 +28,22 @@ static struct test_expr {
 	TE(2*3),
 	TE(4/2),
 	TE(10/3),
+	TE(-10/3),
 	TE(19%4),
+	TE(-19%4),
 	TE(1 << 13),
 	TE(0x1000 >> 4),
+	TE(-0x1000 >> 4),
 	TE(3*2+1), TE(3*(2+1)),
 	TE(1+2*3), TE((1+2)*3),
 	TE(1 < 2), TE(2 < 1), TE(1 < 1),
 	TE(1 <= 2), TE(2 <= 1), TE(1 <= 1),
 	TE(1 > 2), TE(2 > 1), TE(1 > 1),
 	TE(1 >= 2), TE(2 >= 1), TE(1 >= 1),
+	TE(-1 < 1), TE(1 < -1), TE(-1 < -1),
+	TE(-1 <= 1), TE(1 <= -1), TE(-1 <= -1),
+	TE(-1 > 1), TE(1 > -1), TE(-1 > -1),
+	TE(-1 >= 1), TE(1 >= -1), TE(-1 >= -1),
 	TE(1 == 1), TE(1 == 2),
 	TE(1 != 1), TE(1 != 2),
 	TE(0xabcdabcd & 0xffff0000),
@@ -50,6 +57,7 @@ static struct test_expr {
 	TE(0 ? 17 : 39), TE(1 ? 17 : 39), TE(17 ? 0xdeadbeef : 0xabcd1234),
 	TE(11 * 257 * 1321517ULL),
 	TE(123456790 - 4/2 + 17%4),
+	TE(-123456790 - -4/-2 + -17%-4),
 };
 
 #define ARRAY_SIZE(x)	(sizeof(x) / sizeof((x)[0]))
-- 
2.17.1

