From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/3] fdt: Add a function to get the index of a string
Date: Wed, 15 Jul 2015 13:13:58 +0200
Message-ID: <1436958839-14793-3-git-send-email-thierry.reding@gmail.com>
References: <1436958839-14793-1-git-send-email-thierry.reding@gmail.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=NTBqvaCG1ecTNsaALRGCmWV1Ntk1i5waDotb15Q+MGY=;
        b=OtAuKYhz+R8q6XYfwXKQE81Xa9ulj1XnFkiNiwCKJ3Gd66h+xYYiwBvSqWiJxUMZTd
         sRmZ4PGBvyaSRvCtx5Ur9BeJXv4jSPvYaeKFhJJuVN4KvD/K+vAXxx4IWwS2Xri5hOaQ
         Yv8z3elmNa7I2U7nnrgCoDjQCqRxZsvQvd58sehOEv8MVC21PWoFGvhFQASYg9GGAGR9
         fhTfVHwmQ9cev/wDWNUCDT1++SDvWuu87Qldk//tkVGL3mSuGVkPo6mvZCRxy71mxwW6
         Kx7mwIYl3/xN5CDRvWG9yMv19A6UYsGjgPCk/64JYwIvRDDn96MFJSspOndLiSUHDamJ
         9kTQ==
In-Reply-To: <1436958839-14793-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
 libfdt/fdt_ro.c | 26 ++++++++++++++++++++++++++
 libfdt/libfdt.h | 11 +++++++++++
 tests/strings.c | 22 ++++++++++++++++++++++
 3 files changed, 59 insertions(+)

diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
index 874975a0d8ad..aab3d1b94509 100644
--- a/libfdt/fdt_ro.c
+++ b/libfdt/fdt_ro.c
@@ -558,6 +558,32 @@ int fdt_count_strings(const void *fdt, int nodeoffset, const char *property)
 	return count;
 }
 
+int fdt_find_string(const void *fdt, int nodeoffset, const char *property,
+		    const char *string)
+{
+	const char *list, *end;
+	int len, index = 0;
+
+	list = fdt_getprop(fdt, nodeoffset, property, &len);
+	if (!list)
+		return len;
+
+	end = list + len;
+	len = strlen(string);
+
+	while (list < end) {
+		int l = strlen(list);
+
+		if (l == len && memcmp(list, string, len) == 0)
+			return index;
+
+		list += l + 1;
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
index 93deec13655b..34ab30dc3338 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -877,6 +877,17 @@ int fdt_stringlist_contains(const char *strlist, int listlen, const char *str);
  */
 int fdt_count_strings(const void *fdt, int nodeoffset, const char *property);
 
+/**
+ * fdt_find_string - find a string in a string list and return its index
+ * @fdt: pointer to the device tree blob
+ * @nodeoffset: offset of a tree node
+ * @property: name of the property containing the string list
+ * @string: string to look up in the string list
+ * @return: the index of the string or negative on error
+ */
+int fdt_find_string(const void *fdt, int nodeoffset, const char *property,
+		    const char *string);
+
 /**********************************************************************/
 /* Read-only functions (addressing related)                           */
 /**********************************************************************/
diff --git a/tests/strings.c b/tests/strings.c
index 642057d1c8d9..050230567468 100644
--- a/tests/strings.c
+++ b/tests/strings.c
@@ -46,6 +46,23 @@ static void check_string_count(const void *fdt, const char *path,
 		     path, err, count);
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
+		FAIL("Index of string %s is %d instead of %d\n",
+		     path, err, index);
+}
+
 int main(int argc, char *argv[])
 {
 	void *fdt;
@@ -60,5 +77,10 @@ int main(int argc, char *argv[])
 	check_string_count(fdt, "/device", "compatible", 2);
 	check_string_count(fdt, "/device", "big-endian", 0);
 
+	check_string_index(fdt, "/", "compatible", "foo", 0);
+	check_string_index(fdt, "/device", "compatible", "bar", 0);
+	check_string_index(fdt, "/device", "compatible", "baz", 1);
+	check_string_index(fdt, "/device", "big-endian", "bL", -1);
+
 	PASS();
 }
-- 
2.4.5
