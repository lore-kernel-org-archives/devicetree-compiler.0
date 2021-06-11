From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH v2 6/8] dtc: Fix signedness comparisons warnings: pointer diff
Date: Fri, 11 Jun 2021 18:10:38 +0100
Message-ID: <20210611171040.25524-7-andre.przywara@arm.com>
References: <20210611171040.25524-1-andre.przywara@arm.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20210611171040.25524-1-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

With -Wsign-compare, compilers warn about a mismatching signedness
in comparisons in the function get_node_by_path().

Taking the difference between two pointers results in a signed ptrdiff_t
type, which mismatches the unsigned type returned by strlen().
Since "p" has been returned by a call to strchr() with "path" as its
argument, we know for sure that it's bigger than "path", so the
difference must be positive. So a cast to an unsigned type is valid.

Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
---
 livetree.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/livetree.c b/livetree.c
index cf2f63d..ef141a0 100644
--- a/livetree.c
+++ b/livetree.c
@@ -526,7 +526,7 @@ struct node *get_node_by_path(struct node *tree, const char *path)
 	p = strchr(path, '/');
 
 	for_each_child(tree, child) {
-		if (p && strprefixeq(path, p - path, child->name))
+		if (p && strprefixeq(path, (size_t)(p - path), child->name))
 			return get_node_by_path(child, p+1);
 		else if (!p && streq(path, child->name))
 			return child;
-- 
2.17.5

