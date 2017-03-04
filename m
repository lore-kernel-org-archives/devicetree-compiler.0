From: Nicolas Iooss <nicolas.iooss_linux-oWGTIYur0i8@public.gmane.org>
Subject: [PATCH 5/5] fdtput: Remove star from value_len documentation
Date: Sat,  4 Mar 2017 14:26:47 +0100
Message-ID: <20170304132647.23286-5-nicolas.iooss_linux@m4x.org>
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

When clang checks the documentation tags (with -Wdocumentation flag), it
reports the following warning:

    fdtput.c:70:11: error: parameter '*value_len' not found in the
    function declaration [-Werror,-Wdocumentation]
     * @param *value_len    Returns length of value encoded
              ^~~~~~~~~~
    fdtput.c:70:11: note: did you mean 'value_len'?
     * @param *value_len    Returns length of value encoded
              ^~~~~~~~~~
              value_len

As this sounds reasonable, remove the star from the documentation tag.

Signed-off-by: Nicolas Iooss <nicolas.iooss_linux-oWGTIYur0i8@public.gmane.org>
---
 fdtput.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fdtput.c b/fdtput.c
index db65e9613f29..971199813962 100644
--- a/fdtput.c
+++ b/fdtput.c
@@ -67,7 +67,7 @@ static void report_error(const char *name, int namelen, int err)
  * @param arg		List of arguments from command line
  * @param arg_count	Number of arguments (may be 0)
  * @param valuep	Returns buffer containing value
- * @param *value_len	Returns length of value encoded
+ * @param value_len	Returns length of value encoded
  */
 static int encode_value(struct display_info *disp, char **arg, int arg_count,
 			char **valuep, int *value_len)
-- 
2.11.1
