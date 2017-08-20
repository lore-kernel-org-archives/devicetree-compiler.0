From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 1/2] fdtget: Split out cell list display into a new function
Date: Sun, 20 Aug 2017 06:28:54 -0600
Message-ID: <20170820122855.171271-1-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=FthfhZ7vzzgcSbbFo1M58Sjkk14Vvf9DYpjVzvnWgIw=;
        b=nvAwdvYHDRiXF/gPg9edFDBkwhHmpbomz+4MDNkObDoiYW8az1R9uzn0OOb+nq+YK8
         +V34V4CHhI5cyb2C8w8xd9U6iThvOvsmeARPZgKSDrHMn2izJ/lP+R5BmNAN2dWB2mYj
         BQuO3lQaHXMIP1N6prFoMcjAhNVqd84O0+dVObMUA7WpiVGT5j28KhqQsLwe3agaw8H4
         ePO5kW9de7u2qcsmNiTpQ34Kw1oZRxqYLdgDlzgePRvqM6zjXa9Yh1cXSNJ2l9wM3Akc
         /r7Jr2X6ckY88JsbFJV6DUd7claRiLkx214N8Pbt+/uICgiTg0P15QkvpKqZqcZ3J6dU
         bCKQ==
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Jason Clinton <jclinton-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

The show_data() function is quite long. Split out the part that loops
through the values. This makes it easier to add new features.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

 fdtget.c | 49 ++++++++++++++++++++++++++++++++++---------------
 1 file changed, 34 insertions(+), 15 deletions(-)

diff --git a/fdtget.c b/fdtget.c
index 39f1742..6cc5242 100644
--- a/fdtget.c
+++ b/fdtget.c
@@ -53,6 +53,37 @@ static void report_error(const char *where, int err)
 	fprintf(stderr, "Error at '%s': %s\n", where, fdt_strerror(err));
 }
 
+/**
+ * Shows a list of cells in the requested format
+ *
+ * @param disp		Display information / options
+ * @param data		Data to display
+ * @param len		Maximum length of buffer
+ * @param size		Data size to use for display (e.g. 4 for 32-bit)
+ * @return 0 if ok, -1 on error
+ */
+static int show_cell_list(struct display_info *disp, const char *data, int len,
+			  int size)
+{
+	const uint8_t *p = (const uint8_t *)data;
+	char fmt[3];
+	int value;
+	int i;
+
+	fmt[0] = '%';
+	fmt[1] = disp->type ? disp->type : 'd';
+	fmt[2] = '\0';
+	for (i = 0; i < len; i += size, p += size) {
+		if (i)
+			printf(" ");
+		value = size == 4 ? fdt32_to_cpu(*(const fdt32_t *)p) :
+			size == 2 ? (*p << 8) | p[1] : *p;
+		printf(fmt, value);
+	}
+
+	return 0;
+}
+
 /**
  * Displays data of a given length according to selected options
  *
@@ -66,12 +97,9 @@ static void report_error(const char *where, int err)
  */
 static int show_data(struct display_info *disp, const char *data, int len)
 {
-	int i, size;
-	const uint8_t *p = (const uint8_t *)data;
+	int size;
 	const char *s;
-	int value;
 	int is_string;
-	char fmt[3];
 
 	/* no data, don't print */
 	if (len == 0)
@@ -99,17 +127,8 @@ static int show_data(struct display_info *disp, const char *data, int len)
 				"selected data size\n");
 		return -1;
 	}
-	fmt[0] = '%';
-	fmt[1] = disp->type ? disp->type : 'd';
-	fmt[2] = '\0';
-	for (i = 0; i < len; i += size, p += size) {
-		if (i)
-			printf(" ");
-		value = size == 4 ? fdt32_to_cpu(*(const fdt32_t *)p) :
-			size == 2 ? (*p << 8) | p[1] : *p;
-		printf(fmt, value);
-	}
-	return 0;
+
+	return show_cell_list(disp, data, len, size);
 }
 
 /**
-- 
2.14.1.480.gb18f417b89-goog
