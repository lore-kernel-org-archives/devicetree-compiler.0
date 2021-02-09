From: Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2] checks: Change node-name check to match devicetree spec
Date: Tue,  9 Feb 2021 12:46:41 -0600
Message-ID: <20210209184641.63052-1-kumar.gala@linaro.org>
References: <20210209172451.56967-1-kumar.gala@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JIeVFtvrlX3BUmYgREurptcMCJtSxxtOYmv5MsWmo4o=;
        b=ZaWTs31oxSsFCoP2fB2awlDTdKUKsliueOvYfDvvliG5/L8Qyau5Y8+MVlO0IaHo1M
         CdM/o/Xaa+y6XXS1ZC0Yc/nIDqNGvMc1qC2cPa7Hy9XuDbCTPpNbi5teYUO1z/PIoBTf
         wtgXVJTQ7VTrOC6zGwEZuyC8tsrU73tb6W7HmrK3K15sgDtpdbOMTDloQcy80huDzREv
         E3ejP3FeguhFqwkv86BrL7fyrLLNH2SDcxyJ+cASEUkU3bmDycxPjiFH0VVfdjlJDho8
         1XlsthglwerpkiSKowXKQuMOEIPzC9UsiSi/qNHimpkFO70GASljoVugxJ5r3PbmY2wv
         PfaA==
In-Reply-To: <20210209172451.56967-1-kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-5wv7dgnIgG8@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
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
index 17cb689..48e7fe9 100644
--- a/checks.c
+++ b/checks.c
@@ -297,7 +297,8 @@ ERROR(duplicate_property_names, check_duplicate_property_names, NULL);
 #define LOWERCASE	"abcdefghijklmnopqrstuvwxyz"
 #define UPPERCASE	"ABCDEFGHIJKLMNOPQRSTUVWXYZ"
 #define DIGITS		"0123456789"
-#define PROPNODECHARS	LOWERCASE UPPERCASE DIGITS ",._+*#?-"
+#define NODECHARS	LOWERCASE UPPERCASE DIGITS ",._+-@"
+#define PROPCHARS	LOWERCASE UPPERCASE DIGITS ",._+*#?-"
 #define PROPNODECHARSSTRICT	LOWERCASE UPPERCASE DIGITS ",-"
 
 static void check_node_name_chars(struct check *c, struct dt_info *dti,
@@ -309,7 +310,7 @@ static void check_node_name_chars(struct check *c, struct dt_info *dti,
 		FAIL(c, dti, node, "Bad character '%c' in node name",
 		     node->name[n]);
 }
-ERROR(node_name_chars, check_node_name_chars, PROPNODECHARS "@");
+ERROR(node_name_chars, check_node_name_chars, NODECHARS);
 
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

