From: Ryan Long <thisisryanlong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] fdt_rw.c: Fix Unchecked return value error
Date: Tue,  2 Mar 2021 14:58:19 -0500
Message-ID: <1614715099-23657-1-git-send-email-ryan.long@oarcorp.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=JqkC4Zyj043nAk+b+1M8Kpp2rQZv6OupFsNeXOHOsiI=;
        b=PfNmvtYJWVrT7rIpYuREtOlZ9htTyfUnwFkdBKFP+wx4qLnD7CbTI4FvLiELKBHJd2
         Hl8th8TuVrcoQPKHVO+33LKHNcNSxjvdZnoL6olB6EtxpWKXJnKWdDXLbByAD8S6IoKs
         5BfvT1Y2O6TPnsxYXLfvo+YcmTMRnJPZPMSJEMpiwIfNKme8qcmvuyv0KaJD4g4oa4/H
         tzCOiVP4cWUo7ETH/Wcv+E9QXeju+Z6K9KY6c04WQgwjkQo0wTsBKbokc4FssZWtuoHV
         OHXJvT120poVrN6lb+dpCjHD3+MVT8SGeDWhEig6TZGXWIk3vWBQAzyi8zJitf5KVEk+
         JaSg==
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Ryan Long <ryan.long-lGxtRh3/QYtBDgjK7y7TUQ@public.gmane.org>

Fixed "Unchecked return value" error, by adding "(void)" in front of the
function call.

When Coverity Scan was ran on some of your code, a "Unchecked return value"
error was found at line 352 in fdt_rw.c. For similar errors that we received
for RTEMS, we created a macro that will assert the value returned and "use" the
return value with (void).

Signed-off-by: Ryan Long <ryan.long-lGxtRh3/QYtBDgjK7y7TUQ@public.gmane.org>
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

