From: Bin Meng <bmeng.cn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] libfdt: Fix the undefined behavior in fdt_num_mem_rsv()
Date: Tue, 30 Mar 2021 17:56:45 +0800
Message-ID: <20210330095645.515056-1-bmeng.cn@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k9brKHJS6wV50VDL/Wg4/ySeusWJjK1wyrZoXjKIVr4=;
        b=U58eUOGzlqLJKLNKaLO7go1qAhp9kxaVlayh3lIweX0KyRofshXMXvG1VrRY9pxNJG
         QoaEdqtV7tpkENx7OuD9E3j0/HhAUtD6nZ2G+wO9ZEPmsL+ta8zt0urQNhQBY8uiRS2Y
         gZIG/7qcNFOE7WthfKbPs0jtcq/YDy2xxpYM2PM9VtNAe/DrYMVT5PxTvEsodxv8VYcu
         IzPLL8gZvSxKg6D3/onIAhD76NZMDnOkqP3eKlc65ClnpjyLHP+E3oiuwB+bhf3pKcFx
         JbjfkbAEkVsxtfSibq121E+a70SV0gIIRvkZoV18+/LRlFrNj47qc+e5DXE54T3sgIPj
         T4Vw==
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

With LLVM 10.0.0+, the following codes in fdt_num_mem_rsv() does not
work any more for an fdt that is at address 0:

    for (i = 0; (re = fdt_mem_rsv(fdt, i)) != NULL; i++) {
        if (fdt64_ld_(&re->size) == 0)
            return i;
    }

Due to LLVM's optimization engine utilizing a UB in C, the following
code pattern:

    if ((pointer + offset) != NULL)

is transformed into:

    if (pointer != NULL)

because if pointer is NULL and offset is non-zero, the result of
(pointer + offset) is UB. So LLVM is free to exploit such UB to
perform some optimization.

In this case, fdt_mem_rsv() gets inlined and returns (pointer + offset).
And LLVM in turns emits codes to check fdt against NULL, which won't
work for fdt at address 0.

Signed-off-by: Bin Meng <bmeng.cn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---

 libfdt/fdt_ro.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
index 17584da..4db4013 100644
--- a/libfdt/fdt_ro.c
+++ b/libfdt/fdt_ro.c
@@ -157,18 +157,26 @@ int fdt_generate_phandle(const void *fdt, uint32_t *phandle)
 	return 0;
 }
 
-static const struct fdt_reserve_entry *fdt_mem_rsv(const void *fdt, int n)
+static bool fdt_is_mem_rsv(const void *fdt, int n)
 {
 	unsigned int offset = n * sizeof(struct fdt_reserve_entry);
 	unsigned int absoffset = fdt_off_mem_rsvmap(fdt) + offset;
 
 	if (!can_assume(VALID_INPUT)) {
 		if (absoffset < fdt_off_mem_rsvmap(fdt))
-			return NULL;
+			return false;
 		if (absoffset > fdt_totalsize(fdt) -
 		    sizeof(struct fdt_reserve_entry))
-			return NULL;
+			return false;
 	}
+
+	return true;
+}
+
+static const struct fdt_reserve_entry *fdt_mem_rsv(const void *fdt, int n)
+{
+	if (!fdt_is_mem_rsv(fdt, n))
+		return NULL;
 	return fdt_mem_rsv_(fdt, n);
 }
 
@@ -191,7 +199,8 @@ int fdt_num_mem_rsv(const void *fdt)
 	int i;
 	const struct fdt_reserve_entry *re;
 
-	for (i = 0; (re = fdt_mem_rsv(fdt, i)) != NULL; i++) {
+	for (i = 0; fdt_is_mem_rsv(fdt, i); i++) {
+		re = fdt_mem_rsv_(fdt, i);
 		if (fdt64_ld_(&re->size) == 0)
 			return i;
 	}
-- 
2.25.1

