From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 07/26] libfdt: Add a function to write a property placeholder
Date: Thu, 28 Jan 2016 09:39:27 -0700
Message-ID: <1453999186-18747-8-git-send-email-sjg@chromium.org>
References: <1453999186-18747-1-git-send-email-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=CUgoj2GC8DNDckYpuhL3Tm2liXyqkr0x9yPdgHFOa00=;
        b=mtgovcoZVLw5rJgU5SSobrmzC1+NfeIM/JI2lsF+jEZooYFZX/hn/xMYdppZQ1KlNY
         eaD+vO0a6MQxlWeCXhibrvPrQkH+cp3BV0FkX6TheDrjk7UYbM302rRJXoT+14zo5eU5
         krcIIl+xKYF/VV2AAv+sTsLHknp0VgGXBUYBirh4RcBbbBzKdekcG7I2WwTUkQ2GO3BI
         MkbSTq9utyBmRVZW38iHd5+noOQgzUv/XkuFacEzvC2R3h4A86DqzNBPsBJxszI2sIBy
         nMtLSdCUqPrqiL7uBbkrk18rSgFQsLCx5l3YgF9p5/G7smM4Zhp/6kHC5S80QHrl363f
         PrxQ==
In-Reply-To: <1453999186-18747-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
Cc: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

The existing function to add a new property to a tree being built requires
that the entire contents of the new property be passed in. For some
applications it is more convenient to be able to add the property contents
later, perhaps by reading from a file. This avoids double-buffering of the
contents.

Add a new function to support this and adust the existing fdt_property() to
use it.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

 include/libfdt.h    | 16 ++++++++++++++++
 lib/libfdt/fdt_sw.c | 16 ++++++++++++++--
 2 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/include/libfdt.h b/include/libfdt.h
index e48c21a..c3f37ee 100644
--- a/include/libfdt.h
+++ b/include/libfdt.h
@@ -1181,6 +1181,22 @@ static inline int fdt_property_cell(void *fdt, const char *name, uint32_t val)
 {
 	return fdt_property_u32(fdt, name, val);
 }
+
+/**
+ * fdt_property_val - add a new property and return a pointer to its value
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
+int fdt_property_val(void *fdt, const char *name, int len, void **valp);
+
 #define fdt_property_string(fdt, name, str) \
 	fdt_property(fdt, name, str, strlen(str)+1)
 int fdt_end_node(void *fdt);
diff --git a/lib/libfdt/fdt_sw.c b/lib/libfdt/fdt_sw.c
index 320a914..9c1df3d 100644
--- a/lib/libfdt/fdt_sw.c
+++ b/lib/libfdt/fdt_sw.c
@@ -175,7 +175,7 @@ static int _fdt_find_add_string(void *fdt, const char *s)
 	return offset;
 }
 
-int fdt_property(void *fdt, const char *name, const void *val, int len)
+int fdt_property_val(void *fdt, const char *name, int len, void **valp)
 {
 	struct fdt_property *prop;
 	int nameoff;
@@ -193,7 +193,19 @@ int fdt_property(void *fdt, const char *name, const void *val, int len)
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
+	ret = fdt_property_val(fdt, name, len, &ptr);
+	if (ret)
+		return ret;
+	memcpy(ptr, val, len);
 	return 0;
 }
 
-- 
2.7.0.rc3.207.g0ac5344
