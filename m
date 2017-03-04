From: Nicolas Iooss <nicolas.iooss_linux-oWGTIYur0i8@public.gmane.org>
Subject: [PATCH 3/5] tests: Make realloc_fdt() really allocate *fdt
Date: Sat,  4 Mar 2017 14:26:45 +0100
Message-ID: <20170304132647.23286-3-nicolas.iooss_linux@m4x.org>
References: <20170304132647.23286-1-nicolas.iooss_linux@m4x.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170304132647.23286-1-nicolas.iooss_linux-oWGTIYur0i8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Nicolas Iooss <nicolas.iooss_linux-oWGTIYur0i8@public.gmane.org>

This bug has been found by using clang Static Analyzer: it reported that
the value stored to fdt was never read.

Signed-off-by: Nicolas Iooss <nicolas.iooss_linux-oWGTIYur0i8@public.gmane.org>
---
 tests/sw_tree1.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/sw_tree1.c b/tests/sw_tree1.c
index 6d4c53102967..4887dc3e1172 100644
--- a/tests/sw_tree1.c
+++ b/tests/sw_tree1.c
@@ -42,14 +42,14 @@ static void realloc_fdt(void **fdt, size_t *size, bool created)
 	switch (alloc_mode) {
 	case FIXED:
 		if (!(*fdt))
-			fdt = xmalloc(*size);
+			*fdt = xmalloc(*size);
 		else
 			FAIL("Ran out of space");
 		return;
 
 	case RESIZE:
 		if (!(*fdt)) {
-			fdt = xmalloc(SPACE);
+			*fdt = xmalloc(SPACE);
 		} else if (*size < SPACE) {
 			*size += 1;
 			fdt_resize(*fdt, *fdt, *size);
-- 
2.11.1
