From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [RFC PATCH] checks: Use source position information for check failures
Date: Mon,  8 Jan 2018 16:49:27 -0600
Message-ID: <20180108224927.1016-1-robh@kernel.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Now that we retain source position information of nodes and properties,
make that the preferred file name (and position) to print out in check
failures. This will greatly simplify finding and fixing check errors
because most errors are in included source .dtsi files and they get
duplicated every time the source file is included.

For now, only converting a few locations and using a new macro name. I
will convert all FAIL occurences once we agree on the new syntax. Also,
after this, some checks may need some rework to have more specific
line numbers of properties rather than nodes.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
This is based on Julia's annotation series.

 checks.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/checks.c b/checks.c
index 7845472742e0..2078c0fe75eb 100644
--- a/checks.c
+++ b/checks.c
@@ -19,6 +19,7 @@
  */
 
 #include "dtc.h"
+#include "srcpos.h"
 
 #ifdef TRACE_CHECKS
 #define TRACE(c, ...) \
@@ -72,7 +73,8 @@ struct check {
 #define CHECK(nm_, fn_, d_, ...) \
 	CHECK_ENTRY(nm_, fn_, d_, false, false, __VA_ARGS__)
 
-static inline void  PRINTF(3, 4) check_msg(struct check *c, struct dt_info *dti,
+static inline void  PRINTF(4, 5) check_msg(struct check *c, struct dt_info *dti,
+					   struct srcpos *pos,
 					   const char *fmt, ...)
 {
 	va_list ap;
@@ -80,8 +82,15 @@ static inline void  PRINTF(3, 4) check_msg(struct check *c, struct dt_info *dti,
 
 	if ((c->warn && (quiet < 1))
 	    || (c->error && (quiet < 2))) {
+		const char *file_str;
+		if (pos)
+			file_str = srcpos_string(pos);
+		else if (streq(dti->outname, "-"))
+			file_str = "<stdout>";
+		else
+			file_str = dti->outname;
 		fprintf(stderr, "%s: %s (%s): ",
-			strcmp(dti->outname, "-") ? dti->outname : "<stdout>",
+			file_str,
 			(c->error) ? "ERROR" : "Warning", c->name);
 		vfprintf(stderr, fmt, ap);
 		fprintf(stderr, "\n");
@@ -93,7 +102,14 @@ static inline void  PRINTF(3, 4) check_msg(struct check *c, struct dt_info *dti,
 	do {								\
 		TRACE((c), "\t\tFAILED at %s:%d", __FILE__, __LINE__);	\
 		(c)->status = FAILED;					\
-		check_msg((c), dti, __VA_ARGS__);			\
+		check_msg((c), dti, NULL, __VA_ARGS__);			\
+	} while (0)
+
+#define FAIL_POS(c, dti, p, ...)						\
+	do {								\
+		TRACE((c), "\t\tFAILED at %s:%d", __FILE__, __LINE__);	\
+		(c)->status = FAILED;					\
+		check_msg((c), dti, p, __VA_ARGS__);			\
 	} while (0)
 
 static void check_nodes_props(struct check *c, struct dt_info *dti, struct node *node)
@@ -126,7 +142,7 @@ static bool run_check(struct check *c, struct dt_info *dti)
 		error = error || run_check(prq, dti);
 		if (prq->status != PASSED) {
 			c->status = PREREQ;
-			check_msg(c, dti, "Failed prerequisite '%s'",
+			check_msg(c, dti, NULL, "Failed prerequisite '%s'",
 				  c->prereq[i]->name);
 		}
 	}
@@ -1049,7 +1065,7 @@ static void check_avoid_unnecessary_addr_size(struct check *c, struct dt_info *d
 	}
 
 	if (!has_reg)
-		FAIL(c, dti, "unnecessary #address-cells/#size-cells without \"ranges\" or child \"reg\" property in %s",
+		FAIL_POS(c, dti, node->srcpos, "unnecessary #address-cells/#size-cells without \"ranges\" or child \"reg\" property in %s",
 		     node->fullpath);
 }
 WARNING(avoid_unnecessary_addr_size, check_avoid_unnecessary_addr_size, NULL, &avoid_default_addr_size);
@@ -1437,7 +1453,7 @@ static void check_graph_child_address(struct check *c, struct dt_info *dti,
 		cnt++;
 
 	if (cnt == 1 && node->addr_cells != -1)
-		FAIL(c, dti, "graph node '%s' has single child node, unit address is not necessary",
+		FAIL_POS(c, dti, node->srcpos, "graph node '%s' has single child node, unit address is not necessary",
 		     node->fullpath);
 }
 WARNING(graph_child_address, check_graph_child_address, NULL, &graph_nodes);
-- 
2.14.1
