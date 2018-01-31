From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 3/3] checks: Use source position information for check failures
Date: Wed, 31 Jan 2018 08:57:05 -0600
Message-ID: <20180131145705.21335-4-robh@kernel.org>
References: <20180131145705.21335-1-robh@kernel.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180131145705.21335-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Now that we retain source position information of nodes and properties,
make that the preferred file name (and position) to print out in check
failures. This will greatly simplify finding and fixing check errors
because most errors are in included source .dtsi files and they get
duplicated every time the source file is included.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 checks.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/checks.c b/checks.c
index c07ba4da9e36..d048557ef3ae 100644
--- a/checks.c
+++ b/checks.c
@@ -19,6 +19,7 @@
  */
 
 #include "dtc.h"
+#include "srcpos.h"
 
 #ifdef TRACE_CHECKS
 #define TRACE(c, ...) \
@@ -82,8 +83,15 @@ static inline void  PRINTF(5, 6) check_msg(struct check *c, struct dt_info *dti,
 
 	if ((c->warn && (quiet < 1))
 	    || (c->error && (quiet < 2))) {
+		const char *file_str;
+		if (node && node->srcpos)
+			file_str = srcpos_string(node->srcpos);
+		else if (streq(dti->outname, "-"))
+			file_str = "<stdout>";
+		else
+			file_str = dti->outname;
 		fprintf(stderr, "%s: %s (%s): ",
-			strcmp(dti->outname, "-") ? dti->outname : "<stdout>",
+			file_str,
 			(c->error) ? "ERROR" : "Warning", c->name);
 		if (node) {
 			fprintf(stderr, "%s", node->fullpath);
-- 
2.14.1
