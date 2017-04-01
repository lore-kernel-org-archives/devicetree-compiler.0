From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v3] Add a libfdt function to write a property placeholder
Date: Sat,  1 Apr 2017 09:31:41 -0600
Message-ID: <20170401153141.1706-1-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=daJwwlRGQISdRpIVDnpMO5DwqW4plWogzFV8vgMFVRk=;
        b=UN9iKO0h0IdZTPRTFCpTwjTl93qNDHMRlVg+bPlnsJYNpVAYKKVuTh1LpTiTo/T/oN
         Z88Fq1qWSNAuzGyxW/J/9WbbqJ8CPKysE5iquYMzM1EQD+PcGbh2Mbk2Eo3OW7+zNfWi
         fP+RSD0rWcnVaMg3qc+2wonAhHX9Mk47QSxrNkz3XuRQYOLRODLOhftK2pcun9tbFzPR
         QAyiTFqqjhhXY2k0UDTgPyXiccbJHTHMovxtQZLD1D/K4ra7+PcWPfshxf5vj2+ihC67
         LcDapQt/V1qKTX/lXJQi3cp6DYurDFvq/+Az/+T7WYkv141oJWEIETerpCsYOQ4CeZLF
         Mmdg==
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

The existing function to add a new property to a tree being built requires
that the entire contents of the new property be passed in. For some
applications it is more convenient to be able to add the property contents
later, perhaps by reading from a file. This avoids double-buffering of the
contents.

Add a new function to support this and adjust the existing fdt_property() to
use it.
Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

Changes in v3:
- Rebase to master

Changes in v2:
- Add tests
- Rename the function to fdt_property_placeholder()

 libfdt/fdt_sw.c                    | 16 ++++++++++++++--
 libfdt/libfdt.h                    | 16 ++++++++++++++++
 tests/include7.dts                 |  1 +
 tests/sw_tree1.c                   |  5 +++++
 tests/test_tree1.dts               |  1 +
 tests/test_tree1_label_noderef.dts |  1 +
 tests/trees.S                      |  2 ++
 7 files changed, 40 insertions(+), 2 deletions(-)

diff --git a/libfdt/fdt_sw.c b/libfdt/fdt_sw.c
index 6a80485..2bd15e7 100644
--- a/libfdt/fdt_sw.c
+++ b/libfdt/fdt_sw.c
@@ -220,7 +220,7 @@ static int _fdt_find_add_string(void *fdt, const char *s)
 	return offset;
 }
 
-int fdt_property(void *fdt, const char *name, const void *val, int len)
+int fdt_property_placeholder(void *fdt, const char *name, int len, void **valp)
 {
 	struct fdt_property *prop;
 	int nameoff;
@@ -238,7 +238,19 @@ int fdt_property(void *fdt, const char *name, const void *val, int len)
 	prop->tag = cpu_to_fdt32(FDT_PROP);
 	prop->nameoff = cpu_to_fdt32(nameoff);
 	prop->len = cpu_to_fdt32(len);
-	memcpy(prop->data, val, len);
+	*valp = prop->data;
+	return 0;
+}
+
+int fdt_property(void *fdt, const char *name, const void *val, int len)
+{
+	void *ptr;
+	int ret;
+
+	ret = fdt_property_placeholder(fdt, name, len, &ptr);
+	if (ret)
+		return ret;
+	memcpy(ptr, val, len);
 	return 0;
 }
 
diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index 2c9ddb4..a248b1b 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -1314,6 +1314,22 @@ static inline int fdt_property_cell(void *fdt, const char *name, uint32_t val)
 {
 	return fdt_property_u32(fdt, name, val);
 }
