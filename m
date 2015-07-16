From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 3/3] fdt: Add functions to retrieve strings
Date: Thu, 16 Jul 2015 13:10:21 +0200
Message-ID: <1437045021-4549-4-git-send-email-thierry.reding@gmail.com>
References: <1437045021-4549-1-git-send-email-thierry.reding@gmail.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=u6/2tHiVckqMLUVltYCE+H9PAB6EkLH/xROeJXmqLXg=;
        b=jGJRek70OoViZCqxDt+vDGi37aE5pTTelhpo/kgJHB5QTsNQ8kvZn5lL663t1U36y5
         t4Yv5R/msgkwTLOEANqTSiETR5v9w2ggFjEXlUyFFk6IrzfFaHub06CSzoX1njHTKrbs
         8nmyzyfjNfISkC5OqFO5JsLG00kHeh+LUPxygmL0uUidBC0FucIKuTPfhd8CKS7nworq
         pHFXxzrc7bnNhf6Zgdl9n5N4KSD6rJ1fzTH3EMM0yEDqa790TTHJj85XnQ4yhWJCZ1K6
         U/YYVNCvDzS3V8US8QjInMUn9lwbU9khIaE3MBdGrZLxxsx8CR1siW0L/DWQzSNZLnsi
         i/hA==
In-Reply-To: <1437045021-4549-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
Changes in v2:
- handle non-NUL-terminated properties more gracefully
- improve documentation

 libfdt/fdt_ro.c | 37 +++++++++++++++++++++++++++++++++++++
 libfdt/libfdt.h | 41 +++++++++++++++++++++++++++++++++++++++++
 tests/strings.c | 32 ++++++++++++++++++++++++++++++++
 3 files changed, 110 insertions(+)

diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
index 39b84b1cea60..4315815969b6 100644
--- a/libfdt/fdt_ro.c
+++ b/libfdt/fdt_ro.c
@@ -593,6 +593,43 @@ int fdt_find_string(const void *fdt, int nodeoffset, const char *property,
 	return -FDT_ERR_NOTFOUND;
 }
 
+int fdt_get_string_index(const void *fdt, int nodeoffset, const char *property,
+			 int index, const char **output)
+{
+	const char *list, *end;
+	int length;
+
+	list = fdt_getprop(fdt, nodeoffset, property, &length);
+	if (!list)
+		return -length;
+
+	end = list + length;
+
+	while (list < end) {
+		length = strnlen(list, end - list) + 1;
+
+		/* Abort if the last string isn't properly NUL-terminated. */
+		if (list + length > end)
+			return -FDT_ERR_BADVALUE;
+
+		if (index == 0) {
+			*output = list;
+			return 0;
+		}
+
+		list += length;
+		index--;
+	}
+
+	return -FDT_ERR_NOTFOUND;
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
index e64680dd741c..bfbc8f9ead34 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -907,6 +907,47 @@ int fdt_count_strings(const void *fdt, int nodeoffset, const char *property);
 int fdt_find_string(const void *fdt, int nodeoffset, const char *property,
 		    const char *string);
 
+/**
+ * fdt_get_string_index() - obtain the string at a given index in a string list
+ * @fdt: pointer to the device tree blob
+ * @nodeoffset: offset of a tree node
+ * @property: name of the property containing the string list
+ * @index: index of the string to return
+ * @output: return location for the string
+ *
+ * Note that this will successfully extract strings from properties with
+ * non-NUL-terminated values. For example on small-valued cell properties
+ * this function will return the empty string.
+ *
+ * The @output parameter is only valid if the function returns 0.
+ *
+ * @return:
+ *   0 if the string was found (@output points to the string)
+ *   -FDT_ERR_BADVALUE if the property value is not NUL-terminated
+ *   -FDT_ERR_NOTFOUND if the property does not exist
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
+ *
+ * This is a shorthand for:
+ *
+ *   fdt_get_string_index(fdt, node, property, 0, output).
+ *
+ * @return:
+ *   0 if the string was found (@output points to the string)
+ *   -FDT_ERR_BADVALUE if the property value is not NUL-terminated
+ *   -FDT_ERR_NOTFOUND if the property does not exist
+ */
+int fdt_get_string(const void *fdt, int nodeoffset, const char *property,
+		   const char **output);
+
 /**********************************************************************/
 /* Read-only functions (addressing related)                           */
 /**********************************************************************/
diff --git a/tests/strings.c b/tests/strings.c
index 29c49bfcc78c..aa83ef0511be 100644
--- a/tests/strings.c
+++ b/tests/strings.c
@@ -58,6 +58,13 @@ static void check_expected_failure(const void *fdt, const char *path,
 	err = fdt_find_string(fdt, offset, "#address-cells", "");
 	if (err != 0)
 		FAIL("empty string not found in #address-cells: %d\n", err);
+
+	/*
+	 * fdt_get_string() can successfully extract strings from non-string
+	 * properties. This is because it doesn't necessarily parse the whole
+	 * property value, which would be necessary for it to determine if a
+	 * valid string or string list is present.
+	 */
 }
 
 static void check_string_count(const void *fdt, const char *path,
@@ -96,6 +103,27 @@ static void check_string_index(const void *fdt, const char *path,
 		     string, property, path, err, index);
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
+		FAIL("Couldn't extract string %d from property %s of node %s: %d\n",
+		     index, property, path, err);
+
+	if (strcmp(string, result) != 0)
+		FAIL("String %d in property %s of node %s is %s, expected %s\n",
+		     index, property, path, result, string);
+}
+
 int main(int argc, char *argv[])
 {
 	void *fdt;
@@ -118,5 +146,9 @@ int main(int argc, char *argv[])
 	check_string_index(fdt, "/device", "compatible", "bar", 1);
 	check_string_index(fdt, "/device", "big-endian", "baz", -1);
 
+	check_string(fdt, "/", "compatible", 0, "test-strings");
+	check_string(fdt, "/device", "compatible", 0, "foo");
+	check_string(fdt, "/device", "compatible", 1, "bar");
+
 	PASS();
 }
-- 
2.4.5
