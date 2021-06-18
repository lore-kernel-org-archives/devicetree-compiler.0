From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH v3 1/5] tests: Fix signedness comparisons warnings
Date: Fri, 18 Jun 2021 18:20:26 +0100
Message-ID: <20210618172030.9684-2-andre.przywara@arm.com>
References: <20210618172030.9684-1-andre.przywara@arm.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20210618172030.9684-1-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

With -Wsign-compare, compilers warn about a mismatching signedness in
comparisons in various files in the tests/ directory.

For about half of the cases we can simply change the signed variable to
be of an unsigned type, because they will never need to store negative
values (which is the best fix of the problem).

In the remaining cases we can cast the signed variable to an unsigned
type, provided we know for sure it is not negative.
We see two different scenarios here:
- We either just explicitly checked for this variable to be positive
  (if (rc < 0) FAIL();), or
- We rely on a function returning only positive values in the "length"
  pointer if the function returned successfully: which we just checked.

At two occassions we compare with a constant "-1" (even though the
variable is unsigned), so we just change this to ~0U to create an
unsigned comparison value.

Since this is about the tests, let's also add explicit tests for those
values really not being negative.

This fixes "make tests" (but not "make check" yet), when compiled
with -Wsign-compare.

Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
---
 tests/dumptrees.c           |  2 +-
 tests/fs_tree1.c            |  2 +-
 tests/get_name.c            |  4 +++-
 tests/integer-expressions.c |  2 +-
 tests/nopulate.c            |  3 ++-
 tests/overlay.c             |  6 +++++-
 tests/phandle_format.c      |  2 +-
 tests/property_iterate.c    |  2 +-
 tests/references.c          |  2 +-
 tests/set_name.c            | 10 ++++++++--
 tests/subnode_iterate.c     |  2 +-
 tests/tests.h               |  2 +-
 tests/testutils.c           | 12 +++++++++---
 13 files changed, 35 insertions(+), 16 deletions(-)

