From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH v2 3/6] libfdt: fdt_create_with_flags(): Fix comparison warning
Date: Thu,  1 Oct 2020 17:46:27 +0100
Message-ID: <20201001164630.4980-4-andre.przywara@arm.com>
References: <20201001164630.4980-1-andre.przywara@arm.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20201001164630.4980-1-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

With -Wsign-compare, compilers warn about a mismatching signedness
in a comparison in fdt_create_with_flags().

By making hdrsize a signed integer (we are sure it's a very small
number), we avoid all the casts and have matching types.

Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
---
 libfdt/fdt_sw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/libfdt/fdt_sw.c b/libfdt/fdt_sw.c
index 354f466..68b543c 100644
--- a/libfdt/fdt_sw.c
+++ b/libfdt/fdt_sw.c
@@ -108,8 +108,8 @@ static void *fdt_grab_space_(void *fdt, size_t len)
 
 int fdt_create_with_flags(void *buf, int bufsize, uint32_t flags)
 {
-	const size_t hdrsize = FDT_ALIGN(sizeof(struct fdt_header),
-					 sizeof(struct fdt_reserve_entry));
+	const int hdrsize = FDT_ALIGN(sizeof(struct fdt_header),
+				      sizeof(struct fdt_reserve_entry));
 	void *fdt = buf;
 
 	if (bufsize < hdrsize)
-- 
2.17.5

