From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 1/1] dtc: fdtdump: check fdt if not in scanning mode
Date: Tue, 20 Dec 2016 23:32:16 +0100
Message-ID: <20161220223216.28686-1-xypron.glpk@gmx.de>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
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
 fdtdump.c | 57 +++++++++++++++++++++++++++++----------------------------
 1 file changed, 29 insertions(+), 28 deletions(-)

diff --git a/fdtdump.c b/fdtdump.c
index a9a2484..717fef5 100644
--- a/fdtdump.c
+++ b/fdtdump.c
@@ -189,39 +189,40 @@ int main(int argc, char *argv[])
 		die("could not read: %s\n", file);
 
 	/* try and locate an embedded fdt in a bigger blob */
-	if (scan) {
-		unsigned char smagic[FDT_MAGIC_SIZE];
-		char *p = buf;
-		char *endp = buf + len;
+	unsigned char smagic[FDT_MAGIC_SIZE];
+	char *p = buf;
+	char *endp = buf + len;
 
-		fdt_set_magic(smagic, FDT_MAGIC);
+	fdt_set_magic(smagic, FDT_MAGIC);
 
-		/* poor man's memmem */
-		while ((endp - p) >= FDT_MAGIC_SIZE) {
-			p = memchr(p, smagic[0], endp - p - FDT_MAGIC_SIZE);
-			if (!p)
+	/* poor man's memmem */
+	while ((endp - p) >= FDT_MAGIC_SIZE) {
+		p = memchr(p, smagic[0], endp - p - FDT_MAGIC_SIZE);
+		if (!p)
+			break;
+		if (fdt_magic(p) == FDT_MAGIC) {
+			/* try and validate the main struct */
+			off_t this_len = endp - p;
+			fdt32_t max_version = 17;
+			if (fdt_version(p) <= max_version &&
+			    fdt_last_comp_version(p) < max_version &&
+			    fdt_totalsize(p) < this_len &&
+			    fdt_off_dt_struct(p) < this_len &&
+				fdt_off_dt_strings(p) < this_len)
 				break;
-			if (fdt_magic(p) == FDT_MAGIC) {
-				/* try and validate the main struct */
-				off_t this_len = endp - p;
-				fdt32_t max_version = 17;
-				if (fdt_version(p) <= max_version &&
-				    fdt_last_comp_version(p) < max_version &&
-				    fdt_totalsize(p) < this_len &&
-				    fdt_off_dt_struct(p) < this_len &&
-					fdt_off_dt_strings(p) < this_len)
-					break;
-				if (debug)
-					printf("%s: skipping fdt magic at offset %#zx\n",
-						file, p - buf);
-			}
-			++p;
+			if (debug)
+				printf("%s: skipping fdt magic at offset %#zx\n",
+					file, p - buf);
 		}
-		if (!p || ((endp - p) < FDT_MAGIC_SIZE))
-			die("%s: could not locate fdt magic\n", file);
-		printf("%s: found fdt at offset %#zx\n", file, p - buf);
-		buf = p;
+		if (!scan)
+			die("%s: fdt missing\n", file);
+		++p;
 	}
+	if (!p || ((endp - p) < FDT_MAGIC_SIZE))
+		die("%s: could not locate fdt magic\n", file);
+	if (scan)
+		printf("%s: found fdt at offset %#zx\n", file, p - buf);
+	buf = p;
 
 	dump_blob(buf, debug);
 
-- 
2.11.0
