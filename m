From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 2/3] fdt: Add a function to get the index of a string
Date: Tue, 29 Sep 2015 11:09:07 +0200
Message-ID: <1443517748-27819-3-git-send-email-thierry.reding@gmail.com>
References: <1443517748-27819-1-git-send-email-thierry.reding@gmail.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=UWSu/5C8V0QvXElos/11Dv3nEG9sIPGtzTDPojyIJ+g=;
        b=yn1moWWc26/1d7+xEXHz/+rxysM7cTvrvJjF55dLEgNTBgFiZJ2mbN9We2lUA3Ig9N
         Nzl/qU6+d8egKhB8wxcAwc3yiMKtOkWMmeIK/yFnXQWDBKfTodMBcwd0d/gG7B6iSzVC
         NNPyZB3m7uk/ndMWj1+VusTmWwk9MlYnQVFVxSuv4Zye1kWSR/YP7+MbOTTx57NZcXfL
         OcmiLrytkrxmALEJmatc3j4qDzw8v2Ijt7Fp57l4MCx+ptrPoHqanS/tmJbMLvltFEUP
         AXetJrSqgoM/uFDeluyoq6AzfTLjn4fgT1m+ApecWZVOVcJnOIZKejGqgo3FocZmHVuv
         DoVw==
In-Reply-To: <1443517748-27819-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The new fdt_stringlist_search() function will look up a given string in
the list contained in the value of a named property of a given device
tree node and return its index.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Changes in v3:
- rename function to fdt_stringlist_search()

Changes in v2:
- handle non-NUL-terminated properties more gracefully
- improve documentation

 libfdt/fdt_ro.c | 30 ++++++++++++++++++++++++++++++
 libfdt/libfdt.h | 22 ++++++++++++++++++++++
 tests/strings.c | 40 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 92 insertions(+)

diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
index 4cde93193c92..dae31732148a 100644
--- a/libfdt/fdt_ro.c
+++ b/libfdt/fdt_ro.c
@@ -563,6 +563,36 @@ int fdt_stringlist_count(const void *fdt, int nodeoffset, const char *property)
 	return count;
 }
 
+int fdt_stringlist_search(const void *fdt, int nodeoffset, const char *property,
+			  const char *string)
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
index 2863001817c1..aa376b83e7e5 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -885,6 +885,28 @@ int fdt_stringlist_contains(const char *strlist, int listlen, const char *str);
  */
 int fdt_stringlist_count(const void *fdt, int nodeoffset, const char *property);
 
+/**
+ * fdt_stringlist_search - find a string in a string list and return its index
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
+int fdt_stringlist_search(const void *fdt, int nodeoffset, const char *property,
+			  const char *string);
+
 /**********************************************************************/
 /* Read-only functions (addressing related)                           */
 /**********************************************************************/
diff --git a/tests/strings.c b/tests/strings.c
index 923e2ed4de02..c8c7adb97051 100644
--- a/tests/strings.c
+++ b/tests/strings.c
@@ -40,6 +40,24 @@ static void check_expected_failure(const void *fdt, const char *path,
 	err = fdt_stringlist_count(fdt, offset, "#address-cells");
 	if (err != -FDT_ERR_BADVALUE)
 		FAIL("unexpectedly succeeded in parsing #address-cells\n");
+
+	err = fdt_stringlist_search(fdt, offset, "#address-cells", "foo");
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
+	err = fdt_stringlist_search(fdt, offset, "#address-cells", "");
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
+	err = fdt_stringlist_search(fdt, offset, property, string);
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
2.5.0
