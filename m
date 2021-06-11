From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 4/4] libfdt: Protect buffer size checks against integer overflow
Date: Fri, 11 Jun 2021 12:58:23 +0100
Message-ID: <20210611115823.31583-5-andre.przywara@arm.com>
References: <20210611115823.31583-1-andre.przywara@arm.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20210611115823.31583-1-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

In fdt_open_into() and fdt_packblocks_(), and in most other libfdt
functions for that matter, we use signed values for blob offsets and
sizes. When adding several signed values together, we should check for
integer overflows, as several valid sizes in inself can easily exceed
INT_MAX when summed up.

This is particularly important here, as we use the sum to check against
the maximum buffer size, or use them directly as buffer offsets.
Any negative values would not end up well.

Check for negative values after adding each size value separately. When
VALID_DTB is defined, the compiler should optimise this to the former
joint addition, so it should not increase the code size in this case.

Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
---
 libfdt/fdt_rw.c | 42 +++++++++++++++++++++++++++++-------------
 1 file changed, 29 insertions(+), 13 deletions(-)

diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
index 062edcc..24aff27 100644
--- a/libfdt/fdt_rw.c
+++ b/libfdt/fdt_rw.c
@@ -393,16 +393,20 @@ int fdt_del_node(void *fdt, int nodeoffset)
 				  endoffset - nodeoffset, 0);
 }
 
-static void fdt_packblocks_(const char *old, char *new,
-			    int mem_rsv_size,
-			    int struct_size,
-			    int strings_size)
+static int fdt_packblocks_(const char *old, char *new,
+			   int mem_rsv_size,
+			   int struct_size,
+			   int strings_size)
 {
 	int mem_rsv_off, struct_off, strings_off;
 
 	mem_rsv_off = FDT_ALIGN(sizeof(struct fdt_header), 8);
 	struct_off = mem_rsv_off + mem_rsv_size;
+	if (!can_assume(VALID_DTB) && struct_off < 0)
+		return -FDT_ERR_NOSPACE;
 	strings_off = struct_off + struct_size;
+	if (!can_assume(VALID_DTB) && strings_off < 0)
+		return -FDT_ERR_NOSPACE;
 
 	memmove(new + mem_rsv_off, old + fdt_off_mem_rsvmap(old), mem_rsv_size);
 	fdt_set_off_mem_rsvmap(new, mem_rsv_off);
@@ -414,6 +418,8 @@ static void fdt_packblocks_(const char *old, char *new,
 	memmove(new + strings_off, old + fdt_off_dt_strings(old), strings_size);
 	fdt_set_off_dt_strings(new, strings_off);
 	fdt_set_size_dt_strings(new, fdt_size_dt_strings(old));
+
+	return 0;
 }
 
 int fdt_open_into(const void *fdt, void *buf, int bufsize)
@@ -461,10 +467,16 @@ int fdt_open_into(const void *fdt, void *buf, int bufsize)
 		return 0;
 	}
 
-	/* Need to reorder */
-	newsize = FDT_ALIGN(sizeof(struct fdt_header), 8) + mem_rsv_size
-		+ struct_size + fdt_size_dt_strings(fdt);
-
+	/* Need to reorder. Protect against integer overflows. */
+	newsize = mem_rsv_size + struct_size;
+	if (!can_assume(VALID_DTB) && newsize < 0)
+		return -FDT_ERR_NOSPACE;
+	newsize += fdt_size_dt_strings(fdt);
+	if (!can_assume(VALID_DTB) && newsize < 0)
+		return -FDT_ERR_NOSPACE;
+	newsize += FDT_ALIGN(sizeof(struct fdt_header), 8);
+	if (!can_assume(VALID_DTB) && newsize < 0)
+		return -FDT_ERR_NOSPACE;
 	if (bufsize < newsize)
 		return -FDT_ERR_NOSPACE;
 
@@ -478,8 +490,10 @@ int fdt_open_into(const void *fdt, void *buf, int bufsize)
 			return -FDT_ERR_NOSPACE;
 	}
 
-	fdt_packblocks_(fdt, tmp, mem_rsv_size, struct_size,
-			fdt_size_dt_strings(fdt));
+	err = fdt_packblocks_(fdt, tmp, mem_rsv_size, struct_size,
+			      fdt_size_dt_strings(fdt));
+	if (err)
+		return err;
 	memmove(buf, tmp, newsize);
 
 	fdt_set_magic(buf, FDT_MAGIC);
@@ -493,7 +507,7 @@ int fdt_open_into(const void *fdt, void *buf, int bufsize)
 
 int fdt_pack(void *fdt)
 {
-	int mem_rsv_size;
+	int mem_rsv_size, err;
 
 	FDT_RW_PROBE(fdt);
 
@@ -505,8 +519,10 @@ int fdt_pack(void *fdt)
 	if (!can_assume(VALID_DTB) && mem_rsv_size < 0)
 		return -FDT_ERR_NOSPACE;
 
-	fdt_packblocks_(fdt, fdt, mem_rsv_size, fdt_size_dt_struct(fdt),
-			fdt_size_dt_strings(fdt));
+	err = fdt_packblocks_(fdt, fdt, mem_rsv_size, fdt_size_dt_struct(fdt),
+			      fdt_size_dt_strings(fdt));
+	if (err)
+		return err;
 	fdt_set_totalsize(fdt, fdt_data_size_(fdt));
 
 	return 0;
-- 
2.17.5

