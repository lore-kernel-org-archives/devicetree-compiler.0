From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH] libfdt: Drop -FDT_ERR_TOODEEP
Date: Sun,  9 Jul 2017 21:30:17 -0600
Message-ID: <20170710033017.161092-1-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=h6sp9oTKlZAbvp1mN2fXIJ3JC04I6SSN4hkLc3kGdx4=;
        b=gaKVT85edot1eal7GjupHK+OMv6kIKSZGRm3ElwB9hrK/KG2lcLuXjUtq18tHcY1WM
         0Z7t1QLFhzDNW4FkW9g8shT69TPXXYDYq9hTqn5wNnGJqcMN5mZTfvI+8oVo5pzhz9xo
         UIOMMFyVutAZj69Dwv0+L/2GbODlaYCxfbsZn7o5yJSXJnhQJrfaZRvjm5wJ/TmSKn6B
         M1BxOvNixk6LoP0dB0vUCD+r9MBj/PNNZBhWOgLlwucIb2G/voIGrBO8krF/qfQyTblk
         NXhj3fTc0cuk1ALQaPYMnHhoI8zFHwEFe1R2xxL1dDzeBdzLi5yHuOOu5pynpw/d0Bxy
         f1qw==
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Peter Robinson <pbrobinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

This error code has not been upstreamed and is not really needed since it
is unlikely to be triggered. Drop it to maintain compatability with
upstream.

Reported-by: Peter Robinson <pbrobinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

 lib/libfdt/fdt_region.c | 2 +-
 lib/libfdt/libfdt.h     | 7 +------
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/lib/libfdt/fdt_region.c b/lib/libfdt/fdt_region.c
index 8b8a547555..63099f1d96 100644
--- a/lib/libfdt/fdt_region.c
+++ b/lib/libfdt/fdt_region.c
@@ -397,7 +397,7 @@ int fdt_next_region(const void *fdt,
 			last_node = offset;
 			p.depth++;
 			if (p.depth == FDT_MAX_DEPTH)
-				return -FDT_ERR_TOODEEP;
+				return -FDT_ERR_BADSTRUCTURE;
 			name = fdt_get_name(fdt, offset, &len);
 			if (p.end - path + 2 + len >= path_len)
 				return -FDT_ERR_NOSPACE;
diff --git a/lib/libfdt/libfdt.h b/lib/libfdt/libfdt.h
index 2f7ebf8e06..f3f9cad184 100644
--- a/lib/libfdt/libfdt.h
+++ b/lib/libfdt/libfdt.h
@@ -93,12 +93,7 @@
 	/* FDT_ERR_NOPHANDLES: The device tree doesn't have any
 	 * phandle available anymore without causing an overflow */
 
-#define FDT_ERR_TOODEEP	18
-	/* FDT_ERR_TOODEEP: The depth of a node has exceeded the internal
-	 * libfdt limit. This can happen if you have more than
-	 * FDT_MAX_DEPTH nested nodes. */
-
-#define FDT_ERR_MAX		18
+#define FDT_ERR_MAX		17
 
 /**********************************************************************/
 /* Low-level functions (you probably don't need these)                */
-- 
2.13.2.725.g09c95d1e9-goog
