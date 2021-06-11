From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 1/4] libfdt: Check for invalid memreserve block
Date: Fri, 11 Jun 2021 12:58:20 +0100
Message-ID: <20210611115823.31583-2-andre.przywara@arm.com>
References: <20210611115823.31583-1-andre.przywara@arm.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20210611115823.31583-1-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

fdt_num_mem_rsv() can return a negative error value, when the memreserve
block is not properly terminated or is exceeding its advertised size,
This can happen on malformed DTBs, and FDT_RO_PROBE() does not cover this.

Check the return value of fdt_num_mem_rsv() first for an error
condition, and also check if the total size of the memreserve block
would provoke a signed integer overflow.

This fixes issues with malformed DT blobs, where we would end up with
negative offsets into buffers.

Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
---
 libfdt/fdt_rw.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
index 3621d36..a0f03d0 100644
--- a/libfdt/fdt_rw.c
+++ b/libfdt/fdt_rw.c
@@ -427,8 +427,13 @@ int fdt_open_into(const void *fdt, void *buf, int bufsize)
 
 	FDT_RO_PROBE(fdt);
 
-	mem_rsv_size = (fdt_num_mem_rsv(fdt)+1)
-		* sizeof(struct fdt_reserve_entry);
+	mem_rsv_size = fdt_num_mem_rsv(fdt);
+	if (mem_rsv_size < 0)
+		return mem_rsv_size;
+
+	mem_rsv_size = (mem_rsv_size + 1) * sizeof(struct fdt_reserve_entry);
+	if (!can_assume(VALID_DTB) && mem_rsv_size < 0)
+		return -FDT_ERR_NOSPACE;
 
 	if (can_assume(LATEST) || fdt_version(fdt) >= 17) {
 		struct_size = fdt_size_dt_struct(fdt);
@@ -490,8 +495,14 @@ int fdt_pack(void *fdt)
 
 	FDT_RW_PROBE(fdt);
 
-	mem_rsv_size = (fdt_num_mem_rsv(fdt)+1)
-		* sizeof(struct fdt_reserve_entry);
+	mem_rsv_size = fdt_num_mem_rsv(fdt);
+	if (mem_rsv_size < 0)
+		return mem_rsv_size;
+
+	mem_rsv_size = (mem_rsv_size + 1) * sizeof(struct fdt_reserve_entry);
+	if (!can_assume(VALID_DTB) && mem_rsv_size < 0)
+		return -FDT_ERR_NOSPACE;
+
 	fdt_packblocks_(fdt, fdt, mem_rsv_size, fdt_size_dt_struct(fdt),
 			fdt_size_dt_strings(fdt));
 	fdt_set_totalsize(fdt, fdt_data_size_(fdt));
-- 
2.17.5

