From: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [PATCH] pylibfdt: Rework "avoid unused variable warning" lines
Date: Mon, 24 May 2021 11:49:10 -0400
Message-ID: <20210524154910.30523-1-trini@konsulko.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <loeliger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Clang has -Wself-assign enabled by default under -Wall and so when
building with -Werror we would get an error here.  Inspired by Linux
kernel git commit a21151b9d81a ("tools/build: tweak unused value
workaround") make use of the fact that both Clang and GCC support
casting to `void` as the method to note that something is intentionally
unused.

Signed-off-by: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
---
 pylibfdt/libfdt.i | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
index 3e09d3a7eedc..51ee8014d17c 100644
--- a/pylibfdt/libfdt.i
+++ b/pylibfdt/libfdt.i
@@ -1009,7 +1009,7 @@ typedef uint32_t fdt32_t;
 	}
 	$1 = (void *)PyByteArray_AsString($input);
         fdt = $1;
-        fdt = fdt; /* avoid unused variable warning */
+        (void)fdt; /* avoid unused variable warning */
 }
 
 /* Some functions do change the device tree, so use void * */
@@ -1020,7 +1020,7 @@ typedef uint32_t fdt32_t;
 	}
 	$1 = PyByteArray_AsString($input);
         fdt = $1;
-        fdt = fdt; /* avoid unused variable warning */
+        (void)fdt; /* avoid unused variable warning */
 }
 
 /* typemap used for fdt_get_property_by_offset() */
-- 
2.17.1

