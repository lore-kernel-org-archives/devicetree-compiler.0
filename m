From: Jean-Christophe Dubois <jcd-WBS85hRCVJbxB9160cZjhg@public.gmane.org>
Subject: [PATCH] DTC: Fix memory leak on flatname.
Date: Mon, 11 Jul 2016 00:16:52 +0200
Message-ID: <1468189012-1584-1-git-send-email-jcd@tribudubois.net>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, jdl-CYoMK+44s/E@public.gmane.org
Cc: Jean-Christophe Dubois <jcd-WBS85hRCVJbxB9160cZjhg@public.gmane.org>

If flatname was not referenced by the "node" structure, the reference to the
allocated string is lost at function exit.

We need to free it if is not used by "node".

Signed-off-by: Jean-Christophe Dubois <jcd-WBS85hRCVJbxB9160cZjhg@public.gmane.org>
---
 flattree.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/flattree.c b/flattree.c
index ec14954..089b976 100644
--- a/flattree.c
+++ b/flattree.c
@@ -797,6 +797,10 @@ static struct node *unflatten_tree(struct inbuf *dtbuf,
 		}
 	} while (val != FDT_END_NODE);
 
+	if (node->name != flatname) {
+		free(flatname);
+	}
+
 	return node;
 }
 
-- 
2.7.4