+
+/**
+ * fdt_property_placeholder - add a new property and return a ptr to its value
+ *
+ * @fdt: pointer to the device tree blob
+ * @name: name of property to add
+ * @len: length of property value in bytes
+ * @valp: returns a pointer to where where the value should be placed
+ *
+ * returns:
+ *	0, on success
+ *	-FDT_ERR_BADMAGIC,
+ *	-FDT_ERR_NOSPACE, standard meanings
+ */
+int fdt_property_placeholder(void *fdt, const char *name, int len, void **valp);
+
 #define fdt_property_string(fdt, name, str) \
 	fdt_property(fdt, name, str, strlen(str)+1)
 int fdt_end_node(void *fdt);
diff --git a/tests/include7.dts b/tests/include7.dts
index 2f6eb89..ab2c948 100644
--- a/tests/include7.dts
+++ b/tests/include7.dts
@@ -5,6 +5,7 @@
 
 		subsubnode {
 			compatible = "subsubnode1", "subsubnode";
+			placeholder = "this is a placeholder string", "string2";
 			prop-int = <0xdeadbeef>;
 		};
 
diff --git a/tests/sw_tree1.c b/tests/sw_tree1.c
index 4887dc3..6a338fc 100644
--- a/tests/sw_tree1.c
+++ b/tests/sw_tree1.c
@@ -85,6 +85,9 @@ int main(int argc, char *argv[])
 	size_t size;
 	int err;
 	bool created = false;
+	void *place;
+	const char place_str[] = "this is a placeholder string\0string2";
+	int place_len = sizeof(place_str);
 
 	test_init(argc, argv);
 
@@ -135,6 +138,8 @@ int main(int argc, char *argv[])
 	CHECK(fdt_begin_node(fdt, "subsubnode"));
 	CHECK(fdt_property(fdt, "compatible", "subsubnode1\0subsubnode",
 			   23));
+	CHECK(fdt_property_placeholder(fdt, "placeholder", place_len, &place));
+	memcpy(place, place_str, place_len);
 	CHECK(fdt_property_cell(fdt, "prop-int", TEST_VALUE_1));
 	CHECK(fdt_end_node(fdt));
 	CHECK(fdt_begin_node(fdt, "ss1"));
diff --git a/tests/test_tree1.dts b/tests/test_tree1.dts
index 67ecfd0..77ea325 100644
--- a/tests/test_tree1.dts
+++ b/tests/test_tree1.dts
@@ -18,6 +18,7 @@
 
 		subsubnode {
 			compatible = "subsubnode1", "subsubnode";
+			placeholder = "this is a placeholder string", "string2";
 			prop-int = <0xdeadbeef>;
 		};
 
diff --git a/tests/test_tree1_label_noderef.dts b/tests/test_tree1_label_noderef.dts
index b2b194c..cfe5946 100644
--- a/tests/test_tree1_label_noderef.dts
+++ b/tests/test_tree1_label_noderef.dts
@@ -18,6 +18,7 @@
 
 		subsubnode {
 			compatible = "subsubnode1", "subsubnode";
+			placeholder = "this is a placeholder string", "string2";
 			prop-int = <0xdeadbeef>;
 		};
 
diff --git a/tests/trees.S b/tests/trees.S
index 3d24aa2..9854d1d 100644
--- a/tests/trees.S
+++ b/tests/trees.S
@@ -102,6 +102,7 @@ test_tree1_struct:
 
 	BEGIN_NODE("subsubnode")
 	PROP_STR(test_tree1, compatible, "subsubnode1\0subsubnode")
+	PROP_STR(test_tree1, placeholder, "this is a placeholder string\0string2")
 	PROP_INT(test_tree1, prop_int, TEST_VALUE_1)
 	END_NODE
 
@@ -141,6 +142,7 @@ test_tree1_strings:
 	STRING(test_tree1, linux_phandle, "linux,phandle")
 	STRING(test_tree1, phandle, "phandle")
 	STRING(test_tree1, reg, "reg")
+	STRING(test_tree1, placeholder, "placeholder")
 	STRING(test_tree1, address_cells, "#address-cells")
 	STRING(test_tree1, size_cells, "#size-cells")
 test_tree1_strings_end:
-- 
2.12.2.564.g063fe858b8-goog
