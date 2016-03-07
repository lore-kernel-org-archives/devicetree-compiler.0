From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 3/3] Correct a missing space in a fdt_header cast
Date: Sun,  6 Mar 2016 20:12:48 -0700
Message-ID: <1457320368-27248-4-git-send-email-sjg@chromium.org>
References: <1457320368-27248-1-git-send-email-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=DwNaCoMmhcrY7Q5Py/KMKQDl0lP5xoC4QTa4P83nh90=;
        b=AFuMtTWFK0j+TH7A4JiwnNz7iNtPB5+fpwoKkuJXoWp65QtB86Dbn8v4Z2+tCvPfeg
         B4HeKyRyMdgG+aNVPbd6p98HL19Ijmj0pzgCTAUNbI9IelevuR5e6YlQVIu6FPkurI2m
         ICX/VVPlxJN4ssH6CRCy1HK7b8FPPCG73mnWPZ3Wk0vil/FqAE5d+/g6zFA9+rSCYxQ1
         iZEvHshqGOHnlQLmg1dVXDMtHNI3tnPBIrrcBs/oTVDuOMc4Fh179paYNNrG8PzBwiGJ
         jXw1hURJXb28Toa+p+oIdP5YVdtVdlvH7hV4RgGVOzSVVLlGaIJBJVuHbUdhLrRXdsvk
         oieQ==
In-Reply-To: <1457320368-27248-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

The code style here is slightly incorrect. Fix it.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

 libfdt/libfdt.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index 2c7b4e8..36222fd 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -188,7 +188,7 @@ int fdt_next_subnode(const void *fdt, int offset);
 #define __fdt_set_hdr(name) \
 	static inline void fdt_set_##name(void *fdt, uint32_t val) \
 	{ \
-		struct fdt_header *fdth = (struct fdt_header*)fdt; \
+		struct fdt_header *fdth = (struct fdt_header *)fdt; \
 		fdth->name = cpu_to_fdt32(val); \
 	}
 __fdt_set_hdr(magic);
-- 
2.7.0.rc3.207.g0ac5344
