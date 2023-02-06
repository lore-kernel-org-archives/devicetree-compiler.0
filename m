From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH] fdtoverlay: Remove bogus type info from help text
Date: Mon,  6 Feb 2023 17:16:59 +0100
Message-ID: <20230206161659.3524743-1-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>

"fdtoverlay -h" shows a.o.:

    <type>	s=string, i=int, u=unsigned, x=hex
	    Optional modifier prefix:
		    hh or b=byte, h=2 byte, l=4 byte (default)

However, unlike fdtget and fdtput, fdtoverlay does not support the
"-t"/"--type" option.

Fixes: 42409146f2db22d7 ("fdtoverlay: A tool that applies overlays")
Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
---
Applies to linux/scripts/dtc/, too.

 fdtoverlay.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/fdtoverlay.c b/fdtoverlay.c
index 5350af65679f7fbd..cac6b6576c289c18 100644
--- a/fdtoverlay.c
+++ b/fdtoverlay.c
@@ -23,9 +23,7 @@
 /* Usage related data. */
 static const char usage_synopsis[] =
 	"apply a number of overlays to a base blob\n"
-	"	fdtoverlay <options> [<overlay.dtbo> [<overlay.dtbo>]]\n"
-	"\n"
-	USAGE_TYPE_MSG;
+	"	fdtoverlay <options> [<overlay.dtbo> [<overlay.dtbo>]]";
 static const char usage_short_opts[] = "i:o:v" USAGE_COMMON_SHORT_OPTS;
 static struct option const usage_long_opts[] = {
 	{"input",            required_argument, NULL, 'i'},
-- 
2.34.1

