From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] libfdt: Add FDT alignment check to fdt_check_header()
Date: Tue,  6 Apr 2021 14:07:12 -0500
Message-ID: <20210406190712.2118098-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Only checking the FDT alignment in fdt_ro_probe_() means that
fdt_check_header() can pass, but then subsequent API calls fail on
alignment checks. Let's add an alignment check to fdt_check_header() so
alignment errors are found up front.

Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
For background, the new alignment check triggered a crash in the 
linux kernel. Yes, we should fix the error handling, but 
fdt_check_header() shouldn't tell us the FDT is valid only to fail 
later on.

Maybe we should move the check instead, but fdt_ro_probe_() and
fdt_check_header() already have a lot of the same checks.

 libfdt/fdt.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/libfdt/fdt.c b/libfdt/fdt.c
index 3e893073da05..9fe7cf4b747d 100644
--- a/libfdt/fdt.c
+++ b/libfdt/fdt.c
@@ -90,6 +90,10 @@ int fdt_check_header(const void *fdt)
 {
 	size_t hdrsize;
 
+	/* The device tree must be at an 8-byte aligned address */
+	if ((uintptr_t)fdt & 7)
+		return -FDT_ERR_ALIGNMENT;
+
 	if (fdt_magic(fdt) != FDT_MAGIC)
 		return -FDT_ERR_BADMAGIC;
 	if (!can_assume(LATEST)) {
-- 
2.27.0

