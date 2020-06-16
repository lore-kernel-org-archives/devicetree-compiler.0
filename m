From: patrick.oppenlander-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [PATCH] libfdt: add extern "C" for C++
Date: Tue, 16 Jun 2020 11:12:17 +1000
Message-ID: <20200616011217.15253-1-patrick.oppenlander@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mWFFiDI0cQ4CPHvDUhhT1l6kgsMUi0bEkcz9R+V+47Q=;
        b=RjO6jnylQKiN1uCTBOkHhAJmnMBm2o+02BAVmV2JxMVzSGoXneMGKCyDA1W7kHMI0Z
         VwsG6LaGzzVZMfUIC/kJEgh0dEoCIUsk3Ov+P+A32DB3f2ccTmRpQZTxxzzXbGuFes6K
         OhUfgtVeodaJ+hJJlyFxKVq9ByVUh2QrbkMtxtiFMcR6AB8ZePhIJNeiQowj62mFKYC/
         z9AWBCih1gm8Vp7vN/PFbcixvYKHRNqebE5wuFo+/ECWpLEoepuhODrvD5hSLz3qewt+
         s9bKFKcvzCbjE3Xqyh1uVd9lCVeAuOTK39lVa4LsPt/JLO2TMOTA0muEkcNToaYeiEqu
         xVfg==
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Patrick Oppenlander <patrick.oppenlander-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

From: Patrick Oppenlander <patrick.oppenlander-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Signed-off-by: Patrick Oppenlander <patrick.oppenlander-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 libfdt/libfdt.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index 48f375c..544d3ef 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -9,6 +9,10 @@
 #include <libfdt_env.h>
 #include <fdt.h>
 
+#ifdef __cplusplus
+extern "C" {
+#endif
+
 #define FDT_FIRST_SUPPORTED_VERSION	0x02
 #define FDT_LAST_SUPPORTED_VERSION	0x11
 
@@ -2069,4 +2073,8 @@ int fdt_overlay_apply(void *fdt, void *fdto);
 
 const char *fdt_strerror(int errval);
 
+#ifdef __cplusplus
+}
+#endif
+
 #endif /* LIBFDT_H */
-- 
2.27.0

