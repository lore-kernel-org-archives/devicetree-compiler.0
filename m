From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 02/14] libfdt: fdt_mem_rsv(): Fix comparison warnings
Date: Mon, 21 Sep 2020 17:52:51 +0100
Message-ID: <20200921165303.9115-3-andre.przywara@arm.com>
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
in comparisons in fdt_mem_rsv().

Since all involved values must be positive, change the used types to be
unsigned.

Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
---
 libfdt/fdt_ro.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
index e03570a..3c8d143 100644
--- a/libfdt/fdt_ro.c
+++ b/libfdt/fdt_ro.c
@@ -157,8 +157,8 @@ int fdt_generate_phandle(const void *fdt, uint32_t *phandle)
 
 static const struct fdt_reserve_entry *fdt_mem_rsv(const void *fdt, int n)
 {
-	int offset = n * sizeof(struct fdt_reserve_entry);
-	int absoffset = fdt_off_mem_rsvmap(fdt) + offset;
+	unsigned int offset = n * sizeof(struct fdt_reserve_entry);
+	unsigned int absoffset = fdt_off_mem_rsvmap(fdt) + offset;
 
 	if (!can_assume(VALID_INPUT)) {
 		if (absoffset < fdt_off_mem_rsvmap(fdt))
-- 
2.17.5

