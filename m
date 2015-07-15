From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/3] fdt: Add functions to retrieve strings
Date: Wed, 15 Jul 2015 13:13:59 +0200
Message-ID: <1436958839-14793-4-git-send-email-thierry.reding@gmail.com>
References: <1436958839-14793-1-git-send-email-thierry.reding@gmail.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Eqxr9pUA8ilkZ+QrIlPiAXbza4kv5ysEyRQ/6gDdnEg=;
        b=VC2cTmAka//tFqk0qDzP4IXtR/Izl/Y6baj440MaLe6OIfgsmJTbnan8u4QZ7EjHJu
         IVGmmuxMy3VdJ0J1EnKm30W7hV8jjvjjSNuqx6g0rjjggohRxVZiJpAhfucvSymGEyM6
         stGtoOMMzXlvfV9EgpabXI+tUf/mXIThFwLdO1huhZwhKKqbDmLicPSL6Ll3t2dfPQvq
         8WzfbzOasb82F5YoUbXa/JE0SpFrymbxghGhei/GsNk3ekLe+cX0cQVq7E5B6gD6pM8B
         lnnqwW4KSt0YQcoG/DEZirMqZqv+7OORU08z+zdllXgOM+DdR91WdYppSO5SAl9tW733
         V40Q==
In-Reply-To: <1436958839-14793-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Given a device tree node, a property name and an index, the new function
fdt_get_string_index() will return in an output argument a pointer to
the index'th string in the property's value.

The fdt_get_string() is a shortcut for the above with the index being 0.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 libfdt/fdt_ro.c | 30 ++++++++++++++++++++++++++++++
 libfdt/libfdt.h | 27 +++++++++++++++++++++++++++
 tests/strings.c | 24 ++++++++++++++++++++++++
 3 files changed, 81 insertions(+)

diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
index aab3d1b94509..34f09d6c8c09 100644
--- a/libfdt/fdt_ro.c
+++ b/libfdt/fdt_ro.c
@@ -584,6 +584,36 @@ int fdt_find_string(const void *fdt, int nodeoffset, const char *property,
 	return -FDT_ERR_NOTFOUND;
 }
 
+int fdt_get_string_index(const void *fdt, int nodeoffset, const char *property,
+			 int index, const char **output)
+{
+	const char *list;
+	int length, i;
+
+	list = fdt_getprop(fdt, nodeoffset, property, &length);
+
+	for (i = 0; i < length; i++) {
+		int len = strlen(list);
+
+		if (index == 0) {
+			*output = list;
+			return 0;
+		}
+
+		list += len + 1;
+		i += len;
+		index--;
+	}
+
+	return FDT_ERR_NOTFOUND;
+}
+
+int fdt_get_string(const void *fdt, int nodeoffset, const char *property,
+		   const char **output)
+{
+	return fdt_get_string_index(fdt, nodeoffset, property, 0, output);
+}
+
 int fdt_node_check_compatible(const void *fdt, int nodeoffset,
 			      const char *compatible)
 {
diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index 34ab30dc3338..518550f1927d 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -888,6 +888,33 @@ int fdt_count_strings(const void *fdt, int nodeoffset, const char *property);
 int fdt_find_string(const void *fdt, int nodeoffset, const char *property,
 		    const char *string);
 
+/**
+ * fdt_get_string_index() - obtain the string at a given index in a string list
+ * @fdt: pointer to the device tree blob
+ * @nodeoffset: offset of a tree node
+ * @property: name of the property containing the string list
+ * @index: index of the string to return
+ * @output: return location for the string
+ * @return: 0 if the string was found or a negative error code otherwise
+ */
+int fdt_get_string_index(const void *fdt, int nodeoffset, const char *property,
+			 int index, const char **output);
+
+/**
+ * fdt_get_string() - obtain the first string in a string list
+ * @fdt: pointer to the device tree blob
+ * @nodeoffset: offset of a tree node
+ * @property: name of the property containing the string list
+ * @output: return location for the string
+ * @return: 0 if the string was found or a negative error code otherwise
+ *
+ * This is a shortcut for:
+ *
+ *	fdt_get_string_index(fdt, node, property, 0, output).
+ */
+int fdt_get_string(const void *fdt, int nodeoffset, const char *property,
+		   const char **output);
+
 /**********************************************************************/
 /* Read-only functions (addressing related)                           */
 /**********************************************************************/
diff --git a/tests/strings.c b/tests/strings.c
index 050230567468..e532e5fa8656 100644
--- a/tests/strings.c
+++ b/tests/strings.c
@@ -63,6 +63,26 @@ static void check_string_index(const void *fdt, const char *path,
 		     path, err, index);
 }
 
+static void check_string(const void *fdt, const char *path,
+			 const char *property, int index,
+			 const char *string)
+{
+	const char *result;
+	int offset, err;
+
+	offset = fdt_path_offset(fdt, path);
+	if (offset < 0)
+		FAIL("Couldn't find path %s", path);
+
+	err = fdt_get_string_index(fdt, offset, property, index, &result);
+	if (err < 0)
+		FAIL("Couldn't extract string: %d\n", err);
+
+	if (strcmp(string, result) != 0)
+		FAIL("String %d is %s instead of %s\n",
+		     index, result, string);
+}
+
 int main(int argc, char *argv[])
 {
 	void *fdt;
@@ -82,5 +102,9 @@ int main(int argc, char *argv[])
 	check_string_index(fdt, "/device", "compatible", "baz", 1);
 	check_string_index(fdt, "/device", "big-endian", "bL", -1);
 
+	check_string(fdt, "/", "compatible", 0, "foo");
+	check_string(fdt, "/device", "compatible", 0, "bar");
+	check_string(fdt, "/device", "compatible", 1, "baz");
+
 	PASS();
 }
-- 
2.4.5
