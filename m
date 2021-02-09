From: Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] checks: Change node-name check to match devicetree spec
Date: Tue,  9 Feb 2021 11:24:51 -0600
Message-ID: <20210209172451.56967-1-kumar.gala@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3GC2vr2tXLWQWtMYA6jFO1tKuQP/bphcNPyUDerG9RI=;
        b=dALVn3fb16ztgsyL31FoXFuvkrD9Em13YOrLFlTDpgLIA5sBlcoPKJ3w8hLWfbbiIu
         72Zn6hahjFu9+OOKWMh54a4WzMm2Wd+rB6LXzoNoaw4Y8olCOpytdWNU7dNZjunl0pSk
         UCFvm0RRRtfM7eexs9UcjoSV1FlXrInyaw9hckipvU7UHhy8kQS30zGLKwy6ZT8QBTwy
         qeK87lgzQztA3MCWOSdl+p7qR/TutWmGbQCIQZpd3WApmOiISIMVFztH1vQiG/kh5WCQ
         Jdk1SJBLzISskdbc5DHw8obNrxe9WaTak7s1aatqk03xZLmbYWpO2IOkLb4cwyqvX/Pw
         WV0w==
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

The devicetree spec limits the valid character set to:
  A-Z
  a-z
  0-9
  ,._+-

while property can additionally have '?#'.  Change the check to match
the spec.

Signed-off-by: Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 checks.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/checks.c b/checks.c
index 17cb689..24e6816 100644
--- a/checks.c
+++ b/checks.c
@@ -297,7 +297,8 @@ ERROR(duplicate_property_names, check_duplicate_property_names, NULL);
 #define LOWERCASE	"abcdefghijklmnopqrstuvwxyz"
 #define UPPERCASE	"ABCDEFGHIJKLMNOPQRSTUVWXYZ"
 #define DIGITS		"0123456789"
-#define PROPNODECHARS	LOWERCASE UPPERCASE DIGITS ",._+*#?-"
+#define NODECHARS	LOWERCASE UPPERCASE DIGITS ",._+-"
+#define PROPCHARS	LOWERCASE UPPERCASE DIGITS ",._+*#?-"
 #define PROPNODECHARSSTRICT	LOWERCASE UPPERCASE DIGITS ",-"
 
 static void check_node_name_chars(struct check *c, struct dt_info *dti,
@@ -309,7 +310,7 @@ static void check_node_name_chars(struct check *c, struct dt_info *dti,
 		FAIL(c, dti, node, "Bad character '%c' in node name",
 		     node->name[n]);
 }
-ERROR(node_name_chars, check_node_name_chars, PROPNODECHARS "@");
+ERROR(node_name_chars, check_node_name_chars, NODECHARS "@");
 
 static void check_node_name_chars_strict(struct check *c, struct dt_info *dti,
 					 struct node *node)
@@ -370,7 +371,7 @@ static void check_property_name_chars(struct check *c, struct dt_info *dti,
 				  prop->name[n]);
 	}
 }
-ERROR(property_name_chars, check_property_name_chars, PROPNODECHARS);
+ERROR(property_name_chars, check_property_name_chars, PROPCHARS);
 
 static void check_property_name_chars_strict(struct check *c,
 					     struct dt_info *dti,
-- 
2.29.2

