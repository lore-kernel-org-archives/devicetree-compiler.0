From: Jean-Christophe Dubois <jcd-WBS85hRCVJbxB9160cZjhg@public.gmane.org>
Subject: [PATCH] livetree.c: Fix memory leak
Date: Tue,  7 Feb 2017 22:26:25 +0100
Message-ID: <20170207212625.20538-1-jcd@tribudubois.net>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jean-Christophe Dubois <jcd-WBS85hRCVJbxB9160cZjhg@public.gmane.org>

When running coverity on dtc source code the following error is reported.

==========================================================================
*** CID 1370967:  Resource leaks  (RESOURCE_LEAK)
/tools/dtc/livetree.c: 850 in add_fixup_entry()
844		if (strchr(node->fullpath, ':') || strchr(prop->name, ':'))
845			die("arguments should not contain ':'\n");
846
847		xasprintf(&entry, "%s:%s:%u",
848			  node->fullpath, prop->name, m->offset);
849		append_to_property(fn, m->ref, entry, strlen(entry) + 1);
>>>     CID 1370967:  Resource leaks  (RESOURCE_LEAK)
>>>     Variable "entry" going out of scope leaks the storage it points to.
850     }
==========================================================================

Fix the leak.

Signed-off-by: Jean-Christophe Dubois <jcd-WBS85hRCVJbxB9160cZjhg@public.gmane.org>
---
 livetree.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/livetree.c b/livetree.c
index afa2f67..994b6c2 100644
--- a/livetree.c
+++ b/livetree.c
@@ -847,6 +847,8 @@ static void add_fixup_entry(struct dt_info *dti, struct node *fn,
 	xasprintf(&entry, "%s:%s:%u",
 			node->fullpath, prop->name, m->offset);
 	append_to_property(fn, m->ref, entry, strlen(entry) + 1);
+
+	free(entry);
 }
 
 static void generate_fixups_tree_internal(struct dt_info *dti,
-- 
2.9.3
