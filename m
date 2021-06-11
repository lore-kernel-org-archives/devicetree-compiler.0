From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 2/4] tests: Enhance truncated_memrsv to test fdt_open_into()
Date: Fri, 11 Jun 2021 12:58:21 +0100
Message-ID: <20210611115823.31583-3-andre.przywara@arm.com>
References: <20210611115823.31583-1-andre.przywara@arm.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20210611115823.31583-1-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

We already check that libfdt's r/o functions can deal properly with
malformed blobs, where the memreserve block is not correct.

Add a test for fdt_open_into(), which also queries the memreserve block,
and uses the return value as an offset into a buffer.

Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
---
 tests/truncated_memrsv.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/tests/truncated_memrsv.c b/tests/truncated_memrsv.c
index d78036c..9defef3 100644
--- a/tests/truncated_memrsv.c
+++ b/tests/truncated_memrsv.c
@@ -18,7 +18,8 @@
 int main(int argc, char *argv[])
 {
 	void *fdt = &truncated_memrsv;
-	int err;
+	char *buf;
+	int err, bufsize;
 	uint64_t addr, size;
 
 	test_init(argc, argv);
@@ -46,5 +47,12 @@ int main(int argc, char *argv[])
 		FAIL("fdt_get_mem_rsv(1) returned %d instead of -FDT_ERR_BADOFFSET",
 		     err);
 
+	bufsize = fdt_totalsize(fdt);
+	buf = xmalloc(bufsize);
+	err = fdt_open_into(fdt, buf, bufsize);
+	if (err != -FDT_ERR_TRUNCATED)
+		FAIL("fdt_open_into() returned %d instead of -FDT_ERR_TRUNCATED",
+		     err);
+
 	PASS();
 }
-- 
2.17.5

