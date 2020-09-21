From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 08/14] libfdt: fdt_create_with_flags(): Fix comparison warning
Date: Mon, 21 Sep 2020 17:52:57 +0100
Message-ID: <20200921165303.9115-9-andre.przywara@arm.com>
References: <20200921165303.9115-1-andre.przywara@arm.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200921165303.9115-1-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

With -Wsign-compare, compilers warn about a mismatching signedness
in a comparison in fdt_create_with_flags().

We have just established that bufsize is not negative, so a cast to an
unsigned type is safe.

Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
---
 libfdt/fdt_sw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libfdt/fdt_sw.c b/libfdt/fdt_sw.c
index d65e9c8..8a76adf 100644
--- a/libfdt/fdt_sw.c
+++ b/libfdt/fdt_sw.c
@@ -112,7 +112,7 @@ int fdt_create_with_flags(void *buf, int bufsize, uint32_t flags)
 					 sizeof(struct fdt_reserve_entry));
 	void *fdt = buf;
 
-	if (bufsize < hdrsize)
+	if (bufsize < 0 || (unsigned)bufsize < hdrsize)
 		return -FDT_ERR_NOSPACE;
 
 	if (flags & ~FDT_CREATE_FLAGS_ALL)
-- 
2.17.5

