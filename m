From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v5 5/7] libfdt: Add support for disabling rollback handling
Date: Wed,  5 Feb 2020 22:40:32 -0700
Message-ID: <20200206054034.162732-6-sjg@chromium.org>
References: <20200206054034.162732-1-sjg@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kwYrhwssJ6I4rx4ex3SKtTNOIBI0kQUQaWpY48Dj+Fc=;
        b=ZiMshkrFOnsuSu+8wi0lHYdVYnuy64gneKCwv24vuQmTbAKmnTbwfyuC4pIgFo9erH
         Tatu+uffTBsuFwOLZQH2wHR/4J9Lp0OqUwdrpQLviHTzDieT6PtqyNfzpq12Djf1OwGT
         wZe018G3kbQF8eIXWJ3+plkrrXI2/6PGH204U=
In-Reply-To: <20200206054034.162732-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Allow enabling FDT_ASSUME_NO_ROLLBACK to disable rolling back after a
failed operation.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Reviewed-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
---

Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None

 libfdt/fdt_rw.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
index 7a41a31..75f70d9 100644
--- a/libfdt/fdt_rw.c
+++ b/libfdt/fdt_rw.c
@@ -117,6 +117,15 @@ static int fdt_splice_string_(void *fdt, int newlen)
 	return 0;
 }
 
+/**
+ * fdt_find_add_string_() - Find or allocate a string
+ *
+ * @fdt: pointer to the device tree to check/adjust
+ * @s: string to find/add
+ * @allocated: Set to 0 if the string was found, 1 if not found and so
+ *	allocated. Ignored if can_assume(NO_ROLLBACK)
+ * @return offset of string in the string table (whether found or added)
+ */
 static int fdt_find_add_string_(void *fdt, const char *s, int *allocated)
 {
 	char *strtab = (char *)fdt + fdt_off_dt_strings(fdt);
@@ -125,7 +134,8 @@ static int fdt_find_add_string_(void *fdt, const char *s, int *allocated)
 	int len = strlen(s) + 1;
 	int err;
 
-	*allocated = 0;
+	if (!can_assume(NO_ROLLBACK))
+		*allocated = 0;
 
 	p = fdt_find_string_(strtab, fdt_size_dt_strings(fdt), s);
 	if (p)
@@ -137,7 +147,8 @@ static int fdt_find_add_string_(void *fdt, const char *s, int *allocated)
 	if (err)
 		return err;
 
-	*allocated = 1;
+	if (!can_assume(NO_ROLLBACK))
+		*allocated = 1;
 
 	memcpy(new, s, len);
 	return (new - strtab);
@@ -211,7 +222,8 @@ static int fdt_add_property_(void *fdt, int nodeoffset, const char *name,
 
 	err = fdt_splice_struct_(fdt, *prop, 0, proplen);
 	if (err) {
-		if (allocated)
+		/* Delete the string if we failed to add it */
+		if (!can_assume(NO_ROLLBACK) && allocated)
 			fdt_del_last_string_(fdt, name);
 		return err;
 	}
-- 
2.25.0.341.g760bfbb309-goog

