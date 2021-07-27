From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v3 4/5] dtc: Drop dts source restriction for yaml output
Date: Tue, 27 Jul 2021 12:30:22 -0600
Message-ID: <20210727183023.3212077-5-robh@kernel.org>
References: <20210727183023.3212077-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20210727183023.3212077-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

YAML output was restricted to dts input as there are some dependencies
on source annotations which get lost with other input formats. With the
addition of markers by the checks, YAML output from dtb format becomes
more useful.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
v3:
 - no change
---
 dtc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/dtc.c b/dtc.c
index bc786c543b7e..acfeac1da234 100644
--- a/dtc.c
+++ b/dtc.c
@@ -353,8 +353,6 @@ int main(int argc, char *argv[])
 		dt_to_source(outf, dti);
 #ifndef NO_YAML
 	} else if (streq(outform, "yaml")) {
-		if (!streq(inform, "dts"))
-			die("YAML output format requires dts input format\n");
 		dt_to_yaml(outf, dti);
 #endif
 	} else if (streq(outform, "dtb")) {
-- 
2.27.0

