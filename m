From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH] dtc: Consider one-character strings as strings
Date: Tue, 23 Jun 2020 11:43:43 +0200
Message-ID: <20200623094343.26010-1-geert+renesas@glider.be>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>

When using overlays, a target-path property pointing to the root node is
quite common.  However, "dtc -O dts" prints it as a byte array:

    target-path = [2f 00];

instead of a string:

    target-path = "/";

For guess_value_type() to consider a value to be a string, it must
contain less nul bytes than non-nul bytes, thus ruling out strings
containing only a single character.  Allow printing such strings by
relaxing the condition slightly.

Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
---
Alternatively, guess_value_type() could check explicitly for "/",
reducing the number of false positives.

However, there seem to be plenty of other uses of one-character strings
in DTS files.  The most common one is 'type = "a"' for HDMI connectors.
---
 treesource.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/treesource.c b/treesource.c
index 2acb920d77752410..061ba8c9c5e83265 100644
--- a/treesource.c
+++ b/treesource.c
@@ -183,7 +183,7 @@ static enum markertype guess_value_type(struct property *prop)
 			nnotcelllbl++;
 	}
 
-	if ((p[len-1] == '\0') && (nnotstring == 0) && (nnul < (len-nnul))
+	if ((p[len-1] == '\0') && (nnotstring == 0) && (nnul <= (len-nnul))
 	    && (nnotstringlbl == 0)) {
 		return TYPE_STRING;
 	} else if (((len % sizeof(cell_t)) == 0) && (nnotcelllbl == 0)) {
-- 
2.17.1

