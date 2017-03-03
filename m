From: Paolo Bonzini <pbonzini-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] fix libfdt_env.h for RHEL7
Date: Fri,  3 Mar 2017 17:29:57 +0100
Message-ID: <1488558597-21364-1-git-send-email-pbonzini@redhat.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=uxrqv4S22d5m5OPDSaA/02GnNUEZVILxQM+9YedExsw=;
        b=mO5sGgiMOX1e6z7eEbM9mxF66rkCy8chiGrwro0zLy0kYlJ8triqLDLwheUK4xJM/E
         F1p2ui2YI03fFQu9IgYXXGf0ZlDsF8eTNNt17LdbswECDMLCWynaWB8hudX14dAgKFFb
         rNqfAIZXRw4VZQqMI5YSS2fc0Ixs2QjoJQioTqW4m3ao/lvY2cZGN/59ltX3UxfuSMSK
         gIa/kwaLeYi/CAXSiA6GgybyY86cFzZNnJGo2X4bADEF9ybbUaQmLx3qSqpIhGjYW2DP
         l1gb9RksaLESxoF3W/6Dqv8KcJHLaBHaFcpskzQG4W75mnytR1pbhvZ73eKO88uoq980
         fuiQ==
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: dgibson-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org

RHEL7 defines __bitwise to "__bitwise__" in /usr/include/linux/types.h.
Because QEMU uses -Werror, the redefinition of the macro in libfdt_env.h
is is causing QEMU's build to fail when it includes libfdt.h.

This is the minimal fix, but a better one in the long term is probably
to define libfdt-specific macros LIBFDT_FORCE and LIBFDT_BITWISE.

Signed-off-by: Paolo Bonzini <pbonzini-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
	David, it would be nice to have this in QEMU 2.9 but I
	am not sure of the mechanics of that.

 libfdt/libfdt_env.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/libfdt/libfdt_env.h b/libfdt/libfdt_env.h
index 9dea97d..2cf0826 100644
--- a/libfdt/libfdt_env.h
+++ b/libfdt/libfdt_env.h
@@ -60,6 +60,8 @@
 #define __force __attribute__((force))
 #define __bitwise __attribute__((bitwise))
 #else
+#undef __force
+#undef __bitwise
 #define __force
 #define __bitwise
 #endif
-- 
1.8.3.1
