From: marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Subject: [PATCH 2/2] setup.py: fix out of tree build
Date: Mon,  3 Jan 2022 11:38:55 +0400
Message-ID: <20220103073855.1468799-3-marcandre.lureau@redhat.com>
References: <20220103073855.1468799-1-marcandre.lureau@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1641195560;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dgWvBLmJ9XPB+MavDI+FD4wnOKrignm44D2N7jZpw+A=;
        b=UIhuQKlf4dJoe2KFgYZaclmpM9n8zXtLfMEkDzirdIBPHe8q/1pWkg7+9O7Fw3ILaiv7wk
        xHyFGQpFAYo7BgzwPhnQ98VOou9Szde6ZgOy3GUaSKCjQxVr0HO9s3/DzyhHFRON3L2fM2
        eN/agWj8vWrzFRXgUe6AQF8yT0dSVs0=
In-Reply-To: <20220103073855.1468799-1-marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

From: Marc-André Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Fixes: commit 1cc41b1c9 ("pylibfdt: Add packaging metadata")

Signed-off-by: Marc-André Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 setup.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/setup.py b/setup.py
index 00444e64337b..029aa6182221 100755
--- a/setup.py
+++ b/setup.py
@@ -17,7 +17,7 @@ import sys
 
 srcdir = os.path.dirname(__file__)
 
-with open("README", "r") as fh:
+with open(os.path.join(srcdir, "README"), "r") as fh:
     long_description = fh.read()
 
 def get_top_builddir():
-- 
2.34.1.8.g35151cf07204

