From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: [PATCH 08/10] Implement path references in terms of bytestring expressions
Date: Mon, 17 Feb 2014 00:19:39 +1100
Message-ID: <1392556781-7743-9-git-send-email-david@gibson.dropbear.id.au>
References: <1392556781-7743-1-git-send-email-david@gibson.dropbear.id.au>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1392556781-7743-1-git-send-email-david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: jdl-CYoMK+44s/E@public.gmane.org, 3fa55604225d40864c30a8b17d0dac60b2384cbe-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

This patch re-implements path references (&label which expands to the
referenced node's full path) in terms of the bytestring expression
infrastructure.

Internally this is implemented as a constant bytestring expression
containing nothing but the marker to insert the path reference later.
Logically it would be neater to have the expression itself expand directly
to the right value itself, but for now we're evaluating these expressions
before all the tree's paths have been constructed.

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
---
 dtc-parser.y | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index bff22d9..7e1251d 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -219,10 +219,6 @@ propdata:
 			struct data d = expr_bytestring($2);
 			$$ = data_merge($1, d);
 		}
-	| propdataprefix DT_REF
-		{
-			$$ = data_add_marker($1, REF_PATH, $2);
-		}
 	;
 
 propdataprefix:
@@ -349,6 +345,11 @@ expr_postlabel:
 
 expr_conditional:
 	  expr_or
+	| DT_REF
+		{
+			struct data d = data_add_marker(empty_data, REF_PATH, $1);
+			$$ = expression_bytestring_constant(&@$, d);
+		}
 	| expr_or '?' expr ':' expr_conditional
 		{
 			$$ = expression_conditional(&yylloc, $1, $3, $5);
-- 
1.8.5.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
