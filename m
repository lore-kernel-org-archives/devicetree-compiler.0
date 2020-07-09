From: patrick.oppenlander-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [PATCH] libfdt: fix fdt_check_full buffer overrun
Date: Thu,  9 Jul 2020 14:14:51 +1000
Message-ID: <20200709041451.338548-1-patrick.oppenlander@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fLgMMAGjIhuV34jxCj2AAwBTTKx3nlDGXumnlQEaMvI=;
        b=NgHGA9qS2FRzP4Xe+XA7CJryY9HhRhazYXCi3SN3nRgeKuTPS3QLoGqAPvZW8ECoQj
         clImT+iHcNe8dWA2TsZS3hfOWbWIHdSBECw49+ds9kAR3fmO4cFTIGseAVxbDB0rUNNg
         Ze5gQZsUpTxuSmjxyXhIL3CbKqPNsGQB5B+yKCzFLytf1y3P4GNyJVqMqfAiHcC8YACe
         I84J32IM0gL/FnnhYjufYmuvU+dOVxoTAnsf9OgzVoTkgLHZBI4M0AElKz+g7jq1NJtZ
         pgnkmshG+yIy1Hw9MezKmGlVdSIIWNLs2Rs3Wqtq4WBiCeynEOZS3n1b4lluDulsEBol
         8/Fw==
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Patrick Oppenlander <patrick.oppenlander-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

From: Patrick Oppenlander <patrick.oppenlander-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

fdt_check_header assumes that its argument points to a complete header
and can read data beyond the FDT_V1_SIZE bytes which fdt_check_full
can provide.

fdt_header_size can safely return a header size with FDT_V1_SIZE bytes
available and will return a usable value even for a corrupted header.

Signed-off-by: Patrick Oppenlander <patrick.oppenlander-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 libfdt/fdt_check.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/libfdt/fdt_check.c b/libfdt/fdt_check.c
index 7f6a96c..9ddfdbf 100644
--- a/libfdt/fdt_check.c
+++ b/libfdt/fdt_check.c
@@ -22,6 +22,8 @@ int fdt_check_full(const void *fdt, size_t bufsize)
 
 	if (bufsize < FDT_V1_SIZE)
 		return -FDT_ERR_TRUNCATED;
+	if (bufsize < fdt_header_size(fdt))
+		return -FDT_ERR_TRUNCATED;
 	err = fdt_check_header(fdt);
 	if (err != 0)
 		return err;
-- 
2.27.0

