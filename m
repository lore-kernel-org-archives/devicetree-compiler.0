From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v4 07/13] libfdt: Fix separator spelling
Date: Tue,  5 Jul 2016 10:26:40 +0200
Message-ID: <20160705082646.25044-8-maxime.ripard@free-electrons.com>
References: <20160705082646.25044-1-maxime.ripard@free-electrons.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160705082646.25044-1-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

The function fdt_path_next_seperator had an obvious mispell. Fix it.

Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 lib/libfdt/fdt_ro.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/lib/libfdt/fdt_ro.c b/lib/libfdt/fdt_ro.c
index 503150ef1dc5..6b737b211d2e 100644
--- a/lib/libfdt/fdt_ro.c
+++ b/lib/libfdt/fdt_ro.c
@@ -140,12 +140,12 @@ int fdt_subnode_offset(const void *fdt, int parentoffset,
 }
 
 /*
- * Find the next of path seperator, note we need to search for both '/' and ':'
+ * Find the next of path separator, note we need to search for both '/' and ':'
  * and then take the first one so that we do the right thing for e.g.
  * "foo/bar:option" and "bar:option/otheroption", both of which happen, so
  * first searching for either ':' or '/' does not work.
  */
-static const char *fdt_path_next_seperator(const char *path)
+static const char *fdt_path_next_separator(const char *path)
 {
 	const char *sep1 = strchr(path, '/');
 	const char *sep2 = strchr(path, ':');
@@ -168,7 +168,7 @@ int fdt_path_offset(const void *fdt, const char *path)
 
 	/* see if we have an alias */
 	if (*path != '/') {
-		const char *q = fdt_path_next_seperator(path);
+		const char *q = fdt_path_next_separator(path);
 
 		if (!q)
 			q = end;
@@ -188,7 +188,7 @@ int fdt_path_offset(const void *fdt, const char *path)
 			p++;
 		if (*p == '\0' || *p == ':')
 			return offset;
-		q = fdt_path_next_seperator(p);
+		q = fdt_path_next_separator(p);
 		if (!q)
 			q = end;
 
-- 
2.9.0
