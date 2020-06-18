From: patrick.oppenlander-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [PATCH] libfdt: trivial typo fix
Date: Thu, 18 Jun 2020 14:21:17 +1000
Message-ID: <20200618042117.131731-1-patrick.oppenlander@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0ibB3zS6NSOC4btk5T+xL1Jp2eaKA9Swp89Alntc5a8=;
        b=vLNIZg6muyXcThHihK82AITKWF8h6DYzWEJ/TJcWJaLGTK5wovau+Nntu4YYtYw/RI
         xyGBtqVs3DkGan4KP+TjXW3pRfEir/eM9KHzFJUvMYYpg1sz2mJK15+72IKtK1hDD+Yg
         FExkFXE7nhAOhp8gqDoouaftotFu+SE9F4IGfPb/0M499B7E0uY9UsCT1zGy2W/NfDEt
         /fgDa98kab9TVVoFd0n5sENWtcYdw83PT1F14fsE7KJGIKzh66+H72/jmnzwKOEL3Aug
         AOlRMOC1kz5bzz1jhvCnHcPT/9tEJxyMYWSamyImmBGgasixNcNlW1e0ozlGxvU2SeRB
         fghA==
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Patrick Oppenlander <patrick.oppenlander-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

From: Patrick Oppenlander <patrick.oppenlander-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Signed-off-by: Patrick Oppenlander <patrick.oppenlander-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 libfdt/fdt_sw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libfdt/fdt_sw.c b/libfdt/fdt_sw.c
index 26759d5..94ce4bb 100644
--- a/libfdt/fdt_sw.c
+++ b/libfdt/fdt_sw.c
@@ -32,7 +32,7 @@ static int fdt_sw_probe_(void *fdt)
 /* 'memrsv' state:	Initial state after fdt_create()
  *
  * Allowed functions:
- *	fdt_add_reservmap_entry()
+ *	fdt_add_reservemap_entry()
  *	fdt_finish_reservemap()		[moves to 'struct' state]
  */
 static int fdt_sw_probe_memrsv_(void *fdt)
-- 
2.27.0

