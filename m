From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [PATCH] libfdt.h: Define FDT_PATH_MAX
Date: Wed, 14 Jun 2017 17:51:48 +0300
Message-ID: <1497451908-15367-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=Mzm+ld4mtszGaTIeHHiwxxf1SX27jylBwDnVT2HCNEg=;
        b=HjxnH58CMRePuM47h2dARWefHncA6woKeHli8wOFRONd1nmdwd8ynhBt0TniQN7g+Z
         BkBv1Ee8Dw6bJ5uu+D6KTPenoYyJ8Idaq7U6gSQOuDWS89Gqv7X4DCwgHw7AyiP3EgqP
         MljdVkyWQ8/mvIxdtFy5QyYTYQIzjzusmGHjM=
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>

Declare the maximum path size of an FDT node.
It is useful for manipulation methods that need to know a maximum value.

Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
---
 libfdt/libfdt.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index a248b1b..a5c93f6 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -139,6 +139,9 @@
 
 #define FDT_ERR_MAX		17
 
+/* Maximum path size of a node (similar to PATH_MAX in *nix) */
+#define FDT_PATH_MAX	4096
+
 /**********************************************************************/
 /* Low-level functions (you probably don't need these)                */
 /**********************************************************************/
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
