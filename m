From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 6/6] libfdt: Drop inlining of fdt_path_offset()
Date: Sun,  2 Oct 2016 17:59:30 -0600
Message-ID: <1475452771-16230-7-git-send-email-sjg@chromium.org>
References: <1475452771-16230-1-git-send-email-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=quUOd0WJdswxN+X0uRf9hkPDZ5FAPW5XWuF4bdPr6nk=;
        b=UYtR8qAauMt+duA+5m5HKPmzfm9kHCF+hFLwTgzHWDPC7ds7vz/94no15dbh2i/5Fy
         qnNNgGuembErL1ShJ1qxqnSM/PQSmsxb+qDA03+sTVtRD3lshxPhj2HYOPPoDT++PfOU
         0ghYqfX3gBxoO5HZc4sfO8NMMNl765aVLDF0N9ZWl98JdPg1Fvm87ighUNCfp33xf5Ml
         EN5BBkBv0onl+QqaTouLx0EuGrIs7apt6DAbMjLYdy59zVNyRsJbNeDBKvVrc9Rvi1GM
         T7IKmGQ3vnyt1YObpdjGEStsXyASt5adrzHLi8dpsle1q7she90sgQmLOQnCu6alIVXr
         hmpQ==
In-Reply-To: <1475452771-16230-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

The fdt_path_offset() function is not inlined in upstream libfdt. Adjust
U-Boot's version to match.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

 include/libfdt.h    | 5 +----
 lib/libfdt/fdt_ro.c | 5 +++++
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/include/libfdt.h b/include/libfdt.h
index 398748c..8746790 100644
--- a/include/libfdt.h
+++ b/include/libfdt.h
@@ -410,10 +410,7 @@ int fdt_path_offset_namelen(const void *fdt, const char *path, int namelen);
  *	-FDT_ERR_BADSTRUCTURE,
  *	-FDT_ERR_TRUNCATED, standard meanings.
  */
-static inline int fdt_path_offset(const void *fdt, const char *path)
-{
-	return fdt_path_offset_namelen(fdt, path, strlen(path));
-}
+int fdt_path_offset(const void *fdt, const char *path);
 
 /**
  * fdt_get_name - retrieve the name of a given node
diff --git a/lib/libfdt/fdt_ro.c b/lib/libfdt/fdt_ro.c
index e38aaa4..7e894b7 100644
--- a/lib/libfdt/fdt_ro.c
+++ b/lib/libfdt/fdt_ro.c
@@ -204,6 +204,11 @@ int fdt_path_offset_namelen(const void *fdt, const char *path, int namelen)
 	return offset;
 }
 
+int fdt_path_offset(const void *fdt, const char *path)
+{
+	return fdt_path_offset_namelen(fdt, path, strlen(path));
+}
+
 const char *fdt_get_name(const void *fdt, int nodeoffset, int *len)
 {
 	const struct fdt_node_header *nh = _fdt_offset_ptr(fdt, nodeoffset);
-- 
2.8.0.rc3.226.g39d4020
