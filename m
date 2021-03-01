From: Ryan Long <thisisryanlong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] fdt_rw.c: Fix Unchecked return value error
Date: Mon,  1 Mar 2021 17:24:10 -0500
Message-ID: <1614637450-4972-2-git-send-email-ryan.long@oarcorp.com>
References: <1614637450-4972-1-git-send-email-ryan.long@oarcorp.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=wjknVEdOGaU1FHYhpD545qiVMbLk7UAwTM66tA+M0k4=;
        b=hpCG6iD6W88ArUmjK0r5mMaewumyTlviAEcAa+JcZLpI5N4zVDO81LMaZsOf7E2Erj
         lLi4OgHCxHwXCYuYvjskK6j9Lwz8Lnp/UjNOlLJRQMZRq0i0lkebDO4Z0kolll9P+0Nu
         8OTq8CPCX2NZZGP6+BWclTItOVfx8nwxxQGtfIjU2aCfmBIxEUvS3IxP0wOb2w4+vDWj
         bIH0kKeZQNYCMGQmMdILtbCx/8aeOOULUzcRJ9GngyIYDk2v0O6Njs0XDnmjNNgGd3k8
         /M7WJmuA89FYxN0aj7R/X4Fki1JvQzdzPwMzwL4KGcloauUGgDiNAKNWoyKZVJNnN6+1
         SAdw==
In-Reply-To: <1614637450-4972-1-git-send-email-ryan.long-lGxtRh3/QYtBDgjK7y7TUQ@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Ryan Long <ryan.long-lGxtRh3/QYtBDgjK7y7TUQ@public.gmane.org>

Fixed "Unchecked return value" error, by adding "(void)" in front of the
function call.
---
 cpukit/dtc/libfdt/fdt_rw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/cpukit/dtc/libfdt/fdt_rw.c b/cpukit/dtc/libfdt/fdt_rw.c
index 1385425..cdae5dd 100644
--- a/cpukit/dtc/libfdt/fdt_rw.c
+++ b/cpukit/dtc/libfdt/fdt_rw.c
@@ -348,7 +348,7 @@ int fdt_add_subnode_namelen(void *fdt, int parentoffset,
 		return offset;
 
 	/* Try to place the new node after the parent's properties */
-	fdt_next_tag(fdt, parentoffset, &nextoffset); /* skip the BEGIN_NODE */
+	(void) fdt_next_tag(fdt, parentoffset, &nextoffset); /* skip the BEGIN_NODE */
 	do {
 		offset = nextoffset;
 		tag = fdt_next_tag(fdt, offset, &nextoffset);
-- 
1.8.3.1

