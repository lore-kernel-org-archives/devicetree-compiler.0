From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 03/14] libfdt: fdt_grab_space_(): Fix comparison warning
Date: Mon, 21 Sep 2020 17:52:52 +0100
Message-ID: <20200921165303.9115-4-andre.przywara@arm.com>
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
in a comparison in fdt_grab_space_().

All the involved values cannot be negative, so let's switch the types of
the local variables to unsigned to make the compiler happy.

Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
---
 libfdt/fdt_sw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/libfdt/fdt_sw.c b/libfdt/fdt_sw.c
index 94ce4bb..d10a720 100644
--- a/libfdt/fdt_sw.c
+++ b/libfdt/fdt_sw.c
@@ -93,8 +93,8 @@ static inline uint32_t sw_flags(void *fdt)
 
 static void *fdt_grab_space_(void *fdt, size_t len)
 {
-	int offset = fdt_size_dt_struct(fdt);
-	int spaceleft;
+	unsigned int offset = fdt_size_dt_struct(fdt);
+	unsigned int spaceleft;
 
 	spaceleft = fdt_totalsize(fdt) - fdt_off_dt_struct(fdt)
 		- fdt_size_dt_strings(fdt);
-- 
2.17.5

