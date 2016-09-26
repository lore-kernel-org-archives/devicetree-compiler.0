From: Thomas Huth <thuth-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] Fix some typing errors in libfdt.h and livetree.c
Date: Mon, 26 Sep 2016 18:12:26 +0200
Message-ID: <1474906346-29392-1-git-send-email-thuth@redhat.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, jdl-CYoMK+44s/E@public.gmane.org

Correct some typos discovered with the codespell utility.

Signed-off-by: Thomas Huth <thuth-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 libfdt/libfdt.h | 4 ++--
 livetree.c      | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index 376e628..ecb11fc 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -61,7 +61,7 @@
 #define FDT_ERR_NOTFOUND	1
 	/* FDT_ERR_NOTFOUND: The requested node or property does not exist */
 #define FDT_ERR_EXISTS		2
-	/* FDT_ERR_EXISTS: Attemped to create a node or property which
+	/* FDT_ERR_EXISTS: Attempted to create a node or property which
 	 * already exists */
 #define FDT_ERR_NOSPACE		3
 	/* FDT_ERR_NOSPACE: Operation needed to expand the device
@@ -700,7 +700,7 @@ const char *fdt_get_alias_namelen(const void *fdt,
 				  const char *name, int namelen);
 
 /**
- * fdt_get_alias - retreive the path referenced by a given alias
+ * fdt_get_alias - retrieve the path referenced by a given alias
  * @fdt: pointer to the device tree blob
  * @name: name of the alias th look up
  *
diff --git a/livetree.c b/livetree.c
index e229b84..3dc7559 100644
--- a/livetree.c
+++ b/livetree.c
@@ -204,7 +204,7 @@ struct node *merge_nodes(struct node *old_node, struct node *new_node)
 			}
 		}
 
-		/* if no collision occured, add child to the old node. */
+		/* if no collision occurred, add child to the old node. */
 		if (new_child)
 			add_child(old_node, new_child);
 	}
-- 
1.8.3.1