diff --git a/tests/dumptrees.c b/tests/dumptrees.c
index f1e0ea9..08967b3 100644
--- a/tests/dumptrees.c
+++ b/tests/dumptrees.c
@@ -32,7 +32,7 @@ static struct {
 
 int main(int argc, char *argv[])
 {
-	int i;
+	unsigned int i;
 
 	if (argc != 2) {
 	    fprintf(stderr, "Missing output directory argument\n");
diff --git a/tests/fs_tree1.c b/tests/fs_tree1.c
index dff3880..978f6a3 100644
--- a/tests/fs_tree1.c
+++ b/tests/fs_tree1.c
@@ -54,7 +54,7 @@ static void mkfile(const char *name, void *data, size_t len)
 	rc = write(fd, data, len);
 	if (rc < 0)
 		FAIL("write(\"%s\"): %s", name, strerror(errno));
-	if (rc != len)
+	if ((unsigned)rc != len)
 		FAIL("write(\"%s\"): short write", name);
 	
 	rc = close(fd);
diff --git a/tests/get_name.c b/tests/get_name.c
index 5a35103..d20bf30 100644
--- a/tests/get_name.c
+++ b/tests/get_name.c
@@ -34,12 +34,14 @@ static void check_name(void *fdt, const char *path)
 		       offset, getname, len);
 	if (!getname)
 		FAIL("fdt_get_name(%d): %s", offset, fdt_strerror(len));
+	if (len < 0)
+		FAIL("negative name length (%d) for returned node name\n", len);
 
 	if (strcmp(getname, checkname) != 0)
 		FAIL("fdt_get_name(%s) returned \"%s\" instead of \"%s\"",
 		     path, getname, checkname);
 
-	if (len != strlen(getname))
+	if ((unsigned)len != strlen(getname))
 		FAIL("fdt_get_name(%s) returned length %d instead of %zd",
 		     path, len, strlen(getname));
 
diff --git a/tests/integer-expressions.c b/tests/integer-expressions.c
index 6f33d81..2f164d9 100644
--- a/tests/integer-expressions.c
+++ b/tests/integer-expressions.c
@@ -59,7 +59,7 @@ int main(int argc, char *argv[])
 	void *fdt;
 	const fdt32_t *res;
 	int reslen;
-	int i;
+	unsigned int i;
 
 	test_init(argc, argv);
 
diff --git a/tests/nopulate.c b/tests/nopulate.c
index 2ae1753..e06a0b3 100644
--- a/tests/nopulate.c
+++ b/tests/nopulate.c
@@ -43,7 +43,8 @@ static int nopulate_struct(char *buf, const char *fdt)
 int main(int argc, char *argv[])
 {
 	char *fdt, *fdt2, *buf;
-	int newsize, struct_start, struct_end_old, struct_end_new, delta;
+	int newsize, struct_end_old, struct_end_new, delta;
+	unsigned int struct_start;
 	const char *inname;
 	char outname[PATH_MAX];
 
diff --git a/tests/overlay.c b/tests/overlay.c
index 91afa72..f3dd310 100644
--- a/tests/overlay.c
+++ b/tests/overlay.c
@@ -35,7 +35,11 @@ static int fdt_getprop_u32_by_poffset(void *fdt, const char *path,
 		return node_off;
 
 	val = fdt_getprop(fdt, node_off, name, &len);
-	if (!val || (len < (sizeof(uint32_t) * (poffset + 1))))
+	if (val && len < 0)
+		FAIL("fdt_getprop() returns negative length");
+	if (!val && len < 0)
+		return len;
+	if (!val || ((unsigned)len < (sizeof(uint32_t) * (poffset + 1))))
 		return -FDT_ERR_NOTFOUND;
 
 	*out = fdt32_to_cpu(*(val + poffset));
diff --git a/tests/phandle_format.c b/tests/phandle_format.c
index d00618f..0febb32 100644
--- a/tests/phandle_format.c
+++ b/tests/phandle_format.c
@@ -45,7 +45,7 @@ int main(int argc, char *argv[])
 		FAIL("fdt_path_offset(/node4): %s", fdt_strerror(n4));
 
 	h4 = fdt_get_phandle(fdt, n4);
-	if ((h4 == 0) || (h4 == -1))
+	if ((h4 == 0) || (h4 == ~0U))
 		FAIL("/node4 has bad phandle 0x%x\n", h4);
 
 	if (phandle_format & PHANDLE_LEGACY)
diff --git a/tests/property_iterate.c b/tests/property_iterate.c
index 9a67f49..0b6af9b 100644
--- a/tests/property_iterate.c
+++ b/tests/property_iterate.c
@@ -23,7 +23,7 @@ static void test_node(void *fdt, int parent_offset)
 	uint32_t properties;
 	const fdt32_t *prop;
 	int offset, property;
-	int count;
+	unsigned int count;
 	int len;
 
 	/*
diff --git a/tests/references.c b/tests/references.c
index d18e722..cb1daaa 100644
--- a/tests/references.c
+++ b/tests/references.c
@@ -106,7 +106,7 @@ int main(int argc, char *argv[])
 	if ((h4 == 0x2000) || (h4 == 0x1) || (h4 == 0))
 		FAIL("/node4 has bad phandle, 0x%x", h4);
 
-	if ((h5 == 0) || (h5 == -1))
+	if ((h5 == 0) || (h5 == ~0U))
 		FAIL("/node5 has bad phandle, 0x%x", h5);
 	if ((h5 == h4) || (h5 == h2) || (h5 == h1))
 		FAIL("/node5 has duplicate phandle, 0x%x", h5);
diff --git a/tests/set_name.c b/tests/set_name.c
index a62cb58..5020305 100644
--- a/tests/set_name.c
+++ b/tests/set_name.c
@@ -39,7 +39,11 @@ static void check_set_name(void *fdt, const char *path, const char *newname)
 		FAIL("fdt_get_name(%s) returned \"%s\" instead of \"%s\"",
 		     path, getname, oldname);
 
-	if (len != strlen(getname))
+	if (len < 0)
+		FAIL("fdt_get_name(%s) returned negative length: %d",
+		     path, len);
+
+	if ((unsigned)len != strlen(getname))
 		FAIL("fdt_get_name(%s) returned length %d instead of %zd",
 		     path, len, strlen(getname));
 
@@ -51,12 +55,14 @@ static void check_set_name(void *fdt, const char *path, const char *newname)
 	getname = fdt_get_name(fdt, offset, &len);
 	if (!getname)
 		FAIL("fdt_get_name(%d): %s", offset, fdt_strerror(len));
+	if (len < 0)
+		FAIL("negative name length (%d) for returned node name\n", len);
 
 	if (strcmp(getname, newname) != 0)
 		FAIL("fdt_get_name(%s) returned \"%s\" instead of \"%s\"",
 		     path, getname, newname);
 
-	if (len != strlen(getname))
+	if ((unsigned)len != strlen(getname))
 		FAIL("fdt_get_name(%s) returned length %d instead of %zd",
 		     path, len, strlen(getname));
 }
diff --git a/tests/subnode_iterate.c b/tests/subnode_iterate.c
index 2dc9b2d..2553a51 100644
--- a/tests/subnode_iterate.c
+++ b/tests/subnode_iterate.c
@@ -23,7 +23,7 @@ static void test_node(void *fdt, int parent_offset)
 	uint32_t subnodes;
 	const fdt32_t *prop;
 	int offset;
-	int count;
+	unsigned int count;
 	int len;
 
 	/* This property indicates the number of subnodes to expect */
diff --git a/tests/tests.h b/tests/tests.h
index 1017366..bf8f23c 100644
--- a/tests/tests.h
+++ b/tests/tests.h
@@ -83,7 +83,7 @@ void cleanup(void);
 void check_mem_rsv(void *fdt, int n, uint64_t addr, uint64_t size);
 
 void check_property(void *fdt, int nodeoffset, const char *name,
-		    int len, const void *val);
+		    unsigned int len, const void *val);
 #define check_property_cell(fdt, nodeoffset, name, val) \
 	({ \
 		fdt32_t x = cpu_to_fdt32(val);			      \
diff --git a/tests/testutils.c b/tests/testutils.c
index 5e494c5..10129c0 100644
--- a/tests/testutils.c
+++ b/tests/testutils.c
@@ -88,7 +88,7 @@ void check_mem_rsv(void *fdt, int n, uint64_t addr, uint64_t size)
 }
 
 void check_property(void *fdt, int nodeoffset, const char *name,
-		    int len, const void *val)
+		    unsigned int len, const void *val)
 {
 	const struct fdt_property *prop;
 	int retlen, namelen;
@@ -101,6 +101,9 @@ void check_property(void *fdt, int nodeoffset, const char *name,
 	if (! prop)
 		FAIL("Error retrieving \"%s\" pointer: %s", name,
 		     fdt_strerror(retlen));
+	if (retlen < 0)
+		FAIL("negative name length (%d) for returned property\n",
+		     retlen);
 
 	tag = fdt32_to_cpu(prop->tag);
 	nameoff = fdt32_to_cpu(prop->nameoff);
@@ -112,13 +115,16 @@ void check_property(void *fdt, int nodeoffset, const char *name,
 	propname = fdt_get_string(fdt, nameoff, &namelen);
 	if (!propname)
 		FAIL("Couldn't get property name: %s", fdt_strerror(namelen));
-	if (namelen != strlen(propname))
+	if (namelen < 0)
+		FAIL("negative name length (%d) for returned string\n",
+		     namelen);
+	if ((unsigned)namelen != strlen(propname))
 		FAIL("Incorrect prop name length: %d instead of %zd",
 		     namelen, strlen(propname));
 	if (!streq(propname, name))
 		FAIL("Property name mismatch \"%s\" instead of \"%s\"",
 		     propname, name);
-	if (proplen != retlen)
+	if (proplen != (unsigned)retlen)
 		FAIL("Length retrieved for \"%s\" by fdt_get_property()"
 		     " differs from stored length (%d != %d)",
 		     name, retlen, proplen);
-- 
2.17.5

