From: Anton Blanchard <anton-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
Subject: [PATCH] Catch unsigned 32bit overflow when parsing flattened device
 tree offsets
Date: Sun, 3 Jan 2016 08:43:35 +1100
Message-ID: <20160103084335.0b411e1c@kryten>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/Bf=jDIYEvL7nvQZSBT5lcY9"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; s=42627210;
	h=Message-ID:Cc:To:From:Date; bh=mrC81d54CJWuwtEoRjv9a1QQm1gyZoSAEXZMhrDz80g=;
	b=nrj/Bt9WKy6aVRlwk/NQTmkg3uf4F2xB1k8hliyWz6A706ruD2R20STgXF/MfaT+vyOePyHmUMJlHjT7NDDUL9oWowMCilfoiFgT2S2OlS9Pe7KSR312gF5wrFsL2XUrefhhig3DaLPOENlZfDGkjZ8TLgZlAabcUggrKXVBoF8=;
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

--MP_/Bf=jDIYEvL7nvQZSBT5lcY9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

We have a couple of checks of the form:

    if (offset+size > totalsize)
        die();

We need to check that offset+size doesn't overflow, otherwise the check
will pass, and we may access past totalsize.

Found with AFL.

Signed-off-by: Anton Blanchard <anton-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
---

I've attached an example device tree, do we want to add binary blobs
to the test suite?

diff --git a/flattree.c b/flattree.c
index bd99fa2..ec14954 100644
--- a/flattree.c
+++ b/flattree.c
@@ -889,7 +889,7 @@ struct boot_info *dt_from_blob(const char *fname)
 
 	if (version >= 3) {
 		uint32_t size_str = fdt32_to_cpu(fdt->size_dt_strings);
-		if (off_str+size_str > totalsize)
+		if ((off_str+size_str < off_str) || (off_str+size_str > totalsize))
 			die("String table extends past total size\n");
 		inbuf_init(&strbuf, blob + off_str, blob + off_str + size_str);
 	} else {
@@ -898,7 +898,7 @@ struct boot_info *dt_from_blob(const char *fname)
 
 	if (version >= 17) {
 		size_dt = fdt32_to_cpu(fdt->size_dt_struct);
-		if (off_dt+size_dt > totalsize)
+		if ((off_dt+size_dt < off_dt) || (off_dt+size_dt > totalsize))
 			die("Structure block extends past total size\n");
 	}
 

--MP_/Bf=jDIYEvL7nvQZSBT5lcY9
Content-Type: application/octet-stream; name=t.dtb
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=t.dtb

0A3+7QAAAFoAAAA4AAAAWAAAACgAAAARAAAAEAAAAAD/////AAAAIAAAAAAAAAAAAAAAAAAAAAAA
AAABAAAAAAAAAAMAAAAEEAAAAAAAAAAAAAACAAAACXgA

--MP_/Bf=jDIYEvL7nvQZSBT5lcY9--
