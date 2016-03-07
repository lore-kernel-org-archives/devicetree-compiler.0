From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH] Add a libfdt function to write a property placeholder
Date: Sun,  6 Mar 2016 19:52:52 -0700
Message-ID: <1457319172-24071-1-git-send-email-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=sender:from:to:cc:subject:date:message-id;
        bh=wRYFSVWmUQw6JhS0eZR1WVGj+EbWR8FCfcOAMtCOxG0=;
        b=FMIYAB5Iau6NsYPboSFbcqcoKmiV2yyQ6AFn+zPXeQlDGYvYYkU6E8N8zqFfNcLVWQ
         piRC4kod85wAeZx78uFwRrFpwaL52bDwmz20bGCTS0u3Ru6n6wycR3s//hnPAMStkFSd
         gtAuc2JhQmLRRqGsLYJJt0HTg0WTnfeJIVpHYqJrBdz7sx3B5EUtaEFwY1iEbhJhtVxW
         ucRvN8RLyW+BALNe+5hC1j4KkrEnKy9GMEVKIXmdAYJA3t+a5nQ9sf5bj7QhMrp8336Z
         tkSjze5I6W989MTnbkvFY/+H2J44Uv/3FW+XWpCTPtgohKJQ86CyYuH3nORutyqy/3kx
         Xbfg==
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

 libfdt/fdt_sw.c | 16 ++++++++++++++--
 libfdt/libfdt.h | 16 ++++++++++++++++
 2 files changed, 30 insertions(+), 2 deletions(-)

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
index 78adb12..d6a08b6 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -1180,6 +1180,22 @@ static inline int fdt_property_cell(void *fdt, const char *name, uint32_t val)
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
-- 
2.7.0.rc3.207.g0ac5344
