From: Nicolas Iooss <nicolas.iooss_linux-oWGTIYur0i8@public.gmane.org>
Subject: [PATCH 1/5] dtc: Simplify asm_emit_string() implementation
Date: Sat,  4 Mar 2017 14:26:43 +0100
Message-ID: <20170304132647.23286-1-nicolas.iooss_linux@m4x.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Nicolas Iooss <nicolas.iooss_linux-oWGTIYur0i8@public.gmane.org>

Using %.*s format helps making asm_emit_string() not modify its "str"
parameter.

While at it, constify the "str" parameter of bin_emit_string() and
asm_emit_string(), as these function no longer modify it.

Signed-off-by: Nicolas Iooss <nicolas.iooss_linux-oWGTIYur0i8@public.gmane.org>
---
 flattree.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/flattree.c b/flattree.c
index ebac548b3fa8..d8a118258e01 100644
--- a/flattree.c
+++ b/flattree.c
@@ -49,7 +49,7 @@ static struct version_info {
 
 struct emitter {
 	void (*cell)(void *, cell_t);
-	void (*string)(void *, char *, int);
+	void (*string)(void *, const char *, int);
 	void (*align)(void *, int);
 	void (*data)(void *, struct data);
 	void (*beginnode)(void *, struct label *labels);
@@ -64,7 +64,7 @@ static void bin_emit_cell(void *e, cell_t val)
 	*dtbuf = data_append_cell(*dtbuf, val);
 }
 
-static void bin_emit_string(void *e, char *str, int len)
+static void bin_emit_string(void *e, const char *str, int len)
 {
 	struct data *dtbuf = e;
 
@@ -144,22 +144,14 @@ static void asm_emit_cell(void *e, cell_t val)
 		(val >> 8) & 0xff, val & 0xff);
 }
 
-static void asm_emit_string(void *e, char *str, int len)
+static void asm_emit_string(void *e, const char *str, int len)
 {
 	FILE *f = e;
-	char c = 0;
 
-	if (len != 0) {
-		/* XXX: ewww */
-		c = str[len];
-		str[len] = '\0';
-	}
-
-	fprintf(f, "\t.string\t\"%s\"\n", str);
-
-	if (len != 0) {
-		str[len] = c;
-	}
+	if (len != 0)
+		fprintf(f, "\t.string\t\"%.*s\"\n", len, str);
+	else
+		fprintf(f, "\t.string\t\"%s\"\n", str);
 }
 
 static void asm_emit_align(void *e, int a)
-- 
2.11.1
