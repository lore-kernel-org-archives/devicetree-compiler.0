From: Justin Covell <jujugoboom-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/1] libfdt: Change last_comp_version to fit spec
Date: Tue, 24 Nov 2020 09:49:45 -0800
Message-ID: <20201124174945.5399-2-jujugoboom@gmail.com>
References: <20201124174945.5399-1-jujugoboom@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WRB7Jj7DD8SPMB8sG8NCaXqBgzofhaI4q3gHWr5JVBc=;
        b=YCbD6uW5PYa2+eCNdpfwmHTjvWqaWcwS1IhaporKFuqcOyYhGzQf1GMvZ0hihXoIbL
         qxkabKsjvqa2rWFQ+ACPJ2D+NcEh5ar7yYZbTG++Q6vS/tXcRn2UuQhjhN8d8NjkcFKZ
         1ElxNneYnQb77yzxtkNJVbirtRnyzvQeu6AbhSzVfsO9TurbxzOAaf+1kWe2wcK0jw94
         Ln70ilerTtGDCdLvHx1kpb78ThUfAZmki/yt8OA/9e/cKJ9rGLUCiAi2QOUyg9YklDG9
         LXbpCCQ0BwEdD9ykFX7Opb06tdNt9RjggjMxm9+cu+Yt4eeudfTflVmsmhhK6mJ+YF0D
         1QmA==
In-Reply-To: <20201124174945.5399-1-jujugoboom-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Justin Covell <jujugoboom-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

---
 libfdt/fdt_sw.c | 2 +-
 libfdt/libfdt.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/libfdt/fdt_sw.c b/libfdt/fdt_sw.c
index 68b543c..4c569ee 100644
--- a/libfdt/fdt_sw.c
+++ b/libfdt/fdt_sw.c
@@ -377,7 +377,7 @@ int fdt_finish(void *fdt)
 	fdt_set_totalsize(fdt, newstroffset + fdt_size_dt_strings(fdt));
 
 	/* And fix up fields that were keeping intermediate state. */
-	fdt_set_last_comp_version(fdt, FDT_FIRST_SUPPORTED_VERSION);
+	fdt_set_last_comp_version(fdt, FDT_LAST_COMPATIBLE_VERSION);
 	fdt_set_magic(fdt, FDT_MAGIC);
 
 	return 0;
diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index 89adee3..abad93b 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -14,6 +14,7 @@ extern "C" {
 #endif
 
 #define FDT_FIRST_SUPPORTED_VERSION	0x02
+#define FDT_LAST_COMPATIBLE_VERSION 0x10
 #define FDT_LAST_SUPPORTED_VERSION	0x11
 
 /* Error codes: informative error codes */
-- 
2.25.1

