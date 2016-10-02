From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 2/6] libfdt: Fix undefined behaviour in fdt_offset_ptr()
Date: Sun,  2 Oct 2016 17:59:26 -0600
Message-ID: <1475452771-16230-3-git-send-email-sjg@chromium.org>
References: <1475452771-16230-1-git-send-email-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=aaH+I03Zy0LHXPMcT9Lr0bER2d9Ufmri8y6bIcq9IKg=;
        b=IjRovVk1V5QzOwYBhql1NS6rKUu5EO2zvKgL0pGnV6bxFAd3TbIFOEb12c09eFioWE
         CvRckCu4R+y03P3rykLWkwfHYf4t6hwGtdH1arxxBQNouik5iiX9AcWG6M8cuacZII3p
         0L9M4Rzf+uBodG1dyZLZvk6CmYXhrHLKZ3i2jVyQeFIl2vfJMJhlDnJ9iTmhr5Xac4ac
         DOcfD2zi/BMN96bH6SpJkkVtvuCPSiNwuM3cUNizYgikPRVQINXjpftQdfwtBivnOBru
         ggZF5Ffmmqp4V2rodQO+X1BICdSQebQ7rfyVgTA1Lvbz5bnoCaOusr9OKfKoSbe4dywj
         LupA==
In-Reply-To: <1475452771-16230-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

Using pointer arithmetic to generate a pointer outside a known object is,
technically, undefined behaviour in C.  Unfortunately, we were using that
in fdt_offset_ptr() to detect overflows.

To fix this we need to do our bounds / overflow checking on the offsets
before constructing pointers from them.

Reported-by: David Binderman <dcb314-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

 lib/libfdt/fdt.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/lib/libfdt/fdt.c b/lib/libfdt/fdt.c
index 96017a1..2055734 100644
--- a/lib/libfdt/fdt.c
+++ b/lib/libfdt/fdt.c
@@ -35,18 +35,19 @@ int fdt_check_header(const void *fdt)
 
 const void *fdt_offset_ptr(const void *fdt, int offset, unsigned int len)
 {
-	const char *p;
+	unsigned absoffset = offset + fdt_off_dt_struct(fdt);
+
+	if ((absoffset < offset)
+	    || ((absoffset + len) < absoffset)
+	    || (absoffset + len) > fdt_totalsize(fdt))
+		return NULL;
 
 	if (fdt_version(fdt) >= 0x11)
 		if (((offset + len) < offset)
 		    || ((offset + len) > fdt_size_dt_struct(fdt)))
 			return NULL;
 
-	p = _fdt_offset_ptr(fdt, offset);
-
-	if (p + len < p)
-		return NULL;
-	return p;
+	return _fdt_offset_ptr(fdt, offset);
 }
 
 uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
-- 
2.8.0.rc3.226.g39d4020
