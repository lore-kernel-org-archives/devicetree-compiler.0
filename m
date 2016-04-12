From: Maxim Zhukov <mussitantesmortem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: (unknown)
Date: Wed, 13 Apr 2016 00:29:22 +0300
Message-ID: <1460496562-28724-1-git-send-email-mussitantesmortem@gmail.com>
References: <1460494500-26922-1-git-send-email-mussitantesmortem@gmail.com> <1460494500-26922-3-git-send-email-mussitantesmortem@gmail.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=fQMmyJKd2uJ57ja71TerjZ8BJ8ky6O/8fWP8OAdv54Q=;
        b=oOMj2YSQ2cHX/P023WV4w5VMg/4ZhvBvI5ZKBxdmL3LBYnzpM055HnNgdpKs2KsZ6+
         6Pyazds8253TknfMjPyX4WCyGVOGYAtyducriptPk2moeoVsM8dKqHlmsRiUJ0rPqsLP
         BVKzp+Wf9E5J9xUets1vzHylE0bBqEYD/6WcGI8TcWRA87t2yRyFwCbySO8CanyH10Qu
         SnjWobY5Xg0i5AAoSJoHYjqCGNv6glaG6uH7C/0yJxvqClq/gFN+DnI04nC3I9jmm3xN
         Z9e2V4LOMY4z76ePHXJ/vOLpK72BT3nu50ibPseWn30Ym8lPDL+rRTS9RUoKg+bZjj7V
         yLTw==
Subject: 
In-Reply-To: <1460494500-26922-3-git-send-email-mussitantesmortem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Maxim Zhukov <mussitantesmortem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michal Marek <mmarek-IBi9RG/b67k@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Subject: [PATCH RESEND 2/2] scripts: dtc: fix memory leak after realloc

This commit fixed memory leak after errors realloc.

Signed-off-by: Maxim Zhukov <mussitantesmortem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 scripts/dtc/fdtput.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/scripts/dtc/fdtput.c b/scripts/dtc/fdtput.c
index f2197f5..1042319 100644
--- a/scripts/dtc/fdtput.c
+++ b/scripts/dtc/fdtput.c
@@ -75,8 +75,9 @@ static int encode_value(struct display_info *disp, char **arg, int arg_count,
 	char *ptr;		/* pointer to current value position */
 	int len;		/* length of this cell/string/byte */
 	int ival;
-	int upto;	/* the number of bytes we have written to buf */
+	int upto;		/* the number of bytes we have written to buf */
 	char fmt[3];
+	void *save_ptr = NULL;	/* save pointer to realloc */
 
 	upto = 0;
 
@@ -96,12 +97,15 @@ static int encode_value(struct display_info *disp, char **arg, int arg_count,
 		/* enlarge our value buffer by a suitable margin if needed */
 		if (upto + len > value_size) {
 			value_size = (upto + len) + 500;
-			value = realloc(value, value_size);
-			if (!value) {
+			void *save_ptr = realloc(value, value_size);
+
+			if (!save_ptr) {
+				free(value);
 				fprintf(stderr, "Out of mmory: cannot alloc "
 					"%d bytes\n", value_size);
 				return -1;
 			}
+			value = save_ptr;
 		}
 
 		ptr = value + upto;
-- 
2.7.1.1.g3617aa0
