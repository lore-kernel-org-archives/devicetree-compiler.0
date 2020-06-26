From: Andrei Ziureaev <andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 1/3] dtc: Turn 'uint64_t integer' into a struct
Date: Fri, 26 Jun 2020 17:25:26 +0100
Message-ID: <20200626162528.2129-2-andrei.ziureaev@arm.com>
References: <20200626162528.2129-1-andrei.ziureaev@arm.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200626162528.2129-1-andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

This allows adding support for negative integers in yaml and dts output.

Signed-off-by: Andrei Ziureaev <andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>
---
 dtc-lexer.l  |  10 ++--
 dtc-parser.y | 127 +++++++++++++++++++++++++++++++++++++--------------
 dtc.h        |   3 ++
 3 files changed, 102 insertions(+), 38 deletions(-)

diff --git a/dtc-lexer.l b/dtc-lexer.l
index b3b7270300de..a8982bd4edf2 100644
--- a/dtc-lexer.l
+++ b/dtc-lexer.l
@@ -156,7 +156,9 @@ static void PRINTF(1, 2) lexical_error(const char *fmt, ...);
 			DPRINT("Integer Literal: '%s'\n", yytext);
 
 			errno = 0;
-			yylval.integer = strtoull(yytext, &e, 0);
+			yylval.integer = (struct integer){
+				.i = strtoull(yytext, &e, 0)
+			};
 
 			if (*e && e[strspn(e, "UL")]) {
 				lexical_error("Bad integer literal '%s'",
@@ -180,9 +182,11 @@ static void PRINTF(1, 2) lexical_error(const char *fmt, ...);
 			d = data_copy_escape_string(yytext+1, yyleng-2);
 			if (d.len == 1) {
 				lexical_error("Empty character literal");
-				yylval.integer = 0;
+				yylval.integer = (struct integer){ 0 };
 			} else {
-				yylval.integer = (unsigned char)d.val[0];
+				yylval.integer = (struct integer){
+					.i = (unsigned char)d.val[0]
+				};
 
 				if (d.len > 2)
 					lexical_error("Character literal has %d"
diff --git a/dtc-parser.y b/dtc-parser.y
index 40dcf4f149da..d3924e382065 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -41,7 +41,7 @@ extern bool treesource_error;
 	struct node *node;
 	struct node *nodelist;
 	struct reserve_info *re;
-	uint64_t integer;
+	struct integer integer;
 	unsigned int flags;
 }
 
@@ -140,7 +140,7 @@ memreserves:
 memreserve:
 	  DT_MEMRESERVE integer_prim integer_prim ';'
 		{
-			$$ = build_reserve_entry($2, $3);
+			$$ = build_reserve_entry($2.i, $3.i);
 		}
 	| DT_LABEL memreserve
 		{
@@ -310,13 +310,13 @@ propdata:
 			FILE *f = srcfile_relative_open($4.val, NULL);
 			struct data d;
 
-			if ($6 != 0)
-				if (fseek(f, $6, SEEK_SET) != 0)
+			if ($6.i != 0)
+				if (fseek(f, $6.i, SEEK_SET) != 0)
 					die("Couldn't seek to offset %llu in \"%s\": %s",
-					    (unsigned long long)$6, $4.val,
+					    (unsigned long long)$6.i, $4.val,
 					    strerror(errno));
 
-			d = data_copy_file(f, $8);
+			d = data_copy_file(f, $8.i);
 
 			$$ = data_merge($1, d);
 			fclose(f);
@@ -358,7 +358,7 @@ arrayprefix:
 			unsigned long long bits;
 			enum markertype type = TYPE_UINT32;
 
-			bits = $2;
+			bits = $2.i;
 
 			switch (bits) {
 			case 8: type = TYPE_UINT8; break;
@@ -391,12 +391,12 @@ arrayprefix:
 				 * within the mask to one (i.e. | in the
 				 * mask), all bits are one.
 				 */
-				if (($2 > mask) && (($2 | mask) != -1ULL))
+				if (($2.i > mask) && (($2.i | mask) != -1ULL))
 					ERROR(&@2, "Value out of range for"
 					      " %d-bit array element", $1.bits);
 			}
 
-			$$.data = data_append_integer($1.data, $2, $1.bits);
+			$$.data = data_append_integer($1.data, $2.i, $1.bits);
 		}
 	| arrayprefix dt_ref
 		{
@@ -433,78 +433,126 @@ integer_expr:
 
 integer_trinary:
 	  integer_or
-	| integer_or '?' integer_expr ':' integer_trinary { $$ = $1 ? $3 : $5; }
+	| integer_or '?' integer_expr ':' integer_trinary { $$ = $1.i ? $3 : $5; }
 	;
 
 integer_or:
 	  integer_and
-	| integer_or DT_OR integer_and { $$ = $1 || $3; }
+	| integer_or DT_OR integer_and
+		{
+			$$ = (struct integer){ $1.i || $3.i };
+		}
 	;
 
 integer_and:
 	  integer_bitor
-	| integer_and DT_AND integer_bitor { $$ = $1 && $3; }
+	| integer_and DT_AND integer_bitor
+		{
+			$$ = (struct integer){ $1.i && $3.i };
+		}
 	;
 
 integer_bitor:
 	  integer_bitxor
-	| integer_bitor '|' integer_bitxor { $$ = $1 | $3; }
+	| integer_bitor '|' integer_bitxor
+		{
+			$$ = (struct integer){ $1.i | $3.i };
+		}
 	;
 
 integer_bitxor:
 	  integer_bitand
-	| integer_bitxor '^' integer_bitand { $$ = $1 ^ $3; }
+	| integer_bitxor '^' integer_bitand
+		{
+			$$ = (struct integer){ $1.i ^ $3.i };
+		}
 	;
 
 integer_bitand:
 	  integer_eq
-	| integer_bitand '&' integer_eq { $$ = $1 & $3; }
+	| integer_bitand '&' integer_eq
+		{
+			$$ = (struct integer){ $1.i & $3.i };
+		}
 	;
 
 integer_eq:
 	  integer_rela
-	| integer_eq DT_EQ integer_rela { $$ = $1 == $3; }
-	| integer_eq DT_NE integer_rela { $$ = $1 != $3; }
+	| integer_eq DT_EQ integer_rela
+		{
+			$$ = (struct integer){ $1.i == $3.i };
+		}
+	| integer_eq DT_NE integer_rela
+		{
+			$$ = (struct integer){ $1.i != $3.i };
+		}
 	;
 
 integer_rela:
 	  integer_shift
-	| integer_rela '<' integer_shift { $$ = $1 < $3; }
-	| integer_rela '>' integer_shift { $$ = $1 > $3; }
-	| integer_rela DT_LE integer_shift { $$ = $1 <= $3; }
-	| integer_rela DT_GE integer_shift { $$ = $1 >= $3; }
+	| integer_rela '<' integer_shift
+		{
+			$$ = (struct integer){ $1.i < $3.i };
+		}
+	| integer_rela '>' integer_shift
+		{
+			$$ = (struct integer){ $1.i > $3.i };
+		}
+	| integer_rela DT_LE integer_shift
+		{
+			$$ = (struct integer){ $1.i <= $3.i };
+		}
+	| integer_rela DT_GE integer_shift
+		{
+			$$ = (struct integer){ $1.i >= $3.i };
+		}
 	;
 
 integer_shift:
-	  integer_shift DT_LSHIFT integer_add { $$ = $1 << $3; }
-	| integer_shift DT_RSHIFT integer_add { $$ = $1 >> $3; }
+	  integer_shift DT_LSHIFT integer_add
+		{
+			$$ = (struct integer){ $1.i << $3.i };
+		}
+	| integer_shift DT_RSHIFT integer_add
+		{
+			$$ = (struct integer){ $1.i >> $3.i };
+		}
 	| integer_add
 	;
 
 integer_add:
-	  integer_add '+' integer_mul { $$ = $1 + $3; }
-	| integer_add '-' integer_mul { $$ = $1 - $3; }
+	  integer_add '+' integer_mul
+		{
+			$$ = (struct integer){ $1.i + $3.i };
+		}
+	| integer_add '-' integer_mul
+		{
+			$$ = (struct integer){ $1.i - $3.i };
+		}
 	| integer_mul
 	;
 
 integer_mul:
-	  integer_mul '*' integer_unary { $$ = $1 * $3; }
+	  integer_mul '*' integer_unary
+		{
+			$$ = (struct integer){ $1.i * $3.i };
+		}
 	| integer_mul '/' integer_unary
 		{
-			if ($3 != 0) {
-				$$ = $1 / $3;
+			if ($3.i != 0) {
+				$$ = (struct integer){ $1.i / $3.i };
 			} else {
 				ERROR(&@$, "Division by zero");
-				$$ = 0;
+				$$ = (struct integer){ 0 };
 			}
 		}
 	| integer_mul '%' integer_unary
 		{
-			if ($3 != 0) {
-				$$ = $1 % $3;
+			if ($3.i != 0) {
+				$$ = (struct integer){ $1.i % $3.i };
 			} else {
 				ERROR(&@$, "Division by zero");
-				$$ = 0;
+				$$ = (struct integer){ 0 };
 			}
 		}
 	| integer_unary
@@ -512,9 +560,18 @@ integer_mul:
 
 integer_unary:
 	  integer_prim
-	| '-' integer_unary { $$ = -$2; }
-	| '~' integer_unary { $$ = ~$2; }
-	| '!' integer_unary { $$ = !$2; }
+	| '-' integer_unary
+		{
+			$$ = (struct integer){ -$2.i };
+		}
+	| '~' integer_unary
+		{
+			$$ = (struct integer){ ~$2.i };
+		}
+	| '!' integer_unary
+		{
+			$$ = (struct integer){ !$2.i };
+		}
 	;
 
 bytestring:
diff --git a/dtc.h b/dtc.h
index a08f4159cd03..fb1ade37b715 100644
--- a/dtc.h
+++ b/dtc.h
@@ -116,6 +116,9 @@ struct data {
 	struct marker *markers;
 };
 
+struct integer {
+	uint64_t i;
+};
 
 #define empty_data ((struct data){ 0 /* all .members = 0 or NULL */ })
 
-- 
2.17.1

