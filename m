From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 3/3] fdt: Add functions to retrieve strings
Date: Tue, 29 Sep 2015 11:09:08 +0200
Message-ID: <1443517748-27819-4-git-send-email-thierry.reding@gmail.com>
References: <1443517748-27819-1-git-send-email-thierry.reding@gmail.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=3MRmZXgpkwGQGfvG0vR5RcyTV5k2w4To9vUWipDXJAQ=;
        b=01cRnsdL3lY+92l+9+XOfyuI3BNNAAzu/MSTEs2iYFFTuc7W7pf9o3xUGnX57ivCA5
         rxkmA1cDwhpjDBeUUYPKtGxZjmndrOACGvpOcyOCFVLSjW5bYHI8Vdqg/d8f9TxML0RP
         4M3sZd2OclqN1JAqbBwdQaduJBEZ+OHonMVdd1WjpbFcp3bqNobf+Gnjs57aHlxY8u5N
         V+euWzP9GSySgY/YncEZ1fyklEKF9l5ju8cwFmtaHkrm7zPY+8Ro0YfE98T6HuoxaUuq
         aabk10dRezfGGa12+WbtX4ZVgPm36F7wROSdAUht/Q6mc6Ajlk8QRG2V40d27S0ztiFM
         07TQ==
In-Reply-To: <1443517748-27819-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Given a device tree node, a property name and an index, the new function
fdt_stringlist_get() will return a pointer to the index'th string in the
property's value and return its length (or an error code on failure) in
an output argument.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Changes in v3:
- rename function to fdt_stringlist_get()
- return string (or NULL) instead of string length (or error code)
- return length of string or error code in output parameter
- remove non-indexed shortcut

Changes in v2:
- handle non-NUL-terminated properties more gracefully
- improve documentation

 libfdt/fdt_ro.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
 libfdt/libfdt.h | 28 ++++++++++++++++++++++++++++
 tests/strings.c | 32 ++++++++++++++++++++++++++++++++
 3 files changed, 105 insertions(+)

diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
index dae31732148a..c56ed8e826fe 100644
--- a/libfdt/fdt_ro.c
+++ b/libfdt/fdt_ro.c
@@ -593,6 +593,51 @@ int fdt_stringlist_search(const void *fdt, int nodeoffset, const char *property,
 	return -FDT_ERR_NOTFOUND;
 }
 
+const char *fdt_stringlist_get(const void *fdt, int nodeoffset,
+			       const char *property, int index,
+			       int *lenp)
+{
+	const char *list, *end;
+	int length;
+
+	list = fdt_getprop(fdt, nodeoffset, property, &length);
+	if (!list) {
+		if (lenp)
+			*lenp = length;
+
+		return NULL;
+	}
+
+	end = list + length;
+
+	while (list < end) {
+		length = strnlen(list, end - list) + 1;
+
+		/* Abort if the last string isn't properly NUL-terminated. */
+		if (list + length > end) {
+			if (lenp)
+				*lenp = -FDT_ERR_BADVALUE;
+
+			return NULL;
+		}
+
+		if (index == 0) {
+			if (lenp)
+				*lenp = length - 1;
+
+			return list;
+		}
+
+		list += length;
+		index--;
+	}
+
+	if (lenp)
+		*lenp = -FDT_ERR_NOTFOUND;
+
+	return NULL;
+}
+
 int fdt_node_check_compatible(const void *fdt, int nodeoffset,
 			      const char *compatible)
 {
diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index aa376b83e7e5..78adb1232e79 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -907,6 +907,34 @@ int fdt_stringlist_count(const void *fdt, int nodeoffset, const char *property);
 int fdt_stringlist_search(const void *fdt, int nodeoffset, const char *property,
 			  const char *string);
 
+/**
+ * fdt_stringlist_get() - obtain the string at a given index in a string list
+ * @fdt: pointer to the device tree blob
+ * @nodeoffset: offset of a tree node
+ * @property: name of the property containing the string list
+ * @index: index of the string to return
+ * @lenp: return location for the string length or an error code on failure
+ *
+ * Note that this will successfully extract strings from properties with
+ * non-NUL-terminated values. For example on small-valued cell properties
+ * this function will return the empty string.
+ *
+ * If non-NULL, the length of the string (on success) or a negative error-code
+ * (on failure) will be stored in the integer pointer to by lenp.
+ *
+ * @return:
+ *   A pointer to the string at the given index in the string list or NULL on
+ *   failure. On success the length of the string will be stored in the memory
+ *   location pointed to by the lenp parameter, if non-NULL. On failure one of
+ *   the following negative error codes will be returned in the lenp parameter
+ *   (if non-NULL):
+ *     -FDT_ERR_BADVALUE if the property value is not NUL-terminated
+ *     -FDT_ERR_NOTFOUND if the property does not exist
+ */
+const char *fdt_stringlist_get(const void *fdt, int nodeoffset,
+			       const char *property, int index,
+			       int *lenp);
+
 /**********************************************************************/
 /* Read-only functions (addressing related)                           */
 /**********************************************************************/
diff --git a/tests/strings.c b/tests/strings.c
index c8c7adb97051..8d23e965b58a 100644
--- a/tests/strings.c
+++ b/tests/strings.c
@@ -58,6 +58,13 @@ static void check_expected_failure(const void *fdt, const char *path,
 	err = fdt_stringlist_search(fdt, offset, "#address-cells", "");
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
+	int offset, len;
+
+	offset = fdt_path_offset(fdt, path);
+	if (offset < 0)
+		FAIL("Couldn't find path %s", path);
+
+	result = fdt_stringlist_get(fdt, offset, property, index, &len);
+	if (!result)
+		FAIL("Couldn't extract string %d from property %s of node %s: %d\n",
+		     index, property, path, len);
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
2.5.0
