From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 2/3] fdt: Add a function to get the index of a string
Date: Thu, 16 Jul 2015 13:10:20 +0200
Message-ID: <1437045021-4549-3-git-send-email-thierry.reding@gmail.com>
References: <1437045021-4549-1-git-send-email-thierry.reding@gmail.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Fjm0N7s31M3kB5/DLnpZnQEdwz1xBlBSOB8Nk8v8tJM=;
        b=E0h2Za0W01x1MX3LCaluL/pQg5IvrbVKNvG0u5aVA0qsaCRpeWRph47eekkmSEq9AS
         mNjUZ7hq+Dr0x0Eq7VRwAnp+MnhVjDDf9VIWsreG+oqfnTNjYwNm0ybIzjhi7Y4Sg30b
         DJkErkX5r0vUdQqLD2Dl5I8KbkzKfVHHOmDoAy7T4yzi4pTycbSC0jF9p3/l+JX3apxN
         MTtD8n+eIak8HRaSa9O4WR1G/OWWlY75t11j/ghwXkOyBAUOqQWK0u6Va6d3UD0J97wq
         776TDCoA7EcZMg7hVJWkYsVKMZYa09VPQvp4U6PIqvWr1lPFP/kAp2YppdGmoJMqtzbM
         auwg==
In-Reply-To: <1437045021-4549-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Given a device tree node and a property name, the new fdt_find_string()
function will look up a given string in the string list contained in the
property's value and return its index.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Changes in v2:
- handle non-NUL-terminated properties more gracefully
- improve documentation

 libfdt/fdt_ro.c | 30 ++++++++++++++++++++++++++++++
 libfdt/libfdt.h | 22 ++++++++++++++++++++++
 tests/strings.c | 40 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 92 insertions(+)

diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
index cf55c71df79c..39b84b1cea60 100644
--- a/libfdt/fdt_ro.c
+++ b/libfdt/fdt_ro.c
@@ -563,6 +563,36 @@ int fdt_count_strings(const void *fdt, int nodeoffset, const char *property)
 	return count;
 }
 
+int fdt_find_string(const void *fdt, int nodeoffset, const char *property,
+		    const char *string)
+{
+	int length, len, index = 0;
+	const char *list, *end;
+
+	list = fdt_getprop(fdt, nodeoffset, property, &length);
+	if (!list)
+		return -length;
+
+	len = strlen(string) + 1;
+	end = list + length;
+
+	while (list < end) {
+		length = strnlen(list, end - list) + 1;
+
+		/* Abort if the last string isn't properly NUL-terminated. */
+		if (list + length > end)
+			return -FDT_ERR_BADVALUE;
+
+		if (length == len && memcmp(list, string, length) == 0)
+			return index;
+
+		list += length;
+		index++;
+	}
+
+	return -FDT_ERR_NOTFOUND;
+}
+
 int fdt_node_check_compatible(const void *fdt, int nodeoffset,
 			      const char *compatible)
 {
diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index bf60c1593e4e..e64680dd741c 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -885,6 +885,28 @@ int fdt_stringlist_contains(const char *strlist, int listlen, const char *str);
  */
 int fdt_count_strings(const void *fdt, int nodeoffset, const char *property);
 
+/**
+ * fdt_find_string - find a string in a string list and return its index
+ * @fdt: pointer to the device tree blob
+ * @nodeoffset: offset of a tree node
+ * @property: name of the property containing the string list
+ * @string: string to look up in the string list
+ *
+ * Note that it is possible for this function to succeed on property values
+ * that are not NUL-terminated. That's because the function will stop after
+ * finding the first occurrence of @string. This can for example happen with
+ * small-valued cell properties, such as #address-cells, when searching for
+ * the empty string.
+ *
+ * @return:
+ *   the index of the string in the list of strings
+ *   -FDT_ERR_BADVALUE if the property value is not NUL-terminated
+ *   -FDT_ERR_NOTFOUND if the property does not exist or does not contain
+ *                     the given string
+ */
+int fdt_find_string(const void *fdt, int nodeoffset, const char *property,
+		    const char *string);
+
 /**********************************************************************/
 /* Read-only functions (addressing related)                           */
 /**********************************************************************/
diff --git a/tests/strings.c b/tests/strings.c
index e10d9ece5a3e..29c49bfcc78c 100644
--- a/tests/strings.c
+++ b/tests/strings.c
@@ -40,6 +40,24 @@ static void check_expected_failure(const void *fdt, const char *path,
 	err = fdt_count_strings(fdt, offset, "#address-cells");
 	if (err != -FDT_ERR_BADVALUE)
 		FAIL("unexpectedly succeeded in parsing #address-cells\n");
+
+	err = fdt_find_string(fdt, offset, "#address-cells", "foo");
+	if (err != -FDT_ERR_BADVALUE)
+		FAIL("found string in #address-cells: %d\n", err);
+
+	/*
+	 * Note that the #address-cells property contains a small 32-bit
+	 * unsigned integer, hence some bytes will be zero, and searching for
+	 * the empty string will succeed.
+	 *
+	 * The reason for this oddity is that the function will exit when the
+	 * first occurrence of the string is found, but in order to determine
+	 * that the property does not contain a valid string list it would
+	 * need to process the whole value.
+	 */
+	err = fdt_find_string(fdt, offset, "#address-cells", "");
+	if (err != 0)
+		FAIL("empty string not found in #address-cells: %d\n", err);
 }
 
 static void check_string_count(const void *fdt, const char *path,
@@ -61,6 +79,23 @@ static void check_string_count(const void *fdt, const char *path,
 		     path, property, err, count);
 }
 
+static void check_string_index(const void *fdt, const char *path,
+			       const char *property, const char *string,
+			       int index)
+{
+	int offset, err;
+
+	offset = fdt_path_offset(fdt, path);
+	if (offset < 0)
+		FAIL("Couldn't find path %s", path);
+
+	err = fdt_find_string(fdt, offset, property, string);
+
+	if (err != index)
+		FAIL("Index of %s in property %s of node %s is %d, expected %d\n",
+		     string, property, path, err, index);
+}
+
 int main(int argc, char *argv[])
 {
 	void *fdt;
@@ -78,5 +113,10 @@ int main(int argc, char *argv[])
 	check_string_count(fdt, "/device", "compatible", 2);
 	check_string_count(fdt, "/device", "big-endian", 0);
 
+	check_string_index(fdt, "/", "compatible", "test-strings", 0);
+	check_string_index(fdt, "/device", "compatible", "foo", 0);
+	check_string_index(fdt, "/device", "compatible", "bar", 1);
+	check_string_index(fdt, "/device", "big-endian", "baz", -1);
+
 	PASS();
 }
-- 
2.4.5
