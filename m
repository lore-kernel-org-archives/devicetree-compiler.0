From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 3/4] libfdt: Check DT struct size for integer overflow
Date: Fri, 11 Jun 2021 12:58:22 +0100
Message-ID: <20210611115823.31583-4-andre.przywara@arm.com>
References: <20210611115823.31583-1-andre.przywara@arm.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20210611115823.31583-1-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

The DTB header fields store unsigned values for size and offset, however
we have a 2 GB limit on the overall size, since we use signed "node"
offsets everywhere.

As fdt_open_into() is no exception here, check that the advertised DT
structure size fits in an int, before using that value as an offset into
a buffer.

Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
---
 libfdt/fdt_rw.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
index a0f03d0..062edcc 100644
--- a/libfdt/fdt_rw.c
+++ b/libfdt/fdt_rw.c
@@ -437,6 +437,8 @@ int fdt_open_into(const void *fdt, void *buf, int bufsize)
 
 	if (can_assume(LATEST) || fdt_version(fdt) >= 17) {
 		struct_size = fdt_size_dt_struct(fdt);
+		if (!can_assume(VALID_DTB) && struct_size < 0)
+			return -FDT_ERR_NOSPACE;
 	} else if (fdt_version(fdt) == 16) {
 		struct_size = 0;
 		while (fdt_next_tag(fdt, struct_size, &struct_size) != FDT_END)
-- 
2.17.5

