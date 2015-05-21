From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] libfdt: fdt_path_offset_*(): Fix handling of paths with options in them
Date: Thu, 21 May 2015 15:00:52 +0200
Message-ID: <1432213252-30292-1-git-send-email-hdegoede@redhat.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

This is another approach at fixing the issues with paths with have options
appended seperated by a ':' character.

commit b4150b59ae ("libfdt: Add fdt_path_offset_namelen()")

Is related to this, it allows the caller to specify to only look at part
of the passed in path. But as experience with using this in the kernel has
shown using this properly is quite hard since the options itself may have
a '/' in them, also see the comment above the new fdt_path_next_seperator
helper this commit adds.

So this commit, which currently is being used by u-boot, instead simply
teaches fdt_path_offset() to just do the right thing when it encounters
paths with a ':' in them.

Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 libfdt/fdt_ro.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
index a65e4b5..9efbcb2 100644
--- a/libfdt/fdt_ro.c
+++ b/libfdt/fdt_ro.c
@@ -154,6 +154,25 @@ int fdt_subnode_offset(const void *fdt, int parentoffset,
 	return fdt_subnode_offset_namelen(fdt, parentoffset, name, strlen(name));
 }
 
+/*
+ * Find the next of path seperator, note we need to search for both '/' and ':'
+ * and then take the first one so that we do the rigth thing for e.g.
+ * "foo/bar:option" and "bar:option/otheroption", both of which happen, so
+ * first searching for either ':' or '/' does not work.
+ */
+static const char *fdt_path_next_seperator(const char *path, int len)
+{
+	const char *sep1 = memchr(path, '/', len);
+	const char *sep2 = memchr(path, ':', len);
+
+	if (sep1 && sep2)
+		return (sep1 < sep2) ? sep1 : sep2;
+	else if (sep1)
+		return sep1;
+	else
+		return sep2;
+}
+
 int fdt_path_offset_namelen(const void *fdt, const char *path, int namelen)
 {
 	const char *end = path + namelen;
@@ -164,7 +183,7 @@ int fdt_path_offset_namelen(const void *fdt, const char *path, int namelen)
 
 	/* see if we have an alias */
 	if (*path != '/') {
-		const char *q = memchr(path, '/', end - p);
+		const char *q = fdt_path_next_seperator(path, end - p);
 
 		if (!q)
 			q = end;
@@ -182,10 +201,10 @@ int fdt_path_offset_namelen(const void *fdt, const char *path, int namelen)
 
 		while (*p == '/') {
 			p++;
-			if (p == end)
+			if (p == end || *p == ':')
 				return offset;
 		}
-		q = memchr(p, '/', end - p);
+		q = fdt_path_next_seperator(p, end - p);
 		if (! q)
 			q = end;
 
-- 
2.4.1
