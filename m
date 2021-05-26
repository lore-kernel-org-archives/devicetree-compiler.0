From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 5/5] dtc: Drop dts source restriction for yaml output
Date: Tue, 25 May 2021 20:03:35 -0500
Message-ID: <20210526010335.860787-6-robh@kernel.org>
References: <20210526010335.860787-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20210526010335.860787-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

YAML output was restricted to dts input as there are some dependencies
on source annotations which get lost with other input formats. With the
addition of markers by the checks, YAML output from dtb format becomes
more useful.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 dtc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/dtc.c b/dtc.c
index 3962d3f4b178..e3decb2f4229 100644
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

