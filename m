From: nwhitehorn-h+KGxgPPiopAfugRpC6u6w@public.gmane.org
Subject: [PATCH v3] Add limited read-only support for older (V2 and V3) device tree to libfdt.
Date: Fri, 19 Jan 2018 21:48:03 +0000
Message-ID: <20180119214803.24934-1-nwhitehorn@freebsd.org>
References: <20171208063149.76523-1-nwhitehorn@freebsd.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171208063149.76523-1-nwhitehorn-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Nathan Whitehorn <nwhitehorn-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>

From: Nathan Whitehorn <nwhitehorn-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>

This can be useful in particular in the kernel when booting on systems
with FDT-emitting firmware that is out of date. Releases of kexec-tools
on ppc64 prior to the end of 2014 are notable examples of such.

Signed-off-by: Nathan Whitehorn <nwhitehorn-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
---

This version of the patch fixes a number of style issues and removes some
unnecessary redundant code noted in review.

 fdtget.c        |  4 +--
 libfdt/fdt.c    |  3 ++
 libfdt/fdt_ro.c | 90 ++++++++++++++++++++++++++++++++++++++++++++++++++-------
 libfdt/libfdt.h |  5 +++-
 4 files changed, 87 insertions(+), 15 deletions(-)

diff --git a/fdtget.c b/fdtget.c
index 6cc5242..34d8194 100644
--- a/fdtget.c
+++ b/fdtget.c
@@ -140,7 +140,6 @@ static int show_data(struct display_info *disp, const char *data, int len)
  */
 static int list_properties(const void *blob, int node)
 {
-	const struct fdt_property *data;
 	const char *name;
 	int prop;
 
@@ -149,8 +148,7 @@ static int list_properties(const void *blob, int node)
 		/* Stop silently when there are no more properties */
 		if (prop < 0)
 			return prop == -FDT_ERR_NOTFOUND ? 0 : prop;
-		data = fdt_get_property_by_offset(blob, prop, NULL);
-		name = fdt_string(blob, fdt32_to_cpu(data->nameoff));
+		fdt_getprop_by_offset(blob, prop, &name, NULL);
 		if (name)
 			puts(name);
 		prop = fdt_next_property_offset(blob, prop);
diff --git a/libfdt/fdt.c b/libfdt/fdt.c
index fd13236..7855a17 100644
--- a/libfdt/fdt.c
+++ b/libfdt/fdt.c
@@ -123,6 +123,9 @@ uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
 		/* skip-name offset, length and value */
 		offset += sizeof(struct fdt_property) - FDT_TAGSIZE
 			+ fdt32_to_cpu(*lenp);
+		if (fdt_version(fdt) < 0x10 && fdt32_to_cpu(*lenp) >= 8 &&
+		    ((offset - fdt32_to_cpu(*lenp)) % 8) != 0)
+			offset += 4;
 		break;
 
 	case FDT_END:
diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
index ce17814..c31275f 100644
--- a/libfdt/fdt_ro.c
+++ b/libfdt/fdt_ro.c
@@ -58,9 +58,10 @@
 static int fdt_nodename_eq_(const void *fdt, int offset,
 			    const char *s, int len)
 {
-	const char *p = fdt_offset_ptr(fdt, offset + FDT_TAGSIZE, len+1);
+	int olen;
+	const char *p = fdt_get_name(fdt, offset, &olen);
 
-	if (!p)
+	if (!p || olen < len)
 		/* short match */
 		return 0;
 
@@ -233,16 +234,34 @@ int fdt_path_offset(const void *fdt, const char *path)
 const char *fdt_get_name(const void *fdt, int nodeoffset, int *len)
 {
 	const struct fdt_node_header *nh = fdt_offset_ptr_(fdt, nodeoffset);
+	const char *nameptr;
 	int err;
 
 	if (((err = fdt_check_header(fdt)) != 0)
 	    || ((err = fdt_check_node_offset_(fdt, nodeoffset)) < 0))
 			goto fail;
 
+	nameptr = nh->name;
+
+	if (fdt_version(fdt) < 0x10) {
+		/*
+		 * For old FDT versions, match the naming conventions of V16:
+		 * give only the leaf name (after all /). The actual tree
+		 * contents are loosely checked.
+		 */
+		const char *leaf;
+		leaf = strrchr(nameptr, '/');
+		if (leaf == NULL) {
+			err = FDT_ERR_BADVALUE;
+			goto fail;
+		}
+		nameptr = leaf+1;
+	}
+
 	if (len)
-		*len = strlen(nh->name);
+		*len = strlen(nameptr);
 
-	return nh->name;
+	return nameptr;
 
  fail:
 	if (len)
@@ -268,9 +287,9 @@ int fdt_next_property_offset(const void *fdt, int offset)
 	return nextprop_(fdt, offset);
 }
 
-const struct fdt_property *fdt_get_property_by_offset(const void *fdt,
-						      int offset,
-						      int *lenp)
+static const struct fdt_property *fdt_get_property_by_offset_(const void *fdt,
+						              int offset,
+						              int *lenp)
 {
 	int err;
 	const struct fdt_property *prop;
@@ -289,11 +308,35 @@ const struct fdt_property *fdt_get_property_by_offset(const void *fdt,
 	return prop;
 }
 
+const struct fdt_property *fdt_get_property_by_offset(const void *fdt,
+						      int offset,
+						      int *lenp)
+{
+	/* Prior to version 16, properties may need realignment
+	 * and this API does not work. fdt_getprop_*() will, however. */
+
+	if (fdt_version(fdt) < 0x10) {
+		if (lenp)
+			*lenp = -FDT_ERR_BADVERSION;
+		return NULL;
+	}
+
+	return fdt_get_property_by_offset_(fdt, offset, lenp);
+}
+
 const struct fdt_property *fdt_get_property_namelen(const void *fdt,
 						    int offset,
 						    const char *name,
 						    int namelen, int *lenp)
 {
+	/* Prior to version 16, properties may need realignment
+	 * and this API does not work. fdt_getprop_*() will, however. */
+	if (fdt_version(fdt) < 0x10) {
+		if (lenp)
+			*lenp = -FDT_ERR_BADVERSION;
+		return NULL;
+	}
+
 	for (offset = fdt_first_property_offset(fdt, offset);
 	     (offset >= 0);
 	     (offset = fdt_next_property_offset(fdt, offset))) {
@@ -324,12 +367,33 @@ const struct fdt_property *fdt_get_property(const void *fdt,
 const void *fdt_getprop_namelen(const void *fdt, int nodeoffset,
 				const char *name, int namelen, int *lenp)
 {
-	const struct fdt_property *prop;
+	const struct fdt_property *prop = NULL;
+	int offset = nodeoffset;
 
-	prop = fdt_get_property_namelen(fdt, nodeoffset, name, namelen, lenp);
-	if (!prop)
+	for (offset = fdt_first_property_offset(fdt, offset);
+	     (offset >= 0);
+	     (offset = fdt_next_property_offset(fdt, offset))) {
+		if (!(prop = fdt_get_property_by_offset_(fdt, offset, lenp))) {
+			if (lenp)
+				*lenp = -FDT_ERR_INTERNAL;
+			return NULL;
+		}
+
+		if (fdt_string_eq_(fdt, fdt32_to_cpu(prop->nameoff),
+				   name, namelen))
+			break;
+	}
+
+	if (lenp && offset < 0)
+		*lenp = offset;
+
+	if (!prop || offset < 0)
 		return NULL;
 
+	/* Handle realignment */
+	if (fdt_version(fdt) < 0x10 && (offset + sizeof(*prop)) % 8 &&
+	    fdt32_to_cpu(prop->len) >= 8)
+		return prop->data + 4;
 	return prop->data;
 }
 
@@ -338,11 +402,15 @@ const void *fdt_getprop_by_offset(const void *fdt, int offset,
 {
 	const struct fdt_property *prop;
 
-	prop = fdt_get_property_by_offset(fdt, offset, lenp);
+	prop = fdt_get_property_by_offset_(fdt, offset, lenp);
 	if (!prop)
 		return NULL;
 	if (namep)
 		*namep = fdt_string(fdt, fdt32_to_cpu(prop->nameoff));
+
+	if (fdt_version(fdt) < 0x10 && (offset + sizeof(*prop)) % 8 &&
+	    fdt32_to_cpu(prop->len) >= 8)
+		return prop->data + 4;
 	return prop->data;
 }
 
diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index baa882c..7ac3e8a 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -54,7 +54,7 @@
 #include <libfdt_env.h>
 #include <fdt.h>
 
-#define FDT_FIRST_SUPPORTED_VERSION	0x10
+#define FDT_FIRST_SUPPORTED_VERSION	0x02
 #define FDT_LAST_SUPPORTED_VERSION	0x11
 
 /* Error codes: informative error codes */
@@ -526,6 +526,9 @@ int fdt_next_property_offset(const void *fdt, int offset);
  * fdt_property structure within the device tree blob at the given
  * offset.  If lenp is non-NULL, the length of the property value is
  * also returned, in the integer pointed to by lenp.
+ * 
+ * Note that this code only works on device tree versions >= 16. fdt_getprop()
+ * works on all versions.
  *
  * returns:
  *	pointer to the structure representing the property
-- 
2.15.1
