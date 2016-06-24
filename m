From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v3 08/12] libfdt: Add fdt_path_offset_namelen
Date: Fri, 24 Jun 2016 16:27:53 +0200
Message-ID: <20160624142757.32735-9-maxime.ripard@free-electrons.com>
References: <20160624142757.32735-1-maxime.ripard@free-electrons.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160624142757.32735-1-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Add a namelen variant of fdt_path_offset to retrieve the node offset using
only a fixed number of characters.

Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 include/libfdt.h    | 16 +++++++++++++++-
 lib/libfdt/fdt_ro.c | 18 ++++++++++--------
 2 files changed, 25 insertions(+), 9 deletions(-)

diff --git a/include/libfdt.h b/include/libfdt.h
index 2c8a42bcb667..dbe8a0efca87 100644
--- a/include/libfdt.h
+++ b/include/libfdt.h
@@ -365,6 +365,17 @@ int fdt_subnode_offset_namelen(const void *fdt, int parentoffset,
  */
 int fdt_subnode_offset(const void *fdt, int parentoffset, const char *name);
 
+/**
+ * fdt_path_offset_namelen - find a tree node based on substring
+ * @fdt: pointer to the device tree blob
+ * @path: full path of the node to locate
+ * @namelen: number of characters of name to consider
+ *
+ * Identical to fdt_path_offset(), but only examine the first
+ * namelen characters of path for matching the node path.
+ */
+int fdt_path_offset_namelen(const void *fdt, const char *path, int namelen);
+
 /**
  * fdt_path_offset - find a tree node by its full path
  * @fdt: pointer to the device tree blob
@@ -387,7 +398,10 @@ int fdt_subnode_offset(const void *fdt, int parentoffset, const char *name);
  *	-FDT_ERR_BADSTRUCTURE,
  *	-FDT_ERR_TRUNCATED, standard meanings.
  */
-int fdt_path_offset(const void *fdt, const char *path);
+static inline int fdt_path_offset(const void *fdt, const char *path)
+{
+	return fdt_path_offset_namelen(fdt, path, strlen(path));
+}
 
 /**
  * fdt_get_name - retrieve the name of a given node
diff --git a/lib/libfdt/fdt_ro.c b/lib/libfdt/fdt_ro.c
index 503150ef1dc5..05344d3eebfe 100644
--- a/lib/libfdt/fdt_ro.c
+++ b/lib/libfdt/fdt_ro.c
@@ -145,10 +145,10 @@ int fdt_subnode_offset(const void *fdt, int parentoffset,
  * "foo/bar:option" and "bar:option/otheroption", both of which happen, so
  * first searching for either ':' or '/' does not work.
  */
-static const char *fdt_path_next_seperator(const char *path)
+static const char *fdt_path_next_seperator(const void *path, int len)
 {
-	const char *sep1 = strchr(path, '/');
-	const char *sep2 = strchr(path, ':');
+	const void *sep1 = memchr(path, '/', len);
+	const void *sep2 = memchr(path, ':', len);
 
 	if (sep1 && sep2)
 		return (sep1 < sep2) ? sep1 : sep2;
@@ -158,9 +158,9 @@ static const char *fdt_path_next_seperator(const char *path)
 		return sep2;
 }
 
-int fdt_path_offset(const void *fdt, const char *path)
+int fdt_path_offset_namelen(const void *fdt, const char *path, int namelen)
 {
-	const char *end = path + strlen(path);
+	const char *end = path + namelen;
 	const char *p = path;
 	int offset = 0;
 
@@ -168,7 +168,7 @@ int fdt_path_offset(const void *fdt, const char *path)
 
 	/* see if we have an alias */
 	if (*path != '/') {
-		const char *q = fdt_path_next_seperator(path);
+		const char *q = fdt_path_next_seperator(path, namelen);
 
 		if (!q)
 			q = end;
@@ -181,14 +181,16 @@ int fdt_path_offset(const void *fdt, const char *path)
 		p = q;
 	}
 
-	while (*p) {
+	while (*p && (p < end)) {
 		const char *q;
 
 		while (*p == '/')
 			p++;
+
 		if (*p == '\0' || *p == ':')
 			return offset;
-		q = fdt_path_next_seperator(p);
+
+		q = fdt_path_next_seperator(p, end - p);
 		if (!q)
 			q = end;
 
-- 
2.9.0
