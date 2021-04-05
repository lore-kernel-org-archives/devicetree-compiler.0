From: Ilya Lipnitskiy <ilya.lipnitskiy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2] checks: tigthen up nr-gpios prop exception
Date: Sun,  4 Apr 2021 22:26:17 -0700
Message-ID: <20210405052617.2471954-1-ilya.lipnitskiy@gmail.com>
References: <20210404235042.630817-1-ilya.lipnitskiy@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5nSxesaAzeYAMyTqPCXv7z9VUiWJegZGl6mLj8q0CLY=;
        b=hgsMj79xQCkm0FbNy7geYZfGO7i+p9QQM61N2gDqmbY8iMyhFn7PlG1DkhJS20En1B
         yUci3+PDcpZNiaItcnA1z1aCoOpPje+868wPUcsddmkHDIU8ywOEcFZ5zrrYbbfipQxu
         QNi9wu5gbwHNnV2FdQus9g3j6XNDCLVCKa683R4qS8ZbTKyN2pAJkHhZS7CxUxQjWAne
         LBy219ceQ+GkDnFewwg5jcm7TQF//lU6Qkq73+IpTY4vsYyTNfhWF9fRofrSPHN1ryug
         GAqAIDjkYsEoHVO76uSnHskfeetcwd8YFUtIyCZsGGj2P63p0RofvK7PM1ZBdlkE3ypK
         9CWA==
In-Reply-To: <20210404235042.630817-1-ilya.lipnitskiy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <loeliger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Ilya Lipnitskiy <ilya.lipnitskiy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

There are no instances of nr-gpio in the Linux kernel tree, only
"[<vendor>,]nr-gpios", so make the check stricter to not allow nr-gpio.

Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 checks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/checks.c b/checks.c
index c4207720ce8c..2800b5786b03 100644
--- a/checks.c
+++ b/checks.c
@@ -1494,7 +1494,7 @@ static bool prop_is_gpio(struct property *prop)
 	 * *-gpios and *-gpio can appear in property names,
 	 * so skip over any false matches (only one known ATM)
 	 */
-	if (strstr(prop->name, "nr-gpio"))
+	if (strstr(prop->name, "nr-gpios"))
 		return false;
 
 	str = strrchr(prop->name, '-');
-- 
2.31.1

