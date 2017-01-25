From: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] dtc: Fix NULL pointer use in dtlabel + dtref case
Date: Wed, 25 Jan 2017 11:27:24 -0800
Message-ID: <20170125192724.11989-1-stephen.boyd@linaro.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=7y55U0XTJ18oPDatolXAixVYyUcCM6qO7gQiO5ROV5g=;
        b=LBYd0SUI4hlL+Mavi5heMHw0hjoYhcWjlHzCIs1/HyiJ9hZQ0dnoYEM74XaG+4ZPD7
         AHP3QiNK6bFUXTUce/Z6xiBk9huSSFbpo0qYfH6b2pw0paSwL7Pss+jqWskKb7RbDryo
         H2yoZUVSmI40qSBYvnwNWroV9CJHT2gPOEtnM=
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

If we have a construct like this:

	label: &handle {
		...
	};

Running dtc on it will cause a segfault, because we use 'target'
when it could be NULL. Move the add_label() call into the if
statement to fix this potentially bad use of a NULL pointer.

Signed-off-by: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 dtc-parser.y | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index b2fd4d155839..ca3f5003427c 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -171,10 +171,10 @@ devicetree:
 		{
 			struct node *target = get_node_by_ref($1, $3);
 
-			add_label(&target->labels, $2);
-			if (target)
+			if (target) {
+				add_label(&target->labels, $2);
 				merge_nodes(target, $4);
-			else
+			} else
 				ERROR(&@3, "Label or path %s not found", $3);
 			$$ = $1;
 		}
-- 
2.10.0.297.gf6727b0
