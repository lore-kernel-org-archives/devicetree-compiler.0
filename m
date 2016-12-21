From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 1/1 v2] dtc: fdtdump: check fdt if not in scanning mode
Date: Thu, 22 Dec 2016 00:59:06 +0100
Message-ID: <20161221235906.24281-1-xypron.glpk@gmx.de>
References: <20161221224138.GA14282@umbus.fritz.box>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161221224138.GA14282-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>

Running fdtdump without scan mode for an invalid file often
results in a segmentation fault because the fdt header is
not checked.

With the patch the header is checked both in scanning as
well as in non-scanning mode.

Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
---

v2:
	Refactor header check as separate function.

 fdtdump.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/fdtdump.c b/fdtdump.c
index a9a2484..4137689 100644
--- a/fdtdump.c
+++ b/fdtdump.c
@@ -16,6 +16,7 @@
 #include "util.h"
 
 #define FDT_MAGIC_SIZE	4
+#define MAX_VERSION 17
 
 #define ALIGN(x, a)	(((x) + ((a) - 1)) & ~((a) - 1))
 #define PALIGN(p, a)	((void *)(ALIGN((unsigned long)(p), (a))))
@@ -159,6 +160,20 @@ static const char * const usage_opts_help[] = {
 	USAGE_COMMON_OPTS_HELP
 };
 
+static inline int valid_header(char *p, off_t len)
+{
+	if (len < sizeof(struct fdt_header) ||
+	    fdt_magic(p) != FDT_MAGIC ||
+	    fdt_version(p) > MAX_VERSION ||
+	    fdt_last_comp_version(p) >= MAX_VERSION ||
+	    fdt_totalsize(p) >= len ||
+	    fdt_off_dt_struct(p) >= len ||
+	    fdt_off_dt_strings(p) >= len)
+		return 0;
+	else
+		return 1;
+}
+
 int main(int argc, char *argv[])
 {
 	int opt;
@@ -204,12 +219,7 @@ int main(int argc, char *argv[])
 			if (fdt_magic(p) == FDT_MAGIC) {
 				/* try and validate the main struct */
 				off_t this_len = endp - p;
-				fdt32_t max_version = 17;
-				if (fdt_version(p) <= max_version &&
-				    fdt_last_comp_version(p) < max_version &&
-				    fdt_totalsize(p) < this_len &&
-				    fdt_off_dt_struct(p) < this_len &&
-					fdt_off_dt_strings(p) < this_len)
+				if (valid_header(p, this_len))
 					break;
 				if (debug)
 					printf("%s: skipping fdt magic at offset %#zx\n",
@@ -217,11 +227,12 @@ int main(int argc, char *argv[])
 			}
 			++p;
 		}
-		if (!p || ((endp - p) < FDT_MAGIC_SIZE))
+		if (!p || endp - p < sizeof(struct fdt_header))
 			die("%s: could not locate fdt magic\n", file);
 		printf("%s: found fdt at offset %#zx\n", file, p - buf);
 		buf = p;
-	}
+	} else if (!valid_header(buf, len))
+		die("%s: header is not valid\n", file);
 
 	dump_blob(buf, debug);
 
-- 
2.11.0
