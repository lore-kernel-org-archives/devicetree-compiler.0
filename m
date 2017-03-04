From: Nicolas Iooss <nicolas.iooss_linux-oWGTIYur0i8@public.gmane.org>
Subject: [PATCH 4/5] fdtget: Use @return to document the return value
Date: Sat,  4 Mar 2017 14:26:46 +0100
Message-ID: <20170304132647.23286-4-nicolas.iooss_linux@m4x.org>
References: <20170304132647.23286-1-nicolas.iooss_linux@m4x.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170304132647.23286-1-nicolas.iooss_linux-oWGTIYur0i8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Nicolas Iooss <nicolas.iooss_linux-oWGTIYur0i8@public.gmane.org>

Signed-off-by: Nicolas Iooss <nicolas.iooss_linux-oWGTIYur0i8@public.gmane.org>
---
 fdtget.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fdtget.c b/fdtget.c
index fb9d0e1730d7..2982a3e7d960 100644
--- a/fdtget.c
+++ b/fdtget.c
@@ -245,7 +245,7 @@ static int show_data_for_item(const void *blob, struct display_info *disp,
  * @param filename	Filename of blob file
  * @param arg		List of arguments to process
  * @param arg_count	Number of arguments
- * @param return 0 if ok, -ve on error
+ * @return 0 if ok, -ve on error
  */
 static int do_fdtget(struct display_info *disp, const char *filename,
 		     char **arg, int arg_count, int args_per_step)
-- 
2.11.1
